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
    Tipos_transferencias,
    Clientes,
    Tipo_moneda,
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


class PersonaGralSerializer(serializers.ModelSerializer):
    id_tipo_doc = DocumentosSerializer()
    cod_loc = LocalidadesSerializer()
    id_tipo_sexo = SexosSerializer()

    class Meta:
        model = Persona
        fields = "__all__"


class PersonaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Persona
        fields = "__all__"


class CuentaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cuenta
        fields = "__all__"


class TipoTransfereciaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tipos_transferencias
        fields = "__all__"


class ClientesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Clientes
        fields = "__all__"


class TransferenciasGralSerializer(serializers.ModelSerializer):
    id_tipo_transferencia = TipoTransfereciaSerializer()
    id_cliente = ClientesSerializer()

    class Meta:
        model = Transferencias
        fields = "__all__"


class TransferenciasSerializer(serializers.ModelSerializer):
    class Meta:
        model = Transferencias
        fields = "__all__"


class Tipo_monedaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tipo_moneda
        fields = "__all__"


class Plazo_fijoGralSerializer(serializers.ModelSerializer):
    id_tipo_moneda = Tipo_monedaSerializer()
    id_cuenta = CuentaSerializer()

    class Meta:
        model = Plazo_fijo
        fields = "__all__"


class Plazo_fijoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Plazo_fijo
        fields = "__all__"
