
---How much are the top AirBnB earners making?---
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

---Potential customer list for an AirBnB cleaning business?---
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


