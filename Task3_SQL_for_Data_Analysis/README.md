# Task 3: SQL for Data Analysis

**Objective**  
Use SQL to extract, manipulate, and analyze e-commerce sales data, demonstrating proficiency with:
- `SELECT`, `WHERE`, `ORDER BY`
- `GROUP BY`, `HAVING`
- `JOIN` types (INNER, LEFT, RIGHT)
- Subqueries
- Aggregate functions (`SUM`, `AVG`)
- Views
- Indexing

---

## 📁 File Structure

```
Task3_SQL_for_Data_Analysis/
├── README.md
├── schema_and_data.sql     # DDL & sample INSERTs
└── task3_queries.sql       # All SQL exercises

```

---

## 🛠️ How to Create & Populate Your `.sql` Files

1. **Open a text editor** (VS Code, Sublime, Notepad++, etc.).  
2. **Paste** the SQL statements (see sections below).  
3. **Save** the first set as `schema_and_data.sql`.  
4. **Save** the second set as `task3_queries.sql`.  

---

## 📜 Contents of `schema_and_data.sql`

```sql
-- 1. Create customers table
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name        VARCHAR(50),
  email       VARCHAR(100),
  signup_date DATE
);

INSERT INTO customers VALUES
  (1, 'Alice',   'alice@example.com',   '2024-01-15'),
  (2, 'Bob',     'bob@example.com',     '2024-01-20'),
  (3, 'Charlie', 'charlie@example.com', '2024-02-10'),
  (4, 'Diana',   'diana@example.com',   '2024-02-25');

-- 2. Create products table
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  name       VARCHAR(50),
  category   VARCHAR(30),
  price      DECIMAL(10,2)
);

INSERT INTO products VALUES
  (1, 'Laptop',     'Electronics', 1200.00),
  (2, 'Smartphone', 'Electronics',  800.00),
  (3, 'Desk Chair', 'Furniture',    150.00),
  (4, 'Book',       'Stationery',     20.00);

-- 3. Create orders table
CREATE TABLE orders (
  order_id    INT PRIMARY KEY,
  customer_id INT,
  order_date  DATE,
  status      VARCHAR(20),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
  (101, 1, '2024-03-01', 'Completed'),
  (102, 2, '2024-03-05', 'Pending'),
  (103, 1, '2024-03-10', 'Completed'),
  (104, 3, '2024-03-12', 'Completed'),
  (105, 4, '2024-03-15', 'Cancelled');

-- 4. Create order_items table
CREATE TABLE order_items (
  order_id   INT,
  product_id INT,
  quantity   INT,
  unit_price DECIMAL(10,2),
  FOREIGN KEY (order_id)   REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

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
```

---

## 📜 Contents of `task3_queries.sql`

```sql
-- 1. Simple SELECT & WHERE
SELECT order_id, customer_id, order_date
FROM orders
WHERE status = 'Completed'
ORDER BY order_date;

-- 2. JOINs & Aggregation
SELECT
  o.order_id,
  c.name AS customer,
  SUM(oi.quantity * oi.unit_price) AS order_total
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Completed'
GROUP BY o.order_id, c.name
ORDER BY order_total DESC;

-- 3. Aggregate Functions
SELECT
  SUM(oi.quantity * oi.unit_price) AS total_revenue,
  AVG(oi.quantity * oi.unit_price) AS avg_order_value
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Completed';

-- 4. GROUP BY & HAVING
SELECT
  p.name,
  SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
HAVING SUM(oi.quantity) > 3
ORDER BY total_sold DESC;

-- 5. Subquery: High-Value Customers
SELECT
  c.name,
  cust_totals.total_spent
FROM (
  SELECT
    o.customer_id,
    SUM(oi.quantity * oi.unit_price) AS total_spent
  FROM orders o
  JOIN order_items oi ON o.order_id = oi.order_id
  WHERE o.status = 'Completed'
  GROUP BY o.customer_id
) AS cust_totals
JOIN customers c ON c.customer_id = cust_totals.customer_id
WHERE cust_totals.total_spent >
  (
    SELECT AVG(total_spent)
    FROM (
      SELECT SUM(oi.quantity * oi.unit_price) AS total_spent
      FROM orders o
      JOIN order_items oi ON o.order_id = oi.order_id
      WHERE o.status = 'Completed'
      GROUP BY o.customer_id
    ) AS avg_calc
  );

-- 6. Create a VIEW
CREATE VIEW vw_customer_spend AS
SELECT
  c.customer_id,
  c.name,
  COALESCE(SUM(oi.quantity * oi.unit_price), 0) AS total_spent
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id AND o.status = 'Completed'
LEFT JOIN order_items oi
  ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name;

-- 7. Indexes for Performance
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_items_product   ON order_items(product_id);
CREATE INDEX idx_orders_date      ON orders(order_date);
```

---

## 🚀 How to Run

1. **Load schema & data**  
   ```
   mysql -u your_user -p < schema_and_data.sql
   ```
2. **Execute queries**  
   ```
   mysql -u your_user -p < task3_queries.sql
   ```
