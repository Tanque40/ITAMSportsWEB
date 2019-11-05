USE [master]
GO
/** Object:  Database [ITAMSports]    Script Date: 23/10/2019 11:38:14 a. m. **/
CREATE DATABASE [ITAMSports]
GO
ALTER DATABASE [ITAMSports] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ITAMSports].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ITAMSports] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ITAMSports] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ITAMSports] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ITAMSports] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ITAMSports] SET ARITHABORT OFF 
GO
ALTER DATABASE [ITAMSports] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ITAMSports] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ITAMSports] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ITAMSports] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ITAMSports] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ITAMSports] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ITAMSports] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ITAMSports] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ITAMSports] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ITAMSports] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ITAMSports] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ITAMSports] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ITAMSports] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ITAMSports] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ITAMSports] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ITAMSports] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ITAMSports] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ITAMSports] SET RECOVERY FULL 
GO
ALTER DATABASE [ITAMSports] SET  MULTI_USER 
GO
ALTER DATABASE [ITAMSports] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ITAMSports] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ITAMSports] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ITAMSports] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ITAMSports] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ITAMSports', N'ON'
GO
ALTER DATABASE [ITAMSports] SET QUERY_STORE = OFF
GO
USE [ITAMSports]
GO
/** Object:  Table [dbo].[Administrador]    Script Date: 23/10/2019 11:38:15 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrador](
	[usuario] [varchar](30) NOT NULL,
	[passwd] [varchar](30) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[Correo]    Script Date: 23/10/2019 11:38:15 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Correo](
	[usuario] [varchar](30) NOT NULL,
	[correo] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usuario] ASC,
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[Datos]    Script Date: 23/10/2019 11:38:15 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Datos](
	[claveUnica] [smallint] NOT NULL,
	[rol] [varchar](20) NULL,
	[jugados] [smallint] NULL,
	[ganados] [smallint] NULL,
	[perdidos] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[claveUnica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[Deporte]    Script Date: 23/10/2019 11:38:15 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deporte](
	[idDep] [char](1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[usuario] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[Evento]    Script Date: 23/10/2019 11:38:15 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evento](
	[idEvento] [smallint] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[lugar] [varchar](30) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[idDep] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[idEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[Jugador]    Script Date: 23/10/2019 11:38:15 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugador](
	[claveUnica] [smallint] NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[sexo] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[claveUnica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[Telefono]    Script Date: 23/10/2019 11:38:15 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefono](
	[usuario] [varchar](30) NOT NULL,
	[tel] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usuario] ASC,
	[tel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[TieneDepJug]    Script Date: 23/10/2019 11:38:15 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TieneDepJug](
	[idDep] [char](1) NOT NULL,
	[claveUnica] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDep] ASC,
	[claveUnica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Correo]  WITH CHECK ADD FOREIGN KEY([usuario])
REFERENCES [dbo].[Administrador] ([usuario])
GO
ALTER TABLE [dbo].[Datos]  WITH CHECK ADD FOREIGN KEY([claveUnica])
REFERENCES [dbo].[Jugador] ([claveUnica])
GO
ALTER TABLE [dbo].[Deporte]  WITH CHECK ADD FOREIGN KEY([usuario])
REFERENCES [dbo].[Administrador] ([usuario])
GO
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD FOREIGN KEY([idDep])
REFERENCES [dbo].[Deporte] ([idDep])
GO
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD FOREIGN KEY([usuario])
REFERENCES [dbo].[Administrador] ([usuario])
GO
ALTER TABLE [dbo].[TieneDepJug]  WITH CHECK ADD FOREIGN KEY([claveUnica])
REFERENCES [dbo].[Jugador] ([claveUnica])
GO
ALTER TABLE [dbo].[TieneDepJug]  WITH CHECK ADD FOREIGN KEY([idDep])
REFERENCES [dbo].[Deporte] ([idDep])
GO
USE [master]
GO
ALTER DATABASE [ITAMSports] SET  READ_WRITE 
GO

use ITAMSports
create table Equipo(
		idEquipo smallint not null primary key,
		nombre varchar(30) not null,
		jugados smallint not null,
		ganados smallint not null,
		perdidos smallint not null,
		idDep char references Deporte)

create table Resultado(
		idResultado smallint not null primary key,
		idEq1 smallint not null,
		idEq2 smallint not null,
		Constraint idEquipo1 FOREIGN KEY (idEq1) REFERENCES Equipo (idEquipo),
		Constraint idEquipo2 FOREIGN KEY (idEq2) REFERENCES Equipo (idEquipo)
)

create table EquipoResultado(
		idResultado smallint not null references Resultado,
		idEquipo smallint not null references Equipo
		primary key (idResultado, idEquipo))

create table EquipoJugador(
		claveUnica smallint not null references Jugador,
		idEquipo smallint not null references Equipo
		primary key (claveUnica, idEquipo))

		SELECT * FROM Evento, Deporte WHERE Evento.idEvento = 1 AND Evento.idDep = Deporte.idDep
		Select * from Equipo