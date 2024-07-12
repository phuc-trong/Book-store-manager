USE [master]
GO
/****** Object:  Database [GR3]    Script Date: 05-Nov-23 16:08:15 ******/
CREATE DATABASE [GR3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GR3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\GR3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GR3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\GR3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GR3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GR3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GR3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GR3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GR3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GR3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GR3] SET ARITHABORT OFF 
GO
ALTER DATABASE [GR3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GR3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GR3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GR3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GR3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GR3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GR3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GR3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GR3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GR3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GR3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GR3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GR3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GR3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GR3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GR3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GR3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GR3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GR3] SET  MULTI_USER 
GO
ALTER DATABASE [GR3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GR3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GR3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GR3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GR3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GR3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GR3] SET QUERY_STORE = ON
GO
ALTER DATABASE [GR3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [GR3]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 05-Nov-23 16:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cus_phone] [varchar](10) NULL,
	[boo_id] [varchar](10) NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 05-Nov-23 16:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cat_id] [varchar](10) NOT NULL,
	[cat_name] [nvarchar](20) NOT NULL,
	[cat_status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 05-Nov-23 16:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[cus_phone] [varchar](10) NOT NULL,
	[cus_name] [nvarchar](50) NOT NULL,
	[cus_password] [varchar](32) NOT NULL,
	[cus_email] [varchar](50) NOT NULL,
	[cus_address] [nvarchar](50) NOT NULL,
	[cus_birthday] [date] NOT NULL,
	[cus_create] [date] NOT NULL,
	[cus_status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cus_phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 05-Nov-23 16:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[emp_phone] [varchar](10) NOT NULL,
	[emp_name] [nvarchar](50) NOT NULL,
	[emp_password] [varchar](32) NOT NULL,
	[emp_email] [varchar](50) NOT NULL,
	[emp_address] [nvarchar](50) NOT NULL,
	[emp_birthday] [date] NOT NULL,
	[emp_create] [date] NOT NULL,
	[emp_status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 05-Nov-23 16:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[boo_id] [varchar](10) NOT NULL,
	[cat_id] [varchar](10) NOT NULL,
	[boo_name] [nvarchar](50) NOT NULL,
	[boo_price] [decimal](10, 2) NOT NULL,
	[boo_sale] [decimal](10, 2) NOT NULL,
	[boo_description] [nvarchar](200) NOT NULL,
	[boo_status] [varchar](10) NOT NULL,
	[boo_img] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[boo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 05-Nov-23 16:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 05-Nov-23 16:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ord_id] [varchar](10) NOT NULL,
	[cus_phone] [varchar](10) NOT NULL,
	[emp_phone] [varchar](10) NULL,
	[ord_date] [date] NOT NULL,
	[ord_type] [varchar](10) NOT NULL,
	[ord_status] [varchar](10) NOT NULL,
	[ord_pay] [varchar](7) NOT NULL,
	[ord_note] [nvarchar](200) NOT NULL,
	[ord_total] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ord_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 05-Nov-23 16:08:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ord_id] [varchar](10) NULL,
	[boo_id] [varchar](10) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([cat_id], [cat_name], [cat_status]) VALUES (N'CAT001', N'Children books', N'Available')
INSERT [dbo].[Category] ([cat_id], [cat_name], [cat_status]) VALUES (N'CAT002', N'Comic', N'Available')
INSERT [dbo].[Category] ([cat_id], [cat_name], [cat_status]) VALUES (N'CAT003', N'Textbook', N'Available')
INSERT [dbo].[Category] ([cat_id], [cat_name], [cat_status]) VALUES (N'CAT004', N'Psychology books', N'Available')
INSERT [dbo].[Category] ([cat_id], [cat_name], [cat_status]) VALUES (N'CAT005', N'Fables', N'Available')
INSERT [dbo].[Category] ([cat_id], [cat_name], [cat_status]) VALUES (N'CAT006', N'Novel', N'Available')
INSERT [dbo].[Category] ([cat_id], [cat_name], [cat_status]) VALUES (N'CAT007', N'Combo', N'Available')
GO
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456780', N'Sophia Clark', N'87E897E3B54A405DA144968B2CA19B45', N'cus10@gmail.com', N'777 Cedar St, Parkville', CAST(N'1996-01-03' AS Date), CAST(N'2023-09-25' AS Date), N'Deleted')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456781', N'Ethan Harris', N'5D69DD95AC183C9643780ED7027D128A', N'cus9@gmail.com', N'666 Fir St, Riverside', CAST(N'1994-04-05' AS Date), CAST(N'2023-10-19' AS Date), N'Deleted')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456782', N'Ava Martinez', N'B25EF06BE3B6948C0BC431DA46C2C738', N'cus8@gmail.com', N'555 Redwood St, Lakeside', CAST(N'1987-06-08' AS Date), CAST(N'2023-05-05' AS Date), N'Blocked')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456783', N'James Taylor', N'00CDB7BB942CF6B290CEB97D6ACA64A3', N'cus7@gmail.com', N'444 Birch St, Mountainview', CAST(N'1991-08-18' AS Date), CAST(N'2023-03-01' AS Date), N'Available')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456784', N'Olivia Brown', N'218DD27AEBECCECAE69AD8408D9A36BF', N'cus6@gmail.com', N'333 Cedar St, Hillside', CAST(N'1993-07-12' AS Date), CAST(N'2023-02-19' AS Date), N'Blocked')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456785', N'Daniel Lee', N'DB0EDD04AAAC4506F7EDAB03AC855D56', N'cus5@gmail.com', N'222 Pine St, Forestville', CAST(N'1992-03-25' AS Date), CAST(N'2023-11-04' AS Date), N'Available')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456786', N'Emily Wilson', N'34CC93ECE0BA9E3F6F235D4AF979B16C', N'cus4@gmail.com', N'101 Maple St, Hamletown', CAST(N'1988-11-30' AS Date), CAST(N'2023-01-20' AS Date), N'Available')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456787', N'Michael Davis', N'819B0643D6B89DC9B579FDFC9094F28E', N'cus3@gmail.com', N'789 Oak St, Villageton', CAST(N'1995-02-10' AS Date), CAST(N'2023-10-15' AS Date), N'Available')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456788', N'Sarah Johnson', N'6CB75F652A9B52798EB6CF2201057C73', N'cus2@gmail.com', N'456 Elm St, Townsville', CAST(N'1985-09-20' AS Date), CAST(N'2023-09-11' AS Date), N'Available')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0123456789', N'John Smith', N'5F4DCC3B5AA765D61D8327DEB882CF99', N'khanhnguyennguyen2003@gmail.com', N'123 Main St, Cityville', CAST(N'1990-05-15' AS Date), CAST(N'2023-10-15' AS Date), N'Blocked')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0939248045', N'Dang', N'BBB8AAE57C104CDA40C93843AD5E6DB8', N'com3@gmail.com', N'5420 Can Tho St, Serviceton', CAST(N'1983-02-28' AS Date), CAST(N'2024-05-26' AS Date), N'Available')
INSERT [dbo].[Customer] ([cus_phone], [cus_name], [cus_password], [cus_email], [cus_address], [cus_birthday], [cus_create], [cus_status]) VALUES (N'0706730860', N'Sang', N'0D777E9E30B918E9034AB610712C90CF', N'com4@gmail.com', N'2314 Can Tho St, Protocol', CAST(N'1980-04-18' AS Date), CAST(N'2024-05-26' AS Date), N'Available')

GO
INSERT [dbo].[Employee] ([emp_phone], [emp_name], [emp_password], [emp_email], [emp_address], [emp_birthday], [emp_create], [emp_status]) VALUES (N'0987654321', N'David Anderson', N'7C6A180B36896A0A8C02787EEAFB0E4C', N'khanhnguyennguyen2003@gmail.com', N'1234 Employee St, Stafftown', CAST(N'1980-04-22' AS Date), CAST(N'2022-09-25' AS Date), N'Available')
INSERT [dbo].[Employee] ([emp_phone], [emp_name], [emp_password], [emp_email], [emp_address], [emp_birthday], [emp_create], [emp_status]) VALUES (N'0987654322', N'Jennifer White', N'6CB75F652A9B52798EB6CF2201057C73', N'emp1@gmail.com', N'5678 Worker St, Laborville', CAST(N'1982-08-15' AS Date), CAST(N'2022-09-25' AS Date), N'Available')
INSERT [dbo].[Employee] ([emp_phone], [emp_name], [emp_password], [emp_email], [emp_address], [emp_birthday], [emp_create], [emp_status]) VALUES (N'0987654323', N'Robert Martin', N'819B0643D6B89DC9B579FDFC9094F28E', N'emp2@gmail.com', N'9876 Staff St, Employeeville', CAST(N'1975-11-10' AS Date), CAST(N'2022-09-25' AS Date), N'Available')
INSERT [dbo].[Employee] ([emp_phone], [emp_name], [emp_password], [emp_email], [emp_address], [emp_birthday], [emp_create], [emp_status]) VALUES (N'0987654324', N'Mary Wilson', N'34CC93ECE0BA9E3F6F235D4AF979B16C', N'emp3@gmail.com', N'5420 Service St, Serviceton', CAST(N'1983-02-28' AS Date), CAST(N'2022-09-25' AS Date), N'Available')
INSERT [dbo].[Employee] ([emp_phone], [emp_name], [emp_password], [emp_email], [emp_address], [emp_birthday], [emp_create], [emp_status]) VALUES (N'0987654325', N'Richard Brown', N'DB0EDD04AAAC4506F7EDAB03AC855D56', N'emp4@gmail.com', N'8765 Crew St, Workville', CAST(N'1978-07-07' AS Date), CAST(N'2022-09-25' AS Date), N'Deleted')
INSERT [dbo].[Employee] ([emp_phone], [emp_name], [emp_password], [emp_email], [emp_address], [emp_birthday], [emp_create], [emp_status]) VALUES (N'0', N'', N'', N'', N'', CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date), N'Deleted')
INSERT [dbo].[Employee] ([emp_phone], [emp_name], [emp_password], [emp_email], [emp_address], [emp_birthday], [emp_create], [emp_status]) VALUES (N'0939248045', N'Dang', N'BBB8AAE57C104CDA40C93843AD5E6DB8', N'com3@gmail.com', N'5420 Can Tho St, Serviceton', CAST(N'1983-02-28' AS Date), CAST(N'2024-05-26' AS Date), N'Available')
INSERT [dbo].[Employee] ([emp_phone], [emp_name], [emp_password], [emp_email], [emp_address], [emp_birthday], [emp_create], [emp_status]) VALUES (N'0706730860', N'Sang', N'0D777E9E30B918E9034AB610712C90CF', N'com4@gmail.com', N'2314 Can Tho St, Protocol', CAST(N'1980-04-18' AS Date), CAST(N'2024-05-26' AS Date), N'Available')

GO
INSERT [dbo].[Book] ([boo_id], [cat_id], [boo_name], [boo_price], [boo_sale], [boo_description], [boo_status], [boo_img]) VALUES (N'BOOK001', N'CAT004', N'Nhat Ky Trong Tu', CAST(0.24 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'alo alo', N'Available', N'https://i.ibb.co/F3vbZqW/Nhat-Ky-Trong-Tu.jpg')
INSERT [dbo].[Book] ([boo_id], [cat_id], [boo_name], [boo_price], [boo_sale], [boo_description], [boo_status], [boo_img]) VALUES (N'BOOK003', N'CAT001', N'Toi Tai Gioi Ban Cung Vay', CAST(2.49 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), N'Sang', N'Available', N'https://i.ibb.co/QpQDPGZ/Toi-Tai-Gioi.jpg')
INSERT [dbo].[Book] ([boo_id], [cat_id], [boo_name], [boo_price], [boo_sale], [boo_description], [boo_status], [boo_img]) VALUES (N'BOOK004', N'CAT002', N'Phieu Luu Trong Kinh Doanh', CAST(3.49 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), N'Dang', N'Available', N'https://i.ibb.co/M2wFht3/Phieu-Luu-Trong-Kinh-Doanh.jpg')
INSERT [dbo].[Book] ([boo_id], [cat_id], [boo_name], [boo_price], [boo_sale], [boo_description], [boo_status], [boo_img]) VALUES (N'BOOK005', N'CAT002', N'Thuat Doc Nguoi', CAST(3.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Tin', N'Available', N'https://i.ibb.co/nDQt8zY/Thuat-Doc-Nguoi.jpg')
INSERT [dbo].[Book] ([boo_id], [cat_id], [boo_name], [boo_price], [boo_sale], [boo_description], [boo_status], [boo_img]) VALUES (N'BOOK006', N'CAT003', N'Co Tich Thang Canh', CAST(1.49 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Hiep', N'Available', N'https://i.ibb.co/qJRDmVt/Co-Tich-Thang-Canh.png')
INSERT [dbo].[Book] ([boo_id], [cat_id], [boo_name], [boo_price], [boo_sale], [boo_description], [boo_status], [boo_img]) VALUES (N'BOOK007', N'CAT003', N'Viet Nam Su Luoc', CAST(1.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Trong', N'Available', N'https://i.ibb.co/WkzjJV6/Viet-Nam-Su-Luoc.jpg')
INSERT [dbo].[Book] ([boo_id], [cat_id], [boo_name], [boo_price], [boo_sale], [boo_description], [boo_status], [boo_img]) VALUES (N'BOOK008', N'CAT004', N'Nhung Tam Long Cao Ca', CAST(0.99 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), N'Huy', N'Available', N'https://i.ibb.co/n0hgwV1/Nhung-Tam-Long-Cao-Ca.jpg')
INSERT [dbo].[Book] ([boo_id], [cat_id], [boo_name], [boo_price], [boo_sale], [boo_description], [boo_status], [boo_img]) VALUES (N'BOOK009', N'CAT003', N'Nghe Thuat Giao Tiep', CAST(2.49 AS Decimal(10, 2)), CAST(13.00 AS Decimal(10, 2)), N'gr3', N'Available', N'https://i.ibb.co/F0y4062/Nghe-Thuat-Giao-Tiep.png')
INSERT [dbo].[Book] ([boo_id], [cat_id], [boo_name], [boo_price], [boo_sale], [boo_description], [boo_status], [boo_img]) VALUES (N'BOOK010', N'CAT006', N'Su Du Day', CAST(0.99 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), N'hello', N'Available', N'https://i.ibb.co/vdtd8RG/SuDuDay.jpg')
INSERT [dbo].[Book] ([boo_id], [cat_id], [boo_name], [boo_price], [boo_sale], [boo_description], [boo_status], [boo_img]) VALUES (N'BOOK011', N'CAT003', N'Hoang Tu Be', CAST(2.49 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), N'Khanh', N'Available', N'https://i.ibb.co/xsVJtz0/HoanTuBe.jpg')
INSERT [dbo].[Book] ([boo_id], [cat_id], [boo_name], [boo_price], [boo_sale], [boo_description], [boo_status], [boo_img]) VALUES (N'BOOK012', N'CAT005', N'That Bai De Thanh Cong', CAST(0.49 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), N'VanSang', N'Available', N'https://i.ibb.co/S3CwmNS/That-Bai-De-Thanh-Cong.jpg')
INSERT [dbo].[Book] ([boo_id], [cat_id], [boo_name], [boo_price], [boo_sale], [boo_description], [boo_status], [boo_img]) VALUES (N'BOOK013', N'CAT005', N'Khu Vuon Trong Chai', CAST(0.49 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'lolo', N'Available', N'https://i.ibb.co/tXWrzbP/Khu-Vuon-Trong-Chai.jpg')
INSERT [dbo].[Book] ([boo_id], [cat_id], [boo_name], [boo_price], [boo_sale], [boo_description], [boo_status], [boo_img]) VALUES (N'BOOK014', N'CAT005', N'Dac Nhan Tam', CAST(0.49 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'hihi', N'Available', N'https://i.ibb.co/GHyydrs/Dac-Nhan-Tam.jpg')
INSERT [dbo].[Book] ([boo_id], [cat_id], [boo_name], [boo_price], [boo_sale], [boo_description], [boo_status], [boo_img]) VALUES (N'BOOK015', N'CAT005', N'Giai Ma Hanh Vi', CAST(0.49 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'ala', N'Sold Out', N'https://i.ibb.co/YQY2BQv/Giai-Ma-Hanh-Vi.jpg')
INSERT [dbo].[Book] ([boo_id], [cat_id], [boo_name], [boo_price], [boo_sale], [boo_description], [boo_status], [boo_img]) VALUES (N'BOOK016', N'CAT005', N'Cuop Bien', CAST(0.74 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), N'Luffy', N'Available', N'https://i.ibb.co/HnRZSfv/CuopBien.jpg')
GO
INSERT [dbo].[Manager] ([username], [password]) VALUES (N'1', N'C4CA4238A0B923820DCC509A6F75849B')
INSERT [dbo].[Manager] ([username], [password]) VALUES (N'admin', N'5F4DCC3B5AA765D61D8327DEB882CF99')
GO
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000001', N'0123456789', N'0987654321', CAST(N'2023-10-18' AS Date), N'Delivery', N'Completed', N'COD', N'Haha', CAST(4.22 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000002', N'0123456789', N'0987654322', CAST(N'2023-10-18' AS Date), N'Takeout', N'Completed', N'COD', N'ahah', CAST(7.98 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000003', N'0123456788', N'0987654323', CAST(N'2023-10-19' AS Date), N'Delivery', N'Completed', N'COD', N'nono', CAST(5.97 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000004', N'0123456788', N'0987654321', CAST(N'2023-10-19' AS Date), N'Takeout', N'Cancelled', N'COD', N'eeeee', CAST(2.17 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000005', N'0123456788', N'0987654324', CAST(N'2023-10-19' AS Date), N'Takeout', N'Rejected', N'COD', N'', CAST(2.88 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000006', N'0123456787', N'0987654325', CAST(N'2023-10-19' AS Date), N'Delivery', N'Completed', N'COD', N'', CAST(5.96 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000007', N'0123456787', N'0987654322', CAST(N'2023-10-19' AS Date), N'Takeout', N'Completed', N'COD', N'', CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000008', N'0123456787', N'0987654323', CAST(N'2023-10-20' AS Date), N'Takeout', N'Rejected', N'COD', N'Sang', CAST(2.98 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000009', N'0123456786', N'0987654321', CAST(N'2023-10-20' AS Date), N'Takeout', N'Completed', N'Banking', N'', CAST(2.61 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000010', N'0123456785', N'0987654325', CAST(N'2023-10-20' AS Date), N'Delivery', N'Completed', N'COD', N'', CAST(0.98 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000011', N'0123456785', N'0987654324', CAST(N'2023-10-20' AS Date), N'Delivery', N'Completed', N'Banking', N'Nhanh nhanh', CAST(0.48 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000012', N'0123456784', N'0987654323', CAST(N'2023-10-20' AS Date), N'Takeout', N'Completed', N'COD', N'', CAST(6.91 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000013', N'0123456783', N'0987654321', CAST(N'2023-10-20' AS Date), N'Takeout', N'Waiting', N'COD', N'aaaaaa', CAST(2.45 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000014', N'0123456782', N'0987654324', CAST(N'2023-10-20' AS Date), N'Delivery', N'Waiting', N'Banking', N'', CAST(7.96 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000015', N'0123456780', N'0987654322', CAST(N'2023-10-20' AS Date), N'Delivery', N'Preparing', N'Banking', N'lolo', CAST(1.20 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000016', N'0123456780', N'0987654325', CAST(N'2023-10-20' AS Date), N'Takeout', N'Completed', N'COD', N'', CAST(5.97 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([ord_id], [cus_phone], [emp_phone], [ord_date], [ord_type], [ord_status], [ord_pay], [ord_note], [ord_total]) VALUES (N'ORD0000017', N'0123456780', N'0987654321', CAST(N'2023-10-20' AS Date), N'Takeout', N'Preparing', N'COD', N'', CAST(2.88 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetail] ([ord_id], [boo_id], [quantity], [price]) VALUES (N'ORD0000002', N'BOOK005', 2, CAST(3.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [boo_id], [quantity], [price]) VALUES (N'ORD0000003', N'BOOK007', 3, CAST(1.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [boo_id], [quantity], [price]) VALUES (N'ORD0000004', N'BOOK009', 1, CAST(2.17 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [boo_id], [quantity], [price]) VALUES (N'ORD0000007', N'BOOK003', 2, CAST(2.37 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [boo_id], [quantity], [price]) VALUES (N'ORD0000007', N'BOOK004', 3, CAST(3.42 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [boo_id], [quantity], [price]) VALUES (N'ORD0000006', N'BOOK006', 4, CAST(1.49 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [boo_id], [quantity], [price]) VALUES (N'ORD0000008', N'BOOK006', 2, CAST(1.49 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [boo_id], [quantity], [price]) VALUES (N'ORD0000009', N'BOOK008', 3, CAST(0.87 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [boo_id], [quantity], [price]) VALUES (N'ORD0000010', N'BOOK013', 2, CAST(0.49 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [boo_id], [quantity], [price]) VALUES (N'ORD0000011', N'BOOK012', 1, CAST(0.48 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [boo_id], [quantity], [price]) VALUES (N'ORD0000012', N'BOOK016', 2, CAST(0.73 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [boo_id], [quantity], [price]) VALUES (N'ORD0000012', N'BOOK015', 3, CAST(0.49 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [boo_id], [quantity], [price]) VALUES (N'ORD0000012', N'BOOK002', 2, CAST(1.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [boo_id], [quantity], [price]) VALUES (N'ORD0000013', N'BOOK014', 5, CAST(0.49 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [boo_id], [quantity], [price]) VALUES (N'ORD0000014', N'BOOK007', 4, CAST(1.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [boo_id], [quantity], [price]) VALUES (N'ORD0000015', N'BOOK001', 5, CAST(0.24 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [boo_id], [quantity], [price]) VALUES (N'ORD0000016', N'BOOK002', 3, CAST(1.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetail] ([ord_id], [boo_id], [quantity], [price]) VALUES (N'ORD0000017', N'BOOK010', 3, CAST(0.96 AS Decimal(10, 2)))
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([cus_phone])
REFERENCES [dbo].[Customer] ([cus_phone])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([boo_id])
REFERENCES [dbo].[Book] ([boo_id])
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([cat_id])
REFERENCES [dbo].[Category] ([cat_id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([cus_phone])
REFERENCES [dbo].[Customer] ([cus_phone])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([emp_phone])
REFERENCES [dbo].[Employee] ([emp_phone])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([boo_id])
REFERENCES [dbo].[Book] ([boo_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ord_id])
REFERENCES [dbo].[Order] ([ord_id])
GO
/****** Object:  Trigger [dbo].[BookStatusUpdateTrigger]    Script Date: 05-Nov-23 16:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[BookStatusUpdateTrigger]
ON [dbo].[Book]
AFTER UPDATE
AS
BEGIN
    IF UPDATE(boo_status)
    BEGIN
        -- Xóa boo_id t? b?ng Cart khi boo_status trong b?ng Book là 'Sold Out' ho?c 'Deleted'
        DELETE FROM Cart
        WHERE boo_id IN (
            SELECT d.boo_id
            FROM deleted AS d
            INNER JOIN inserted AS i ON d.boo_id = i.boo_id
            WHERE i.boo_status IN ('Sold Out', 'Deleted')
        );
    END
END;
GO
ALTER TABLE [dbo].[Book] ENABLE TRIGGER [BookStatusUpdateTrigger]
GO
USE [master]
GO
ALTER DATABASE [GR3] SET  READ_WRITE 
GO
