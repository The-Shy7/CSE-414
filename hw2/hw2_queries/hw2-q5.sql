-- Question 5
-- Result: 6 rows 

SELECT C.name, AVG(F.canceled) AS percentage
	FROM FLIGHTS AS F, CARRIERS AS C
	WHERE F.carrier_id = C.cid AND F.origin_city = 'Seattle WA'
	GROUP BY C.name
	HAVING AVG(F.canceled) > 0.005;