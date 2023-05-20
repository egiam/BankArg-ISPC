from django.db import models


# Create your models here.
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
        verbose_name_plural = "Tipos_estado_cuentas"

    def __unicode__(self):
        return self.tipo_estado_cuenta

    def __str__(self):
        return self.tipo_estado_cuenta


class Cuenta(models.Model):
    id_cuenta = models.AutoField(primary_key=True)
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
