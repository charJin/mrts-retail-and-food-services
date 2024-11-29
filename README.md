# Retail and Food Services Analysis: 2017–2023 MRTS Data 

## Project Background

The Census Bureau's Monthly Retail Trade Survey (MRTS) provides key insights into the retail and food services industries, critical drivers of U.S. consumer spending and economic health. This project analyzes MRTS data from 2017 to 2023, focusing on monthly sales trends, seasonally adjusted metrics, and category-specific performance.

The analysis aims to identify sector trends, assess the relationship between retail and food services, and evaluate the impact of events like the COVID-19 pandemic. By leveraging government data, this project highlights actionable insights for businesses, policymakers, and researchers to better understand the evolving dynamics of these industries.

<details>
<summary>More about the data used</summary>

The data was retrieved from the Census Bureau's Monthly Retail Trade Survey (MRTS) API. 

- **API Call Construction**: A Python script was used to query the API with parameters specifying the data type, time range (2017–2023). Both seasonally adjusted and unadjusted metrics are retrieved.
- **Data Handling**: The API response was parsed and transformed into a structured format (CSV) for further analysis.

The Python script used for this process is available [here](scripts/fetch_data.py).
</details>
