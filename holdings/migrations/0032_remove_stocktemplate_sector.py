# Generated by Django 4.0.1 on 2022-01-24 00:51

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('holdings', '0031_alter_holding_date'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='stocktemplate',
            name='sector',
        ),
    ]
