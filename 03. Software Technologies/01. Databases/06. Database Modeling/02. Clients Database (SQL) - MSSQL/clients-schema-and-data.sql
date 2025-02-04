USE [master]
GO
/****** Object:  Database [Address]    Script Date: 7.10.2015 г. 14:48:27 ******/
CREATE DATABASE [Address]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Address', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Address.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Address_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Address_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Address] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Address].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Address] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Address] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Address] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Address] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Address] SET ARITHABORT OFF 
GO
ALTER DATABASE [Address] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Address] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Address] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Address] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Address] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Address] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Address] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Address] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Address] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Address] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Address] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Address] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Address] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Address] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Address] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Address] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Address] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Address] SET RECOVERY FULL 
GO
ALTER DATABASE [Address] SET  MULTI_USER 
GO
ALTER DATABASE [Address] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Address] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Address] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Address] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Address] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Address', N'ON'
GO
USE [Address]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 7.10.2015 г. 14:48:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[AddressText] [nvarchar](100) NOT NULL,
	[TownID] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Continent]    Script Date: 7.10.2015 г. 14:48:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continent](
	[ContinentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Continent] PRIMARY KEY CLUSTERED 
(
	[ContinentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 7.10.2015 г. 14:48:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ContinentID] [int] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 7.10.2015 г. 14:48:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[AddressID] [int] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Town]    Script Date: 7.10.2015 г. 14:48:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Town](
	[TownID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountryID] [int] NOT NULL,
 CONSTRAINT [PK_Town] PRIMARY KEY CLUSTERED 
(
	[TownID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([AddressID], [AddressText], [TownID]) VALUES (1, N'street Rakovska №10', 1)
INSERT [dbo].[Address] ([AddressID], [AddressText], [TownID]) VALUES (3, N'street Rakovska №10', 2)
INSERT [dbo].[Address] ([AddressID], [AddressText], [TownID]) VALUES (4, N'street Rakovska №10', 3)
INSERT [dbo].[Address] ([AddressID], [AddressText], [TownID]) VALUES (5, N'street Rakovska №10', 4)
INSERT [dbo].[Address] ([AddressID], [AddressText], [TownID]) VALUES (6, N'street Rakovska №10', 5)
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[Continent] ON 

INSERT [dbo].[Continent] ([ContinentID], [Name]) VALUES (1, N'Australia')
INSERT [dbo].[Continent] ([ContinentID], [Name]) VALUES (2, N'South America')
INSERT [dbo].[Continent] ([ContinentID], [Name]) VALUES (3, N'Europe')
INSERT [dbo].[Continent] ([ContinentID], [Name]) VALUES (4, N'Asia')
INSERT [dbo].[Continent] ([ContinentID], [Name]) VALUES (5, N'Afrika')
SET IDENTITY_INSERT [dbo].[Continent] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryID], [Name], [ContinentID]) VALUES (1, N'Bulgaria', 3)
INSERT [dbo].[Country] ([CountryID], [Name], [ContinentID]) VALUES (2, N'Egypt', 5)
INSERT [dbo].[Country] ([CountryID], [Name], [ContinentID]) VALUES (3, N'Australia', 1)
INSERT [dbo].[Country] ([CountryID], [Name], [ContinentID]) VALUES (4, N'China', 4)
INSERT [dbo].[Country] ([CountryID], [Name], [ContinentID]) VALUES (5, N'Panama', 2)
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (10, N'Petar', N'Georgiev', 1)
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (11, N'Albena', N'Stoilova', 1)
INSERT [dbo].[Person] ([PersonID], [FirstName], [LastName], [AddressID]) VALUES (14, N'Marin', N'Peshov', 3)
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Town] ON 

INSERT [dbo].[Town] ([TownID], [Name], [CountryID]) VALUES (1, N'Sofia', 1)
INSERT [dbo].[Town] ([TownID], [Name], [CountryID]) VALUES (2, N'Cairo', 2)
INSERT [dbo].[Town] ([TownID], [Name], [CountryID]) VALUES (3, N'Sydney', 3)
INSERT [dbo].[Town] ([TownID], [Name], [CountryID]) VALUES (4, N'Benjin', 4)
INSERT [dbo].[Town] ([TownID], [Name], [CountryID]) VALUES (5, N'Panama', 5)
SET IDENTITY_INSERT [dbo].[Town] OFF
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Town] FOREIGN KEY([TownID])
REFERENCES [dbo].[Town] ([TownID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Town]
GO
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [FK_Country_Continent] FOREIGN KEY([ContinentID])
REFERENCES [dbo].[Continent] ([ContinentID])
GO
ALTER TABLE [dbo].[Country] CHECK CONSTRAINT [FK_Country_Continent]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Address]
GO
ALTER TABLE [dbo].[Town]  WITH CHECK ADD  CONSTRAINT [FK_Town_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Town] CHECK CONSTRAINT [FK_Town_Country]
GO
USE [master]
GO
ALTER DATABASE [Address] SET  READ_WRITE 
GO
