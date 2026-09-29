create table sales_data(
order_id varchar(50) primary key,
order_date DATE,
customer_id varchar(50),
customer_name varchar(100),
product_id varchar(50)
region varchar(50),
product_name varchar(100),
category varchar(50),
quantity INT,
unit_price numeric(10, 2),
salesperson varchar(100),
);

ALTER DATABASE sales_analytics SET datestyle TO 'ISO, MDY';