-- Update the query to explore the bronze field
SELECT bronze
FROM summer_games;


-- Update query to explore the unique bronze field values
SELECT DISTINCT bronze
FROM summer_games;


-- Recreate the query by using GROUP BY 
SELECT bronze
FROM summer_games
GROUP BY bronze;


-- Add the rows column to your query
SELECT 
	bronze, 
	COUNT (*) AS rows
FROM summer_games
GROUP BY bronze;


-- Pull total_bronze_medals from summer_games below
SELECT SUM (bronze) AS total_bronze_medals
FROM summer_games;


/* Pull total_bronze_medals from summer_games below
SELECT SUM(bronze) AS total_bronze_medals
FROM summer_games; 
>> OUTPUT = 141 total_bronze_medals */

-- Setup a query that shows bronze_medal by country
SELECT 
	country, 
    SUM (bronze) AS bronze_medals
FROM summer_games AS s
JOIN countries AS c
ON s.country_id = c.id
GROUP BY country;


/* Pull total_bronze_medals below
SELECT SUM(bronze) AS total_bronze_medals
FROM summer_games; 
>> OUTPUT = 141 total_bronze_medals */

-- Select the total bronze_medals from your query
SELECT SUM (bronze_medals)
FROM 
-- Previous query is shown below.  Alias this AS subquery
  (SELECT 
      country, 
      SUM(bronze) AS bronze_medals
  FROM summer_games AS s
  JOIN countries AS c
  ON s.country_id = c.id
  GROUP BY country) AS subquery
;


-- Pull athlete_name and gold_medals for summer games
SELECT 
	a.name AS athlete_name, 
    SUM (gold) AS gold_medals
FROM summer_games AS s
JOIN athletes AS a
ON s.athlete_id = a.id
GROUP BY a.name
-- Filter for only athletes with 3 gold medals or more
HAVING SUM (gold) >= 3
-- Sort to show the most gold medals at the top
ORDER BY gold_medals;



