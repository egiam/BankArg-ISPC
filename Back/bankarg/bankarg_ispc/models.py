from typing import Any
from django.db import models
from django.contrib.auth.models import AbstractUser


# Create your models here.
class CustomUser(AbstractUser):
    email = models.EmailField(max_length=150, unique=True)

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ["username", "password"]


class Documentos(models.Model):
    id_tipo_doc = models.AutoField(primary_key=True)
    tipo_doc = models.CharField(max_length=150)

    class Meta:
        db_table = "Documentos"
        verbose_name = "Documento"
        verbose_name_plural = "Documentos"

    def __unicode__(self):
        return self.tipo_doc

    def __str__(self):
        return self.tipo_doc


class Paises(models.Model):
    cod_pais = models.AutoField(primary_key=True)
    pais = models.CharField(max_length=250)

    class Meta:
        db_table = "Paises"
        verbose_name = "Pais"
        verbose_name_plural = "Paises"

    def __unicode__(self):
        return self.pais

    def __str__(self):
        return self.pais


class Provincias(models.Model):
    cod_provincia = models.AutoField(primary_key=True)
    provincia = models.TextField(max_length=150)
    cod_pais = models.ForeignKey(Paises, to_field="cod_pais", on_delete=models.CASCADE)

    class Meta:
        db_table = "Provincias"
        verbose_name = "Provincia"
        verbose_name_plural = "Provincias"

    def __unicode__(self):
        return self.provincia

    def __str__(self):
        return self.provincia


class Localidades(models.Model):
    cod_localidad = models.AutoField(primary_key=True)
    localidad = models.CharField(max_length=150)
    cod_provincia = models.ForeignKey(
        Provincias, to_field="cod_provincia", on_delete=models.CASCADE
    )

    class Meta:
        db_table = "Localidades"
        verbose_name = "Localidad"
        verbose_name_plural = "Localidades"

    def __unicode__(self):
        return self.localidad

    def __str__(self):
        return self.localidad


class Sexos(models.Model):
    id_tipo_sexo = models.AutoField(primary_key=True)
    tipo = models.TextField(max_length=150)

    class Meta:
        db_table = "Sexos"
        verbose_name = "Sexo"
        verbose_name_plural = "Sexos"

    def __unicode__(self):
        return self.tipo

    def __str__(self):
        return self.tipo


class Persona(models.Model):
    id_persona = models.AutoField(primary_key=True)
    nombre = models.TextField(max_length=120)
    apellido = models.TextField(max_length=120)
    id_tipo_doc = models.ForeignKey(
        Documentos, to_field="id_tipo_doc", on_delete=models.CASCADE
    )
    nro_doc = models.CharField(max_length=20)
    cod_loc = models.ForeignKey(
        Localidades, to_field="cod_localidad", on_delete=models.CASCADE
    )
    nro_calle = models.IntegerField()
    calle = models.TextField(max_length=150)
    fecha_nac = models.DateTimeField()
    id_tipo_sexo = models.ForeignKey(
        Sexos, to_field="id_tipo_sexo", on_delete=models.CASCADE
    )
    # email = models.ForeignKey(
    #     CustomUser, to_field="email", on_delete=models.CASCADE, null=True
    # )

    class Meta:
        db_table = "Persona"
        verbose_name = "Persona"
        verbose_name_plural = "Personas"

    def __unicode__(self):
        return self.nombre

    def __str__(self):
        return self.nombre


class Clientes(Persona):
    id_cliente = models.AutoField(primary_key=True)
    nro_afiliado = models.IntegerField()

    class Meta:
        db_table = "Clientes"
        verbose_name = "Cliente"
        verbose_name_plural = "Clientes"

    def __unicode__(self):
        return self.nombre

    def __str__(self):
        return self.nombre


class Tipo_empleado(models.Model):
    id_tipo_empleado = models.AutoField(primary_key=True)
    tipo_empleado = models.TextField(max_length=150)

    class Meta:
        db_table = "Tipo_Empleado"
        verbose_name = "Tipo_Empleado"
        verbose_name_plural = "Tipos_Empleados"

    def __unicode__(self):
        return self.tipo_empleado

    def __str__(self):
        return self.tipo_empleado


class Tipo_estado_empleado(models.Model):
    id_tipo_estado_empleado = models.AutoField(primary_key=True)
    tipo_estado_empleado = models.TextField(max_length=150)

    class Meta:
        db_table = "Tipo_estado_empleado"
        verbose_name = "Tipo_estado_empleado"
        verbose_name_plural = "Tipos_estado_empleados"

    def __unicode__(self):
        return self.tipo_estado_empleado

    def __str__(self):
        return self.tipo_estado_empleado


class Empleado(Persona):
    id_empleado = models.AutoField(primary_key=True)
    id_tipo_empleado = models.ForeignKey(
        Tipo_empleado, to_field="id_tipo_empleado", on_delete=models.CASCADE
    )
    id_tipo_estado_empleado = models.ForeignKey(
        Tipo_estado_empleado,
        to_field="id_tipo_estado_empleado",
        on_delete=models.CASCADE,
    )
    fecha_ingreso = models.DateTimeField()
    sueldo = models.DecimalField(max_digits=15, decimal_places=2)

    class Meta:
        db_table = "Empleado"
        verbose_name = "Empleado"
        verbose_name_plural = "Empleados"

    def __unicode__(self):
        return self.nombre

    def __str__(self):
        return self.nombre


class Tipo_estado_cuenta(models.Model):
    id_tipo_estado_cuenta = models.AutoField(primary_key=True)
    tipo_estado_cuenta = models.TextField(max_length=150)

    class Meta:
        db_table = "Tipo_estado_cuenta"
        verbose_name = "Tipo_estado_cuenta"
        verbose_name_plural = "Tipo_estados_cuentas"

    def __unicode__(self):
        return self.tipo_estado_cuenta

    def __str__(self):
        return self.tipo_estado_cuenta


class Tipos_cuentas(models.Model):
    id_tipo_cuenta = models.AutoField(primary_key=True)
    tipo_cuenta = models.TextField(max_length=150)

    class Meta:
        db_table = "Tipos_cuentas"
        verbose_name = "Tipo_cuenta"
        verbose_name_plural = "Tipos_cuentas"

    def __unicode__(self):
        return self.tipo_cuenta

    def __str__(self):
        return self.tipo_cuenta


class Tipo_moneda(models.Model):
    id_tipo_moneda = models.AutoField(primary_key=True)
    tipo_moneda = models.TextField(max_length=150)

    class Meta:
        db_table = "Tipo_moneda"
        verbose_name = "Tipo_moneda"
        verbose_name_plural = "Tipos_monedas"

    def __unicode__(self):
        return self.tipo_moneda

    def __str__(self):
        return self.tipo_moneda


class Cuenta(models.Model):
    id_cuenta = models.AutoField(primary_key=True)
    id_cliente = models.ForeignKey(
        Clientes, to_field="id_cliente", on_delete=models.CASCADE
    )
    id_tipo_cuenta = models.ForeignKey(
        Tipos_cuentas, to_field="id_tipo_cuenta", on_delete=models.CASCADE
    )
    id_tipo_moneda = models.ForeignKey(
        Tipo_moneda, to_field="id_tipo_moneda", on_delete=models.CASCADE
    )
    id_tipo_estado_cuenta = models.ForeignKey(
        Tipo_estado_cuenta, to_field="id_tipo_estado_cuenta", on_delete=models.CASCADE
    )
    monto = models.IntegerField()
    fecha_creacion = models.DateField(auto_now_add=True)
    cbu = models.CharField(max_length=75)
    alias = models.TextField(max_length=150)
    password = models.TextField(max_length=250)
    credito = models.BooleanField(default=True)
    debito = models.BooleanField(default=True)

    class Meta:
        db_table = "Cuenta"
        verbose_name = "Cuenta"
        verbose_name_plural = "Cuentas"

    def __unicode__(self):
        return self.id_cuenta

    def __str__(self):
        return self.id_cuenta


class Tipos_contactos(models.Model):
    id_tipo_contacto = models.AutoField(primary_key=True)
    tipo_contacto = models.CharField(max_length=150)

    class Meta:
        db_table = "Tipo_contacto"
        verbose_name = "Tipo_contacto"
        verbose_name_plural = "Tipos_contactos"

    def __unicode__(self):
        return self.tipo_contacto

    def __str__(self):
        return self.tipo_contacto


class Contactos(models.Model):
    id_contactos = models.AutoField(primary_key=True)
    id_tipo_contacto = models.ForeignKey(
        Tipos_contactos, to_field="id_tipo_contacto", on_delete=models.CASCADE
    )
    id_cliente = models.ForeignKey(
        Clientes, to_field="id_cliente", on_delete=models.CASCADE
    )
    id_empleado = models.ForeignKey(
        Empleado, to_field="id_empleado", on_delete=models.CASCADE
    )

    class Meta:
        db_table = "Contacto"
        verbose_name = "Contacto"
        verbose_name_plural = "Contactos"

    def __unicode__(self):
        return self.id_contacto

    def __str__(self):
        return self.id_contacto


class Tipos_transferencias(models.Model):
    id_tipo_transferencia = models.AutoField(primary_key=True)
    tipo_transferencia = models.TextField(max_length=150)

    class Meta:
        db_table = "Tipos_transferencias"
        verbose_name = "Tipo_transferencia"
        verbose_name_plural = "Tipos_transferencias"

    def __unicode__(self):
        return self.id_tipo_transferencia

    def __str__(self):
        return self.id_tipo_transferencia


class Transferencias(models.Model):
    id_transferencia = models.AutoField(primary_key=True)
    id_tipo_transferencia = models.ForeignKey(
        Tipos_transferencias, to_field="id_tipo_transferencia", on_delete=models.CASCADE
    )
    id_cliente = models.ForeignKey(
        Clientes, to_field="id_cliente", on_delete=models.CASCADE
    )
    fecha = models.DateField(auto_now=True)
    monto = models.IntegerField()
    cuenta_envio = models.TextField(max_length=50)
    cuenta_recibo = models.TextField(max_length=50)

    class Meta:
        db_table = "Transferencias"
        verbose_name = "Tranferencia"
        verbose_name_plural = "Transferencias"

    def __init__(self):
        return self.id_transferencia

    def __str__(self):
        return self.id_transferencia


class Cuenta_transferencia(models.Model):
    id_cuenta_transferencia = models.AutoField(primary_key=True)
    id_cuenta = models.ForeignKey(
        Cuenta, to_field="id_cuenta", on_delete=models.CASCADE
    )
    id_transferencia = models.ForeignKey(
        Transferencias, to_field="id_transferencia", on_delete=models.CASCADE
    )

    class Meta:
        db_table = "Cuenta_transferencia"
        verbose_name = "Cuenta_trasnferencia"
        verbose_name_plural = "Cuentas_trasnferencias"

    def __unicode__(self):
        return self.id_transferencia

    def __str__(self):
        return self.id_transferencia


class Tipo_prestamo(models.Model):
    id_tipo_prestamo = models.AutoField(primary_key=True)
    tipo_prestamo = models.TextField(max_length=150)

    class Meta:
        db_table = "Tipo_prestamo"
        verbose_name = "Tipo_prestamo"
        verbose_name_plural = "Tipos_prestamos"

    def __init__(self):
        return self.tipo_prestamo

    def __str__(self):
        return self.tipo_prestamo


class Tipo_estado_prestamo(models.Model):
    id_tipo_estado_prestamo = models.AutoField(primary_key=True)
    tipo_estado_prestamo = models.TextField(max_length=20)

    class Meta:
        db_table = "Tipo_estado_prestamo"
        verbose_name = "Tipo_estado_prestamo"
        verbose_name_plural = "Tipo_estados_prestamos"

    def __init__(self):
        return self.tipo_estado_prestamo

    def __str__(self):
        return self.tipo_estado_prestamo


class Cantidad_cuotas(models.Model):
    id_cantidad_cuotas = models.AutoField(primary_key=True)
    cantidad_cuotas = models.IntegerField()

    class Meta:
        db_table = "cantidad_cuotas"
        verbose_name = "cantidad_cuota"
        verbose_name_plural = "cantidad_cuotas"

    def __init__(self):
        return self.cantidad_cuotas

    def __str__(self):
        return self.cantidad_cuotas


class Tipo_interes(models.Model):
    id_tipo_interes = models.AutoField(primary_key=True)
    tipo_interes = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        db_table = "tipo_interes"
        verbose_name = "tipo_interes"
        verbose_name_plural = "tipos_intereses"

    def __init__(self):
        return self.tipo_interes

    def __str__(self):
        return self.tipo_interes


class Tipo_estado_cuota(models.Model):
    id_tipo_estado_cuota = models.AutoField(primary_key=True)
    tipo_estado_cuota = models.TextField(max_length=20)

    class Meta:
        db_table = "tipo_estado_cuota"
        verbose_name = "tipo_estado_cuota"
        verbose_name_plural = "tipo_estados_cuotas"

    def __init__(self):
        return self.tipo_estado_cuota

    def __str__(self):
        return self.tipo_estado_cuota


class Tipo_cuota(models.Model):
    id_tipo_cuota = models.AutoField(primary_key=True)
    tipo_cuota = models.TextField(max_length=20)

    class Meta:
        db_table = "tipo_cuota"
        verbose_name = "tipo_cuota"
        verbose_name_plural = "tipos_cuotas"

    def __init__(self):
        return self.tipo_cuota

    def __str__(self):
        return self.tipo_cuota


class Prestamos(models.Model):
    id_prestamo = models.AutoField(primary_key=True)
    id_cuenta = models.ForeignKey(
        Cuenta, to_field="id_cuenta", on_delete=models.CASCADE
    )
    monto = models.IntegerField()
    interes_mes = models.DecimalField(max_digits=10, decimal_places=2)
    fec_start = models.DateField(auto_now=True)
    fec_venc = models.DateField(auto_now=True)
    id_tipo_prestamo = models.ForeignKey(
        Tipo_prestamo, to_field="id_tipo_prestamo", on_delete=models.CASCADE
    )
    id_tipo_estado_prestamo = models.ForeignKey(
        Tipo_estado_prestamo,
        to_field="id_tipo_estado_prestamo",
        on_delete=models.CASCADE,
    )
    id_tipo_cuota = models.ForeignKey(
        Tipo_cuota, to_field="id_tipo_cuota", on_delete=models.CASCADE
    )
    id_tipo_estado_cuota = models.ForeignKey(
        Tipo_estado_cuota, to_field="id_tipo_estado_cuota", on_delete=models.CASCADE
    )
    id_tipo_interes = models.ForeignKey(
        Tipo_interes, to_field="id_tipo_interes", on_delete=models.CASCADE
    )
    id_cantidad_cuota = models.ForeignKey(
        Cantidad_cuotas, to_field="id_cantidad_cuotas", on_delete=models.CASCADE
    )
    id_tipo_moneda = models.ForeignKey(
        Tipo_moneda, to_field="id_tipo_moneda", on_delete=models.CASCADE
    )

    class Meta:
        db_table = "Prestamos"
        verbose_name = "Prestamo"
        verbose_name_plural = "Prestamos"

    def __init__(self):
        return self.id_prestamo

    def __str__(self):
        return self.id_prestamo


class Cuotas(models.Model):
    id_cuota = models.AutoField(primary_key=True)
    id_prestamo = models.ForeignKey(
        Prestamos, to_field="id_prestamo", on_delete=models.CASCADE
    )
    id_tipo_cuota = models.ForeignKey(
        Tipo_cuota, to_field="id_tipo_cuota", on_delete=models.CASCADE
    )
    id_tipo_estado_cuota = models.ForeignKey(
        Tipo_estado_cuota, to_field="id_tipo_estado_cuota", on_delete=models.CASCADE
    )
    nro_cuota = models.IntegerField()
    fecha_vencimiento = models.DateField(auto_now=False)
    fecha_pago = models.DateTimeField(auto_now=True)
    monto = models.IntegerField()

    class Meta:
        db_table = "Cuotas"
        verbose_name = "Cuotas"
        verbose_name_plural = "Cuotas"

    def __init__(self):
        return self.id_cuota

    def __str__(self):
        return self.id_cuota


class Tipo_tarjeta(models.Model):
    id_tipo_tarjeta = models.AutoField(primary_key=True)
    tipo_tarjeta = models.TextField(max_length=150)

    class Meta:
        db_table = "Tipo_tarjeta"
        verbose_name = "Tipo_tarjeta"
        verbose_name_plural = "Tipos_tarjetas"

    def __init__(self):
        return self.tipo_tarjeta

    def __str__(self):
        return self.tipo_tarjeta


class Tipo_estado_tarjeta(models.Model):
    id_tipo_estado_tarjeta = models.AutoField(primary_key=True)
    tipo_estado_tarjeta = models.TextField(max_length=150)

    class Meta:
        db_table = "Tipo_estado_tarjeta"
        verbose_name = "Tipo_estado_tarjeta"
        verbose_name_plural = "Tipos_estados_tarjetas"

    def __init__(self):
        return self.tipo_estado_tarjeta

    def __str__(self):
        return self.tipo_estado_tarjeta


class Tarjeta(models.Model):
    id_tarjeta = models.AutoField(primary_key=True)
    id_tipo_tarjeta = models.ForeignKey(
        Tipo_tarjeta, to_field="id_tipo_tarjeta", on_delete=models.CASCADE
    )
    id_tipo_estado_tarjeta = models.ForeignKey(
        Tipo_estado_tarjeta,
        to_field="id_tipo_estado_tarjeta",
        on_delete=models.CASCADE,
    )
    id_cuenta = models.ForeignKey(
        Cuenta, to_field="id_cuenta", on_delete=models.CASCADE
    )
    fecha_vencimiento = models.DateField(auto_now=False)
    numero_tarjeta = models.TextField(max_length=150)
    codigo_seguridad = models.TextField(max_length=150)

    class Meta:
        db_table = "Tarjeta"
        verbose_name = "Tarjeta"
        verbose_name_plural = "Tarjetas"

    def __init__(self):
        return self.id_tarjeta

    def __str__(self):
        return self.id_tarjeta


class Cuenta_TipoCuenta(models.Model):
    cod_ctc = models.AutoField(primary_key=True)
    id_cuenta = models.ForeignKey(
        Cuenta, to_field="id_cuenta", on_delete=models.CASCADE
    )
    id_tipo_cuenta = models.ForeignKey(
        Tipos_cuentas, to_field="id_tipo_cuenta", on_delete=models.CASCADE
    )

    class Meta:
        db_table = "Cuenta_TipoCuenta"
        verbose_name = "Cuenta_TipoCuenta"
        verbose_name_plural = "Cuentas_TiposCuentas"

    def __init__(self):
        return self.id_cuenta

    def __str__(self):
        return self.id_cuenta


class Cuenta_TipoMoneda(models.Model):
    cod_ctm = models.AutoField(primary_key=True)
    id_cuenta = models.ForeignKey(
        Cuenta, to_field="id_cuenta", on_delete=models.CASCADE
    )
    id_tipo_moneda = models.ForeignKey(
        Tipo_moneda, to_field="id_tipo_moneda", on_delete=models.CASCADE
    )

    class Meta:
        db_table = "Cuenta_TipoMoneda"
        verbose_name = "Cuenta_TipoMoneda"
        verbose_name_plural = "Cuentas_TiposMonedas"

    def __init__(self):
        return self.id_cuenta

    def __str__(self):
        return self.id_cuenta


class Cliente_Cuenta(models.Model):
    id_cliente = models.ForeignKey(
        Clientes, to_field="id_cliente", on_delete=models.CASCADE
    )
    id_cuenta = models.ForeignKey(
        Cuenta, to_field="id_cuenta", on_delete=models.CASCADE
    )
    cod_cc = models.AutoField(primary_key=True)

    class Meta:
        db_table = "Cliente_Cuenta"
        verbose_name = "Cliente_Cuenta"
        verbose_name_plural = "Clientes_Cuentas"

    def __init__(self):
        return self.id_cliente

    def __str__(self):
        return self.id_cliente


class Plazo_fijo(models.Model):
    id_plazo_fijo = models.AutoField(primary_key=True)
    id_cuenta = models.ForeignKey(
        Cuenta, to_field="id_cuenta", on_delete=models.CASCADE
    )
    id_tipo_moneda = models.ForeignKey(
        Tipo_moneda, to_field="id_tipo_moneda", on_delete=models.CASCADE
    )
    monto = models.IntegerField()
    fecha_inicio = models.DateField(auto_now=False)
    fecha_vencimiento = models.DateField(auto_now=False)
    interes = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        db_table = "Plazo_fijo"
        verbose_name = "Plazo_fijo"
        verbose_name_plural = "Plazos_fijos"

    def __init__(self):
        return self.id_plazo_fijo

    def __str__(self):
        return self.id_plazo_fijo
