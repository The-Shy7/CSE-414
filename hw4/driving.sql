-- Homework 4 Part 2

-- Part A
CREATE TABLE InsuranceCo (
	name VARCHAR(100) PRIMARY KEY,
	phone VARCHAR(100)
);

CREATE TABLE Person (
	ssn INT PRIMARY KEY,
	name VARCHAR(100)
);

CREATE TABLE Driver (
	driverID INT,
	ssn INT,
	FOREIGN KEY (ssn) REFERENCES Person(ssn)
);

CREATE TABLE NonProfessionalDriver (
	driverID INT,
	FOREIGN KEY (driverID) REFERENCES Driver(driverID)
);

CREATE TABLE ProfessionalDriver (
	driverID INT,
	medicalHistory VARCHAR(256),
	FOREIGN KEY (driverID) REFERENCES Driver(driverID)
);

CREATE TABLE Vehicle (
	licensePlate VARCHAR(100) PRIMARY KEY,
	year INT,
	maxLiability REAL,
	ownerSsn INT,
	insuranceName VARCHAR(100),
	FOREIGN KEY (ownerSsn) REFERENCES Person(ssn),
	FOREIGN KEY (insuranceName) REFERENCES InsuranceCo(name)
);

CREATE TABLE Car (
	licensePlate VARCHAR(100) PRIMARY KEY,
	make VARCHAR(100),
	FOREIGN KEY (licensePlate) REFERENCES Vehicle(licensePlate)
);

CREATE TABLE Truck (
	licensePlate VARCHAR(100) PRIMARY KEY,
	capacity INT,
	driverID INT,
	FOREIGN KEY (licensePlate) REFERENCES Vehicle(licensePlate),
	FOREIGN KEY (driverID) REFERENCES ProfessionalDriver(driverID)
);

CREATE TABLE DriverOfCar (
	licensePlate VARCHAR(100),
	driverID INT,
	PRIMARY KEY (licensePlate, driverID),
	FOREIGN KEY (licensePlate) REFERENCES Car(licensePlate),
	FOREIGN KEY (driverID) REFERENCES NonProfessionalDriver(driverID)
);

-- Part B
/* The insures relationship is represented by the columns
insuranceName and maxLiability in the vehicle relation. Since a vehicle cannot have
more than one insurance info, I have represented in the main vehicle relation itself. 
"insures" is a many to 1 relation, so I can use a foreign key to save one table. */

-- Part C
/*  The relation “drives” is a many to many relation, which means a non professional driver
can drive as many cars as he wants, and a car can be driven by one or many non professional
drivers. However, "operates" is a many to 1 relation, which means a truck can only be operated
by at most one professional driver, and one professional drive can drive one or many trucks. */



