/* Q2.1 */
CREATE TABLE Edges (Source INT, Destination INT);

/* Q2.2 */
INSERT INTO Edges VALUES (10,5), (6,25), (1,3), (4,4);

/* Q2.3 */
SELECT * FROM Edges;

/* Q2.4 */
SELECT E.Source FROM Edges AS E;

/* Q2.5 */
SELECT E.Source, E.Destination 
	FROM Edges AS E
	WHERE E.Source > E.Destination;

/* Q2.6 */
INSERT INTO Edges VALUES ('-1','2000');
/* Don't get an error because sqlite allows this*/

/* Q3 */
CREATE TABLE MyRestaurants (
	Name VARCHAR(100),
	Type VARCHAR(100),
	Distance INT,
	LastVisitDate VARCHAR(10),
	LikeOrNot INT);

/* Q4 */
INSERT INTO MyRestaurants VALUES ('Din Tai Fung', 'Taiwanese', 33, '2020-01-03', 1);
INSERT INTO MyRestaurants VALUES ('Wataru', 'Japanese', 34, '2019-11-17', 1);
INSERT INTO MyRestaurants VALUES ('Samurai Noodle', 'Ramen', 33, '2019-08-26', 0);
INSERT INTO MyRestaurants VALUES ('Kum Kang San BBQ Grill Buffet', 'Korean barbecue', 22, '2020-01-23', NULL);
INSERT INTO MyRestaurants VALUES ('Carmines', 'Italian', 26, '2020-02-09', 1);
INSERT INTO MyRestaurants VALUES ('Saya Restaurant', 'Thai', 10, '2020-01-28', 1);
INSERT INTO MyRestaurants VALUES ('Trappers Sushi', 'Sushi', 9, '2020-02-16', 1);

/* Q5 */
SELECT * FROM MyRestaurants;
SELECT * FROM MyRestaurants;
SELECT * FROM MyRestaurants;
SELECT * FROM MyRestaurants;
SELECT * FROM MyRestaurants;
SELECT * FROM MyRestaurants;

/* Q6 */
SELECT M.Name, M.Distance
	FROM MyRestaurants AS M
	WHERE M.Distance <= 20
	ORDER BY M.Name;

/* Q7 */
SELECT * 
	FROM MyRestaurants AS M
	WHERE M.LikeOrNot = 1 AND date(M.LastVisitDate) < date('now','-3 month');

/* Q8 */
SELECT * FROM MyRestaurants AS M WHERE M.Distance <= 10;
