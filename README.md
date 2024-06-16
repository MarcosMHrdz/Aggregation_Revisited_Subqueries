![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Laboratorio | Agregación revisada: subconsultas

En esta práctica de laboratorio, utilizará la base de datos [Sakila](https://dev.mysql.com/doc/sakila/en/) de alquiler de películas. Ya ha estado utilizando esta base de datos en un par de laboratorios, pero si necesita obtener los datos nuevamente, consulte el [enlace de instalación] oficial (https://dev.mysql.com/doc/sakila/en/sakila-installation .html).

### Instrucciones

Escriba las consultas SQL para responder las siguientes preguntas:

  - Seleccione el nombre, apellido y dirección de correo electrónico de todos los clientes que han alquilado una película.
  - Cuál es el pago promedio realizado por cada cliente (muestra el *id del cliente*, *nombre del cliente* (concatenado) y el *pago promedio realizado*).
  - Selecciona el *nombre* y la dirección de *correo electrónico* de todos los clientes que han alquilado las películas de "Acción".

    - Escriba la consulta utilizando múltiples declaraciones de unión.
    - Escriba la consulta utilizando subconsultas con múltiples cláusulas WHERE y condición "IN".
    - Verifique si las dos consultas anteriores producen los mismos resultados o no

  - Utilice la declaración de caso para crear una nueva columna que clasifique las columnas existentes como transacciones de alto valor o de alto valor según el monto del pago. Si la cantidad está entre 0 y 2, la etiqueta debe ser "baja" y si la cantidad está entre 2 y 4, la etiqueta debe ser "media", y si es más de 4, entonces debe ser "alta".