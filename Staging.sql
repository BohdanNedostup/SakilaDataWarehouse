USE AdventureWorks2012

GO

alter database SakilaWarehouseStaging set single_user with rollback immediate

GO

DROP DATABASE IF EXISTS SakilaWarehouseStaging

GO
CREATE DATABASE SakilaWarehouseStaging

GO

USE SakilaWarehouseStaging

GO

CREATE TABLE film
(
	actor_group_id		SMALLINT,
	title				VARCHAR(255),
	category_name		VARCHAR(25),
	release_year		INT,
	[language]			CHAR(20),
	rental_duration		TINYINT,
	rental_rate			DECIMAL(4,2),
	rating				VARCHAR(50),
	replacement_cost	DECIMAL(5,2),
);

GO


CREATE TABLE [address](
	address_id	SMALLINT,
	[address]	VARCHAR(50),
	district	VARCHAR(20),
	city		VARCHAR(50),
	country		VARCHAR(50),
);