USE [master]
GO
/****** Object:  Database [ExamDb]    Script Date: 02-07-2023 18:11:11 ******/
CREATE DATABASE [ExamDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExamDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ExamDb.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ExamDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ExamDb_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ExamDb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExamDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExamDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExamDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExamDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExamDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExamDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExamDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ExamDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExamDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExamDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExamDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExamDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExamDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExamDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExamDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExamDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ExamDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExamDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExamDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExamDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExamDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExamDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ExamDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExamDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ExamDb] SET  MULTI_USER 
GO
ALTER DATABASE [ExamDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExamDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExamDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExamDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ExamDb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ExamDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AnswerText] [nvarchar](700) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[City] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[StreetAddress] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedDateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Choices]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Choices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChoiceText] [nvarchar](250) NOT NULL,
	[DispalyOrder] [nvarchar](50) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Choices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[StreetAddress] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoverTypes]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoverTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CoverTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamMarks]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamMarks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Marks] [float] NOT NULL,
	[Grade] [nvarchar](50) NOT NULL,
	[Comment] [nvarchar](500) NOT NULL,
	[StudentId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ExamMarks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHeaders]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHeaders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationUserId] [nvarchar](450) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[ShippingDate] [datetime2](7) NOT NULL,
	[OrderTotal] [float] NOT NULL,
	[OrderStatus] [nvarchar](max) NULL,
	[PaymentStatus] [nvarchar](max) NULL,
	[TrackingNumber] [nvarchar](max) NULL,
	[Carrier] [nvarchar](max) NULL,
	[PaymentDate] [datetime2](7) NOT NULL,
	[PaymentDueDate] [datetime2](7) NOT NULL,
	[SessionId] [nvarchar](max) NULL,
	[PaymentIntentId] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[StreetAddress] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[PostalCode] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_OrderHeaders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ISBN] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](max) NOT NULL,
	[ListPrice] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[Price50] [float] NOT NULL,
	[Price100] [float] NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CoverTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionText] [nvarchar](750) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCarts]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCarts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[ApplicationUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_ShoppingCarts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Standards]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Standards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Standards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RollNo] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Address] [nvarchar](750) NOT NULL,
	[ImageUrl] [nvarchar](500) NOT NULL,
	[StandardId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime2](7) NOT NULL,
	[UserId] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentSubjects]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentSubjects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[ExamCode] [nvarchar](200) NOT NULL,
	[StudentId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime2](7) NOT NULL,
	[TotalQuestion] [int] NOT NULL,
 CONSTRAINT [PK_StudentSubjects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 02-07-2023 18:11:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210923151502_AddCategory', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210923184028_AddCoverTypeToDb', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210923201232_addProductToDb', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210924185243_AddIdentityToDb', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210924191557_extendIdentityUser', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210924193445_addCompanyToDb', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210924213551_addCompanyIdToUser', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210925152144_addShoppingCartToDb', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210925185241_addOrderHeaderAndDetailToDb', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230530064159_AddSubjetsTable', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230530064402_AddStandardTable', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230530070058_AddStudentTable', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230530070406_AddQuestionTable', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230530071129_AddAnswerTable', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230530073548_AddChoiceTable', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230530075128_AddExamMarkTable', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230531061326_AddStudentSubjectTable', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230604080812_adddepartmenttable', N'7.0.1')
GO
SET IDENTITY_INSERT [dbo].[Answers] ON 
GO
INSERT [dbo].[Answers] ([Id], [AnswerText], [QuestionId], [SubjectId], [IsActive], [CreatedDateTime]) VALUES (1, N'a,e,i,o,u', 1, 1, 1, CAST(N'2023-05-31T12:54:40.0257345' AS DateTime2))
GO
INSERT [dbo].[Answers] ([Id], [AnswerText], [QuestionId], [SubjectId], [IsActive], [CreatedDateTime]) VALUES (2, N'Good', 2, 1, 1, CAST(N'2023-05-31T12:55:00.1077382' AS DateTime2))
GO
INSERT [dbo].[Answers] ([Id], [AnswerText], [QuestionId], [SubjectId], [IsActive], [CreatedDateTime]) VALUES (3, N'Blue', 3, 1, 1, CAST(N'2023-05-31T16:08:56.1184444' AS DateTime2))
GO
INSERT [dbo].[Answers] ([Id], [AnswerText], [QuestionId], [SubjectId], [IsActive], [CreatedDateTime]) VALUES (4, N'Apple', 5, 2, 1, CAST(N'2023-06-30T16:18:50.0720887' AS DateTime2))
GO
INSERT [dbo].[Answers] ([Id], [AnswerText], [QuestionId], [SubjectId], [IsActive], [CreatedDateTime]) VALUES (5, N'key element', 6, 2, 1, CAST(N'2023-07-02T16:25:38.9631587' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Answers] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'02e06955-2d51-4e01-a26b-a1995007c7d2', N'Department', N'DEPARTMENT', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'400f7f18-4cfb-4836-b0a9-5396edbd4d3f', N'Individual', N'INDIVIDUAL', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'bf150825-3df3-4f24-84d2-80d07d6b809e', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'd11fdb2b-7924-43a8-ab0c-c135cd01b23c', N'Student', N'STUDENT', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0b2af7a9-22d6-4e3a-a7f7-ed190775601f', N'400f7f18-4cfb-4836-b0a9-5396edbd4d3f')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8e564598-39f7-4836-b691-53115c4aaa32', N'400f7f18-4cfb-4836-b0a9-5396edbd4d3f')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fc976d1e-350b-46a9-9928-c0432cb73687', N'400f7f18-4cfb-4836-b0a9-5396edbd4d3f')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b869ad92-7f5d-4140-87a6-650d79b1243c', N'bf150825-3df3-4f24-84d2-80d07d6b809e')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'11f6fbaf-8987-45d8-952d-14411ad15afa', N'd11fdb2b-7924-43a8-ab0c-c135cd01b23c')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'74b5f941-268b-4065-b746-70c447178385', N'd11fdb2b-7924-43a8-ab0c-c135cd01b23c')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [City], [Discriminator], [Name], [PostalCode], [State], [StreetAddress], [CompanyId]) VALUES (N'0b2af7a9-22d6-4e3a-a7f7-ed190775601f', N'abc@abc.com', N'ABC@ABC.COM', N'abc@abc.com', N'ABC@ABC.COM', 0, N'AQAAAAIAAYagAAAAEKR4UN1DCgm98bQStdaqcY1jobpmHqEoXM6nw6TL8qRnC15yr8+u1SIEI9Lwznv/OQ==', N'VU776FWTD2JXAQ6ZVDB7YIFEMBVNBE74', N'c663d8dd-9230-4ed2-b962-948cec6107dc', N'12244343434', 0, 0, NULL, 1, 0, N'wewe', N'ApplicationUser', N'sss', N'22323324', N'wew', N'wew', NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [City], [Discriminator], [Name], [PostalCode], [State], [StreetAddress], [CompanyId]) VALUES (N'11f6fbaf-8987-45d8-952d-14411ad15afa', N'student1@aa.com', N'STUDENT1@AA.COM', N'student1@aa.com', N'STUDENT1@AA.COM', 0, N'AQAAAAIAAYagAAAAEKDGPfg7165cb3qBdE8NX7KI/hasFMYz5ehRlDENaT1iahfOJklw0uTKK/gRPXkEUA==', N'OCAPYMFBDUP2EO6WCLPBB5CSPGFNA6ZI', N'4609d83a-e2ef-44c5-8c5c-eb064922daf1', N'2432424234', 0, 0, NULL, 1, 0, N'aaa', N'ApplicationUser', N'aaa', N'4324244', N'aaa', N'aaa', NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [City], [Discriminator], [Name], [PostalCode], [State], [StreetAddress], [CompanyId]) VALUES (N'74b5f941-268b-4065-b746-70c447178385', N'abc@gmail.com', N'ABC@GMAIL.COM', N'abc@gmail.com', N'ABC@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEIWvlpI6NfyHEVMFJMwW/9K04jeqUYHEQ6aKcJMb7Hz0Oam3DNg2IyHWatdyc2Hl3A==', N'ESSY2FBAE3LPSMQHOSH7SL2AZTIJQY6V', N'4e6a8b3e-b668-454e-b03d-2142e27e5780', N'62907890', 0, 0, NULL, 1, 0, N'kolkata', N'ApplicationUser', N'Ankita', N'56789', N'wb', N'kankinara', NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [City], [Discriminator], [Name], [PostalCode], [State], [StreetAddress], [CompanyId]) VALUES (N'8e564598-39f7-4836-b691-53115c4aaa32', N'abac@abc.com', N'ABAC@ABC.COM', N'abac@abc.com', N'ABAC@ABC.COM', 0, N'AQAAAAIAAYagAAAAELQfWel/02lcZq1TsETpfx35Dz4W4uh1Itw3x8Y3kTD9mmczBP/Y7MnADATHXRXiQQ==', N'HSM3DCC4JDKN6MZZ5K6JF3P5C53XY6Y7', N'bb482b9d-7b13-4085-bdf1-9240d4ada01a', N'13131431313', 0, 0, NULL, 1, 0, N'www', N'ApplicationUser', N'abc', N'23232323', N'www', N'www', NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [City], [Discriminator], [Name], [PostalCode], [State], [StreetAddress], [CompanyId]) VALUES (N'b869ad92-7f5d-4140-87a6-650d79b1243c', N'admin@dotnetmastery.com', N'ADMIN@DOTNETMASTERY.COM', N'admin@dotnetmastery.com', N'ADMIN@DOTNETMASTERY.COM', 0, N'AQAAAAIAAYagAAAAEJLLQ+5rsGP0zGCM7zfL7B0g2ajE73XSSNvpKQgDXV7+nmOLeVphvNHEotw8AVUOxA==', N'3PIZ74ICTIW7MDZMIZBZT3YZ4ZDT27VU', N'b926400b-4a7a-425d-8fc7-960c64cf2b35', N'1112223333', 0, 0, NULL, 1, 0, N'Chicago', N'ApplicationUser', N'Bhrugen Patel', N'23422', N'IL', N'test 123 Ave', NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [City], [Discriminator], [Name], [PostalCode], [State], [StreetAddress], [CompanyId]) VALUES (N'fc976d1e-350b-46a9-9928-c0432cb73687', N'test@abc.com', N'TEST@ABC.COM', N'test@abc.com', N'TEST@ABC.COM', 0, N'AQAAAAIAAYagAAAAENlzmr1Roi1jruBTFivKnH29N8g1Nt/DpEog7/mW2GkZ6z4NQYbET/F1OOWjOX2bqQ==', N'FUGL2OCUD2RJLHX45PTCEXZCTMG5DSBZ', N'ea54bffd-1818-4f63-a8a0-d726916f51ea', N'test', 0, 0, NULL, 1, 0, N'test', N'ApplicationUser', N'test', N'34343', N'test', N'test', NULL)
GO
SET IDENTITY_INSERT [dbo].[Choices] ON 
GO
INSERT [dbo].[Choices] ([Id], [ChoiceText], [DispalyOrder], [QuestionId], [IsActive], [CreatedDateTime]) VALUES (1, N'ttt', N'1', 1, 1, CAST(N'2023-05-31T12:55:22.3265116' AS DateTime2))
GO
INSERT [dbo].[Choices] ([Id], [ChoiceText], [DispalyOrder], [QuestionId], [IsActive], [CreatedDateTime]) VALUES (2, N'test', N'2', 1, 1, CAST(N'2023-05-31T12:55:30.6605709' AS DateTime2))
GO
INSERT [dbo].[Choices] ([Id], [ChoiceText], [DispalyOrder], [QuestionId], [IsActive], [CreatedDateTime]) VALUES (3, N'good', N'1', 2, 1, CAST(N'2023-05-31T14:11:05.2798097' AS DateTime2))
GO
INSERT [dbo].[Choices] ([Id], [ChoiceText], [DispalyOrder], [QuestionId], [IsActive], [CreatedDateTime]) VALUES (4, N'ggg', N'2', 2, 1, CAST(N'2023-05-31T14:11:25.6694392' AS DateTime2))
GO
INSERT [dbo].[Choices] ([Id], [ChoiceText], [DispalyOrder], [QuestionId], [IsActive], [CreatedDateTime]) VALUES (5, N'bbb', N'2', 3, 1, CAST(N'2023-05-31T16:10:11.3899769' AS DateTime2))
GO
INSERT [dbo].[Choices] ([Id], [ChoiceText], [DispalyOrder], [QuestionId], [IsActive], [CreatedDateTime]) VALUES (6, N'ggg', N'1', 3, 1, CAST(N'2023-05-31T16:10:30.0876637' AS DateTime2))
GO
INSERT [dbo].[Choices] ([Id], [ChoiceText], [DispalyOrder], [QuestionId], [IsActive], [CreatedDateTime]) VALUES (10, N'abcd', N'3', 1, 1, CAST(N'2023-06-03T14:33:26.1962269' AS DateTime2))
GO
INSERT [dbo].[Choices] ([Id], [ChoiceText], [DispalyOrder], [QuestionId], [IsActive], [CreatedDateTime]) VALUES (11, N'Red', N'3', 3, 1, CAST(N'2023-06-05T22:03:56.3337233' AS DateTime2))
GO
INSERT [dbo].[Choices] ([Id], [ChoiceText], [DispalyOrder], [QuestionId], [IsActive], [CreatedDateTime]) VALUES (12, N'bad', N'3', 2, 1, CAST(N'2023-06-05T22:04:38.3857764' AS DateTime2))
GO
INSERT [dbo].[Choices] ([Id], [ChoiceText], [DispalyOrder], [QuestionId], [IsActive], [CreatedDateTime]) VALUES (13, N'Coke', N'1', 5, 1, CAST(N'2023-06-30T16:19:50.1489444' AS DateTime2))
GO
INSERT [dbo].[Choices] ([Id], [ChoiceText], [DispalyOrder], [QuestionId], [IsActive], [CreatedDateTime]) VALUES (14, N'key element', N'1', 6, 1, CAST(N'2023-07-02T16:26:32.4105561' AS DateTime2))
GO
INSERT [dbo].[Choices] ([Id], [ChoiceText], [DispalyOrder], [QuestionId], [IsActive], [CreatedDateTime]) VALUES (15, N'middle element', N'2', 6, 1, CAST(N'2023-07-02T16:27:48.3159253' AS DateTime2))
GO
INSERT [dbo].[Choices] ([Id], [ChoiceText], [DispalyOrder], [QuestionId], [IsActive], [CreatedDateTime]) VALUES (16, N'first element', N'3 ', 6, 1, CAST(N'2023-07-02T16:28:32.2764247' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Choices] OFF
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 
GO
INSERT [dbo].[Companies] ([Id], [Name], [StreetAddress], [City], [State], [PostalCode], [PhoneNumber]) VALUES (1, N'English', N'Building One', N'Kolkata', NULL, NULL, NULL)
GO
INSERT [dbo].[Companies] ([Id], [Name], [StreetAddress], [City], [State], [PostalCode], [PhoneNumber]) VALUES (2, N'Computer Science', N'Building two', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Companies] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 
GO
INSERT [dbo].[Departments] ([Id], [Name], [PhoneNumber], [IsActive], [CreatedDateTime]) VALUES (8, N'English', N'999990000', 1, CAST(N'2023-06-04T00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[ExamMarks] ON 
GO
INSERT [dbo].[ExamMarks] ([Id], [Marks], [Grade], [Comment], [StudentId], [SubjectId], [IsActive], [CreatedDateTime]) VALUES (15, 100, N'A+', N'OutStanding', 1, 1, 1, CAST(N'2023-07-02T16:48:36.7239457' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[ExamMarks] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 
GO
INSERT [dbo].[Questions] ([Id], [QuestionText], [DisplayOrder], [SubjectId], [IsActive], [CreatedDateTime]) VALUES (1, N'What is vowel', 1, 1, 1, CAST(N'2023-05-31T12:53:59.4723375' AS DateTime2))
GO
INSERT [dbo].[Questions] ([Id], [QuestionText], [DisplayOrder], [SubjectId], [IsActive], [CreatedDateTime]) VALUES (2, N'good', 2, 1, 1, CAST(N'2023-05-31T12:54:14.2600292' AS DateTime2))
GO
INSERT [dbo].[Questions] ([Id], [QuestionText], [DisplayOrder], [SubjectId], [IsActive], [CreatedDateTime]) VALUES (3, N'Color of Sky', 3, 1, 1, CAST(N'2023-05-31T16:08:22.9744014' AS DateTime2))
GO
INSERT [dbo].[Questions] ([Id], [QuestionText], [DisplayOrder], [SubjectId], [IsActive], [CreatedDateTime]) VALUES (5, N'Find the Alphabet', 1, 2, 1, CAST(N'2023-06-30T16:18:03.6008045' AS DateTime2))
GO
INSERT [dbo].[Questions] ([Id], [QuestionText], [DisplayOrder], [SubjectId], [IsActive], [CreatedDateTime]) VALUES (6, N'what is pivot element?', 5, 2, 1, CAST(N'2023-07-02T16:23:21.8691581' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[Standards] ON 
GO
INSERT [dbo].[Standards] ([Id], [Name], [IsActive], [CreatedDateTime]) VALUES (1, N'B.Sc', 1, CAST(N'2023-05-31T12:52:27.1482504' AS DateTime2))
GO
INSERT [dbo].[Standards] ([Id], [Name], [IsActive], [CreatedDateTime]) VALUES (2, N'B.Com', 1, CAST(N'2023-05-31T12:52:36.2494559' AS DateTime2))
GO
INSERT [dbo].[Standards] ([Id], [Name], [IsActive], [CreatedDateTime]) VALUES (4, N'4', 1, CAST(N'2023-07-02T16:20:14.4797424' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Standards] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 
GO
INSERT [dbo].[Students] ([Id], [RollNo], [Name], [Address], [ImageUrl], [StandardId], [IsActive], [CreatedDateTime], [UserId], [Password]) VALUES (1, N'100', N'test', N'<p>Thakur Goli</p>', N'\images\students\8253cbe4-d837-4504-bada-918a36ccf196.jpg', 1, 1, CAST(N'2023-05-31T12:53:07.2432400' AS DateTime2), N'abc', N'abc')
GO
INSERT [dbo].[Students] ([Id], [RollNo], [Name], [Address], [ImageUrl], [StandardId], [IsActive], [CreatedDateTime], [UserId], [Password]) VALUES (2, N'101', N'Neha', N'<p>Kakinara</p>', N'\images\students\289bcc27-9b87-4e89-ad71-6ecb6c5b9d7c.jpg', 1, 1, CAST(N'2023-05-31T12:53:37.8034861' AS DateTime2), N'aaa', N'aaa')
GO
INSERT [dbo].[Students] ([Id], [RollNo], [Name], [Address], [ImageUrl], [StandardId], [IsActive], [CreatedDateTime], [UserId], [Password]) VALUES (3, N'233', N'Test', N'<p>aaa</p>', N'\images\students\c6443b5e-8d96-43dd-adb0-163a36414abf.jpg', 1, 1, CAST(N'2023-06-30T16:21:50.6698610' AS DateTime2), N'test1', N'test1')
GO
INSERT [dbo].[Students] ([Id], [RollNo], [Name], [Address], [ImageUrl], [StandardId], [IsActive], [CreatedDateTime], [UserId], [Password]) VALUES (4, N'220', N'Ankita', N'<p>kankinara</p>', N'\images\students\940e8323-0deb-4304-b9aa-59f64ba92ffc.jpg', 1, 1, CAST(N'2023-07-02T16:45:37.9265479' AS DateTime2), N'abc2', N'abc2')
GO
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentSubjects] ON 
GO
INSERT [dbo].[StudentSubjects] ([Id], [DisplayOrder], [ExamCode], [StudentId], [SubjectId], [IsActive], [CreatedDateTime], [TotalQuestion]) VALUES (1, 1, N'EXAM01', 1, 1, 1, CAST(N'2023-05-31T13:01:42.2947202' AS DateTime2), 3)
GO
INSERT [dbo].[StudentSubjects] ([Id], [DisplayOrder], [ExamCode], [StudentId], [SubjectId], [IsActive], [CreatedDateTime], [TotalQuestion]) VALUES (2, 1, N'Ex02', 2, 1, 1, CAST(N'2023-05-31T16:11:41.0636691' AS DateTime2), 3)
GO
INSERT [dbo].[StudentSubjects] ([Id], [DisplayOrder], [ExamCode], [StudentId], [SubjectId], [IsActive], [CreatedDateTime], [TotalQuestion]) VALUES (3, 4, N'ex345', 2, 2, 1, CAST(N'2023-07-02T16:30:18.9489987' AS DateTime2), 1)
GO
INSERT [dbo].[StudentSubjects] ([Id], [DisplayOrder], [ExamCode], [StudentId], [SubjectId], [IsActive], [CreatedDateTime], [TotalQuestion]) VALUES (4, 6, N'Ex234', 4, 1, 1, CAST(N'2023-07-02T16:47:37.8912757' AS DateTime2), 3)
GO
SET IDENTITY_INSERT [dbo].[StudentSubjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 
GO
INSERT [dbo].[Subjects] ([Id], [Name], [DisplayOrder], [IsActive], [CreatedDateTime]) VALUES (1, N'English', 1, 1, CAST(N'2023-05-31T12:51:57.4108314' AS DateTime2))
GO
INSERT [dbo].[Subjects] ([Id], [Name], [DisplayOrder], [IsActive], [CreatedDateTime]) VALUES (2, N'Computer', 2, 1, CAST(N'2023-05-31T12:52:10.7637184' AS DateTime2))
GO
INSERT [dbo].[Subjects] ([Id], [Name], [DisplayOrder], [IsActive], [CreatedDateTime]) VALUES (3, N'Physics', 3, 1, CAST(N'2023-05-31T16:04:02.5287263' AS DateTime2))
GO
INSERT [dbo].[Subjects] ([Id], [Name], [DisplayOrder], [IsActive], [CreatedDateTime]) VALUES (5, N'Chemistry', 4, 1, CAST(N'2023-06-08T20:32:33.6730863' AS DateTime2))
GO
INSERT [dbo].[Subjects] ([Id], [Name], [DisplayOrder], [IsActive], [CreatedDateTime]) VALUES (6, N'hindi', 5, 1, CAST(N'2023-07-02T16:22:11.8812450' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
/****** Object:  Index [IX_Answers_QuestionId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_Answers_QuestionId] ON [dbo].[Answers]
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Answers_SubjectId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_Answers_SubjectId] ON [dbo].[Answers]
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 02-07-2023 18:11:11 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUsers_CompanyId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUsers_CompanyId] ON [dbo].[AspNetUsers]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 02-07-2023 18:11:11 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Choices_QuestionId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_Choices_QuestionId] ON [dbo].[Choices]
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExamMarks_StudentId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_ExamMarks_StudentId] ON [dbo].[ExamMarks]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExamMarks_SubjectId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_ExamMarks_SubjectId] ON [dbo].[ExamMarks]
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_OrderId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_OrderId] ON [dbo].[OrderDetail]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_ProductId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_ProductId] ON [dbo].[OrderDetail]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_OrderHeaders_ApplicationUserId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_OrderHeaders_ApplicationUserId] ON [dbo].[OrderHeaders]
(
	[ApplicationUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CoverTypeId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_Products_CoverTypeId] ON [dbo].[Products]
(
	[CoverTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Questions_SubjectId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_Questions_SubjectId] ON [dbo].[Questions]
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ShoppingCarts_ApplicationUserId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_ShoppingCarts_ApplicationUserId] ON [dbo].[ShoppingCarts]
(
	[ApplicationUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ShoppingCarts_ProductId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_ShoppingCarts_ProductId] ON [dbo].[ShoppingCarts]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Students_StandardId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_Students_StandardId] ON [dbo].[Students]
(
	[StandardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentSubjects_StudentId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_StudentSubjects_StudentId] ON [dbo].[StudentSubjects]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentSubjects_SubjectId]    Script Date: 02-07-2023 18:11:11 ******/
CREATE NONCLUSTERED INDEX [IX_StudentSubjects_SubjectId] ON [dbo].[StudentSubjects]
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[StudentSubjects] ADD  CONSTRAINT [DF_StudentSubjects_TotalQuestion]  DEFAULT ((0)) FOR [TotalQuestion]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions_QuestionId] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Questions_QuestionId]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Subjects_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([Id])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Subjects_SubjectId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Companies_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Companies_CompanyId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Choices]  WITH CHECK ADD  CONSTRAINT [FK_Choices_Questions_QuestionId] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Choices] CHECK CONSTRAINT [FK_Choices_Questions_QuestionId]
GO
ALTER TABLE [dbo].[ExamMarks]  WITH CHECK ADD  CONSTRAINT [FK_ExamMarks_Students_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[ExamMarks] CHECK CONSTRAINT [FK_ExamMarks_Students_StudentId]
GO
ALTER TABLE [dbo].[ExamMarks]  WITH CHECK ADD  CONSTRAINT [FK_ExamMarks_Subjects_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([Id])
GO
ALTER TABLE [dbo].[ExamMarks] CHECK CONSTRAINT [FK_ExamMarks_Subjects_SubjectId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_OrderHeaders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[OrderHeaders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_OrderHeaders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Products_ProductId]
GO
ALTER TABLE [dbo].[OrderHeaders]  WITH CHECK ADD  CONSTRAINT [FK_OrderHeaders_AspNetUsers_ApplicationUserId] FOREIGN KEY([ApplicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderHeaders] CHECK CONSTRAINT [FK_OrderHeaders_AspNetUsers_ApplicationUserId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_CoverTypes_CoverTypeId] FOREIGN KEY([CoverTypeId])
REFERENCES [dbo].[CoverTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_CoverTypes_CoverTypeId]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Subjects_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([Id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Subjects_SubjectId]
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCarts_AspNetUsers_ApplicationUserId] FOREIGN KEY([ApplicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [FK_ShoppingCarts_AspNetUsers_ApplicationUserId]
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCarts_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [FK_ShoppingCarts_Products_ProductId]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Standards_StandardId] FOREIGN KEY([StandardId])
REFERENCES [dbo].[Standards] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Standards_StandardId]
GO
ALTER TABLE [dbo].[StudentSubjects]  WITH CHECK ADD  CONSTRAINT [FK_StudentSubjects_Students_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentSubjects] CHECK CONSTRAINT [FK_StudentSubjects_Students_StudentId]
GO
ALTER TABLE [dbo].[StudentSubjects]  WITH CHECK ADD  CONSTRAINT [FK_StudentSubjects_Subjects_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([Id])
GO
ALTER TABLE [dbo].[StudentSubjects] CHECK CONSTRAINT [FK_StudentSubjects_Subjects_SubjectId]
GO
USE [master]
GO
ALTER DATABASE [ExamDb] SET  READ_WRITE 
GO
