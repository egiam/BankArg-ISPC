import json
from django.http import JsonResponse
from django.shortcuts import render
from django.views import View

from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt

# from mysqlx import View

# Create your views here.
from rest_framework import viewsets, status, generics

# from rest_framework.authentication import (
#     SessionAuthentication,
#     BasicAuthentication,
#     TokenAuthentication,
# )
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth import get_user_model, authenticate, login, logout

from knox.models import AuthToken

from bankarg_ispc.models import (
    Prestamos,
    Documentos,
    Persona,
    Cuenta,
    Transferencias,
    Plazo_fijo,
    Paises,
    Provincias,
    Localidades,
    Sexos,
)
from .serializers import UserSerializer, RegisterSerializer, PersonaSerializer
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
    def get(self, request, prestamo_id=0):
        if prestamo_id > 0:
            prestamo = list(Prestamos.objects.filter(prestamo_id=prestamo_id).values())
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
            prestamo_id=jsDatos["prestamo_id"],
            id_cuenta_id=jsDatos["id_cuenta"],
            monto=jsDatos["monto"],
            interes_mes=jsDatos["interes_mes"],
            fec_start=jsDatos["fec_start"],
            fec_venc=jsDatos["fec_venc"],
            id_tipo_prestamo_id=jsDatos["id_tipo_prestamo"],
            id_tipo_estado_prestamo_id=jsDatos["id_tipo_estado_prestamo"],
            id_tipo_moneda_id=jsDatos["id_tipo_moneda"],
            id_tipo_interes_id=jsDatos["id_tipo_interes"],
            id_tipo_cuota_id=jsDatos["id_tipo_cuota"],
            id_tipo_estado_cuota_id=jsDatos["id_tipo_estado_cuota"],
            id_cantidad_cuota_id=jsDatos["id_cantidad_cuota"],
        )
        return JsonResponse({"message": "Prestamo creado"}, safe=False)

    def put(self, request, prestamo_id=0):
        jsDatos = json.loads(request.body)
        prestamo = list(Prestamos.objects.filter(prestamo_id=prestamo_id).values())
        if len(prestamo) > 0:
            prestamo = Prestamos.objects.get(prestamo_id=prestamo_id)
            prestamo.id_cuenta_id = jsDatos["id_cuenta_id"]
            prestamo.monto = jsDatos["monto"]
            prestamo.interes_mes = jsDatos["interes_mes"]
            prestamo.fec_start = jsDatos["fec_start"]
            prestamo.fec_venc = jsDatos["fec_venc"]
            prestamo.id_tipo_prestamo_id = jsDatos["id_tipo_prestamo_id"]
            prestamo.id_tipo_estado_prestamo_id = jsDatos["id_tipo_estado_prestamo_id"]
            prestamo.id_tipo_moneda_id = jsDatos["id_tipo_moneda_id"]
            prestamo.id_tipo_interes_id = jsDatos["id_tipo_interes_id"]
            prestamo.id_tipo_cuota_id = jsDatos["id_tipo_cuota_id"]
            prestamo.id_tipo_estado_cuota_id = jsDatos["id_tipo_estado_cuota_id"]
            prestamo.id_cantidad_cuota_id = jsDatos["id_cantidad_cuota_id"]
            prestamo.save()
            return JsonResponse({"message": "Prestamo actualizado"}, safe=False)
        else:
            return JsonResponse({"message": "No existe el prestamo"}, safe=False)

    def delete(self, request, prestamo_id=0):
        prestamo = list(Prestamos.objects.filter(prestamo_id=prestamo_id).values())
        if len(prestamo) > 0:
            prestamo = Prestamos.objects.get(prestamo_id=prestamo_id)
            prestamo.delete()
            return JsonResponse({"message": "Prestamo eliminado"}, safe=False)
        else:
            return JsonResponse({"message": "No existe el prestamo"}, safe=False)


class DocumentosView(APIView):
    def get(self, request, documento_id=0):
        if documento_id > 0:
            documento = list(
                Documentos.objects.filter(documento_id=documento_id).values()
            )
            if len(documento) > 0:
                return JsonResponse(documento[0], safe=False)
            else:
                return JsonResponse({"message": "No existe el documento"}, safe=False)

        documentos = list(Documentos.objects.values())

        if len(documentos) > 0:
            return JsonResponse(documentos, safe=False)
        else:
            return JsonResponse({"message": "No existen documentos"}, safe=False)

    def post(self, request):
        jsDatos = json.loads(request.body)
        Documentos.objects.create(
            id_tipo_doc=jsDatos["id_tipo_doc"],
            tipo_doc=jsDatos["tipo_doc"],
        )
        return JsonResponse({"message": "Documento creado"}, safe=False)

    def put(self, request, documento_id=0):
        jsDatos = json.loads(request.body)
        documento = list(Documentos.objects.filter(documento_id=documento_id).values())
        if len(documento) > 0:
            documento = Documentos.objects.get(documento_id=documento_id)
            documento.tipo_doc = jsDatos["tipo_doc"]
            documento.save()
            return JsonResponse({"message": "Documento actualizado"}, safe=False)
        else:
            return JsonResponse({"message": "No existe el documento"}, safe=False)

    def delete(self, request, documento_id=0):
        documento = list(Documentos.objects.filter(documento_id=documento_id).values())
        if len(documento) > 0:
            documento = Documentos.objects.get(documento_id=documento_id)
            documento.delete()
            return JsonResponse({"message": "Documento eliminado"}, safe=False)
        else:
            return JsonResponse({"message": "No existe el documento"}, safe=False)


class PaisesView(APIView):
    def get(self, request, pais_id=0):
        if pais_id > 0:
            pais = list(Paises.objects.filter(pais_id=pais_id).values())
            if len(pais) > 0:
                return JsonResponse(pais[0], safe=False)
            else:
                return JsonResponse({"message": "No existe el pais"}, safe=False)

        paises = list(Paises.objects.values())

        if len(paises) > 0:
            return JsonResponse(paises, safe=False)
        else:
            return JsonResponse({"message": "No existen paises"}, safe=False)

    def post(self, request):
        jsDatos = json.loads(request.body)
        Paises.objects.create(
            cod_pais=jsDatos["cod_pais"],
            pais=jsDatos["pais"],
        )
        return JsonResponse({"message": "Pais creado"}, safe=False)

    def put(self, request, pais_id=0):
        jsDatos = json.loads(request.body)
        pais = list(Paises.objects.filter(pais_id=pais_id).values())
        if len(pais) > 0:
            pais = Paises.objects.get(pais_id=pais_id)
            pais.pais = jsDatos["pais"]
            pais.save()
            return JsonResponse({"message": "Pais actualizado"}, safe=False)
        else:
            return JsonResponse({"message": "No existe el pais"}, safe=False)

    def delete(self, request, pais_id=0):
        pais = list(Paises.objects.filter(pais_id=pais_id).values())
        if len(pais) > 0:
            pais = Paises.objects.get(pais_id=pais_id)
            pais.delete()
            return JsonResponse({"message": "Pais eliminado"}, safe=False)
        else:
            return JsonResponse({"message": "No existe el pais"}, safe=False)


class ProvinciasView(APIView):
    def get(self, request, provincia_id=0):
        if provincia_id > 0:
            provincia = list(
                Provincias.objects.filter(provincia_id=provincia_id).values()
            )
            if len(provincia) > 0:
                return JsonResponse(provincia[0], safe=False)
            else:
                return JsonResponse({"message": "No existe la provincia"}, safe=False)

        provincias = list(Provincias.objects.values())

        if len(provincias) > 0:
            return JsonResponse(provincias, safe=False)
        else:
            return JsonResponse({"message": "No existen provincias"}, safe=False)

    def post(self, request):
        jsDatos = json.loads(request.body)
        Provincias.objects.create(
            cod_provincia=jsDatos["cod_provincia"],
            provincia=jsDatos["provincia"],
            cod_pais_id=jsDatos["cod_pais"],
        )
        return JsonResponse({"message": "Provincia creada"}, safe=False)

    def put(self, request, provincia_id=0):
        jsDatos = json.loads(request.body)
        provincia = list(Provincias.objects.filter(provincia_id=provincia_id).values())
        if len(provincia) > 0:
            provincia = Provincias.objects.get(provincia_id=provincia_id)
            provincia.provincia = jsDatos["provincia"]
            provincia.cod_pais_id = jsDatos["cod_pais_id"]
            provincia.save()
            return JsonResponse({"message": "Provincia actualizada"}, safe=False)
        else:
            return JsonResponse({"message": "No existe la provincia"}, safe=False)

    def delete(self, request, provincia_id=0):
        provincia = list(Provincias.objects.filter(provincia_id=provincia_id).values())
        if len(provincia) > 0:
            provincia = Provincias.objects.get(provincia_id=provincia_id)
            provincia.delete()
            return JsonResponse({"message": "Provincia eliminada"}, safe=False)
        else:
            return JsonResponse({"message": "No existe la provincia"}, safe=False)


class LocalidadesView(APIView):
    def get(self, request, localidad_id=0):
        if localidad_id > 0:
            localidad = list(
                Localidades.objects.filter(localidad_id=localidad_id).values()
            )
            if len(localidad) > 0:
                return JsonResponse(localidad[0], safe=False)
            else:
                return JsonResponse({"message": "No existe la localidad"}, safe=False)

        localidades = list(Localidades.objects.values())

        if len(localidades) > 0:
            return JsonResponse(localidades, safe=False)
        else:
            return JsonResponse({"message": "No existen localidades"}, safe=False)

    def post(self, request):
        jsDatos = json.loads(request.body)
        Localidades.objects.create(
            cod_localidad=jsDatos["cod_localidad"],
            localidad=jsDatos["localidad"],
            cod_provincia_id=jsDatos["cod_provincia"],
        )
        return JsonResponse({"message": "Localidad creada"}, safe=False)

    def put(self, request, localidad_id=0):
        jsDatos = json.loads(request.body)
        localidad = list(Localidades.objects.filter(localidad_id=localidad_id).values())
        if len(localidad) > 0:
            localidad = Localidades.objects.get(localidad_id=localidad_id)
            localidad.localidad = jsDatos["localidad"]
            localidad.cod_provincia_id = jsDatos["cod_provincia_id"]
            localidad.save()
            return JsonResponse({"message": "Localidad actualizada"}, safe=False)
        else:
            return JsonResponse({"message": "No existe la localidad"}, safe=False)

    def delete(self, request, localidad_id=0):
        localidad = list(Localidades.objects.filter(localidad_id=localidad_id).values())
        if len(localidad) > 0:
            localidad = Localidades.objects.get(localidad_id=localidad_id)
            localidad.delete()
            return JsonResponse({"message": "Localidad eliminada"}, safe=False)
        else:
            return JsonResponse({"message": "No existe la localidad"}, safe=False)


class SexosView(APIView):
    def get(self, request, sexo_id=0):
        if sexo_id > 0:
            sexo = list(Sexos.objects.filter(sexo_id=sexo_id).values())
            if len(sexo) > 0:
                return JsonResponse(sexo[0], safe=False)
            else:
                return JsonResponse({"message": "No existe el sexo"}, safe=False)

        sexos = list(Sexos.objects.values())

        if len(sexos) > 0:
            return JsonResponse(sexos, safe=False)
        else:
            return JsonResponse({"message": "No existen sexos"}, safe=False)

    def post(self, request):
        jsDatos = json.loads(request.body)
        Sexos.objects.create(
            id_tipo_sexo=jsDatos["id_tipo_sexo"],
            tipo=jsDatos["tipo"],
        )
        return JsonResponse({"message": "Sexo creado"}, safe=False)

    def put(self, request, sexo_id=0):
        jsDatos = json.loads(request.body)
        sexo = list(Sexos.objects.filter(sexo_id=sexo_id).values())
        if len(sexo) > 0:
            sexo = Sexos.objects.get(sexo_id=sexo_id)
            sexo.tipo = jsDatos["tipo"]
            sexo.save()
            return JsonResponse({"message": "Sexo actualizado"}, safe=False)
        else:
            return JsonResponse({"message": "No existe el sexo"}, safe=False)

    def delete(self, request, sexo_id=0):
        sexo = list(Sexos.objects.filter(sexo_id=sexo_id).values())
        if len(sexo) > 0:
            sexo = Sexos.objects.get(sexo_id=sexo_id)
            sexo.delete()
            return JsonResponse({"message": "Sexo eliminado"}, safe=False)
        else:
            return JsonResponse({"message": "No existe el sexo"}, safe=False)


class PersonaView(APIView):
    queryset = Persona.objects.all()
    serializer_class = PersonaSerializer

    def get(self, request, id_persona=0):
        if id_persona > 0:
            persona = list(Persona.objects.filter(id_persona=id_persona).values())
            if len(persona) > 0:
                return JsonResponse(persona[0], safe=False)
            else:
                return JsonResponse({"message": "No existe la persona"}, safe=False)

        personas = list(Persona.objects.values())

        if len(personas) > 0:
            return JsonResponse(personas, safe=False)
        else:
            return JsonResponse({"message": "No existen personas"}, safe=False)

    def post(self, request, format=None):
        serializer = PersonaSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=201)
        return JsonResponse(serializer.errors, status=404)

    def put(self, request, id_persona=0):
        persona = list(Persona.objects.filter(id_persona=id_persona).values())
        if len(persona) > 0:
            persona = Persona.objects.get(id_persona=id_persona)
            serializer = PersonaSerializer(persona, data=request.data)
            if serializer.is_valid():
                serializer.save()
                return JsonResponse(serializer.data)
            return JsonResponse(serializer.errors, status=404)
        else:
            return JsonResponse({"message": "No existe la persona"}, safe=False)

    def delete(self, request, id_persona=0):
        persona = list(Persona.objects.filter(id_persona=id_persona).values())
        if len(persona) > 0:
            persona = Persona.objects.get(id_persona=id_persona)
            persona.delete()
            return JsonResponse({"message": "Persona eliminada"}, safe=False)
        else:
            return JsonResponse({"message": "No existe la persona"}, safe=False)

    # @method_decorator(csrf_exempt)
    # def get(self, request, id_persona=0):
    #     if id_persona > 0:
    #         persona = list(Persona.objects.filter(id_persona=id_persona).values())
    #         if len(persona) > 0:
    #             return JsonResponse(persona[0], safe=False)
    #         else:
    #             return JsonResponse({"message": "No existe la persona"}, safe=False)

    #     personas = list(Persona.objects.values())

    #     if len(personas) > 0:
    #         return JsonResponse(personas, safe=False)
    #     else:
    #         return JsonResponse({"message": "No existen personas"}, safe=False)

    # def post(self, request):
    #     jsDatos = json.loads(request.body)
    #     Persona.objects.create(
    #         id_persona=jsDatos["id_persona"],
    #         nombre=jsDatos["nombre"],
    #         apellido=jsDatos["apellido"],
    #         id_tipo_doc_id=jsDatos["id_tipo_doc"],
    #         nro_doc=jsDatos["nro_doc"],
    #         cod_loc_id=jsDatos["cod_loc"],
    #         nro_calle=jsDatos["nro_calle"],
    #         calle=jsDatos["calle"],
    #         fecha_nac=jsDatos["fecha_nac"],
    #         id_tipo_sexo_id=jsDatos["id_tipo_sexo"],
    #     )
    #     return JsonResponse({"message": "Persona creada"}, safe=False)

    # def put(self, request, id_persona=0):
    #     jsDatos = json.loads(request.body)
    #     persona = list(Persona.objects.filter(id_persona=id_persona).values())
    #     if len(persona) > 0:
    #         persona = Persona.objects.get(id_persona=id_persona)
    #         persona.nombre = jsDatos["nombre"]
    #         persona.apellido = jsDatos["apellido"]
    #         persona.id_tipo_doc_id = jsDatos["id_tipo_doc_id"]
    #         persona.nro_doc = jsDatos["nro_doc"]
    #         persona.cod_loc_id = jsDatos["cod_loc_id"]
    #         persona.nro_calle = jsDatos["nro_calle"]
    #         persona.calle = jsDatos["calle"]
    #         persona.fecha_nac = jsDatos["fecha_nac"]
    #         persona.id_tipo_sexo_id = jsDatos["id_tipo_sexo_id"]
    #         persona.save()
    #         return JsonResponse({"message": "Persona actualizada"}, safe=False)
    #     else:
    #         return JsonResponse({"message": "No existe la persona"}, safe=False)

    # def delete(self, request, id_persona=0):
    #     persona = list(Persona.objects.filter(id_persona=id_persona).values())
    #     if len(persona) > 0:
    #         persona = Persona.objects.get(id_persona=id_persona)
    #         persona.delete()
    #         return JsonResponse({"message": "Persona eliminada"}, safe=False)
    #     else:
    #         return JsonResponse({"message": "No existe la persona"}, safe=False)


class CuentaView(APIView):
    def get(self, request, id_cuenta=0):
        if id_cuenta > 0:
            cuenta = list(Cuenta.objects.filter(id_cuenta=id_cuenta).values())
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
            id_cuenta=jsDatos["id_cuenta"],
            id_cliente_id=jsDatos["id_cliente"],
            id_tipo_cuenta_id=jsDatos["id_tipo_cuenta"],
            id_tipo_moneda_id=jsDatos["id_tipo_moneda"],
            id_tipo_estado_moneda_id=jsDatos["id_tipo_estado_moneda"],
            monto=jsDatos["monto"],
            fecha_creacion=jsDatos["fecha_creacion"],
            cbu=jsDatos["cbu"],
            alias=jsDatos["alias"],
            password=jsDatos["password"],
            credito=jsDatos["credito"],
            debito=jsDatos["debito"],
        )
        return JsonResponse({"message": "Cuenta creada"}, safe=False)

    def put(self, request, id_cuenta=0):
        jsDatos = json.loads(request.body)
        cuenta = list(Cuenta.objects.filter(id_cuenta=id_cuenta).values())
        if len(cuenta) > 0:
            cuenta = Cuenta.objects.get(id_cuenta=id_cuenta)
            cuenta.id_cliente_id = jsDatos["id_cliente_id"]
            cuenta.id_tipo_cuenta_id = jsDatos["id_tipo_cuenta_id"]
            cuenta.id_tipo_moneda_id = jsDatos["id_tipo_moneda_id"]
            cuenta.id_tipo_estado_moneda_id = jsDatos["id_tipo_estado_moneda_id"]
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

    def delete(self, request, id_cuenta=0):
        cuenta = list(Cuenta.objects.filter(id_cuenta=id_cuenta).values())
        if len(cuenta) > 0:
            cuenta = Cuenta.objects.get(id_cuenta=id_cuenta)
            cuenta.delete()
            return JsonResponse({"message": "Cuenta eliminada"}, safe=False)
        else:
            return JsonResponse({"message": "No existe la cuenta"}, safe=False)


class TransferenciasView(APIView):
    def get(self, request, id_transferencia=0):
        if id_transferencia > 0:
            transferencia = list(
                Transferencias.objects.filter(
                    id_transferencia=id_transferencia
                ).values()
            )
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
            id_transferencia=jsDatos["id_transferencia"],
            id_tipo_transferencia_id=jsDatos["id_tipo_estado_moneda"],
            id_cliente_id_id=jsDatos["id_cliente"],
            fecha=jsDatos["fecha"],
            monto=jsDatos["monto"],
            cuenta_envio=jsDatos["cuenta_envio"],
            cuenta_recibo=jsDatos["cuenta_recibo"],
        )
        return JsonResponse({"message": "Transferencia creada"}, safe=False)

    def put(self, request, id_transferencia=0):
        jsDatos = json.loads(request.body)
        transferencia = list(
            Transferencias.objects.filter(id_transferencia=id_transferencia).values()
        )
        if len(transferencia) > 0:
            transferencia = Transferencias.objects.get(
                id_transferencia=id_transferencia
            )
            transferencia.id_tipo_transferencia_id = jsDatos["id_tipo_transferencia_id"]
            transferencia.id_cliente_id = jsDatos["id_cliente_id"]
            transferencia.fecha = jsDatos["fecha"]
            transferencia.monto = jsDatos["monto"]
            transferencia.cuenta_envio = jsDatos["cuenta_envio"]
            transferencia.cuenta_recibo = jsDatos["cuenta_recibo"]
            transferencia.save()
            return JsonResponse({"message": "Transferencia actualizada"}, safe=False)
        else:
            return JsonResponse({"message": "No existe la transferencia"}, safe=False)

    def delete(self, request, id_transferencia=0):
        transferencia = list(
            Transferencias.objects.filter(id_transferencia=id_transferencia).values()
        )
        if len(transferencia) > 0:
            transferencia = Transferencias.objects.get(
                id_transferencia=id_transferencia
            )
            transferencia.delete()
            return JsonResponse({"message": "Transferencia eliminada"}, safe=False)
        else:
            return JsonResponse({"message": "No existe la transferencia"}, safe=False)


class Plazo_fijoView(APIView):
    def get(self, request, id_plazo_fijo=0):
        if id_plazo_fijo > 0:
            plazo_fijo = list(
                Plazo_fijo.objects.filter(id_plazo_fijo=id_plazo_fijo).values()
            )
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
            id_plazo_fijo=jsDatos["id_plazo_fijo"],
            # id_cliente=jsDatos["id_cliente"],
            id_cuenta_id=jsDatos["id_cuenta"],
            id_tipo_moneda_id=jsDatos["id_tipo_moneda"],
            monto=jsDatos["monto"],
            fecha_inicio=jsDatos["fecha_inicio"],
            fecha_vencimiento=jsDatos["fecha_vencimiento"],
            interes=jsDatos["interes"],
        )
        return JsonResponse({"message": "Plazo fijo creado"}, safe=False)

    def put(self, request, id_plazo_fijo=0):
        jsDatos = json.loads(request.body)
        plazo_fijo = list(
            Plazo_fijo.objects.filter(id_plazo_fijo=id_plazo_fijo).values()
        )
        if len(plazo_fijo) > 0:
            plazo_fijo = Plazo_fijo.objects.get(id_plazo_fijo=id_plazo_fijo)
            plazo_fijo.id_cuenta_id = jsDatos["id_cuenta_id"]
            plazo_fijo.id_tipo_moneda_id = jsDatos["id_tipo_moneda_id"]
            plazo_fijo.monto = jsDatos["monto"]
            plazo_fijo.fecha_inicio = jsDatos["fecha_inicio"]
            plazo_fijo.fecha_vencimiento = jsDatos["fecha_vencimiento"]
            plazo_fijo.interes = jsDatos["interes"]
            plazo_fijo.save()
            return JsonResponse({"message": "Plazo fijo actualizado"}, safe=False)
        else:
            return JsonResponse({"message": "No existe el plazo fijo"}, safe=False)

    def delete(self, request, id_plazo_fijo=0):
        plazo_fijo = list(
            Plazo_fijo.objects.filter(id_plazo_fijo=id_plazo_fijo).values()
        )
        if len(plazo_fijo) > 0:
            plazo_fijo = Plazo_fijo.objects.get(id_plazo_fijo=id_plazo_fijo)
            plazo_fijo.delete()
            return JsonResponse({"message": "Plazo fijo eliminado"}, safe=False)
        else:
            return JsonResponse({"message": "No existe el plazo fijo"}, safe=False)
