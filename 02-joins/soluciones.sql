-- ============================================================
--  BlakeDev - By Nayeli Paitan | SQL Práctico con MySQL
--  Tema: JOINs — SOLUCIONES
-- ============================================================
USE tienda_db;

-- EJERCICIO 1
SELECT p.nombre AS producto, c.nombre AS categoria, p.precio
FROM productos p
INNER JOIN categorias c ON p.categoria_id = c.id;

-- EJERCICIO 2
SELECT pe.id, cl.nombre AS cliente, pe.fecha, pe.estado
FROM pedidos pe
INNER JOIN clientes cl ON pe.cliente_id = cl.id;

-- EJERCICIO 3
SELECT
    pe.id         AS id_pedido,
    cl.nombre     AS cliente,
    pr.nombre     AS producto,
    dp.cantidad,
    dp.precio_unit
FROM detalle_pedidos dp
INNER JOIN pedidos   pe ON dp.pedido_id   = pe.id
INNER JOIN clientes  cl ON pe.cliente_id  = cl.id
INNER JOIN productos pr ON dp.producto_id = pr.id;

-- EJERCICIO 4
SELECT cl.nombre, COUNT(pe.id) AS total_pedidos
FROM clientes cl
LEFT JOIN pedidos pe ON cl.id = pe.cliente_id
GROUP BY cl.id, cl.nombre;

-- EJERCICIO 5
SELECT pe.id, cl.nombre AS cliente, cl.ciudad, pe.fecha
FROM pedidos pe
INNER JOIN clientes cl ON pe.cliente_id = cl.id
WHERE pe.estado = 'entregado';

-- EJERCICIO 6
SELECT
    pe.id                                        AS id_pedido,
    cl.nombre                                    AS cliente,
    SUM(dp.cantidad * dp.precio_unit)            AS total
FROM pedidos pe
INNER JOIN clientes        cl ON pe.cliente_id  = cl.id
INNER JOIN detalle_pedidos dp ON pe.id          = dp.pedido_id
GROUP BY pe.id, cl.nombre;
