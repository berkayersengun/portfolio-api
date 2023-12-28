import logging

from django.core.management.base import BaseCommand

from accounts.choices import SnapshotHook
from accounts.models import Account
from scheduler.tasks import create_portfolio_snapshot, create_overview_snapshot

logger = logging.getLogger(__name__)


class Command(BaseCommand):

    def handle(self, *args, **options):
        user = Account.objects.get(username="admin")
        create_portfolio_snapshot(user, SnapshotHook.DAILY)
        create_overview_snapshot(user, SnapshotHook.DAILY)

