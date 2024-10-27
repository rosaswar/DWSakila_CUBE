USE [DWSakila]
GO
/****** Object:  User [NT SERVICE\MSOLAP$DANIGG]    Script Date: 27/10/2024 15:53:29 ******/
CREATE USER [NT SERVICE\MSOLAP$DANIGG] FOR LOGIN [NT SERVICE\MSOLAP$DANIGG] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NT SERVICE\MSOLAP$DANIGG]
GO
/****** Object:  Table [dbo].[DimActor]    Script Date: 27/10/2024 15:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimActor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActorId] [int] NOT NULL,
	[FirstName] [nvarchar](45) NOT NULL,
	[LastName] [nvarchar](45) NOT NULL,
	[FilmId] [int] NOT NULL,
 CONSTRAINT [PK_DimActor_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimAddress]    Script Date: 27/10/2024 15:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAddress](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[PostalCode] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCategory]    Script Date: 27/10/2024 15:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [tinyint] NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[FilmId] [int] NOT NULL,
 CONSTRAINT [PK_DimCategory_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 27/10/2024 15:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](45) NOT NULL,
	[LastName] [varchar](45) NOT NULL,
	[Email] [varchar](50) NULL,
	[Active] [char](1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK__DimCusto__CD65CB85FC7B3A35] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimFilm]    Script Date: 27/10/2024 15:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimFilm](
	[FilmId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[Description] [text] NULL,
	[ReleaseYear] [varchar](4) NULL,
	[Language] [char](20) NULL,
	[RentalDuration] [tinyint] NOT NULL,
	[RentalRate] [decimal](4, 2) NOT NULL,
	[Length] [smallint] NULL,
	[ReplacementCost] [decimal](5, 2) NOT NULL,
	[Rating] [varchar](10) NULL,
	[SpecialFeatures] [varchar](255) NULL,
 CONSTRAINT [PK__DimFilm__349764A9D6A1518E] PRIMARY KEY CLUSTERED 
(
	[FilmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimRental]    Script Date: 27/10/2024 15:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimRental](
	[RentalId] [int] IDENTITY(1,1) NOT NULL,
	[RentalDate] [datetime] NOT NULL,
	[ReturnDate] [datetime] NULL,
	[FilmId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RentalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStaff]    Script Date: 27/10/2024 15:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStaff](
	[StaffId] [tinyint] NOT NULL,
	[FirstName] [varchar](45) NOT NULL,
	[LastName] [varchar](45) NOT NULL,
	[Picture] [image] NULL,
	[Email] [varchar](50) NULL,
	[Active] [bit] NOT NULL,
	[Username] [varchar](16) NOT NULL,
	[Password] [varchar](40) NULL,
 CONSTRAINT [PK__DimStaff__96D4AB1703BA158C] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStore]    Script Date: 27/10/2024 15:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStore](
	[StoreId] [int] IDENTITY(1,1) NOT NULL,
	[ManagerStaffId] [tinyint] NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK__DimStore__A2F2A30C72F73F2A] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactPayment]    Script Date: 27/10/2024 15:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactPayment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[StaffId] [tinyint] NOT NULL,
	[RentalId] [int] NOT NULL,
	[Amount] [decimal](5, 2) NOT NULL,
	[PaymentDate] [nvarchar](max) NOT NULL,
	[StoreId] [int] NOT NULL,
	[FilmId] [int] NOT NULL,
	[PaymentDatetime] [datetime] NOT NULL,
 CONSTRAINT [PK__FactPaym__ED1FC9EACA49CFC2] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimActor]  WITH NOCHECK ADD  CONSTRAINT [FK_DimActor_DimFilm] FOREIGN KEY([FilmId])
REFERENCES [dbo].[DimFilm] ([FilmId])
GO
ALTER TABLE [dbo].[DimActor] CHECK CONSTRAINT [FK_DimActor_DimFilm]
GO
ALTER TABLE [dbo].[DimCategory]  WITH NOCHECK ADD  CONSTRAINT [FK_DimCategory_DimFilm] FOREIGN KEY([FilmId])
REFERENCES [dbo].[DimFilm] ([FilmId])
GO
ALTER TABLE [dbo].[DimCategory] CHECK CONSTRAINT [FK_DimCategory_DimFilm]
GO
ALTER TABLE [dbo].[DimCustomer]  WITH NOCHECK ADD  CONSTRAINT [FK_DimCustomer_DimAddress] FOREIGN KEY([AddressId])
REFERENCES [dbo].[DimAddress] ([AddressId])
GO
ALTER TABLE [dbo].[DimCustomer] CHECK CONSTRAINT [FK_DimCustomer_DimAddress]
GO
ALTER TABLE [dbo].[DimRental]  WITH NOCHECK ADD  CONSTRAINT [FK_DimRental_DimFilm] FOREIGN KEY([FilmId])
REFERENCES [dbo].[DimFilm] ([FilmId])
GO
ALTER TABLE [dbo].[DimRental] CHECK CONSTRAINT [FK_DimRental_DimFilm]
GO
ALTER TABLE [dbo].[DimStore]  WITH NOCHECK ADD  CONSTRAINT [FK_DimStore_DimAddress] FOREIGN KEY([AddressId])
REFERENCES [dbo].[DimAddress] ([AddressId])
GO
ALTER TABLE [dbo].[DimStore] CHECK CONSTRAINT [FK_DimStore_DimAddress]
GO
ALTER TABLE [dbo].[FactPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_FactPayment_DimCustomer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[DimCustomer] ([CustomerId])
GO
ALTER TABLE [dbo].[FactPayment] CHECK CONSTRAINT [FK_FactPayment_DimCustomer]
GO
ALTER TABLE [dbo].[FactPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_FactPayment_DimFilm] FOREIGN KEY([FilmId])
REFERENCES [dbo].[DimFilm] ([FilmId])
GO
ALTER TABLE [dbo].[FactPayment] CHECK CONSTRAINT [FK_FactPayment_DimFilm]
GO
ALTER TABLE [dbo].[FactPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_FactPayment_DimRental] FOREIGN KEY([RentalId])
REFERENCES [dbo].[DimRental] ([RentalId])
GO
ALTER TABLE [dbo].[FactPayment] CHECK CONSTRAINT [FK_FactPayment_DimRental]
GO
ALTER TABLE [dbo].[FactPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_FactPayment_DimStaff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[DimStaff] ([StaffId])
GO
ALTER TABLE [dbo].[FactPayment] CHECK CONSTRAINT [FK_FactPayment_DimStaff]
GO
ALTER TABLE [dbo].[FactPayment]  WITH NOCHECK ADD  CONSTRAINT [FK_FactPayment_DimStore] FOREIGN KEY([StoreId])
REFERENCES [dbo].[DimStore] ([StoreId])
GO
ALTER TABLE [dbo].[FactPayment] CHECK CONSTRAINT [FK_FactPayment_DimStore]
GO
