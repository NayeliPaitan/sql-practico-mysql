-- ============================================================
--  BlakeDev - By Nayeli Paitan | SQL Práctico con MySQL
--  Tema: Agregaciones y GROUP BY — SOLUCIONES
-- ============================================================
USE tienda_db;

-- EJERCICIO 1
SELECT c.nombre AS categoria, COUNT(p.id) AS total_productos
FROM categorias c
LEFT JOIN productos p ON c.id = p.categoria_id
GROUP BY c.id, c.nombre;

-- EJERCICIO 2
SELECT
    ROUND(AVG(precio), 2) AS precio_promedio,
    MIN(precio)           AS precio_minimo,
    MAX(precio)           AS precio_maximo
FROM productos;

-- EJERCICIO 3
SELECT
    pr.nombre                              AS producto,
    SUM(dp.cantidad * dp.precio_unit)      AS total_vendido
FROM detalle_pedidos dp
INNER JOIN productos pr ON dp.producto_id = pr.id
GROUP BY pr.id, pr.nombre
ORDER BY total_vendido DESC;

-- EJERCICIO 4
SELECT estado, COUNT(*) AS cantidad
FROM pedidos
GROUP BY estado;

-- EJERCICIO 5
SELECT c.nombre AS categoria, ROUND(AVG(p.precio), 2) AS precio_promedio
FROM categorias c
INNER JOIN productos p ON c.id = p.categoria_id
GROUP BY c.id, c.nombre
HAVING AVG(p.precio) > 100;

-- EJERCICIO 6
SELECT
    cl.nombre                              AS cliente,
    SUM(dp.cantidad * dp.precio_unit)      AS total_gastado
FROM clientes cl
INNER JOIN pedidos          pe ON cl.id          = pe.cliente_id
INNER JOIN detalle_pedidos  dp ON pe.id           = dp.pedido_id
GROUP BY cl.id, cl.nombre
ORDER BY total_gastado DESC;

-- EJERCICIO 7
SELECT ciudad, COUNT(*) AS total_clientes
FROM clientes
GROUP BY ciudad
ORDER BY total_clientes DESC;
