------------------------------------------------------------------
------------------------------------------------------------------
----The data cleaning is processed at dataset SampleDatabase------
Use [SampleDatabase]
GO
------To handle the missing value or to format the data vlaue ----
------------------------------------------------------------------
/** 
1st step: combine two tables with same data from different years
and save a new table 
**/

 SELECT *
INTO [SampleDatabase].[dbo].[combined_market_analysis]
FROM (
    SELECT *
    FROM [SampleDatabase].[dbo].[market_analysis]
    UNION  
    SELECT *
    FROM [SampleDatabase].[dbo].[market_analysis_2019]
) AS MarketData;

SELECT * FROM [SampleDatabase].[dbo].[combined_market_analysis]
ORDER BY [month];

  -----------------------------------------------------------------
  -----------------------------------------------------------------
 /**
 2nd Step: Handling missing value or set default value for specific 
			columns  without any value
 **/
 --------------------------------------------------------------------------
--------------------------------------------------------------------------
------------------------------Data Cleaning-------------------------------
/**
After combining the tables from market_analysis & market_analysis, 
some errors still exist in columns:
[revenue]:monthly income from apartment rental, 
[occupancy]: the percentage of time a property is rented out or occupied by guests compared to the total available time,
[nightly rate]:the price guests pay to stay at the property for one night,
[lead time]: refers to the amount of time between when a guest books their stay and when they actually check in,
[length stay]: the number of nights a guest stays at a property.

1st: replace the comma by dot in some number values 
2nd: round numbers with two decimal values
3rd: replacing empty values by average value
4th accessing the relationship among revenue, occupany, nightly rate, 
lead time and length stay (revenue = nightly rate * occupancy*(number of days within a month))

The combined table saved as a new table:
[dbo].[airbnb_data_2019_2022]

**/

With AvgValues as (
select 
AVG(CASE WHEN TRY_CAST(REPLACE([lead time], ',','.') AS Float)>0 THEN TRY_CAST(REPLACE([lead time], ',','.') AS Float) end) AS AvgLeadTime,
AVG(CASE WHEN TRY_CAST(REPLACE([length stay], ',','.') AS Float)>0 THEN TRY_CAST(REPLACE([length stay], ',','.') AS Float) end) AS AvgLengthStay
from [dbo].[combined_market_analysis]
)

SELECT
    unified_id,
    [month],
    [zipcode],
    [city],
    [host_type],
    [bedrooms],
    [bathrooms],
    [guests],
   ROUND(COALESCE(TRY_CAST(Replace(revenue, ',','.') AS Float), 0),2) AS revenue,
   ROUND(COALESCE(TRY_CAST(REPLACE(occupancy,',','.') AS Float), 0),3) AS occupancy,
   ROUND(COALESCE(
	TRY_CAST(REPLACE([nightly rate], ',','.') AS Float), 
	(Select AVG(TRY_CAST(REPLACE([nightly rate], ',','.') AS Float))
	From [dbo].[combined_market_analysis]
	where TRY_CAST(REPLACE([nightly rate], ',','.') AS Float) is not null
   )),2)as [nightly rate],
   ROUND(COALESCE(
	NULLIF(TRY_CAST(REPLACE([lead time], ',','.')AS Float), 0),
	(Select AvgLeadTime from AvgValues )
   ),0) as [lead time],
   ROUND(COALESCE(
	NULLIF(TRY_CAST(REPLACE([length stay], ',','.')AS Float),0),
	(select AvgLengthStay from AvgValues)
	),0) as [length stay]
Into [dbo].[market_analysis_2019_2022]
from [dbo].[combined_market_analysis]

----------------------------------------------------------------------------
----------------------------------------------------------------------------
/*
Final step is to combine the tables from amenitites, geolocation and market_ananlysis
then save as a new table:[dbo].[airbnb_data_2019_2022]
There are some errors or empty values still exist in table of amenities, geolocation
the default values replace the empty value with 'Unknow', in addition, replace the comma by dot in number  value
*/
	SELECT m.*, 
       COALESCE(a.[hot_tub], 'unknown') AS [hot_tub],
       COALESCE(a.[pool], 'unknown') AS [pool],
       COALESCE(NULLIF(g.[street_name],''), 'unknown') AS [street_name],
       COALESCE(CAST(TRY_CAST(REPLACE(g.[latitude],',','.') AS FLOAT) AS VARCHAR), 'unknown') as [latitude],
       COALESCE(CAST(TRY_CAST(REPLACE(g.[longitude], ',','.') AS FLOAT) AS VARCHAR), 'unknown') as [longitude]
	   INTO [dbo].[airbnb_data_2019_2022]
FROM [dbo].[market_analysis_2019_2022] m 
LEFT JOIN [dbo].[amenities] a ON m.[unified_id] = a.[unified_id] AND m.[month] = a.[month]
LEFT JOIN [dbo].[geolocation] g ON a.[unified_id] = g.[unified_id] AND a.[month] = g.[month]
ORDER BY m.[month];

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------



