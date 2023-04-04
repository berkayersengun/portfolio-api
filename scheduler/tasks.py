import json

from accounts.models import Account
from holdings.models import PortfolioSnapshot, OverviewSnapshot
from holdings.utils import get_portfolio, EnhancedJSONEncoder, get_overview_data, get_holding_data


def create_portfolio_snapshot(user, snapshot_hook):
    portfolio = get_portfolio(user)
    portfolio_as_json = json.dumps(portfolio, cls=EnhancedJSONEncoder)
    return PortfolioSnapshot.objects.create(user=user, snapshot_hook=snapshot_hook, portfolio=json.loads(portfolio_as_json))


def create_portfolio_snapshots(snapshot_hook):
    users = Account.objects.all()
    for user in users:
        create_portfolio_snapshot(user, snapshot_hook)


def create_overview_snapshot(user, snapshot_hook):
    holdings_data = get_holding_data(user)
    overview = get_overview_data(holdings_data, user.username)
    overview_as_json = json.dumps(overview, cls=EnhancedJSONEncoder)
    return OverviewSnapshot.objects.create(user=user, snapshot_hook=snapshot_hook, overview=json.loads(overview_as_json))


def create_overview_snapshots(snapshot_hook):
    users = Account.objects.all()
    for user in users:
        create_overview_snapshot(user, snapshot_hook)
