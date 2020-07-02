-- Select the age of the oldest athlete for each region
SELECT 
	region, 
    MAX (age) AS age_of_oldest_athlete
FROM athletes AS a
-- First JOIN statement
JOIN summer_games AS s
ON a.id = s.athlete_id
-- Second JOIN statement
JOIN countries AS c
ON s.country_id = c.id
GROUP BY region;


-- Select sport and events for summer sports
SELECT 
	sport, 
    COUNT(DISTINCT event) AS events
FROM summer_games
GROUP BY sport
UNION
-- Select sport and events for winter sports
SELECT 
	sport, 
    COUNT (DISTINCT event)
FROM winter_games
GROUP BY sport
-- Show the most events at the top of the report
ORDER BY events ASC;



