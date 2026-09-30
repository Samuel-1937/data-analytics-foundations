## Project Overview
This project is a simulated internship task focused on analyzing e-commerce sales data. The goal is to clean raw business datasets, connect them accurately, and perform data analysis to answer specific business questions and uncover insights. 

**Overall Project Goal Achieved:** By the end of this three-day project, raw business data was successfully taken through the entire data analytics workflow. It was cleaned in Excel, loaded into a relational database using PostgreSQL, and analyzed using complex SQL queries (including JOINs). The final result translated technical data into simple, actionable business recommendations for management.

## Tools Used
* **Microsoft Excel:** Used for initial data inspection, data cleaning, formatting, and standardizing the datasets.
* **PostgreSQL & pgAdmin:** Used as the relational database management system to securely store the cleaned data and execute structured SQL queries to extract business metrics.

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
The final day focused on analyzing business information distributed across multiple related tables.
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