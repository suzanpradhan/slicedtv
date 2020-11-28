from djongo import models

class Subscription(models.Model):

    subscription_type       = models.CharField(max_length=200)
    subscription_amount     = models.IntegerField(max_length=200)
    subscription_date       = models.DateTimeField()
    subscription_enddate    = models.DateTimeField()
