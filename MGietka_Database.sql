USE [master]
GO
/****** Object:  Database [MGietka_Zaliczenie_BazyDanych]    Script Date: 19.04.2022 11:28:17 ******/
CREATE DATABASE [MGietka_Zaliczenie_BazyDanych] ON  PRIMARY 
( NAME = N'MGietka_Zaliczenie_BazyDanych', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\MGietka_Zaliczenie_BazyDanych.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MGietka_Zaliczenie_BazyDanych_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\MGietka_Zaliczenie_BazyDanych_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
EXEC dbo.sp_dbcmptlevel @dbname=N'MGietka_Zaliczenie_BazyDanych', @new_cmptlevel=90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MGietka_Zaliczenie_BazyDanych].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET ARITHABORT OFF 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET  MULTI_USER 
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET DB_CHAINING OFF 
GO
USE [MGietka_Zaliczenie_BazyDanych]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 19.04.2022 11:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer ID] [int] NOT NULL,
	[Customer Name] [nchar](50) NULL,
	[Segment] [nchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer Location]    Script Date: 19.04.2022 11:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer Location](
	[CustomerID] [int] NOT NULL,
	[Postal Code] [nchar](50) NULL,
	[City] [nchar](50) NULL,
	[State] [nchar](50) NULL,
	[Country] [nchar](50) NULL,
 CONSTRAINT [PK_Customer Location] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 19.04.2022 11:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order ID] [int] NOT NULL,
	[Customer ID] [int] NOT NULL,
	[Order date] [datetime] NULL,
	[ShipID] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order details]    Script Date: 19.04.2022 11:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order details](
	[Order ID] [int] NOT NULL,
	[Product ID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Sales] [float] NULL,
	[Discount] [float] NULL,
	[Profit] [float] NULL,
 CONSTRAINT [PK_Order details_1] PRIMARY KEY CLUSTERED 
(
	[Order ID] ASC,
	[Product ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.04.2022 11:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product ID] [int] NOT NULL,
	[Product Name] [nchar](100) NULL,
	[Category] [nchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 19.04.2022 11:28:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[ShipID] [int] NOT NULL,
	[Shipdate] [datetime] NOT NULL,
	[Ship mode] [nchar](50) NULL,
	[Ship cost] [float] NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[ShipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Customer Location] FOREIGN KEY([Customer ID])
REFERENCES [dbo].[Customer Location] ([CustomerID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Customer Location]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([Customer ID])
REFERENCES [dbo].[Customer] ([Customer ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Shipping] FOREIGN KEY([ShipID])
REFERENCES [dbo].[Shipping] ([ShipID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Shipping]
GO
ALTER TABLE [dbo].[Order details]  WITH CHECK ADD  CONSTRAINT [FK_Order details_Order] FOREIGN KEY([Order ID])
REFERENCES [dbo].[Order] ([Order ID])
GO
ALTER TABLE [dbo].[Order details] CHECK CONSTRAINT [FK_Order details_Order]
GO
ALTER TABLE [dbo].[Order details]  WITH CHECK ADD  CONSTRAINT [FK_Order details_Product] FOREIGN KEY([Product ID])
REFERENCES [dbo].[Product] ([Product ID])
GO
ALTER TABLE [dbo].[Order details] CHECK CONSTRAINT [FK_Order details_Product]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD CHECK  (([Customer ID]>=(99999)))
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD CHECK  (([Customer ID]>=(99999)))
GO
USE [master]
GO
ALTER DATABASE [MGietka_Zaliczenie_BazyDanych] SET  READ_WRITE 
GO
