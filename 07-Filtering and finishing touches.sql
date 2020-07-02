-- Pull summer bronze_medals, silver_medals, and gold_medals
SELECT 
	COUNT (bronze) AS bronze_medals, 
    COUNT (silver) AS silver_medals, 
    COUNT (gold) AS gold_medals
FROM summer_games AS s
JOIN athletes AS a
ON a.id = s.athlete_id
-- Filter for athletes age 16 or below
WHERE age <= '16';


-- Pull summer bronze_medals, silver_medals, and gold_medals
SELECT 
	COUNT (bronze) AS bronze_medals, 
    COUNT (silver) AS silver_medals, 
    COUNT (gold) AS gold_medals
FROM summer_games AS s
-- Add the WHERE statement below
WHERE athlete_id IN
    -- Create subquery list for athlete_ids age 16 or below    
    (SELECT id
     FROM athletes
     WHERE age <= 16);


-- Pull event and unique athletes from summer_games 
SELECT 	
	event,
	COUNT (DISTINCT athlete_id) AS athletes
FROM summer_games
GROUP BY event;


-- Pull event and unique athletes from summer_games 
SELECT 
    event,
    -- Add the gender field below
    CASE WHEN event LIKE '%Women%' THEN 'female' 
   	ELSE 'male' END AS gender,
    COUNT(DISTINCT athlete_id) AS athletes
FROM summer_games
GROUP BY event;


-- Pull event and unique athletes from summer_games 
SELECT 
    event,
    -- Add the gender field below
    CASE WHEN event LIKE '%Women%' THEN 'female' 
    ELSE 'male' END AS gender,
    COUNT(DISTINCT athlete_id) AS athletes
FROM summer_games
-- Only include countries that won a nobel prize
WHERE country_id IN 
	(SELECT country_id
    FROM country_stats
    WHERE nobel_prize_winners <> 0)
GROUP BY event;


-- Pull event and unique athletes from summer_games 
SELECT 
    event,
    -- Add the gender field below
    CASE WHEN event LIKE '%Women%' THEN 'female' 
    ELSE 'male' END AS gender,
    COUNT(DISTINCT athlete_id) AS athletes
FROM summer_games
-- Only include countries that won a nobel prize
WHERE country_id IN 
	(SELECT country_id 
    FROM country_stats 
    WHERE nobel_prize_winners > 0)
GROUP BY event
-- Add the second query below and combine with a UNION
UNION
SELECT 
    event,
    CASE WHEN event LIKE '%Women%' THEN 'female' 
    ELSE 'male' END AS gender,
    COUNT(DISTINCT athlete_id) AS athletes
FROM winter_games
WHERE country_id IN 
	(SELECT country_id 
    FROM country_stats 
    WHERE nobel_prize_winners > 0)
GROUP BY event
-- Order and limit the final output
ORDER BY athletes DESC
LIMIT 10;
