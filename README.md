# 🗄️ SQL Práctico con MySQL

> Ejercicios prácticos de SQL nivel básico para afianzar fundamentos.  
> Motor: **MySQL 8+**

---

## 📁 Estructura del repositorio

```
sql-practico-mysql/
│
├── setup/
│   └── schema.sql              # Base de datos y datos de ejemplo
│
├── 01-select-filtros/
│   ├── ejercicios.sql          # 8 ejercicios
│   └── soluciones.sql
│
├── 02-joins/
│   ├── ejercicios.sql          # 6 ejercicios
│   └── soluciones.sql
│
├── 03-agregaciones/
│   ├── ejercicios.sql          # 7 ejercicios
│   └── soluciones.sql
│
└── 04-subconsultas/
    ├── ejercicios.sql          # 6 ejercicios
    └── soluciones.sql
```

---

## 🚀 Cómo empezar

### 1. Clona el repositorio
```bash
git clone https://github.com/NayeliPaitan/sql-practico-mysql
cd sql-practico-mysql
```

### 2. Crea la base de datos
```bash
mysql -u root -p < setup/schema.sql
```
O abre el archivo `setup/schema.sql` en tu cliente favorito (MySQL Workbench, DBeaver, TablePlus) y ejecútalo.

### 3. Elige un tema y practica
Abre el archivo `ejercicios.sql` del tema que quieras trabajar, escribe tu solución debajo de cada enunciado y luego compara con `soluciones.sql`.

---

## 🗂️ Temas cubiertos

| # | Tema | Ejercicios | Conceptos clave |
|---|------|:---:|---|
| 01 | SELECT y Filtros | 8 | `WHERE`, `LIKE`, `BETWEEN`, `ORDER BY`, `LIMIT` |
| 02 | JOINs | 6 | `INNER JOIN`, `LEFT JOIN`, múltiples tablas |
| 03 | Agregaciones | 7 | `COUNT`, `SUM`, `AVG`, `GROUP BY`, `HAVING` |
| 04 | Subconsultas | 6 | Subconsultas en `WHERE`, `FROM`, `EXISTS`, `IN` |

---

## 🗃️ Base de datos de ejemplo

El esquema simula una **tienda online** con las siguientes tablas:

```
categorias ──< productos
clientes   ──< pedidos ──< detalle_pedidos >── productos
```

| Tabla | Descripción |
|---|---|
| `categorias` | Categorías de productos |
| `productos` | Catálogo con precio y stock |
| `clientes` | Clientes registrados |
| `pedidos` | Órdenes de compra |
| `detalle_pedidos` | Líneas de cada pedido |

---

## 💡 Recomendaciones

- Intenta resolver cada ejercicio **sin ver la solución** primero.
- Prueba distintas formas de llegar al mismo resultado.
- Usa `EXPLAIN` para analizar el rendimiento de tus consultas.

---

## 👤 Autor

**BlakeDev- By Nayeli Paitan** — [@Nayeli Paitan](https://github.com/NayeliPaitan/)
