# import pytest
# from django.test import TestCase
#
# # Create your tests here.
# from django.test import TestCase
#
# from accounts.choices import SnapshotHook
# from accounts.models import Account
# from scheduler.tasks import create_overview_snapshot
#
# class AnimalTestCase(TestCase):
#     fixtures = https://docs.djangoproject.com/en/1.11/ref/django-admin/#what-s-a-fixture
#     # def setUp(self):
#     #     Animal.objects.create(name="lion", sound="roar")
#     #     Animal.objects.create(name="cat", sound="meow")
#     @pytest.mark.django_db
#     def test_animals_can_speak(self):
#         users = Account.objects.all()
#         for user in users:
#             create_overview_snapshot(user, SnapshotHook.DAILY)
#         # self.assertEqual(lion.speak(), 'The lion says "roar"')
