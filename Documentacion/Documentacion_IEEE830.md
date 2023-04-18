# Especificacion de Requerimientos de Software
Proyecto BankArg

## Introducción
Este documento es una Especificación de Requisitos Software (ERS) para el Sistema de información de banca online. Esta especificación se ha estructurado en base al estándar IEEE. Práctica recomendada para especificaciones de Requisitos Software ANSI/IEEE 830, 1998.
### 1.1 Propósito
El presente documento tiene como propósito definir las especificaciones funcionales para el desarrollo de un sistema de información web que permitirá al usuario acceder a su cuenta bancaria.
### 1.2 Ámbito del sistema
El sistema será definido como BankArg. Proporcionará un manejo eficiente sobre la información entre el usuario y los dueños del banco.
El principal beneficio es aportar un enterno seguro y ágil para que los usuarios, luego de un tutorial de bienvenida, puedan visualizar su saldo, registrar contactos frecuentes, realizar transferencias a terceros, administrar sus tarjetas, agregar pago de servicios, recibir alertas de vencimientos, solicitar préstamos, validación de token, aviso en caso de inicio de sesión en otro dispositivo, turnero online, y por úlitmo un formulario de contacto.
Como contraparte los dueños del banco obtendrán un reporte de los usuarios registrados junto con los servicios más utilizados, que les permitirán otorgar un mejor servicio y realizar futuras adecuaciones.
### 1.3 Definiciones, acrónimos y abreviaturas

- Usuario = Persona que usará el sistema para visualizar su cuenta bancaria
- SIS-I = Sistema de Información Web para la Gestión de Procesos Administrativos y Académicos
- ERS = Especificación de Requisitos Software
- RF = Requerimiento Funcional
- RNF = Requerimiento No Funcional
- FTP = Protocolo de Transferencia de Archivos

### 1.4 Personal involucrado
- Nombre: Ezequiel Giampaoli
/ Rol: Scrum master y desarrollador
/ Información de contacto: ezegiampaoli@gmail.com

- Nombre: Felipe Sjodin
/ Rol: Desarrollador
/ Información de contacto: felipesjodin@gmail.com

- Nombre: Soledad Peralta
/ Rol: Desarrolladora
/ Información de contacto: ssperaltaa@gmail.com

- Nombre: Florencia P. Tome
/ Rol: Desarrolladora
/ Información de contacto: florenciapodtome@gmail.com

- Nombre: Maximiliano Veron
/ Rol: Desarrollador
/ Información de contacto: maxi.ush.ind@gmail.com

- Nombre: Joaquin Bonvechi
/ Rol: Desarrollador
/ Información de contacto: joacobonvechi2272002@gmail.com

- Nombre: Maria Laura Peralta
/ Rol: Desarrolladora
/ Información de contacto: lali.635@gmail.com

- Nombre: Valentin Alterio
/ Rol: Desarrollador
/ Información de contacto: alteriovalentin01@gmail.com

- Nombre: Juan Jose Salinas
/ Rol: Desarrollador
/ Información de contacto: juansalinaa@gmail.com

### 1.5 Referencias
- Titulo del documento: Standard IEEE 830 - 1998
- Referencia: IEEE 

### 1.6 Resúmen
Este documento se ha estructurado en tres partes: primero se realiza una introducción al proyecto desarrollado otorgando una visión general de la especificación de recursos del sistema. En segundo lugar se intenta establecer las principales funciones que éste debe realizar, los datos asociados y los factores, restricciones, supuestos y dependencias que afectan al desarrollo, sin entrar en excesivos detalles. Por último, se definen detalladamente los requisitos que debe satisfacer el sistema.

## 2. Descripción general

### 2.1 Perspectiva del producto
El sistema de banca online “BankArg” será un producto diseñado en principio para trabajar en entornos WEB, lo que permitirá su utilización de forma rápida y eficaz, accesible en cualquier dispositivo. Contará con distintas secciones para que el usuario pueda acceder a todos sus datos relevantes, historial de movimientos, transferencias, pagos, turnos, préstamos y seguridad. Tendrá además una guía de ayuda para que los usuarios puedan resolver todas sus dudas con respecto al uso del sistema y sus herramientas disponibles. 

### 2.2 Funciones del producto
En principio "BankArg" proporcionará las siguientes funciones:
- Acceso a cuenta
- Transferencias de dinero
- Pagos de servicios con sus respectivos comprobantes
- Alertas de vencimientos
- Solicitud de préstamos 
- Validación token para mayor seguridad
- Avisos en caso de iniciar sesión en otro dispositivo

### 2.3 Características de los usuarios
Establecemos distintos usuarios a saber:
- Los usuarios finales de este producto, no requieren de ningúna formación previa para su utilización.
- Desarrolladores, con amplios conocimientos para la implementación del software propuesto.
- Y por último los Dueños de BankArg íntegramente capacitados en el sistema bancario.

### 2.4 Restricciones
-	Interfaz para ser usada con internet.
-	Lenguajes y tecnologías en uso: Frontend HTML, CSS, JV Backend:Python, Base de datos: SQL 
-	Los servidores deben ser capaces de atender consultas concurrentemente.
-	El sistema se diseñará según un modelo cliente/servidor.
-	El sistema deberá tener un diseño e implementación sencilla, independiente de la plataforma o del lenguaje de programación.


## 3. Requisitos especificos

### Product Backlog

- US01- Como usuario quiero crear una lista de contactos con transferencias frecuentes, para agilizar y facilitar el trámite.
- US02- Como usuario quiero una sección de ayuda, para preguntar o resolver problemas.
- US03- Como usuario quiero poder registrarme en la página, para acceder a los servicios del banco de forma remota.
- US04- Como usuario quiero al registrarme un tutorial de cómo utilizar la página para aprovechar todas las funciones.
- US05- Como usuario quiero tener un historial de todos mis movimientos (transferencias, pagos, recargas, etc.) para tener un control de mi dinero. 
- US06- Como usuario quiero que el historial de movimientos tenga un filtro, para que sea más fácil encontrar lo que necesito.
- US07- Como usuario quiero sacar turnos online para realizar algún trámite bancario.
- US08- Como usuario quiero manejar mis tarjetas de crédito y débito desde un mismo lugar para poder realizar pagos y gestionarlas de forma eficiente.
- US09- Como usuario quiero poder cobrar mi sueldo directamente en la cuenta, para tener mi plata más rápido en el banco.
- US10- Como usuario quiero poder pagar mis servicios (luz, gas, teléfono, seguros, etc) para realizar el tramite desde la comodidad de mi hogar.
- US11- Como usuario quiero alertas sobre los vencimientos de impuestos o servicios adheridos a mi cuenta, para pagar a tiempo y sin intereses.
- US12- Como usuario quiero validar un token cuando realice movimientos para tener una mayor seguridad y evitar fraudes.
- US13- Como dueño del banco quiero que el sistema recopile datos tales como: Nombre, Apellido, Edad para tener registro de nuestro clientes.
- US14- Como usuario quiero un apartado de préstamos para poder sacar uno de manera simple.
- US15- Como usuario quiero un aviso en caso que mi cuenta fuese abierta en otro dispositivo para mayor control.
- US16- Como usuario del banco quiero poder realizar y recibir transferencias, para realizar movimientos en mi cuenta
- US17- Como dueño del banco quiero que se recopile datos sobre los servicios más utilizados para futuras adecuaciones. 

## SPRINTS

#### N° de sprint: 0
- Sprint Backlog: 
1. Definir requerimientos
2. Plantear historias de usuarios y tareas dependientes de las US
3. Definir tareas dentro de las historias de usuario
- Responsabilidades:
- Calendario: Inicio 17-09-22/Fin 03-10-22
- Inconvenientes: -

#### N° de sprint: 1
- Sprint Backlog: 
1. Crear web del proyecto aprobado con sus respectivas paginas con estructura en HTML, semantica y estilos CSS.
2. Validar navegabilidad, links funcionales.
3. Aplicar Bootstrap
4. Modelado de BD, DER y Modelo Relacional
5. Abstraccion y modularizacion en MVC
- Responsabilidades:
- Calendario: Inicio 03-10-22/Fin 17-10-22
- Inconvenientes: -

#### N° de sprint: 2
- Sprint Backlog: 
1. Sitio funcional en hosting remoto de Sitio Institucional en Wordpress
2. Funcionalidad con JS en formularios
3. En subcarpeta o subdominio o linkeado al repositorio de Github
4. Script de la BD en MySQL
5. Consultas: insert-select-update-JOIN
6. Modelo de caso de uso de cada modularizacion (1 CRUD-python, y listado de movimientos/historial por ejemplo)
- Responsabilidades:
- Calendario: Inicio 17-10-22/Fin 14-11-22
- Inconvenientes: -







