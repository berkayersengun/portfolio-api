from django.db import models
from django.utils.translation import gettext_lazy as _


class Currency(models.TextChoices):
    EUR = 'EUR', _('EUR')
    USD = 'USD', _('USD')
    TRY = 'TRY', _('TRY')


class HoldingType(models.TextChoices):
    STOCK = 'stock', _('stock')
    CRYPTO = 'crypto', _('crypto')
