# Generated by Django 4.0.1 on 2022-01-19 01:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0007_alter_account_managers'),
    ]

    operations = [
        migrations.CreateModel(
            name='Capital',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('crypto', models.IntegerField(default=0)),
                ('stock', models.IntegerField(default=0)),
            ],
        ),
    ]
