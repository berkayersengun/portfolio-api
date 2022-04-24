from rest_framework.exceptions import NotFound

from accounts.models import Account
from accounts.serializers import CapitalSerializerForAccount
from holdings.dataclasses import HoldingData, Overview, Sum, Price, Change, ChangeOverview
from accounts.choices import HoldingType, Currency
from decimal import Decimal

from holdings.models import Holding, Capital
from services import yahoo
from services.common_utils import get_id_from_db


def filterByUser(self):
    queryset = Holding.objects.all()
    username = self.request.query_params.get('user')
    if username is not None:
        try:
            account = Account.objects.get(username=username)
        except Account.DoesNotExist:
            availableNames = []
            for account in Account.objects.all():
                availableNames.append(account.username)
            if not availableNames:
                availableNames = ""
            raise NotFound('User \'{0}\' not exists: {1}'.format(username, availableNames))
        return queryset.filter(user=account.id)
    return queryset


def set_holdings_data(holdings_data, holding, quote, eur_usd, user):
    # quantityEach = holding.quantity if holding.action == 'BUY' else -holding.quantity

    current_price = Decimal(quote['regularMarketPrice'])
    change_24h = Decimal(quote['regularMarketChange'])

    if quote['currency'] != user.currency:
        current_price = current_price / eur_usd
        change_24h = change_24h / eur_usd

    # purchase_price = holding.purchase_price if holding.currency == Holding.Currency.EUR.value else holding.purchase_price / eur_usd
    if holding.currency != user.currency:
        holding.purchase_price = holding.purchase_price / eur_usd

    price = Price(purchase=holding.purchase_price, current=current_price)
    value = Price(purchase=price.purchase * holding.quantity, current=price.current * holding.quantity)
    change = Change(value=change_24h, percentage=quote['regularMarketChangePercent'])
    holdings_data.append(HoldingData(symbol=quote['symbol'],
                                     name=quote['shortName'],
                                     exchange=quote['fullExchangeName'],
                                     quantity=holding.quantity,
                                     price=price,
                                     gain=price.gain(holding.quantity),
                                     change_24H=change,
                                     value=value,
                                     date=holding.date.strftime("%d-%b-%y, %H:%M"),
                                     type=holding.type,
                                     currency=Currency.EUR
                                     ))


def create_holding_data(holding_query, quote_dict, eur_usd, currency):
    if holding_query.symbol not in quote_dict:
        quote = yahoo.quote(holding_query.symbol)[0]
        quote_dict[holding_query.symbol] = quote
    # set_holdings_data(holdings_data_list, holding, quote_list[holding.symbol], eur_usd, user)
    symbol = quote_dict[holding_query.symbol]['symbol']
    # symbol = symbol.replace('.', '-')
    current_price = Decimal(quote_dict[symbol]['regularMarketPrice'])
    change_24h = Decimal(quote_dict[symbol]['regularMarketChange'])
    purchase_price = holding_query.purchase_price
    if quote_dict[symbol]['currency'] != currency:
        current_price = current_price / eur_usd
        change_24h = change_24h / eur_usd
    if holding_query.currency != currency:
        purchase_price = purchase_price / eur_usd
    price = Price(purchase=purchase_price, current=current_price)
    value = Price(purchase=price.purchase * holding_query.quantity, current=price.current * holding_query.quantity)
    change = Change(value=change_24h * holding_query.quantity,
                    percentage=quote_dict[symbol]['regularMarketChangePercent'])
    return HoldingData(symbol=symbol,
                       name=quote_dict[symbol]['shortName'],
                       exchange=quote_dict[symbol]['fullExchangeName'],
                       quantity=holding_query.quantity,
                       price=price,
                       gain=price.gain(holding_query.quantity),
                       change_24H=change,
                       value=value,
                       date=holding_query.date.strftime("%d-%b-%y, %H:%M"),
                       type=holding_query.type,
                       currency=Currency.EUR)


def get_holding_data(user):
    holdings_data_dict = {}
    holding_query_set = Holding.objects.filter(user=get_id_from_db(Account, username=user.username))
    # quotes = yahoo.quote(holding_query_set.values_list('symbol', flat=True))
    quote_dict = {}
    eur_usd = Decimal(yahoo.quote("EURUSD=X")[0]['regularMarketPrice'])
    # symbols = set(holding_query_set.values_list('symbol', flat=True))
    for holding_query in holding_query_set:
        holding_data = create_holding_data(holding_query, quote_dict, eur_usd, user.currency)
        # symbols = filter(lambda holding: holding.symbol == symbol, holdings_data)
        symbol = holding_query.symbol
        if symbol in holdings_data_dict:
            holdings_data_dict[symbol]['entities'].append(holding_data)
            # holdings_data[symbol]['average'] = get_average_data(holdings_data[symbol])
        else:
            holdings_data_dict[holding_query.symbol] = {'symbol': symbol, 'type': holding_query.type,
                                                        'name': quote_dict[symbol]['shortName'],
                                                        'exchange': quote_dict[symbol]['fullExchangeName'],
                                                        'entities': [holding_data]}
    set_average_data(holdings_data_dict)
    return list(holdings_data_dict.values())


def get_average(data, level1, level2):
    total_values = sum([entity[level1][level2] * entity['quantity'] for entity in data])
    total_quantity = sum([entity['quantity'] for entity in data])
    return total_values / total_quantity


def set_average_data(holdings_data_dict):
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

        holdings_data['average'] = HoldingData(symbol=symbol,
                                               name=holdings_data['entities'][0].name,
                                               exchange=holdings_data['entities'][0].exchange,
                                               quantity=quantity,
                                               price=price,
                                               gain=price.gain(quantity),
                                               change_24H=change_24H,
                                               value=value,
                                               date=holdings_data['entities'][0].date,
                                               type=holdings_data['entities'][0].type,
                                               currency=Currency.EUR)


def getOverviewData(user):
    capital = Capital.objects.filter(user=Account.objects.get(username=user).id)
    if len(capital) == 0:
        return {'crypto': 0, 'stock': 0, 'total': 0}
    else:
        capitalData = CapitalSerializerForAccount(capital, many=True).data[0]
        capitalData['total'] = capital.first().crypto + capital.first().stock
        return capitalData


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
    return Sum(crypto=total_crypto, stock=total_stock, total=total_crypto + total_stock)


def get_change_daily(holdings_data):
    crypto_value = [holding['average'].change_24H.value for holding in holdings_data if
                    holding['type'] == HoldingType.CRYPTO]
    stock_value = [holding['average'].change_24H.value for holding in holdings_data if
                   holding['type'] == HoldingType.STOCK]
    total_value = [holding['average'].change_24H.value for holding in holdings_data]

    crypto = Change(value=sum(crypto_value), percentage=holdings_data[0]['average'].change_24H.percentage)
    stock = Change(value=sum(stock_value), percentage=holdings_data[0]['average'].change_24H.percentage)
    total = Change(value=sum(total_value), percentage=holdings_data[0]['average'].change_24H.percentage)
    return ChangeOverview(crypto=crypto, stock=stock, total=total)


def get_overview_data(holdings_data, username):
    user = Account.objects.get(username=username)
    capital = Capital.objects.filter(user=Account.objects.get(username=username).id).first()
    # continue to work on the overview view, remove capital calculations and use purchase_price instead. but show capital in the overview
    overview = Overview()
    if capital is None:
        overview.capital = Sum()
    else:
        overview.capital = Sum(crypto=capital.crypto, stock=capital.stock, total=capital.stock + capital.crypto)
    overview.purchase = get_totals(holdings_data, 'purchase')
    overview.current = get_totals(holdings_data, 'current')
    overview.change_purchase = overview.get_change('purchase')  # change based on the purchase price on current value
    overview.change_capital = overview.get_change('capital')  # change based on the capital price on current value
    overview.change_daily = overview.get_change_daily(
        holdings_data)  # change based on the capital price on current value
    overview.currency = user.currency
    return overview


def getPortfolio(user):
    holdings_data = get_holding_data(user)
    # TODO move all sorting to the api from UI
    # holdings_data.sort(key=lambda holding: holding['average'].value.current, reverse=True)
    overview = get_overview_data(holdings_data, user.username)
    return {'holdings_data': holdings_data,
            'overview': overview,
            'user': user.username,
            'currency': user.currency}
