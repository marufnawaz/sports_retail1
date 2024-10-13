# Optimizing Online Sports Retail Revenue
![Nike Adidas Logo](https://github.com/marufnawaz/sports_retail1/blob/main/nike-versus-adidas-the-hundreds-article2-900x540-1.jpeg)

## Overview
In this project, i’ll will work with numeric, string, and timestamp data on pricing and revenue, ratings, reviews, descriptions, and website traffic.

## Dataset

The data for this particular project is downloaded from kaggle

- **Dataset Link:** [Retail Sports](https://www.kaggle.com/datasets/irenewidyastuti/datacamp-optimizing-online-sports-retail-revenue)

## Schema

```sql
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
```
