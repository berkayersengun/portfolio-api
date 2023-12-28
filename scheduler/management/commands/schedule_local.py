import logging

from django.core.management.base import BaseCommand

from accounts.choices import SnapshotHook
from accounts.models import Account
from holdings.models import PortfolioSnapshot
from scheduler.tasks import create_portfolio_snapshot, create_overview_snapshot

logger = logging.getLogger(__name__)


class Command(BaseCommand):

    def handle(self, *args, **options):
        ports = PortfolioSnapshot.objects.all()
        count = 0
        print(len(ports))
        for port in ports:
            if 'user' in port.portfolio:
                port.portfolio['username'] = port.portfolio['user']
                del port.portfolio['user']
                port.save()
                count += count +1
                print(port.portfolio['username'])
                print(count)




        # user = Account.objects.get(username="berkay")
        # create_portfolio_snapshot(user, SnapshotHook.DAILY)
        # create_overview_snapshot(user, SnapshotHook.DAILY)

