## Project Overview
This project is a simulated internship task focused on analyzing e-commerce sales data. The goal is to clean raw business datasets, connect them accurately, and perform data analysis to answer specific business questions and uncover insights. 

**Overall Project Progress:** The project started with data cleaning in Excel, moved into PostgreSQL and SQL analysis, and then continued into advanced SQL, Power BI modelling, DAX and dashboard reporting. The work from Days 1 to 6 is now brought together in this README.

## Tools Used
* **Microsoft Excel:** Used for initial data inspection, data cleaning, formatting, and standardizing the datasets.
* **PostgreSQL & pgAdmin:** Used as the relational database management system to securely store the cleaned data and execute structured SQL queries to extract business metrics.
* **Power BI Desktop:** Used to build the data model, create DAX measures and build the final sales dashboard.
* **Power Query:** Used inside Power BI to check data types, column quality and table structure before analysis.
* **DAX:** Used to create measures such as Total Revenue, Total Orders, Average Order Value and Total Customers.
* **Git & GitHub:** Used to keep track of the project files and project progress.

## Datasets
The project uses four main datasets:
1. **`products.csv`**: Contains product details including ID, name, category, and standard unit price.
2. **`customers.csv`**: Contains customer details including ID, name, and region.
3. **`raw_sales.csv`**: The uncleaned, raw transactional data containing duplicate records, formatting errors, and missing values. Once cleaned, this file acts as the primary data source for the Day 2 SQL analysis.
4. **`orders.csv`**: The main fact table for transactions, which is cleaned and linked to the products and customers tables.

## Work Completed

### Day 1: Data Cleaning and Preparation
On the first day, the data was checked to ensure it was accurate and reliable before starting any analysis. The following tasks were performed in Excel:
* **Products Table:** Removed columns generated during the CSV export process.
* **Customers Table:** Addressed issues with duplicate customer names across different regions by setting up a new `Customer Identifier` column (e.g., `Grace Tetteh (Ashanti - C0001)`). This ensures every customer is uniquely identifiable.
* **Raw Sales Table:** Cleaned the raw data by fixing the date formats using Text to Columns. Missing `Quantity` and `Unit Price` values were filled in, extra invisible spaces from salesperson names were trimmed, and mismatched customer names were corrected.
* **Orders Table:** Validated the foreign keys (IDs) and created a new calculated column called `Total` (`Quantity` multiplied by `Unit Price`) to prepare for revenue analysis.

### Day 2: PostgreSQL + SQL for Data Analytics
The cleaned tabular data was transitioned into a relational database to conduct querying and translate data into actionable insights.
* **Database & Schema Setup:** Created a local `sales_analytics` database in PostgreSQL and defined a `sales_data` table with explicitly defined data types (`VARCHAR`, `DATE`, `INT`, `NUMERIC`) to match the cleaned CSV output.
* **Data Import:** The data was successfully imported from the CSV file into the configured columns in the table, ensuring the columns were orderly placed.
* **SQL Analysis:** Authored a total of 12 analytical queries utilizing `SELECT`, `COUNT()`, `SUM()`, `GROUP BY`, and `HAVING` clauses. These scripts extracted core metrics like total gross revenue, average order value, regional performance distributions, and top-performing sales representatives.
* **Business Documentation:** Created a `findings.md` report that translates the raw SQL data outputs into plain business language, clarifying *why* the data matters.

### Day 3: Relational Analytics + SQL JOINS
Day 3 focused on analyzing business information distributed across multiple related tables.
* **Relational Database Design:** Defined Primary Keys and Foreign Keys to establish one-to-many relationships between the customers, products, and orders tables.
* **Advanced SQL Queries:** Used `INNER JOIN`, `LEFT JOIN`, and Common Table Expressions (CTEs) to answer complex management questions that required combining data from all three tables.
* **Management Summary:** Wrote a simplified, non-technical executive summary (`management_summary.md`) detailing the key findings and providing actionable business recommendations based on the data.

## How to Reproduce the Analysis
1. Open the original `.csv` files (`products.csv`, `customers.csv`, `raw_sales.csv`, `orders.csv`) in Microsoft Excel.
2. Follow the steps outlined in the **Data Cleaning Process Report** to remove empty columns, standardize dates using "Text to Columns", and trim extra whitespaces.
3. Add the `Customer Identifier` formula in the customers dataset: `=Name & " (" & Region & " - " & ID & ")"`.
4. Add the `Total` revenue column in the orders dataset using the formula: `=Quantity * Unit Price`.
5. Save the cleaned datasets as standard CSV UTF-8 files for the next phase of analysis.
6. Launch pgAdmin and run the scripts located in `database_setup.sql` to initialize the `sales_analytics` database and build the single-table structure for Day 2.
7. Use the pgAdmin **Import/Export Data** utility to load the cleaned CSV files, ensuring the Header option is checked and Delimiter is set to comma. 
8. Open the `analysis_queries.sql` file in the pgAdmin Query Tool and execute the 12 queries to reproduce the Day 2 metrics.
9. For Day 3, run `relational_setup.sql` to create the linked, multi-table schema.
10. Run `join_queries.sql` to view the advanced insights combining customers, products, and the orders data.

---

## Work Completed - Days 4 to 6

### Day 4: Advanced SQL Analysis
Day 4 used advanced PostgreSQL queries to answer deeper business questions. The work included monthly revenue, month-on-month performance, product ranking within categories, top customers by region, category contribution, customer value groups and below-average performance. CTEs, CASE WHEN, date functions and window functions were used.

The main Day 4 files are `day4_advanced_sql.sql`, `day4_findings.md` and exported query results.

### Day 5: Power BI Data Model and DAX

## Important Cleaning and Modelling Decisions

### Data checks
Before building the Power BI model, the data was checked for:
- column names
- data types
- missing values
- table structure
- matching customer IDs
- matching product IDs
- record counts

### Data types
Examples of data types used:
- IDs and names → Text
- `order_date` → Date
- `quantity` → Whole Number
- `unit_price` → Decimal Number
- `total` → Decimal Number
- `standard_unit_price` → Decimal Number

### Data model
The Power BI model follows this structure:

`customers (1) -> (*) orders (*) <- (1) products`

Relationships used:
- `customers[customer_id]` → `orders[customer_id]`
- `products[product_id]` → `orders[product_id]`

Both relationships are one-to-many and use single-direction filtering.

`orders` is the fact table because it stores the sales transactions and numerical values.

`customers` and `products` are dimension tables because they describe the customers and products used in the sales.

## Power Query and DAX

### Power Query
Power Query was used to prepare and check the data before analysis.

It was used to check:
- data types
- column quality
- table structure
- record counts

### DAX
DAX was used to create measures after the data was loaded into the model.

The six DAX measures created were:
- Total Revenue
- Total Orders
- Total Quantity Sold
- Average Order Value
- Total Customers
- Average Revenue per Customer

### Day 6: Sales Management Dashboard

## Key KPIs

### Total Revenue
**About GH₵4.73 million**

This shows the total value of sales during the period.

### Total Orders
**1,200 orders**

This shows the number of sales transactions in the dataset.

### Average Order Value
**About GH₵3.94K**

This shows the average revenue generated from one order.

### Total Customers
**180 customers**

This shows the number of customers represented in the sales data.

## Dashboard Content
The final dashboard contains:
- Total Revenue KPI card
- Total Orders KPI card
- Average Order Value KPI card
- Total Customers KPI card
- Monthly Revenue Trend
- Revenue by Region
- Revenue by Product Category
- Top 5 Products by Revenue
- Top 10 Customers by Revenue
- Revenue by Salesperson
- Region slicer
- Category slicer
- Date Range slicer

The slicers allow the user to filter the dashboard and view specific parts of the data.

## Day 6 - Business Insights and Recommendations

### Business Findings and Interpretations

#### 1. Total revenue was about GH₵4.73 million
**Finding:** The business generated about GH₵4.73 million in revenue.

**Interpretation:** This gives management a main figure for overall sales performance and a starting point for comparing other parts of the business.

#### 2. Greater Accra generated the highest regional revenue
**Finding:** Greater Accra had the highest revenue among the regions shown. Ashanti was second.

**Interpretation:** Greater Accra is an important sales region in this dataset. The dashboard does not prove why it performed better, so management could compare customer numbers, order values and product mix across regions.

#### 3. Computers generated the most revenue by category
**Finding:** The Computers category generated much more revenue than the other categories.

**Interpretation:** A large part of the business revenue depends on computer products. Management should continue to monitor this category while also checking whether smaller categories have room to grow.

#### 4. Performance Laptop was the highest-revenue product
**Finding:** Performance Laptop ranked first in the Top 5 Products by Revenue chart.

**Interpretation:** This product is important to total sales. Management should monitor its sales and stock levels closely. The dashboard does not prove why customers bought it more.

#### 5. Monthly revenue changed during the period
**Finding:** Revenue moved up and down from January 2025 to August 2026 instead of staying at the same level.

**Interpretation:** Management should review the high and low months to see what changed. More information would be needed before saying what caused the changes.

#### 6. Some customers contributed much more revenue than others
**Finding:** The Top 10 Customers chart shows that a small group of customers generated higher revenue than many others.

**Interpretation:** These customers are important to the business. Management may want to understand their buying patterns and whether they place repeat orders.

#### 7. Esther generated the highest salesperson revenue
**Finding:** Esther had the highest revenue among the salespeople shown on the dashboard.

**Interpretation:** Esther was the leading salesperson by revenue in this dataset. More information would be needed to explain the difference, such as number of orders, customers served and products sold.

### Recommendations to Management

#### Recommendation 1 - Monitor the Computers category closely
The Computers category makes up a large part of total revenue. Management should keep checking sales and stock for the strongest computer products.

#### Recommendation 2 - Review lower-performing regions
Management should compare lower-revenue regions with stronger regions such as Greater Accra and Ashanti.

The review could look at:
- customer numbers
- average order value
- product mix
- number of orders

#### Recommendation 3 - Review monthly sales changes
Management should review months with large increases or decreases in revenue. The business can check whether customer activity, product demand, stock levels, promotions or other business events were different during those months.

The dashboard shows the pattern but does not prove the cause.

#### Recommendation 4 - Monitor top customers and salespeople
Management should keep track of top customers and strong salespeople because they contribute a large amount of revenue.

## Project Structure

```text
data-analytics-foundations/
├── data/
├── day1-excel/
├── day2-sql/
├── day3-relational-analysis/
├── day4-advanced-sql/
│   ├── day4_advanced_sql.sql
│   ├── day4_findings.md
│   └── results/
├── day5-powerbi-model/
│   ├── day5_powerbi_model.pbix
│   ├── day5_model_view.png
│   └── day5_notes.md
├── powerbi/
│   ├── sales_management_dashboard.pbix
│   └── dashboard.png
└── README.md
```

## How to Review the SQL Work
1. Open the `day4-advanced-sql` folder.
2. Open `day4_advanced_sql.sql`.
3. Review the queries for monthly revenue, month-on-month performance, product ranking, top customers, category contribution, customer value groups and below-average performance.
4. Open `day4_findings.md` to read the business findings.
5. Review the exported query results in the `results` folder.

## How to Review the Power BI Work
1. Open `day5_powerbi_model.pbix` to review the data model and DAX measures.
2. Check the model view and confirm:
   - customers (1) → (*) orders
   - products (1) → (*) orders
3. Open `powerbi/sales_management_dashboard.pbix`.
4. Review the KPI cards and charts.
5. Test the Region, Category and Date Range slicers.
6. Compare important Power BI totals with the SQL results from Day 4.
7. Open `powerbi/dashboard.png` for the final dashboard screenshot.