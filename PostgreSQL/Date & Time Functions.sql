-- 1. NOW () - Returns the current date and time ----------------------
SELECT NOW() AS CURRENT_DATETIME;


-- 2. CURRENT_DATE() - Returns the current date -----------------------
SELECT CURRENT_DATE AS TODAY_DATE;

SELECT added_date, (CURRENT_DATE) AS today_date, (CURRENT_DATE - added_date) AS days_difference
FROM products;


-- 3. CURRENT_TIME() - Returns the current time -----------------------
SELECT CURRENT_TIME AS TODAY_TIME;


-- 4. DATE_PART() - Extracts a part of the date -----------------------
-- Extract the day of the week from added_date
SELECT product_name, added_date,
		DATE_PART('dow', added_date) AS day_of_week
FROM products;


-- 5. AGE() - Returns the age betwwen two dates ------------------------
-- Calculate the time difference between added_date and todays date.
SELECT product_name,
		AGE(CURRENT_DATE, added_date) AS age_since_added
FROM products;


-- 6. EXTRACT() - Extracts a spacific part of the date ----------------
SELECT product_name,
		EXTRACT(YEAR FROM added_date) AS Year_added,
		EXTRACT(MONTH FROM added_date) AS month_added,
		EXTRACT(DAY FROM added_date) AS day_added
FROM products;


-- 7. TO_CHAR() - Format Dates as strings ----------------------------
-- Format added_date in a custom format (DD-Mon-YYYY).
SELECT product_name,
		TO_CHAR(added_date, 'DD-Mon-YYYY') AS formated_date
FROM products;


-- 8. DATE_TRUNC() - Truncate Date to Precision ----------------------
-- Truncate added_date to the start of the month.
SELECT product_name, added_date,
		DATE_TRUNC('week', added_date) AS week_start
FROM products;


-- 9. INTERVAL - Add or Subtract Time Intervals ----------------------
-- Add 6 month to the added_date
SELECT product_name, added_date,
		added_date + INTERVAL '6 month' AS new_date
FROM products;


-- 10. TO_DATE() - Convert string to date
-- Convert a string to a date format
SELECT TO_DATE('26-03-2024', 'DD-MM-YYYY') AS converted_date; 

