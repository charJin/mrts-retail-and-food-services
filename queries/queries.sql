-- What are the average and total monthly sales for each categories in 2017-2023?

SELECT 
    EXTRACT(YEAR FROM time) AS year,
	category_name,
	high_level_category,
    AVG(monthly_sales) AS avg_monthly_sales,
    SUM(monthly_sales) AS total_monthly_sales
FROM sales_seasonally_adjusted
GROUP BY EXTRACT(YEAR FROM time), category_name, high_level_category
ORDER BY year, total_monthly_sales DESC;


-- Which categories had the strongest decline when COVID-19 happened?

SELECT 
    category_name,
    SUM(CASE WHEN EXTRACT(YEAR FROM time) = 2019 THEN monthly_sales ELSE 0 END) AS sales_2019,
    SUM(CASE WHEN EXTRACT(YEAR FROM time) = 2020 THEN monthly_sales ELSE 0 END) AS sales_2020,
    SUM(CASE WHEN EXTRACT(YEAR FROM time) = 2020 THEN monthly_sales ELSE 0 END) - 
    SUM(CASE WHEN EXTRACT(YEAR FROM time) = 2019 THEN monthly_sales ELSE 0 END) AS sales_decline,
	high_level_category
FROM sales_seasonally_adjusted
GROUP BY category_name, high_level_category
ORDER BY sales_decline ASC

-- What are the recovery trends like for each categories post COVID?
-- - What are the sales difference pre-covid and 2023?

SELECT 
    category_name,
    AVG(CASE WHEN EXTRACT(YEAR FROM time) BETWEEN 2018 AND 2019 THEN monthly_sales ELSE NULL END) AS pre_covid_avg_sales,
    AVG(CASE WHEN EXTRACT(YEAR FROM time) = 2023 THEN monthly_sales ELSE NULL END) AS sales_2023,
    AVG(CASE WHEN EXTRACT(YEAR FROM time) = 2023 THEN monthly_sales ELSE NULL END) - 
    AVG(CASE WHEN EXTRACT(YEAR FROM time) BETWEEN 2018 AND 2019 THEN monthly_sales ELSE NULL END) AS recovery_to_pre_covid
FROM sales_seasonally_adjusted
GROUP BY category_name
ORDER BY recovery_to_pre_covid DESC;

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
    FROM sales_seasonally_adjusted
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
ORDER BY yoy_growth_2023;