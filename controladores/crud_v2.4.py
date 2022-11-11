'''
Para ejecuitar el siguiente codigo, debe contar con:
1. MySQL
2. Python
4. Pip

A continuación se detalla como instalar el módulo Python-mysql-connector:
1) Verificar si su sistema ya contiene Python:
---> Abra la línea de comandos y ejecute el comando: "Python -V". Si Python está instalado, generará un mensaje con la versión instalada.
2) Verificar si PIP ya está instalado en su sistema:
---> Abra la línea de comandos y ejecute el comando: "pip -V". Si pip está instalado, generará un mensaje con la versión instalada.
3) Instalar Python-mysql-connector:
---> Abra la línea de comandos y ejecute el comando: "pip install mysql-connector-python"
Luego de tener todo instalado, podrá ejecutar el código!
'''

import mysql.connector
import os
import time


class Conectar():

    def __init__(self) -> None:
        segundos = 3
        try:
            self.conexion = mysql.connector.connect(
                host='localhost',
                user='root',
                port=3306,
                password=input('Ingrese la contraseña para conectarse a la base de datos: '),
                db=input('Ingrese el nombre de la base de datos: '),
            )
            print('\t\n** CONEXION EXITOSA! **')
            time.sleep(segundos)
        except mysql.connector.Error as descripcionError:
            print('No se conectó!', descripcionError)
            time.sleep(segundos)

    def VerTablas(self):
        if self.conexion.is_connected():
            segundos = 5
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "SHOW TABLES"
                cursor.execute(sentenciaSQL)
        
                #mostramos las tablas creadas en la bd
                for dato in cursor:
                    print(dato)
                
                time.sleep(segundos)

                self.conexion.close()
            except mysql.connector.Error as descripcionError:
                print('No se conectó!', descripcionError)
                time.sleep(segundos)

    def VerTablaCompleta(self, tabla):
        if self.conexion.is_connected():
            segundos = 10            
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "SHOW CREATE TABLE " + tabla
                cursor.execute(sentenciaSQL)
                
                #mostramos los datos de la tabla:
                for dato in cursor:
                        detalle = ''.join(dato)
                        print(detalle)
                    
                self.conexion.close()
                time.sleep(segundos)

            except mysql.connector.Error as descripcionError:
                print('No se conectó!', descripcionError)
                    

    def VerUnaTabla(self, tabla, columnas):
        if self.conexion.is_connected():
            segundos = 10
               
            sentenciaSQL = "SELECT " + columnas + " FROM " + tabla
            
            try:
                cursor = self.conexion.cursor()
                cursor.execute(sentenciaSQL)
                
                    #mostramos los datos de la tabla:
                for dato in cursor:
                    #detalle = ''.join(dato)
                    print(dato)

                time.sleep(segundos)    
                self.conexion.close()
            
            except mysql.connector.Error as descripcionError:
                print('No se conectó!', descripcionError)
                time.sleep(segundos)

        # Insert 
    def InsertarValor(self, nombre):
        if self.conexion.is_connected():
            segundos = 5
            tabla_campos = []
            tabla_valores = []
            bandera = False

            while not bandera:
                campo = input('Ingrese el nombre del campo a agregar: ')
                tabla_campos.append(campo)
                valor = input('Ingrese el valor a asignar al campo (en caso de ser string, colocar "<valor>"): ')
                tabla_valores.append(valor)
                fin = 0
                print('Desea agregar otro campo? (1. Si o 2. No): ')
                fin = int(input(': '))
                if fin == 2:
                    bandera = True

            #creamos y ejecutamos la sentencia
            try:
                cursor = self.conexion.cursor()
                campos = ', '.join(tabla_campos)
                valores = ', '.join(tabla_valores)
                print('\t\t\tstrings: \n')
                print('campos: ', campos)
                print('valores: ', valores)
                sentenciaSQL = "INSERT INTO " + nombre + " (" + campos + ") " + "VALUES" + " (" + valores  +")"

                cursor.execute(sentenciaSQL)
                self.conexion.commit()
                print('Insertado correctamente')
                                
                time.sleep(segundos)
                self.conexion.close()
            except mysql.connector.Error as descripcionError:
                print('No se conectó!', descripcionError)
                time.sleep(segundos)
        
        # Read
        # En este caso trabajaremos con consultas simples, de 1 sola tabla:
        # Veremos cómo obtener datos que cumplan determinadas condiciones, en el orden en que nos haga falta
    def BuscarObjeto(self, nombre):
        if self.conexion.is_connected():
            segundos = 10
            lista_columnas_a_ver = []
            lista_condiciones = []
            fin_col = 1
            fin_cond = 1

            while fin_col == 1:
                columna = input('Ingrese un dato de la tabla que desea obtener: ')
                lista_columnas_a_ver.append(columna)
                print('Desea agregar otro dato? (1. Si o 2. No): ')
                fin_col = int(input(': '))
            
            #convierto a str
            todas_columnas = ', '.join(lista_columnas_a_ver)  
    
            while fin_cond == 1:
                condicion = input('Ingrese una condición a evaluar: ')
                lista_condiciones.append(condicion)
                print('Desea agregar otra condición? (1. Si o 2. No): ')
                fin_cond = int(input(': '))

            #convierto a str
            todas_condiciones = ', '.join(lista_condiciones)

            ordenado = int(input('Desea ordenar el resultado? (1.Si o 2.No):' ))
            
            if ordenado == 1:
                lista_ordenamiento = []
                fin_orden = 1
                
                while fin_orden == 1:
                    orden = input('Indique el campo por el cual ordenar: ')
    
                    print('Indique el numero de la opcion correcta: ')
                    print('\n\t1.Ordenar de forma ascendente (de menor a mayor)')
                    print('\n\t2.Ordenar de forma descendente (de mayor a menor)')
                    tipo = int(input(': '))
                    if tipo == 1:
                        lista_ordenamiento.append(orden)
                    elif tipo == 2:
                        desc = orden + ' DESC'
                        lista_ordenamiento.append(desc)

                    print('Desea agregar otro campo para ordenar? (1.Si o 2.No): ')
                    fin_orden = int(input(': '))
                
                #convierto a str
                todos_ordenamientos = ', '.join(lista_ordenamiento)
                
                #armo la sentencia
                sentenciaSQL = "SELECT " + todas_columnas + " FROM " + nombre + " WHERE " + todas_condiciones + " ORDER BY " + todos_ordenamientos
            elif ordenado == 2:
                sentenciaSQL = "SELECT " + todas_columnas + " FROM " + nombre + " WHERE " + todas_condiciones
                
            
            try:
                cursor = self.conexion.cursor()
                cursor.execute(sentenciaSQL)
                
                #guardar y mostrar en pantalla el listado obtenido y el número de filas
                respuesta = cursor.fetchall()
                for fila in respuesta:
                    print(fila)
                print('Total de registros encontrados: ', cursor.rowcount)

                time.sleep(segundos)
                self.conexion.close()
            except mysql.connector.Error as descripcionError:
                print('No se conectó!', descripcionError)
                time.sleep(segundos)
        
        # Update
        # Actualizaremos valores de una tabla
    def ActualizarObjeto(self, tabla):
        if self.conexion.is_connected():
            segundos = 5
            print('Seleccione el número de opción correcta:')
            print('1. Actaulizar el valor de un registro')
            print('2. Actualizar todos los valores de una columna')
            actualiza = int(input(': '))
            
            if actualiza == 1:
                campo = input('Indique el nombre del campo a actualizar: ')
                nuevo = input('Ingrese el nuevo valor: ')
                condicion = input('Ingrese la condición: ')
                sentenciaSQL = "UPDATE " + tabla + " SET " + campo + "=" + nuevo + " WHERE " + condicion
            elif actualiza == 2:
                columna = input('Indique la columna a actualizar: ')
                nuevo2 = input('Ingrese el nuevo valor: ')
                sentenciaSQL = "UPDATE " + tabla + " SET " + columna + "=" + nuevo2
                
            try:
                cursor = self.conexion.cursor()
                cursor.execute(sentenciaSQL)
                self.conexion.commit()
                print('Actualizado correctamente!')

                time.sleep(segundos)                
                self.conexion.close()
            except mysql.connector.Error as descripcionError:
                print('No se conectó!', descripcionError)
                time.sleep(segundos)

        # Delete
        # Eliminaremos valores de una tabla
    def EliminarObjeto(self, tabla):
        if self.conexion.is_connected():
            segundos = 5
            print('Seleccione el número de opción correcta:')
            print('1. Eliminar el valor de un registro')
            print('2. Eliminar todos los valores de una columna')
            eliminar = int(input(': '))
            
            if eliminar == 1:
                condicion = input('Ingrese la condición (los registros que la cumplan serán eliminados): ')
                sentenciaSQL = "DELETE FROM " + tabla + " WHERE " + condicion
            elif eliminar == 2:
                sentenciaSQL = "DELETE FROM " + tabla
            
            try:
                cursor = self.conexion.cursor()
                cursor.execute(sentenciaSQL)
                self.conexion.commit()
                print('Borrado correctamente')
                
                time.sleep(segundos)
                self.conexion.close()
            except mysql.connector.Error as descripcionError:
                print('No se conectó!', descripcionError)
                time.sleep(segundos)


def menu():
    #os.system('cls')
    print("Selecciona una opción: ")
    print("\t1. Ver todas las tablas creadas en la Base de Datos")
    print("\t2. Ver información de una tabla de la Base de Datos")
    print("\t3. Agregar datos a una tabla")
    print("\t4. Buscar datos en la Base de Datos")
    print("\t5. Actualizar datos en una tabla")
    print("\t6. Borrar datos de una tabla")
    print("\t7. Contactar al desarrollador")
    print("\t8. Salir")


if __name__ == '__main__':
    conexion1 = Conectar()
    bandera = False

    while not bandera:
        menu()
        opcion = input(': ')
        segundos = 3.5

        if opcion == '1':
            conexion1.VerTablas()
            time.sleep(segundos)
        
        elif opcion == '2':
            buscar = input('Ingrese el nombre de la tabla que desea ver: ')
            print('Seleccione la opción deseada:')
            print('1. Ver todas las columnas de la tabla')
            print('2. Ver algunas columnas de la tabla')
            opcion2 = int(input(': '))
            if opcion2 == 1:
                conexion1.VerTablaCompleta(buscar)
            elif opcion2 == 2:
                lista_columnas = []
                cantidad = int(input('Indique la cantidad de columnas que desea ver: '))
                
                for i in range(cantidad):
                    columna = input('Indique el nombre de la columna: ')
                    lista_columnas.append(columna)
                
                columnas_a_ver = ', '.join(lista_columnas)
                conexion1.VerUnaTabla(buscar, columnas_a_ver)
        
        elif opcion == '3':
            nombre_tabla = input('Inserte el nombre de la tabla donde insertará los datos: ')
            conexion1.InsertarValor(nombre_tabla)
            time.sleep(segundos)
        
        elif opcion == '4':
            tabla = input('Ingrese el nombre de la tabla de la que desea obtener datos: ')
            
            print('Seleccione el numero de la opción correcta: ')
            print('1. Obtener todos los datos de la tabla')
            print('2. Obtener datos que cumplan una condición')
            completa = int(input(': '))
            if completa == 1:
                conexion1.VerTablaCompleta(tabla)
            elif completa == 2:
                conexion1.BuscarObjeto(tabla)
            
            time.sleep(segundos)
        
        elif opcion == '5':
            tabla = input('Ingrese el nombre de la tabla en la que desea actualizar datos: ')
            conexion1.ActualizarObjeto(tabla)
            time.sleep(segundos)
            
        elif opcion == '6':
            tabla = input('Ingrese el nombre de la tabla de la que desea eliminar datos: ')
            conexion1.EliminarObjeto(tabla)
            time.sleep(segundos)
            
        elif opcion == '7':
            print('\n\t Puede contactar a Lalita al mail: lali.635@gmail.com ')
            time.sleep(segundos)

        elif opcion == '8':
            print('\n\t ** GRACIAS POR UTILIZAR EL SCRIPT **')
            bandera = True
        
        else:
            print('** Opción no válida, intente nuevamete **')
            time.sleep(segundos)
        
