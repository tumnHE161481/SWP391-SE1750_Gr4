USE [master]
GO
/****** Object:  Database [GreenRoom]    Script Date: 2/29/2024 8:46:24 PM ******/
CREATE DATABASE [GreenRoom]
 CONTAINMENT = NONE
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
/****** Object:  Table [dbo].[account]    Script Date: 2/29/2024 8:46:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[userMail] [nvarchar](max) NOT NULL,
	[userPassword] [nvarchar](max) NOT NULL,
	[userRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 2/29/2024 8:46:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[billID] [int] IDENTITY(1,1) NOT NULL,
	[roomID] [int] NOT NULL,
	[service] [money] NOT NULL,
	[electric] [money] NOT NULL,
	[water] [money] NOT NULL,
	[roomFee] [money] NOT NULL,
	[other] [money] NOT NULL,
	[penMoney] [money] NOT NULL,
	[createAt] [datetime] NOT NULL,
	[deadline] [datetime] NOT NULL,
	[payAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[billID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[guideline]    Script Date: 2/29/2024 8:46:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[guideline](
	[guideID] [int] IDENTITY(1,1) NOT NULL,
	[guideName] [nvarchar](max) NOT NULL,
	[img] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guideID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[item]    Script Date: 2/29/2024 8:46:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item](
	[itemID] [int] IDENTITY(1,1) NOT NULL,
	[itemName] [nvarchar](max) NOT NULL,
	[itemImg] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news]    Script Date: 2/29/2024 8:46:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news](
	[newID] [int] IDENTITY(1,1) NOT NULL,
	[newTitle] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[newID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[penalty]    Script Date: 2/29/2024 8:46:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[penalty](
	[penID] [int] IDENTITY(1,1) NOT NULL,
	[reportID] [int] NOT NULL,
	[accuseID] [int] NOT NULL,
	[roomID] [int] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[penDate] [datetime] NOT NULL,
	[ruleID] [int] NOT NULL,
	[penStatus] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[penID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[renter]    Script Date: 2/29/2024 8:46:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[renter](
	[renterID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[roomID] [int] NULL,
	[renterStatus] [bit] NOT NULL,
	[renterHaveRoom] [bit] NOT NULL,
	[CGRScore] [int] NOT NULL,
	[balance] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[renterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[request]    Script Date: 2/29/2024 8:46:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[request](
	[requestID] [int] IDENTITY(1,1) NOT NULL,
	[renterID] [int] NOT NULL,
	[requestType] [int] NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[createAt] [datetime] NOT NULL,
	[resStatus] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[requestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room]    Script Date: 2/29/2024 8:46:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room](
	[roomID] [int] IDENTITY(1,1) NOT NULL,
	[roomFloor] [int] NOT NULL,
	[roomNumber] [int] NOT NULL,
	[roomSize] [int] NOT NULL,
	[roomImg] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roomItem]    Script Date: 2/29/2024 8:46:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roomItem](
	[roomItemID] [int] IDENTITY(1,1) NOT NULL,
	[roomID] [int] NOT NULL,
	[itemID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roomItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rule]    Script Date: 2/29/2024 8:46:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rule](
	[ruleID] [int] IDENTITY(1,1) NOT NULL,
	[ruleName] [nvarchar](max) NOT NULL,
	[img] [nvarchar](max) NOT NULL,
	[scoreChange] [int] NOT NULL,
	[penMoney] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ruleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[security]    Script Date: 2/29/2024 8:46:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[security](
	[seID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[sShift] [bit] NOT NULL,
	[seStatus] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[seID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usage]    Script Date: 2/29/2024 8:46:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usage](
	[usageID] [int] IDENTITY(1,1) NOT NULL,
	[roomID] [int] NOT NULL,
	[electricNum] [float] NOT NULL,
	[waterBlock] [float] NOT NULL,
	[createAt] [datetime] NOT NULL,
	[payAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[usageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 2/29/2024 8:46:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[userID] [int] NOT NULL,
	[userName] [nvarchar](max) NOT NULL,
	[userGender] [nvarchar](10) NOT NULL,
	[userBirth] [date] NOT NULL,
	[userAddress] [nvarchar](max) NOT NULL,
	[userPhone] [nvarchar](20) NOT NULL,
	[userAvatar] [nvarchar](max) NULL,
 CONSTRAINT [PK__user__CB9A1CDF26E24277] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD FOREIGN KEY([roomID])
REFERENCES [dbo].[room] ([roomID])
GO
ALTER TABLE [dbo].[penalty]  WITH CHECK ADD FOREIGN KEY([accuseID])
REFERENCES [dbo].[renter] ([renterID])
GO
ALTER TABLE [dbo].[penalty]  WITH CHECK ADD FOREIGN KEY([reportID])
REFERENCES [dbo].[renter] ([renterID])
GO
ALTER TABLE [dbo].[penalty]  WITH CHECK ADD FOREIGN KEY([roomID])
REFERENCES [dbo].[room] ([roomID])
GO
ALTER TABLE [dbo].[penalty]  WITH CHECK ADD FOREIGN KEY([ruleID])
REFERENCES [dbo].[rule] ([ruleID])
GO
ALTER TABLE [dbo].[renter]  WITH CHECK ADD FOREIGN KEY([roomID])
REFERENCES [dbo].[room] ([roomID])
GO
ALTER TABLE [dbo].[renter]  WITH CHECK ADD  CONSTRAINT [FK__renter__userID__30F848ED] FOREIGN KEY([userID])
REFERENCES [dbo].[user] ([userID])
GO
ALTER TABLE [dbo].[renter] CHECK CONSTRAINT [FK__renter__userID__30F848ED]
GO
ALTER TABLE [dbo].[request]  WITH CHECK ADD FOREIGN KEY([renterID])
REFERENCES [dbo].[renter] ([renterID])
GO
ALTER TABLE [dbo].[roomItem]  WITH CHECK ADD FOREIGN KEY([itemID])
REFERENCES [dbo].[item] ([itemID])
GO
ALTER TABLE [dbo].[roomItem]  WITH CHECK ADD FOREIGN KEY([roomID])
REFERENCES [dbo].[room] ([roomID])
GO
ALTER TABLE [dbo].[security]  WITH CHECK ADD  CONSTRAINT [FK__security__userID__34C8D9D1] FOREIGN KEY([userID])
REFERENCES [dbo].[user] ([userID])
GO
ALTER TABLE [dbo].[security] CHECK CONSTRAINT [FK__security__userID__34C8D9D1]
GO
ALTER TABLE [dbo].[usage]  WITH CHECK ADD FOREIGN KEY([roomID])
REFERENCES [dbo].[room] ([roomID])
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_account] FOREIGN KEY([userID])
REFERENCES [dbo].[account] ([userID])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_account]
GO
USE [master]
GO
ALTER DATABASE [GreenRoom] SET  READ_WRITE 
GO
