# Generated by Django 3.0.5 on 2020-12-08 08:12

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('slice', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Series',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('series_name', models.CharField(max_length=255)),
                ('series_poster', models.URLField()),
                ('description', models.CharField(max_length=255)),
                ('trailer_link', models.URLField()),
                ('aired', models.DateField()),
                ('avg_rating', models.FloatField()),
                ('production_Company', models.CharField(max_length=255)),
                ('cast', models.ManyToManyField(to='slice.Cast')),
                ('gallery', models.ManyToManyField(to='slice.Gallery')),
                ('genre', models.ManyToManyField(to='slice.Genre')),
                ('language', models.ManyToManyField(to='slice.Language')),
            ],
        ),
    ]
