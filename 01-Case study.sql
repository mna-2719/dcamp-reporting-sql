-- Query the sport and distinct number of athletes
SELECT 
	sport, 
    COUNT (DISTINCT athlete_id) AS athletes
FROM summer_games
GROUP BY sport
-- Only include the 3 sports with the most athletes
ORDER BY athletes ASC
LIMIT 3;


-- Query sport, events, and athletes from summer_games
SELECT 
	sport, 
    COUNT (DISTINCT event) AS events, 
    COUNT (DISTINCT athlete_id) AS athletes
FROM summer_games
GROUP BY sport;
