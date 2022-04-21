from accounts.models import Account
from holdings.models import PortfolioSnapshot
from holdings.utils import getPortfolio


def create_snapshot(user, snapshot_hook):
    portfolio = getPortfolio(user)
    PortfolioSnapshot.objects.create(user=user, snapshot_hook=snapshot_hook, portfolio=str(portfolio))


def create_snapshots(snapshot_hook):
    users = Account.objects.all()
    for user in users:
        create_snapshot(user, snapshot_hook)
