--Count the total number of products, along with the number of non-missing values in description, listing_price, and last_visited

```sql
SELECT COUNT(*) as total_rows,
       COUNT(inf.description) AS count_description, 
       COUNT(fi.listing_price) AS count_listing_price,
       COUNT(tr.last_visited) AS count_last_visited
FROM info inf
INNER JOIN traffic tr
ON tr.product_id = inf.product_id
INNER JOIN finance fi
ON fi.product_id = inf.product_id;
```
--Create labels for products grouped by price range and brand.

```sql
SELECT br.brand, 
       COUNT(*) AS cnt, 
	   SUM(fi.revenue) as total_revenue,
       CASE WHEN fi.listing_price < 42 THEN 'Budget'
       WHEN fi.listing_price >= 42 AND fi.listing_price < 74 THEN 'Average'
       WHEN fi.listing_price >= 74 AND fi.listing_price < 129 THEN 'Expensive'
       ELSE 'Elite' END AS price_category
FROM finance fi
INNER JOIN brands br ON fi.product_id = br.product_id
WHERE br.brand IS NOT NULL
GROUP BY br.brand, CASE WHEN fi.listing_price < 42 THEN 'Budget'
                   WHEN fi.listing_price >= 42 AND fi.listing_price < 74 THEN 'Average'
                   WHEN fi.listing_price >= 74 AND fi.listing_price < 129 THEN 'Expensive'
                   ELSE 'Elite' END
ORDER BY total_revenue DESC;
```
-- Split description into bins in increments of one hundred characters, and calculate average rating by for each bin.
```sql
SELECT 
    FLOOR(LEN(i.description) / 100.0) * 100 AS description_length,
    ROUND(AVG(CAST(r.rating AS numeric(10, 2))), 2) AS average_rating
FROM info AS i
INNER JOIN reviews AS r ON i.product_id = r.product_id
WHERE i.description IS NOT NULL
GROUP BY FLOOR(LEN(i.description) / 100.0) * 100
ORDER BY description_length;
```
-- Count the number of reviews per brand per month.

```sql
SELECT 
    br.brand, 
    DATEPART(month, tr.last_visited) AS mnth, 
    COUNT(*) AS num_reviews
FROM brands AS br
INNER JOIN traffic AS tr ON br.product_id = tr.product_id
INNER JOIN reviews AS r ON tr.product_id = r.product_id
GROUP BY br.brand, DATEPART(month, tr.last_visited)
HAVING br.brand IS NOT NULL
    AND DATEPART(month, tr.last_visited) IS NOT NULL
ORDER BY br.brand, mnth;
```