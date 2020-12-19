# External Import
from django.db import models

# Internal Import
from slice.models import Cast, Language, Genre, Gallery

class Movie(models.Model):
    movie_name=                models.CharField(max_length=255)
    movie_poster=              models.URLField() 
    genres=                    models.ManyToManyField(Genre)    
    description=               models.TextField()
    trailer_link=              models.URLField() 
    movie_link=                models.URLField() 
    movie_length=              models.DurationField()
    casts=                     models.ManyToManyField(Cast)
    languages=                 models.ManyToManyField(Language)
    aired=                     models.DateField()
    avg_rating=                models.FloatField(blank=True, null=True) 
    production_company=        models.CharField(max_length=255)
    gallerys=                  models.ManyToManyField(Gallery)


    
    def __str__(self):
        return self.movie_name