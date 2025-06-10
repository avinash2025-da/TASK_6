CREATE DATABASE ONLINE_SALES;
USE ONLINE_SALES;

CREATE TABLE online_sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id INT
);

-- Monthly Revenue and Order Volume Analysis
SELECT
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS total_orders
FROM
  online_sales
GROUP BY
  EXTRACT(YEAR FROM order_date),
  EXTRACT(MONTH FROM order_date)
ORDER BY
  year, month;

-- Top 3 Months by Revenue
SELECT
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue
FROM
  online_sales
GROUP BY
  year, month
ORDER BY
  total_revenue DESC
LIMIT 3;

