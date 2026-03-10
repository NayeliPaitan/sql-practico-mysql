-- ============================================================
--  BlakeDev - By Nayeli Paitan | SQL Práctico con MySQL
--  Tema: Subconsultas — SOLUCIONES
-- ============================================================
USE tienda_db;

-- EJERCICIO 1
SELECT nombre, precio
FROM productos
WHERE precio > (SELECT AVG(precio) FROM productos)
ORDER BY precio DESC;

-- EJERCICIO 2
SELECT nombre, email
FROM clientes
WHERE id IN (
    SELECT DISTINCT cliente_id FROM pedidos
);

-- EJERCICIO 3
SELECT nombre, email
FROM clientes
WHERE id NOT IN (
    SELECT DISTINCT cliente_id FROM pedidos
);

-- EJERCICIO 4
SELECT p.nombre, p.precio, c.nombre AS categoria
FROM productos p
INNER JOIN categorias c ON p.categoria_id = c.id
WHERE p.precio = (
    SELECT MAX(p2.precio)
    FROM productos p2
    WHERE p2.categoria_id = p.categoria_id
);

-- EJERCICIO 5
SELECT pedido_id, cliente, total
FROM (
    SELECT
        pe.id                                   AS pedido_id,
        cl.nombre                               AS cliente,
        SUM(dp.cantidad * dp.precio_unit)       AS total
    FROM pedidos pe
    INNER JOIN clientes        cl ON pe.cliente_id = cl.id
    INNER JOIN detalle_pedidos dp ON pe.id         = dp.pedido_id
    GROUP BY pe.id, cl.nombre
) AS totales
WHERE total > (
    SELECT AVG(sub.total)
    FROM (
        SELECT SUM(cantidad * precio_unit) AS total
        FROM detalle_pedidos
        GROUP BY pedido_id
    ) AS sub
);

-- EJERCICIO 6
SELECT nombre, precio
FROM productos
WHERE id NOT IN (
    SELECT DISTINCT producto_id FROM detalle_pedidos
);
