-- Query 4

SELECT DISTINCT F1.dest_city AS city 
    FROM FLIGHTS AS F1, FLIGHTS AS F2
    WHERE F1.origin_city = F2.dest_city AND 
            F2.origin_city = 'Seattle WA' AND
            F1.dest_city != 'Seattle WA' AND
            F1.dest_city NOT IN (SELECT DISTINCT F3.dest_city as city
                                    FROM FLIGHTS AS F3
                                    WHERE F3.origin_city = 'Seattle WA')
    ORDER BY city ASC;

-- Rows returned: 256
-- Runtime: 23 seconds
-- Results: 
/* 
city
Aberdeen SD
Abilene TX
Adak Island AK
Aguadilla PR
Akron OH
Albany GA
Albany NY
Alexandria LA
Allentown/Bethlehem/Easton PA
Alpena MI
Amarillo TX
Appleton WI
Arcata/Eureka CA
Asheville NC
Ashland WV
Aspen CO
Atlantic City NJ
Augusta GA
Bakersfield CA
Bangor ME
*/