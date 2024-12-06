# Retail and Food Services Analysis: 2017–2023 MRTS
## Project Background
The Monthly Retail Trade Survey (MRTS) provides insights into the economic activity of the retail and food services industries. Using a stratified random sample of approximately 4,800 firms, it estimates monthly sales for over three million businesses nationwide. These estimates are weighted and benchmarked to reflect the full scope of the industries.

This project analyzes MRTS data from 2017 to 2023, focusing on sales trends, industry performance, and the impact of major economic events, such as the COVID-19 pandemic. The findings aim to inform decision-making for businesses, policymakers, and researchers.
<details>
<summary>More about the data used</summary>

The data was retrieved from the Census Bureau's Monthly Retail Trade Survey (MRTS) API. 

- **API Call Construction**: A Python script was used to query the API with parameters specifying the data type, time range (2017–2023). Both seasonally adjusted and unadjusted metrics are retrieved.
- **Data Handling**: The API response was parsed and transformed into a structured format (CSV) for further analysis.

The Python script used for this process is available [here](scripts/fetch_data.py).
</details>

**Work Flow**:

**Part 1: Exploration and Cleaning**

The raw data was explored and cleaned using Python to ensure accuracy and relevance for further analysis.

**Part 2: Insights**

SQL queries were employed to extract actionable insights tailored for relevant business stakeholders.

**Part 3: Visualizations**

Python charts and Tableau were used to create explorative visualizations and an interactive dashboard, designed primarily to easily monitor key metrics.

**Part 4: Recommendations & Next Steps**

Based on the findings, recommendations are proposed for future strategies and further exploration.

---

Here is the Entity Relationship Diagram:

![Entity Relationship Diagram](images/retail_food_diagram.png)


## Insights

### Sale Trends and Growth Rates
- Total Retail Trade and Food Services averages () in annual sales with () dollars of sale per year.
- The top categories are ()
- Sales show seaonality as ()
- Seasonality is vary across years as ()

### COVID Trends and Recovery
- Total Retail Trade and Foood Services declined ()
- Retail Trade declined()
- Food Services declined()
- () , (), and () categories seem to have trouble recovering from pre covid
- (), (), and () categories shows an increase in sales after the emersion of COVID

### Market Risks
- (), (), and () categories are most volatile
- External shocks (e.g., economic downturns) affect (), (),  and () categories in () ways. () categories are more sensitive.

## Recommendations & Next Steps

### Corporate Executives
 - some advice
### Sales and Marketing Teams
- some advice
### Supply Chain and Operations Teams
- some advice 


