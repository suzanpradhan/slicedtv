from djongo import models

class Review(models.Model):
    review_id=                  models.IntegerField()
    review_title=               models.CharField()
    description=                models.CharField()
    user_id=                    models.IntegerField()
    date=                       models.DateTimeField()
    
    def __str__(self):
        return self.review_title
