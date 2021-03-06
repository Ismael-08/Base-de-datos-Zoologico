/**
15-miin-1-136 José Alcantara 15-min-1-140 Yunior Peguero 17-miin-1-029 Ismael Pérez 13-SISN-1-038 Alexis Recio
**/

USE [master]
GO
/****** Object:  Database [Zoologico]    Script Date: 12/4/2019 10:34:31 p. m. ******/
CREATE DATABASE [Zoologico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Zoologico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Zoologico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Zoologico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Zoologico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Zoologico] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Zoologico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Zoologico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Zoologico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Zoologico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Zoologico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Zoologico] SET ARITHABORT OFF 
GO
ALTER DATABASE [Zoologico] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Zoologico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Zoologico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Zoologico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Zoologico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Zoologico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Zoologico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Zoologico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Zoologico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Zoologico] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Zoologico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Zoologico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Zoologico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Zoologico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Zoologico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Zoologico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Zoologico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Zoologico] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Zoologico] SET  MULTI_USER 
GO
ALTER DATABASE [Zoologico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Zoologico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Zoologico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Zoologico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Zoologico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Zoologico] SET QUERY_STORE = OFF
GO
USE [Zoologico]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 12/4/2019 10:34:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[id] [int] NOT NULL,
	[Sexo] [varchar](50) NULL,
	[Ano_nacimiento] [date] NULL,
	[Pais_origen] [varchar](50) NULL,
	[Continente] [varchar](50) NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Edad] [numeric](18, 0) NOT NULL,
	[id_especie] [int] NULL,
 CONSTRAINT [PK_Animal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especie]    Script Date: 12/4/2019 10:34:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especie](
	[Id] [int] NOT NULL,
	[NombreAnimal] [varchar](50) NULL,
	[NombreVulgar] [varchar](50) NULL,
	[Familia] [varchar](50) NULL,
	[NivelPeligro] [varchar](50) NULL,
 CONSTRAINT [PK_Especie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 12/4/2019 10:34:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[id] [int] NULL,
	[Factura] [nchar](10) NOT NULL,
	[Fecha] [date] NOT NULL,
	[id_ticket] [int] NOT NULL,
	[Monto] [numeric](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 12/4/2019 10:34:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[id] [int] NOT NULL,
	[Ticket] [nchar](10) NOT NULL,
	[Fecha] [date] NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zoo]    Script Date: 12/4/2019 10:34:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zoo](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Pais] [varchar](50) NULL,
	[Tamano] [varchar](50) NULL,
	[Ciudad] [varchar](50) NULL,
	[Capacidad] [varchar](50) NULL,
 CONSTRAINT [PK_Zoo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_Especie] FOREIGN KEY([id_especie])
REFERENCES [dbo].[Especie] ([Id])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_Especie]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Ticket] FOREIGN KEY([id])
REFERENCES [dbo].[Ticket] ([id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Ticket]
GO
USE [master]
GO
ALTER DATABASE [Zoologico] SET  READ_WRITE 
GO
