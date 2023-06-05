import json
from django.http import JsonResponse
from django.shortcuts import render
from django.views import View

# from mysqlx import View

# Create your views here.
from rest_framework import viewsets, status, generics
from rest_framework.authentication import (
    SessionAuthentication,
    BasicAuthentication,
    TokenAuthentication,
)
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth import get_user_model, authenticate, login, logout

from knox.models import AuthToken

from bankarg_ispc.models import Prestamos, Persona, Cuenta, Transferencias, Plazo_fijo
from .serializers import UserSerializer, RegisterSerializer
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions

# from rest_framework.authtoken.serializers import AuthTokenSerializer
# from knox.views import LoginView as KnoxLoginView


# class LoginView(KnoxLoginView):
#     permission_classes = (permissions.AllowAny,)

# def post(self, request, format=None):
#     serializer = AuthTokenSerializer(data=request.data)
#     serializer.is_valid(raise_exception=True)
#     user = serializer.validated_data["user"]
#     login(request, user)
#     return super(LoginView, self).post(request, format=None)


class LoginView(APIView):
    # authentication_classes = [
    #     SessionAuthentication,
    #     BasicAuthentication,
    # ]
    # permission_classes = [
    #     IsAuthenticated,
    # ]

    def post(self, request):
        # Recuperamos credenciales y autenticamos al usuario
        email = request.data.get("email", None)
        password = request.data.get("password", None)
        user = authenticate(email=email, password=password)

        # Si es correcto añadimos a la request la info de sesion
        if user:
            login(request, user)
            return Response(
                UserSerializer(user).data,
                status=status.HTTP_200_OK,
            )

        # Si no es correcto devolvemos un error
        return Response(
            {"detail": "Credenciales incorrectas"}, status=status.HTTP_401_UNAUTHORIZED
        )


class LogoutView(APIView):
    def post(self, request):
        # Hacemos logout
        logout(request)
        return Response({"detail": "Logout correcto"}, status=status.HTTP_200_OK)


class SignupView(generics.CreateAPIView):
    """
    Endpoint de registro de usuarios.
    """

    serializer_class = UserSerializer


# class UserViewSet(viewsets.ModelViewSet):
#     """
#     UserModel View.
#     """

#     permission_classes = (IsAuthenticated,)
#     serializer_class = UserSerializer
#     queryset = get_user_model().objects.all()


# Register
class RegisterView(generics.CreateAPIView):
    serializer_class = RegisterSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        return Response(
            {
                "user": UserSerializer(
                    user, context=self.get_serializer_context()
                ).data,
                "token": AuthToken.objects.create(user)[1],
            }
        )


class PrestamoView(APIView):
    def get(self, request, id=0):
        if id > 0:
            prestamo = list(Prestamos.objects.filter(id=id).values())
            if len(prestamos) > 0:
                return JsonResponse(prestamo[0], safe=False)
            else:
                return JsonResponse({"message": "No existe el prestamo"}, safe=False)

        prestamos = list(Prestamos.objects.values())

        if len(prestamos) > 0:
            return JsonResponse(prestamos, safe=False)
        else:
            return JsonResponse({"message": "No existen prestamos"}, safe=False)

    def post(self, request):
        jsDatos = json.loads(request.body)
        Prestamos.objects.create(
            id=jsDatos["id"],
            id_cuenta=jsDatos["id_cuenta"],
            monto=jsDatos["monto"],
            interes_mes=jsDatos["interes_mes"],
            fec_start=jsDatos["fec_start"],
            fec_venc=jsDatos["fec_venc"],
            id_tipo_prestamo=jsDatos["id_tipo_prestamo"],
            id_tipo_estado_prestamo=jsDatos["id_tipo_estado_prestamo"],
            id_tipo_moneda=jsDatos["id_tipo_moneda"],
            id_tipo_interes=jsDatos["id_tipo_interes"],
            id_tipo_cuota=jsDatos["id_tipo_cuota"],
            id_tipo_estado_cuota=jsDatos["id_tipo_estado_cuota"],
            id_cantidad_cuota=jsDatos["id_cantidad_cuota"],
        )
        return JsonResponse({"message": "Prestamo creado"}, safe=False)

    def put(self, request, id=0):
        jsDatos = json.loads(request.body)
        prestamo = list(Prestamos.objects.filter(id=id).values())
        if len(prestamo) > 0:
            prestamo = Prestamos.objects.get(id=id)
            prestamo.id_cuenta = jsDatos["id_cuenta"]
            prestamo.monto = jsDatos["monto"]
            prestamo.interes_mes = jsDatos["interes_mes"]
            prestamo.fec_start = jsDatos["fec_start"]
            prestamo.fec_venc = jsDatos["fec_venc"]
            prestamo.id_tipo_prestamo = jsDatos["id_tipo_prestamo"]
            prestamo.id_tipo_estado_prestamo = jsDatos["id_tipo_estado_prestamo"]
            prestamo.id_tipo_moneda = jsDatos["id_tipo_moneda"]
            prestamo.id_tipo_interes = jsDatos["id_tipo_interes"]
            prestamo.id_tipo_cuota = jsDatos["id_tipo_cuota"]
            prestamo.id_tipo_estado_cuota = jsDatos["id_tipo_estado_cuota"]
            prestamo.id_cantidad_cuota = jsDatos["id_cantidad_cuota"]
            prestamo.save()
            return JsonResponse({"message": "Prestamo actualizado"}, safe=False)
        else:
            return JsonResponse({"message": "No existe el prestamo"}, safe=False)

    def delete(self, request, id=0):
        prestamo = list(Prestamos.objects.filter(id=id).values())
        if len(prestamo) > 0:
            prestamo = Prestamos.objects.get(id=id)
            prestamo.delete()
            return JsonResponse({"message": "Prestamo eliminado"}, safe=False)
        else:
            return JsonResponse({"message": "No existe el prestamo"}, safe=False)


class PersonaView(APIView):
    def get(self, request, id=0):
        if id > 0:
            persona = list(Persona.objects.filter(id=id).values())
            if len(persona) > 0:
                return JsonResponse(persona[0], safe=False)
            else:
                return JsonResponse({"message": "No existe la persona"}, safe=False)

        personas = list(Persona.objects.values())

        if len(personas) > 0:
            return JsonResponse(personas, safe=False)
        else:
            return JsonResponse({"message": "No existen personas"}, safe=False)

    def post(self, request):
        jsDatos = json.loads(request.body)
        Persona.objects.create(
            id=jsDatos["id"],
            nombre=jsDatos["nombre"],
            apellido=jsDatos["apellido"],
            id_tipo_doc=jsDatos["id_tipo_doc"],
            nro_doc=jsDatos["nro_doc"],
            cod_loc=jsDatos["cod_loc"],
            nro_calle=jsDatos["nro_calle"],
            calle=jsDatos["calle"],
            fecha_nac=jsDatos["fecha_nac"],
            id_tipo_sexo=jsDatos["id_tipo_sexo"],
        )
        return JsonResponse({"message": "Persona creada"}, safe=False)

    def put(self, request, id=0):
        jsDatos = json.loads(request.body)
        persona = list(Persona.objects.filter(id=id).values())
        if len(persona) > 0:
            persona = Persona.objects.get(id=id)
            persona.nombre = jsDatos["nombre"]
            persona.apellido = jsDatos["apellido"]
            persona.id_tipo_doc = jsDatos["id_tipo_doc"]
            persona.nro_doc = jsDatos["nro_doc"]
            persona.cod_loc = jsDatos["cod_loc"]
            persona.nro_calle = jsDatos["nro_calle"]
            persona.calle = jsDatos["calle"]
            persona.fecha_nac = jsDatos["fecha_nac"]
            persona.id_tipo_sexo = jsDatos["id_tipo_sexo"]
            persona.save()
            return JsonResponse({"message": "Persona actualizada"}, safe=False)
        else:
            return JsonResponse({"message": "No existe la persona"}, safe=False)

    def delete(self, request, id=0):
        persona = list(Persona.objects.filter(id=id).values())
        if len(persona) > 0:
            persona = Persona.objects.get(id=id)
            persona.delete()
            return JsonResponse({"message": "Persona eliminada"}, safe=False)
        else:
            return JsonResponse({"message": "No existe la persona"}, safe=False)


class CuentaView(APIView):
    def get(self, request, id=0):
        if id > 0:
            cuenta = list(Cuenta.objects.filter(id=id).values())
            if len(cuenta) > 0:
                return JsonResponse(cuenta[0], safe=False)
            else:
                return JsonResponse({"message": "No existe la cuenta"}, safe=False)

        cuentas = list(Cuenta.objects.values())

        if len(cuentas) > 0:
            return JsonResponse(cuentas, safe=False)
        else:
            return JsonResponse({"message": "No existen cuentas"}, safe=False)

    def post(self, request):
        jsDatos = json.loads(request.body)
        Cuenta.objects.create(
            id=jsDatos["id"],
            id_cliente=jsDatos["id_cliente"],
            id_tipo_cuenta=jsDatos["id_tipo_cuenta"],
            id_tipo_moneda=jsDatos["id_tipo_moneda"],
            id_tipo_estado_moneda=jsDatos["id_tipo_estado_moneda"],
            monto=jsDatos["monto"],
            fecha_creacion=jsDatos["fecha_creacion"],
            cbu=jsDatos["cbu"],
            alias=jsDatos["alias"],
            password=jsDatos["password"],
            credito=jsDatos["credito"],
            debito=jsDatos["debito"],
        )
        return JsonResponse({"message": "Cuenta creada"}, safe=False)

    def put(self, request, id=0):
        jsDatos = json.loads(request.body)
        cuenta = list(Cuenta.objects.filter(id=id).values())
        if len(cuenta) > 0:
            cuenta = Cuenta.objects.get(id=id)
            cuenta.id_cliente = jsDatos["id_cliente"]
            cuenta.id_tipo_cuenta = jsDatos["id_tipo_cuenta"]
            cuenta.id_tipo_moneda = jsDatos["id_tipo_moneda"]
            cuenta.id_tipo_estado_moneda = jsDatos["id_tipo_estado_moneda"]
            cuenta.monto = jsDatos["monto"]
            cuenta.fecha_creacion = jsDatos["fecha_creacion"]
            cuenta.cbu = jsDatos["cbu"]
            cuenta.alias = jsDatos["alias"]
            cuenta.password = jsDatos["password"]
            cuenta.credito = jsDatos["credito"]
            cuenta.debito = jsDatos["debito"]
            cuenta.save()
            return JsonResponse({"message": "Cuenta actualizada"}, safe=False)
        else:
            return JsonResponse({"message": "No existe la cuenta"}, safe=False)

    def delete(self, request, id=0):
        cuenta = list(Cuenta.objects.filter(id=id).values())
        if len(cuenta) > 0:
            cuenta = Cuenta.objects.get(id=id)
            cuenta.delete()
            return JsonResponse({"message": "Cuenta eliminada"}, safe=False)
        else:
            return JsonResponse({"message": "No existe la cuenta"}, safe=False)


class TransferenciasView(APIView):
    def get(self, request, id=0):
        if id > 0:
            transferencia = list(Transferencias.objects.filter(id=id).values())
            if len(transferencia) > 0:
                return JsonResponse(transferencia[0], safe=False)
            else:
                return JsonResponse(
                    {"message": "No existe la transferencia"}, safe=False
                )

        transferencias = list(Transferencias.objects.values())

        if len(transferencias) > 0:
            return JsonResponse(transferencias, safe=False)
        else:
            return JsonResponse({"message": "No existen transferencias"}, safe=False)

    def post(self, request):
        jsDatos = json.loads(request.body)
        # Transferencias.objects.create(
        #     id=jsDatos["id"],
        #     id_cuenta_origen=jsDatos["id_cuenta_origen"],
        #     id_cuenta_destino=jsDatos["id_cuenta_destino"],
        #     monto=jsDatos["monto"],
        #     fecha=jsDatos["fecha"],
        #     id_tipo_moneda=jsDatos["id_tipo_moneda"],
        #     id_tipo_estado_moneda=jsDatos["id_tipo_estado_moneda"],
        # )
        transferencia = Transferencias.objects.create(
            id=jsDatos["id"],
            id_tipo_transferencia=jsDatos["id_tipo_estado_moneda"],
            id_cliente=jsDatos["id_cliente"],
            fecha=jsDatos["fecha"],
            monto=jsDatos["monto"],
            cuenta_envio=jsDatos["cuenta_envio"],
            cuenta_recibo=jsDatos["cuenta_recibo"],
        )
        return JsonResponse({"message": "Transferencia creada"}, safe=False)

    def put(self, request, id=0):
        jsDatos = json.loads(request.body)
        transferencia = list(Transferencias.objects.filter(id=id).values())
        if len(transferencia) > 0:
            transferencia = Transferencias.objects.get(id=id)
            transferencia.id_tipo_transferencia = jsDatos["id_tipo_transferencia"]
            transferencia.id_cliente = jsDatos["id_cliente"]
            transferencia.fecha = jsDatos["fecha"]
            transferencia.monto = jsDatos["monto"]
            transferencia.cuenta_envio = jsDatos["cuenta_envio"]
            transferencia.cuenta_recibo = jsDatos["cuenta_recibo"]
            transferencia.save()
            return JsonResponse({"message": "Transferencia actualizada"}, safe=False)
        else:
            return JsonResponse({"message": "No existe la transferencia"}, safe=False)

    def delete(self, request, id=0):
        transferencia = list(Transferencias.objects.filter(id=id).values())
        if len(transferencia) > 0:
            transferencia = Transferencias.objects.get(id=id)
            transferencia.delete()
            return JsonResponse({"message": "Transferencia eliminada"}, safe=False)
        else:
            return JsonResponse({"message": "No existe la transferencia"}, safe=False)


class Plazo_fijoView(APIView):
    def get(self, request, id=0):
        if id > 0:
            plazo_fijo = list(Plazo_fijo.objects.filter(id=id).values())
            if len(plazo_fijo) > 0:
                return JsonResponse(plazo_fijo[0], safe=False)
            else:
                return JsonResponse({"message": "No existe el plazo fijo"}, safe=False)

        plazo_fijo = list(Plazo_fijo.objects.values())

        if len(plazo_fijo) > 0:
            return JsonResponse(plazo_fijo, safe=False)
        else:
            return JsonResponse({"message": "No existen plazos fijos"}, safe=False)

    def post(self, request):
        jsDatos = json.loads(request.body)
        Plazo_fijo.objects.create(
            id=jsDatos["id"],
            # id_cliente=jsDatos["id_cliente"],
            id_cuenta=jsDatos["id_cuenta"],
            id_tipo_moneda=jsDatos["id_tipo_moneda"],
            monto=jsDatos["monto"],
            fecha_inicio=jsDatos["fecha_inicio"],
            fecha_vencimiento=jsDatos["fecha_vencimiento"],
            interes=jsDatos["interes"],
        )
        return JsonResponse({"message": "Plazo fijo creado"}, safe=False)

    def put(self, request, id=0):
        jsDatos = json.loads(request.body)
        plazo_fijo = list(Plazo_fijo.objects.filter(id=id).values())
        if len(plazo_fijo) > 0:
            plazo_fijo = Plazo_fijo.objects.get(id=id)
            plazo_fijo.id_cuenta = jsDatos["id_cuenta"]
            plazo_fijo.id_tipo_moneda = jsDatos["id_tipo_moneda"]
            plazo_fijo.monto = jsDatos["monto"]
            plazo_fijo.fecha_inicio = jsDatos["fecha_inicio"]
            plazo_fijo.fecha_vencimiento = jsDatos["fecha_vencimiento"]
            plazo_fijo.interes = jsDatos["interes"]
            plazo_fijo.save()
            return JsonResponse({"message": "Plazo fijo actualizado"}, safe=False)
        else:
            return JsonResponse({"message": "No existe el plazo fijo"}, safe=False)

    def delete(self, request, id=0):
        plazo_fijo = list(Plazo_fijo.objects.filter(id=id).values())
        if len(plazo_fijo) > 0:
            plazo_fijo = Plazo_fijo.objects.get(id=id)
            plazo_fijo.delete()
            return JsonResponse({"message": "Plazo fijo eliminado"}, safe=False)
        else:
            return JsonResponse({"message": "No existe el plazo fijo"}, safe=False)
