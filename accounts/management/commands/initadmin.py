from django.conf import settings
from django.core.management.base import BaseCommand

from accounts.models import Account


class Command(BaseCommand):

    def handle(self, *args, **options):
        if Account.objects.count() == 0:
            username = 'admin'
            # email = user[1]
            password = 'admin'
            print('Creating account for %s' % username)
            admin = Account.objects.create_superuser(username=username, password=password)
            admin.is_active = True
            admin.is_admin = True
            admin.save()
        else:
            print('Admin accounts can only be initialized if no Accounts exist')