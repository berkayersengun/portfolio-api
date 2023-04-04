import os
from datetime import datetime
from decimal import Decimal, ROUND_UP

from services.enums import Profile


def get_id_from_db(clazz, **kwargs):
    return clazz.objects.get(**kwargs).id


def convert_2_dec(price):
    return float(Decimal(price).quantize(Decimal('.01'), rounding=ROUND_UP))


def between(x, min, max):
    return min <= x <= max


def convert_float(value, **kwargs):
    if kwargs.get('exp'):
        return float(Decimal(value).quantize(Decimal(str(pow(10, -kwargs['exp']))), rounding=ROUND_UP))
    exponent = -Decimal(value).as_tuple().exponent
    if exponent == 0:
        return value
    elif between(value, 0, 1) or between(value, -1, 0):
        exponent = 6
    else:
        exponent = 2

    return float(Decimal(value).quantize(Decimal(str(pow(10, -exponent))), rounding=ROUND_UP))


def format_decimals(num):
    POINTS = Decimal(10) ** -2
    if -1 <= num <= 1:
        POINTS = Decimal(10) ** -4
    if -0.01 <= num <= 0.01:
        POINTS = Decimal(10) ** -6
    num = +Decimal(num).quantize(POINTS)
    return num.to_integral() if num == num.to_integral() else num.normalize()


def get_profile():
    profile = os.getenv('PROFILE')
    if profile:
        return Profile(profile)
    else:
        return Profile.DEV


def convert_timestamp_to_date(timestamp, fmt='%d-%m-%Y'):
    # return datetime.fromtimestamp(timestamp).strftime(fmt)
    return datetime.fromtimestamp(timestamp)
