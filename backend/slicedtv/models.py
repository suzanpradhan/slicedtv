from djongo import models

class Cast(models.Model):
    cast = models.CharField(max_length=200)

    class Meta:
        abstract = True

    def __str__(self):
        return self.cast

class Genre(models.Model):
    genre = models.CharField(max_length=200)

    def __str__(self):
        return self.genre

class Language(models.Model):
    language = models.CharField(max_length=200)

    def __str__(self):
        return self.language