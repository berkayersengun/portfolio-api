import dataclasses
import datetime
import json
from decimal import Decimal

from accounts.choices import HoldingType, Currency


@dataclasses.dataclass
class BaseDataClass(object):
    def to_json(self):
        return json.dumps(self, default=lambda o: o.__dict__,
                          sort_keys=True, indent=4)

    # for square notation '[]'
    def __getitem__(self, item):
        return getattr(self, item)


# API Responses
@dataclasses.dataclass
class Quote(BaseDataClass):
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


@dataclasses.dataclass
class Change(BaseDataClass):
    value: Decimal = Decimal(0)
    percentage: Decimal = Decimal(0)


@dataclasses.dataclass
class Price(BaseDataClass):
    purchase: Decimal
    current: Decimal

    def gain(self, quantity):
        value = (self.current - self.purchase) * quantity
        return Change(value=value, percentage=self.__calculatePercentage())

    def __calculatePercentage(self):
        delta = self.current - self.purchase
        if delta != 0:
            return delta / self.purchase * 100
        return 0


@dataclasses.dataclass
class HoldingData(BaseDataClass):
    id: int
    symbol: str
    name: str
    exchange: str
    quantity: Decimal
    price: Price
    change_24H: Change
    gain: Change
    value: Price
    date: str
    type: HoldingType
    currency: Currency

    def __post_init__(self):
        self.quantity = self.quantity

    def getCurrentValue(self):
        return self.quantity * self.price.current


@dataclasses.dataclass
class HoldingsData(BaseDataClass):
    symbol: str
    average_holding: HoldingData
    holding_data: list[HoldingData]


@dataclasses.dataclass
class Sum(BaseDataClass):
    crypto: Decimal = Decimal(0)
    stock: Decimal = Decimal(0)
    total: Decimal = Decimal(0)

    def __post_init__(self):
        self.total = self.crypto + self.stock

    def add_value(self, type, value):
        if type == 'crypto':
            self.crypto = self.crypto + value
        if type == 'stock':
            self.stock = self.stock + value
        self.total = self.crypto + self.stock

    def currency_conversion(self, conversion_rate):
        self.crypto = self.crypto * conversion_rate
        self.stock = self.stock * conversion_rate
        self.total = self.crypto + self.stock
        return self


@dataclasses.dataclass
class ChangeOverview(BaseDataClass):
    crypto: Change = dataclasses.field(default_factory=Change)
    stock: Change = dataclasses.field(default_factory=Change)
    total: Change = dataclasses.field(default_factory=Change)


@dataclasses.dataclass
class Overview(BaseDataClass):
    capital: Sum = dataclasses.field(default_factory=Sum)
    current: Sum = dataclasses.field(default_factory=Sum)
    purchase: Sum = dataclasses.field(default_factory=Sum)
    change_purchase: ChangeOverview = dataclasses.field(default_factory=ChangeOverview)
    change_capital: ChangeOverview = dataclasses.field(default_factory=ChangeOverview)
    change_daily: ChangeOverview = dataclasses.field(default_factory=ChangeOverview)

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
            if self[change_base][attribute] != 0 and delta != 0:
                return delta / self.current[attribute] * 100
            return 0
        if daily_change is not None and daily_change != 0:
            return daily_change / (self.current[attribute] - daily_change) * 100
        return 0


@dataclasses.dataclass
class Portfolio(BaseDataClass):
    user: str
    currency: str
    holdings_data: list = dataclasses.field(default_factory=list)
    overview: Overview = dataclasses.field(default_factory=Overview)


# History
@dataclasses.dataclass
class Date(BaseDataClass):
    history_date: datetime
    sum: Sum()
    holdings: list = dataclasses.field(default_factory=list)

# @dataclasses.dataclass
# class History(BaseDataClass):
#     date: list[Date] = dataclasses.field(default_factory=lambda: [])
