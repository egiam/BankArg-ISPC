from rest_framework import serializers
from django.contrib.auth import get_user_model
from django.contrib.auth.hashers import make_password

from bankarg_ispc.models import (
    CustomUser,
    Persona,
    Prestamos,
    Documentos,
    Paises,
    Provincias,
    Localidades,
    Sexos,
    Cuenta,
    Transferencias,
    Plazo_fijo,
)


# def validate_password(self, value):
#     return make_password(value)


class UserSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(required=True)
    username = serializers.CharField(required=True)
    password = serializers.CharField(min_length=8, write_only=True)

    class Meta:
        model = get_user_model()
        fields = ("email", "username", "password")

    def validate_password(self, value):
        return make_password(value)


# Register Serializer
class RegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ("email", "username", "password")
        extra_kwargs = {"password": {"write_only": True}}

    def create(self, validated_data):
        user = CustomUser.objects.create_user(
            validated_data["username"],
            validated_data["email"],
            validated_data["password"],
        )

        return user


class PersonaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Persona
        fields = "__all__"


class PrestamosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Prestamos
        fields = "__all__"


class DocumentosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Documentos
        fields = "__all__"


class PaisesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Paises
        fields = "__all__"


class ProvinciasSerializer(serializers.ModelSerializer):
    class Meta:
        model = Provincias
        fields = "__all__"


class LocalidadesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Localidades
        fields = "__all__"


class SexosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sexos
        fields = "__all__"


class CuentaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cuenta
        fields = "__all__"


class TransferenciasSerializer(serializers.ModelSerializer):
    class Meta:
        model = Transferencias
        fields = "__all__"


class Plazo_fijoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Plazo_fijo
        fields = "__all__"
