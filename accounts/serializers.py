from rest_framework import serializers
from rest_framework.validators import UniqueValidator
from django.contrib.auth.password_validation import validate_password

from accounts.models import Account
from holdings.models import Capital
from holdings.serializers import CapitalSerializerForAccount


class AccountSerializer(serializers.ModelSerializer):
    capital = CapitalSerializerForAccount()
    password = serializers.CharField(write_only=True, required=True)

    def create(self, validated_data):
        capital_data = validated_data.pop('capital')
        password = validated_data.pop('password')
        account = Account.objects.create(**validated_data)
        account.set_password(password)
        account.save()
        Capital.objects.create(user=account, **capital_data)
        return account

    def update(self, instance, validated_data):
        if 'password' in validated_data:
            password = validated_data.pop('password')
            instance.set_password(password)
        if 'capital' in validated_data:
            capital_data = validated_data.pop('capital')
            capital = instance.capital
            capital.stock = capital_data.get("stock", instance.capital.stock)
            capital.crypto = capital_data.get("crypto", instance.capital.crypto)
            capital.save()
        return super(AccountSerializer, self).update(instance, validated_data)

    class Meta:
        model = Account
        fields = ['id', 'username', 'capital', 'password', 'first_name', 'last_name', 'email', 'currency']


class RegisterSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(
        required=True,
        validators=[UniqueValidator(queryset=Account.objects.all())]
    )

    password = serializers.CharField(write_only=True, required=True, validators=[validate_password])
    password2 = serializers.CharField(write_only=True, required=True)

    class Meta:
        model = Account
        fields = ('username', 'password', 'password2', 'email', 'first_name', 'last_name')
        extra_kwargs = {
            'first_name': {'required': True},
            'last_name': {'required': True}
        }

    def validate(self, attrs):
        if attrs['password'] != attrs['password2']:
            raise serializers.ValidationError({"password": "Password fields didn't match."})

        return attrs

    def create(self, validated_data):
        user = Account.objects.create(
            username=validated_data['username'],
            email=validated_data['email'],
            first_name=validated_data['first_name'],
            last_name=validated_data['last_name']
        )

        user.set_password(validated_data['password'])
        user.save()

        return user


# class CookieTokenRefreshSerializer(TokenRefreshSerializer):
#     refresh = None
#
#     def validate(self, attrs):
#         attrs['refresh'] = self.context['request'].COOKIES.get('refresh_token')
#         if attrs['refresh']:
#             return super().validate(attrs)
#         else:
#             raise InvalidToken('No valid token found in cookie \'refresh_token\'')
