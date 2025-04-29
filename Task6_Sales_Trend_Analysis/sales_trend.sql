## 🪜 Step-by-Step Queries in sales_trend.sql

### 1. Monthly Revenue and Order Volume
sql
SELECT
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year, month;


### 2. Filtered by Specific Year (e.g., 2023)
sql
SELECT
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS revenue_2023,
  COUNT(DISTINCT order_id) AS volume_2023
FROM online_sales
WHERE EXTRACT(YEAR FROM order_date) = 2023
GROUP BY month
ORDER BY month;


### 3. Last 3 Months Trend
sql
SELECT
  TO_CHAR(order_date, 'YYYY-MM') AS year_month,
  SUM(amount) AS revenue,
  COUNT(DISTINCT order_id) AS order_count
FROM online_sales
WHERE order_date >= CURRENT_DATE - INTERVAL '3 months'
GROUP BY year_month
ORDER BY year_month;

