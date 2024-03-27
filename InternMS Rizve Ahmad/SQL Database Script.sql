USE [master]
GO
/****** Object:  Database [Intern]    Script Date: 6/14/2023 10:48:08 AM ******/
CREATE DATABASE [Intern]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Intern', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Intern.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Intern_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Intern_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Intern] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Intern].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Intern] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Intern] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Intern] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Intern] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Intern] SET ARITHABORT OFF 
GO
ALTER DATABASE [Intern] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Intern] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Intern] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Intern] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Intern] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Intern] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Intern] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Intern] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Intern] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Intern] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Intern] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Intern] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Intern] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Intern] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Intern] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Intern] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Intern] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Intern] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Intern] SET  MULTI_USER 
GO
ALTER DATABASE [Intern] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Intern] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Intern] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Intern] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Intern] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Intern] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Intern] SET QUERY_STORE = ON
GO
ALTER DATABASE [Intern] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Intern]
GO
/****** Object:  Table [dbo].[AssignTask]    Script Date: 6/14/2023 10:48:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignTask](
	[Date] [date] NOT NULL,
	[InternId] [int] NULL,
	[TaskDescription] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 6/14/2023 10:48:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[Date] [date] NOT NULL,
	[InternId] [int] NOT NULL,
	[IsPresent] [nvarchar](50) NULL,
	[TimeIn] [time](7) NULL,
	[TimeOut] [time](7) NULL,
	[IsCameLate] [bit] NULL,
	[IsLeaveEarly] [bit] NULL,
	[Duration] [time](0) NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[Date] ASC,
	[InternId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 6/14/2023 10:48:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Districts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[DivisionId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Divisions]    Script Date: 6/14/2023 10:48:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Divisions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HR]    Script Date: 6/14/2023 10:48:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Password] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Intern]    Script Date: 6/14/2023 10:48:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Intern](
	[Internid] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](20) NOT NULL,
	[NID] [varchar](20) NOT NULL,
	[Gender] [varchar](6) NOT NULL,
	[Varsity_name] [varchar](50) NOT NULL,
	[Duration] [varchar](10) NOT NULL,
	[Religion] [varchar](10) NOT NULL,
	[Marital_status] [varchar](20) NOT NULL,
	[Present_address_house] [varchar](50) NOT NULL,
	[Parmanent_address_house] [varchar](50) NOT NULL,
	[Father_name] [varchar](20) NOT NULL,
	[Mother_name] [varchar](20) NOT NULL,
	[Facebook_URL] [varchar](20) NULL,
	[Linkedin_URL] [varchar](20) NULL,
	[TBL_Brunch] [varchar](50) NOT NULL,
	[TBL_Department] [varchar](20) NOT NULL,
	[Apply_Date] [datetime] NULL,
	[Status] [varchar](20) NULL,
	[Supervisor_id] [int] NULL,
	[DOB] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Internid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supervisors]    Script Date: 6/14/2023 10:48:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supervisors](
	[Supervisor_id] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [varchar](20) NOT NULL,
	[Gender] [varchar](6) NOT NULL,
	[Position] [varchar](20) NOT NULL,
	[TBL_Brunch] [varchar](20) NOT NULL,
	[TBL_Department] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Supervisor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Thanas]    Script Date: 6/14/2023 10:48:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thanas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[DistrictId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AssignTask] ([Date], [InternId], [TaskDescription]) VALUES (CAST(N'2023-05-16' AS Date), 2, N'IT System')
GO
INSERT [dbo].[AssignTask] ([Date], [InternId], [TaskDescription]) VALUES (CAST(N'2023-05-17' AS Date), 2, N'IT Security')
GO
INSERT [dbo].[AssignTask] ([Date], [InternId], [TaskDescription]) VALUES (CAST(N'2023-05-18' AS Date), 1, N'CBS')
GO
INSERT [dbo].[AssignTask] ([Date], [InternId], [TaskDescription]) VALUES (CAST(N'2023-05-26' AS Date), 1, N'In-house Development')
GO
INSERT [dbo].[AssignTask] ([Date], [InternId], [TaskDescription]) VALUES (CAST(N'2023-05-24' AS Date), 1, N'CBS Class')
GO
INSERT [dbo].[AssignTask] ([Date], [InternId], [TaskDescription]) VALUES (CAST(N'2023-05-25' AS Date), 4, N'In house')
GO
INSERT [dbo].[Attendance] ([Date], [InternId], [IsPresent], [TimeIn], [TimeOut], [IsCameLate], [IsLeaveEarly], [Duration]) VALUES (CAST(N'2023-05-15' AS Date), 1, N'Present', CAST(N'10:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, 0, CAST(N'07:00:00' AS Time))
GO
INSERT [dbo].[Attendance] ([Date], [InternId], [IsPresent], [TimeIn], [TimeOut], [IsCameLate], [IsLeaveEarly], [Duration]) VALUES (CAST(N'2023-05-15' AS Date), 2, N'Present', CAST(N'10:14:00' AS Time), CAST(N'17:44:00' AS Time), 1, 0, CAST(N'07:30:00' AS Time))
GO
INSERT [dbo].[Attendance] ([Date], [InternId], [IsPresent], [TimeIn], [TimeOut], [IsCameLate], [IsLeaveEarly], [Duration]) VALUES (CAST(N'2023-05-16' AS Date), 1, N'Absent', NULL, NULL, 0, 0, NULL)
GO
INSERT [dbo].[Attendance] ([Date], [InternId], [IsPresent], [TimeIn], [TimeOut], [IsCameLate], [IsLeaveEarly], [Duration]) VALUES (CAST(N'2023-05-17' AS Date), 1, N'Present', CAST(N'10:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, 0, CAST(N'07:00:00' AS Time))
GO
INSERT [dbo].[Attendance] ([Date], [InternId], [IsPresent], [TimeIn], [TimeOut], [IsCameLate], [IsLeaveEarly], [Duration]) VALUES (CAST(N'2023-05-21' AS Date), 1, N'Present', CAST(N'09:40:00' AS Time), CAST(N'18:28:00' AS Time), 0, 0, CAST(N'08:48:00' AS Time))
GO
INSERT [dbo].[Attendance] ([Date], [InternId], [IsPresent], [TimeIn], [TimeOut], [IsCameLate], [IsLeaveEarly], [Duration]) VALUES (CAST(N'2023-05-21' AS Date), 2, N'Absent', NULL, NULL, 0, 0, NULL)
GO
INSERT [dbo].[Attendance] ([Date], [InternId], [IsPresent], [TimeIn], [TimeOut], [IsCameLate], [IsLeaveEarly], [Duration]) VALUES (CAST(N'2023-05-21' AS Date), 4, N'Absent', NULL, NULL, 0, 0, NULL)
GO
INSERT [dbo].[Attendance] ([Date], [InternId], [IsPresent], [TimeIn], [TimeOut], [IsCameLate], [IsLeaveEarly], [Duration]) VALUES (CAST(N'2023-05-22' AS Date), 1, N'Present', CAST(N'10:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, 0, CAST(N'07:00:00' AS Time))
GO
INSERT [dbo].[Attendance] ([Date], [InternId], [IsPresent], [TimeIn], [TimeOut], [IsCameLate], [IsLeaveEarly], [Duration]) VALUES (CAST(N'2023-05-23' AS Date), 1, N'Absent', NULL, NULL, 0, 0, NULL)
GO
INSERT [dbo].[Attendance] ([Date], [InternId], [IsPresent], [TimeIn], [TimeOut], [IsCameLate], [IsLeaveEarly], [Duration]) VALUES (CAST(N'2023-05-23' AS Date), 4, N'Absent', NULL, NULL, 0, 0, NULL)
GO
INSERT [dbo].[Attendance] ([Date], [InternId], [IsPresent], [TimeIn], [TimeOut], [IsCameLate], [IsLeaveEarly], [Duration]) VALUES (CAST(N'2023-05-24' AS Date), 1, N'Present', CAST(N'14:21:00' AS Time), CAST(N'17:22:00' AS Time), 1, 0, CAST(N'03:01:00' AS Time))
GO
SET IDENTITY_INSERT [dbo].[Districts] ON 
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (1, N'Dhaka North', 1)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (2, N'Dhaka South', 1)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (3, N'Faridpur', 1)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (4, N'Gazipur', 1)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (5, N'Gopalganj', 1)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (6, N'Kishoreganj', 1)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (7, N'Madaripur', 1)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (8, N'Manikganj', 1)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (9, N'Munshiganj', 1)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (10, N'Narayanganj', 1)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (11, N'Narsingdi', 1)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (12, N'Rajbari', 1)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (13, N'Shariatpur', 1)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (14, N'Tangail', 1)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (15, N'Barguna', 2)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (16, N'Barisal', 2)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (17, N'Bhola', 2)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (18, N'Jhalokati', 2)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (19, N'Patuakhali', 2)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (20, N'Pirojpur', 2)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (21, N'Bandarban', 3)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (22, N'Brahmanbaria', 3)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (23, N'Chandpur', 3)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (24, N'Chittagong', 3)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (25, N'Comilla', 3)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (26, N'Cox’s Bazar', 3)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (27, N'Feni', 3)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (28, N'Khagrachhari', 3)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (29, N'Lakshmipur', 3)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (30, N'Noakhali', 3)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (31, N'Rangamati', 3)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (32, N'Bagerhat', 4)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (33, N'Chuadanga', 4)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (34, N'Jessore', 4)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (35, N'Jhenaidah', 4)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (36, N'Khulna', 4)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (37, N'Kushtia', 4)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (38, N'Magura', 4)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (39, N'Meherpur', 4)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (40, N'Narail', 4)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (41, N'Satkhira', 4)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (43, N'Sherpur', 5)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (44, N'Netrokona', 5)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (45, N'Mymensingh', 5)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (46, N'Jamalpur', 5)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (47, N'Bogra', 6)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (48, N'Joypurhat', 6)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (49, N'Naogaon', 6)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (50, N'Natore', 6)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (51, N'Chapainawabganj', 6)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (52, N'Pabna', 6)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (53, N'Rajshahi', 6)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (54, N'Sirajganj', 6)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (55, N'Thakurgaon', 7)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (56, N'Rangpur', 7)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (57, N'Panchagarh', 7)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (58, N'Nilphamari', 7)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (59, N'Lalmonirhat', 7)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (60, N'Kurigram', 7)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (61, N'Gaibandha', 7)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (62, N'Dinajpur', 7)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (63, N'Habiganj', 8)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (64, N'Moulvibazar', 8)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (65, N'Sunamganj', 8)
GO
INSERT [dbo].[Districts] ([id], [name], [DivisionId]) VALUES (66, N'Sylhet', 8)
GO
SET IDENTITY_INSERT [dbo].[Districts] OFF
GO
SET IDENTITY_INSERT [dbo].[Divisions] ON 
GO
INSERT [dbo].[Divisions] ([id], [name]) VALUES (1, N'Dhaka')
GO
INSERT [dbo].[Divisions] ([id], [name]) VALUES (2, N'Barisal')
GO
INSERT [dbo].[Divisions] ([id], [name]) VALUES (3, N'Chittagong')
GO
INSERT [dbo].[Divisions] ([id], [name]) VALUES (4, N'Khulna')
GO
INSERT [dbo].[Divisions] ([id], [name]) VALUES (5, N'Mymensingh')
GO
INSERT [dbo].[Divisions] ([id], [name]) VALUES (6, N'Rajshahi')
GO
INSERT [dbo].[Divisions] ([id], [name]) VALUES (7, N'Rangpur')
GO
INSERT [dbo].[Divisions] ([id], [name]) VALUES (8, N'Sylhet')
GO
SET IDENTITY_INSERT [dbo].[Divisions] OFF
GO
SET IDENTITY_INSERT [dbo].[Intern] ON 
GO
INSERT [dbo].[Intern] ([Internid], [Name], [Password], [Email], [Phone], [NID], [Gender], [Varsity_name], [Duration], [Religion], [Marital_status], [Present_address_house], [Parmanent_address_house], [Father_name], [Mother_name], [Facebook_URL], [Linkedin_URL], [TBL_Brunch], [TBL_Department], [Apply_Date], [Status], [Supervisor_id], [DOB]) VALUES (1, N'Rizve Ahmad', N'11345', N'rizverizu1999@gmail.com', N'01316967805', N'123456789', N'Male', N'NUB', N'3 Months', N'Islam', N'Single', N'Kamarpara', N'Satkhira', N'Nazrul Islam', N'Parvin Nahar', N's', N's', N'Head Office', N'IT', CAST(N'2023-04-30T14:19:37.287' AS DateTime), N'Approved', 220, CAST(N'2001-07-20' AS Date))
GO
INSERT [dbo].[Intern] ([Internid], [Name], [Password], [Email], [Phone], [NID], [Gender], [Varsity_name], [Duration], [Religion], [Marital_status], [Present_address_house], [Parmanent_address_house], [Father_name], [Mother_name], [Facebook_URL], [Linkedin_URL], [TBL_Brunch], [TBL_Department], [Apply_Date], [Status], [Supervisor_id], [DOB]) VALUES (2, N'Rifat', N'12587421', N'Rifat@gmail.com', N'01998230032', N'258778522', N'Male', N'East West University', N'3 Months', N'Islam', N'Single', N'Jahangir Gate', N'Khulna', N'Rafi', N'Surovi', N'S', N'S', N'Head Office', N'IT', CAST(N'2023-05-07T14:16:29.360' AS DateTime), N'Finished', 220, CAST(N'2000-01-21' AS Date))
GO
INSERT [dbo].[Intern] ([Internid], [Name], [Password], [Email], [Phone], [NID], [Gender], [Varsity_name], [Duration], [Religion], [Marital_status], [Present_address_house], [Parmanent_address_house], [Father_name], [Mother_name], [Facebook_URL], [Linkedin_URL], [TBL_Brunch], [TBL_Department], [Apply_Date], [Status], [Supervisor_id], [DOB]) VALUES (3, N'Era', N'145873', N'era23@gamil.com', N'01316967805', N'12578954455', N'Female', N'AIUB', N'3 Months', N'Islam', N'Single', N'Mirpur 14', N'Satkhira', N'Ashik', N'Japan', N'a', N'e', N'Shaheed Salahuddin Cantonment Branch', N'IT', CAST(N'2023-05-07T14:44:47.420' AS DateTime), N'Approved', NULL, CAST(N'1998-12-11' AS Date))
GO
INSERT [dbo].[Intern] ([Internid], [Name], [Password], [Email], [Phone], [NID], [Gender], [Varsity_name], [Duration], [Religion], [Marital_status], [Present_address_house], [Parmanent_address_house], [Father_name], [Mother_name], [Facebook_URL], [Linkedin_URL], [TBL_Brunch], [TBL_Department], [Apply_Date], [Status], [Supervisor_id], [DOB]) VALUES (4, N'Ruma', N'1234', N'rum@gmail.com', N'0177789564', N'014545544', N'Female', N'EWU', N'3 Months', N'Islam', N'Married', N'Narayanganj', N'Narayanganj', N'Mr. Father', N'Mrs. Mother', N's', N'x', N'Head Office', N'IT', CAST(N'2023-05-08T16:33:28.107' AS DateTime), N'Approved', 220, CAST(N'1999-09-05' AS Date))
GO
INSERT [dbo].[Intern] ([Internid], [Name], [Password], [Email], [Phone], [NID], [Gender], [Varsity_name], [Duration], [Religion], [Marital_status], [Present_address_house], [Parmanent_address_house], [Father_name], [Mother_name], [Facebook_URL], [Linkedin_URL], [TBL_Brunch], [TBL_Department], [Apply_Date], [Status], [Supervisor_id], [DOB]) VALUES (5, N'Rizu Sardar', N'12345', N'ss@gmail.com', N'01916058662', N'123456789', N'Male', N'NUB', N'3 Months', N'ISlam', N'Single', N'Mirpur 12', N'Mirpur 12', N'Nazrul', N'Parvin', N'as', N'as', N'Head Office', N'IT', CAST(N'2023-05-10T15:15:43.900' AS DateTime), N'Applied', NULL, CAST(N'2000-03-27' AS Date))
GO
INSERT [dbo].[Intern] ([Internid], [Name], [Password], [Email], [Phone], [NID], [Gender], [Varsity_name], [Duration], [Religion], [Marital_status], [Present_address_house], [Parmanent_address_house], [Father_name], [Mother_name], [Facebook_URL], [Linkedin_URL], [TBL_Brunch], [TBL_Department], [Apply_Date], [Status], [Supervisor_id], [DOB]) VALUES (6, N'Farzana Hayath', N'Far.zana', N'farzanahayath2001@gmail.com', N'01916058662', N'12', N'Female', N'DU', N'1 Month', N'Islam', N'Married', N'Kamarpara, Uttara, Dhaka', N'Parulia, Satkhira', N'Nazrul Islam', N'Parvin Nahar', N'f', N'f', N'Head Office', N'IT', CAST(N'2023-05-16T14:06:02.930' AS DateTime), N'Applied', NULL, CAST(N'2023-05-16' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Intern] OFF
GO
INSERT [dbo].[Supervisors] ([Supervisor_id], [Name], [Password], [Email], [Gender], [Position], [TBL_Brunch], [TBL_Department]) VALUES (220, N'Suvro', N'123', N'suvro@gmail.com', N'Male', N'D', N'Head Office', N'IT')
GO
INSERT [dbo].[Supervisors] ([Supervisor_id], [Name], [Password], [Email], [Gender], [Position], [TBL_Brunch], [TBL_Department]) VALUES (227, N'Era', N'145', N'era23@gamil.com', N'Female', N'A', N'Principal Branch', N'IT')
GO
INSERT [dbo].[Supervisors] ([Supervisor_id], [Name], [Password], [Email], [Gender], [Position], [TBL_Brunch], [TBL_Department]) VALUES (333, N'Rifat', N'1235', N'Rifat@gmail.com', N'Male', N'X', N'Shaheed Salahuddin C', N'IT')
GO
INSERT [dbo].[Supervisors] ([Supervisor_id], [Name], [Password], [Email], [Gender], [Position], [TBL_Brunch], [TBL_Department]) VALUES (365, N'Rizve Ahmad', N'123', N'rizverizu1999@gmail.', N'Male', N'A', N'SKB Branch', N'IT')
GO
INSERT [dbo].[Supervisors] ([Supervisor_id], [Name], [Password], [Email], [Gender], [Position], [TBL_Brunch], [TBL_Department]) VALUES (510, N'Asha', N'123', N'asha123@gmail.com', N'Female', N'X', N'Mymensingh Cantt. Br', N'IT')
GO
SET IDENTITY_INSERT [dbo].[Thanas] ON 
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (1, N'Abdullahpur', 1)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (2, N'Agargaon', 1)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (3, N'NUBananiLL', 1)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (4, N'Bawnia', 1)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (5, N'Cantonment area', 1)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (6, N'Dakshinkhan', 1)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (7, N'Gulshan', 1)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (8, N'Hatirjheel Lake', 1)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (9, N'Kafrul', 1)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (10, N'Kazipara', 1)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (11, N'Khilkhet', 1)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (12, N'Mohakhali', 1)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (13, N'Pallabi', 1)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (14, N'Sher-e-Bangla Nagar', 1)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (15, N'Uttara', 1)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (16, N'Dania', 2)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (17, N'Demra', 2)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (18, N'Hazaribagh', 2)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (19, N'Islampur', 2)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (20, N'Jatrabari', 2)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (21, N'Jurain', 2)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (22, N'Kamalapur', 2)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (23, N'Kamrangirchar', 2)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (24, N'Kotwali', 2)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (25, N'Lalbagh', 2)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (26, N'Matuail', 2)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (27, N'Motijheel', 2)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (28, N'Paltan', 2)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (29, N'Ramna', 2)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (30, N'Sadarghat', 2)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (31, N'Shahbagh', 2)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (32, N'Shyampur', 2)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (33, N'Sutrapur', 2)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (34, N'Saltha', 3)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (35, N'Sadarpur', 3)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (36, N'Nagarkanda', 3)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (37, N'Madhukhali', 3)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (38, N'Faridpur Sadar', 3)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (39, N'Charbhadrasan', 3)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (40, N'Boalmari', 3)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (41, N'Bhanga', 3)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (42, N'Alfadanga', 3)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (43, N'Borasi', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (44, N'Baultali', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (45, N'Chandra Dighalia', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (46, N'Durgapur', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (47, N'Gobra', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (48, N'Gopinathpur', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (49, N'Haridaspur', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (50, N'Jalalabad', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (51, N'Kajulia', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (52, N'Karpara', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (53, N'Kati', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (54, N'Latifpur', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (55, N'Majhigati', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (56, N'Nizra', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (57, N'Paikkandi', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (58, N'Raghunathpur', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (59, N'Sahapur', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (60, N'Satpar', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (61, N'Suktail', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (62, N'Ulpur ', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (63, N'Upafi', 5)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (66, N'Kalkini', 7)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (67, N'Madaripur', 7)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (68, N'Rajoir', 7)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (69, N'Shibchar', 7)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (70, N'Badda', 2)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (71, N'Gazipur Sadar', 4)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (72, N'Kapasia', 4)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (73, N'Tongi town', 4)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (74, N'Sripur', 4)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (75, N'Kaliganj', 4)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (76, N'Kaliakior', 4)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (77, N'Gopalganj Sadar', 6)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (78, N'Kashiani', 6)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (79, N'Kotalipara', 6)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (80, N'Muksudpur', 6)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (81, N'Tungipara', 6)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (82, N'Daulatpur', 8)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (83, N'Ghior', 8)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (84, N'Harirampur', 8)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (85, N'Manikganj Sadar', 8)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (86, N'Saturia', 8)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (87, N'Shivalaya', 8)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (88, N'Singair', 8)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (89, N'Tongibari', 9)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (90, N'Sreenagar', 9)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (91, N'Serajdikhan', 9)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (92, N'Munshiganj Sadar', 9)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (93, N'Lauhajong', 9)
GO
INSERT [dbo].[Thanas] ([id], [name], [DistrictId]) VALUES (94, N'Gazaria', 9)
GO
SET IDENTITY_INSERT [dbo].[Thanas] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Intern__A9D10534AE8D2DA1]    Script Date: 6/14/2023 10:48:10 AM ******/
ALTER TABLE [dbo].[Intern] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Supervis__A9D10534128C74D0]    Script Date: 6/14/2023 10:48:10 AM ******/
ALTER TABLE [dbo].[Supervisors] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Intern] ADD  DEFAULT (getdate()) FOR [Apply_Date]
GO
ALTER TABLE [dbo].[Intern] ADD  CONSTRAINT [DF_Stutas]  DEFAULT ('Applied') FOR [Status]
GO
ALTER TABLE [dbo].[AssignTask]  WITH CHECK ADD  CONSTRAINT [FK_AssignTask_Intern] FOREIGN KEY([InternId])
REFERENCES [dbo].[Intern] ([Internid])
GO
ALTER TABLE [dbo].[AssignTask] CHECK CONSTRAINT [FK_AssignTask_Intern]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Intern] FOREIGN KEY([InternId])
REFERENCES [dbo].[Intern] ([Internid])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Intern]
GO
ALTER TABLE [dbo].[Districts]  WITH CHECK ADD FOREIGN KEY([DivisionId])
REFERENCES [dbo].[Divisions] ([id])
GO
ALTER TABLE [dbo].[Intern]  WITH CHECK ADD FOREIGN KEY([Supervisor_id])
REFERENCES [dbo].[Supervisors] ([Supervisor_id])
GO
ALTER TABLE [dbo].[Thanas]  WITH CHECK ADD FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Districts] ([id])
GO
/****** Object:  StoredProcedure [dbo].[AddAttendance]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[AddAttendance]
    @Date DATE,
    @InternId INT,
    @IsPresent NVARCHAR(50),
    @TimeIn TIME = NULL,
    @TimeOut TIME = NULL,
    @IsCameLate BIT = 0,
    @IsLeaveEarly BIT = 0,
    @Duration TIME(0) = NULL
AS
BEGIN
    INSERT INTO Attendance (Date, InternId, IsPresent, TimeIn, TimeOut, IsCameLate, IsLeaveEarly, Duration)
    VALUES (@Date, @InternId, @IsPresent, @TimeIn, @TimeOut, @IsCameLate, @IsLeaveEarly, @Duration)
END;
GO
/****** Object:  StoredProcedure [dbo].[Approve]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Approve]
(
    @Internid INT
)
AS
BEGIN
    UPDATE Intern
    SET Status = 'Approved'
    WHERE Internid=@Internid;
END
GO
/****** Object:  StoredProcedure [dbo].[Approve1]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Approve1]
  @Internid int
AS
BEGIN
  -- Declare variables to store the intern department and branch
  DECLARE @Department varchar(50);
  DECLARE @Branch varchar(50);

  -- Get the intern department and branch from the interns table
  SELECT @Department = TBL_Department, @Branch = TBL_Brunch FROM Intern WHERE Internid = @Internid;

  -- Update the intern status to approved
  UPDATE Intern SET status = 'Approved' WHERE Internid = @Internid;

  -- Update the Supervisor_id from intern with the Supervisor_idfrom the supervisors table
  -- where the department and branch match with the intern
  UPDATE Intern SET Supervisor_id= (SELECT Supervisor_id FROM Supervisors 
                               WHERE TBL_Department = @Department AND TBL_Brunch= @Branch)
  WHERE Internid = @Internid;
END;
GO
/****** Object:  StoredProcedure [dbo].[AssignTaskProcedure]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AssignTaskProcedure]
    @InternId INT,
    @Date DATE,
    @TaskDescription VARCHAR(MAX)
AS
BEGIN
    INSERT INTO AssignTask (Date, InternId, TaskDescription)
    VALUES (@Date, @InternId, @TaskDescription);
END;
GO
/****** Object:  StoredProcedure [dbo].[CountAppliedInterns]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountAppliedInterns]
AS
BEGIN
    SELECT COUNT(*) AS TotalAppliedInterns
    FROM Intern
    WHERE Status = 'Applied'
END
GO
/****** Object:  StoredProcedure [dbo].[CountApprovedInterns]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountApprovedInterns]
AS
BEGIN
    SELECT COUNT(*) AS TotalApprovedInterns
    FROM Intern
    WHERE Status = 'Approved'
END
GO
/****** Object:  StoredProcedure [dbo].[CountFinishedInterns]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountFinishedInterns]
AS
BEGIN
    SELECT COUNT(*) AS TotalFinishedInterns
    FROM Intern
    WHERE Status = 'Finished'
END

GO
/****** Object:  StoredProcedure [dbo].[CountTotalInterns]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountTotalInterns]
AS
BEGIN
    SELECT COUNT(*) AS TotalInterns FROM Intern;
END
GO
/****** Object:  StoredProcedure [dbo].[CountTotalSupervisors]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountTotalSupervisors]
AS
BEGIN
    SELECT COUNT(*) AS TotalSupervisors FROM Supervisors;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteIntern]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteIntern]
(
    @InternId INT
)
AS
BEGIN
    DELETE FROM  Intern WHERE Internid = @Internid
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteSupervisors]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DeleteSupervisors]

(     

   @Supervisor_id int     

)     

as      

begin     

   Delete from Supervisors where Supervisor_id=@Supervisor_id     

End
GO
/****** Object:  StoredProcedure [dbo].[GetAppliedInternsBySupervisorID]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAppliedInternsBySupervisorID]
AS
BEGIN
    -- Select all the columns from Intern table
    -- where status is 'Applied' and Supervisor_id is 220
    SELECT * FROM Intern 
    WHERE status = 'Applied' AND Supervisor_id = 220;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAssignedTasks]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure to fetch assigned tasks
CREATE PROCEDURE [dbo].[GetAssignedTasks]
    @InternId INT
AS
BEGIN
    SELECT Date, TaskDescription
    FROM TaskAssignments
    WHERE InternId = @InternId;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAttendanceByInternId]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAttendanceByInternId]
    @InternId INT
AS
BEGIN
    SELECT Date, IsPresent
    FROM Attendance
    WHERE InternId = @InternId
END
GO
/****** Object:  StoredProcedure [dbo].[GetInternByFinished]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInternByFinished]

AS
BEGIN
    SELECT *  FROM Intern WHERE  Status ='Finished';

END
GO
/****** Object:  StoredProcedure [dbo].[GetInternById]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInternById]
(
    @Internid INT
)
AS
BEGIN
    SELECT *  FROM Intern WHERE  Internid = @Internid
END
GO
/****** Object:  StoredProcedure [dbo].[GetInternBySupervisorID]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInternBySupervisorID]

AS
BEGIN
    SELECT *  FROM Intern WHERE  Supervisor_id = 220;
END
GO
/****** Object:  StoredProcedure [dbo].[GetInternMSDashboard]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInternMSDashboard]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        (SELECT COUNT(*) FROM Intern WHERE Status = 'Applied') AS TotalAppliedInterns,
        (SELECT COUNT(*) FROM Intern WHERE Status = 'Approved') AS TotalApprovedInterns,
        (SELECT COUNT(*) FROM Intern WHERE Status = 'Finished') AS TotalFinishedInterns,
        (SELECT COUNT(*) FROM Intern) AS TotalInterns,
        (SELECT COUNT(*) FROM Supervisors) AS TotalSupervisors
END
GO
/****** Object:  StoredProcedure [dbo].[GetSuperviseDashboard]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSuperviseDashboard]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        --(SELECT COUNT(*) FROM Intern WHERE Status = 'Processing' AND Supervisor_id = 220) AS WaitingInterns,
        (SELECT COUNT(*) FROM Intern WHERE Status = 'Approved' AND Supervisor_id = 220) AS TotalInterns,
        (SELECT COUNT(*) FROM Intern WHERE Status = 'Finished' AND Supervisor_id = 220) AS FinishedInterns
END
GO
/****** Object:  StoredProcedure [dbo].[GetSupervisorsById]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[GetSupervisorsById]
(    
    @Supervisor_id int
)    
as     
Begin     
    SELECT * FROM Supervisors WHERE Supervisor_id= @Supervisor_id
End
GO
/****** Object:  StoredProcedure [dbo].[GetTaskById]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTaskById]
(
    @Internid INT
)
AS
BEGIN
    SELECT Date, TaskDescription
    FROM AssignTask
    WHERE InternId = @InternId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetTasksByInternId]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTasksByInternId]
    @InternId INT
AS
BEGIN
    SELECT Date, TaskDescription,InternId
    FROM AssignTask
    WHERE InternId = @InternId
END
GO
/****** Object:  StoredProcedure [dbo].[InsertIntern]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertIntern]
(
    @Name VARCHAR(20),
    @Password VARCHAR(50),
    @Email VARCHAR(50),
    @Phone VARCHAR(20),
    @NID VARCHAR(20),
    @Gender VARCHAR(10),
	@DOB date,
    @Varsity_name varchar(50),
    @Duration varchar(10),
    @Religion VARCHAR(20),
    @Marital_status VARCHAR(20),
    @Present_address_house VARCHAR(50),
    @Parmanent_address_house VARCHAR(50),
    @Father_name VARCHAR(50),
    @Mother_name VARCHAR(50),
    @Facebook_URL VARCHAR(100),
    @Linkedin_URL VARCHAR(100),
    @TBL_Brunch VARCHAR(50),
    @TBL_Department VARCHAR(50)
)
AS
BEGIN
    INSERT INTO Intern
    (
        Name, 
        Password, 
        Email, 
        Phone, 
        NID, 
        Gender,
		DOB,
        Varsity_name, 
        Duration,
        Religion, 
        Marital_status,
        Present_address_house, 
        Parmanent_address_house, 
        Father_name, 
        Mother_name, 
        Facebook_URL, 
        Linkedin_URL, 
        TBL_Brunch, 
        TBL_Department
    )
    VALUES 
    (
        @Name, 
        @Password, 
        @Email, 
        @Phone, 
        @NID, 
        @Gender,
		@DOB,
        @Varsity_name, 
        @Duration,
        @Religion, 
        @Marital_status,  
        @Present_address_house, 
        @Parmanent_address_house, 
        @Father_name, 
        @Mother_name, 
        @Facebook_URL, 
        @Linkedin_URL, 
        @TBL_Brunch, 
        @TBL_Department
    )
END
GO
/****** Object:  StoredProcedure [dbo].[InsertSupervisor]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[InsertSupervisor]  

(   

    @Supervisor_id int , 
    @Name varchar(20),
    @Password varchar(50),
    @Email varchar(20),
    @Gender varchar(6),
    @Position varchar(20),
    @TBL_Brunch varchar(20),
    @TBL_Department varchar(20)   

)   

as    

Begin    

    Insert into Supervisors(Supervisor_id, Name, Password, Email, Gender, Position, TBL_Brunch, TBL_Department)    

    Values (@Supervisor_id, @Name, @Password, @Email, @Gender, @Position, @TBL_Brunch, @TBL_Department)    

End
GO
/****** Object:  StoredProcedure [dbo].[UpdateIntern]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateIntern]
(
    @Internid INT,
    @Name VARCHAR(20),
    @Password VARCHAR(50),
    @Email VARCHAR(50),
    @Phone VARCHAR(20),
    @NID VARCHAR(20),
    @Gender VARCHAR(10),
	@DOB date,
    @Varsity_name varchar(50),
    @Duration varchar(10),
    @Religion VARCHAR(20),
    @Marital_status VARCHAR(20),
    @Present_address_house VARCHAR(50),
    @Parmanent_address_house VARCHAR(50),
    @Father_name VARCHAR(50),
    @Mother_name VARCHAR(50),
    @Facebook_URL VARCHAR(100),
    @Linkedin_URL VARCHAR(100),
    @TBL_Brunch VARCHAR(50),
    @TBL_Department VARCHAR(50)
)
AS
BEGIN
    UPDATE Intern
    SET 
        Name = @Name, 
        Password = @Password, 
        Email = @Email, 
        Phone = @Phone, 
        NID = @NID, 
        Gender = @Gender, 
		DOB = @DOB,
        Varsity_name = @Varsity_name,
        Duration = @Duration, 
        Religion = @Religion, 
        Marital_status = @Marital_status, 
        Present_address_house = @Present_address_house, 
        Parmanent_address_house = @Parmanent_address_house, 
        Father_name = @Father_name, 
        Mother_name = @Mother_name, 
        Facebook_URL = @Facebook_URL, 
        Linkedin_URL = @Linkedin_URL, 
        TBL_Brunch = @TBL_Brunch, 
        TBL_Department = @TBL_Department
    WHERE 
        Internid = @Internid
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateStatusFinished]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStatusFinished]
(
    @Internid INT
)
AS
BEGIN
    UPDATE Intern
    SET Status = 'Finished'
    WHERE Internid=@Internid;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateSupervisors]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[UpdateSupervisors]    

(     

@Supervisor_id int,   

@Name varchar(20),   

@Password varchar(50),   

@Email varchar(20),   

@Gender varchar(6),   

@Position varchar(20),   

@TBL_Brunch varchar(20),   

@TBL_Department varchar(20)  

)     

as     

begin     

   Update Supervisors     

   Set


                   Supervisor_id= @Supervisor_id,
                   Name=@Name,
                   Password=@Password,
                   Email=@Email,
                   Gender=@Gender,
                   Position=@Position,
                   TBL_Brunch=@TBL_Brunch,
                   TBL_Department=@TBL_Department     

   where Supervisor_id=@Supervisor_id     

End
GO
/****** Object:  StoredProcedure [dbo].[UpdateWaitingList]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateWaitingList]
  @Internid int
AS
BEGIN
  -- Declare variables to store the intern department and branch
  DECLARE @Department varchar(50);
  DECLARE @Branch varchar(50);

  -- Get the intern department and branch from the interns table
  SELECT @Department = TBL_Department, @Branch = TBL_Brunch FROM Intern WHERE Internid = @Internid;

  -- Update the intern status to approved
  UPDATE Intern SET status = 'Processing' WHERE Internid = @Internid;

  -- Update the Supervisor_id from intern with the Supervisor_idfrom the supervisors table
  -- where the department and branch match with the intern
  UPDATE Intern SET Supervisor_id= (SELECT Supervisor_id FROM Supervisors 
                               WHERE TBL_Department = @Department AND TBL_Brunch= @Branch)
  WHERE Internid = @Internid;
END;
GO
/****** Object:  StoredProcedure [dbo].[ViewAllIntern]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewAllIntern]
AS
BEGIN
    SELECT 
        Internid,
        Name, 
        Password, 
        Email, 
        Phone, 
        NID, 
        Gender,
		DOB,
        Varsity_name, 
        Duration, 
        Religion, 
        Marital_status, 
        Present_address_house,  
        Parmanent_address_house, 
        Father_name, 
        Mother_name, 
        Facebook_URL, 
        Linkedin_URL, 
        TBL_Brunch, 
        TBL_Department,
         Apply_date,
         Status

    FROM 
        Intern
END
GO
/****** Object:  StoredProcedure [dbo].[ViewAllSupervisors]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[ViewAllSupervisors] 

as   

Begin   

    select

                   Supervisor_id,
                   Name,
                   Password,
                   Email,
                   Gender,
                   Position,
                   TBL_Brunch,
                   TBL_Department

    from Supervisors  

End
GO
/****** Object:  StoredProcedure [dbo].[ViewAppliedIntern]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[ViewAppliedIntern]
AS
BEGIN
SELECT 
        Internid,
        Name, 
        Password, 
        Email, 
        Phone, 
        NID, 
        Gender,
		DOB,
        Varsity_name, 
        Duration, 
        Religion, 
        Marital_status, 
        Present_address_house,  
        Parmanent_address_house, 
        Father_name, 
        Mother_name, 
        Facebook_URL, 
        Linkedin_URL, 
        TBL_Brunch, 
        TBL_Department,
         Apply_date,
         Status

    FROM 
        Intern WHERE Status = 'Applied';
END
GO
/****** Object:  StoredProcedure [dbo].[ViewApprovedIntern]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[ViewApprovedIntern]
AS
BEGIN
SELECT 
        Internid,
        Name, 
        Password, 
        Email, 
        Phone, 
        NID, 
        Gender,
		DOB,
        Varsity_name, 
        Duration, 
        Religion, 
        Marital_status, 
        Present_address_house,  
        Parmanent_address_house, 
        Father_name, 
        Mother_name, 
        Facebook_URL, 
        Linkedin_URL, 
        TBL_Brunch, 
        TBL_Department,
         Apply_date,
         Status

    FROM 
        Intern WHERE Status = 'Approved';
END
GO
/****** Object:  StoredProcedure [dbo].[ViewApprovedInternBySupervisor]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ViewApprovedInternBySupervisor]
AS
BEGIN
SELECT * FROM 
        Intern WHERE Status = 'Approved' AND  Supervisor_id = 220;
END
GO
/****** Object:  StoredProcedure [dbo].[ViewFinishedIntern]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[ViewFinishedIntern]
AS
BEGIN
SELECT 
        Internid,
        Name, 
        Password, 
        Email, 
        Phone, 
        NID, 
        Gender,
		DOB,
        Varsity_name, 
        Duration, 
        Religion, 
        Marital_status, 
        Present_address_house,  
        Parmanent_address_house, 
        Father_name, 
        Mother_name, 
        Facebook_URL, 
        Linkedin_URL, 
        TBL_Brunch, 
        TBL_Department,
         Apply_date,
         Status

    FROM 
        Intern WHERE Status = 'Finished';
END
GO
/****** Object:  StoredProcedure [dbo].[ViewFinishedInternsWithSupervisor]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewFinishedInternsWithSupervisor]
AS
BEGIN
  -- Select all the columns from the interns table
  -- where the status is approved and sup_id matches the parameter value
  SELECT * FROM Intern 
  WHERE status = 'Finished' AND Supervisor_id = 220;
END;
GO
/****** Object:  StoredProcedure [dbo].[ViewInternsWithSupervisor]    Script Date: 6/14/2023 10:48:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ViewInternsWithSupervisor]
  @Supervisor_id int
AS
BEGIN
  -- Select all the columns from the interns table
  -- where the status is approved and sup_id matches the parameter value
  SELECT * FROM Intern 
  WHERE status = 'Applied' AND Supervisor_id = @Supervisor_id;
END;
GO
USE [master]
GO
ALTER DATABASE [Intern] SET  READ_WRITE 
GO
