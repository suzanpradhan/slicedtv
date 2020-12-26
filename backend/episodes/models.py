from django.db import models
from series.models import Series
from review.models import Review

class Episode(models.Model):
    series=                     models.ForeignKey(Series, on_delete=models.CASCADE)
    episode_id=                 models.IntegerField()
    episode_name=               models.CharField(max_length=255)
    episode_description=        models.TextField()
    episode_length=             models.DurationField()
    episode_date=               models.DateField()
    episode_link=               models.URLField() 
    
    def __str__(self):
        return self.series.series_name+" "+str(self.episode_id)