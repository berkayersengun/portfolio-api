from decimal import Decimal, ROUND_UP


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
