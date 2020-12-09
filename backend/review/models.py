# #External Import
from djongo import models

# Internal Import
from user.models import User
from movie.models import Movie
from series.models import Series


class Review(models.Model):
    review_title = models.CharField(max_length=255)
    description = models.TextField()
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    movie = models.ForeignKey(
        Movie, on_delete=models.CASCADE, null=True, blank=True)
    series = models.ForeignKey(
        Series, on_delete=models.CASCADE, null=True, blank=True)
    date = models.DateTimeField(auto_now_add=True)
    rating = models.FloatField()

    def __str__(self):
        return self.review_title
