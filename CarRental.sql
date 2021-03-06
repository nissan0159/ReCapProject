USE [master]
GO
/****** Object:  Database [CarRental]    Script Date: 3/31/2021 12:50:39 PM ******/
CREATE DATABASE [CarRental]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ReCapProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ReCapProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ReCapProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ReCapProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CarRental] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarRental].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarRental] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarRental] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarRental] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarRental] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarRental] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarRental] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarRental] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarRental] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarRental] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarRental] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarRental] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarRental] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarRental] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarRental] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarRental] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarRental] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarRental] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarRental] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarRental] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarRental] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarRental] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarRental] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarRental] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarRental] SET  MULTI_USER 
GO
ALTER DATABASE [CarRental] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarRental] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarRental] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarRental] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarRental] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarRental] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CarRental] SET QUERY_STORE = OFF
GO
USE [CarRental]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 3/31/2021 12:50:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarImages]    Script Date: 3/31/2021 12:50:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NOT NULL,
	[ImagePath] [varchar](500) NOT NULL,
	[Date] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 3/31/2021 12:50:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BrandId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[CarName] [varchar](50) NOT NULL,
	[ModelYear] [int] NOT NULL,
	[DailyPrice] [money] NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 3/31/2021 12:50:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditCards]    Script Date: 3/31/2021 12:50:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditCards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreditCardNumber] [char](16) NOT NULL,
	[Expiration] [char](5) NOT NULL,
	[CardSecurityNumber] [char](3) NOT NULL,
 CONSTRAINT [PK__Table__3214EC0740985D92] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerCreditCards]    Script Date: 3/31/2021 12:50:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerCreditCards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CreditCardId] [int] NOT NULL,
 CONSTRAINT [PK_CustomerCreditCards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/31/2021 12:50:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CompanyName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationClaims]    Script Date: 3/31/2021 12:50:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
 CONSTRAINT [PK_OperationClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 3/31/2021 12:50:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[RentDate] [date] NOT NULL,
	[ReturnDate] [date] NOT NULL,
	[Enable] [bit] NOT NULL,
 CONSTRAINT [PK_Rentals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserOperationClaims]    Script Date: 3/31/2021 12:50:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOperationClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OperationClaimId] [int] NOT NULL,
 CONSTRAINT [PK_UserOperationClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/31/2021 12:50:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](75) NOT NULL,
	[PasswordHash] [varbinary](500) NOT NULL,
	[PasswordSalt] [varbinary](500) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [BrandName]) VALUES (1, N'Tesla')
INSERT [dbo].[Brands] ([Id], [BrandName]) VALUES (2, N'Nissan')
INSERT [dbo].[Brands] ([Id], [BrandName]) VALUES (3, N'Ford')
INSERT [dbo].[Brands] ([Id], [BrandName]) VALUES (4, N'Volvo')
INSERT [dbo].[Brands] ([Id], [BrandName]) VALUES (5, N'Fiat')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[CarImages] ON 

INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (2, 3, N'\Images\0b3405f0f5884a6ab92f8e511684efb1.jpg', CAST(N'2021-03-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (3, 2, N'\Images\bcbd506000aa4ba1bc17267fb7d8da66.jpg', CAST(N'2021-03-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (4, 4, N'\Images\a1e499f3006c49e9b5596101540391ac.jpg', CAST(N'2021-03-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (5, 4, N'\Images\55054204b4af4c47968d935c10d200b0.jpg', CAST(N'2021-03-23T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (6, 5, N'\Images\f1eba4add5f0458caaa3e99c39408548.jpeg', CAST(N'2021-03-23T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[CarImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description]) VALUES (2, 2, 2, N'Qashqai', 2021, 299999.0000, N'Nissan Qashqai essiz deneyim')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description]) VALUES (3, 4, 3, N'XC90', 2021, 799999.0000, N'Volvo XC90 tank gibi araba.')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description]) VALUES (4, 1, 1, N'Model X', 2021, 1599999.0000, N'Tesla Model X araba degil uçak.')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description]) VALUES (5, 1, 1, N'Model Y', 2021, 1799999.0000, N'Tesla Model Y Elektrikli arabada son nokta.')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description]) VALUES (6, 3, 3, N'Focus', 2021, 450.0000, N'Seni En Güçlü Yansitan O!')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [CarName], [ModelYear], [DailyPrice], [Description]) VALUES (8, 1, 2, N'Model S', 2021, 799.0000, N'Full Self-Driving Capability.')
SET IDENTITY_INSERT [dbo].[Cars] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [ColorName]) VALUES (1, N'Siyah')
INSERT [dbo].[Colors] ([Id], [ColorName]) VALUES (2, N'Kirmizi')
INSERT [dbo].[Colors] ([Id], [ColorName]) VALUES (3, N'Beyaz')
INSERT [dbo].[Colors] ([Id], [ColorName]) VALUES (4, N'Gri')
INSERT [dbo].[Colors] ([Id], [ColorName]) VALUES (5, N'Uzay Grisi')
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[CreditCards] ON 

INSERT [dbo].[CreditCards] ([Id], [CreditCardNumber], [Expiration], [CardSecurityNumber]) VALUES (1, N'1111222233334444', N'02/21', N'149')
INSERT [dbo].[CreditCards] ([Id], [CreditCardNumber], [Expiration], [CardSecurityNumber]) VALUES (2, N'2222333344445555', N'02/21', N'554')
INSERT [dbo].[CreditCards] ([Id], [CreditCardNumber], [Expiration], [CardSecurityNumber]) VALUES (3, N'9999999999999999', N'02/21', N'996')
INSERT [dbo].[CreditCards] ([Id], [CreditCardNumber], [Expiration], [CardSecurityNumber]) VALUES (4, N'5555555555555555', N'00/22', N'123')
INSERT [dbo].[CreditCards] ([Id], [CreditCardNumber], [Expiration], [CardSecurityNumber]) VALUES (5, N'5555555555555555', N'02/22', N'155')
INSERT [dbo].[CreditCards] ([Id], [CreditCardNumber], [Expiration], [CardSecurityNumber]) VALUES (6, N'4544444444444444', N'02/22', N'144')
INSERT [dbo].[CreditCards] ([Id], [CreditCardNumber], [Expiration], [CardSecurityNumber]) VALUES (7, N'5555555555555555', N'02/21', N'123')
SET IDENTITY_INSERT [dbo].[CreditCards] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerCreditCards] ON 

INSERT [dbo].[CustomerCreditCards] ([Id], [CustomerId], [CreditCardId]) VALUES (2, 5, 1)
INSERT [dbo].[CustomerCreditCards] ([Id], [CustomerId], [CreditCardId]) VALUES (3, 6, 2)
SET IDENTITY_INSERT [dbo].[CustomerCreditCards] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (5, 3, N'ASosyaL Limited')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (6, 4, N'Deniz Bilisim')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (7, 5, N'Birkan iletisim')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (8, 6, N'Eyüp Tekkan AS')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[OperationClaims] ON 

INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (1, N'admin')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (2, N'moderator')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (3, N'user')
SET IDENTITY_INSERT [dbo].[OperationClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[Rentals] ON 

INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate], [Enable]) VALUES (47, 2, 7, CAST(N'2021-03-10' AS Date), CAST(N'2021-03-12' AS Date), 0)
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate], [Enable]) VALUES (48, 2, 7, CAST(N'2021-03-13' AS Date), CAST(N'2021-03-15' AS Date), 0)
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate], [Enable]) VALUES (49, 2, 7, CAST(N'2021-03-28' AS Date), CAST(N'2021-03-30' AS Date), 0)
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate], [Enable]) VALUES (50, 2, 7, CAST(N'2021-03-31' AS Date), CAST(N'2021-03-31' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Rentals] OFF
GO
SET IDENTITY_INSERT [dbo].[UserOperationClaims] ON 

INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (3, 3, 1)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (4, 4, 2)
SET IDENTITY_INSERT [dbo].[UserOperationClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status]) VALUES (3, N'Furkan', N'Artar', N'furkan@gmail.com', 0xAA40F39D3D5041BD3D8103F12D06157239DD5E156795A43C7EC909879160328772A8C5074EF3637F5D550D05ECC6807D354D234A9CA95A60791569E75EA1C426, 0x9B90A92645439F55F70C2FE6501B0F9FF4A0563920A5DBEB8FCC5DED2E22CFF4DBACC4EF3175C1757EC4BDED67112C105116BD6C450FB4628CF55CC14505CA204F0CF17311E12729BDF8B898C24E236277140241742920FDFADD2A4489F415D2875ABDD51C546C20DFB6B276F60779CFB8D42537B5503172DBF98CE812CEC1A9, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status]) VALUES (4, N'Deniz', N'Çakmak', N'deniz@gmail.com', 0xC3F6C18C65ED44413AEC10B3933965F88656318FA17F8F0817EE3F92F9869702D1F8597796B169748E8AEC617AA7D8249C84E9E01A67BFF9EF55F56D6038555E, 0x8A8073F6D46EF277E3EEAF7E1FA98BF0891F6A0D62B3963406FFE7C601F39FAE2E6691E3E1269E8CFFC630236603AE9F01CB89EDED8F58484A5DCBDCFB8EC1F6984A5419E618E87FB3952F22AB1AB1F1DAE0570D0BA3EB55F0B7C7966A613CD1FAA0BB62FF229A95C24311E96C5893886398E57D44A0B23905840C34C841A962, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status]) VALUES (5, N'Ahmet', N'Birkan', N'ahmetb@gmail.com', 0x6F87F75124E6C73E7ED1950E5F9D8401287F33DFC71F5374D703E771E801663BC93FF2D717230F3276AE82B76EC06A502ED3CA0E0E0E19A7DFE1D6940998B564, 0x5993B02A9822D17AFC467149F9251AEB36A110362C80325066CC4572DE78683E3E7B09365E9CF79A6C95EA6972B595FBF5A7D19FA7AF5731C20D45B82261B54756A44AFFE5DF44B36710F4895BCEFA5ABA218A81AF6F339C6E91480442BFDC2F034F0BAD81D7EFDAA6EE22FD92D7E00B279E96BF207A0629B0FD2686F702E54F, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status]) VALUES (6, N'Eyüp', N'Tekkan', N'eyuptekkan@gmail.com', 0xE956A6FF6DDFC157DE5F949B71EA1E8FCE8A639CC77495F0590825ED668C61FF0856972C0F2EA8186E0D8385743533BA0E785F54803BE3036A8798A3C5A076E0, 0x9CAD81640F6F099BA56A5A8F2518AFF7C1B6727A08581FC8F1465035A455EAF0996C81A33789EAE7810EC131960538A04046F4C154DAC6594C9AA85EF8E3C4D0B2C73B9AA9F00165E6D713ED953C239EC9E8DEA4EEE07F0EC98A97EC167C63A55BC26A552A81858DC0675AE9776836E5B7677AC36677C56BB47E0B439C6710E5, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[CarImages]  WITH CHECK ADD  CONSTRAINT [FK_CarImages_Cars] FOREIGN KEY([CarId])
REFERENCES [dbo].[Cars] ([Id])
GO
ALTER TABLE [dbo].[CarImages] CHECK CONSTRAINT [FK_CarImages_Cars]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Brands]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Colors] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([Id])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Colors]
GO
ALTER TABLE [dbo].[CustomerCreditCards]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCreditCards_CreditCards1] FOREIGN KEY([CreditCardId])
REFERENCES [dbo].[CreditCards] ([Id])
GO
ALTER TABLE [dbo].[CustomerCreditCards] CHECK CONSTRAINT [FK_CustomerCreditCards_CreditCards1]
GO
ALTER TABLE [dbo].[CustomerCreditCards]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCreditCards_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[CustomerCreditCards] CHECK CONSTRAINT [FK_CustomerCreditCards_Customers]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Users]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Cars] FOREIGN KEY([CarId])
REFERENCES [dbo].[Cars] ([Id])
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Cars]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Customers]
GO
ALTER TABLE [dbo].[UserOperationClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserOperationClaims_OperationClaims] FOREIGN KEY([OperationClaimId])
REFERENCES [dbo].[OperationClaims] ([Id])
GO
ALTER TABLE [dbo].[UserOperationClaims] CHECK CONSTRAINT [FK_UserOperationClaims_OperationClaims]
GO
ALTER TABLE [dbo].[UserOperationClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserOperationClaims_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserOperationClaims] CHECK CONSTRAINT [FK_UserOperationClaims_Users]
GO
USE [master]
GO
ALTER DATABASE [CarRental] SET  READ_WRITE 
GO
