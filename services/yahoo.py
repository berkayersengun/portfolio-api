import requests

headers = {'user-agent': 'portofino'}


def getHost(version, function):
    return f"https://query1.finance.yahoo.com/v{version}/finance/{function}"


def quote(*symbols):
    query = {'symbols': ','.join(symbols)}
    response = requests.get(getHost(version=7, function="quote"), params=query, headers=headers)
    return response.json()['quoteResponse']['result']


def search(symbol):
    query = {'q': symbol}
    response = requests.get(getHost(version=1, function="search"), params=query, headers=headers)
    return response.json()['quotes']
