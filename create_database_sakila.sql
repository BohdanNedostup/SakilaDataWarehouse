USE [master]
GO

/****** Object:  Database [sakila]    Script Date: 1/15/2014 11:49:34 AM ******/
CREATE DATABASE [sakila]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sakila', FILENAME = N'd:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sakila.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'sakila_log', FILENAME = N'd:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sakila_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [sakila] SET COMPATIBILITY_LEVEL = 110
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sakila].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [sakila] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [sakila] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [sakila] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [sakila] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [sakila] SET ARITHABORT OFF 
GO

ALTER DATABASE [sakila] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [sakila] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [sakila] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [sakila] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [sakila] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [sakila] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [sakila] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [sakila] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [sakila] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [sakila] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [sakila] SET  DISABLE_BROKER 
GO

ALTER DATABASE [sakila] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [sakila] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [sakila] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [sakila] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [sakila] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [sakila] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [sakila] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [sakila] SET RECOVERY FULL 
GO

ALTER DATABASE [sakila] SET  MULTI_USER 
GO

ALTER DATABASE [sakila] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [sakila] SET DB_CHAINING OFF 
GO

ALTER DATABASE [sakila] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [sakila] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [sakila] SET  READ_WRITE 
GO


