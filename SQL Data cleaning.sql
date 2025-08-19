CREATE TABLE layoffs(
    company VARCHAR(50),
    location VARCHAR(50),
    industry VARCHAR(50),
    total_laid_off INT,
    percentage_laid_off NUMERIC(10,2),
    date DATE,
    stage VARCHAR(50),
    country VARCHAR(50),
    funds_raised_millions INT
);

CREATE TABLE layoffs_staging (
    company TEXT,
    location TEXT,
    industry TEXT,
    total_laid_off TEXT,
    percentage_laid_off TEXT,
    date TEXT,
    stage TEXT,
    country TEXT,
    funds_raised_millions TEXT
);

SELECT * FROM layoffs_staging;

-- 1. Remove Duplicates

-- First let's check for duplicates

SELECT company, industry, total_laid_off, date,
		ROW_NUMBER() OVER (
			PARTITION BY company, industry, total_laid_off, date) AS row_num
FROM layoffs_staging;

-- This query gives DUPLICATES RECORDS
SELECT * FROM ( SELECT company, industry, total_laid_off, date,
		ROW_NUMBER() OVER (
			PARTITION BY company, industry, total_laid_off, date
			) AS row_num
FROM  layoffs_staging ) duplicates
WHERE row_num > 1;

-- let's just look at oda to confirm Duplicates 
SELECT * FROM layoffs_staging
WHERE company = 'Oda'

-- it looks like these are all legitimate entries and shouldn't be deleted. We need to really look at every single row to be accurate

-- these are our real Duplicates 
SELECT *
FROM (
	SELECT company, location, industry, total_laid_off,percentage_laid_off, date, stage, country, funds_raised_millions,
		ROW_NUMBER() OVER (
			PARTITION BY company, location, industry, total_laid_off,percentage_laid_off, date, stage, country, funds_raised_millions
			) AS row_num
FROM layoffs_staging ) duplicates
WHERE row_num > 1;

-- these are the ones we want to delete where the row number is > 1 or 2or greater essentially

-- now you may want to write it like this:
WITH DELETE_CTE AS (
    SELECT ctid
    FROM (
        SELECT ctid,
               ROW_NUMBER() OVER (
                   PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions
               ) AS row_num
        FROM layoffs_staging
    ) duplicates
    WHERE row_num > 1
)
DELETE FROM layoffs_staging
WHERE ctid IN (SELECT ctid FROM DELETE_CTE);


-- one solution, which I think is a good one. Is to create a new column and add those row numbers in. Then delete where row numbers are over 2, then delete that column
-- so let's do it!!

ALTER TABLE layoffs_staging ADD row_num INT;


SELECT * FROM layoffs_staging2;

CREATE TABLE layoffs_staging2 (company text, location text, industry text, total_laid_off text,
									percentage_laid_off text, date text, stage text, country text,
									funds_raised_millions text, row_num INT
);

INSERT INTO layoffs_staging2(company, location, industry, total_laid_off, percentage_laid_off, date,
								stage, country, funds_raised_millions, row_num)
SELECT company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions,
		ROW_NUMBER() OVER (
			PARTITION BY company, location, industry, total_laid_off,percentage_laid_off, date, stage, country, funds_raised_millions
			) AS row_num
FROM layoffs_staging;

-- now that we have this we can delete rows were row_num is greater than 2
DELETE FROM layoffs_staging2
WHERE row_num >= 2;



-- 2. Standardize Data

SELECT * FROM layoffs_staging2;

-- if we look at industry it looks like we have some null and empty rows, let's take a look at these
SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY industry;

SELECT * FROM layoffs_staging2
WHERE industry IS NULL OR industry = ''
ORDER BY industry;

-- let's take a look at these
SELECT * FROM layoffs_staging2
WHERE company LIKE 'Bally%';

-- nothing wrong here
SELECT * FROM layoffs_staging2
WHERE company LIKE 'airbnb%';

-- we should set the blanks to nulls since those are typically easier to work with
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

-- now if we check those are all null
SELECT * FROM layoffs_staging2
WHERE industry IS NULL OR industry = ''
ORDER BY industry;

-- now we need to populate those nulls if possible
UPDATE layoffs_staging2 t1
SET industry = t2.industry
FROM layoffs_staging2 t2
WHERE t1.company = t2.company
  AND t1.industry IS NULL
  AND t2.industry IS NOT NULL;

-- and if we check it looks like Bally's was the only one without a populated row to populate this null values
SELECT * FROM layoffs_staging2
WHERE industry IS NULL 
OR industry = ''
ORDER BY industry;

-- ---------------------------------------------------

-- I also noticed the Crypto has multiple different variations. We need to standardize that - let's say all to Crypto
SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY industry;

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry IN ('Crypto Currency', 'CryptoCurrency');

-- now that's taken care of:
SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY industry;

-- --------------------------------------------------
-- we also need to look at 
SELECT * FROM layoffs_staging2;

-- everything looks good except apparently we have some "United States" and some "United States." with a period at the end. Let's standardize this.
SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY country;

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country);

-- now if we run this again it is fixed
SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY country;

-- Let's also fix the date columns:
SELECT * FROM layoffs_staging2;

UPDATE layoffs_staging2
SET date = NULL
WHERE date !~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$';

-- we can use str to date to update this field
ALTER TABLE layoffs_staging2
ALTER COLUMN date TYPE DATE
USING TO_DATE(date, 'MM/DD/YYYY');


-- 3. Look at Null Values

-- the null values in total_laid_off, percentage_laid_off, and funds_raised_millions all look normal. I don't think I want to change that
-- I like having them null because it makes it easier for calculations during the EDA phase

-- so there isn't anything I want to change with the null values



-- 4. remove any columns and rows we need to
SELECT * FROM layoffs_staging2
WHERE total_laid_off = 'NULL';

SELECT * FROM layoffs_staging2
WHERE total_laid_off = 'NULL' AND percentage_laid_off = 'NULL';

-- Delete Useless data we can't really use
DELETE FROM layoffs_staging2
WHERE total_laid_off = 'NULL'
AND percentage_laid_off = 'NULL';

SELECT * FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

SELECT * FROM layoffs_staging2;

UPDATE layoffs_staging2
SET percentage_laid_off = NULL
WHERE percentage_laid_off = 'NULL';


ALTER TABLE layoffs_staging2
ALTER COLUMN percentage_laid_off TYPE NUMERIC(10,2)
USING percentage_laid_off::NUMERIC(10,2);