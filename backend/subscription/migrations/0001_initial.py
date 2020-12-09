# Generated by Django 3.0.5 on 2020-12-08 06:39

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Subscription',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('subscription_type', models.CharField(max_length=200)),
                ('subscription_amount', models.FloatField()),
                ('Subscription_detail', models.TextField()),
            ],
        ),
    ]