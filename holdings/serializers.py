from rest_framework import serializers

from accounts.choices import Currency, HoldingType
from accounts.models import Account
from holdings.models import Holding, Capital
from services.common_utils import format_decimals


class CapitalSerializer(serializers.ModelSerializer):
    user = serializers.SlugRelatedField(
        # Slug related to display a field in the response
        # instead of showing the id of that foreign key
        many=False,
        queryset=Account.objects.all(),
        slug_field='username'
    )

    class Meta:
        model = Capital
        fields = '__all__'


class CapitalSerializerForAccount(serializers.ModelSerializer):
    class Meta:
        model = Capital
        exclude = ['user']


class CapitalSerializerForHolding(serializers.ModelSerializer):
    class Meta:
        model = Capital
        exclude = ['user']


class HoldingSerializer(serializers.ModelSerializer):
    user = serializers.SlugRelatedField(
        many=False,
        read_only=True,
        slug_field='username'
    )

    def create(self, validated_data):
        validated_data['user'] = self.context['request'].user
        symbol = validated_data.get('symbol')
        validated_data['type'] = HoldingType.STOCK
        if "-" in symbol:
            validated_data['type'] = HoldingType.CRYPTO
        return super(HoldingSerializer, self).create(validated_data)

    class Meta:
        model = Holding
        read_only_fields = ['type', 'user']
        fields = '__all__'


class HoldingSerializerForOverview(serializers.ModelSerializer):
    class Meta:
        model = Holding
        fields = ['quantity', 'type', 'symbol']


# Dataclasses
class CustomDecimalField(serializers.RelatedField):
    def to_representation(self, value):
        return format_decimals(value)


class PriceSerializer(serializers.Serializer):
    purchase = CustomDecimalField(read_only=True)
    current = CustomDecimalField(read_only=True)


class ChangeSerializer(serializers.Serializer):
    value = CustomDecimalField(read_only=True)
    percentage = CustomDecimalField(read_only=True)


class HoldingDataSerializer(serializers.Serializer):
    symbol = serializers.CharField()
    name = serializers.CharField()
    exchange = serializers.CharField()
    quantity = CustomDecimalField(read_only=True)
    price = PriceSerializer()
    change_24H = ChangeSerializer()
    gain = ChangeSerializer()
    value = PriceSerializer()
    date = serializers.DateField()
    type = serializers.ChoiceField(choices=HoldingType.choices)
    currency = serializers.ChoiceField(choices=Currency.choices)


class SumSerializer(serializers.Serializer):
    stock = CustomDecimalField(read_only=True)
    crypto = CustomDecimalField(read_only=True)
    total = CustomDecimalField(read_only=True)


class ChangeOverviewSerializer(serializers.Serializer):
    crypto = ChangeSerializer()
    stock = ChangeSerializer()
    total = ChangeSerializer()


class OverviewSerializer(serializers.Serializer):
    current = SumSerializer()
    capital = SumSerializer()
    purchase = SumSerializer()
    change_purchase = ChangeOverviewSerializer()
    change_capital = ChangeOverviewSerializer()
    change_daily = ChangeOverviewSerializer()


class TotalDataSerializer(serializers.Serializer):
    price = PriceSerializer()
    gain = ChangeSerializer()


class HoldingsDataSerializer(serializers.Serializer):
    symbol = serializers.CharField()
    type = serializers.CharField()
    exchange = serializers.CharField()
    name = serializers.CharField()
    entities = HoldingDataSerializer(many=True)
    average = HoldingDataSerializer()


class PortfolioSerializer(serializers.Serializer):
    holdings_data = HoldingsDataSerializer(many=True)
    overview = OverviewSerializer()
    user = serializers.CharField()
    currency = serializers.CharField()


class SearchSerializer(serializers.Serializer):
    exchange = serializers.CharField()
    shortname = serializers.CharField(default='')
    quoteType = serializers.CharField()
    symbol = serializers.CharField()
    typeDisp = serializers.CharField()
    longname = serializers.CharField(default='')
    exchDisp = serializers.CharField()
