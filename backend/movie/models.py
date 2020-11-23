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