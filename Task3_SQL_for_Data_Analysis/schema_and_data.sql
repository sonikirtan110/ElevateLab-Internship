-- schema_and_data.sql

-- 1. Create customers table
CREATE TABLE customers (
  customer_id   INT        PRIMARY KEY,
  name          VARCHAR(50),
  email         VARCHAR(100),
  signup_date   DATE
);

-- Populate customers
INSERT INTO customers VALUES
  (1, 'Alice',   'alice@example.com',   '2024-01-15'),
  (2, 'Bob',     'bob@example.com',     '2024-01-20'),
  (3, 'Charlie', 'charlie@example.com', '2024-02-10'),
  (4, 'Diana',   'diana@example.com',   '2024-02-25');

-- 2. Create products table
CREATE TABLE products (
  product_id    INT        PRIMARY KEY,
  name          VARCHAR(50),
  category      VARCHAR(30),
  price         DECIMAL(10,2)
);

-- Populate products
INSERT INTO products VALUES
  (1, 'Laptop',     'Electronics', 1200.00),
  (2, 'Smartphone', 'Electronics',  800.00),
  (3, 'Desk Chair', 'Furniture',    150.00),
  (4, 'Book',       'Stationery',     20.00);

-- 3. Create orders table
CREATE TABLE orders (
  order_id      INT         PRIMARY KEY,
  customer_id   INT,
  order_date    DATE,
  status        VARCHAR(20),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Populate orders
INSERT INTO orders VALUES
  (101, 1, '2024-03-01', 'Completed'),
  (102, 2, '2024-03-05', 'Pending'),
  (103, 1, '2024-03-10', 'Completed'),
  (104, 3, '2024-03-12', 'Completed'),
  (105, 4, '2024-03-15', 'Cancelled');

-- 4. Create order_items table
CREATE TABLE order_items (
  order_id    INT,
  product_id  INT,
  quantity    INT,
  unit_price  DECIMAL(10,2),
  FOREIGN KEY (order_id)   REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Populate order_items
INSERT INTO order_items VALUES
  (101, 1, 1, 1200.00),
  (101, 4, 2,   20.00),
  (102, 2, 1,  800.00),
  (103, 3, 2,  150.00),
  (103, 4, 5,   20.00),
  (104, 1, 1, 1200.00),
  (104, 3, 1,  150.00),
  (105, 2, 1,  800.00),
  (105, 4, 3,   20.00);
