CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10, 2),
    quantity INT,
    added_date DATE,
    discount_rate NUMERIC(5, 2)
);
INSERT INTO products (product_name, category, price, quantity, added_date, discount_rate) VALUES
('Laptop', 'Electronics', 75000.50, 10, '2024-01-15', 10.00),
('Smartphone', 'Electronics', 45000.99, 25, '2024-02-20', 5.00),
('Headphones', 'Accessories', 1500.75, 50, '2024-03-05', 15.00),
('Office Chair', 'Furniture', 5500.00, 20, '2023-12-01', 20.00),
('Desk', 'Furniture', 8000.00, 15, '2023-11-20', 12.00),
('Monitor', 'Electronics', 12000.00, 8, '2024-01-10', 8.00),
('Printer', 'Electronics', 5900.50, 5, '2024-02-01', 7.50),
('Mouse', 'Accessories', 750.00, 40, '2024-03-18', 10.00),
('Keyboard', 'Accessories', 1250.00, 35, '2024-03-28', 10.00),
('Tablet', 'Electronics', 30000.00, 12, '2024-02-28', 5.00);

SELECT * FROM products;

-- 1. UPPER()  Convert text to uppercase -----------------------------------
SELECT UPPER(category) AS category_uppercase
FROM products;

-- 2. LOWER()  Convert text to lowercase -----------------------------------
SELECT LOWER(category) AS category_uppercase
FROM products;

-- 3. LENGTH() Returns the length of a string ------------------------------
SELECT product_name, LENGTH(product_name) AS length_of_product
FROM products;

-- 4. CONCAT() Concatinates two or more strings ----------------------------
SELECT CONCAT(product_name,' - ',category) AS product_details
FROM products;

-- 5. SUBSTRING() Extracts a portion of a string ---------------------------
SELECT SUBSTRING(product_name, 1,6) AS sort_name
FROM products;

-- 6. TRIM() Remove leading/trailing spaces --------------------------------
SELECT LENGTH(TRIM('  Monitor   ')) AS Trimmed_Text,
	LENGTH('  Monitor   ') AS length_of_text;

-- 7. REPLACE()  Replaces occurrences of a substring -----------------------
SELECT REPLACE(product_name, 'phone', 'device') AS updated
FROM Products;

-- 8. RIGHT(), LEFT() ------------------------------------------------------
SELECT LEFT(category, 3) AS category_cap
FROM products;

SELECT RIGHT(category, 3) AS category_cap
FROM products;