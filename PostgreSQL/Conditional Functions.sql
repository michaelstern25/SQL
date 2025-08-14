/* 1. CASE Function - categorizing based on condition  --------------
We will categorize products into price ranges:

Expensive if the price is greater than or equal to 50,000.
Moderate if the price is between 10,000 and 49,999.
Affordable if the price is less than 10,000.
*/

SELECT product_name, price,
		CASE
			WHEN price>=50000 THEN 'Expensive'
			WHEN price>=10000 AND price<=49999 THEN 'Moderate'
			ELSE 'Affordable'
		END AS price_category
FROM products;

/*
2. We will classify products based on quantity available.

In Stock if quantity is 10 or more.
Limited Stock if quantity is between 5 and 9.
Out of Stock Soon if quantity is less than 5.
*/
SELECT product_name, quantity,
		CASE
			WHEN quantity>=10 THEN 'In Stock'
			WHEN quantity BETWEEN 5 AND 9 THEN 'Limited Stock'
			ELSE 'Out of Stock Soon'
		END AS stock_status
FROM products;


/*
3. Check if the category name contains "Electronics item" or "Furniture item" or 
"Accessory item" using LIKE
*/
SELECT product_name, category,
		CASE
			WHEN category LIKE 'Electronics%' THEN 'Electronics item'
			WHEN category LIKE 'Furniture%' THEN 'Furniture item'
			ELSE 'Accessory item'
		END AS category_type
FROM products;

SELECT product_name, category,
       CASE
           WHEN category IN ('Electronics', 'Electronics Gadgets', 'Electronics Devices') 
                THEN 'Electronics item'
           WHEN category IN ('Furniture', 'Furniture Decor', 'Furniture Sets') 
                THEN 'Furniture item'
           ELSE 'Accessory item'
       END AS category_type
FROM products;


SELECT * FROM products;