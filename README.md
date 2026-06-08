# Sales Trend Analysis Using SQL Aggregations

## Project Overview

This project focuses on analyzing sales performance data using SQL aggregation techniques. The objective is to identify monthly revenue trends, measure order volume, and determine the highest-performing sales periods.

The analysis demonstrates essential SQL skills used in Data Analyst and Business Intelligence roles, including data extraction, aggregation, grouping, filtering, sorting, and trend analysis.

---

## Objective

To analyze monthly sales trends by:

* Calculating monthly revenue
* Measuring monthly order volume
* Identifying top-performing months
* Analyzing sales for a specific time period
* Applying SQL aggregation techniques to generate business insights

---

## Tools & Technologies Used

* MySQL
* SQL
* Git
* GitHub

---

## Dataset Information

### Table: `online_sales`

| Column Name | Description                       |
| ----------- | --------------------------------- |
| order_id    | Unique identifier for each order  |
| order_date  | Date when the order was placed    |
| amount      | Revenue generated from the order  |
| product_id  | Unique identifier for the product |

---

## SQL Skills Demonstrated

### Data Extraction

* Extracting Year and Month from dates using `EXTRACT()`

### Data Aggregation

* Calculating revenue using `SUM()`
* Counting orders using `COUNT(DISTINCT)`

### Data Grouping

* Grouping records by month and year using `GROUP BY`

### Data Filtering

* Analyzing specific time periods using `WHERE`

### Data Sorting

* Sorting results using `ORDER BY`

### Performance Analysis

* Identifying top-performing months using `LIMIT`

---

## Key SQL Concepts Used

```sql
EXTRACT()
GROUP BY
SUM()
COUNT(DISTINCT)
ORDER BY
WHERE
LIMIT
```

---

# SQL Queries Implemented

## Query 1: Extract Year and Month from Order Date

This query extracts the year and month components from the order date.

```sql
SELECT
    order_id,
    order_date,
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month
FROM online_sales;
```

---

## Query 2: Group Data by Year and Month

This query groups records based on year and month.

```sql
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month
FROM online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date);
```

---

## Query 3: Calculate Monthly Revenue

This query calculates total monthly revenue using `SUM()`.

```sql
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date);
```

---

## Query 4: Calculate Monthly Order Volume

This query calculates the number of unique orders per month.

```sql
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date);
```

---

## Query 5: Sort Monthly Sales Results

This query sorts monthly sales data chronologically using `ORDER BY`.

```sql
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
```

---

## Query 6: Analyze Sales for a Specific Time Period

This query analyzes sales between January 2025 and March 2025.

```sql
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
```

---

## Query 7: Monthly Revenue and Order Volume Analysis (Final Task Query)

This query combines all concepts and generates the final monthly sales report.

```sql
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
```

---

## Query 8: Top 3 Months by Sales Revenue

This query identifies the three highest-performing months based on revenue.

```sql
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
```

---

# Results

## Monthly Revenue and Order Volume

| Year | Month | Revenue | Orders |
| ---- | ----- | ------: | -----: |
| 2025 | 1     | 1200.00 |      2 |
| 2025 | 2     | 2000.00 |      2 |
| 2025 | 3     | 2400.00 |      2 |
| 2025 | 4     | 2900.00 |      2 |
| 2025 | 5     | 3300.00 |      2 |
| 2025 | 6     | 4200.00 |      2 |

---

## Top 3 Revenue Generating Months

| Rank | Year | Month | Revenue |
| ---- | ---- | ----- | ------: |
| 1    | 2025 | 6     | 4200.00 |
| 2    | 2025 | 5     | 3300.00 |
| 3    | 2025 | 4     | 2900.00 |

---

# Business Insights

### Revenue Growth Trend

Monthly revenue shows a consistent upward trend from January to June, indicating strong sales growth over time.

### Peak Sales Month

June 2025 generated the highest revenue of **4200.00**, making it the best-performing month.

### Order Volume Analysis

Order volume remained stable across all months, suggesting that revenue growth was primarily driven by increased transaction value rather than a higher number of orders.

### Strategic Observation

The increasing revenue trend may indicate:

* Higher customer spending
* Better-performing products
* Effective sales and marketing strategies

---

# Learning Outcomes

Through this project, I gained practical experience in:

* Writing analytical SQL queries
* Working with date functions
* Using aggregate functions for business reporting
* Performing trend analysis on transactional datasets
* Generating insights from structured data
* Applying SQL techniques commonly used in Data Analyst roles

---

# Conclusion

This project successfully demonstrates how SQL aggregation functions can be used to analyze business performance. Monthly revenue and order volume were calculated, trends were identified, and top-performing sales periods were determined. The analysis highlights the importance of SQL in transforming raw transactional data into meaningful business insights.

---

## Author

**Praveena**

Aspiring Data Analyst | SQL | MySQL | Python | Data Analytics | Machine Learning
