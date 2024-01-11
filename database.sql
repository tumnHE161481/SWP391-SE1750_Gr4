USE [master]
GO
/****** Object:  Database [GreenRoom]    Script Date: 1/11/2024 9:30:20 PM ******/
CREATE DATABASE [GreenRoom]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GreenRoom', FILENAME = N'D:\SQL2019\MSSQL15.MSSQLSERVER02\MSSQL\DATA\GreenRoom.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GreenRoom_log', FILENAME = N'D:\SQL2019\MSSQL15.MSSQLSERVER02\MSSQL\DATA\GreenRoom_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GreenRoom] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GreenRoom].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GreenRoom] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GreenRoom] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GreenRoom] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GreenRoom] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GreenRoom] SET ARITHABORT OFF 
GO
ALTER DATABASE [GreenRoom] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GreenRoom] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GreenRoom] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GreenRoom] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GreenRoom] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GreenRoom] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GreenRoom] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GreenRoom] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GreenRoom] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GreenRoom] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GreenRoom] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GreenRoom] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GreenRoom] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GreenRoom] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GreenRoom] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GreenRoom] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GreenRoom] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GreenRoom] SET RECOVERY FULL 
GO
ALTER DATABASE [GreenRoom] SET  MULTI_USER 
GO
ALTER DATABASE [GreenRoom] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GreenRoom] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GreenRoom] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GreenRoom] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GreenRoom] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GreenRoom] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GreenRoom', N'ON'
GO
ALTER DATABASE [GreenRoom] SET QUERY_STORE = OFF
GO
USE [GreenRoom]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 1/11/2024 9:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[userID] [int] NOT NULL,
	[userMail] [nvarchar](225) NOT NULL,
	[userPassWord] [nvarchar](50) NOT NULL,
	[userRole] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 1/11/2024 9:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[billID] [int] NOT NULL,
	[seID] [int] NOT NULL,
	[roomID] [int] NOT NULL,
	[billElectric] [int] NOT NULL,
	[billWater] [int] NOT NULL,
	[billRoom] [int] NOT NULL,
	[billPenalty] [int] NULL,
	[billStatus] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuideOrRule]    Script Date: 1/11/2024 9:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuideOrRule](
	[guideID] [int] NOT NULL,
	[guideOrRule] [bit] NOT NULL,
	[grName] [nvarchar](50) NOT NULL,
	[grImg] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 1/11/2024 9:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[newsID] [int] NOT NULL,
	[ownerID] [int] NOT NULL,
	[newsTitle] [nvarchar](225) NOT NULL,
	[newsDes] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Penalty]    Script Date: 1/11/2024 9:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Penalty](
	[penId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[description] [nvarchar](225) NOT NULL,
	[penMoney] [int] NULL,
	[penStatus] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Renter]    Script Date: 1/11/2024 9:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Renter](
	[renterID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[roomID] [int] NULL,
	[renterStatus] [bit] NOT NULL,
	[renterHaveRoom] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 1/11/2024 9:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[roomID] [nvarchar](50) NOT NULL,
	[roomFloor] [int] NOT NULL,
	[roomNumber] [nvarchar](50) NOT NULL,
	[roomItemID] [int] NOT NULL,
	[roomSize] [nvarchar](50) NOT NULL,
	[roomImg] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room_Item]    Script Date: 1/11/2024 9:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room_Item](
	[itemId] [int] NOT NULL,
	[singleBed] [int] NULL,
	[bunk] [int] NULL,
	[chair] [int] NULL,
	[ceilingFans] [bit] NOT NULL,
	[airConditional] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Security]    Script Date: 1/11/2024 9:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Security](
	[sID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[sShift] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sevice]    Script Date: 1/11/2024 9:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sevice](
	[seID] [int] NULL,
	[userID] [int] NOT NULL,
	[seClean] [bit] NULL,
	[seWifi] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 1/11/2024 9:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[taskID] [int] NOT NULL,
	[from] [int] NOT NULL,
	[to] [int] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[des] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/11/2024 9:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userID] [int] NOT NULL,
	[userName] [nvarchar](225) NOT NULL,
	[userMail] [nvarchar](225) NOT NULL,
	[userPassWord] [nvarchar](50) NOT NULL,
	[userGender] [nvarchar](50) NOT NULL,
	[userBirth] [date] NOT NULL,
	[userAddress] [nvarchar](225) NOT NULL,
	[userPhone] [nvarchar](11) NOT NULL,
	[userRole] [int] NOT NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [GreenRoom] SET  READ_WRITE 
GO
