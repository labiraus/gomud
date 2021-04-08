USE [master]
GO
/****** Object:  Database [gomud]    Script Date: 15/02/2021 22:01:49 ******/
CREATE DATABASE [gomud]
GO
ALTER DATABASE [gomud] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gomud].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gomud] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gomud] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gomud] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gomud] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gomud] SET ARITHABORT OFF 
GO
ALTER DATABASE [gomud] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gomud] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gomud] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gomud] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gomud] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gomud] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gomud] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gomud] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gomud] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gomud] SET  DISABLE_BROKER 
GO
ALTER DATABASE [gomud] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gomud] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gomud] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gomud] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gomud] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gomud] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gomud] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gomud] SET RECOVERY FULL 
GO
ALTER DATABASE [gomud] SET  MULTI_USER 
GO
ALTER DATABASE [gomud] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gomud] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gomud] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gomud] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [gomud] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'gomud', N'ON'
GO
ALTER DATABASE [gomud] SET QUERY_STORE = OFF
GO
USE [gomud]
GO
/****** Object:  Table [dbo].[connections]    Script Date: 15/02/2021 22:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[connections](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[room_id] [int] NOT NULL,
	[neighbour_id] [int] NOT NULL,
	[dir] [int] NOT NULL,
	[two_way] [bit] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[deleted_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rooms]    Script Date: 15/02/2021 22:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rooms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](500) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[deleted_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 15/02/2021 22:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](50) NOT NULL,
	[character_name] [varchar](50) NULL,
	[password_hash] [varchar](50) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[deleted_at] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[connections] ADD  CONSTRAINT [DF_connections_two_way]  DEFAULT ((1)) FOR [two_way]
GO
ALTER TABLE [dbo].[connections] ADD  CONSTRAINT [DF_connections_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[connections] ADD  CONSTRAINT [DF_connections_updated_at]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[rooms] ADD  CONSTRAINT [DF_rooms_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[rooms] ADD  CONSTRAINT [DF_rooms_updated_at]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_updated_at]  DEFAULT (getdate()) FOR [updated_at]
GO