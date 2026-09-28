## Project Overview
This project is a simulated internship task focused on analyzing e-commerce sales data. The goal is to clean raw business datasets, connect them accurately, and perform data analysis to answer specific business questions and uncover insights.

## Tools Used
* **Microsoft Excel:** Used for initial data inspection, data cleaning, formatting, and standardizing the datasets.

## Datasets
The project uses four main datasets:
1. **`products.csv`**: Contains product details including ID, name, category, and standard unit price.
2. **`customers.csv`**: Contains customer details including ID, name, and region.
3. **`raw_sales.csv`**: The uncleaned, raw transactional data containing duplicate records, formatting errors, and missing values.
4. **`orders.csv`**: The main fact table for transactions, which is cleaned and linked to the products and customers tables.

## Work Completed

### Day 1: Data Cleaning and Preparation
The first day I ensured the data was accurate and reliable before starting any analysis. I performed the following tasks in Excel:
* **Products Table:** Removed columns generated during the CSV export process.
* **Customers Table:** Addressed issues with duplicate customer names across different regions by setting up a new `Customer Identifier` column (e.g., `Grace Tetteh (Ashanti - C0001)`). This ensures every customer is uniquely identifiable.
* **Raw Sales Table:** Cleaned the raw data by fixing the date formats using Text to Columns. I also filled in missing `Quantity` and `Unit Price` values, trimmed extra invisible spaces from salesperson names, and corrected mismatched customer names.
* **Orders Table:** Validated the foreign keys (IDs) and created a new calculated column called `Total` (`Quantity` multiplied by `Unit Price`) to prepare for revenue analysis.


## How to Reproduce the Analysis
1. Open the original `.csv` files (`products.csv`, `customers.csv`, `raw_sales.csv`, `orders.csv`) in Microsoft Excel.
2. Follow the steps outlined in the **Data Cleaning Process Report** to remove empty columns, standardize dates using "Text to Columns", and trim extra whitespaces.
3. Add the `Customer Identifier` formula in the customers dataset: `=Name & " (" & Region & " - " & ID & ")"`.
4. Add the `Total` revenue column in the orders dataset using the formula: `=Quantity * Unit Price`.
5. Save the cleaned datasets for the next phase of analysis.