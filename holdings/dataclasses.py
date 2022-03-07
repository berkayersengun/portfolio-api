import dataclasses
import json

from accounts.choices import HoldingType, Currency

# API Responses
from services.common_utils import convert_float


@dataclasses.dataclass
class Quote(object):
    symbol: str
    name: str
    exchange: str
    datetime: str
    open: str
    high: str
    low: str
    close: str
    previous_close: str
    change: str
    percent_change: str
    average_volume: str
    currency: str

    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__,
                          sort_keys=True, indent=4)


# Custom data response classes below
# @dataclasses.dataclass
# class Change(object):
#     change: float
#     change_24h: float
#     change_percent_24h: float


@dataclasses.dataclass
class Change(object):
    value: float = 0
    percentage: float = 0

    def __post_init__(self):
        self.value = convert_float(self.value)
        self.percentage = convert_float(self.percentage, exp=2)

    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__,
                          sort_keys=True, indent=4)

    # @property
    # def value(self) -> float:
    #     return convert_float(self.value)
    #
    # @property
    # def percentage(self):
    #     return convert_float(self.percentage, exp=2)

    # @value.setter
    # def value(self, value):
    #     self.value = value
    #
    # @percentage.setter
    # def percentage(self, value):
    #     self.percentage = value


@dataclasses.dataclass
class Price(object):
    purchase: float
    current: float

    def __post_init__(self):
        self.purchase = convert_float(self.purchase)
        self.current = convert_float(self.current)

    # for square notation '[]'
    def __getitem__(self, item):
        return getattr(self, item)
        # return super().__getattribute__(item)

    # for dot notation '.'
    # def __getattr__(self, attr):
    #     return getattr(self, attr)

    def gain(self, quantity):
        value = (self.current - self.purchase) * quantity
        return Change(value=value, percentage=self.__calculatePercentage())

    def __calculatePercentage(self):
        delta = self.current - self.purchase
        if delta != 0:
            return delta / self.purchase * 100
        return 0


# @property
# def purchase(self):
#     return self.purchase
#
# @property
# def current(self):
#     return self.current


@dataclasses.dataclass
class HoldingData(object):
    symbol: str
    name: str
    exchange: str
    quantity: float
    price: Price
    change_24H: Change
    gain: Change
    value: Price
    date: str
    type: HoldingType
    currency: Currency

    def __post_init__(self):
        self.quantity = self.quantity
        # self.amount = convert_2_dec(self.amount)

    def __getitem__(self, item):
        return getattr(self, item)

    def getCurrentValue(self):
        return self.quantity * self.price.current

    # def getChange(self):
    #     return (self.current_price - self.purchase_price) * self.quantity

    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__,
                          sort_keys=True, indent=4)


@dataclasses.dataclass
class HoldingsData(object):
    symbol: str
    average_holding: HoldingData
    holding_data: list[HoldingData]

    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__,
                          sort_keys=True, indent=4)


# @dataclasses.dataclass
# class HoldingsData(object):
#     crypto: list[HoldingData]
#     stock: list[HoldingData]
#
#     def toJSON(self):
#         return json.dumps(self, default=lambda o: o.__dict__,
#                           sort_keys=True, indent=4)


@dataclasses.dataclass
class Sum(object):
    crypto: float = 0
    stock: float = 0
    total: float = 0

    def __post_init__(self):
        self.crypto = convert_float(self.crypto)
        self.stock = convert_float(self.stock)
        self.total = convert_float(self.total)

    def __getitem__(self, key):
        return getattr(self, key)

    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__,
                          sort_keys=True, indent=4)


@dataclasses.dataclass
class ChangeOverview(object):
    crypto: Change() = Change()
    stock: Change() = Change()
    total: Change() = Change()


@dataclasses.dataclass
class Overview(object):
    capital: Sum = Sum()
    current: Sum = Sum()
    purchase: Sum = Sum()
    change_purchase: ChangeOverview = ChangeOverview()
    change_capital: ChangeOverview = ChangeOverview()
    change_daily: ChangeOverview = ChangeOverview()

    def __getitem__(self, key):
        return getattr(self, key)

    def get_change(self, change_base):
        crypto = Change(value=self.__calculateValue('crypto', change_base),
                        percentage=self.__calculatePercentage('crypto', change_base=change_base))
        stock = Change(value=self.__calculateValue('stock', change_base),
                       percentage=self.__calculatePercentage('stock', change_base=change_base))
        total = Change(value=self.__calculateValue('total', change_base),
                       percentage=self.__calculatePercentage('total', change_base=change_base))
        return ChangeOverview(crypto=crypto, stock=stock, total=total)

    def get_change_daily(self, holdings_data):
        crypto_value = sum([holding['average'].change_24H.value for holding in holdings_data if
                            holding['type'] == HoldingType.CRYPTO])
        stock_value = sum([holding['average'].change_24H.value for holding in holdings_data if
                           holding['type'] == HoldingType.STOCK])
        total_value = sum([holding['average'].change_24H.value for holding in holdings_data])

        crypto = Change(value=crypto_value, percentage=self.__calculatePercentage('crypto', daily_change=crypto_value))
        stock = Change(value=stock_value, percentage=self.__calculatePercentage('stock', daily_change=stock_value))
        total = Change(value=total_value, percentage=self.__calculatePercentage('total', daily_change=total_value))
        return ChangeOverview(crypto=crypto, stock=stock, total=total)

    def __calculateValue(self, attribute, change_base):
        return self.current[attribute] - self[change_base][attribute] if self.current[attribute] != 0 else 0

    def __calculatePercentage(self, attribute, change_base=None, daily_change=None):
        if change_base is not None:
            delta = self.__calculateValue(attribute, change_base)
            if self[change_base][attribute] != 0:
                return delta / self[change_base][attribute] * 100
            return 0
        if daily_change is not None and daily_change != 0:
            return daily_change / (self.current[attribute] - daily_change) * 100
        return 0

    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__,
                          sort_keys=True, indent=4)

# @dataclasses.dataclass
# class Search(object):
#     symbol: str = ''
#     instrument_name: str = ''
#     exchange: str = ''
#     exchange_timezone: str = ''
#     instrument_type: str = ''
#     country: str = ''
#     currency: str = ''

# {
#     "symbol": "QID",
#     "instrument_name": "ProShares UltraShort QQQ",
#     "exchange": "NYSE",
#     "exchange_timezone": "America/New_York",
#     "instrument_type": "ETF",
#     "country": "United States",
#     "currency": "USD"
# }
