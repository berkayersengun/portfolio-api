import json

from accounts.choices import SnapshotHook
from accounts.models import Account
from holdings.models import PortfolioSnapshot, OverviewSnapshot
from holdings.utils import get_portfolio, EnhancedJSONEncoder, get_overview_data, get_holding_data


def create_portfolio_snapshot(user, snapshot_hook):
    portfolio = get_portfolio(user, user.currency)
    portfolio_as_json = json.dumps(portfolio, cls=EnhancedJSONEncoder)
    return PortfolioSnapshot.objects.create(user=user, snapshot_hook=snapshot_hook, portfolio=json.loads(portfolio_as_json))


def create_portfolio_snapshots(snapshot_hook):
    users = Account.objects.all()
    for user in users:
        create_portfolio_snapshot(user, snapshot_hook)


def create_overview_snapshot(user, snapshot_hook):
    holdings_data = get_holding_data(user, user.currency)
    overview = get_overview_data(holdings_data, user.username, user.currency)
    overview_as_json = json.dumps(overview, cls=EnhancedJSONEncoder)
    overview_as_dict = json.loads(overview_as_json)
    # add currency manually below since json.dumps not adding when encoding overview.currency
    overview_as_dict['currency'] = overview.currency
    return OverviewSnapshot.objects.create(user=user, snapshot_hook=snapshot_hook, overview=overview_as_dict)


def create_overview_snapshots(snapshot_hook: SnapshotHook):
    users = Account.objects.all()
    for user in users:
        create_overview_snapshot(user, snapshot_hook)
