from django.contrib import admin

# Register your models here.
from .models import *


# Register your models here.


class PersonaAdmin(admin.ModelAdmin):
    list_display = (
        "nombre",
        "apellido",
        "id_tipo_doc",
        "nro_doc",
        "cod_loc",
        "nro_calle",
        "calle",
        "fecha_nac",
        "id_tipo_sexo",
    )


class LocalidadesAdmin(admin.ModelAdmin):
    list_display = (
        "localidad",
        "cod_provincia",
    )


class SexosAdmin(admin.ModelAdmin):
    list_display = ("tipo",)


class PaisesAdmin(admin.ModelAdmin):
    list_display = ("pais",)


class ProvinciasAdmin(admin.ModelAdmin):
    list_display = (
        "provincia",
        "cod_pais",
    )


class ClientesAdmin(admin.ModelAdmin):
    list_display = ("nro_afiliado",)


class EmpleadoAdmin(admin.ModelAdmin):
    list_display = (
        "id_tipo_empleado",
        "id_tipo_estado_empleado",
        "fecha_ingreso",
        "sueldo",
    )


class Tipo_EmpleadoAdmin(admin.ModelAdmin):
    list_display = ("tipo_empleado",)


class Tipo_Estado_EmpleadoAdmin(admin.ModelAdmin):
    list_display = ("tipo_estado_empleado",)


class CuentaAdmin(admin.ModelAdmin):
    list_display = (
        "id_tipo_estado_cuenta",
        "monto",
        "fecha_creacion",
        "cbu",
        "alias",
        "password",
        "credito",
        "debito",
    )


class Tipo_Estado_CuentaAdmin(admin.ModelAdmin):
    list_display = ("tipo_estado_cuenta",)


class DocumentosAdmin(admin.ModelAdmin):
    list_display = ("tipo_doc",)


class Tipos_cuentasAdmin(admin.ModelAdmin):
    list_display = ("tipo_cuenta",)


class Tipo_monedaAdmin(admin.ModelAdmin):
    list_display = ("tipo_moneda",)


class Tipos_contactosAdmin(admin.ModelAdmin):
    list_display = ("tipo_contacto",)


class ContactosAdmin(admin.ModelAdmin):
    list_display = ("id_tipo_contacto", "id_cliente", "id_empleado")


class Tipos_transferenciasAdmin(admin.ModelAdmin):
    list_display = ("tipo_transferencia",)


class TransferenciasAdmin(admin.ModelAdmin):
    list_display = (
        "id_tipo_transferencia",
        "id_cliente",
        "cuenta_envio",
        "cuenta_recibo",
        "monto",
        "fecha",
    )


class Cuenta_transferenciaAdmin(admin.ModelAdmin):
    list_display = ("id_cuenta", "id_transferencia")


class Tipo_prestamoAdmin(admin.ModelAdmin):
    list_display = ("tipo_prestamo",)


class Tipo_estado_prestamoAdmin(admin.ModelAdmin):
    list_display = ("tipo_estado_prestamo",)


class Cantidad_cuotasAdmin(admin.ModelAdmin):
    list_display = ("cantidad_cuotas",)


class Tipo_interesAdmin(admin.ModelAdmin):
    list_display = ("tipo_interes",)


class Tipo_estado_cuotaAdmin(admin.ModelAdmin):
    list_display = ("tipo_estado_cuota",)


class Tipo_cuotaAdmin(admin.ModelAdmin):
    list_display = ("tipo_cuota",)


class PrestamosAdmin(admin.ModelAdmin):
    list_display = (
        "id_tipo_prestamo",
        "id_tipo_estado_prestamo",
        "id_cuenta",
        "monto",
        "interes_mes",
        "fec_start",
        "fec_venc",
        "id_cantidad_cuota",
        "id_tipo_interes",
        "id_tipo_cuota",
        "id_tipo_estado_cuota",
        "id_tipo_moneda",
    )


class CuotasAdmin(admin.ModelAdmin):
    list_display = (
        "id_prestamo",
        "nro_cuota",
        "monto",
        "fecha_vencimiento",
        "fecha_pago",
        "id_tipo_estado_cuota",
        "id_tipo_cuota",
    )


class Tipo_tarjetaAdmin(admin.ModelAdmin):
    list_display = ("tipo_tarjeta",)


class Tipo_estado_tarjetaAdmin(admin.ModelAdmin):
    list_display = ("tipo_estado_tarjeta",)


class TarjetaAdmin(admin.ModelAdmin):
    list_display = (
        "id_tipo_tarjeta",
        "id_tipo_estado_tarjeta",
        "id_cuenta",
        "numero_tarjeta",
        "fecha_vencimiento",
        "codigo_seguridad",
    )


class Cuenta_TipoCuentaAdmin(admin.ModelAdmin):
    list_display = ("id_cuenta", "id_tipo_cuenta")


class Cuenta_TipoMonedaAdmin(admin.ModelAdmin):
    list_display = ("id_cuenta", "id_tipo_moneda")


class Cliente_CuentaAdmin(admin.ModelAdmin):
    list_display = ("id_cliente", "id_cuenta")


class Plazo_fijoAdmin(admin.ModelAdmin):
    list_display = (
        "id_tipo_moneda",
        "id_cuenta",
        "monto",
        "interes",
        "fecha_inicio",
        "fecha_vencimiento",
    )


admin.site.register(Documentos, DocumentosAdmin)
admin.site.register(Paises, PaisesAdmin)
admin.site.register(Provincias, ProvinciasAdmin)
admin.site.register(Localidades, LocalidadesAdmin)
admin.site.register(Sexos, SexosAdmin)
admin.site.register(Persona, PersonaAdmin)
admin.site.register(Clientes, ClientesAdmin)
admin.site.register(Tipo_estado_empleado, Tipo_Estado_EmpleadoAdmin)
admin.site.register(Tipo_empleado, Tipo_EmpleadoAdmin)
admin.site.register(Empleado, EmpleadoAdmin)
admin.site.register(Tipo_estado_cuenta, Tipo_Estado_CuentaAdmin)
admin.site.register(Tipo_moneda, Tipo_monedaAdmin)
admin.site.register(Tipos_cuentas, Tipos_cuentasAdmin)
admin.site.register(Cuenta, CuentaAdmin)
admin.site.register(Tipos_contactos, Tipos_contactosAdmin)
admin.site.register(Contactos, ContactosAdmin)
admin.site.register(Tipos_transferencias, Tipos_transferenciasAdmin)
admin.site.register(Transferencias, TransferenciasAdmin)
admin.site.register(Cuenta_transferencia, Cuenta_transferenciaAdmin)
admin.site.register(Tipo_prestamo, Tipo_prestamoAdmin)
admin.site.register(Tipo_estado_prestamo, Tipo_estado_prestamoAdmin)
admin.site.register(Cantidad_cuotas, Cantidad_cuotasAdmin)
admin.site.register(Tipo_interes, Tipo_interesAdmin)
admin.site.register(Tipo_estado_cuota, Tipo_estado_cuotaAdmin)
admin.site.register(Tipo_cuota, Tipo_cuotaAdmin)
admin.site.register(Prestamos, PrestamosAdmin)
admin.site.register(Cuotas, CuotasAdmin)
admin.site.register(Tipo_tarjeta, Tipo_tarjetaAdmin)
admin.site.register(Tipo_estado_tarjeta, Tipo_estado_tarjetaAdmin)
admin.site.register(Tarjeta, TarjetaAdmin)
admin.site.register(Cuenta_TipoCuenta, Cuenta_TipoCuentaAdmin)
admin.site.register(Cuenta_TipoMoneda, Cuenta_TipoMonedaAdmin)
admin.site.register(Cliente_Cuenta, Cliente_CuentaAdmin)
admin.site.register(Plazo_fijo, Plazo_fijoAdmin)
