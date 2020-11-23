from djongo import Model

class Series(models.Model):
    series_name=                models.CharField()
    series_poster=              models.URLField()
    genre=                      models.ListField()    
    description=                models.CharField()
    trailer_link=               models.URLField()
    episode_ids=                models.ListField()
    cast=                       models.ListField()   
    director=                   models.ListField()
    writer=                     models.ListField()
    language=                   models.ListField()
    subtitile=                  models.ListField()
    aired=                      models.DateField()
    rating_info=                models.IntegerField()
    production_Companies=       models.ListField()

    def __str__(self):
        return self.series_name
