SELECT 
	name,
    -- Output 'Tall Female', 'Tall Male', or 'Other'
	CASE WHEN height >= 175 AND gender = 'F' THEN 'Tall Female'
    WHEN height >= 190 AND gender = 'M' THEN 'Tall Male'
    ELSE 'Other'
    END AS segment
FROM athletes;


-- Pull in sport, bmi_bucket, and athletes
SELECT 
	sport,
    -- Bucket BMI in three groups: <.25, .25-.30, and >.30	
    CASE WHEN 100*weight/height^2 <.25 THEN '<.25'
    WHEN 100*weight/height^2 <=.30 THEN '.25-.30'
    WHEN 100*weight/height^2 >.30 THEN '>.30' END AS bmi_bucket,
    COUNT(DISTINCT athlete_id) AS athletes
FROM summer_games AS s
JOIN athletes AS a
ON s.athlete_id = a.id
-- GROUP BY non-aggregated fields
GROUP BY sport, bmi_bucket
-- Sort by sport and then by athletes in descending order
ORDER BY sport, athletes DESC;


-- Query from last exercise shown below.  Comment it out.
/*SELECT 
	sport,
    CASE WHEN weight/height^2*100 <.25 THEN '<.25'
    WHEN weight/height^2*100 <=.30 THEN '.25-.30'
    WHEN weight/height^2*100 >.30 THEN '>.30' END AS bmi_bucket,
    COUNT(DISTINCT athlete_id) AS athletes
FROM summer_games AS s
JOIN athletes AS a
ON s.athlete_id = a.id
GROUP BY sport, bmi_bucket
ORDER BY sport, athletes DESC;*/

-- Show height, weight, and bmi for all athletes
SELECT 
	height, 
    weight, 
    weight/height^2*100 AS bmi
FROM athletes
-- Filter for NULL bmi values
WHERE weight/height^2*100 IS NULL;


-- Uncomment the original query
SELECT 
	sport,
    CASE WHEN weight/height^2*100 <.25 THEN '<.25'
    WHEN weight/height^2*100 <=.30 THEN '.25-.30'
    WHEN weight/height^2*100 >.30 THEN '>.30'
    -- Add ELSE statement to output 'no weight recorded'
    ELSE 'no weight recorded' END AS bmi_bucket,
    COUNT(DISTINCT athlete_id) AS athletes
FROM summer_games AS s
JOIN athletes AS a
ON s.athlete_id = a.id
GROUP BY sport, bmi_bucket
ORDER BY sport, athletes DESC;

-- Comment out the troubleshooting query
/*SELECT 
	height, 
    weight, 
    weight/height^2*100 AS bmi
FROM athletes
WHERE weight/height^2*100 IS NULL;*/
