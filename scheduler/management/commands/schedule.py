import logging

from apscheduler.triggers.interval import IntervalTrigger
from django.core.management.base import BaseCommand

from scheduler.tasks import create_portfolio_snapshots, create_overview_snapshots
from apscheduler.schedulers.blocking import BlockingScheduler
from apscheduler.triggers.cron import CronTrigger
from django_apscheduler import util
from django_apscheduler.jobstores import DjangoJobStore
from django_apscheduler.models import DjangoJobExecution

from accounts.choices import SnapshotHook

logger = logging.getLogger(__name__)


class Command(BaseCommand):

    def handle(self, *args, **options):
        scheduler = schedule_create_snapshots()
        start(scheduler)


@util.close_old_connections
def delete_old_job_executions(max_age=604_800):
    """
    This job deletes APScheduler job execution entries older than `max_age` from the database.
    It helps to prevent the database from filling up with old historical records that are no
    longer useful.

    :param max_age: The maximum length of time to retain historical job execution records.
                    Defaults to 7 days.
    """
    DjangoJobExecution.objects.delete_old_job_executions(max_age)


def add_cleanup_scheduler(scheduler):
    scheduler.add_job(
        delete_old_job_executions,
        trigger=CronTrigger(
            day_of_week="mon", hour="00", minute="00"
        ),  # Midnight on Monday, before start of the next work week.
        id="delete_old_job_executions",
        max_instances=1,
        replace_existing=True,
    )
    logger.info(
        "Added weekly job: 'delete_old_job_executions'."
    )


def schedule_create_snapshots():
    scheduler = BlockingScheduler(timezone="America/Toronto")
    scheduler.add_jobstore(DjangoJobStore(), "default")
    scheduler.add_job(
        create_portfolio_snapshots,
        args=[SnapshotHook.DAILY],
        trigger=CronTrigger(hour='00', minute='00'),
        # trigger=CronTrigger(second="*/10"),  # Every 10 seconds
        id="createSnapshotsPortfolio",  # The `id` assigned to each job MUST be unique
        max_instances=1,
        replace_existing=True,
    )
    logger.info("Added daily job: 'createSnapshotsPortfolio'.")
    scheduler.add_job(
        create_overview_snapshots,
        args=[SnapshotHook.OVERVIEW],
        # trigger=IntervalTrigger(minutes=30),
        trigger=CronTrigger(minute='*/30'),
        id="createSnapshotsOverview",  # The `id` assigned to each job MUST be unique
        max_instances=1,
        replace_existing=True,
    )
    logger.info("Added daily job: 'createSnapshotsOverview'.")
    add_cleanup_scheduler(scheduler)
    return scheduler


def start(scheduler):
    try:
        logger.info("Starting scheduler...")
        scheduler.start()
    except KeyboardInterrupt as e:
        print('interruption::', e.__class__)
        logger.info("Stopping scheduler...")
        scheduler.shutdown()
        logger.info("Scheduler shut down successfully!")
