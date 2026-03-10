-- ============================================================
--  blakedev - By Nayeli Paitan | SQL Práctico con MySQL
--  Tema: SELECT y Filtros — SOLUCIONES
-- ============================================================
USE tienda_db;

-- EJERCICIO 1
SELECT nombre, precio, stock
FROM productos;

-- EJERCICIO 2
SELECT *
FROM clientes
WHERE activo = TRUE;

-- EJERCICIO 3
SELECT nombre, precio
FROM productos
WHERE precio > 100;

-- EJERCICIO 4
SELECT nombre, email
FROM clientes
WHERE ciudad = 'Lima';

-- EJERCICIO 5
SELECT nombre, precio
FROM productos
WHERE nombre LIKE '%inalámbrico%';

-- EJERCICIO 6
SELECT nombre, precio
FROM productos
ORDER BY precio DESC
LIMIT 5;

-- EJERCICIO 7
SELECT id, cliente_id, fecha, estado
FROM pedidos
WHERE fecha BETWEEN '2024-02-01' AND '2024-03-31';

-- EJERCICIO 8
SELECT nombre, stock
FROM productos
WHERE stock BETWEEN 20 AND 50;
