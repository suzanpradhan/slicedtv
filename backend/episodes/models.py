from djongo import models

class Episode(models.Model):
    episode_id=                 models.CharField()
    episode_name=               models.CharField()
    episode_length=             models.TimeField()
    episode_date=               models.DateField()
    episode_link=               models.URLField()
    episode_rating=             models.IntegerField()
    review_ID=                  models.IntegerField()
    
    def __str__(self):
        return self.episode_name