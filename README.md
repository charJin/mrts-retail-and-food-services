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
- Total Retail Trade and Food Services averages $478,073.25 in monthly sales with $6,828,246 of sale per year.
- The top categories are **"Motor Vehicle and Parts Dealers"**, **"Auto and Other Motor Vehicles"**, **"Food and Beverage Stores"**, **"Food Services and Drinking Places"**, **"General Merchandise Stores"**, and **"Grocery Stores"**.
- Sales show seaonality as ()
- Seasonality is vary across years as ()

### COVID Trends and Recovery
- In 2018 and 2019, there was YoY growth of **+4.33% and +3.11%** in Total Retail Trade and Food Services, with annual sales of **$5,985,551 in 2018** and **$6,171,969 in 2019**. However, with the onset of COVID-19, YoY growth in 2020 declined to only **+0.76%**.
- Retail Trade experienced YoY growth of **+4.17% in 2018**, **+2.77% in 2019**, and **+3.03% in 2020**.
- Food Services showed YoY growth of **+5.53% in 2018** and **+5.62% in 2019**, but dropped sharply to **-15.08% in 2020**. Compared to the retail categories in the MARTS dataset, food services experienced a significantly larger decline in the COVID-19 year of 2020. This can be attributed to government restrictions, reduced social interactions, and changing consumer behavior.  
  - Interestingly, the category rebounded significantly in 2021 (**+28.5%**) and continued growing in subsequent years (**+16.1% in 2022**, **+11.9% in 2023**).  
  - This recovery likely reflects:
    - Consumers seeking more social interactions and leisure activities post-pandemic.
    - A shift toward "revenge spending" after prolonged restrictions.
    - The resumption of major events and gatherings.

- **Categories Most Negatively Impacted During COVID**:  
  Several categories experienced significant declines in 2020, including:
  - **Clothing and Accessories Stores**: Sales dropped **-24.5% in 2020**, likely due to reduced demand for apparel as social activities were restricted and work-from-home trends increased.
  - **Electronics and Appliance Stores**: Sales fell by **-18.4% in 2020**. While demand for small electronics (e.g., laptops) may have surged during the pandemic, the overall category struggled due to supply chain disruptions and reduced demand for big-ticket appliances.
  - **Department Stores**: Sales decreased by **-16.0% in 2020**, reflecting the challenges faced by traditional brick-and-mortar stores as consumers shifted to e-commerce.
  - **Gasoline Stations**: Sales dropped by **-16.2% in 2020** due to reduced travel and commuting during lockdowns.

- **Categories with Increased Sales During COVID**:  
  While many categories struggled during COVID, some saw positive growth:
  - **Grocery Stores**: Sales grew by **+9.1% in 2020**, driven by increased at-home cooking during lockdowns. This growth exceeded pre-COVID YoY growth rates of **+2.78% in 2018** and **+3.35% in 2019**, indicating a potential long-term shift toward at-home cooking.
  - **Nonstore Retailers**: Sales increased significantly by **+30.3% in 2020**, driven by the rapid adoption of e-commerce as consumers avoided in-person shopping. The category has continued to grow strongly post-pandemic, suggesting a permanent shift in consumer behavior.
  - **Food and Beverage Stores**: Similar to Grocery Stores, this category saw sales grow by **+9.3% in 2020** due to higher consumer spending on groceries. Growth continued in subsequent years.
  - **Building Material and Garden Equipment and Supplies Dealers**: Sales increased by **+12.3% in 2020**, driven by increased interest in home improvement and gardening projects during lockdowns. Growth continued into 2021 (**+14.7%**) but stabilized and slightly declined in 2023 (**-3.1%**).

- **Categories Struggling to Recover Post-COVID**:  
  While some categories have rebounded, others continue to face challenges:
  - **Department Stores**: This category was already under pressure before COVID, with sales declining from **$146,693 in 2017** to **$134,893 in 2019** (**-8% over two years**). Sales dropped by **-16% in 2020**, followed by a modest recovery (**+17.6% in 2021**), but plateaued in 2022 (**+2.3%**) and declined in 2023 (**-2.3%**).  
    - Likely reasons include increasing competition from e-commerce and specialty retailers, as well as changing consumer shopping habits.
  - **Electronics and Appliance Stores**: Sales had already declined slightly pre-COVID, from **$92,546 in 2017** to **$90,962 in 2019** (**-1.7%**), reflecting competition from online marketplaces like Amazon and Best Buy. The category experienced a sharp decline of **-18.4% in 2020**, followed by limited recovery (**+27.3% in 2021**) and slight declines in both 2022 (**-1.2%**) and 2023 (**-1.2%**).  
    - Supply chain disruptions, inflation, and shifting consumer priorities have likely contributed to this slow recovery.


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


