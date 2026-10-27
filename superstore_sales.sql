
CREATE TABLE superstore_sales (
    "Row ID" INT,
    "Order ID" VARCHAR(50),
    "Order Date" DATE,
    "Ship Date" DATE,
    "Ship Mode" VARCHAR(50),
    "Customer ID" VARCHAR(50),
    "Customer Name" VARCHAR(100),
    "Segment" VARCHAR(50),
    "Country" VARCHAR(50),
    "City" VARCHAR(50),
    "State" VARCHAR(50),
    "Postal Code" VARCHAR(20),
    "Region" VARCHAR(50),
    "Product ID" VARCHAR(50),
    "Category" VARCHAR(50),
    "Sub-Category" VARCHAR(50),
    "Product Name" TEXT,
    "Sales" NUMERIC(10, 2),       
    "Order_Year" INT,
    "Order_Month" VARCHAR(50),
    "Order_DayOfWeek" VARCHAR(50)
);

COPY superstore_sales 
FROM 'C:\cleaned_train_data.csv' 
WITH (FORMAT csv, HEADER true, DELIMITER ',');

select * from superstore_sales;


-- Query 1 Overall KPIs (Total Revenue, Total Orders, Average Order Value)
SELECT 
    COUNT(DISTINCT "Order ID") AS total_orders,
    ROUND(SUM(CAST("Sales" AS NUMERIC)), 2) AS total_revenue,
    ROUND(AVG(CAST("Sales" AS NUMERIC)), 2) AS avg_order_value
FROM superstore_sales;


-- Query 2 Category & Sub-Category wise Sales Breakdown
SELECT 
    "Category",
    "Sub-Category",
    ROUND(SUM(CAST("Sales" AS NUMERIC)), 2) AS total_sales
FROM superstore_sales
GROUP BY "Category", "Sub-Category"
ORDER BY "Category", total_sales DESC;


-- Query 3 Yearly Sales Growth Trend (Year-over-Year)
SELECT 
    "Order_Year",
    COUNT(DISTINCT "Order ID") AS total_orders,
    ROUND(SUM(CAST("Sales" AS NUMERIC)), 2) AS yearly_sales
FROM superstore_sales
GROUP BY "Order_Year"
ORDER BY "Order_Year" ASC;


-- Query 4 Top 5 Highest Spending Customers
SELECT 
    "Customer ID",
    "Customer Name",
    ROUND(SUM(CAST("Sales" AS NUMERIC)), 2) AS total_spent
FROM superstore_sales
GROUP BY "Customer ID", "Customer Name"
ORDER BY total_spent DESC
LIMIT 5;


-- Query 5 Regional Sales Contribution Percentage
SELECT 
    "Region",
    ROUND(SUM(CAST("Sales" AS NUMERIC)), 2) AS region_sales,
    ROUND(
        (SUM(CAST("Sales" AS NUMERIC)) * 100.0) / 
        (SELECT SUM(CAST("Sales" AS NUMERIC)) FROM superstore_sales), 
        2
    ) AS sales_percentage
FROM superstore_sales
GROUP BY "Region"
ORDER BY region_sales DESC;