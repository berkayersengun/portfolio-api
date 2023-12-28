import dataclasses
import decimal
import json
from decimal import Decimal

from accounts.choices import HoldingType, Currency
from accounts.models import Account
from holdings.dataclasses import HoldingData, Overview, Sum, Price, Change, ChangeOverview, Portfolio
from holdings.models import Holding, Capital, PortfolioSnapshot, OverviewSnapshot
from services import yahoo
from services.common_utils import get_id_from_db


def create_holding_data(holding_query, quote_dict, user_currency):
    if holding_query.symbol not in quote_dict:
        quote_dict[holding_query.symbol] = yahoo.options(holding_query.symbol)
        current_currency = quote_dict[holding_query.symbol]['currency']
        quote_dict[holding_query.symbol]['conversion_rate'] = currency_conversion(current_currency, user_currency)
    symbol = quote_dict[holding_query.symbol]['symbol']
    current_price = Decimal(quote_dict[symbol]['regularMarketPrice'])
    change_24h = Decimal(quote_dict[symbol]['regularMarketChange'])
    purchase_price = holding_query.purchase_price
    conversion_rate = quote_dict[holding_query.symbol]['conversion_rate']
    current_price = current_price * conversion_rate
    change_24h = change_24h * conversion_rate
    purchase_price = purchase_price * conversion_rate
    price = Price(purchase=purchase_price, current=current_price)
    value = Price(purchase=price.purchase * holding_query.quantity, current=price.current * holding_query.quantity)
    change = Change(value=change_24h * holding_query.quantity,
                    percentage=quote_dict[symbol]['regularMarketChangePercent'])
    return HoldingData(id=holding_query.id,
                       symbol=symbol,
                       name=quote_dict[symbol]['shortName'],
                       exchange=quote_dict[symbol]['fullExchangeName'],
                       quantity=holding_query.quantity,
                       price=price,
                       gain=price.gain(holding_query.quantity),
                       change_24H=change,
                       value=value,
                       date=holding_query.date.strftime("%d-%b-%y, %H:%M"),
                       type=holding_query.type,
                       currency=user_currency)


def get_conversion_rate_dict(user_currency):
    conversion_rate_dict = {}
    for currency in Currency.labels:
        if user_currency != currency:
            conversion_rate = currency_conversion(currency, user_currency)
            conversion_rate_dict[currency] = conversion_rate
    return conversion_rate_dict


def currency_conversion(current_currency, target_currency):
    if current_currency == target_currency:
        return Decimal(1)
    currency_symbol = '{}{}=X'.format(current_currency, target_currency)
    if currency_symbol == 'TRYCAD=X':
        currency_symbol = 'CADTRY=X'
        return 1 / Decimal(yahoo.options(currency_symbol)['regularMarketPrice'])
    return Decimal(yahoo.options(currency_symbol)['regularMarketPrice'])


def get_holding_data(user, currency):
    holdings_data_dict = {}
    holding_query_set = Holding.objects.filter(user=get_id_from_db(Account, username=user.username))
    quote_dict = {}
    for holding_query in holding_query_set:
        holding_data = create_holding_data(holding_query, quote_dict, currency)
        symbol = holding_query.symbol
        if symbol in holdings_data_dict:
            holdings_data_dict[symbol]['entities'].append(holding_data)
        else:
            holdings_data_dict[holding_query.symbol] = {'symbol': symbol, 'type': holding_query.type,
                                                        'name': quote_dict[symbol]['shortName'],
                                                        'exchange': quote_dict[symbol]['fullExchangeName'],
                                                        'entities': [holding_data]}
    set_average_data(holdings_data_dict, currency)
    return list(holdings_data_dict.values())


def get_average(data, level1, level2):
    total_values = sum([entity[level1][level2] * entity['quantity'] for entity in data])
    total_quantity = sum([entity['quantity'] for entity in data])
    return total_values / total_quantity


def set_average_data(holdings_data_dict, user_currency):
    for symbol, holdings_data in holdings_data_dict.items():
        if len(holdings_data['entities']) == 1:
            holdings_data['average'] = holdings_data['entities'][0]
            continue
        purchase_price = get_average(holdings_data['entities'], level1='price', level2='purchase')
        current_price = holdings_data['entities'][0]['price']['current']
        price = Price(purchase=purchase_price, current=current_price)
        purchase_value = get_average(holdings_data['entities'], level1='value', level2='purchase')
        current_value = sum(entity['value']['current'] for entity in holdings_data['entities'])
        value = Price(purchase=purchase_value, current=current_value)
        quantity = sum([entity.quantity for entity in holdings_data['entities']])
        change_24H_value = sum([entity.change_24H.value for entity in holdings_data['entities']])
        change_24H = Change(value=change_24H_value, percentage=holdings_data['entities'][0].change_24H.percentage)

        holdings_data['average'] = HoldingData(id=0,
                                               symbol=symbol,
                                               name=holdings_data['entities'][0].name,
                                               exchange=holdings_data['entities'][0].exchange,
                                               quantity=quantity,
                                               price=price,
                                               gain=price.gain(quantity),
                                               change_24H=change_24H,
                                               value=value,
                                               date=holdings_data['entities'][0].date,
                                               type=holdings_data['entities'][0].type,
                                               currency=user_currency)


def get_current_totals(holdings_data):
    crypto_total = sum([holding_data.amount for holding_data in holdings_data.crypto])
    stock_total = sum([holding_data.amount for holding_data in holdings_data.stock])
    return Sum(crypto=crypto_total, stock=stock_total, total=crypto_total + stock_total)


def get_totals(holdings_data, price_type):
    total_stock = Decimal(0)
    total_crypto = Decimal(0)
    for holding in holdings_data:
        total_crypto = total_crypto + sum(
            [entity['value'][price_type] for entity in holding['entities'] if entity['type'] == HoldingType.CRYPTO])
        total_stock = total_stock + sum(
            [entity['value'][price_type] for entity in holding['entities'] if entity['type'] == HoldingType.STOCK])
    return Sum(crypto=Decimal(round(total_crypto)), stock=Decimal(round(total_stock)),
               total=Decimal(round(total_crypto + total_stock)))


def get_change_daily(holdings_data):
    crypto_value = [holding['average'].change_24H.value for holding in holdings_data if
                    holding['type'] == HoldingType.CRYPTO]
    stock_value = [holding['average'].change_24H.value for holding in holdings_data if
                   holding['type'] == HoldingType.STOCK]
    total_value = [holding['average'].change_24H.value for holding in holdings_data]

    crypto = Change(value=Decimal(sum(crypto_value)), percentage=holdings_data[0]['average'].change_24H.percentage)
    stock = Change(value=Decimal(sum(stock_value)), percentage=holdings_data[0]['average'].change_24H.percentage)
    total = Change(value=Decimal(sum(total_value)), percentage=holdings_data[0]['average'].change_24H.percentage)
    return ChangeOverview(crypto=crypto, stock=stock, total=total)


def get_overview_data(holdings_data, username, currency):
    capital = Capital.objects.filter(user=Account.objects.get(username=username).id).first()
    # continue to work on the overview view, remove capital calculations and use purchase_price instead. but show capital in the overview
    overview = Overview()
    overview.currency = currency
    if capital is None:
        overview.capital = Sum()
    else:
        conversion_rate = currency_conversion(capital.currency, currency)
        overview_capital = Sum(crypto=capital.crypto, stock=capital.stock, total=capital.stock + capital.crypto)
        overview.capital = overview_capital.currency_conversion(conversion_rate=conversion_rate)
    overview.purchase = get_totals(holdings_data, 'purchase')
    overview.current = get_totals(holdings_data, 'current')
    overview.change_purchase = overview.get_change('purchase')  # change based on the purchase price on current value
    overview.change_capital = overview.get_change('capital')  # change based on the capital price on current value
    overview.change_daily = overview.get_change_daily(holdings_data)  # change based on the capital price on current value
    return overview


def get_portfolio(user, currency):
    holdings_data = get_holding_data(user, currency)
    # TODO move all sorting to the api from UI
    # holdings_data.sort(key=lambda holding: holding['average'].value.current, reverse=True)
    overview = get_overview_data(holdings_data, user.username, currency)
    return Portfolio(holdings_data=holdings_data, overview=overview, username=user.username, currency=currency)


def is_friday(date):
    # date = datetime.strptime(date_string, DATE_FORMAT)
    if date.weekday() == 4:
        return True, date
    return False, date


class EnhancedJSONEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, decimal.Decimal):
            return str(o)
        if dataclasses.is_dataclass(o):
            return dataclasses.asdict(o)
        if isinstance(o, str):
            return o
        return super().default(o)


# class EdgeDecoder(json.JSONDecoder):
#     def __init__(self, *args, **kwargs):
#         json.JSONDecoder.__init__(self, object_hook=self.object_hook, *args, **kwargs)
#
#     def object_hook(self, dct):
#         if 'Change' in dct:
#             actor = Actor(dct['Actor']['Name'], dct['Actor']['Age'], '')
#             movie = Movie(dct['Movie']['Title'], dct['Movie']['Gross'], '', dct['Movie']['Year'])
#             return Edge(actor, movie)
#         return dct

def create_snapshots():
    ports = list(filter(lambda a: a['user'] == 'sevim' or a['user'] == 'berkay',
                        json.load(open('resources/db_backup/snapshots.json'))))
    for p in ports:
        user = Account.objects.get(username=p['user'])
        PortfolioSnapshot.objects.create(user=user, snapshot_hook=p['snapshot_hook'], portfolio=p['portfolio'],
                                         date=p['date'])


def migrate_portfolio_snapshots():
    for snapshot in PortfolioSnapshot.objects.all():
        OverviewSnapshot.objects.create(user=snapshot.user, snapshot_hook=snapshot.snapshot_hook,
                                        overview=snapshot.portfolio['overview'],
                                        date=snapshot.date)
