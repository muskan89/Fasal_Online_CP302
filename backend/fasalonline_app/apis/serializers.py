from rest_framework import serializers
from fasals import models

class CropSerializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'id',
            'name',
            'description',
            'species',
            'category',
            'season',
            'botanical_name',
            'genus',
            'family',
            'origin',
            'synonym',
            'rotations',
            'cropimage',
            'average_yield',
            'yield_min',
            'yield_max'
        )
        model = models.Crop


class DiseaseSerializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'crop',
            'state',
            'name',
            'type',
            'symptoms',
            'measures',
            'common_name',
            'disease_image',
        )
        model = models.Disease

class SoilSerializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'crop',
            'state',
            'type',
            'water_content',
            'ph',
            'water_content_min',
            'water_content_max',
            'ph_min',
            'ph_max',
        )
        model = models.Soil

class PestSerializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'crop',
            'state',
            'name',
            'symptoms',
            'measures',
            'pest_image',
        )
        model = models.Pest

class WeedSerializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'crop',
            'state',
            'name',
            'measures',
        )
        model = models.Weed

class ChemicalFertilizerSerializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'crop_id',
            'state',
            'trade_name',
            'cycle',
            'amount',
            'amount_min',
            'amount_max',
        )
        model = models.ChemicalFertilizer


class VarietySerializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'crop',
            'state',
            'variety_name',
            'seed_rate',
            'sowing_time',
            'duration',
            'average_yield',
            'height',
            'features',
            'suitable_regions',
            'tolerant_to',
            'added',
            'v_image',
            'seed_rate_min',
            'seed_rate_max',
            'duration_min',
            'duration_max',
            'average_yield_min',
            'average_yield_max',
            'height_min',
            'height_max',

        )
        model = models.Variety