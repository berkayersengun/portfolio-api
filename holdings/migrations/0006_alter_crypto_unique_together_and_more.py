# Generated by Django 4.0.1 on 2022-01-10 00:42

from django.conf import settings
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('holdings', '0005_alter_crypto_symbol_alter_stock_symbol'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='crypto',
            unique_together={('symbol', 'user')},
        ),
        migrations.AlterUniqueTogether(
            name='stock',
            unique_together={('symbol', 'user')},
        ),
    ]
