# External Import
from django.db import models

# Internal Import


class Cast(models.Model):
    cast_name = models.CharField(max_length=200)
    cast_image_url = models.URLField()

    def __str__(self):
        return self.cast_name


class Gallery(models.Model):
    image_name = models.CharField(max_length=200)
    image_url = models.URLField()

    def __str__(self):
        return self.image_name


class Genre(models.Model):
    genre = models.CharField(max_length=200)

    def __str__(self):
        return self.genre


class Language(models.Model):
    language = models.CharField(max_length=200)

    def __str__(self):
        return self.language
