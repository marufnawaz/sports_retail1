CREATE TABLE info (
product_name VARCHAR(80),
product_id VARCHAR(15),
description VARCHAR(750)
);

CREATE TABLE finance (
product_id VARCHAR(15),
listing_price DECIMAL(10,2),
sale_price DECIMAL(10,2),
discount DECIMAL(10,2),
revenue DECIMAL(10,2)
);

CREATE TABLE reviews (
product_id VARCHAR(15),
rating DECIMAL(10,2), 
reviews DECIMAL(10,2)
);

CREATE TABLE traffic (
product_id VARCHAR(15),
last_visited DATETIME
);

CREATE TABLE brands (
product_id VARCHAR(15),
brand VARCHAR(8)
)


