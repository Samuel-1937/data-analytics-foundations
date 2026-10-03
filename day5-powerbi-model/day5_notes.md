# Day 5 Notes - Power BI Data Model

## Overview

For Day 5, I connected Power BI Desktop to the PostgreSQL `sales_analytics` database.

I loaded these three tables:

- `public customers`
- `public products`
- `public orders`

The aim was to prepare a simple data model that can be used for analysis and for the dashboard in Day 6.

## Data checks

Before building the model, I checked the tables and their data types.

- `customer_id`, `product_id` and `order_id` were treated as text.
- `order_date` was treated as a date.
- `quantity` was treated as a whole number.
- `unit_price`, `total` and `standard_unit_price` were treated as decimal numbers.
- I checked the data before creating the relationships.

## Data model

I created two relationships in Power BI:

1. `public customers[customer_id]` has a one-to-many relationship with `public orders[customer_id]`.
2. `public products[product_id]` has a one-to-many relationship with `public orders[product_id]`.

The model follows this structure:

`customers (1) -> (*) orders (*) <- (1) products`

I used single-direction filtering for the relationships.

## Fact table and dimension tables

`public orders` is the fact table because it contains the sales transactions. It includes information such as order date, quantity, unit price, salesperson and total.

`public customers` is a dimension table because it gives more information about each customer, such as customer name and region.

`public products` is also a dimension table because it gives more information about each product, such as product name, category and standard unit price.

This model makes it possible to analyse sales by customer, region, product and category.

## Power Query

Power Query is used to prepare data before analysis.

I used Power Query to check column names, data types, data quality and the structure of the three tables.

Power Query is useful for tasks such as changing data types, renaming columns, removing unnecessary columns and handling missing values when there is a good reason.

## DAX

DAX is used to create calculations after the data has been loaded into the Power BI model.

I created six DAX measures:

### 1. Total Revenue

```DAX
Total Revenue =
SUMX(
    'public orders',
    'public orders'[quantity] * 'public orders'[unit_price]
)
```

This calculates the total sales revenue.

### 2. Total Orders

```DAX
Total Orders =
DISTINCTCOUNT('public orders'[order_id])
```

This counts the number of different orders.

### 3. Total Quantity Sold

```DAX
Total Quantity Sold =
SUM('public orders'[quantity])
```

This calculates the total number of items sold.

### 4. Average Order Value

```DAX
Average Order Value =
DIVIDE(
    [Total Revenue],
    [Total Orders]
)
```

This calculates the average revenue from each order.

### 5. Total Customers

```DAX
Total Customers =
DISTINCTCOUNT('public orders'[customer_id])
```

This counts the number of customers who placed orders.

### 6. Average Revenue per Customer

```DAX
Average Revenue per Customer =
DIVIDE(
    [Total Revenue],
    [Total Customers]
)
```

This calculates the average revenue generated per customer.

## Difference between Power Query and DAX

Power Query and DAX have different jobs.

**Power Query** is mainly used to prepare and clean the data before it is loaded into the model.

**DAX** is mainly used to calculate results after the data is already in the model.

For example, changing `order_date` to a Date type is a Power Query task. Calculating Total Revenue is a DAX task.

## Day 5 result

The Power BI model is connected to PostgreSQL and contains the correct relationships between customers, products and orders.

The six DAX measures have also been created. The model is now ready to be used to build the management dashboard in Day 6.