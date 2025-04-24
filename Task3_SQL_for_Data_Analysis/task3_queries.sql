-- task3_queries.sql

-- 1️⃣ Simple SELECT & WHERE
SELECT order_id, customer_id, order_date
FROM orders
WHERE status = 'Completed'
ORDER BY order_date;

-- 2️⃣ JOINs & Aggregation
SELECT
  o.order_id,
  c.name        AS customer,
  SUM(oi.quantity * oi.unit_price) AS order_total
FROM orders o
JOIN customers c  ON o.customer_id = c.customer_id
JOIN order_items oi
  ON o.order_id = oi.order_id
WHERE o.status = 'Completed'
GROUP BY o.order_id, c.name
ORDER BY order_total DESC;

-- 3️⃣ Aggregate Functions
SELECT
  SUM(oi.quantity * oi.unit_price) AS total_revenue,
  AVG(oi.quantity * oi.unit_price) AS avg_order_value
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Completed';

-- 4️⃣ GROUP BY & HAVING
SELECT
  p.name,
  SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
HAVING SUM(oi.quantity) > 3
ORDER BY total_sold DESC;

-- 5️⃣ Subquery: High-Value Customers
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
JOIN customers c
  ON c.customer_id = cust_totals.customer_id
WHERE cust_totals.total_spent >
  (
    SELECT AVG(total_spent)
    FROM (
      SELECT
        SUM(oi.quantity * oi.unit_price) AS total_spent
      FROM orders o
      JOIN order_items oi ON o.order_id = oi.order_id
      WHERE o.status = 'Completed'
      GROUP BY o.customer_id
    ) AS avg_calc
  );

-- 6️⃣ Create a reusable VIEW
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

-- 7️⃣ Indexes for Performance
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_items_product   ON order_items(product_id);
CREATE INDEX idx_orders_date      ON orders(order_date);
