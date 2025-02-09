--CREATE TABLES
-- Create product table
CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
)

-- Create customer table
CREATE TABLE customers (
    id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
)

-- Create order table
CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
)
-- Create order_items table
CREATE TABLE order_items (
    order_id INT NULL REFERENCES orders(id),
    product_id INT NULL REFERENCES products(id),
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
)

--INSERT DATA
-- Insert products (5)
INSERT INTO products (id, product_name, price, stock_quantity)
VALUES
    (1, 'Audrey II (Small)', 9.99, 10),
    (2, 'Skid Row Souvenirs', 4.99, 20),
    (3, 'Mushnik's Flower Shop T-Shirt', 14.99, 5),
    (4, 'Feed Me (Supplement)', 19.99, 8),
    (5, 'Dentist's Drill', 29.99, 3);

-- Insert customers (4)
INSERT INTO customers (id, first_name, last_name, email)
VALUES
    (1, 'Seymour', 'Krelboyne', 'seymour.krelboyne@skidrow.com'),
    (2, 'Audrey', 'I', 'audrey.i@skidrow.com'),
    (3, 'Orin', 'Scrivello', 'orin.scrivello@dentist.com'),
    (4, 'Crystal', 'Shelley', 'crystal.shelley@skidrow.com');

-- Insert orders (5)
INSERT INTO orders (id, customer_id, order_date)
VALUES
    (1, 1, '2025-01-04'),
    (2, 2, '2025-01-07'),
    (3, 3, '2025-01-17'),
    (4, 1, '2025-02-03'),
    (5, 4, '2025-02-04');

-- Insert order_items (5) with at least 2 items
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES
    (1, 1, 1),
    (1, 3, 1),
    (2, 2, 2),
    (2, 4, 1),
    (3, 5, 1),
    (4, 1, 1),
    (4, 2, 1),
    (5, 3, 1),
    (5, 4, 1);

--SQL QUERIES
-- Retrieve names and stock quantities of all products
SELECT product_name, stock_quantity
FROM products;

-- Retreive product names and quantities for orders placed
SELECT products.product_name, order_items.quantity
FROM products
JOIN order_items ON products.id = order_items.product_id;

-- Retrive orders from customer including product ID, name and quantity
SELECT orders.id, products.id, products.product_name, order_items.quantity
FROM orders
JOIN order_items ON orders.id = order_items.order_id
JOIN products ON order_items.product_id = products.id
WHERE orders.customer_id = 1;

--UPDATE DATA
-- Add an order
INSERT INTO orders (id, customer_id, order_date)
VALUES (6, 2, '2025-02-07');
-- Add order items
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES (6, 2, 2);
-- Update stock quantity
UPDATE products
SET stock_quantity = stock_quantity - 2
WHERE id = 2;

--DELETE DATA
-- Remove order
DELETE FROM orders
WHERE id = 6;
-- Remove order_items
DELETE FROM order_items
WHERE order_id = 6;

