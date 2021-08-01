from rest_framework import serializers

from movies_admin.movies_v1.models import FilmWork


class FilmWorkSerializer(serializers.ModelSerializer):

    class Meta:
        model = FilmWork
        fields = '__all__'
