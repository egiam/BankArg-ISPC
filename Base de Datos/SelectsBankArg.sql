-- Procedure de Select con localidad, provincia y pais
DELIMITER $$
CREATE or REPLACE PROCEDURE `select_localidad_provincia_pais`()
BEGIN
SELECT l.localidad as localidad, p.provincia as provincia, pa.pais as pais
FROM localidades l 
INNER JOIN provincias p ON l.cod_provincia = p.cod_provincia
INNER JOIN paises pa ON p.cod_pais = pa.cod_pais;
END$$
DELIMITER ;

call select_localidad_provincia_pais();

-- Procedure de Select con tipo de documento
DELIMITER $$
CREATE or REPLACE PROCEDURE `select_tipo_documento`()
BEGIN
SELECT * FROM Documentos;
END$$
DELIMITER ;

call select_tipo_documento();

-- Procedure de Select con tipo de sexo
DELIMITER $$
CREATE or REPLACE PROCEDURE `select_tipo_sexo`()
BEGIN
SELECT * FROM Sexos;
END$$
DELIMITER ;

call select_tipo_sexo();

-- Procedure de Select con tipo de contacto
DELIMITER $$
CREATE or REPLACE PROCEDURE `select_tipo_contacto`()
BEGIN
SELECT * FROM Tipos_contactos;
END$$
DELIMITER ;

call select_tipo_contacto();

-- Procedure de Select con clientes con su pais, provincia, localidad, tipo de documento, tipo de sexo y tipo de contacto
DELIMITER $$
CREATE or REPLACE PROCEDURE `select_cliente`()
BEGIN
SELECT c.id_cliente, c.nombre, c.apellido, d.tipo_doc, c.nro_doc, l.localidad, p.provincia, pa.pais, c.nro_calle, c.calle, c.fecha_nac, s.tipo as sexo, tc.tipo_contacto 
FROM Clientes c 
LEFT JOIN Documentos d ON c.id_tipo_doc = d.id_tipo_doc
LEFT JOIN Localidades l ON c.cod_localidad = l.cod_localidad
INNER JOIN Provincias p ON l.cod_provincia = p.cod_provincia
INNER JOIN Paises pa ON p.cod_pais = pa.cod_pais
LEFT JOIN Sexos s ON c.id_tipo_sexo = s.id_tipo_sexo
LEFT JOIN Contactos co ON c.id_cliente = co.id_cliente
LEFT JOIN Tipos_contactos tc ON co.id_tipo_contacto = tc.id_tipo_contacto;
END$$
DELIMITER ;

call select_cliente();

-- Procedure de Select con empleados con su pais, provincia, localidad, tipo de documento, tipo de sexo y tipo de contacto
DELIMITER $$
CREATE or REPLACE PROCEDURE `select_empleado`()
BEGIN
SELECT e.id_empleado, e.nombre, e.apellido, d.tipo_doc, e.nro_doc, l.localidad, p.provincia, pa.pais, e.nro_calle, e.calle, e.fecha_nac, s.tipo as sexo, tc.tipo_contacto
FROM Empleados e
LEFT JOIN Documentos d ON e.id_tipo_doc = d.id_tipo_doc
LEFT JOIN Localidades l ON e.cod_localidad = l.cod_localidad
INNER JOIN Provincias p ON l.cod_provincia = p.cod_provincia
INNER JOIN Paises pa ON p.cod_pais = pa.cod_pais
LEFT JOIN Sexos s ON e.id_tipo_sexo = s.id_tipo_sexo
LEFT JOIN Contactos co ON e.id_empleado = co.id_empleado
LEFT JOIN Tipos_contactos tc ON co.id_tipo_contacto = tc.id_tipo_contacto;
END$$
DELIMITER ;

call select_empleado();

-- Procedure de Select con transferecias con su cuenta origen, cuenta destino y tipo de transferencia
DELIMITER $$
CREATE or REPLACE PROCEDURE `select_transferencia`()
BEGIN
SELECT t.id_transferencia, t.cuenta_envio, t.cuenta_recibo, tt.tipo_transferencia
FROM Transferencias t
INNER JOIN Tipos_transferencias tt ON t.id_tipo_transferencia = tt.id_tipo_transferencia;
END$$
DELIMITER ;

call select_transferencia();

-- Procedure de Select con cuentas con su tipo de cuenta, tipo de moneda y tipo de estado
DELIMITER $$
CREATE or REPLACE PROCEDURE `select_cuenta`()
BEGIN
SELECT c.id_cuenta, tc.tipo_cuenta, tm.tipo_moneda, te.tipo_estado_cuenta, c.Monto, c.fecha_creacion, c.CBU, c.Alias, c.password, c.Credito, c.Debito
FROM Cuenta c
LEFT JOIN Tipos_cuentas tc ON c.id_tipo_cuenta = tc.id_tipo_cuenta
LEFT JOIN Tipo_moneda tm ON c.id_tipo_moneda = tm.id_tipo_moneda
LEFT JOIN Tipo_estado_cuenta te ON c.id_tipo_estado_cuenta = te.id_tipo_estado_cuenta;
END$$
DELIMITER ;

call select_cuenta();

-- Procedure de cuenta transferencia con su cuenta origen y transferencia
DELIMITER $$
CREATE or REPLACE PROCEDURE `select_cuenta_transferencia`()
BEGIN
SELECT c.id_cuenta, c.CBU, c.Alias, c.password, c.Credito, c.Debito, t.id_transferencia, t.cuenta_envio, t.cuenta_recibo, tt.tipo_transferencia
FROM Cuenta c, Transferencias t
INNER JOIN Tipos_transferencias tt ON t.id_tipo_transferencia = tt.id_tipo_transferencia;
END$$
DELIMITER ;

call select_cuenta_transferencia();

-- Procedure de Select con contactos con su tipo de contacto
DELIMITER $$
CREATE or REPLACE PROCEDURE `select_contacto`()
BEGIN
SELECT c.id_contactos, c.id_cliente, c.id_empleado, tc.tipo_contacto
FROM Contactos c
LEFT JOIN Tipos_contactos tc ON c.id_tipo_contacto = tc.id_tipo_contacto;
END$$
DELIMITER ;

call select_contacto();

-- Procedure de Select con contactos con su tipo de contacto, cliente y empleado
DELIMITER $$
CREATE or REPLACE PROCEDURE `select_contacto_cliente_empleado`()
BEGIN
SELECT c.id_contactos, c.id_cliente, cl.nombre, cl.apellido, c.id_empleado, e.nombre, e.apellido, tc.tipo_contacto, c.contactos
FROM Contactos c
LEFT JOIN Tipos_contactos tc ON c.id_tipo_contacto = tc.id_tipo_contacto
LEFT JOIN Clientes cl ON c.id_cliente = cl.id_cliente
LEFT JOIN Empleados e ON c.id_empleado = e.id_empleado;
END$$
DELIMITER ;

call select_contacto_cliente_empleado();

-- Procedure de Select con Prestamos con su tipo de prestamo, tipo de moneda, tipo de estado, tipo de cuota, tipo de interes y cantidad de cuotas
DELIMITER $$
CREATE or REPLACE PROCEDURE `select_prestamo`()
BEGIN
SELECT p.id_prestamo, tp.tipo_prestamo, tm.tipo_moneda, te.tipo_estado_prestamo, tc.tipo_cuota, ti.tipo_interes, cc.cantidad_cuotas, p.monto, p.fecha_creacion, p.fecha_vencimiento, p.fecha_pago, p.monto_cuota, p.monto_interes, p.monto_total
FROM Prestamos p
LEFT JOIN Tipo_prestamo tp ON p.id_tipo_prestamo = tp.id_tipo_prestamo
LEFT JOIN Tipo_moneda tm ON p.id_tipo_moneda = tm.id_tipo_moneda
LEFT JOIN Tipo_estado_prestamo te ON p.id_tipo_estado_prestamo = te.id_tipo_estado_prestamo
LEFT JOIN Tipo_cuota tc ON p.id_tipo_cuota = tc.id_tipo_cuota
LEFT JOIN Tipo_interes ti ON p.id_tipo_interes = ti.id_tipo_interes
LEFT JOIN Cantidad_cuotas cc ON p.id_cantidad_cuotas = cc.id_cantidad_cuotas;
END$$
DELIMITER ;

call select_prestamo();

-- Procedure de Select con Cuotas con su tipo de cuota, tipo de estado
DELIMITER $$
CREATE or REPLACE PROCEDURE `select_cuota`()
BEGIN
SELECT c.id_cuota, tc.tipo_cuota, te.tipo_estado_cuota, c.monto, c.fecha_vencimiento, c.fecha_pago
FROM Cuotas c
LEFT JOIN Tipo_cuota tc ON c.id_tipo_cuota = tc.id_tipo_cuota
LEFT JOIN Tipo_estado_cuota te ON c.id_tipo_estado_cuota = te.id_tipo_estado_cuota;
END$$
DELIMITER ;

call select_cuota();

-- Procedure de Select con Cuotas con su tipo de cuota, tipo de estado con un where con parametro dependiendo del prestamo que sea
DELIMITER $$
CREATE or REPLACE PROCEDURE `select_cuota_prestamo`(IN id_prestamo INT)
BEGIN
SELECT c.id_cuota, tc.tipo_cuota, te.tipo_estado_cuota, c.monto, c.fecha_vencimiento, c.fecha_pago, p.id_prestamo
FROM Cuotas c
LEFT JOIN Tipo_cuota tc ON c.id_tipo_cuota = tc.id_tipo_cuota
LEFT JOIN Tipo_estado_cuota te ON c.id_tipo_estado_cuota = te.id_tipo_estado_cuota
LEFT JOIN Prestamos p ON c.id_prestamo = p.id_prestamo
WHERE p.id_prestamo = id_prestamo;
END$$
DELIMITER ;

call select_cuota_prestamo(1);

-- 