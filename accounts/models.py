from django.contrib.auth.models import AbstractUser
from django.db import models


# class Account(AbstractUser):
#     pass
from accounts.choices import Currency


class Account(AbstractUser):
    currency = models.CharField(max_length=15, choices=Currency.choices, null=False)
    # capital = models.ForeignKey(Capital, models.CASCADE, null=False, unique=True)
    # capitalinit = models.CharField(max_length=50)



