-- Homework 4 Part 4

-- Part 1
CREATE TABLE Frumble (
	name VARCHAR(100),
	discount VARCHAR(100),
	month VARCHAR(100),
	price INT
);

-- Part 2
SELECT * FROM Frumble A, Frumble B
WHERE A.name = B.name AND A.price != B.price;
-- name -> price

SELECT * FROM Frumble A, Frumble B
WHERE A.month = B.month AND A.discount != B.discount;
-- month -> discount

SELECT * FROM Frumble A, Frumble B
WHERE A.name = B.name AND A.discount = B.discount AND A.price != B.price AND A.month != B.month;
-- name, discount -> price, month

SELECT * FROM Frumble A, Frumble B
WHERE A.month = B.month AND A.price = B.price AND A.discount != B.discount AND A.name != B.name;
-- month, price -> discount, name

-- The FDs are name -> price and month -> discount

-- Part 3
-- S(name,price,discount,month)
-- {name}+ = {name,price} 
-- {name}+ != {name}
-- {name}+ != {name,price,discount,month}
-- S(name,price,discount,month) decomposed as S1(name,price) and S2(name,discount,month)
-- S2(name,discount,month)
-- {month}+ = {month, discount}
-- {month}+ != {month}
-- {month}+ != {name,discount,month}
-- S2(name,discount,month) decomposed as S21(month,discount) and S22 (month,name)
-- BCNF is S1(name,price), S21(month,discount), and S22 (month,name)
CREATE TABLE namePrice (
	name VARCHAR(100) PRIMARY KEY,
	price INT
);

CREATE TABLE monthDiscount (
	month VARCHAR(100) PRIMARY KEY,
	discount VARCHAR(100)
);

CREATE TABLE monthName (
	name varchar(100),
	month varchar(100),
	FOREIGN KEY (name) REFERENCES namePrice(name),
	FOREIGN KEY (month) REFERENCES monthDiscount(month)
);

-- Part 4
INSERT INTO namePrice 
	SELECT DISTINCT name, price FROM Frumble;
SELECT COUNT(*) FROM namePrice; -- 36

INSERT INTO monthDiscount 
	SELECT DISTINCT discount, month FROM Frumble;
SELECT COUNT(*) FROM monthDiscount; -- 12

INSERT INTO monthName 
	SELECT DISTINCT name, month FROM Frumble;
SELECT COUNT(*) FROM monthName; -- 426







