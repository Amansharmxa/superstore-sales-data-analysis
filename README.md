# superstore-sales-data-analysis
An end-to-end data analysis project using Excel, Python (Feature Engineering), SQL queries, and Power BI dashboards.

## 📌 Project Overview
This project presents an end-to-end data analytics workflow using the global Superstore sales dataset (~9,800 rows). The objective was to clean raw data, perform feature engineering, execute business queries in a relational database, and build an interactive Power BI dashboard to extract actionable insights.

## 🛠️ Tech Stack & Tools Used
* **Python (Pandas, Jupyter Notebook):** Data cleaning, handling missing values, and feature engineering.
* **SQL (PostgreSQL):** Relational database management and executing business-critical queries.
* **Power BI:** Designing interactive dashboards and visualizing Key Performance Indicators (KPIs).
* **Excel:** Initial data exploration and validation.

## 🔄 Project Workflow & Steps

### 1. Data Cleaning & Preprocessing (Python)
* Loaded the raw dataset and inspected its initial shape (9,800 rows, 18 columns).
* Removed duplicate rows to ensure data integrity.
* Handled missing/unfilled values in the `Postal Code` column.
* Converted `Order Date` and `Ship Date` into standard datetime formats.

### 2. Feature Engineering (Python)
* Extracted new time-based features from the `Order Date` column to enable temporal analysis:
  * `Order_Year` (Year)
  * `Order_Month` (Month name)
  * `Order_DayOfWeek` (Day of the week)
* Exported the processed and cleaned dataset into a new file (`cleaned_train_data.csv`).

### 3. Database Management & SQL Querying (SQL)
* Designed a relational schema and loaded the cleaned data into a PostgreSQL table (`superstore_sales`).
* Executed targeted analytical queries to address key business questions:
  * **Overall KPIs:** Computed Total Revenue, Total Orders, and Average Order Value (AOV).
  * **Category Breakdown:** Analyzed sales distribution across different product categories and sub-categories.
  * **Year-over-Year Growth:** Tracked sales performance trends across multiple years.
  * **Top Customers:** Identified the top 5 highest-spending customers.
  * **Regional Contribution:** Calculated the percentage contribution of each geographic region to total sales.

### 4. Data Visualization (Power BI)
* Designed a clean, interactive dashboard featuring core performance metrics and visual trends.
* **KPI Cards:** Highlighted Total Revenue ($2.26M), Total Orders (5K), Average Order Value ($459.48), and Total Customers (793).
* **Visual Charts:** 
  * Stacked Column Chart illustrating yearly sales growth trends.
  * Line Chart showing monthly revenue fluctuations throughout the year.
  * Interactive slicers enabling dynamic filtering by order year.

## 🚀 Key Insights & Learnings
* Sales show a consistent upward trajectory from 2015 to 2018, with peak revenue months observed towards the end of the calendar year (November/December).
* A small segment of high-spending customers significantly drives a major portion of the average order value.
