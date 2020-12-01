from djongo import models
from series.models import Series
from review.models import Review

class Episode(models.Model):
    series_id=                  models.ForeignKey(Series)
    episode_id=                 models.IntegerField(max_length=255)
    episode_name=               models.CharField(max_length=255)
    episode_length=             models.TimeField(max_length=255)
    episode_date=               models.DateField(max_length=255)
    episode_link=               models.URLField(max_length=255)
    episode_rating=             models.IntegerField(max_length=255)
    review_ID=                  models.ForeignKey(Review)
    
    def __str__(self):
        return self.episode_name