-- What are the average and total monthly sales for each categories in 2017-2023?

SELECT 
    EXTRACT(YEAR FROM time) AS year,
	category_name,
	high_level_category,
    AVG(monthly_sales) AS avg_monthly_sales,
    SUM(monthly_sales) AS total_monthly_sales
FROM sales_unadjusted
GROUP BY EXTRACT(YEAR FROM time), category_name, high_level_category
ORDER BY category_name, total_monthly_sales DESC;


-- What is the average yearly sales and monthly sales of the total Retail Trade and Food Services?

SELECT 
    SUM(monthly_sales) / COUNT(DISTINCT EXTRACT(YEAR FROM time)) AS avg_yearly_sales
FROM 
    sales_unadjusted
WHERE 
    category_name = 'Retail Trade and Food Services';


SELECT 
    AVG(monthly_sales) AS avg_monthly_sales
FROM 
    sales_unadjusted
WHERE 
    category_name = 'Retail Trade and Food Services';


-- What is the percentage contribution of each category to the Retail Trade and Food Services each year?
WITH TotalRetailTrade AS (
    SELECT 
        EXTRACT(YEAR FROM time) AS year,
        SUM(monthly_sales) AS total_sales
    FROM 
        sales_unadjusted
    WHERE 
        category_name = 'Retail Trade and Food Services'
    GROUP BY 
        EXTRACT(YEAR FROM time)
)
SELECT 
    EXTRACT(YEAR FROM su.time) AS year,
    su.category_name,
    su.high_level_category,
    su.is_subset,
    SUM(su.monthly_sales) AS category_sales,
    (SUM(su.monthly_sales) / tr.total_sales) * 100 AS percentage_contribution
FROM 
    sales_unadjusted su
JOIN 
    TotalRetailTrade tr
ON 
    EXTRACT(YEAR FROM su.time) = tr.year
WHERE 
    su.is_subset = FALSE
GROUP BY 
    EXTRACT(YEAR FROM su.time), su.category_name, su.high_level_category, su.is_subset, tr.total_sales
ORDER BY 
    year, percentage_contribution DESC;



-- Which categories had the strongest decline when COVID-19 happened?

SELECT 
    category_name,
    SUM(CASE WHEN EXTRACT(YEAR FROM time) = 2019 THEN monthly_sales ELSE 0 END) AS sales_2019,
    SUM(CASE WHEN EXTRACT(YEAR FROM time) = 2020 THEN monthly_sales ELSE 0 END) AS sales_2020,
    SUM(CASE WHEN EXTRACT(YEAR FROM time) = 2020 THEN monthly_sales ELSE 0 END) - 
    SUM(CASE WHEN EXTRACT(YEAR FROM time) = 2019 THEN monthly_sales ELSE 0 END) AS sales_decline,
	high_level_category
FROM sales_unadjusted
WHERE is_subset = FALSE
GROUP BY category_name, high_level_category
ORDER BY sales_decline ASC

-- What are the recovery trends like for each categories post COVID?
-- - What are the sales difference pre-covid and 2023?

SELECT 
    category_name,
    AVG(CASE WHEN EXTRACT(YEAR FROM time) BETWEEN 2018 AND 2019 THEN monthly_sales ELSE NULL END) AS pre_covid_avg_sales,
    AVG(CASE WHEN EXTRACT(YEAR FROM time) = 2023 THEN monthly_sales ELSE NULL END) AS sales_2023,
    AVG(CASE WHEN EXTRACT(YEAR FROM time) = 2023 THEN monthly_sales ELSE NULL END) - 
    AVG(CASE WHEN EXTRACT(YEAR FROM time) BETWEEN 2018 AND 2019 THEN monthly_sales ELSE NULL END) AS post_covid_recovery_compared_to_pre_covid
FROM sales_unadjusted
WHERE is_subset = FALSE
GROUP BY category_name
ORDER BY post_covid_recovery_compared_to_pre_covid DESC;

-- What are the recovery trends like for each categories post COVID?
-- - How does YoY growth compare between the precovid and post years?

WITH sales_summary AS (
    SELECT 
        category_name,
		SUM(CASE WHEN EXTRACT(YEAR FROM time) = 2017 THEN monthly_sales ELSE 0 END) AS sales_2017,
        SUM(CASE WHEN EXTRACT(YEAR FROM time) = 2018 THEN monthly_sales ELSE 0 END) AS sales_2018,
        SUM(CASE WHEN EXTRACT(YEAR FROM time) = 2019 THEN monthly_sales ELSE 0 END) AS sales_2019,
        SUM(CASE WHEN EXTRACT(YEAR FROM time) = 2020 THEN monthly_sales ELSE 0 END) AS sales_2020,
        SUM(CASE WHEN EXTRACT(YEAR FROM time) = 2021 THEN monthly_sales ELSE 0 END) AS sales_2021,
        SUM(CASE WHEN EXTRACT(YEAR FROM time) = 2022 THEN monthly_sales ELSE 0 END) AS sales_2022,
        SUM(CASE WHEN EXTRACT(YEAR FROM time) = 2023 THEN monthly_sales ELSE 0 END) AS sales_2023
    FROM sales_unadjusted
	WHERE is_subset = FALSE
    GROUP BY category_name
)
SELECT 
    category_name,
	sales_2017,
    sales_2018,
    sales_2019,
    sales_2020,
    sales_2021,
    sales_2022,
    sales_2023,
	CAST(sales_2018 - sales_2017 AS FLOAT) / NULLIF(CAST(sales_2017 AS FLOAT), 0) * 100 AS yoy_growth_2018,
    CAST(sales_2019 - sales_2018 AS FLOAT) / NULLIF(CAST(sales_2018 AS FLOAT), 0) * 100 AS yoy_growth_2019,
    CAST(sales_2020 - sales_2019 AS FLOAT) / NULLIF(CAST(sales_2019 AS FLOAT), 0) * 100 AS yoy_growth_2020,
    CAST(sales_2021 - sales_2020 AS FLOAT) / NULLIF(CAST(sales_2020 AS FLOAT), 0) * 100 AS yoy_growth_2021,
    CAST(sales_2022 - sales_2021 AS FLOAT) / NULLIF(CAST(sales_2021 AS FLOAT), 0) * 100 AS yoy_growth_2022,
    CAST(sales_2023 - sales_2022 AS FLOAT) / NULLIF(CAST(sales_2022 AS FLOAT), 0) * 100 AS yoy_growth_2023
FROM sales_summary
ORDER BY yoy_growth_2020;

-- Which Categories are the most volatile? 

SELECT 
    category_name,
    high_level_category,
    is_subset,
    AVG(cv) AS avg_cv
FROM 
    sales_seasonally_adjusted
GROUP BY 
    category_name, high_level_category, is_subset
ORDER BY 
    avg_cv DESC;

-- What is the average percent differnce between seasonally adjusted monthly sales and inflation adjusted sales across all categories?

SELECT 
    AVG((monthly_sales - inflation_adjusted_sales) / monthly_sales * 100) AS avg_percentage_difference
FROM 
    cpi_seasonally_adjusted_combined
WHERE 
    monthly_sales IS NOT NULL 
    AND inflation_adjusted_sales IS NOT NULL;

-- Which Categories have the biggest difference between seasonally adjusted sales and inflation adjusted sales?

SELECT 
    category_name,
    AVG(monthly_sales) AS avg_seasonally_adjusted_sales,
    AVG(inflation_adjusted_sales) AS avg_inflation_adjusted_sales,
    ((AVG(inflation_adjusted_sales) - AVG(monthly_sales)) / AVG(monthly_sales)) * 100 AS percent_difference
FROM 
    cpi_seasonally_adjusted_combined
WHERE 
    is_subset = FALSE
GROUP BY 
    category_name, high_level_category, is_subset
ORDER BY 
    percent_difference ASC;