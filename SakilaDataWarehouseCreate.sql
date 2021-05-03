USE master

GO

alter database SakilaWarehouse set single_user with rollback immediate

GO

DROP DATABASE IF EXISTS SakilaWarehouse

GO

CREATE DATABASE SakilaWarehouse

GO

USE SakilaWarehouse

GO

CREATE TABLE CustomerDim
(
	id			SMALLINT PRIMARY KEY NOT NULL,
	fullname	VARCHAR(91) NOT NULL,
	email		VARCHAR(50) NOT NULL,
	city		VARCHAR(50) NOT NULL,
	country		VARCHAR(50) NOT NULL,
	[address]	VARCHAR(50) NOT NULL,
	district	VARCHAR(20) NOT NULL
);

GO

CREATE TABLE DateDim
(
	id					INT PRIMARY KEY NOT NULL IDENTITY,
	full_date			DATETIME NOT NULL,
	[year]				INT NOT NULL,
	half_year			INT NOT NULL,
	[quarter]			INT NOT NULL,
	month_num_of_year	INT NOT NULL,
	month_name			NVARCHAR(30) NOT NULL,
	day_num_of_month	INT NOT NULL,
	day_name_of_week	NVARCHAR(30) NOT NULL,
	week_num_of_month	INT NOT NULL
);

GO

CREATE TABLE ActorGroup
(
	id SMALLINT PRIMARY KEY NOT NULL IDENTITY
);

GO

CREATE TABLE RentalDim
(
	id					INT PRIMARY KEY NOT NULL,
	title				VARCHAR(255) NOT NULL,
	category_name		VARCHAR(25) NOT NULL,
	release_year		INT NOT NULL,
	[language]			CHAR(20) NOT NULL,
	rental_duration		TINYINT NOT NULL,
	rental_rate			DECIMAL(4,2) NOT NULL,
	rating				VARCHAR(50) NOT NULL,
	replacement_cost	DECIMAL(5,2) NOT NULL,
	store_country		VARCHAR(50) NOT NULL,
	store_city			VARCHAR(50) NOT NULL,
	store_district		VARCHAR(20) NOT NULL,
	store_address		VARCHAR(50) NOT NULL,
	actor_group_id		SMALLINT FOREIGN KEY REFERENCES ActorGroup(id),
);

GO

CREATE TABLE Actor
(
	id		INT PRIMARY KEY NOT NULL IDENTITY,
	[name]	VARCHAR(90) NOT NULL
);

GO

CREATE TABLE ActorGroupBridge
(
	actor_group_id	SMALLINT FOREIGN KEY REFERENCES ActorGroup(id),
	actor_id		INT FOREIGN KEY REFERENCES Actor(id)
);

GO

CREATE TABLE FactsDim
(
	id				SMALLINT NOT NULL,
	customer_id		SMALLINT FOREIGN KEY REFERENCES CustomerDim(id),
	rental_id		INT FOREIGN KEY REFERENCES RentalDim(id),
	payment_date_id	INT FOREIGN KEY REFERENCES DateDim(id),
	amount			DECIMAL(5,2) NOT NULL
);

GO

set language english;

GO

DECLARE
 @Start_Date datetime,
 @End_Date datetime
SET @Start_Date = '2000-12-31T00:00:00.000'
SET @End_Date = '2100-12-31T00:00:00.000'
WHILE (@Start_Date < @End_Date)
BEGIN 
 SET @Start_Date = DATEADD(day, 1, @Start_Date)
 INSERT INTO DateDim 
 VALUES ( @Start_Date, 
          DATEPART(year, @Start_Date), 
    CASE
     WHEN DATEPART(month, @Start_Date) BETWEEN 1 AND 6
     THEN 1
     WHEN DATEPART(month, @Start_Date) BETWEEN 7 AND 12
     THEN 2
    END,
    DATEPART(quarter , @Start_Date),
             DATEPART(month, @Start_Date),
             DATENAME(month, @Start_Date),
             DATEPART(day , @Start_Date),
             DATENAME(weekday, @Start_Date),
    CASE 
    WHEN DATEPART(day , @Start_Date) BETWEEN 1 AND 7
    THEN 1
    WHEN DATEPART(day , @Start_Date) BETWEEN 8 AND 14
    THEN 2
    WHEN DATEPART(day , @Start_Date) BETWEEN 15 AND 21
    THEN 3
    WHEN DATEPART(day , @Start_Date) BETWEEN 22 AND 28
    THEN 4
    WHEN DATEPART(day , @Start_Date) BETWEEN 29 AND 31
    THEN 5
     END)
END