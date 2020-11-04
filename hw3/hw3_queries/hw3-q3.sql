-- Query 3

SELECT F1.origin_city AS origin_city, ISNULL(ROUND(CAST((SELECT COUNT(*) AS num
                                            FROM FLIGHTS AS F2
                                            WHERE F2.actual_time < 180
                                            AND F2.origin_city = F1.origin_city
                                            GROUP BY F2.origin_city) AS FLOAT) * 100 / COUNT(*), 2), 0) AS percentage
    FROM FLIGHTS AS F1
    GROUP BY F1.origin_city
    ORDER BY percentage, origin_city ASC;

-- Rows returned: 327
-- Runtime: 15 seconds
-- Results: 
/* 
origin_city,percentage
Guam TT,0
Pago Pago TT,0
Aguadilla PR,29.43
Anchorage AK,32.15
San Juan PR,33.89
Charlotte Amalie VI,40
Ponce PR,41.94
Fairbanks AK,50.69
Kahului HI,53.66
Honolulu HI,54.91
San Francisco CA,56.31
Los Angeles CA,56.6
Seattle WA,57.76
Long Beach CA,62.45
Kona HI,63.28
New York NY,63.48
Las Vegas NV,65.16
Christiansted VI,65.33
Newark NJ,67.14
Worcester MA,67.74
*/