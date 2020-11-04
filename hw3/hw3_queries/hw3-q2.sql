-- Query 2

SELECT DISTINCT F1.origin_city AS city 
    FROM FLIGHTS AS F1
    WHERE F1.origin_city NOT IN (SELECT DISTINCT F2.origin_city AS city
                                    FROM FLIGHTS AS F2
                                    WHERE F2.actual_time >= 180)
    ORDER BY city ASC;

-- Rows returned: 109
-- Runtime: 16 seconds
-- Results: 
/* 
city
Aberdeen SD
Abilene TX
Alpena MI
Ashland WV
Augusta GA
Barrow AK
Beaumont/Port Arthur TX
Bemidji MN
Bethel AK
Binghamton NY
Brainerd MN
Bristol/Johnson City/Kingsport TN
Butte MT
Carlsbad CA
Casper WY
Cedar City UT
Chico CA
College Station/Bryan TX
Columbia MO
Columbus GA
*/