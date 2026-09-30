create table customers(
customer_id varchar(10) primary key,
customer_name varchar(100),
region varchar(50)
);

create table products(
product_id varchar(10) primary key,
product_name varchar(100),
category varchar(30)
);

create table orders(
order_id varchar(20) primary key,
order_date DATE,
customer_id varchar(10) references customers(customer_id),
product_id varchar(10) references products(product_id),
quantity INT,
unit_price numeric(10, 4),
salesperson varchar(100)
);