-- Query 5

SELECT DISTINCT F1.origin_city AS city
	FROM FLIGHTS AS F1
	WHERE F1.origin_city NOT IN (SELECT DISTINCT F3.dest_city AS city
									FROM FLIGHTS AS F2, FLIGHTS AS F3
									WHERE F2.dest_city = F3.origin_city
									AND F2.origin_city = 'Seattle WA')
	AND F1.origin_city NOT IN (SELECT DISTINCT F4.dest_city AS city
								FROM FLIGHTS AS F4
								WHERE F4.origin_city = 'Seattle WA')
	ORDER BY city ASC;

-- Rows returned: 4
-- Runtime: 45 seconds
-- Results: 
/* 
city
Devils Lake ND
Hattiesburg/Laurel MS
St. Augustine FL
Victoria TX
*/