create database BankArg;
use BankArg;

-- Joaco
CREATE TABLE `Documentos` (
  `id_tipo_doc` int NOT NULL AUTO_INCREMENT,
  `tipo_doc` varchar(150),
  KEY `pk` (`id_tipo_doc`)
);

-- Joaco
CREATE TABLE `Sexos` (
  `id_tipo_sexo` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(150),
  KEY `pk` (`id_tipo_sexo`)
);

-- Eze
CREATE TABLE `paises` (
  `cod_pais` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(250),
  KEY `pk` (`cod_pais`)
);

-- Eze
CREATE TABLE `provincias` (
  `cod_provincia` int NOT NULL AUTO_INCREMENT,
  `provincia` varchar(150),
  `cod_pais` int NOT NULL,
  FOREIGN KEY (`cod_pais`) REFERENCES `paises`(`cod_pais`),
  KEY `pk` (`cod_provincia`),
  KEY `fk` (`cod_pais`)
);

-- Eze
CREATE TABLE `localidades` (
  `cod_localidad` int NOT NULL AUTO_INCREMENT,
  `localidad` varchar(150),
  `cod_provincia` int NOT NULL,
  FOREIGN KEY (`cod_provincia`) REFERENCES `provincias`(`cod_provincia`),
  KEY `pk` (`cod_localidad`),
  KEY `fk` (`cod_provincia`)
);

-- Valen
CREATE TABLE `Clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120),
  `apellido` varchar(120),
  `id_tipo_doc` int NOT NULL,
  `nro_doc` varchar(20), -- Varchar x si hay gente de algun otro pais donde la identificacion tiene numeros. 20 maximo x si se pone puntos o etc.
  `cod_localidad` int NOT NULL,
  `nro_calle` int,
  `calle` varchar(150),
  `nro_afiliado` int,
  `fecha_nac` datetime,
  `id_tipo_sexo` int NOT NULL,
  FOREIGN KEY (`id_tipo_doc`) REFERENCES `Documentos`(`id_tipo_doc`),
  FOREIGN KEY (`id_tipo_sexo`) REFERENCES `Sexos`(`id_tipo_sexo`),
  FOREIGN KEY (`cod_localidad`) REFERENCES `localidades`(`cod_localidad`),
  KEY `pk` (`id_cliente`),
  KEY `fk` (`id_tipo_doc`, `cod_localidad`, `id_tipo_sexo`)
);

-- Maxi
CREATE TABLE `Tipos_transferencias` (
  `id_tipo_transferencia` int NOT NULL AUTO_INCREMENT,
  `tipo_transferencia` varchar(250),
  KEY `pk` (`id_tipo_transferencia`)
);

-- Valen
CREATE TABLE `Transferencias` (
  `id_transferencia` int NOT NULL AUTO_INCREMENT,
  `id_tipo_transferencia` int NOT NULL,
  `id_cliente` int NOT NULL,
  `fecha` datetime,
  `monto` int,
  `cuenta_envio` varchar(150), -- varchar x codigo o similar
  `cuenta_recibo` varchar(150), -- varchar x codigo o similar
  FOREIGN KEY (`id_tipo_transferencia`) REFERENCES `Tipos_transferencias`(`id_tipo_transferencia`),
  FOREIGN KEY (`id_cliente`) REFERENCES `Clientes`(`id_cliente`),
  KEY `pk` (`id_transferencia`),
  KEY `fk` (`id_tipo_transferencia`, `id_cliente`)
);

-- Maria Laura
CREATE TABLE `Cuenta` (
  `id_cuenta` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `Monto` int,
  `fecha_creacion` datetime,
  `CBU` varchar(75),
  `Alias` varchar(150),
  `password` varchar(250),
  `Credito` boolean,
  `Debito` boolean,
  KEY `pk` (`id_cuenta`),
  KEY `fk` (`id_cliente`)
);

-- Maria Laura
CREATE TABLE `Cuenta-Transferencia` (
  `id_cuenta` int NOT NULL AUTO_INCREMENT,
  `id_transferencia` int NOT NULL,
  FOREIGN KEY (`id_transferencia`) REFERENCES `Transferencias`(`id_transferencia`),
  FOREIGN KEY (`id_cuenta`) REFERENCES `Cuenta`(`id_cuenta`),
  KEY `pk` (`id_cuenta`, `id_transferencia`)
);

-- Maxi
CREATE TABLE `Tipos_contactos` (
  `id_tipo_contacto` int NOT NULL AUTO_INCREMENT,
  `tipo_contacto` varchar(150),
  KEY `pk` (`id_tipo_contacto`)
);

CREATE TABLE `Empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120),
  `apellido` varchar(120),
  `id_tipo_doc` int NOT NULL,
  `nro_doc` varchar(20), -- Varchar x si hay gente de algun otro pais donde la identificacion tiene numeros. 20 maximo x si se pone puntos o etc.
  `cod_localidad` int NOT NULL,
  `nro_calle` int NOT NULL,
  `calle` varchar(150),
  `fecha_nac` datetime,
  `id_tipo_sexo` int NOT NULL,
  FOREIGN KEY (`id_tipo_sexo`) REFERENCES `Sexos`(`id_tipo_sexo`),
  FOREIGN KEY (`id_tipo_doc`) REFERENCES `Documentos`(`id_tipo_doc`),
  FOREIGN KEY (`cod_localidad`) REFERENCES `localidades`(`cod_localidad`),
  KEY `pk` (`id_empleado`),
  KEY `fk` (`id_tipo_doc`, `cod_localidad`, `id_tipo_sexo`)
);

CREATE TABLE `Contactos` (
  `id_contactos` int NOT NULL AUTO_INCREMENT,
  `id_tipo_contacto` int NOT NULL,
  `id_cliente` int NOT NULL,
  `id_empleado` int NOT NULL,
  FOREIGN KEY (`id_cliente`) REFERENCES `Clientes`(`id_cliente`),
  FOREIGN KEY (`id_empleado`) REFERENCES `Empleados`(`id_empleado`),
  FOREIGN KEY (`id_tipo_contacto`) REFERENCES `Tipos_contactos`(`id_tipo_contacto`),
  KEY `pk` (`id_contactos`),
  KEY `fk` (`id_tipo_contacto`, `id_cliente`, `id_empleado`)
);

CREATE TABLE `Prestamos` (
  `id_prestamo` int NOT NULL AUTO_INCREMENT,
  `id_cuenta` int NOT NULL,
  `Monto` int,
  `interes_mes_porcentaje` int,
  `fec_start` datetime,
  `fec_venc` datetime,
  FOREIGN KEY (`id_cuenta`) REFERENCES `Cuenta`(`id_cuenta`),
  KEY `pk` (`id_prestamo`),
  KEY `fk` (`id_cuenta`)
);





-- Insertar Paises

insert into paises (pais) values ('Argentina');
insert into paises (pais) values ('Brasil');
insert into paises (pais) values ('Chile');
insert into paises (pais) values ('Uruguay');
insert into paises (pais) values ('Paraguay');
insert into paises (pais) values ('Bolivia');
insert into paises (pais) values ('Peru');
insert into paises (pais) values ('Ecuador');
insert into paises (pais) values ('Colombia');
insert into paises (pais) values ('Venezuela');
insert into paises (pais) values ('Panama');
insert into paises (pais) values ('Costa Rica');
insert into paises (pais) values ('El Salvador');
insert into paises (pais) values ('Guatemala');
insert into paises (pais) values ('Honduras');
insert into paises (pais) values ('Nicaragua');
insert into paises (pais) values ('Mexico');
insert into paises (pais) values ('Estados Unidos');
insert into paises (pais) values ('Canada');
insert into paises (pais) values ('España');
insert into paises (pais) values ('Francia');
insert into paises (pais) values ('Italia');
insert into paises (pais) values ('Alemania');
insert into paises (pais) values ('Inglaterra');
insert into paises (pais) values ('Portugal');
insert into paises (pais) values ('Rusia');
insert into paises (pais) values ('China');
insert into paises (pais) values ('Japon');
insert into paises (pais) values ('Corea del Sur');
insert into paises (pais) values ('Australia');
insert into paises (pais) values ('Nueva Zelanda');
insert into paises (pais) values ('Sudafrica');
insert into paises (pais) values ('Otro');

select * from paises;


-- Insertar Provincias

-- Arg
insert into provincias (provincia, cod_pais) values ('Buenos Aires', 1);
insert into provincias (provincia, cod_pais) values ('Catamarca', 1);
insert into provincias (provincia, cod_pais) values ('Chaco', 1);
insert into provincias (provincia, cod_pais) values ('Chubut', 1);
insert into provincias (provincia, cod_pais) values ('Cordoba', 1);
insert into provincias (provincia, cod_pais) values ('Corrientes', 1);
insert into provincias (provincia, cod_pais) values ('Entre Rios', 1);
insert into provincias (provincia, cod_pais) values ('Formosa', 1);
insert into provincias (provincia, cod_pais) values ('Jujuy', 1);
insert into provincias (provincia, cod_pais) values ('La Pampa', 1);
insert into provincias (provincia, cod_pais) values ('La Rioja', 1);
insert into provincias (provincia, cod_pais) values ('Mendoza', 1);
insert into provincias (provincia, cod_pais) values ('Misiones', 1);
insert into provincias (provincia, cod_pais) values ('Neuquen', 1);
insert into provincias (provincia, cod_pais) values ('Rio Negro', 1);
insert into provincias (provincia, cod_pais) values ('Salta', 1);
insert into provincias (provincia, cod_pais) values ('San Juan', 1);
insert into provincias (provincia, cod_pais) values ('San Luis', 1);
insert into provincias (provincia, cod_pais) values ('Santa Cruz', 1);
insert into provincias (provincia, cod_pais) values ('Santa Fe', 1);
insert into provincias (provincia, cod_pais) values ('Santiago del Estero', 1);
insert into provincias (provincia, cod_pais) values ('Tierra del Fuego', 1);
insert into provincias (provincia, cod_pais) values ('Tucuman', 1); -- ID: 23

Select * from provincias where cod_pais = 1;

-- Brasil
insert into provincias (provincia, cod_pais) values ('Acre', 2);
insert into provincias (provincia, cod_pais) values ('Alagoas', 2);
insert into provincias (provincia, cod_pais) values ('Amapa', 2);
insert into provincias (provincia, cod_pais) values ('Amazonas', 2);
insert into provincias (provincia, cod_pais) values ('Bahia', 2);
insert into provincias (provincia, cod_pais) values ('Ceara', 2);
insert into provincias (provincia, cod_pais) values ('Distrito Federal', 2);
insert into provincias (provincia, cod_pais) values ('Espirito Santo', 2);
insert into provincias (provincia, cod_pais) values ('Goias', 2);
insert into provincias (provincia, cod_pais) values ('Maranhao', 2);
insert into provincias (provincia, cod_pais) values ('Mato Grosso', 2);
insert into provincias (provincia, cod_pais) values ('Mato Grosso do Sul', 2);
insert into provincias (provincia, cod_pais) values ('Minas Gerais', 2);
insert into provincias (provincia, cod_pais) values ('Para', 2);
insert into provincias (provincia, cod_pais) values ('Paraiba', 2);
insert into provincias (provincia, cod_pais) values ('Parana', 2);
insert into provincias (provincia, cod_pais) values ('Pernambuco', 2);
insert into provincias (provincia, cod_pais) values ('Piaui', 2);
insert into provincias (provincia, cod_pais) values ('Rio de Janeiro', 2);
insert into provincias (provincia, cod_pais) values ('Rio Grande do Norte', 2);
insert into provincias (provincia, cod_pais) values ('Rio Grande do Sul', 2);
insert into provincias (provincia, cod_pais) values ('Rondonia', 2);
insert into provincias (provincia, cod_pais) values ('Roraima', 2);
insert into provincias (provincia, cod_pais) values ('Santa Catarina', 2);
insert into provincias (provincia, cod_pais) values ('Sao Paulo', 2);
insert into provincias (provincia, cod_pais) values ('Sergipe', 2);
insert into provincias (provincia, cod_pais) values ('Tocantins', 2); -- ID: 50

Select * from provincias where cod_pais = 2;

-- Chile
insert into provincias (provincia, cod_pais) values ('Arica y Parinacota', 3);
insert into provincias (provincia, cod_pais) values ('Tarapaca', 3);
insert into provincias (provincia, cod_pais) values ('Antofagasta', 3);
insert into provincias (provincia, cod_pais) values ('Atacama', 3);
insert into provincias (provincia, cod_pais) values ('Coquimbo', 3);
insert into provincias (provincia, cod_pais) values ('Valparaiso', 3);
insert into provincias (provincia, cod_pais) values ('Metropolitana de Santiago', 3);
insert into provincias (provincia, cod_pais) values ('Libertador General Bernardo O''Higgins', 3);
insert into provincias (provincia, cod_pais) values ('Maule', 3);
insert into provincias (provincia, cod_pais) values ('Biobio', 3);
insert into provincias (provincia, cod_pais) values ('La Araucania', 3);
insert into provincias (provincia, cod_pais) values ('Los Rios', 3);
insert into provincias (provincia, cod_pais) values ('Los Lagos', 3);
insert into provincias (provincia, cod_pais) values ('Aysen del General Carlos Ibanez del Campo', 3);
insert into provincias (provincia, cod_pais) values ('Magallanes y de la Antartica Chilena', 3); -- ID: 65

-- Uruguay
insert into provincias (provincia, cod_pais) values ('Artigas', 4);
insert into provincias (provincia, cod_pais) values ('Canelones', 4);
insert into provincias (provincia, cod_pais) values ('Cerro Largo', 4);
insert into provincias (provincia, cod_pais) values ('Colonia', 4);
insert into provincias (provincia, cod_pais) values ('Durazno', 4);
insert into provincias (provincia, cod_pais) values ('Flores', 4);
insert into provincias (provincia, cod_pais) values ('Florida', 4);
insert into provincias (provincia, cod_pais) values ('Lavalleja', 4);
insert into provincias (provincia, cod_pais) values ('Maldonado', 4);
insert into provincias (provincia, cod_pais) values ('Montevideo', 4);
insert into provincias (provincia, cod_pais) values ('Paysandu', 4); -- ID: 76

-- Paraguay
insert into provincias (provincia, cod_pais) values ('Alto Parana', 5);
insert into provincias (provincia, cod_pais) values ('Alto Paraguay', 5);
insert into provincias (provincia, cod_pais) values ('Amambay', 5);
insert into provincias (provincia, cod_pais) values ('Asuncion', 5);
insert into provincias (provincia, cod_pais) values ('Boqueron', 5);
insert into provincias (provincia, cod_pais) values ('Caaguazu', 5);
insert into provincias (provincia, cod_pais) values ('Caazapa', 5);
insert into provincias (provincia, cod_pais) values ('Canindeyu', 5);
insert into provincias (provincia, cod_pais) values ('Central', 5);
insert into provincias (provincia, cod_pais) values ('Concepcion', 5);
insert into provincias (provincia, cod_pais) values ('Cordillera', 5);
insert into provincias (provincia, cod_pais) values ('Guaira', 5);
insert into provincias (provincia, cod_pais) values ('Itapua', 5);
insert into provincias (provincia, cod_pais) values ('Misiones', 5);
insert into provincias (provincia, cod_pais) values ('Neembucu', 5);
insert into provincias (provincia, cod_pais) values ('Paraguari', 5);
insert into provincias (provincia, cod_pais) values ('Presidente Hayes', 5);
insert into provincias (provincia, cod_pais) values ('San Pedro', 5); -- ID: 94

-- Bolivia
insert into provincias (provincia, cod_pais) values ('Chuquisaca', 6);
insert into provincias (provincia, cod_pais) values ('Cochabamba', 6);
insert into provincias (provincia, cod_pais) values ('El Beni', 6);
insert into provincias (provincia, cod_pais) values ('La Paz', 6);
insert into provincias (provincia, cod_pais) values ('Oruro', 6);
insert into provincias (provincia, cod_pais) values ('Pando', 6);
insert into provincias (provincia, cod_pais) values ('Potosi', 6);
insert into provincias (provincia, cod_pais) values ('Santa Cruz', 6);
insert into provincias (provincia, cod_pais) values ('Tarija', 6); -- ID: 102

-- Peru
insert into provincias (provincia, cod_pais) values ('Amazonas', 7);
insert into provincias (provincia, cod_pais) values ('Ancash', 7);
insert into provincias (provincia, cod_pais) values ('Apurimac', 7);
insert into provincias (provincia, cod_pais) values ('Arequipa', 7);
insert into provincias (provincia, cod_pais) values ('Ayacucho', 7);
insert into provincias (provincia, cod_pais) values ('Cajamarca', 7);
insert into provincias (provincia, cod_pais) values ('Callao', 7);
insert into provincias (provincia, cod_pais) values ('Cusco', 7);
insert into provincias (provincia, cod_pais) values ('Huancavelica', 7);
insert into provincias (provincia, cod_pais) values ('Huanuco', 7);
insert into provincias (provincia, cod_pais) values ('Ica', 7);
insert into provincias (provincia, cod_pais) values ('Junin', 7);
insert into provincias (provincia, cod_pais) values ('La Libertad', 7);
insert into provincias (provincia, cod_pais) values ('Lambayeque', 7);
insert into provincias (provincia, cod_pais) values ('Lima', 7);
insert into provincias (provincia, cod_pais) values ('Loreto', 7);
insert into provincias (provincia, cod_pais) values ('Madre de Dios', 7);
insert into provincias (provincia, cod_pais) values ('Moquegua', 7);
insert into provincias (provincia, cod_pais) values ('Pasco', 7);
insert into provincias (provincia, cod_pais) values ('Piura', 7);
insert into provincias (provincia, cod_pais) values ('Puno', 7);
insert into provincias (provincia, cod_pais) values ('San Martin', 7);
insert into provincias (provincia, cod_pais) values ('Tacna', 7);
insert into provincias (provincia, cod_pais) values ('Tumbes', 7);
insert into provincias (provincia, cod_pais) values ('Ucayali', 7); -- ID: 126

-- Ecuador
insert into provincias (provincia, cod_pais) values ('Azuay', 8);
insert into provincias (provincia, cod_pais) values ('Bolivar', 8);
insert into provincias (provincia, cod_pais) values ('Quito', 8);
insert into provincias (provincia, cod_pais) values ('Carchi', 8); -- ID: 130

-- Colombia
insert into provincias (provincia, cod_pais) values ('Amazonas', 9);
insert into provincias (provincia, cod_pais) values ('Antioquia', 9);
insert into provincias (provincia, cod_pais) values ('Arauca', 9);
insert into provincias (provincia, cod_pais) values ('Atlantico', 9);
insert into provincias (provincia, cod_pais) values ('Bogota', 9);
insert into provincias (provincia, cod_pais) values ('Bolivar', 9); -- ID: 136

-- Venezuela
insert into provincias (provincia, cod_pais) values ('Caracas', 10);
insert into provincias (provincia, cod_pais) values ('Miranda', 10);
insert into provincias (provincia, cod_pais) values ('Distrito Capital', 10); -- ID: 139

-- Estados Unidos
insert into provincias (provincia, cod_pais) values ('Alabama', 18); -- ID: 140
insert into provincias (provincia, cod_pais) values ('Alaska', 18);
insert into provincias (provincia, cod_pais) values ('Arizona', 18);
insert into provincias (provincia, cod_pais) values ('Arkansas', 18);
insert into provincias (provincia, cod_pais) values ('California', 18);
insert into provincias (provincia, cod_pais) values ('Colorado', 18);
insert into provincias (provincia, cod_pais) values ('Connecticut', 18);
insert into provincias (provincia, cod_pais) values ('Delaware', 18);
insert into provincias (provincia, cod_pais) values ('Florida', 18);
insert into provincias (provincia, cod_pais) values ('Georgia', 18);
insert into provincias (provincia, cod_pais) values ('Hawaii', 18);
insert into provincias (provincia, cod_pais) values ('Idaho', 18);
insert into provincias (provincia, cod_pais) values ('Illinois', 18);
insert into provincias (provincia, cod_pais) values ('Indiana', 18);
insert into provincias (provincia, cod_pais) values ('Iowa', 18);
insert into provincias (provincia, cod_pais) values ('Kansas', 18);
insert into provincias (provincia, cod_pais) values ('Kentucky', 18);
insert into provincias (provincia, cod_pais) values ('Louisiana', 18);
insert into provincias (provincia, cod_pais) values ('Maine', 18);
insert into provincias (provincia, cod_pais) values ('Maryland', 18);
insert into provincias (provincia, cod_pais) values ('Massachusetts', 18);
insert into provincias (provincia, cod_pais) values ('Michigan', 18);
insert into provincias (provincia, cod_pais) values ('Minnesota', 18);
insert into provincias (provincia, cod_pais) values ('Mississippi', 18);
insert into provincias (provincia, cod_pais) values ('Missouri', 18);
insert into provincias (provincia, cod_pais) values ('Montana', 18);
insert into provincias (provincia, cod_pais) values ('Nebraska', 18);
insert into provincias (provincia, cod_pais) values ('Nevada', 18);
insert into provincias (provincia, cod_pais) values ('New Hampshire', 18);
insert into provincias (provincia, cod_pais) values ('New Jersey', 18);
insert into provincias (provincia, cod_pais) values ('New Mexico', 18);
insert into provincias (provincia, cod_pais) values ('New York', 18);
insert into provincias (provincia, cod_pais) values ('North Carolina', 18);
insert into provincias (provincia, cod_pais) values ('North Dakota', 18);
insert into provincias (provincia, cod_pais) values ('Ohio', 18);
insert into provincias (provincia, cod_pais) values ('Oklahoma', 18);
insert into provincias (provincia, cod_pais) values ('Oregon', 18);
insert into provincias (provincia, cod_pais) values ('Pennsylvania', 18);
insert into provincias (provincia, cod_pais) values ('Rhode Island', 18);
insert into provincias (provincia, cod_pais) values ('South Carolina', 18);
insert into provincias (provincia, cod_pais) values ('South Dakota', 18);
insert into provincias (provincia, cod_pais) values ('Tennessee', 18);
insert into provincias (provincia, cod_pais) values ('Texas', 18);
insert into provincias (provincia, cod_pais) values ('Utah', 18);
insert into provincias (provincia, cod_pais) values ('Vermont', 18);
insert into provincias (provincia, cod_pais) values ('Virginia', 18);
insert into provincias (provincia, cod_pais) values ('Washington', 18);
insert into provincias (provincia, cod_pais) values ('West Virginia', 18);
insert into provincias (provincia, cod_pais) values ('Wisconsin', 18);
insert into provincias (provincia, cod_pais) values ('Wyoming', 18); -- ID: 190

-- Canada
insert into provincias (provincia, cod_pais) values ('Alberta', 19);
insert into provincias (provincia, cod_pais) values ('British Columbia', 19);
insert into provincias (provincia, cod_pais) values ('Newfoundland', 19);
insert into provincias (provincia, cod_pais) values ('New Brunswick', 19);
insert into provincias (provincia, cod_pais) values ('Nova Scotia', 19);
insert into provincias (provincia, cod_pais) values ('Ontario', 19);
insert into provincias (provincia, cod_pais) values ('Prince Edward Island', 19);
insert into provincias (provincia, cod_pais) values ('Quebec', 19);
insert into provincias (provincia, cod_pais) values ('Saskatchewan', 19); -- ID: 199

-- Mexico
insert into provincias (provincia, cod_pais) values ('Aguascalientes', 20); -- ID: 200
insert into provincias (provincia, cod_pais) values ('Baja California', 20);
insert into provincias (provincia, cod_pais) values ('Baja California Sur', 20);
insert into provincias (provincia, cod_pais) values ('Campeche', 20);
insert into provincias (provincia, cod_pais) values ('Chiapas', 20);
insert into provincias (provincia, cod_pais) values ('Chihuahua', 20);
insert into provincias (provincia, cod_pais) values ('Coahuila', 20);
insert into provincias (provincia, cod_pais) values ('Colima', 20);
insert into provincias (provincia, cod_pais) values ('Distrito Federal', 20);
insert into provincias (provincia, cod_pais) values ('Durango', 20);
insert into provincias (provincia, cod_pais) values ('Guanajuato', 20);
insert into provincias (provincia, cod_pais) values ('Guerrero', 20);
insert into provincias (provincia, cod_pais) values ('Hidalgo', 20);
insert into provincias (provincia, cod_pais) values ('Jalisco', 20);
insert into provincias (provincia, cod_pais) values ('Mexico', 20);
insert into provincias (provincia, cod_pais) values ('Michoacan', 20);
insert into provincias (provincia, cod_pais) values ('Morelos', 20);
insert into provincias (provincia, cod_pais) values ('Nayarit', 20);
insert into provincias (provincia, cod_pais) values ('Nuevo Leon', 20);
insert into provincias (provincia, cod_pais) values ('Oaxaca', 20);
insert into provincias (provincia, cod_pais) values ('Puebla', 20);
insert into provincias (provincia, cod_pais) values ('Queretaro', 20);
insert into provincias (provincia, cod_pais) values ('Quintana Roo', 20);
insert into provincias (provincia, cod_pais) values ('San Luis Potosi', 20);
insert into provincias (provincia, cod_pais) values ('Sinaloa', 20);
insert into provincias (provincia, cod_pais) values ('Sonora', 20);
insert into provincias (provincia, cod_pais) values ('Tabasco', 20);
insert into provincias (provincia, cod_pais) values ('Tamaulipas', 20);
insert into provincias (provincia, cod_pais) values ('Tlaxcala', 20);
insert into provincias (provincia, cod_pais) values ('Veracruz', 20);
insert into provincias (provincia, cod_pais) values ('Yucatan', 20);
insert into provincias (provincia, cod_pais) values ('Zacatecas', 20); -- ID: 228

-- Otro
insert into provincias (provincia, cod_pais) values ('Otro', 21);
insert into provincias (provincia, cod_pais) values ('Otro', 22);
insert into provincias (provincia, cod_pais) values ('Otro', 23);
insert into provincias (provincia, cod_pais) values ('Otro', 24);
insert into provincias (provincia, cod_pais) values ('Otro', 25);
insert into provincias (provincia, cod_pais) values ('Otro', 26);
insert into provincias (provincia, cod_pais) values ('Otro', 27);
insert into provincias (provincia, cod_pais) values ('Otro', 28);
insert into provincias (provincia, cod_pais) values ('Otro', 29);
insert into provincias (provincia, cod_pais) values ('Otro', 30);
insert into provincias (provincia, cod_pais) values ('Otro', 31);
insert into provincias (provincia, cod_pais) values ('Otro', 32); -- ID: 239

-- Localidades Top 5

-- Argentina
-- Buenos Aires
insert into localidades (localidad, cod_provincia) values ('Buenos Aires', 1);
insert into localidades (localidad, cod_provincia) values ('La Plata', 1);
insert into localidades (localidad, cod_provincia) values ('Mar del Plata', 1);
insert into localidades (localidad, cod_provincia) values ('Quilmes', 1);
insert into localidades (localidad, cod_provincia) values ('Lomas de Zamora', 1); -- ID: 5
-- Catamarca
insert into localidades (localidad, cod_provincia) values ('San Fernando del Valle de Catamarca', 2);
-- Chaco
insert into localidades (localidad, cod_provincia) values ('Resistencia', 3);
-- Chubut
insert into localidades (localidad, cod_provincia) values ('Rawson', 4);
-- Córdoba
insert into localidades (localidad, cod_provincia) values ('Córdoba', 5);
insert into localidades (localidad, cod_provincia) values ('Río Cuarto', 5);
insert into localidades (localidad, cod_provincia) values ('Villa María', 5);
insert into localidades (localidad, cod_provincia) values ('Villa Carlos Paz', 5);
insert into localidades (localidad, cod_provincia) values ('Río Tercero', 5); -- ID: 13
-- Corrientes
insert into localidades (localidad, cod_provincia) values ('Corrientes', 6);
-- Entre Ríos
insert into localidades (localidad, cod_provincia) values ('Paraná', 7);
-- Formosa
insert into localidades (localidad, cod_provincia) values ('Formosa', 8);
-- Jujuy
insert into localidades (localidad, cod_provincia) values ('San Salvador de Jujuy', 9);
-- La Pampa
insert into localidades (localidad, cod_provincia) values ('Santa Rosa', 10);
-- La Rioja
insert into localidades (localidad, cod_provincia) values ('La Rioja', 11);
-- Mendoza
insert into localidades (localidad, cod_provincia) values ('Mendoza', 12);
insert into localidades (localidad, cod_provincia) values ('Godoy Cruz', 12);
insert into localidades (localidad, cod_provincia) values ('Guaymallén', 12);
insert into localidades (localidad, cod_provincia) values ('Luján de Cuyo', 12);
insert into localidades (localidad, cod_provincia) values ('San Rafael', 12); -- ID: 24
-- Misiones
insert into localidades (localidad, cod_provincia) values ('Posadas', 13);
-- Neuquén
insert into localidades (localidad, cod_provincia) values ('Neuquén', 14);
-- Rio Negro
insert into localidades (localidad, cod_provincia) values ('Viedma', 15);
-- Salta
insert into localidades (localidad, cod_provincia) values ('Salta', 16);
-- San Juan
insert into localidades (localidad, cod_provincia) values ('San Juan', 17);
-- San Luis
insert into localidades (localidad, cod_provincia) values ('San Luis', 18);
-- Santa Cruz
insert into localidades (localidad, cod_provincia) values ('Río Gallegos', 19);
-- Santa Fe
insert into localidades (localidad, cod_provincia) values ('Santa Fe', 20);
insert into localidades (localidad, cod_provincia) values ('Rosario', 20);
insert into localidades (localidad, cod_provincia) values ('Venado Tuerto', 20);
insert into localidades (localidad, cod_provincia) values ('San Lorenzo', 20);
insert into localidades (localidad, cod_provincia) values ('San Cristóbal', 20); -- ID: 36
-- Santiago del Estero
insert into localidades (localidad, cod_provincia) values ('Santiago del Estero', 21);
-- Tierra del Fuego
insert into localidades (localidad, cod_provincia) values ('Ushuaia', 22);
-- Tucumán
insert into localidades (localidad, cod_provincia) values ('San Miguel de Tucumán', 23);

-- Brasil
-- Acre
insert into localidades (localidad, cod_provincia) values ('Rio Branco', 24);
-- Alagoas
insert into localidades (localidad, cod_provincia) values ('Maceió', 25);
-- Amapá
insert into localidades (localidad, cod_provincia) values ('Macapá', 26);
-- Amazonas
insert into localidades (localidad, cod_provincia) values ('Amazonas', 27);
-- Bahia
insert into localidades (localidad, cod_provincia) values ('Salvador', 28);
insert into localidades (localidad, cod_provincia) values ('Feira de Santana', 28);
insert into localidades (localidad, cod_provincia) values ('Vitória da Conquista', 28);
insert into localidades (localidad, cod_provincia) values ('Camaçari', 28);
insert into localidades (localidad, cod_provincia) values ('Ilhéus', 28); -- ID: 48
-- Ceará
insert into localidades (localidad, cod_provincia) values ('Fortaleza', 29);
insert into localidades (localidad, cod_provincia) values ('Caucaia', 29);
insert into localidades (localidad, cod_provincia) values ('Sobral', 29);
insert into localidades (localidad, cod_provincia) values ('Juazeiro do Norte', 29);
insert into localidades (localidad, cod_provincia) values ('Maracanaú', 29); -- ID: 53
-- Distrito Federal
insert into localidades (localidad, cod_provincia) values ('Brasilia', 30);
-- Espírito Santo
insert into localidades (localidad, cod_provincia) values ('Vitória', 31);
-- Goiás
insert into localidades (localidad, cod_provincia) values ('Goiânia', 32);
insert into localidades (localidad, cod_provincia) values ('Aparecida de Goiânia', 32);
insert into localidades (localidad, cod_provincia) values ('Anápolis', 32);
insert into localidades (localidad, cod_provincia) values ('Rio Verde', 32);
insert into localidades (localidad, cod_provincia) values ('Catalão', 32); -- ID: 60
-- Maranhão
insert into localidades (localidad, cod_provincia) values ('São Luís', 33);
-- Mato Grosso
insert into localidades (localidad, cod_provincia) values ('Cuiabá', 34);
-- Mato Grosso do Sul
insert into localidades (localidad, cod_provincia) values ('Campo Grande', 35);
-- Minas Gerais
insert into localidades (localidad, cod_provincia) values ('Belo Horizonte', 36);
insert into localidades (localidad, cod_provincia) values ('Contagem', 36);
insert into localidades (localidad, cod_provincia) values ('Uberlândia', 36);
insert into localidades (localidad, cod_provincia) values ('Juiz de Fora', 36);
insert into localidades (localidad, cod_provincia) values ('Betim', 36); -- ID: 68
-- Pará
insert into localidades (localidad, cod_provincia) values ('Belém', 37);
-- Paraíba
insert into localidades (localidad, cod_provincia) values ('João Pessoa', 38);
-- Paraná
insert into localidades (localidad, cod_provincia) values ('Curitiba', 39);
insert into localidades (localidad, cod_provincia) values ('Londrina', 39);
insert into localidades (localidad, cod_provincia) values ('Maringá', 39);
insert into localidades (localidad, cod_provincia) values ('Cascavel', 39);
insert into localidades (localidad, cod_provincia) values ('Ponta Grossa', 39); -- ID: 75
-- Pernambuco
insert into localidades (localidad, cod_provincia) values ('Recife', 40);
-- Piauí
insert into localidades (localidad, cod_provincia) values ('Teresina', 41);
-- Rio de Janeiro
insert into localidades (localidad, cod_provincia) values ('Rio de Janeiro', 42);
insert into localidades (localidad, cod_provincia) values ('São Gonçalo', 42);
insert into localidades (localidad, cod_provincia) values ('Duque de Caxias', 42);
insert into localidades (localidad, cod_provincia) values ('Nova Iguaçu', 42);
insert into localidades (localidad, cod_provincia) values ('Niterói', 42); -- ID: 82
-- Rio Grande do Norte
insert into localidades (localidad, cod_provincia) values ('Natal', 43);
-- Rio Grande do Sul
insert into localidades (localidad, cod_provincia) values ('Porto Alegre', 44);
insert into localidades (localidad, cod_provincia) values ('Pelotas', 44);
insert into localidades (localidad, cod_provincia) values ('Canoas', 44);
insert into localidades (localidad, cod_provincia) values ('Santa Maria', 44);
insert into localidades (localidad, cod_provincia) values ('Caxias do Sul', 44);  -- ID: 88
-- Rondônia
insert into localidades (localidad, cod_provincia) values ('Porto Velho', 45);
-- Roraima
insert into localidades (localidad, cod_provincia) values ('Boa Vista', 46);
-- Santa Catarina
insert into localidades (localidad, cod_provincia) values ('Florianópolis', 47);
insert into localidades (localidad, cod_provincia) values ('Joinville', 47);
insert into localidades (localidad, cod_provincia) values ('Chapecó', 47);
insert into localidades (localidad, cod_provincia) values ('São José', 47);
insert into localidades (localidad, cod_provincia) values ('Blumenau', 47);
-- São Paulo
insert into localidades (localidad, cod_provincia) values ('São Paulo', 48);
insert into localidades (localidad, cod_provincia) values ('Guarulhos', 48);
insert into localidades (localidad, cod_provincia) values ('Campinas', 48);
insert into localidades (localidad, cod_provincia) values ('São Bernardo do Campo', 48);
insert into localidades (localidad, cod_provincia) values ('São José dos Campos', 48); -- ID: 100

-- Estados Unidos 
-- Alabama top 3
insert into localidades (localidad, cod_provincia) values ('Birmingham', 140);
insert into localidades (localidad, cod_provincia) values ('Montgomery', 140);
insert into localidades (localidad, cod_provincia) values ('Mobile', 140); -- ID: 103
-- Alaska top 3
insert into localidades (localidad, cod_provincia) values ('Anchorage', 141);
insert into localidades (localidad, cod_provincia) values ('Fairbanks', 141);
insert into localidades (localidad, cod_provincia) values ('Juneau', 141); -- ID: 106
-- Arizona top 3
insert into localidades (localidad, cod_provincia) values ('Phoenix', 142);
insert into localidades (localidad, cod_provincia) values ('Tucson', 142); 
insert into localidades (localidad, cod_provincia) values ('Mesa', 142); -- ID: 109
-- Arkansas top 3
insert into localidades (localidad, cod_provincia) values ('Little Rock', 143);
insert into localidades (localidad, cod_provincia) values ('Fort Smith', 143);
insert into localidades (localidad, cod_provincia) values ('Fayetteville', 143); -- ID: 112
-- California top 3
insert into localidades (localidad, cod_provincia) values ('Los Angeles', 144);
insert into localidades (localidad, cod_provincia) values ('San Diego', 144);
insert into localidades (localidad, cod_provincia) values ('San Jose', 144); -- ID: 115
-- Colorado top 3
insert into localidades (localidad, cod_provincia) values ('Denver', 145);
insert into localidades (localidad, cod_provincia) values ('Colorado Springs', 145);
insert into localidades (localidad, cod_provincia) values ('Aurora', 145); -- ID: 118
-- Connecticut top 3
insert into localidades (localidad, cod_provincia) values ('Bridgeport', 146);
insert into localidades (localidad, cod_provincia) values ('New Haven', 146);
insert into localidades (localidad, cod_provincia) values ('Hartford', 146); -- ID: 121
-- Delaware top 3
insert into localidades (localidad, cod_provincia) values ('Wilmington', 147);
insert into localidades (localidad, cod_provincia) values ('Dover', 147);
insert into localidades (localidad, cod_provincia) values ('Newark', 147); -- ID: 124
-- Florida top 3
insert into localidades (localidad, cod_provincia) values ('Jacksonville', 148);
insert into localidades (localidad, cod_provincia) values ('Miami', 148);
insert into localidades (localidad, cod_provincia) values ('Tampa', 148); -- ID: 127
-- Georgia top 3
insert into localidades (localidad, cod_provincia) values ('Atlanta', 149);
insert into localidades (localidad, cod_provincia) values ('Columbus', 149);
insert into localidades (localidad, cod_provincia) values ('Augusta', 149); -- ID: 130
-- Hawaii top 3
insert into localidades (localidad, cod_provincia) values ('Honolulu', 150);
insert into localidades (localidad, cod_provincia) values ('Hilo', 150);
insert into localidades (localidad, cod_provincia) values ('Kailua', 150); -- ID: 133
-- Idaho top 3
insert into localidades (localidad, cod_provincia) values ('Boise', 151);
insert into localidades (localidad, cod_provincia) values ('Nampa', 151);
insert into localidades (localidad, cod_provincia) values ('Meridian', 151);  -- ID: 136
-- Illinois top 3 
insert into localidades (localidad, cod_provincia) values ('Chicago', 152);
insert into localidades (localidad, cod_provincia) values ('Aurora', 152);
insert into localidades (localidad, cod_provincia) values ('Rockford', 152);    -- ID: 139
-- Indiana top 3
insert into localidades (localidad, cod_provincia) values ('Indianapolis', 153);
insert into localidades (localidad, cod_provincia) values ('Fort Wayne', 153);
insert into localidades (localidad, cod_provincia) values ('Evansville', 153);  -- ID: 142
-- Iowa top 3
insert into localidades (localidad, cod_provincia) values ('Des Moines', 154);
insert into localidades (localidad, cod_provincia) values ('Cedar Rapids', 154);
insert into localidades (localidad, cod_provincia) values ('Davenport', 154); -- ID: 145
-- Kansas top 3
insert into localidades (localidad, cod_provincia) values ('Wichita', 155);
insert into localidades (localidad, cod_provincia) values ('Overland Park', 155);
insert into localidades (localidad, cod_provincia) values ('Kansas City', 155); -- ID: 148
-- Kentucky top 3
insert into localidades (localidad, cod_provincia) values ('Louisville', 156);
insert into localidades (localidad, cod_provincia) values ('Lexington', 156);
insert into localidades (localidad, cod_provincia) values ('Bowling Green', 156); -- ID: 151
-- Louisiana top 3
insert into localidades (localidad, cod_provincia) values ('New Orleans', 157);
insert into localidades (localidad, cod_provincia) values ('Baton Rouge', 157);
insert into localidades (localidad, cod_provincia) values ('Shreveport', 157);  -- ID: 154
-- Maine top 3
insert into localidades (localidad, cod_provincia) values ('Portland', 158);
insert into localidades (localidad, cod_provincia) values ('Lewiston', 158);
insert into localidades (localidad, cod_provincia) values ('Bangor', 158);  -- ID: 157
-- Maryland top 3
insert into localidades (localidad, cod_provincia) values ('Baltimore', 159);
insert into localidades (localidad, cod_provincia) values ('Frederick', 159);
insert into localidades (localidad, cod_provincia) values ('Rockville', 159); -- ID: 160
-- Massachusetts top 3
insert into localidades (localidad, cod_provincia) values ('Boston', 160);
insert into localidades (localidad, cod_provincia) values ('Worcester', 160);
insert into localidades (localidad, cod_provincia) values ('Springfield', 160);   -- ID: 163
-- Michigan top 3
insert into localidades (localidad, cod_provincia) values ('Detroit', 161);
insert into localidades (localidad, cod_provincia) values ('Grand Rapids', 161);
insert into localidades (localidad, cod_provincia) values ('Warren', 161);  -- ID: 166
-- Minnesota top 3  
insert into localidades (localidad, cod_provincia) values ('Minneapolis', 162);
insert into localidades (localidad, cod_provincia) values ('Saint Paul', 162);
insert into localidades (localidad, cod_provincia) values ('Rochester', 162); -- ID: 169
-- Mississippi top 3
insert into localidades (localidad, cod_provincia) values ('Jackson', 163);
insert into localidades (localidad, cod_provincia) values ('Gulfport', 163);
insert into localidades (localidad, cod_provincia) values ('Southaven', 163); -- ID: 172
-- Missouri top 3
insert into localidades (localidad, cod_provincia) values ('Kansas City', 164);
insert into localidades (localidad, cod_provincia) values ('Saint Louis', 164);
insert into localidades (localidad, cod_provincia) values ('Springfield', 164); -- ID: 175
-- Montana top 3
insert into localidades (localidad, cod_provincia) values ('Billings', 165);
insert into localidades (localidad, cod_provincia) values ('Missoula', 165);
insert into localidades (localidad, cod_provincia) values ('Great Falls', 165); -- ID: 178
-- Nebraska top 3
insert into localidades (localidad, cod_provincia) values ('Omaha', 166);
insert into localidades (localidad, cod_provincia) values ('Lincoln', 166);
insert into localidades (localidad, cod_provincia) values ('Bellevue', 166);  -- ID: 181
-- Nevada top 3
insert into localidades (localidad, cod_provincia) values ('Las Vegas', 167);
insert into localidades (localidad, cod_provincia) values ('Henderson', 167);
insert into localidades (localidad, cod_provincia) values ('Reno', 167);    -- ID: 184
-- New Hampshire top 3
insert into localidades (localidad, cod_provincia) values ('Manchester', 168);
insert into localidades (localidad, cod_provincia) values ('Nashua', 168);
insert into localidades (localidad, cod_provincia) values ('Concord', 168); -- ID: 187
-- New Jersey top 3
insert into localidades (localidad, cod_provincia) values ('Newark', 169);
insert into localidades (localidad, cod_provincia) values ('Jersey City', 169);
insert into localidades (localidad, cod_provincia) values ('Paterson', 169);  -- ID: 190
-- New Mexico top 3
insert into localidades (localidad, cod_provincia) values ('Albuquerque', 170);
insert into localidades (localidad, cod_provincia) values ('Las Cruces', 170);
insert into localidades (localidad, cod_provincia) values ('Rio Rancho', 170);  -- ID: 193
-- New York top 3
insert into localidades (localidad, cod_provincia) values ('New York', 171);
insert into localidades (localidad, cod_provincia) values ('Buffalo', 171);
insert into localidades (localidad, cod_provincia) values ('Rochester', 171); -- ID: 196
-- North Carolina top 3
insert into localidades (localidad, cod_provincia) values ('Charlotte', 172);
insert into localidades (localidad, cod_provincia) values ('Raleigh', 172);
insert into localidades (localidad, cod_provincia) values ('Greensboro', 172);  -- ID: 199
-- North Dakota top 3
insert into localidades (localidad, cod_provincia) values ('Fargo', 173);
insert into localidades (localidad, cod_provincia) values ('Bismarck', 173);
insert into localidades (localidad, cod_provincia) values ('Grand Forks', 173); -- ID: 202
-- Ohio top 3
insert into localidades (localidad, cod_provincia) values ('Columbus', 174);
insert into localidades (localidad, cod_provincia) values ('Cleveland', 174);
insert into localidades (localidad, cod_provincia) values ('Cincinnati', 174);  -- ID: 205
-- Oklahoma top 3
insert into localidades (localidad, cod_provincia) values ('Oklahoma City', 175);
insert into localidades (localidad, cod_provincia) values ('Tulsa', 175);
  insert into localidades (localidad, cod_provincia) values ('Norman', 175);  -- ID: 208
  -- Oregon top 3
insert into localidades (localidad, cod_provincia) values ('Portland', 176);
insert into localidades (localidad, cod_provincia) values ('Eugene', 176);
insert into localidades (localidad, cod_provincia) values ('Salem', 176); -- ID: 211
-- Pennsylvania top 3
insert into localidades (localidad, cod_provincia) values ('Philadelphia', 177);
insert into localidades (localidad, cod_provincia) values ('Pittsburgh', 177);
insert into localidades (localidad, cod_provincia) values ('Allentown', 177); -- ID: 214
-- Rhode Island top 3
insert into localidades (localidad, cod_provincia) values ('Providence', 178);
insert into localidades (localidad, cod_provincia) values ('Warwick', 178);
insert into localidades (localidad, cod_provincia) values ('Cranston', 178);  -- ID: 217
-- South Carolina top 3
insert into localidades (localidad, cod_provincia) values ('Columbia', 179);
insert into localidades (localidad, cod_provincia) values ('Charleston', 179);
insert into localidades (localidad, cod_provincia) values ('North Charleston', 179);  -- ID: 220
-- South Dakota top 3 
insert into localidades (localidad, cod_provincia) values ('Sioux Falls', 180);
insert into localidades (localidad, cod_provincia) values ('Rapid City', 180);
insert into localidades (localidad, cod_provincia) values ('Aberdeen', 180);  -- ID: 223
-- Tennessee top 3
insert into localidades (localidad, cod_provincia) values ('Memphis', 181);
insert into localidades (localidad, cod_provincia) values ('Nashville', 181);
insert into localidades (localidad, cod_provincia) values ('Knoxville', 181); -- ID: 226
-- Texas top 3
insert into localidades (localidad, cod_provincia) values ('Houston', 182);
insert into localidades (localidad, cod_provincia) values ('San Antonio', 182);
insert into localidades (localidad, cod_provincia) values ('Dallas', 182);  -- ID: 229
-- Utah top 3
insert into localidades (localidad, cod_provincia) values ('Salt Lake City', 183);
insert into localidades (localidad, cod_provincia) values ('West Valley City', 183);  
insert into localidades (localidad, cod_provincia) values ('Provo', 183); -- ID: 232
-- Vermont top 3
insert into localidades (localidad, cod_provincia) values ('Burlington', 184);
insert into localidades (localidad, cod_provincia) values ('South Burlington', 184);
insert into localidades (localidad, cod_provincia) values ('Rutland', 184); -- ID: 235
-- Virginia top 3
insert into localidades (localidad, cod_provincia) values ('Virginia Beach', 185);
insert into localidades (localidad, cod_provincia) values ('Norfolk', 185);
insert into localidades (localidad, cod_provincia) values ('Chesapeake', 185);  -- ID: 238
-- Washington top 3
insert into localidades (localidad, cod_provincia) values ('Seattle', 186);
insert into localidades (localidad, cod_provincia) values ('Spokane', 186);
insert into localidades (localidad, cod_provincia) values ('Tacoma', 186);  -- ID: 241
-- West Virginia top 3
insert into localidades (localidad, cod_provincia) values ('Charleston', 187);
insert into localidades (localidad, cod_provincia) values ('Huntington', 187);
insert into localidades (localidad, cod_provincia) values ('Parkersburg', 187); -- ID: 244
-- Wisconsin top 3
insert into localidades (localidad, cod_provincia) values ('Milwaukee', 188);
insert into localidades (localidad, cod_provincia) values ('Madison', 188);
insert into localidades (localidad, cod_provincia) values ('Green Bay', 188); -- ID: 247
-- Wyoming top 3
insert into localidades (localidad, cod_provincia) values ('Cheyenne', 189);
insert into localidades (localidad, cod_provincia) values ('Casper', 189);
insert into localidades (localidad, cod_provincia) values ('Laramie', 189); -- ID: 250


-- Documentos
insert into Documentos (tipo_doc) values ('Dni');
insert into Documentos (tipo_doc) values ('Pasaporte');
insert into Documentos (tipo_doc) values ('Obra social');
insert into Documentos (tipo_doc) values ('Licencia de conducir');


-- Sexos
insert into Sexos (tipo) values ('Hombre');
insert into Sexos (tipo) values ('Mujer');
insert into Sexos (tipo) values ('Otro');

-- Clientes
insert into Clientes (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, nro_afiliado, fecha_nac, id_tipo_sexo) values ('Juan', 'Perez', 1, "24262153", 9, '1414', 'Mendoza', 9, '1997-10-08', 1);
insert into Clientes (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, nro_afiliado, fecha_nac, id_tipo_sexo) values ('Maria', 'Flores', 1, "36765125", 1, '2336', 'Rivadavia', 10, '1996-03-20', 2);
insert into Clientes (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, nro_afiliado, fecha_nac, id_tipo_sexo) values ('Silvia', 'Saravia', 1, "40679134", 10, '1472', 'Mitre', 11, '1997-06-25', 2);
insert into Clientes (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, nro_afiliado, fecha_nac, id_tipo_sexo) values ('Pablo', 'Gomez', 1, "32346851", 2, '2448', 'Calle 16', 12, '1997-11-30', 1);
insert into Clientes (nombre, apellido, id_tipo_doc, nro_doc, cod_localidad, nro_calle, calle, nro_afiliado, fecha_nac, id_tipo_sexo) values ('Rocio', 'Toledo', 1, "26497316", 12, '3546', 'Alvear', 13, '1997-02-15', 2);
select * from Clientes;

-- Tipos de transferencias
insert into tipos_transferencias (tipo_transferencia) values ('transferencia_interna');
insert into tipos_transferencias (tipo_transferencia) values ('transferencia_externa');
insert into tipos_transferencias (tipo_transferencia) values ('transferencia_internacional');
insert into tipos_transferencias (tipo_transferencia) values ('transferencia_urgente');

-- Tipos de contactos
insert into tipos_contactos (tipo_contacto) values ('email');
insert into tipos_contactos (tipo_contacto) values ('telefono');
insert into tipos_contactos (tipo_contacto) values ('linkedin');
insert into tipos_contactos (tipo_contacto) values ('telegram');
insert into tipos_contactos (tipo_contacto) values ('instagram');

