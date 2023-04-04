from django.core.validators import MinValueValidator
from django.db import models
from django.utils import timezone

import accounts.models
from accounts.choices import Currency, HoldingType, SnapshotHook


class Capital(models.Model):
    user = models.OneToOneField(accounts.models.Account, on_delete=models.CASCADE, primary_key=True, null=False)
    crypto = models.DecimalField(default=0, max_digits=20, decimal_places=8)
    stock = models.DecimalField(default=0, max_digits=20, decimal_places=8)


class Holding(models.Model):
    # def is_upperclass(self):
    #     return self.year_in_school in {
    #         self.YearInSchool.JUNIOR,
    #         self.YearInSchool.SENIOR,
    #     }

    """
    Numeric(precision, scale)
    precision = max_digits
    scale= decimal_places
    """

    quantity = models.DecimalField(validators=[MinValueValidator(0)], null=False, max_digits=20, decimal_places=8)
    purchase_price = models.DecimalField(validators=[MinValueValidator(0)], null=False, max_digits=20, decimal_places=8)
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


# class Price(models.Model):
#     purchase = models.DecimalField(validators=[MinValueValidator(0)], null=False, max_digits=20, decimal_places=8)
#     current = models.DecimalField(validators=[MinValueValidator(0)], null=False, max_digits=20, decimal_places=8)
#
#     def gain(self, quantity):
#         value = (self.current - self.purchase) * quantity
#         return Change(value=value, percentage=self.__calculatePercentage())
#
#     def __calculatePercentage(self):
#         delta = self.current - self.purchase
#         if delta != 0:
#             return delta / self.purchase * 100
#         return 0
#
#
# class Change(models.Model):
#     value = models.DecimalField(validators=[MinValueValidator(0)], null=False, max_digits=20, decimal_places=8)
#     percentage = models.DecimalField(validators=[MinValueValidator(0)], null=False, max_digits=20, decimal_places=8)
#
#
# class HoldingData(models.Model):
#     # symbol = models.CharField(null=False)
#     # name = models.CharField(null=False)
#     # exchange = models.CharField(null=False)
#     quantity = models.DecimalField(validators=[MinValueValidator(0)], null=False, max_digits=20, decimal_places=8)
#     price = models.ForeignKey(Price, models.CASCADE, null=False, related_name='+')
#     change_24H = models.ForeignKey(Change, models.CASCADE, null=False, related_name='+')
#     gain = models.ForeignKey(Change, models.CASCADE, null=False, related_name='+')
#     value = models.ForeignKey(Price, models.CASCADE, null=False, related_name='+')
#     date = models.DateTimeField(default=timezone.now)
#     # type = models.CharField(max_length=10, choices=HoldingType.choices, null=False)
#     currency = models.CharField(max_length=15, choices=Currency.choices, null=False)
#
#
# class HoldingsData(models.Model):
#     symbol = models.CharField(max_length=15, null=False)
#     type = models.CharField(max_length=10, choices=HoldingType.choices, null=False)
#     name = models.CharField(max_length=50, null=False)
#     exchange = models.CharField(max_length=50, null=False)
#     entities = models.ManyToManyField(HoldingData)
#     average = models.ForeignKey(HoldingData, models.CASCADE, null=False, related_name='+')
#
#
# class Overview(models.Model):
#     pass
#
#
# class Portfolio(models.Model):
#     holdings_data = models.ManyToManyField(HoldingsData)
#     user = models.ForeignKey(accounts.models.Account, models.CASCADE, null=False)
#     # overview = models.ForeignKey(Overview, models.CASCADE, null=False)


class PortfolioSnapshot(models.Model):
    user = models.ForeignKey(accounts.models.Account, models.CASCADE, null=False)
    date = models.DateTimeField(auto_now_add=True)
    snapshot_hook = models.CharField(max_length=10, choices=SnapshotHook.choices, null=False)
    portfolio = models.JSONField()


class OverviewSnapshot(models.Model):
    user = models.ForeignKey(accounts.models.Account, models.CASCADE, null=False)
    date = models.DateTimeField(auto_now_add=True)
    snapshot_hook = models.CharField(max_length=10, choices=SnapshotHook.choices, null=False)
    overview = models.JSONField()
