# Airbnb Rental Market Report (year 2019 to 2022)

### Executive Summary:
This report provides an in-depth analysis of the Airbnb rental market, examining key factors such as revenue, nightly rates, occupancy rates, length of stay, amenities, and locations to identify trends, 
relationships and patterns. The objective of this report is to offer valuable insights into the Airbnb rental market for prospective landlords and potential tenants, facilitating informed decision-making. 
Furthermore, it aims to present a comprehensive overview of Airbnb's development over the past four years, equipping stakeholders with a thorough understanding of the market's evolution.

![Rport Overview](https://github.com/WeiWanger/Airbnd_Rental_Report-Excel-SQL-Power-BI-/assets/94071380/e6f2b0cd-ddea-48d1-90cb-3efe503757bf)

### Data Sources:
The dataset for this analysis was obtained from Kaggle, available for Download ([Click here](https://www.kaggle.com/datasets/computingvictor/zillow-market-analysis-and-real-estate-sales-data)). It comprises multiple CSV files, such as amenities, geolocation, market_analysis, market_analysis_2019, and sales_properties_total, among others. Given that the original dataset encompasses several tables, each potentially containing missing or erroneous entries, a thorough data cleaning process was imperative to prepare a structured dataset suitable for subsequent analysis.

### Tools:
- Excel: Data Evaluation
- SQL Server: Data Cleaning, Data Strcuture
- Python : Handle missing value
- Power BI: Data Visulization, Create Report

### Data Cleaning
 At initial phase, the following tasks performed:
 - Data Loading & Validate data quality
 - Combine different tables to create a final dataset
 - Formatting data type
 - Handling missing data and erros

### Explore Data Anlysis
EDA (Explore Data Analysis) is aim to provide answer for questions:
How has the quantity of properties evolved in recent years? Could you detail these variations under specific circumstances?
How did revenue fluctuate from 2019 to 2022, and which elements significantly influenced these changes?
What trends and shifts have occurred in the nightly rate, influenced by various factors?
What comprehensive insights can be derived from analyzing revenue in relation to occupied rooms?
Has the length of stay affected revenue or other metrics, and if so, how have these changes in stay duration correlated with other factors?
Which city has demonstrated the highest popularity, and how have pricing strategies varied across different cities?

### Data Analysis:
By analyzing the changes,distribution and comparison based on various conditions in quantity of properties, revenue, nightly rate, **ADR**(Average Daily Revenue) RePAR(Revenue per avaliable room), cities and length stay, thereby obtaining insights from market

### Result:
- Since 2019, revenue and nightly rates have trended upward, with a noticeable increase from 2020 to 2021, despite a slight downturn in 2022. Revenue and nightly rate patterns indicate peaks at the year's start and end, dipping during mid-year, indicative of seasonal consumer behavior shifts—preferring travel in summer and staying home in winter, underscoring seasonality's role in revenue dynamics.
- Remarkably, small and medium-sized professional properties have excelled in revenue generation, amassing $244M and $149M, respectively, eclipsing other segments. Moreover, properties devoid of amenities like hot tubs or pools surprisingly garnered $519M in revenue, substantially outperforming those with such amenities. This trend points to a clientele, primarily single occupants or couples without children, valuing cost over amenities and size.
- Analysis of lead times reveals that durations under 200 days typically yield an average revenue of $10K. Conversely, lead times beyond 200 days introduce volatility in revenue outcomes, either increasing or decreasing unpredictably, suggesting prolonged lead times may destabilize revenue.
- The relationship between nightly rates and lead time reflects similar patterns observed in revenue, with shorter lead times boosting nightly rates, whereas extended lead times lead to fluctuating rates, either surpassing or dipping below expectations.
- A significant disparity between ADR and RevPAR indicates high rates per booked night do not guarantee full room bookings nightly. Enhancing occupancy rates stands to considerably influence total revenue.
- The preference for longer stays suggests tourists booking in advance opt for extended durations, contrary to the shorter stays associated with last-minute bookings, typically for business or brief work 
  engagements. Stays within the 170 to 180-day range prove most profitable, yielding the highest average revenue.
- Joshua Tree and Yucca Valley demonstrate superior revenue per occupied room, implying these locales effectively utilize their allure to command premium rates. Big Bear Lake, favored for its longer-stay appeal, showcases its desirability despite its premium nightly rates. Meanwhile, Big Bear City, known for the lowest rates among the compared locations, alongside Big Bear Lake's high rates and popularity for extended stays, illustrate the diverse pricing strategies employed across different locales

**ADR**: a measure of the average rental income earned for an occupied room per day

**RePAR**:  a performance metric that measures the revenue generated per available room, whether occupied or not, over a specific period.

### Reference:
Kaggle.com
