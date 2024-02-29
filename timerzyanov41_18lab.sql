USE [master]
GO
/****** Object:  Database [Timerzyanov41]    Script Date: 20.02.2024 14:36:27 ******/
CREATE DATABASE [Timerzyanov41]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Timerzyanov41', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Timerzyanov41.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Timerzyanov41_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Timerzyanov41_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Timerzyanov41].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Timerzyanov41] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Timerzyanov41] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Timerzyanov41] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Timerzyanov41] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Timerzyanov41] SET ARITHABORT OFF 
GO
ALTER DATABASE [Timerzyanov41] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Timerzyanov41] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Timerzyanov41] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Timerzyanov41] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Timerzyanov41] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Timerzyanov41] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Timerzyanov41] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Timerzyanov41] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Timerzyanov41] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Timerzyanov41] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Timerzyanov41] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Timerzyanov41] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Timerzyanov41] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Timerzyanov41] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Timerzyanov41] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Timerzyanov41] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Timerzyanov41] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Timerzyanov41] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Timerzyanov41] SET  MULTI_USER 
GO
ALTER DATABASE [Timerzyanov41] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Timerzyanov41] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Timerzyanov41] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Timerzyanov41] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Timerzyanov41] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Timerzyanov41', N'ON'
GO
USE [Timerzyanov41]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 20.02.2024 14:36:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NULL,
	[OrderDeliveryDate] [date] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[OrderClientID] [int] NULL,
	[OrderReceiveCode] [nchar](10) NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__Order__C3905BAFAEA62C82] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 20.02.2024 14:36:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[Amount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 20.02.2024 14:36:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PostIndex] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Street] [nvarchar](max) NULL,
	[HomeNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_PickupPoint] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20.02.2024 14:36:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductEdIzm] [nvarchar](max) NULL,
	[ProductCost] [decimal](19, 2) NOT NULL,
	[ProductDiscountMax] [tinyint] NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductImporter] [nvarchar](max) NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductImage] [nvarchar](max) NULL,
 CONSTRAINT [PK__Product__2EA7DCD59D0E755D] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 20.02.2024 14:36:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 20.02.2024 14:36:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientID], [OrderReceiveCode], [OrderStatus]) VALUES (1, CAST(N'2022-05-16' AS Date), CAST(N'2022-05-22' AS Date), 10, 101, N'911       ', N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientID], [OrderReceiveCode], [OrderStatus]) VALUES (2, CAST(N'2022-05-17' AS Date), CAST(N'2022-05-23' AS Date), 5, 102, N'912       ', N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientID], [OrderReceiveCode], [OrderStatus]) VALUES (3, CAST(N'2022-05-18' AS Date), CAST(N'2022-05-24' AS Date), 11, 104, N'913       ', N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientID], [OrderReceiveCode], [OrderStatus]) VALUES (4, CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), 10, NULL, N'914       ', N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientID], [OrderReceiveCode], [OrderStatus]) VALUES (5, CAST(N'2022-05-20' AS Date), CAST(N'2022-05-26' AS Date), 1, NULL, N'915       ', N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientID], [OrderReceiveCode], [OrderStatus]) VALUES (6, CAST(N'2022-05-21' AS Date), CAST(N'2022-05-27' AS Date), 32, NULL, N'916       ', N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientID], [OrderReceiveCode], [OrderStatus]) VALUES (7, CAST(N'2022-05-22' AS Date), CAST(N'2022-05-28' AS Date), 20, 103, N'917       ', N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientID], [OrderReceiveCode], [OrderStatus]) VALUES (8, CAST(N'2022-05-23' AS Date), CAST(N'2022-05-29' AS Date), 34, NULL, N'918       ', N'Завершен')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientID], [OrderReceiveCode], [OrderStatus]) VALUES (9, CAST(N'2022-05-24' AS Date), CAST(N'2022-05-30' AS Date), 25, NULL, N'919       ', N'Новый ')
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClientID], [OrderReceiveCode], [OrderStatus]) VALUES (10, CAST(N'2022-05-25' AS Date), CAST(N'2022-05-31' AS Date), 36, NULL, N'920       ', N'Завершен')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1, N'H782T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1, N'А112Т4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (2, N'F635R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (2, N'G783F5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (3, N'D572U8', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (3, N'J384T6', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (4, N'B320R5', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (4, N'D329H3', 6)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (5, N'G432E4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (5, N'S213E3', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (6, N'K345R4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (6, N'S634B5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (7, N'G531F4', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (7, N'J542F5', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (8, N'C436G5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (8, N'P764G4', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (9, N'D364R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (9, N'S326R5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (10, N'D268G5', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (10, N'M542T5', 2)
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] ON 

INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (1, N'344288', N' г. Москва', N' ул. Чехова', N'1')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (2, N'614164', N' г.Москва', N'  ул. Степная', N'30')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (3, N'394242', N' г. Москва', N' ул. Коммунистическая', N'43')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (4, N'660540', N' г. Москва', N' ул. Солнечная', N'25')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (5, N'125837', N' г. Москва', N' ул. Шоссейная', N'40')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (6, N'125703', N' г. Москва', N' ул. Партизанская', N'49')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (7, N'625283', N' г. Москва', N' ул. Победы', N'46')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (8, N'614611', N' г. Москва', N' ул. Молодежная', N'50')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (9, N'454311', N' г.Москва', N' ул. Новая', N'19')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (10, N'660007', N' г.Москва', N' ул. Октябрьская', N'19')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (11, N'603036', N' г. Москва', N' ул. Садовая', N'4')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (12, N'450983', N' г.Москва', N' ул. Комсомольская', N'26')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (13, N'394782', N' г. Москва', N' ул. Чехова', N'3')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (14, N'603002', N' г. Москва', N' ул. Дзержинского', N'28')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (15, N'450558', N' г. Москва', N' ул. Набережная', N'30')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (16, N'394060', N' г.Москва', N' ул. Фрунзе', N'43')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (17, N'410661', N' г. Москва', N' ул. Школьная', N'50')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (18, N'625590', N' г. Москва', N' ул. Коммунистическая', N'20')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (19, N'625683', N' г. Москва', N' ул. 8 Марта', N'')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (20, N'400562', N' г. Москва', N' ул. Зеленая', N'32')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (21, N'614510', N' г. Москва', N' ул. Маяковского', N'47')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (22, N'410542', N' г. Москва', N' ул. Светлая', N'46')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (23, N'620839', N' г. Москва', N' ул. Цветочная', N'8')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (24, N'443890', N' г. Москва', N' ул. Коммунистическая', N'1')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (25, N'603379', N' г. Москва', N' ул. Спортивная', N'46')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (26, N'603721', N' г. Москва', N' ул. Гоголя', N'41')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (27, N'410172', N' г. Москва', N' ул. Северная', N'13')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (28, N'420151', N' г. Москва', N' ул. Вишневая', N'32')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (29, N'125061', N' г. Москва', N' ул. Подгорная', N'8')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (30, N'630370', N' г. Москва', N' ул. Шоссейная', N'24')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (31, N'614753', N' г. Москва', N' ул. Полевая', N'35')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (32, N'426030', N' г. Москва', N' ул. Маяковского', N'44')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (33, N'450375', N' г. Москва', N' ул. Клубная', N'44')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (34, N'625560', N' г. Москва', N' ул. Некрасова', N'12')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (35, N'630201', N' г. Москва', N' ул. Комсомольская', N'17')
INSERT [dbo].[PickupPoint] ([ID], [PostIndex], [City], [Street], [HomeNumber]) VALUES (36, N'190949', N' г. Москва', N' ул. Мичурина', N'26')
SET IDENTITY_INSERT [dbo].[PickupPoint] OFF
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'B320R5', N'Туфли', N'шт.', CAST(4300.00 AS Decimal(19, 2)), 15, N'Rieker', N'Kari', N'Женская обувь', 2, 6, N'Туфли Rieker женские демисезонные, размер 41, цвет коричневый', N'B320R5.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'B431R5', N'Ботинки', N'шт.', CAST(2700.00 AS Decimal(19, 2)), 10, N'Rieker', N'Обувь для вас', N'Мужская обувь', 2, 5, N'Мужские кожаные ботинки/мужские ботинки', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'C436G5', N'Ботинки', N'шт.', CAST(10200.00 AS Decimal(19, 2)), 15, N'Alessio Nesca', N'Kari', N'Женская обувь', 2, 9, N'Ботинки женские, ARGO, размер 40', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'D268G5', N'Туфли', N'шт.', CAST(4399.00 AS Decimal(19, 2)), 10, N'Rieker', N'Обувь для вас', N'Женская обувь', 3, 12, N'Туфли Rieker женские демисезонные, размер 36, цвет коричневый', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'D329H3', N'Полуботинки', N'шт.', CAST(1890.00 AS Decimal(19, 2)), 10, N'Alessio Nesca', N'Обувь для вас', N'Женская обувь', 4, 4, N'Полуботинки Alessio Nesca женские 3-30797-47, размер 37, цвет: бордовый', N'D329H3.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'D364R4', N'Туфли', N'шт.', CAST(12400.00 AS Decimal(19, 2)), 10, N'Kari', N'Kari', N'Женская обувь', 2, 5, N'Туфли Luiza Belly женские Kate-lazo черные из натуральной замши', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'D572U8', N'Кроссовки', N'шт.', CAST(4100.00 AS Decimal(19, 2)), 5, N'Рос', N'Обувь для вас', N'Мужская обувь', 3, 6, N'129615-4 Кроссовки мужские', N'D572U8.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'E482R4', N'Полуботинки', N'шт.', CAST(1800.00 AS Decimal(19, 2)), 15, N'Kari', N'Kari', N'Женская обувь', 2, 14, N'Полуботинки kari женские MYZ20S-149, размер 41, цвет: черный', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'F427R5', N'Ботинки', N'шт.', CAST(11800.00 AS Decimal(19, 2)), 10, N'Rieker', N'Обувь для вас', N'Женская обувь', 4, 11, N'Ботинки на молнии с декоративной пряжкой FRAU', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'F572H7', N'Туфли', N'шт.', CAST(2700.00 AS Decimal(19, 2)), 15, N'Marco Tozzi', N'Kari', N'Женская обувь', 2, 14, N'Туфли Marco Tozzi женские летние, размер 39, цвет черный', N'F572H7.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'F635R4', N'Ботинки', N'шт.', CAST(3244.00 AS Decimal(19, 2)), 20, N'Marco Tozzi', N'Обувь для вас', N'Женская обувь', 2, 13, N'Ботинки Marco Tozzi женские демисезонные, размер 39, цвет бежевый', N'F635R4.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'G432E4', N'Туфли', N'шт.', CAST(2800.00 AS Decimal(19, 2)), 10, N'Kari', N'Kari', N'Женская обувь', 3, 15, N'Туфли kari женские TR-YR-413017, размер 37, цвет: черный', N'G432E4.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'G531F4', N'Ботинки', N'шт.', CAST(6600.00 AS Decimal(19, 2)), 5, N'Kari', N'Kari', N'Женская обувь', 2, 9, N'Ботинки женские зимние ROMER арт. 893167-01 Черный', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'G783F5', N'Ботинки', N'шт.', CAST(5900.00 AS Decimal(19, 2)), 25, N'Рос', N'Kari', N'Мужская обувь', 2, 8, N'Мужские ботинки Рос-Обувь кожаные с натуральным мехом', N'G783F5.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'H535R5', N'Ботинки', N'шт.', CAST(2300.00 AS Decimal(19, 2)), 25, N'Rieker', N'Обувь для вас', N'Женская обувь', 2, 7, N'Женские Ботинки демисезонные', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'H782T5', N'Туфли', N'шт.', CAST(4499.00 AS Decimal(19, 2)), 30, N'Kari', N'Kari', N'Мужская обувь', 4, 5, N'Туфли kari мужские классика MYZ21AW-450A, размер 43, цвет: черный', N'H782T5.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'J384T6', N'Ботинки', N'шт.', CAST(3800.00 AS Decimal(19, 2)), 10, N'Rieker', N'Обувь для вас', N'Мужская обувь', 2, 16, N'B3430/14 Полуботинки мужские Rieker', N'J384T6.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'J542F5', N'Тапочки', N'шт.', CAST(500.00 AS Decimal(19, 2)), 5, N'Kari', N'Kari', N'Мужская обувь', 3, 12, N'Тапочки мужские Арт.70701-55-67син р.41', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'K345R4', N'Полуботинки', N'шт.', CAST(2100.00 AS Decimal(19, 2)), 15, N'CROSBY', N'Обувь для вас', N'Мужская обувь', 2, 3, N'407700/01-02 Полуботинки мужские CROSBY', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'K358H6', N'Тапочки', N'шт.', CAST(599.00 AS Decimal(19, 2)), 5, N'Rieker', N'Kari', N'Мужская обувь', 3, 2, N'Тапочки мужские син р.41', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'L754R4', N'Полуботинки', N'шт.', CAST(1700.00 AS Decimal(19, 2)), 10, N'Kari', N'Kari', N'Женская обувь', 2, 7, N'Полуботинки kari женские WB2020SS-26, размер 38, цвет: черный', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'M542T5', N'Кроссовки', N'шт.', CAST(2800.00 AS Decimal(19, 2)), 5, N'Rieker', N'Обувь для вас', N'Мужская обувь', 5, 3, N'Кроссовки мужские TOFA', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'N457T5', N'Полуботинки', N'шт.', CAST(4600.00 AS Decimal(19, 2)), 5, N'CROSBY', N'Kari', N'Женская обувь', 3, 13, N'Полуботинки Ботинки черные зимние, мех', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'O754F4', N'Туфли', N'шт.', CAST(5400.00 AS Decimal(19, 2)), 10, N'Rieker', N'Обувь для вас', N'Женская обувь', 4, 18, N'Туфли женские демисезонные Rieker артикул 55073-68/37', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'P764G4', N'Туфли', N'шт.', CAST(6800.00 AS Decimal(19, 2)), 30, N'CROSBY', N'Kari', N'Женская обувь', 3, 15, N'Туфли женские, ARGO, размер 38', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'S213E3', N'Полуботинки', N'шт.', CAST(2156.00 AS Decimal(19, 2)), 5, N'CROSBY', N'Обувь для вас', N'Мужская обувь', 3, 6, N'407700/01-01 Полуботинки мужские CROSBY', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'S326R5', N'Тапочки', N'шт.', CAST(9900.00 AS Decimal(19, 2)), 15, N'CROSBY', N'Обувь для вас', N'Мужская обувь', 3, 15, N'Мужские кожаные тапочки "Профиль С.Дали" ', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'S634B5', N'Кеды', N'шт.', CAST(5500.00 AS Decimal(19, 2)), 20, N'CROSBY', N'Обувь для вас', N'Мужская обувь', 3, 6, N'Кеды Caprice мужские демисезонные, размер 42, цвет черный', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'T324F5', N'Сапоги', N'шт.', CAST(4699.00 AS Decimal(19, 2)), 15, N'CROSBY', N'Kari', N'Женская обувь', 2, 5, N'Сапоги замша Цвет: синий', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductEdIzm], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductImporter], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductImage]) VALUES (N'А112Т4', N'Ботинки', N'шт.', CAST(4990.00 AS Decimal(19, 2)), 30, N'Kari', N'Kari', N'Женская обувь', 3, 6, N'Женские Ботинки демисезонные kari', N'А112Т4.jpg')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (51, N'Герасимов ', N'Вячеслав', N'Ростиславович', N'loginDEftn2018', N'gPq+a}', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (52, N'Суворов ', N'Всеволод', N'Богданович', N'loginDEhuv2018', N'EJFYzS', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (53, N'Ширяев ', N'Иван', N'Игоревич', N'loginDEfhd2018', N'{4wU7n', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (54, N'Колобова ', N'Иванна', N'Геннадьевна', N'loginDEaon2018', N'&OmaNE', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (55, N'Шестаков ', N'Антон', N'Константинович', N'loginDEyat2018', N'ELSTyH', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (56, N'Игнатьев ', N'Федосей', N'Богданович', N'loginDEmin2018', N'pQ6jze', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (57, N'Горбунов ', N'Валентин', N'Григорьевич', N'loginDEzal2018', N'zbU8R5', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (58, N'Терентьева ', N'Анжела', N'Михаиловна', N'loginDEemw2018', N'NxhF5I', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (59, N'Мясникова ', N'Ия', N'Евсеевна', N'loginDEmqt2018', N'SIasu5', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (60, N'Горбунов ', N'Григорий', N'Денисович', N'loginDEpxx2018', N'Xv{vjN', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (61, N'Герасимов ', N'Олег', N'Авксентьевич', N'loginDEetv2018', N'lNi&rF', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (62, N'Меркушева ', N'Нинель', N'Матвеевна', N'loginDEonq2018', N'mKIIRQ', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (63, N'Степанов ', N'Григорий', N'Матвеевич', N'loginDErhl2018', N'U}rb9j', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (64, N'Агафонов ', N'Владлен', N'Станиславович', N'loginDEfou2018', N'O+S9hm', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (65, N'Кузнецов ', N'Фрол', N'Георгьевич', N'loginDElno2018', N'le1vt2', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (66, N'Игнатьев ', N'Борис', N'Владиславович', N'loginDEtbx2018', N'CQplH|', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (67, N'Симонов ', N'Юрий', N'Созонович', N'loginDEltw2018', N'zvjkwE', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (68, N'Степанов ', N'Евсей', N'Федотович', N'loginDEfuz2018', N'ILry03', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (69, N'Зыков ', N'Вячеслав', N'Антонович', N'loginDEygj2018', N'7b6PUb', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (70, N'Анисимова ', N'Алина', N'Протасьевна', N'loginDEwpn2018', N'9BBkXP', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (71, N'Артемьева ', N'Лариса', N'Макаровна', N'loginDEyix2018', N'6zbXg*', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (72, N'Мамонтова ', N'Ия', N'Христофоровна', N'loginDEtms2018', N'70Z&Zy', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (73, N'Котова ', N'Светлана', N'Леонидовна', N'loginDEmgl2018', N'QJNgD&', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (74, N'Фёдорова ', N'Алла', N'Брониславовна', N'loginDEhix2018', N'ZKnd*0', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (75, N'Гущина ', N'Анжела', N'Аркадьевна', N'loginDEwbk2018', N'iJMh5B', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (76, N'Дмитриев ', N'Григорий', N'Мэлорович', N'loginDEpwa2018', N'yn5MLQ', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (77, N'Дроздова ', N'Фёкла', N'Митрофановна', N'loginDElrx2018', N'lbX+dF', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (78, N'Гаврилов ', N'Василий', N'Германович', N'loginDEidx2018', N'R2j0mn', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (79, N'Суханова ', N'Фаина', N'Юрьевна', N'loginDEzmk2018', N'ZrgBk6', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (80, N'Савельев ', N'Егор', N'Сергеевич', N'loginDEvje2018', N'gCU1fd', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (81, N'Иван ', N'Васильевна', N'', N'loginDEwun2018', N'yy+Qhe', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (82, N'Сазонова ', N'Клавдия', N'Евгеньевна', N'loginDEfzq2018', N'36H8f}', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (83, N'Шаров ', N'Григорий', N'Созонович', N'loginDEwel2018', N'UU5FTi', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (84, N'Щербаков ', N'Кондрат', N'Фёдорович', N'loginDEljg2018', N'CT44Gc', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (85, N'Дроздов ', N'Дмитрий', N'Юлианович', N'loginDEgsp2018', N'9ACW}r', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (86, N'Молчанов ', N'Юрий', N'Лукьянович', N'loginDEjvp2018', N'etLGcB', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (87, N'Тихонов ', N'Валентин', N'Авдеевич', N'loginDEapt2018', N'cwx{RH', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (88, N'Виноградов ', N'Юрий', N'Лукьевич', N'loginDEilb2018', N'IN2Ahc', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (89, N'Горбунова ', N'Нинель', N'Сергеевна', N'loginDErch2018', N'|&DFy+', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (90, N'Маслов ', N'Леонид', N'Николаевич', N'loginDEfwx2018', N't|*wCk', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (91, N'Родионова ', N'Венера', N'Арсеньевна', N'loginDEggp2018', N'bBNxJb', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (92, N'Агафонов ', N'Пантелеймон', N'Гордеевич', N'loginDEbgb2018', N'VtmP58', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (93, N'Кудрявцев ', N'Гордей', N'Авксентьевич', N'loginDEnif2018', N'Nhj*t+', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (94, N'Лыткина ', N'Алевтина', N'Романовна', N'loginDEsvs2018', N'tLgPnC', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (95, N'Князев ', N'Геласий', N'Евсеевич', N'loginDEghx2018', N'gue+iw', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (96, N'Бирюкова ', N'Пелагея', N'Дмитрьевна', N'loginDElmy2018', N'X2LtuP', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (97, N'Быков ', N'Лаврентий', N'Ярославович', N'loginDEevd2018', N'GMbcZN', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (98, N'Воронов ', N'Олег', N'Яковович', N'loginDEodd2018', N's2|Eb1', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (99, N'Богданова ', N'Марфа', N'Владимировна', N'loginDEmrj2018', N'blrD&8', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (100, N'Беляев ', N'Донат', N'Агафонович', N'loginDEyct2018', N'uD+|Ud', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (101, N'Анохин', N'Арсений', N'Андреевич', N'loginDEbnm2018', N'jkcKiK+', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (102, N'Козлов', N'Максим', N'Максимович', N'loginDEmkY2018', N'NMKnck!', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (103, N'Козлов', N'Давид', N'Александрович', N'loginDEERT2018', N'Bnkc;cjv', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (104, N'Черных', N'Марк', N'Кириллович', N'loginDEmKl2018', N'nmxkLfj', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickupPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickupPoint] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickupPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([OrderClientID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__2E1BDC42] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__2E1BDC42]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [Timerzyanov41] SET  READ_WRITE 
GO
