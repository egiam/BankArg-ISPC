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
insert into paises (pais) ('Brasil');
insert into paises (pais) ('Chile');
insert into paises (pais) ('Uruguay');
insert into paises (pais) ('Paraguay');
insert into paises (pais) ('Bolivia');
insert into paises (pais) ('Peru');
insert into paises (pais) ('Ecuador');
insert into paises (pais) ('Colombia');
insert into paises (pais) ('Venezuela');
insert into paises (pais) ('Panama');
insert into paises (pais) ('Costa Rica');
insert into paises (pais) ('El Salvador');
insert into paises (pais) ('Guatemala');
insert into paises (pais) ('Honduras');
insert into paises (pais) ('Nicaragua');
insert into paises (pais) ('Mexico');
insert into paises (pais) ('Estados Unidos');
insert into paises (pais) ('Canada');
insert into paises (pais) ('España');
insert into paises (pais) ('Francia');
insert into paises (pais) ('Italia');
insert into paises (pais) ('Alemania');
insert into paises (pais) ('Inglaterra');
insert into paises (pais) ('Portugal');
insert into paises (pais) ('Rusia');
insert into paises (pais) ('China');
insert into paises (pais) ('Japon');
insert into paises (pais) ('Corea del Sur');
insert into paises (pais) ('Australia');
insert into paises (pais) ('Nueva Zelanda');
insert into paises (pais) ('Sudafrica');
insert into paises (pais) ('Otro');

select * from paises


-- Insertar Provincias

-- Arg
insert into provincias (provincia, cod_pais) values ('Buenos Aires', 1);
insert into provincias values ('Catamarca', 1);
insert into provincias values ('Chaco', 1);
insert into provincias values ('Chubut', 1);
insert into provincias values ('Cordoba', 1);
insert into provincias values ('Corrientes', 1);
insert into provincias values ('Entre Rios', 1);
insert into provincias values ('Formosa', 1);
insert into provincias values ('Jujuy', 1);
insert into provincias values ('La Pampa', 1);
insert into provincias values ('La Rioja', 1);
insert into provincias values ('Mendoza', 1);
insert into provincias values ('Misiones', 1);
insert into provincias values ('Neuquen', 1);
insert into provincias values ('Rio Negro', 1);
insert into provincias values ('Salta', 1);
insert into provincias values ('San Juan', 1);
insert into provincias values ('San Luis', 1);
insert into provincias values ('Santa Cruz', 1);
insert into provincias values ('Santa Fe', 1);
insert into provincias values ('Santiago del Estero', 1);
insert into provincias values ('Tierra del Fuego', 1);
insert into provincias values ('Tucuman', 1);

-- Brasil
insert into provincias values ('Acre', 2);
insert into provincias values ('Alagoas', 2);
insert into provincias values ('Amapa', 2);
insert into provincias values ('Amazonas', 2);
insert into provincias values ('Bahia', 2);
insert into provincias values ('Ceara', 2);
insert into provincias values ('Distrito Federal', 2);
insert into provincias values ('Espirito Santo', 2);
insert into provincias values ('Goias', 2);
insert into provincias values ('Maranhao', 2);
insert into provincias values ('Mato Grosso', 2);
insert into provincias values ('Mato Grosso do Sul', 2);
insert into provincias values ('Minas Gerais', 2);
insert into provincias values ('Para', 2);
insert into provincias values ('Paraiba', 2);
insert into provincias values ('Parana', 2);
insert into provincias values ('Pernambuco', 2);
insert into provincias values ('Piaui', 2);
insert into provincias values ('Rio de Janeiro', 2);
insert into provincias values ('Rio Grande do Norte', 2);
insert into provincias values ('Rio Grande do Sul', 2);
insert into provincias values ('Rondonia', 2);
insert into provincias values ('Roraima', 2);
insert into provincias values ('Santa Catarina', 2);
insert into provincias values ('Sao Paulo', 2);
insert into provincias values ('Sergipe', 2);
insert into provincias values ('Tocantins', 2);

-- Chile
insert into provincias values ('Arica y Parinacota', 3);
insert into provincias values ('Tarapaca', 3);
insert into provincias values ('Antofagasta', 3);
insert into provincias values ('Atacama', 3);
insert into provincias values ('Coquimbo', 3);
insert into provincias values ('Valparaiso', 3);
insert into provincias values ('Metropolitana de Santiago', 3);
insert into provincias values ('Libertador General Bernardo O''Higgins', 3);
insert into provincias values ('Maule', 3);
insert into provincias values ('Biobio', 3);
insert into provincias values ('La Araucania', 3);
insert into provincias values ('Los Rios', 3);
insert into provincias values ('Los Lagos', 3);
insert into provincias values ('Aysen del General Carlos Ibanez del Campo', 3);
insert into provincias values ('Magallanes y de la Antartica Chilena', 3);

-- Uruguay
insert into provincias values ('Artigas', 4);
insert into provincias values ('Canelones', 4);
insert into provincias values ('Cerro Largo', 4);
insert into provincias values ('Colonia', 4);
insert into provincias values ('Durazno', 4);
insert into provincias values ('Flores', 4);
insert into provincias values ('Florida', 4);
insert into provincias values ('Lavalleja', 4);
insert into provincias values ('Maldonado', 4);
insert into provincias values ('Montevideo', 4);
insert into provincias values ('Paysandu', 4);

-- Paraguay
insert into provincias values ('Alto Parana', 5);
insert into provincias values ('Alto Paraguay', 5);
insert into provincias values ('Amambay', 5);
insert into provincias values ('Asuncion', 5);
insert into provincias values ('Boqueron', 5);
insert into provincias values ('Caaguazu', 5);
insert into provincias values ('Caazapa', 5);
insert into provincias values ('Canindeyu', 5);
insert into provincias values ('Central', 5);
insert into provincias values ('Concepcion', 5);
insert into provincias values ('Cordillera', 5);
insert into provincias values ('Guaira', 5);
insert into provincias values ('Itapua', 5);
insert into provincias values ('Misiones', 5);
insert into provincias values ('Neembucu', 5);
insert into provincias values ('Paraguari', 5);
insert into provincias values ('Presidente Hayes', 5);
insert into provincias values ('San Pedro', 5);

-- Bolivia
insert into provincias values ('Chuquisaca', 6);
insert into provincias values ('Cochabamba', 6);
insert into provincias values ('El Beni', 6);
insert into provincias values ('La Paz', 6);
insert into provincias values ('Oruro', 6);
insert into provincias values ('Pando', 6);
insert into provincias values ('Potosi', 6);
insert into provincias values ('Santa Cruz', 6);
insert into provincias values ('Tarija', 6);

-- Peru
insert into provincias values ('Amazonas', 7);
insert into provincias values ('Ancash', 7);
insert into provincias values ('Apurimac', 7);
insert into provincias values ('Arequipa', 7);
insert into provincias values ('Ayacucho', 7);
insert into provincias values ('Cajamarca', 7);
insert into provincias values ('Callao', 7);
insert into provincias values ('Cusco', 7);
insert into provincias values ('Huancavelica', 7);
insert into provincias values ('Huanuco', 7);
insert into provincias values ('Ica', 7);
insert into provincias values ('Junin', 7);
insert into provincias values ('La Libertad', 7);
insert into provincias values ('Lambayeque', 7);
insert into provincias values ('Lima', 7);
insert into provincias values ('Loreto', 7);
insert into provincias values ('Madre de Dios', 7);
insert into provincias values ('Moquegua', 7);
insert into provincias values ('Pasco', 7);
insert into provincias values ('Piura', 7);
insert into provincias values ('Puno', 7);
insert into provincias values ('San Martin', 7);
insert into provincias values ('Tacna', 7);
insert into provincias values ('Tumbes', 7);
insert into provincias values ('Ucayali', 7);

-- Ecuador
insert into provincias values ('Azuay', 8);
insert into provincias values ('Bolivar', 8);
insert into provincias values ('Quito', 8);
insert into provincias values ('Carchi', 8);

-- Colombia
insert into provincias values ('Amazonas', 9);
insert into provincias values ('Antioquia', 9);
insert into provincias values ('Arauca', 9);
insert into provincias values ('Atlantico', 9);
insert into provincias values ('Bogota', 9);
insert into provincias values ('Bolivar', 9);

-- Venezuela
insert into provincias values ('Caracas', 10);
insert into provincias values ('Miranda', 10);
insert into provincias values ('Distrito Capital', 10);

-- Estados Unidos
insert into provincias values ('Alabama', 18);
insert into provincias values ('Alaska', 18);
insert into provincias values ('Arizona', 18);
insert into provincias values ('Arkansas', 18);
insert into provincias values ('California', 18);
insert into provincias values ('Colorado', 18);
insert into provincias values ('Connecticut', 18);
insert into provincias values ('Delaware', 18);
insert into provincias values ('Florida', 18);
insert into provincias values ('Georgia', 18);
insert into provincias values ('Hawaii', 18);
insert into provincias values ('Idaho', 18);
insert into provincias values ('Illinois', 18);
insert into provincias values ('Indiana', 18);
insert into provincias values ('Iowa', 18);
insert into provincias values ('Kansas', 18);
insert into provincias values ('Kentucky', 18);
insert into provincias values ('Louisiana', 18);
insert into provincias values ('Maine', 18);
insert into provincias values ('Maryland', 18);
insert into provincias values ('Massachusetts', 18);
insert into provincias values ('Michigan', 18);
insert into provincias values ('Minnesota', 18);
insert into provincias values ('Mississippi', 18);
insert into provincias values ('Missouri', 18);
insert into provincias values ('Montana', 18);
insert into provincias values ('Nebraska', 18);
insert into provincias values ('Nevada', 18);
insert into provincias values ('New Hampshire', 18);
insert into provincias values ('New Jersey', 18);
insert into provincias values ('New Mexico', 18);
insert into provincias values ('New York', 18);
insert into provincias values ('North Carolina', 18);
insert into provincias values ('North Dakota', 18);
insert into provincias values ('Ohio', 18);
insert into provincias values ('Oklahoma', 18);
insert into provincias values ('Oregon', 18);
insert into provincias values ('Pennsylvania', 18);
insert into provincias values ('Rhode Island', 18);
insert into provincias values ('South Carolina', 18);
insert into provincias values ('South Dakota', 18);
insert into provincias values ('Tennessee', 18);
insert into provincias values ('Texas', 18);
insert into provincias values ('Utah', 18);
insert into provincias values ('Vermont', 18);
insert into provincias values ('Virginia', 18);
insert into provincias values ('Washington', 18);
insert into provincias values ('West Virginia', 18);
insert into provincias values ('Wisconsin', 18);
insert into provincias values ('Wyoming', 18);

-- Canada
insert into provincias values ('Alberta', 19);
insert into provincias values ('British Columbia', 19);
insert into provincias values ('Newfoundland', 19);
insert into provincias values ('New Brunswick', 19);
insert into provincias values ('Nova Scotia', 19);
insert into provincias values ('Ontario', 19);
insert into provincias values ('Prince Edward Island', 19);
insert into provincias values ('Quebec', 19);
insert into provincias values ('Saskatchewan', 19);

-- Mexico
insert into provincias values ('Aguascalientes', 20);
insert into provincias values ('Baja California', 20);
insert into provincias values ('Baja California Sur', 20);
insert into provincias values ('Campeche', 20);
insert into provincias values ('Chiapas', 20);
insert into provincias values ('Chihuahua', 20);
insert into provincias values ('Coahuila', 20);
insert into provincias values ('Colima', 20);
insert into provincias values ('Distrito Federal', 20);
insert into provincias values ('Durango', 20);
insert into provincias values ('Guanajuato', 20);
insert into provincias values ('Guerrero', 20);
insert into provincias values ('Hidalgo', 20);
insert into provincias values ('Jalisco', 20);
insert into provincias values ('Mexico', 20);
insert into provincias values ('Michoacan', 20);
insert into provincias values ('Morelos', 20);
insert into provincias values ('Nayarit', 20);
insert into provincias values ('Nuevo Leon', 20);
insert into provincias values ('Oaxaca', 20);
insert into provincias values ('Puebla', 20);
insert into provincias values ('Queretaro', 20);
insert into provincias values ('Quintana Roo', 20);
insert into provincias values ('San Luis Potosi', 20);
insert into provincias values ('Sinaloa', 20);
insert into provincias values ('Sonora', 20);
insert into provincias values ('Tabasco', 20);
insert into provincias values ('Tamaulipas', 20);
insert into provincias values ('Tlaxcala', 20);
insert into provincias values ('Veracruz', 20);
insert into provincias values ('Yucatan', 20);
insert into provincias values ('Zacatecas', 20);

-- Otro
insert into provincias values ('Otro', 21);
insert into provincias values ('Otro', 22);
insert into provincias values ('Otro', 23);
insert into provincias values ('Otro', 24);
insert into provincias values ('Otro', 25);
insert into provincias values ('Otro', 26);
insert into provincias values ('Otro', 27);
insert into provincias values ('Otro', 28);
insert into provincias values ('Otro', 29);
insert into provincias values ('Otro', 30);
insert into provincias values ('Otro', 31);
insert into provincias values ('Otro', 32);

-- Localidades Top 5

-- Argentina
-- Buenos Aires
insert into localidades values ('Buenos Aires', 1);
insert into localidades values ('La Plata', 1);
insert into localidades values ('Mar del Plata', 1);
insert into localidades values ('Quilmes', 1);
insert into localidades values ('Lomas de Zamora', 1);
-- Catamarca
insert into localidades values ('San Fernando del Valle de Catamarca', 2);
-- Chaco
insert into localidades values ('Resistencia', 3);
-- Chubut
insert into localidades values ('Rawson', 4);
-- Córdoba
insert into localidades values ('Córdoba', 5);
insert into localidades values ('Río Cuarto', 5);
insert into localidades values ('Villa María', 5);
insert into localidades values ('Villa Carlos Paz', 5);
insert into localidades values ('Río Tercero', 5);
-- Corrientes
insert into localidades values ('Corrientes', 6);
-- Entre Ríos
insert into localidades values ('Paraná', 7);
-- Formosa
insert into localidades values ('Formosa', 8);
-- Jujuy
insert into localidades values ('San Salvador de Jujuy', 9);
-- La Pampa
insert into localidades values ('Santa Rosa', 10);
-- La Rioja
insert into localidades values ('La Rioja', 11);
-- Mendoza
insert into localidades values ('Mendoza', 12);
insert into localidades values ('Godoy Cruz', 12);
insert into localidades values ('Guaymallén', 12);
insert into localidades values ('Luján de Cuyo', 12);
insert into localidades values ('San Rafael', 12);
-- Misiones
insert into localidades values ('Posadas', 13);
-- Neuquén
insert into localidades values ('Neuquén', 14);
-- Rio Negro
insert into localidades values ('Viedma', 15);
-- Salta
insert into localidades values ('Salta', 16);
-- San Juan
insert into localidades values ('San Juan', 17);
-- San Luis
insert into localidades values ('San Luis', 18);
-- Santa Cruz
insert into localidades values ('Río Gallegos', 19);
-- Santa Fe
insert into localidades values ('Santa Fe', 20);
insert into localidades values ('Rosario', 20);
insert into localidades values ('Venado Tuerto', 20);
insert into localidades values ('San Lorenzo', 20);
insert into localidades values ('San Cristóbal', 20);
-- Santiago del Estero
insert into localidades values ('Santiago del Estero', 21);
-- Tierra del Fuego
insert into localidades values ('Ushuaia', 22);
-- Tucumán
insert into localidades values ('San Miguel de Tucumán', 23);

-- Brasil
-- Acre
insert into localidades values ('Rio Branco', 24);
-- Alagoas
insert into localidades values ('Maceió', 25);
-- Amapá
insert into localidades values ('Macapá', 26);
-- Amazonas
insert into localidades values ('Amazonas', 27);
-- Bahia
insert into localidades values ('Salvador', 28);
insert into localidades values ('Feira de Santana', 28);
insert into localidades values ('Vitória da Conquista', 28);
insert into localidades values ('Camaçari', 28);
insert into localidades values ('Ilhéus', 28);
-- Ceará
insert into localidades values ('Fortaleza', 29);
insert into localidades values ('Caucaia', 29);
insert into localidades values ('Sobral', 29);
insert into localidades values ('Juazeiro do Norte', 29);
insert into localidades values ('Maracanaú', 29);
-- Distrito Federal
insert into localidades values ('Brasilia', 30);
-- Espírito Santo
insert into localidades values ('Vitória', 31);
-- Goiás
insert into localidades values ('Goiânia', 32);
insert into localidades values ('Aparecida de Goiânia', 32);
insert into localidades values ('Anápolis', 32);
insert into localidades values ('Rio Verde', 32);
insert into localidades values ('Catalão', 32);
-- Maranhão
insert into localidades values ('São Luís', 33);
-- Mato Grosso
insert into localidades values ('Cuiabá', 34);
-- Mato Grosso do Sul
insert into localidades values ('Campo Grande', 35);
-- Minas Gerais
insert into localidades values ('Belo Horizonte', 36);
insert into localidades values ('Contagem', 36);
insert into localidades values ('Uberlândia', 36);
insert into localidades values ('Juiz de Fora', 36);
insert into localidades values ('Betim', 36);
-- Pará
insert into localidades values ('Belém', 37);
-- Paraíba
insert into localidades values ('João Pessoa', 38);
-- Paraná
insert into localidades values ('Curitiba', 39);
insert into localidades values ('Londrina', 39);
insert into localidades values ('Maringá', 39);
insert into localidades values ('Cascavel', 39);
insert into localidades values ('Ponta Grossa', 39);
-- Pernambuco






