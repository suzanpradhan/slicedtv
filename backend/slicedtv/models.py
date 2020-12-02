from djongo import models
from user.models import User
from series.models import Series

class Cast(models.Model):
    cast =      models.CharField(max_length=200)
    cast_img =  models.ImageField()

    class Meta:
        abstract = True

    def __str__(self):
        return self.cast

class Gallery(models.Model):
    gallery_link = models.ImageField()

    def __str__(self):
        return self.gallery_link


class Genre(models.Model):
    genre = models.CharField(max_length=200)

    def __str__(self):
        return self.genre

class Language(models.Model):
    language = models.CharField(max_length=200)

    def __str__(self):
        return self.language



class History(models.Model):
    user =          models.ForeignKey(User)
    series =        models.ForeignKey(Series)
    movies=         models.ForeignKey(Series)

    def __str__(self):
        return self.user
