-- Question 8
-- Result: 22 rows 

SELECT C.name AS name, SUM(F.departure_delay) AS delay
	FROM FLIGHTS AS F, CARRIERS AS C
	WHERE F.carrier_id = C.cid
	GROUP BY C.name;