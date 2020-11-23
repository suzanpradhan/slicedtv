from djongo import models

class Movie(models.Model):
    movie_name=                models.CharField()
    movie_poster=              models.URLField()
    genre=                     models.ListField()    
    description=               models.CharField()
    trailer_link=              models.URLField()
    movie_link=                models.URLField()
    movie_length=              models.TimeField()
    cast=                      models.ListField()   
    director=                  models.ListField()
    writer=                    models.ListField()
    language=                  models.ListField()
    subtitile=                 models.ListField()
    aired=                     models.DateField()
    review_ID=                 models.IntegerField()
    rating_info=               models.IntegerField()
    production_Companies=      models.ListField()

    def __str__(self):
        return self.movie_name

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

class Review(models.Model):
    review_id=                  models.IntegerField()
    description=                models.CharField()
    user_id=                    models.IntegerField()
    date=                       models.DateTimeField()