# External Import
from rest_framework import serializers

# Internal Import
from .models import Episode


class EpisodeSerializer(serializers.ModelSerializer):
    """ Episode Serializer """

    class Meta:
        model = Episode
        fields = (
            'id', 'episode_id', 'episode_name', 'episode_description',
            'episode_length', 'episode_date', 'episode_link',
            'series'
        )
        extra_kwargs = {
            'id': {
                'read_only': True,
            },
        }
