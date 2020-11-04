-- Query 7

SELECT DISTINCT C.name AS carrier
    FROM CARRIERS AS C, FLIGHTS AS F
    WHERE C.cid = F.carrier_id AND 
            F.dest_city = 'San Francisco CA' AND 
            F.origin_city = 'Seattle WA'
    ORDER BY carrier ASC;

-- Rows returned: 4
-- Runtime: 3 seconds
-- Results: 
/* 
carrier
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America
*/