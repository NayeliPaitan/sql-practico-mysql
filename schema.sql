-- ============================================================
--  BlakeDev - By Nayeli Paitan | SQL Práctico con MySQL
--  Archivo: schema.sql
--  Descripción: Creación e inserción de datos de ejemplo
-- ============================================================

CREATE DATABASE IF NOT EXISTS tienda_db;
USE tienda_db;

-- ─────────────────────────────────────────
--  TABLAS
-- ─────────────────────────────────────────

CREATE TABLE categorias (
    id        INT AUTO_INCREMENT PRIMARY KEY,
    nombre    VARCHAR(50) NOT NULL
);

CREATE TABLE productos (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    nombre       VARCHAR(100) NOT NULL,
    precio       DECIMAL(10,2) NOT NULL,
    stock        INT DEFAULT 0,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

CREATE TABLE clientes (
    id        INT AUTO_INCREMENT PRIMARY KEY,
    nombre    VARCHAR(100) NOT NULL,
    email     VARCHAR(100) UNIQUE NOT NULL,
    ciudad    VARCHAR(50),
    activo    BOOLEAN DEFAULT TRUE
);

CREATE TABLE pedidos (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id  INT NOT NULL,
    fecha       DATE NOT NULL,
    estado      ENUM('pendiente','enviado','entregado','cancelado') DEFAULT 'pendiente',
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE detalle_pedidos (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id   INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad    INT NOT NULL,
    precio_unit DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedido_id)   REFERENCES pedidos(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- ─────────────────────────────────────────
--  DATOS DE EJEMPLO
-- ─────────────────────────────────────────

INSERT INTO categorias (nombre) VALUES
    ('Electrónica'),
    ('Ropa'),
    ('Alimentos'),
    ('Libros'),
    ('Hogar');

INSERT INTO productos (nombre, precio, stock, categoria_id) VALUES
    ('Laptop HP 15"',       2500.00,  10, 1),
    ('Mouse Inalámbrico',     45.00,  80, 1),
    ('Teclado Mecánico',     150.00,  30, 1),
    ('Monitor 24"',          700.00,  15, 1),
    ('Polo Blanco M',         30.00, 100, 2),
    ('Jeans Azul 32',         80.00,  50, 2),
    ('Zapatillas Running',   120.00,  40, 2),
    ('Arroz 5kg',             18.00, 200, 3),
    ('Aceite de Oliva 1L',    25.00, 120, 3),
    ('Café Molido 500g',      22.00,  90, 3),
    ('Clean Code',            55.00,  25, 4),
    ('The Pragmatic Programmer', 60.00, 20, 4),
    ('SQL para Principiantes', 35.00, 15, 4),
    ('Cafetera Eléctrica',   180.00,  20, 5),
    ('Set Sartenes',         250.00,  18, 5);

INSERT INTO clientes (nombre, email, ciudad, activo) VALUES
    ('Ana Torres',      'ana@email.com',    'Lima',      TRUE),
    ('Carlos Ruiz',     'carlos@email.com', 'Arequipa',  TRUE),
    ('María López',     'maria@email.com',  'Lima',      FALSE),
    ('Jorge Mendoza',   'jorge@email.com',  'Cusco',     TRUE),
    ('Lucía Sánchez',   'lucia@email.com',  'Lima',      TRUE),
    ('Pedro Castillo',  'pedro@email.com',  'Trujillo',  TRUE),
    ('Sofía Díaz',      'sofia@email.com',  'Lima',      FALSE),
    ('Miguel Ramos',    'miguel@email.com', 'Arequipa',  TRUE);

INSERT INTO pedidos (cliente_id, fecha, estado) VALUES
    (1, '2024-01-10', 'entregado'),
    (1, '2024-02-15', 'entregado'),
    (2, '2024-01-20', 'enviado'),
    (3, '2024-02-01', 'cancelado'),
    (4, '2024-02-20', 'pendiente'),
    (5, '2024-03-05', 'entregado'),
    (5, '2024-03-10', 'enviado'),
    (6, '2024-03-12', 'pendiente'),
    (8, '2024-03-15', 'entregado'),
    (8, '2024-03-18', 'entregado');

INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, precio_unit) VALUES
    (1,  1, 1, 2500.00),
    (1,  2, 2,   45.00),
    (2, 11, 1,   55.00),
    (2, 12, 1,   60.00),
    (3,  5, 3,   30.00),
    (3,  6, 1,   80.00),
    (4,  8, 5,   18.00),
    (5,  3, 1,  150.00),
    (5,  4, 1,  700.00),
    (6, 14, 1,  180.00),
    (7,  7, 2,  120.00),
    (8,  9, 3,   25.00),
    (8, 10, 2,   22.00),
    (9,  2, 1,   45.00),
    (9, 13, 2,   35.00),
    (10, 15,1,  250.00),
    (10, 1, 1, 2500.00);
