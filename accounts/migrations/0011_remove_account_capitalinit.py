# Generated by Django 4.0.1 on 2022-01-19 02:08

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0010_remove_account_capital_account_capitalinit_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='account',
            name='capitalinit',
        ),
    ]
