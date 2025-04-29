# 📊 Task6: Sales Trend Analysis

This project involves analyzing sales data using SQL to identify key sales trends such as monthly performance, top-selling products, and regional sales distribution.

---

## 📁 File Structure

```plaintext
Task6_Sales_Trend_Analysis/
├── README.md                  # This file
├── sales_trend.sql            # SQL queries for trend analysis

---

## ✅ SQL Script (sales_trend.sql)

### 1. Create sample table (if needed)
sql
CREATE TABLE online_sales (
  order_id     INT,
  order_date   DATE,
  amount       DECIMAL(10,2),
  product_id   INT
);


### 2. Monthly Revenue & Order Volume Analysis
sql
-- Monthly Revenue and Order Volume
SELECT
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year, month;


> ✅ Use this to identify revenue and volume trends month-over-month.

---

### 3. Filter by year (example: 2023)
sql
SELECT
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS revenue_2023,
  COUNT(DISTINCT order_id) AS volume_2023
FROM online_sales
WHERE EXTRACT(YEAR FROM order_date) = 2023
GROUP BY month
ORDER BY month;


---

### 4. Rolling 3-Month Trend (last 3 months only)
sql
SELECT
  TO_CHAR(order_date, 'YYYY-MM') AS year_month,
  SUM(amount) AS revenue,
  COUNT(DISTINCT order_id) AS order_count
FROM online_sales
WHERE order_date >= CURRENT_DATE - INTERVAL '3 months'
GROUP BY year_month
ORDER BY year_month;


---

## 📝 Sample Output Format (results_table.csv)

| year | month | total_revenue | order_volume |
|------|-------|----------------|---------------|
| 2023 | 1     | 4200.50        | 127           |
| 2023 | 2     | 5120.75        | 140           |
| 2023 | 3     | 3890.00        | 115           |
| ...  | ...   | ...            | ...           |

---

## 📘 Interview Concepts

1. **What is the use of EXTRACT() in SQL?**  
   ➤ Extracts parts of a date, like year, month, day.

2. *How do you calculate monthly revenue?*  
   ➤ Use SUM(amount) grouped by EXTRACT(MONTH FROM order_date).

3. *How do you count order volume?*  
   ➤ Use COUNT(DISTINCT order_id).

4. *How do you sort results by date?*  
   ➤ ORDER BY year, month (after grouping).

5. *Why do we group by both year and month?*  
   ➤ To prevent mixing data across years with the same month (e.g., Jan 2023 vs Jan 2024).

---

