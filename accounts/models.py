from django.contrib.auth.models import AbstractUser, UserManager
from django.db import models

# class Account(AbstractUser):
#     pass
from accounts.choices import Currency


class CustomUserManager(UserManager):
    # allow case-insensitive username when authenticating
    def get_by_natural_key(self, username):
        return self.get(username__iexact=username)


class Account(AbstractUser):
    currency = models.CharField(max_length=15, choices=Currency.choices, null=False)
    # capital = models.ForeignKey(Capital, models.CASCADE, null=False, unique=True)
    # capitalinit = models.CharField(max_length=50)
    objects = CustomUserManager()
