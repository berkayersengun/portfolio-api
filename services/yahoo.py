import datetime
import json

import requests

from services.common_utils import convert_timestamp_to_date

headers = {'user-agent': 'portofino'}


def get_host(version, function):
    return f"https://query1.finance.yahoo.com/v{version}/finance/{function}"


def quote(*symbols):
    query = {'symbols': ','.join(symbols)}
    response = requests.get(get_host(version=6, function="quote"), params=query, headers=headers)
    if response.ok:
        return response.json()['quoteResponse']['result']
    else:
        ex = json.loads(response.text)
        ex['detail'] = get_host(version=7, function="quote")
        raise Exception(ex)


# alternative to quote
def options(symbol):
    uri = get_host(version=7, function="options")
    uri = f"{uri}/{symbol}"
    response = requests.get(uri, headers=headers)
    if response.ok:
        return response.json()['optionChain']['result'][0]['quote']
    else:
        ex = json.loads(response.text)
        ex['detail'] = get_host(version=7, function="quote")
        raise Exception(ex)


def search(symbol):
    query = {'q': symbol}
    response = requests.get(get_host(version=1, function="search"), params=query, headers=headers)
    return response.json()['quotes']


def chart(symbol):
    query = {'range': '1m', 'interval': '1m'}
    host = get_host(version=8, function="chart")
    response = requests.get(f"{host}/{symbol}", params=query, headers=headers)
    return response.json()['chart']['result'][0]['meta']


HIST_PARAMS = {
    "1D": {
        "range": "1d",
        "interval": "1m",
    },
    "7D": {
        "range": "5d",
        "interval": "15m",
    },
    "1MO": {
        "range": "1mo",
        "interval": "30m",
    },
    "6MO": {
        "range": "6mo",
        "interval": "1d",
    },
    "YTD": {
        "range": "ytd",
        "interval": "1d",
    },
    "1Y": {
        "range": "1y",
        "interval": "1d",
    },
    "5Y": {
        "range": "5y",
        "interval": "1wk",
    },
    "MAX": {
        "range": "max",
        "interval": "1wk",
    },
}


def history(symbol, interval='1m', range_query='1d', period1=None, period2=None):
    period1 = (datetime.datetime.today() - datetime.timedelta(hours=24)).timestamp()

    if range_query == '7d':
        period1 = (datetime.datetime.today() - datetime.timedelta(days=7)).timestamp()
    if range_query == '1mo':
        period1 = (datetime.datetime.today() - datetime.timedelta(weeks=4)).timestamp()
    if range_query == '6mo':
        period1 = (datetime.datetime.today() - datetime.timedelta(weeks=24)).timestamp()
    if range_query == 'ytd':
        period1 = datetime.datetime(datetime.datetime.today().year, 1, 1).timestamp()
    if range_query == '1y':
        period1 = (datetime.datetime.today() - datetime.timedelta(weeks=4 * 12)).timestamp()
    if range_query == '5y':
        period1 = (datetime.datetime.today() - datetime.timedelta(weeks=4 * 12 * 5)).timestamp()

    period2 = datetime.datetime.today().timestamp()

    if range_query == 'max':
        query = {'interval': interval, 'range': range_query}
    else:
        query = {'interval': interval, 'period1': round(period1), 'period2': round(period2)}

    function = f'chart/{symbol}'
    response = requests.get(get_host(version=8, function=function), params=query, headers=headers)
    result = response.json()['chart']['result'][0]
    data = []

    # logging.info(result)
    if 'timestamp' in result:
        for r in range(len(result['timestamp'])):
            date = convert_timestamp_to_date(result['timestamp'][r])
            close_price = result['indicators']['quote'][0]['close'][r]
            if close_price is not None:
                entry = {'date': date, 'price': close_price}
                data.append(entry)
    return data
