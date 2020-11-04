-- Question 4
-- Result: 12 rows 

SELECT DISTINCT C.name as name
	FROM FLIGHTS AS F, CARRIERS AS C, MONTHS AS M
	WHERE F.carrier_id = C.cid AND F.month_id = M.mid
	GROUP BY M.month, F.day_of_month, C.name
	HAVING COUNT(*) > 1000;