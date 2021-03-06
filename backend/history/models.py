# External Import
from django.db import models

# Internal Import
from series.models import Series
from movie.models import Movie
from user.models import User


class History(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    series = models.ForeignKey(
        Series, on_delete=models.CASCADE, null=True, blank=True)
    movies = models.ForeignKey(
        Movie, on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return self.user
