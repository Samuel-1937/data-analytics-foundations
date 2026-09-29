## Project Overview
This project is a simulated internship task focused on analyzing e-commerce sales data. The goal is to clean raw business datasets, connect them accurately, and perform data analysis to answer specific business questions and uncover insights.

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
The first day I ensured the data was accurate and reliable before starting any analysis. I performed the following tasks in Excel:
* **Products Table:** Removed columns generated during the CSV export process.
* **Customers Table:** Addressed issues with duplicate customer names across different regions by setting up a new `Customer Identifier` column (e.g., `Grace Tetteh (Ashanti - C0001)`). This ensures every customer is uniquely identifiable.
* **Raw Sales Table:** Cleaned the raw data by fixing the date formats using Text to Columns. I also filled in missing `Quantity` and `Unit Price` values, trimmed extra invisible spaces from salesperson names, and corrected mismatched customer names.
* **Orders Table:** Validated the foreign keys (IDs) and created a new calculated column called `Total` (`Quantity` multiplied by `Unit Price`) to prepare for revenue analysis.

### Day 2: PostgreSQL + SQL for Data Analytics
Transitioned the cleaned tabular data into a relational database to conduct querying and translate data into actionable insights.
* **Database & Schema Setup:** Created a local `sales_analytics` database in PostgreSQL and defined a `sales_data` table with explicitly defined data types (`VARCHAR`, `DATE`, `INT`, `NUMERIC`) to match the cleaned CSV output.
* **Data Import:** I successfully imported the data from the CSV file into the columns I had setup in the table, and me sure the columns were orderly placed.
* **SQL Analysis:** Authored a total of 12 analytical queries utilizing `SELECT`, `COUNT()`, `SUM()`, `GROUP BY`, and `HAVING` clauses. These scripts extracted core metrics like total gross revenue, average order value, regional performance distributions, and top-performing sales representatives.
* **Business Documentation:** Created a `findings.md` report that translates the raw SQL data outputs into plain business language, clarifying *why* the data matters.

## How to Reproduce the Analysis
1. Open the original `.csv` files (`products.csv`, `customers.csv`, `raw_sales.csv`, `orders.csv`) in Microsoft Excel.
2. Follow the steps outlined in the **Data Cleaning Process Report** to remove empty columns, standardize dates using "Text to Columns", and trim extra whitespaces.
3. Add the `Customer Identifier` formula in the customers dataset: `=Name & " (" & Region & " - " & ID & ")"`.
4. Add the `Total` revenue column in the orders dataset using the formula: `=Quantity * Unit Price`.
5. Save the cleaned datasets as standard CSV UTF-8 files for the next phase of analysis.
6. Launch pgAdmin and run the scripts located in `database_setup.sql` to initialize the `sales_analytics` database and build the `sales_data` table structure.
7. Use the pgAdmin **Import/Export Data** utility on the `sales_data` table to load your cleaned CSV file, ensuring the Header option is checked and Delimiter is set to comma. 
8. Open the `analysis_queries.sql` file in the pgAdmin Query Tool and execute the 12 queries to reproduce the exact metrics documented in `findings.md`.