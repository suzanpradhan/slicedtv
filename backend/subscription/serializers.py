from subscription.models import Subscription
from rest_framework import serializers


class ListAllSubscriptionSerializer(serializers.ModelSerializer):
    subscription_detail = serializers.ReadOnlyField(source='get_subscription_detail')

    class Meta:
        model = Subscription

        fields = ["subscription_type",
                  "subscription_amount", 'subscription_detail']
