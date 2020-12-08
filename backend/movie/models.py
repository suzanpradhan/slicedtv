# External Import
from djongo import models

# Internal Import
from slice.models import Cast, Language, Genre, Gallery

class Movie(models.Model):
    movie_name=                models.CharField(max_length=255)
    movie_poster=              models.URLField() 
    genre=                     models.ManyToManyField(Genre)    
    description=               models.TextField()
    trailer_link=              models.URLField() 
    movie_link=                models.URLField() 
    movie_length=              models.TimeField()
    cast=                      models.ManyToManyField(Cast)
    language=                  models.ManyToManyField(Language)
    aired=                     models.DateField()
    avg_rating=                models.FloatField() 
    production_Company=        models.CharField(max_length=255)
    gallery=                   models.ManyToManyField(Gallery)


    objects = models.DjongoManager()
    
    def __str__(self):
        return self.movie_name