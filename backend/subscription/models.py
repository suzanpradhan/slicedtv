# External Import
from djongo import models


class Subscription(models.Model):

    subscription_name = models.CharField(max_length=200)
    subscription_type = models.CharField(max_length=200)
    subscription_amount = models.FloatField()
    subscription_detail = models.TextField()

    objects = models.DjongoManager()

    def __str__(self):
        """Return string representation of the subscription type"""
        return self.subscription_name

    @property
    def get_subscription_detail(self):
        """ Returns the detail in list """
        qs = self.subscription_detail
        qs = qs.split('@')
        return qs
