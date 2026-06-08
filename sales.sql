-- ==========================================
-- Sales Trend Analysis Using Aggregations
-- ==========================================

-- Create Database
CREATE DATABASE Sales;

-- Use Database
USE Sales;

-- Create Table
CREATE TABLE online_sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);

-- Insert Sample Data
INSERT INTO online_sales VALUES
(1,'2025-01-05',500,101),
(2,'2025-01-15',700,102),
(3,'2025-02-10',1200,103),
(4,'2025-02-18',800,101),
(5,'2025-03-05',1500,104),
(6,'2025-03-15',900,102),
(7,'2025-04-02',1800,105),
(8,'2025-04-20',1100,103),
(9,'2025-05-10',2000,106),
(10,'2025-05-25',1300,104),
(11,'2025-06-08',2500,107),
(12,'2025-06-18',1700,108);

-- =====================================================
-- Use EXTRACT(MONTH FROM order_date)
-- =====================================================

SELECT
    order_id,
    order_date,
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month
FROM online_sales;

-- =====================================================
-- GROUP BY Year and Month
-- =====================================================

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month
FROM online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date);

-- =====================================================
-- SUM() for Revenue
-- =====================================================

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date);

-- =====================================================
-- COUNT(DISTINCT order_id) for Volume
-- =====================================================

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date);

-- =====================================================
-- ORDER BY for Sorting
-- =====================================================

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year,
    month;

-- =====================================================
-- Limit Results for Specific Time Period
-- =====================================================

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
WHERE order_date BETWEEN '2025-01-01' AND '2025-03-31'
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year,
    month;

-- =====================================================
-- Monthly Revenue and Order Volume Analysis
-- =====================================================

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year,
    month;

-- =====================================================
-- TOP 3 MONTHS BY SALES
-- =====================================================

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    total_revenue DESC
LIMIT 3;
