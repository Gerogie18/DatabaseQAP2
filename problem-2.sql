--CREATE TABLES
--Create product table
CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL
    stock_quantity DECIMAL(10,2) NOT NULL
)

--Create customer table
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
--Create order_items table
CREATE TABLE order_items (
    order_id INT NULL REFERENCES orders(id),
    product_id INT NULL REFERENCES products(id),
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_id, product_id)
)

