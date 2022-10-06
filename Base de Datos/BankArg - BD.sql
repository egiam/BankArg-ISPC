create database BankArg;
use BankArg;

CREATE TABLE `Documentos` (
  `id_tipo_doc` <type>,
  `tipo_doc` <type>,
  KEY `pk` (`id_tipo_doc`)
);

CREATE TABLE `Sexos` (
  `id_tipo_sexo` <type>,
  `tipo` <type>,
  KEY `pk` (`id_tipo_sexo`)
);

CREATE TABLE `paises` (
  `cod_pais` <type>,
  `pais` <type>,
  KEY `pk` (`cod_pais`)
);

CREATE TABLE `provincias` (
  `cod_provincia` <type>,
  `provincia` <type>,
  `cod_pais` <type>,
  FOREIGN KEY (`cod_pais`) REFERENCES `paises`(`cod_pais`),
  KEY `pk` (`cod_provincia`),
  KEY `fk` (`cod_pais`)
);

CREATE TABLE `localidades` (
  `cod_localidad` <type>,
  `localidad` <type>,
  `cod_provincia` <type>,
  FOREIGN KEY (`cod_provincia`) REFERENCES `provincias`(`cod_provincia`),
  KEY `pk` (`cod_localidad`),
  KEY `fk` (`cod_provincia`)
);

CREATE TABLE `Clientes` (
  `id_cliente` <type>,
  `nombre` <type>,
  `apellido` <type>,
  `id_tipo_doc` <type>,
  `nro_doc` <type>,
  `cod_localidad` <type>,
  `nro_calle` <type>,
  `calle` <type>,
  `nro_afiliado` <type>,
  `fecha_nac` <type>,
  `id_tipo_sexo` <type>,
  FOREIGN KEY (`id_tipo_doc`) REFERENCES `Documentos`(`id_tipo_doc`),
  FOREIGN KEY (`id_tipo_sexo`) REFERENCES `Sexos`(`id_tipo_sexo`),
  FOREIGN KEY (`cod_localidad`) REFERENCES `localidades`(`cod_localidad`),
  KEY `pk` (`id_cliente`),
  KEY `fk` (`id_tipo_doc`, `cod_localidad`, `id_tipo_sexo`)
);

CREATE TABLE `Tipos_transferencias` (
  `id_tipo_transferencia` <type>,
  `tipo_transferencia` <type>,
  KEY `pk` (`id_tipo_transferencia`)
);

CREATE TABLE `Transferencias` (
  `id_transferencia` <type>,
  `id_tipo_transferencia` <type>,
  `id_cliente` <type>,
  `fecha` <type>,
  `monto` <type>,
  `cuenta_envio` <type>,
  `cuenta_recibo` <type>,
  FOREIGN KEY (`id_tipo_transferencia`) REFERENCES `Tipos_transferencias`(`id_tipo_transferencia`),
  FOREIGN KEY (`id_cliente`) REFERENCES `Clientes`(`id_cliente`),
  KEY `pk` (`id_transferencia`),
  KEY `fk` (`id_tipo_transferencia`, `id_cliente`)
);

CREATE TABLE `Cuenta` (
  `id_cuenta` <type>,
  `id_cliente` <type>,
  `Monto` <type>,
  `fecha_creacion` <type>,
  `CBU` <type>,
  `Alias` <type>,
  `Credito` <type>,
  `Debito` <type>,
  KEY `pk` (`id_cuenta`),
  KEY `fk` (`id_cliente`)
);

CREATE TABLE `Cuenta-Transferencia` (
  `id_cuenta` <type>,
  `id_transferencia` <type>,
  FOREIGN KEY (`id_transferencia`) REFERENCES `Transferencias`(`id_transferencia`),
  FOREIGN KEY (`id_cuenta`) REFERENCES `Cuenta`(`id_cuenta`),
  KEY `pk` (`id_cuenta`, `id_transferencia`)
);

CREATE TABLE `Tipos_contactos` (
  `id_tipo_contacto` <type>,
  `tipo_contacto` <type>,
  KEY `pk` (`id_tipo_contacto`)
);

CREATE TABLE `Empleados` (
  `id_empleado` <type>,
  `nombre` <type>,
  `apellido` <type>,
  `id_tipo_doc` <type>,
  `nro_doc` <type>,
  `cod_localidad` <type>,
  `nro_calle` <type>,
  `calle` <type>,
  `fecha_nac` <type>,
  `id_tipo_sexo` <type>,
  FOREIGN KEY (`id_tipo_sexo`) REFERENCES `Sexos`(`id_tipo_sexo`),
  FOREIGN KEY (`id_tipo_doc`) REFERENCES `Documentos`(`id_tipo_doc`),
  FOREIGN KEY (`cod_localidad`) REFERENCES `localidades`(`cod_localidad`),
  KEY `pk` (`id_empleado`),
  KEY `fk` (`id_tipo_doc`, `cod_localidad`, `id_tipo_sexo`)
);

CREATE TABLE `Contactos` (
  `id_contactos` <type>,
  `id_tipo_contacto` <type>,
  `id_cliente` <type>,
  `id_empleado` <type>,
  FOREIGN KEY (`id_cliente`) REFERENCES `Clientes`(`id_cliente`),
  FOREIGN KEY (`id_empleado`) REFERENCES `Empleados`(`id_empleado`),
  FOREIGN KEY (`id_tipo_contacto`) REFERENCES `Tipos_contactos`(`id_tipo_contacto`),
  KEY `pk` (`id_contactos`),
  KEY `fk` (`id_tipo_contacto`, `id_cliente`, `id_empleado`)
);

CREATE TABLE `Prestamos` (
  `id_prestamo` <type>,
  `id_cuenta` <type>,
  `Monto` <type>,
  `interes_mes` <type>,
  `fec_start` <type>,
  `fec_venc` <type>,
  FOREIGN KEY (`id_cuenta`) REFERENCES `Cuenta`(`id_cuenta`),
  KEY `pk` (`id_prestamo`),
  KEY `fk` (`id_cuenta`)
);

