-- Query 6

WITH FLIGHTS2 AS (SELECT DISTINCT F.carrier_id
                    FROM FLIGHTS AS F
                    WHERE F.origin_city = 'Seattle WA' AND
                            F.dest_city = 'San Francisco CA')
SELECT C.name AS carrier
    FROM CARRIERS AS C, FLIGHTS2 AS F2
    WHERE C.cid =  F2.carrier_id
    ORDER BY carrier ASC;

-- Rows returned: 4
-- Runtime: 4 seconds
-- Results: 
/* 
carrier
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America
*/