use sakila;
-- Seleccione el nombre, apellido y dirección de correo electrónico de todos los clientes que han alquilado una película.

SELECT DISTINCT c.first_name, c.last_name, c.email
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id;

-- ¿Cuál es el pago promedio realizado por cada cliente (muestra la identificación del cliente , el nombre del cliente (concatenado) y el pago promedio realizado ).

SELECT c.customer_id, 
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
       AVG(p.amount) AS average_payment
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, customer_name;

-- Selecciona el nombre y dirección de correo electrónico de todos los clientes que han alquilado las películas de "Acción".

-- -- Escriba la consulta utilizando múltiples declaraciones de unión
SELECT DISTINCT c.first_name, c.last_name, c.email
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
WHERE cat.name = 'Action';

-- -- Escriba la consulta utilizando subconsultas con múltiples cláusulas y IN condiciones WHERE

SELECT c.first_name, c.last_name, c.email
FROM customer c
WHERE c.customer_id IN (
    SELECT r.customer_id
    FROM rental r
    WHERE r.inventory_id IN (
        SELECT i.inventory_id
        FROM inventory i
        WHERE i.film_id IN (
            SELECT f.film_id
            FROM film f
            WHERE f.film_id IN (
                SELECT fc.film_id
                FROM film_category fc
                WHERE fc.category_id = (
                    SELECT cat.category_id
                    FROM category cat
                    WHERE cat.name = 'Action'
                )
            )
        )
    )
);

-- -- Verifique si las dos consultas anteriores producen los mismos resultados o no

SELECT DISTINCT c.first_name, c.last_name, c.email 
FROM customer c 
JOIN rental r ON c.customer_id = r.customer_id 
JOIN inventory i ON r.inventory_id = i.inventory_id 
JOIN film f ON i.film_id = f.film_id 
JOIN film_category fc ON f.film_id = fc.film_id 
JOIN category cat ON fc.category_id = cat.category_id 
WHERE cat.name = 'Action' 
AND c.customer_id NOT IN (
    SELECT c.customer_id
    FROM customer c 
    JOIN rental r ON c.customer_id = r.customer_id 
    JOIN inventory i ON r.inventory_id = i.inventory_id 
    JOIN film f ON i.film_id = f.film_id 
    JOIN film_category fc ON f.film_id = fc.film_id 
    JOIN category cat ON fc.category_id = cat.category_id 
    WHERE cat.name = 'Action'
);

-- Utilice la declaración de caso para crear una nueva columna que clasifique las columnas existentes como transacciones de alto valor o de alto valor según el monto del pago.
-- Si la cantidad está entre 0 y 2, la etiqueta debe ser lowy si la cantidad está entre 2 y 4, la etiqueta debe ser medium, y si es más de 4, entonces debe ser high.

SELECT p.payment_id, 
       p.amount, 
       CASE 
           WHEN p.amount BETWEEN 0 AND 2 THEN 'low'
           WHEN p.amount BETWEEN 2 AND 4 THEN 'medium'
           ELSE 'high'
       END AS payment_classification
FROM payment p;
