# from dacite import from_dict
# from twelvedata import TDClient
#
# from holdings.dataclasses import Quote
#
#
# class TwelveClient:
#     def __init__(self, apikey):
#         self.apikey = apikey
#         self.td = TDClient(apikey="0543910e4a164c1696ce9d898f0718c8")
#
#     def quote(self, *symbol):
#         response = quote(symbol=','.join(symbol)).as_json()
#         return from_dict(data_class=Quote, data=response)
#
#     def price(self, *price):
#         return quote(symbol=','.join(price)).as_json()
#
#     def currency_conversion(self, symbol, amount):
#         return self.td.currency_conversion(symbol=symbol, amount=amount).as_json()['amount']
#
#     def exchange_rate(self, symbol):
#         return self.td.currency_conversion(symbol=symbol).as_json()['rate']
#
#     def search(self, symbol):
#         return self.td.symbol_search(symbol=symbol).as_json()
