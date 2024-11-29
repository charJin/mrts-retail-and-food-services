# Retail and Food Services Analysis: 2017–2023 MRTS Data 

## Project Background

The Monthly Retail Trade Survey (MRTS), conducted by the U.S. Census Bureau, estimates monthly sales for retail and food services using a sample of 4,800 firms. This sample then is weighted to represent over three million businesses nationwide. Data is seasonally adjusted and benchmarked against annual surveys for consistency.

This project analyzes MRTS data from 2017 to 2023, focusing on sales trends, industry performance, and the impact of major economic events, such as the COVID-19 pandemic. The findings aim to inform decision-making for businesses, policymakers, and researchers.
<details>
<summary>More about the data used</summary>

The data was retrieved from the Census Bureau's Monthly Retail Trade Survey (MRTS) API. 

- **API Call Construction**: A Python script was used to query the API with parameters specifying the data type, time range (2017–2023). Both seasonally adjusted and unadjusted metrics are retrieved.
- **Data Handling**: The API response was parsed and transformed into a structured format (CSV) for further analysis.

The Python script used for this process is available [here](scripts/fetch_data.py).
</details>
