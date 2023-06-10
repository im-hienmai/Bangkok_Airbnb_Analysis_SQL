# Bangkok Airbnb Analysis Using SQL

The analysis shows how Airbnb is utilized in Bangkok. I have analyzed Boston Airbnb listings 28 March, 2023. The dataset used in the analysis reports the listing activities of homestays in Bangkok. 
Data from http://insideairbnb.com/get-the-data/

## File Descriptions
Boston Airbnb data includes 3 files: can be downloaded be clicking the file name
   - listings.csv Detailed Listings data for Boston. Date Compiled: 28 March, 2023
   - calendar.csv Detailed Calendar Data for listings in Boston. Date Compiled: 28 March, 2023
   - reviews.csv Detailed Review Data for listings in Boston. Date Compiled: 28 March, 2023
## Analysis and Insights

#### 1. How much are the top AirBnB earners making?
<table>
<tr>
<td>
Monthly Revenue = Nigthly Price * Nigths Booked/Month
</td>
</tr>
</table>

#### 2. Potential customer list for an AirBnB cleaning business?

## AirBnb Analysis with SQL
### 1. How much are the top AirBnB earners making?
    SELECT TOP 20
      [id],
      [listing_url],
      [name],
      30 - [availability_30] AS booked_out_30,
      CAST(REPLACE([price], '$', '') AS DECIMAL(10, 2)) AS price_clean,
      CAST(REPLACE([price], '$', '') AS DECIMAL(10, 2)) * (30 - [availability_30]) / [beds] AS proj_rev_30
    FROM
      [PortfolioProject].[dbo].[listings]
    ORDER BY
      proj_rev_30 DESC;
      
 - Table 
 <img width="678" alt="Cau 1" src="https://github.com/im-hienmai/Bangkok_Airbnb_Analysis_SQL/assets/131462914/cd81e0c3-f3c4-48f6-a16c-08249ff8700f">

### 2. Potential customer list for an AirBnB cleaning business?
    SELECT 
      [host_id],
      [host_url],
      [host_name],
      COUNT(*) AS [num_dirty_reviews]
    FROM 
      [PortfolioProject].[dbo].[reviews]
    INNER JOIN 
      [PortfolioProject].[dbo].[listings] ON [reviews].[listing_id] = [listings].[id]
    WHERE 
      [comments] LIKE '%dirty%'
    GROUP BY 
      [host_id],
      [host_url],
      [host_name]
    ORDER BY 
      [num_dirty_reviews] DESC;
      
  - Table 
  <img width="437" alt="cau 2" src="https://github.com/im-hienmai/Bangkok_Airbnb_Analysis_SQL/assets/131462914/ae1f817b-eb77-44d0-a4b1-df058a08b086">
  
 ## Conlusion
 Through a quick analysis using SQL, the two initial questions have been answered.
