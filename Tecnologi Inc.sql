/*
-- Tabla Clientes
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_registro DATE,
    email VARCHAR(100),
    telefono VARCHAR(15)
);

-- Tabla Productos
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    categoria VARCHAR(50),
    precio DECIMAL(10,2),
    stock INT
);

-- Tabla Ventas
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    cantidad INT,
    fecha_venta DATE,
    total_venta DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Tabla Personal de Ventas
CREATE TABLE sales_staff (
    staff_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(100),
    telefono VARCHAR(15)
);
*/

/*
-- Inserciones en customers
INSERT INTO customers VALUES (1, 'Juan', 'Pérez', TO_DATE('2024-09-05', 'YYYY-MM-DD'), 'juan.perez@mail.com', '123456789');
INSERT INTO customers VALUES (2, 'María', 'López', TO_DATE('2024-10-10', 'YYYY-MM-DD'), 'maria.lopez@mail.com', '987654321');
INSERT INTO customers VALUES (3, 'Carlos', 'González', TO_DATE('2024-10-15', 'YYYY-MM-DD'), 'carlos.gonzalez@mail.com', '123123123');
INSERT INTO customers VALUES (4, 'Ana', 'Ramírez', TO_DATE('2024-09-25', 'YYYY-MM-DD'), 'ana.ramirez@mail.com', '987987987');
INSERT INTO customers VALUES (5, 'Luis', 'Martínez', TO_DATE('2024-10-01', 'YYYY-MM-DD'), 'luis.martinez@mail.com', '456456456');

-- Inserciones en products
INSERT INTO products VALUES (1, 'Laptop X', 'Computadoras', 800.00, 15);
INSERT INTO products VALUES (2, 'Tablet A', 'Tabletas', 300.00, 25);
INSERT INTO products VALUES (3, 'Smartphone B', 'Celulares', 600.00, 5);
INSERT INTO products VALUES (4, 'Monitor Z', 'Accesorios', 150.00, 20);
INSERT INTO products VALUES (5, 'Impresora A', 'Accesorios', 120.00, 12);

-- Inserciones en sales
INSERT INTO sales VALUES (1, 1, 1, 2, '2024-10-12', 1600.00);
INSERT INTO sales VALUES (2, 2, 2, 1, '2024-10-13', 300.00);
INSERT INTO sales VALUES (3, 3, 4, 3, '2024-10-14', 450.00);
INSERT INTO sales VALUES (4, 4, 5, 1, '2024-10-15', 120.00);
INSERT INTO sales VALUES (5, 5, 1, 1, '2024-10-16', 800.00);

-- Inserciones en sales_staff
INSERT INTO sales_staff VALUES (1, 'Pedro', 'Gómez', 'pedro.gomez@mail.com', '111222333');
INSERT INTO sales_staff VALUES (2, 'Lucía', 'Díaz', 'lucia.diaz@mail.com', '444555666');
INSERT INTO sales_staff VALUES (3, 'Miguel', 'Fernández', 'miguel.fernandez@mail.com', '777888999');
INSERT INTO sales_staff VALUES (4, 'Carmen', 'Suárez', 'carmen.suarez@mail.com', '111444777');
INSERT INTO sales_staff VALUES (5, 'Roberto', 'Ortiz', 'roberto.ortiz@mail.com', '222333444');
*/

-- Desafío 1:
SELECT nombre || ' ' || apellido AS nombre_completo, fecha_registro
FROM customers
WHERE fecha_registro >= ADD_MONTHS(SYSDATE, -1)
ORDER BY fecha_registro DESC;

-- Desafío 2:
SELECT nombre_producto, precio, 
       ROUND(precio * 0.15, 1) AS incremento
FROM products
WHERE nombre_producto LIKE '%A' 
  AND stock > 10
ORDER BY incremento ASC;

-- Desafío 3:
SELECT nombre || ' ' || apellido AS nombre_completo, 
       email, 
       SUBSTR(nombre, 1, 4) || LENGTH(email) || 
       SUBSTR(apellido, LENGTH(apellido) - 2, 3) AS contraseña
FROM sales_staff
ORDER BY apellido DESC, nombre ASC;



