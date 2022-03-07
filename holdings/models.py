from django.core.validators import MinValueValidator
from django.db import models
from django.utils import timezone

import accounts.models
from accounts.choices import Currency, HoldingType


class Capital(models.Model):
    user = models.OneToOneField(accounts.models.Account, on_delete=models.CASCADE, primary_key=True, null=False)
    crypto = models.IntegerField(default=0)
    stock = models.IntegerField(default=0)


class Holding(models.Model):
    # def is_upperclass(self):
    #     return self.year_in_school in {
    #         self.YearInSchool.JUNIOR,
    #         self.YearInSchool.SENIOR,
    #     }

    quantity = models.FloatField(validators=[MinValueValidator(0)], null=False)
    purchase_price = models.FloatField(validators=[MinValueValidator(0)], null=False)
    user = models.ForeignKey(accounts.models.Account, models.CASCADE, null=False)
    symbol = models.CharField(max_length=15, null=False)
    currency = models.CharField(max_length=15, choices=Currency.choices, null=False)
    date = models.DateTimeField(default=timezone.now)
    type = models.CharField(max_length=10, choices=HoldingType.choices, null=False)

    # action = models.CharField(max_length=10, choices=ACTION, null=False)

    def capital(self):
        return Capital.objects.get(user=self.user.id)

    # TODO add a foreign key for Asset model
    # Create a Asset model and save each asset data in db as template to save holding when querying asset prices
