/****** Object:  Table [dbo].[Arrangementer]    Script Date: 08.12.2019 15:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arrangementer](
	[ArrID] [int] IDENTITY(1,1) NOT NULL,
	[ArrNavn] [nvarchar](255) NULL,
	[Sted] [nvarchar](100) NULL,
	[Dato] [date] NULL,
	[Klokken] [nvarchar](5) NULL,
	[DatoSlutt] [date] NULL,
	[KlokkenSlutt] [nvarchar](5) NULL,
	[Varighet] [real] NULL,
	[Seilas] [bit] NOT NULL,
	[Selskap] [bit] NOT NULL,
	[OpenShip] [bit] NOT NULL,
	[Dugnad] [bit] NOT NULL,
	[Deltagelse] [bit] NULL,
	[Kontingent] [real] NULL,
	[Kostdag] [smallint] NULL,
	[Overnatt] [bit] NOT NULL,
	[Parkering] [bit] NOT NULL,
	[SeskontAvheng] [bit] NOT NULL,
	[TurReturID] [int] NULL,
	[VaktlengdeSeilas] [real] NULL,
	[VaktlengdeLand] [real] NULL,
	[InvitererSign] [nvarchar](max) NULL,
	[DeltagKvitt] [nvarchar](max) NULL,
	[AvmeldKvitt] [nvarchar](max) NULL,
	[ReiseInfo] [nvarchar](max) NULL,
	[ParkeringInfo] [nvarchar](max) NULL,
	[PSInfo] [nvarchar](max) NULL,
	[MerknadRulle] [nvarchar](max) NULL,
	[MerknadVaktlisteSeil] [nvarchar](max) NULL,
	[Avlyst] [bit] NOT NULL,
	[Sikkerhetskurs] [bit] NOT NULL,
	[VentelisteArr] [bit] NOT NULL,
	[SesID] [int] NULL,
	[Gangetid] [real] NULL,
	[Distanse] [real] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Arrangementer] PRIMARY KEY CLUSTERED 
(
	[ArrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vWEvents]    Script Date: 08.12.2019 15:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vWEvents]
AS
SELECT        TOP (100) PERCENT ArrID AS ID, ArrNavn AS Title, Dato AS StartDate, Klokken AS StartTime, DatoSlutt AS EndDate, KlokkenSlutt AS EndTime, Sted AS Description
FROM            dbo.Arrangementer
WHERE        (ArrID > 1)
GO
/****** Object:  Table [dbo].[xSesonger]    Script Date: 08.12.2019 15:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xSesonger](
	[SesID] [int] IDENTITY(1,1) NOT NULL,
	[Sesong] [smallint] NULL,
	[MedlAvgift] [real] NULL,
	[MedlChk] [bit] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_xSesonger] PRIMARY KEY CLUSTERED 
(
	[SesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwAktivFromDate]    Script Date: 08.12.2019 15:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwAktivFromDate]
AS
SELECT        dbo.Arrangementer.ArrID, dbo.Arrangementer.ArrNavn, dbo.Arrangementer.Sted, dbo.Arrangementer.Dato, dbo.Arrangementer.Klokken, dbo.Arrangementer.DatoSlutt, dbo.Arrangementer.KlokkenSlutt, dbo.Arrangementer.Seilas, 
                         dbo.Arrangementer.Selskap, dbo.Arrangementer.OpenShip, dbo.Arrangementer.Dugnad, dbo.xSesonger.Sesong, dbo.Arrangementer.Varighet, dbo.Arrangementer.Avlyst
FROM            dbo.Arrangementer INNER JOIN
                         dbo.xSesonger ON dbo.Arrangementer.SesID = dbo.xSesonger.SesID
WHERE        (dbo.Arrangementer.Dato > GETDATE())
GO
/****** Object:  View [dbo].[vwAktiviteter]    Script Date: 08.12.2019 15:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwAktiviteter]
AS
SELECT        dbo.Arrangementer.ArrID, dbo.Arrangementer.ArrNavn, dbo.Arrangementer.Sted, dbo.Arrangementer.Dato, dbo.Arrangementer.Klokken, dbo.Arrangementer.DatoSlutt, dbo.Arrangementer.KlokkenSlutt, dbo.Arrangementer.Seilas, 
                         dbo.Arrangementer.Selskap, dbo.Arrangementer.OpenShip, dbo.Arrangementer.Dugnad, dbo.xSesonger.Sesong, dbo.Arrangementer.Varighet, dbo.Arrangementer.Avlyst
FROM            dbo.Arrangementer INNER JOIN
                         dbo.xSesonger ON dbo.Arrangementer.SesID = dbo.xSesonger.SesID
GO
/****** Object:  Table [dbo].[BunkTildeling]    Script Date: 08.12.2019 15:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BunkTildeling](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ArrID] [int] NULL,
	[PID] [int] NULL,
	[BunkID] [int] NULL,
 CONSTRAINT [PK_BunkTildeling] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DagAktivitet]    Script Date: 08.12.2019 15:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DagAktivitet](
	[AktID] [int] IDENTITY(1,1) NOT NULL,
	[DPID] [int] NULL,
	[Start] [nvarchar](5) NULL,
	[Slutt] [nvarchar](5) NULL,
	[Aktivitet] [nvarchar](max) NULL,
	[Ansvar] [nvarchar](255) NULL,
	[Antrekk] [nvarchar](255) NULL,
	[Merknad] [nvarchar](255) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_DagAktivitet] PRIMARY KEY CLUSTERED 
(
	[AktID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DagsProgram]    Script Date: 08.12.2019 15:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DagsProgram](
	[DPID] [int] IDENTITY(1,1) NOT NULL,
	[Dag] [datetime] NULL,
	[Sted] [nvarchar](255) NULL,
	[Vaktskv] [nvarchar](255) NULL,
	[Vaktsjef] [nvarchar](255) NULL,
	[Varighet] [real] NULL,
	[Intervall] [real] NULL,
	[StartVakt] [real] NULL,
	[Merknader] [nvarchar](max) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_DagsProgram] PRIMARY KEY CLUSTERED 
(
	[DPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deltagelse]    Script Date: 08.12.2019 15:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deltagelse](
	[SerID] [int] IDENTITY(1,1) NOT NULL,
	[ArrID] [int] NOT NULL,
	[PID] [int] NOT NULL,
	[DeltagMerknad] [nvarchar](max) NULL,
	[Avmeldt] [bit] NOT NULL,
	[Venteliste] [bit] NOT NULL,
	[SOID] [int] NULL,
	[JobbSekvens] [int] NULL,
	[RFID] [int] NULL,
	[RenID] [int] NULL,
	[RengjTildelt] [bit] NULL,
	[RengjPost] [nvarchar](max) NULL,
	[Vakt2] [nvarchar](255) NULL,
	[Vakt3] [nvarchar](255) NULL,
	[Havari] [nvarchar](255) NULL,
	[LifeRaft] [nvarchar](255) NULL,
	[RulleKommentar] [nvarchar](max) NULL,
	[BunkTildelt] [bit] NULL,
	[Bunk] [nvarchar](255) NULL,
	[Besetning] [bit] NOT NULL,
	[IkkeBesetning] [bit] NOT NULL,
	[Medfarende] [bit] NOT NULL,
	[ReiseOpplegg] [bit] NULL,
	[ReiseMerknad] [nvarchar](50) NULL,
	[Kostdag] [real] NULL,
	[Parkering] [bit] NOT NULL,
	[Fullmakt] [bit] NOT NULL,
	[Overnatt] [bit] NOT NULL,
	[Sekvens] [smallint] NULL,
	[Brannvakt] [bit] NOT NULL,
	[VPID] [int] NULL,
	[Flag] [bit] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Deltagelse] PRIMARY KEY CLUSTERED 
(
	[SerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dugnader]    Script Date: 08.12.2019 15:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dugnader](
	[DugID] [int] IDENTITY(1,1) NOT NULL,
	[Dato] [datetime] NULL,
	[Type] [nvarchar](255) NULL,
	[SesID] [int] NOT NULL,
	[Planl] [bit] NULL,
	[ArrID] [int] NULL,
 CONSTRAINT [PK_Dugnader] PRIMARY KEY CLUSTERED 
(
	[DugID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DugnadInnsats]    Script Date: 08.12.2019 15:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DugnadInnsats](
	[InnID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[DugID] [int] NULL,
	[Timer] [real] NULL,
	[ArrID] [int] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_DugnadInnsats] PRIMARY KEY CLUSTERED 
(
	[InnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Effekter]    Script Date: 08.12.2019 15:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Effekter](
	[EffID] [int] IDENTITY(1,1) NOT NULL,
	[Effekt] [nvarchar](50) NULL,
	[Størrelse] [nchar](10) NULL,
	[Sted] [nchar](30) NULL,
	[ErstattPris] [real] NULL,
	[TotAntall] [smallint] NULL,
	[RestAntall] [smallint] NULL,
 CONSTRAINT [PK_Effekter] PRIMARY KEY CLUSTERED 
(
	[EffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fartoylag]    Script Date: 08.12.2019 15:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fartoylag](
	[FLID] [int] IDENTITY(1,1) NOT NULL,
	[SesID] [int] NULL,
	[VvID] [int] NULL,
	[PID] [int] NULL,
 CONSTRAINT [PK_Fartoylag] PRIMARY KEY CLUSTERED 
(
	[FLID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gjester]    Script Date: 08.12.2019 15:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gjester](
	[GID] [int] IDENTITY(1,1) NOT NULL,
	[ArrID] [int] NULL,
	[GjesteNavn] [nvarchar](255) NULL,
	[GjesteAdresse] [nvarchar](255) NULL,
	[GjesteTelefon] [nvarchar](255) NULL,
	[GjesteEpost] [nvarchar](255) NULL,
	[Liferaft] [nvarchar](255) NULL,
	[GjesteNOK] [nvarchar](255) NULL,
	[GjesteNOKAdresse] [nvarchar](255) NULL,
	[GjesteNOKTelefon] [nvarchar](255) NULL,
	[GjesteNOKEpost] [nvarchar](255) NULL,
	[Merknad] [nvarchar](max) NULL,
	[Ansvar] [nvarchar](255) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gjester] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Julekort]    Script Date: 08.12.2019 15:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Julekort](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Firma] [nvarchar](255) NULL,
	[Fnavn] [nvarchar](255) NULL,
	[Enavn] [nvarchar](255) NULL,
	[COFirma] [nvarchar](255) NULL,
	[Gateadr] [nvarchar](255) NULL,
	[Postadr] [nvarchar](255) NULL,
	[Land] [nvarchar](255) NULL,
	[julekort] [bit] NOT NULL,
	[Privat] [bit] NOT NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Julekort] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Keys]    Script Date: 08.12.2019 15:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Keys](
	[NSerID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[KeyType] [nvarchar](255) NULL,
	[KeyNummer] [nvarchar](255) NULL,
	[Dato] [datetime] NULL,
	[Merknad] [nvarchar](max) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Keys] PRIMARY KEY CLUSTERED 
(
	[NSerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KompEnhetPerson]    Script Date: 08.12.2019 15:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KompEnhetPerson](
	[KEPID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[KEID] [int] NULL,
	[Godkj] [bit] NULL,
	[GodkjDato] [datetime] NULL,
	[GodkjSign] [nvarchar](50) NULL,
 CONSTRAINT [PK_KompEnhetPerson] PRIMARY KEY CLUSTERED 
(
	[KEPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Konto]    Script Date: 08.12.2019 15:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Konto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
 CONSTRAINT [PK_Konto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kunde]    Script Date: 08.12.2019 15:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kunde](
	[KundeID] [int] IDENTITY(1,1) NOT NULL,
	[KundeNavn] [nvarchar](255) NOT NULL,
	[KundeKontakt] [nvarchar](255) NULL,
	[KundeEpost] [nvarchar](255) NULL,
	[FaktAdrGatePB] [nvarchar](255) NULL,
	[FaktAdrSted] [nvarchar](255) NULL,
	[Kommentarer] [nvarchar](max) NULL,
	[AltaInternt] [bit] NOT NULL,
	[Sponsor] [bit] NOT NULL,
	[Firma] [bit] NOT NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Kunde] PRIMARY KEY CLUSTERED 
(
	[KundeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedlemEffekter]    Script Date: 08.12.2019 15:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedlemEffekter](
	[MEID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[EffID] [int] NULL,
	[Utlevert] [date] NULL,
	[Innlevert] [date] NULL,
	[Merknad] [nvarchar](250) NULL,
 CONSTRAINT [PK_MedlemEffekter] PRIMARY KEY CLUSTERED 
(
	[MEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedlemSesong]    Script Date: 08.12.2019 15:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedlemSesong](
	[SerID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[SesID] [int] NULL,
	[BetaltKont] [bit] NULL,
	[Purring1] [datetime] NULL,
	[Purring2] [datetime] NULL,
	[Purring3] [datetime] NULL,
	[AntSeil] [smallint] NULL,
	[AntArr] [smallint] NULL,
	[AntDug] [smallint] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_MedlemSesong] PRIMARY KEY CLUSTERED 
(
	[SerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParkerArr]    Script Date: 08.12.2019 15:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParkerArr](
	[ParkID] [int] IDENTITY(1,1) NOT NULL,
	[ParkDato] [datetime] NULL,
	[ParkSted] [nvarchar](255) NULL,
	[ArrID] [int] NULL,
	[Besvart] [nvarchar](255) NULL,
	[Merknad] [nvarchar](255) NULL,
	[FraKl] [nvarchar](5) NULL,
	[TilKl] [nvarchar](5) NULL,
	[SluttDato] [datetime] NULL,
	[SluttKl] [nvarchar](5) NULL,
 CONSTRAINT [PK_ParkerArr] PRIMARY KEY CLUSTERED 
(
	[ParkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParkerPersoner]    Script Date: 08.12.2019 15:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParkerPersoner](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParkID] [int] NULL,
	[PID] [int] NULL,
	[ParkMerknad] [nvarchar](max) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ParkerPersoner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personer]    Script Date: 08.12.2019 15:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personer](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[PIDOld] [int] NULL,
	[Init] [nvarchar](3) NULL,
	[ENavn] [nvarchar](255) NULL,
	[FNavn] [nvarchar](255) NULL,
	[Kalles] [nvarchar](255) NULL,
	[Medlem] [bit] NULL,
	[InnmeldtDato] [datetime] NULL,
	[UtmeldtDato] [datetime] NULL,
	[EksklDato] [datetime] NULL,
	[DeadDato] [datetime] NULL,
	[Adresse] [nvarchar](255) NULL,
	[Poststed] [nvarchar](255) NULL,
	[Land] [nvarchar](255) NULL,
	[IkkePost] [bit] NULL,
	[Firma] [nvarchar](255) NULL,
	[Born] [datetime] NULL,
	[TelfPrivat] [nvarchar](255) NULL,
	[TelfKontor] [nvarchar](255) NULL,
	[TelfMobil] [nvarchar](255) NULL,
	[Epost] [nvarchar](255) NULL,
	[IkkeEpost] [bit] NULL,
	[SOID] [int] NULL,
	[RFID] [int] NULL,
	[LegUtstedt] [datetime] NULL,
	[LegNr] [nvarchar](255) NULL,
	[RegBil] [nvarchar](255) NULL,
	[ParkUtstedt] [datetime] NULL,
	[ParkNr] [nvarchar](255) NULL,
	[AktivOmr] [nvarchar](255) NULL,
	[FagID] [int] NULL,
	[Sertifikat] [bit] NULL,
	[SBID] [int] NULL,
	[KvalFag] [bit] NULL,
	[KvalMerknad] [nvarchar](max) NULL,
	[ReservasjonBilde] [bit] NULL,
	[Bakgrunn] [nvarchar](max) NULL,
	[Aktiv] [bit] NULL,
	[Seilende] [bit] NULL,
	[Medhjelperselskap] [bit] NULL,
	[Gjest] [bit] NULL,
	[KvalSjef] [bit] NULL,
	[KvalNav] [bit] NULL,
	[KvalDekk] [bit] NULL,
	[KvalGnist] [bit] NULL,
	[KvalMaskin] [bit] NULL,
	[KvalRøyk] [bit] NULL,
	[KvalMaskinist] [bit] NULL,
	[KvalMaskinsjef] [bit] NULL,
	[KvalElektriker] [bit] NULL,
	[KvalForpleining] [bit] NULL,
	[KvalKokk] [bit] NULL,
	[KvalInt] [bit] NULL,
	[KvalSanitet] [bit] NULL,
	[KvalSeil] [bit] NULL,
	[KvalVakt] [bit] NULL,
	[KvalPct] [real] NULL,
	[Sikkerhetskurs] [datetime] NULL,
	[Sertifikater] [nvarchar](max) NULL,
	[WorkUp] [bit] NULL,
	[SertSikkerh] [bit] NULL,
	[SertDO] [bit] NULL,
	[SertMO] [bit] NULL,
	[SertEO] [bit] NULL,
	[HonMedl] [bit] NULL,
	[Kommentar] [nvarchar](max) NULL,
	[Administrasjon] [bit] NULL,
	[Skipsledelse] [bit] NULL,
	[Styret] [bit] NULL,
	[Staben] [bit] NULL,
	[Crest] [datetime] NULL,
	[Sveipeving] [datetime] NULL,
	[HovedKey] [datetime] NULL,
	[ParkeringStd] [bit] NULL,
	[NOKOppdat] [datetime] NULL,
	[NOKNavn] [nvarchar](255) NULL,
	[NOKRelasjon] [nvarchar](255) NULL,
	[NOKAdr] [nvarchar](255) NULL,
	[NOKEpost] [nvarchar](255) NULL,
	[NOKPostSted] [nvarchar](255) NULL,
	[NOKTelf] [nvarchar](255) NULL,
	[Medlemsnummer] [smallint] NULL,
	[KontBetSesong] [bit] NULL,
	[Oppdatert] [datetime] NULL,
	[Nummer] [int] NULL,
	[Nummer2] [int] NULL,
	[Nummer3] [int] NULL,
	[Nummer4] [int] NULL,
	[Nummer5] [int] NULL,
	[Flag] [bit] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Personer] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RengjRulle]    Script Date: 08.12.2019 15:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RengjRulle](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ArrID] [int] NULL,
	[PID] [int] NULL,
	[RenID] [int] NULL,
 CONSTRAINT [PK_RengjRulle] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Selskaper]    Script Date: 08.12.2019 15:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Selskaper](
	[SelID] [int] IDENTITY(1,1) NOT NULL,
	[ArrID] [int] NULL,
	[KundeID] [int] NULL,
	[ArrTypeID] [int] NULL,
	[ArrStedID] [int] NULL,
	[ArrAntall] [smallint] NULL,
	[KuvertPris] [real] NULL,
	[Aperitif] [nvarchar](255) NULL,
	[Meny] [nvarchar](max) NULL,
	[MatID] [int] NULL,
	[Drikke] [nvarchar](255) NULL,
	[Kaffe] [bit] NULL,
	[KaffePris] [real] NULL,
	[AnnenServ] [nvarchar](255) NULL,
	[Orientering] [bit] NULL,
	[Bidrag] [real] NULL,
	[GjestAntall] [smallint] NULL,
	[LeieBåtdekk] [real] NULL,
	[Båtdekk] [bit] NULL,
	[LeieMesseMann] [real] NULL,
	[MannMesse] [bit] NULL,
	[LeieMesseFor] [real] NULL,
	[ForMesse] [bit] NULL,
	[LeieMesseAkt] [real] NULL,
	[AktMesse] [bit] NULL,
	[SeilasTimer] [smallint] NULL,
	[SeilasPris] [real] NULL,
	[OvernattAnt] [smallint] NULL,
	[OvernattPris] [real] NULL,
	[LeieHele] [real] NULL,
	[Hele] [bit] NULL,
	[AnsvNavn] [nvarchar](255) NULL,
	[AnsvTelf] [nvarchar](255) NULL,
	[ArrAnsvID] [int] NULL,
	[ArrAssID] [int] NULL,
	[KundeKontakt] [nvarchar](255) NULL,
	[KundeEpost] [nvarchar](255) NULL,
	[KundeTlf] [nvarchar](255) NULL,
	[BekrID] [int] NULL,
	[Merknader] [nvarchar](max) NULL,
	[Oppgjort] [bit] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Arrangement] PRIMARY KEY CLUSTERED 
(
	[SelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SelskapMat]    Script Date: 08.12.2019 15:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SelskapMat](
	[MatID] [int] IDENTITY(1,1) NOT NULL,
	[MatKode] [nvarchar](2) NOT NULL,
	[MatBeskrivelse] [nvarchar](255) NOT NULL,
	[MatKost] [real] NULL,
 CONSTRAINT [PK_ArrMat] PRIMARY KEY CLUSTERED 
(
	[MatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SelskapStatus]    Script Date: 08.12.2019 15:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SelskapStatus](
	[BekrID] [int] IDENTITY(1,1) NOT NULL,
	[BekrShort] [nvarchar](1) NOT NULL,
	[Bekreftelse] [nvarchar](255) NULL,
	[Arrangering] [bit] NOT NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ArrStatus] PRIMARY KEY CLUSTERED 
(
	[BekrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SelskapSted]    Script Date: 08.12.2019 15:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SelskapSted](
	[ArrStedID] [int] IDENTITY(1,1) NOT NULL,
	[Sted] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_ArrSted] PRIMARY KEY CLUSTERED 
(
	[ArrStedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SelskapTyper]    Script Date: 08.12.2019 15:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SelskapTyper](
	[ArrTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ArrType] [nvarchar](25) NOT NULL,
	[ArrBeskrivelse] [nvarchar](255) NULL,
	[AltaInternt] [bit] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ArrTyper] PRIMARY KEY CLUSTERED 
(
	[ArrTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SelskapVarer]    Script Date: 08.12.2019 15:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SelskapVarer](
	[ArrVareID] [int] IDENTITY(1,1) NOT NULL,
	[SelID] [int] NOT NULL,
	[VareID] [int] NOT NULL,
	[AntFakt] [smallint] NULL,
	[AntBong] [smallint] NULL,
	[AntKontant] [smallint] NULL,
	[Merknader] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skipsledelse]    Script Date: 08.12.2019 15:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skipsledelse](
	[SLID] [int] IDENTITY(1,1) NOT NULL,
	[SesID] [int] NULL,
	[SOID] [int] NULL,
	[PID] [int] NULL,
 CONSTRAINT [PK_Skipsledelse] PRIMARY KEY CLUSTERED 
(
	[SLID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StamBes]    Script Date: 08.12.2019 15:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StamBes](
	[SBID] [int] IDENTITY(1,1) NOT NULL,
	[Stilling] [nchar](20) NULL,
	[Grad] [nchar](15) NULL,
	[SOID] [int] NULL,
	[PrimID] [int] NULL,
	[SekID] [int] NULL,
	[Merknad] [nvarchar](max) NULL,
	[Ubesatt] [bit] NOT NULL,
	[Sekvens] [smallint] NULL,
	[Rapport] [bit] NULL,
	[Alarmpost] [bit] NULL,
	[SivSertKrav] [nchar](10) NULL,
 CONSTRAINT [PK_StamBes] PRIMARY KEY CLUSTERED 
(
	[SBID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StandardEpost]    Script Date: 08.12.2019 15:19:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StandardEpost](
	[StdID] [int] IDENTITY(1,1) NOT NULL,
	[HovedOrdre] [nvarchar](255) NULL,
	[CCOrdre] [nvarchar](255) NULL,
	[HovedFaktGrunn] [nvarchar](255) NULL,
	[CCFaktGrunn] [nvarchar](255) NULL,
	[HovedArrListe] [nvarchar](255) NULL,
	[CCArrListe] [nvarchar](255) NULL,
	[HovedVareBeh] [nvarchar](255) NULL,
	[CCVareBeh] [nvarchar](255) NULL,
	[HovedFaktura] [nvarchar](255) NULL,
	[CCFaktura] [nvarchar](255) NULL,
	[FilbaneLager] [nvarchar](255) NULL,
 CONSTRAINT [PK_StandardEpost] PRIMARY KEY CLUSTERED 
(
	[StdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StandardVerdier]    Script Date: 08.12.2019 15:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StandardVerdier](
	[StdID] [int] IDENTITY(1,1) NOT NULL,
	[TimePrisSeil] [real] NULL,
	[StkPrisBidrag] [real] NULL,
	[StkPrisKaffe] [real] NULL,
	[StkPrisKuvert] [real] NULL,
	[stkPrisOvernatt] [real] NULL,
	[LeieBåtdekk] [real] NULL,
	[LeieMesseMann] [real] NULL,
	[LeieMesseFor] [real] NULL,
	[LeieMesseAkt] [real] NULL,
	[LeieHele] [real] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_StandardVerdier] PRIMARY KEY CLUSTERED 
(
	[StdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Styre]    Script Date: 08.12.2019 15:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Styre](
	[StyreID] [int] IDENTITY(1,1) NOT NULL,
	[SesID] [int] NULL,
	[Styreleder] [int] NULL,
	[Medlem1] [int] NULL,
	[Medlem2] [int] NULL,
	[Medlem3] [int] NULL,
	[Medlem4] [int] NULL,
	[Medlem5] [int] NULL,
	[Annet] [nvarchar](255) NULL,
 CONSTRAINT [PK_Styre] PRIMARY KEY CLUSTERED 
(
	[StyreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VakterLand]    Script Date: 08.12.2019 15:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VakterLand](
	[VLID] [int] IDENTITY(1,1) NOT NULL,
	[DPID] [int] NULL,
	[PID] [int] NULL,
	[ArrID] [int] NULL,
	[Dato] [datetime] NULL,
	[Start] [nvarchar](5) NULL,
	[Slutt] [nvarchar](5) NULL,
	[Merknad] [nvarchar](max) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_VakterLand] PRIMARY KEY CLUSTERED 
(
	[VLID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vaktliste]    Script Date: 08.12.2019 15:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vaktliste](
	[SerID] [int] IDENTITY(1,1) NOT NULL,
	[ArrID] [int] NULL,
	[VaktDato] [datetime] NULL,
	[Start] [nvarchar](5) NULL,
	[Slutt] [nvarchar](5) NULL,
	[Vakt2] [nvarchar](255) NULL,
	[Vakt3] [nvarchar](255) NULL,
	[Rormann] [int] NULL,
	[Utkikk] [int] NULL,
	[Vakt] [int] NULL,
	[Land] [bit] NOT NULL,
	[VaktID] [int] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Vaktliste] PRIMARY KEY CLUSTERED 
(
	[SerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VaktskvarterSjø]    Script Date: 08.12.2019 15:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaktskvarterSjø](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ArrID] [int] NULL,
	[KongensDekk] [nvarchar](max) NULL,
	[KongensMaskin] [nvarchar](max) NULL,
	[DronningensDekk] [nvarchar](max) NULL,
	[DronningensMaskin] [nvarchar](max) NULL,
	[KongensVaktsjef] [nvarchar](max) NULL,
	[KongensMaskinist] [nvarchar](max) NULL,
	[DronningensVaktsjef] [nvarchar](max) NULL,
	[DronningensMaskinist] [nvarchar](max) NULL,
	[BlåttDekk] [nvarchar](max) NULL,
	[BlåttMaskin] [nvarchar](max) NULL,
	[RødtDekk] [nvarchar](max) NULL,
	[RødtMaskin] [nvarchar](max) NULL,
	[BlåttVaktsjef] [nvarchar](max) NULL,
	[BlåttMaskinist] [nvarchar](max) NULL,
	[RødtVaktsjef] [nvarchar](max) NULL,
	[RødtMaskinist] [nvarchar](max) NULL,
	[HvittDekk] [nvarchar](max) NULL,
	[HvittMaskin] [nvarchar](max) NULL,
	[HvittVaktsjef] [nvarchar](max) NULL,
	[HvittMaskinist] [nvarchar](max) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_VaktskvarterSjø] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VareKorr]    Script Date: 08.12.2019 15:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VareKorr](
	[VareKorrID] [int] IDENTITY(1,1) NOT NULL,
	[VareID] [int] NOT NULL,
	[AntKorrig] [smallint] NULL,
	[AntInn] [smallint] NULL,
	[AntTelt] [int] NULL,
	[AntStatusStart] [int] NULL,
	[Bruker] [nvarchar](255) NULL,
	[Merknader] [nvarchar](255) NULL,
	[KorrDato] [date] NULL,
 CONSTRAINT [PK_VareKorr] PRIMARY KEY CLUSTERED 
(
	[VareKorrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Varer]    Script Date: 08.12.2019 15:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Varer](
	[VareID] [int] IDENTITY(1,1) NOT NULL,
	[VareNavn] [nvarchar](255) NULL,
	[VareTypeID] [int] NOT NULL,
	[EnhetVolum] [real] NULL,
	[Emballasje] [nvarchar](10) NULL,
	[PrisInn] [real] NULL,
	[StatusBeholdning] [real] NULL,
	[StatusDato] [date] NULL,
	[AntKorrig] [smallint] NULL,
	[AntInn] [smallint] NULL,
	[AntTelt] [int] NULL,
	[Merknader] [nvarchar](255) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Varer] PRIMARY KEY CLUSTERED 
(
	[VareID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VarerSalg]    Script Date: 08.12.2019 15:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VarerSalg](
	[VareSalgID] [int] IDENTITY(1,1) NOT NULL,
	[VareID] [int] NOT NULL,
	[PrisUt] [real] NULL,
	[SkjenkeAntall] [smallint] NULL,
	[Skjenkemål] [nvarchar](255) NULL,
	[AntFakt] [smallint] NULL,
	[AntBong] [smallint] NULL,
	[AntKontant] [smallint] NULL,
	[Merknader] [nvarchar](255) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_VarerSalg] PRIMARY KEY CLUSTERED 
(
	[VareSalgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VareTyper]    Script Date: 08.12.2019 15:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VareTyper](
	[VareTypeID] [int] IDENTITY(1,1) NOT NULL,
	[VareType] [nvarchar](1) NOT NULL,
	[VareBeskrivelse] [nvarchar](255) NULL,
 CONSTRAINT [PK_VareTyper] PRIMARY KEY CLUSTERED 
(
	[VareTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xBrukere]    Script Date: 08.12.2019 15:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xBrukere](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Bruker] [nvarchar](255) NULL,
	[Passord] [nvarchar](255) NULL,
	[BrukerNavn] [nvarchar](255) NULL,
	[Admin] [bit] NOT NULL,
	[Arrang] [bit] NULL,
	[Medl] [bit] NULL,
	[Begrenset] [bit] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_xBrukere] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xBunks]    Script Date: 08.12.2019 15:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xBunks](
	[BunkID] [int] IDENTITY(1,1) NOT NULL,
	[Rom] [nvarchar](255) NULL,
	[Bunk] [nvarchar](255) NULL,
	[Side] [nvarchar](255) NULL,
	[Bunkrekke] [nvarchar](10) NULL,
	[Vertikal] [nvarchar](255) NULL,
	[Forkort] [nvarchar](255) NULL,
	[BrukesAv] [nvarchar](255) NULL,
	[RomSekv] [smallint] NULL,
 CONSTRAINT [PK_xBunks] PRIMARY KEY CLUSTERED 
(
	[BunkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xFagområde]    Script Date: 08.12.2019 15:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xFagområde](
	[FagID] [int] IDENTITY(1,1) NOT NULL,
	[FagOmr] [nvarchar](255) NULL,
	[FormSekv] [smallint] NULL,
 CONSTRAINT [PK_XFagområde] PRIMARY KEY CLUSTERED 
(
	[FagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xKompEnhet]    Script Date: 08.12.2019 15:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xKompEnhet](
	[KEID] [int] IDENTITY(1,1) NOT NULL,
	[KompEnhet] [nvarchar](255) NULL,
	[TeoriKrav] [nvarchar](max) NULL,
	[PraksisKrav] [nvarchar](max) NULL,
	[Referanser] [nvarchar](max) NULL,
	[Godkjenner] [nvarchar](255) NULL,
	[KravMinimum] [bit] NULL,
	[WorkUp] [bit] NULL,
	[SertSikkerh] [bit] NULL,
	[SertDO] [bit] NULL,
	[SertMO] [bit] NULL,
	[SertEO] [bit] NULL,
	[Flag] [bit] NOT NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_xKompEnhet] PRIMARY KEY CLUSTERED 
(
	[KEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xRengjPoster]    Script Date: 08.12.2019 15:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xRengjPoster](
	[RenID] [int] IDENTITY(1,1) NOT NULL,
	[RengjSted] [nvarchar](255) NULL,
	[Sekvens] [smallint] NULL,
 CONSTRAINT [PK_xRengjPoster] PRIMARY KEY CLUSTERED 
(
	[RenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xRulleMooring]    Script Date: 08.12.2019 15:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xRulleMooring](
	[RFID] [int] IDENTITY(1,1) NOT NULL,
	[MooringSted] [nvarchar](255) NULL,
	[MinimumAnt] [smallint] NULL,
	[IkkeRulle] [bit] NOT NULL,
	[Avvik] [smallint] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_xRulleMooring] PRIMARY KEY CLUSTERED 
(
	[RFID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xSteder]    Script Date: 08.12.2019 15:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xSteder](
	[Sted] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_xSteder] PRIMARY KEY CLUSTERED 
(
	[Sted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xStillingKompEnhet]    Script Date: 08.12.2019 15:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xStillingKompEnhet](
	[SKID] [int] IDENTITY(1,1) NOT NULL,
	[SOID] [int] NULL,
	[KEID] [int] NULL,
 CONSTRAINT [PK_xStillingKompEnhet] PRIMARY KEY CLUSTERED 
(
	[SKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xStillingOmb]    Script Date: 08.12.2019 15:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xStillingOmb](
	[SOID] [int] IDENTITY(1,1) NOT NULL,
	[StillingOmb] [nvarchar](255) NULL,
	[FagID] [int] NULL,
	[IkkeMannskap] [bit] NOT NULL,
	[SekvNr] [smallint] NULL,
	[SekvNrSOB] [smallint] NULL,
	[Ledelse] [bit] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_xStillingOmb] PRIMARY KEY CLUSTERED 
(
	[SOID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xStillingOmbPre]    Script Date: 08.12.2019 15:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xStillingOmbPre](
	[SHID] [int] IDENTITY(1,1) NOT NULL,
	[SOID] [int] NULL,
	[SOPreID] [int] NULL,
	[PreSekv] [smallint] NULL,
 CONSTRAINT [PK_FagKompPre] PRIMARY KEY CLUSTERED 
(
	[SHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xVaktPoster]    Script Date: 08.12.2019 15:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xVaktPoster](
	[VPID] [int] IDENTITY(1,1) NOT NULL,
	[VaktType] [nvarchar](255) NULL,
 CONSTRAINT [PK_xVaktPoster] PRIMARY KEY CLUSTERED 
(
	[VPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xVerv]    Script Date: 08.12.2019 15:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xVerv](
	[VvID] [int] IDENTITY(1,1) NOT NULL,
	[Verv] [nvarchar](50) NULL,
 CONSTRAINT [PK_xVerv] PRIMARY KEY CLUSTERED 
(
	[VvID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zRapporter]    Script Date: 08.12.2019 15:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zRapporter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ApplNr] [smallint] NULL,
	[Rapport] [nvarchar](255) NULL,
	[RepNr] [smallint] NULL,
	[TabNr] [smallint] NULL,
	[Spesial] [bit] NULL,
 CONSTRAINT [zRapporter$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Arrangementer]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Arrangementer] ON [dbo].[Arrangementer]
(
	[SesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Arrangementer_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Arrangementer_1] ON [dbo].[Arrangementer]
(
	[TurReturID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Arrangementer_2]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Arrangementer_2] ON [dbo].[Arrangementer]
(
	[TurReturID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BunkTildeling]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_BunkTildeling] ON [dbo].[BunkTildeling]
(
	[ArrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BunkTildeling_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_BunkTildeling_1] ON [dbo].[BunkTildeling]
(
	[BunkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BunkTildeling_2]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_BunkTildeling_2] ON [dbo].[BunkTildeling]
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DagAktivitet]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_DagAktivitet] ON [dbo].[DagAktivitet]
(
	[DPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Deltagelse]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Deltagelse] ON [dbo].[Deltagelse]
(
	[ArrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Deltagelse_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Deltagelse_1] ON [dbo].[Deltagelse]
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Deltagelse_2]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Deltagelse_2] ON [dbo].[Deltagelse]
(
	[RenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Deltagelse_3]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Deltagelse_3] ON [dbo].[Deltagelse]
(
	[SOID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Deltagelse_4]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Deltagelse_4] ON [dbo].[Deltagelse]
(
	[VPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Deltagelse_5]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Deltagelse_5] ON [dbo].[Deltagelse]
(
	[Besetning] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Deltagelse_6]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Deltagelse_6] ON [dbo].[Deltagelse]
(
	[Venteliste] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Dugnader]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Dugnader] ON [dbo].[Dugnader]
(
	[SesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DugnadInnsats]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_DugnadInnsats] ON [dbo].[DugnadInnsats]
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DugnadInnsats_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_DugnadInnsats_1] ON [dbo].[DugnadInnsats]
(
	[DugID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Fartoylag]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Fartoylag] ON [dbo].[Fartoylag]
(
	[SesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Fartoylag_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Fartoylag_1] ON [dbo].[Fartoylag]
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Fartoylag_2]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Fartoylag_2] ON [dbo].[Fartoylag]
(
	[VvID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Gjester]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Gjester] ON [dbo].[Gjester]
(
	[ArrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Keys]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Keys] ON [dbo].[Keys]
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_KompEnhetPerson]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_KompEnhetPerson] ON [dbo].[KompEnhetPerson]
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_KompEnhetPerson_2]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_KompEnhetPerson_2] ON [dbo].[KompEnhetPerson]
(
	[KEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Konto]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Konto] ON [dbo].[Konto]
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MedlemEffekter]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_MedlemEffekter] ON [dbo].[MedlemEffekter]
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MedlemEffekter_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_MedlemEffekter_1] ON [dbo].[MedlemEffekter]
(
	[EffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MedlemSesong]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_MedlemSesong] ON [dbo].[MedlemSesong]
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MedlemSesong_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_MedlemSesong_1] ON [dbo].[MedlemSesong]
(
	[SesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParkerArr]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_ParkerArr] ON [dbo].[ParkerArr]
(
	[ArrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParkerArr_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_ParkerArr_1] ON [dbo].[ParkerArr]
(
	[ParkDato] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParkerPersoner]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_ParkerPersoner] ON [dbo].[ParkerPersoner]
(
	[ParkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ParkerPersoner_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_ParkerPersoner_1] ON [dbo].[ParkerPersoner]
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Personer]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Personer] ON [dbo].[Personer]
(
	[RFID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Personer_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Personer_1] ON [dbo].[Personer]
(
	[SOID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Personer_2]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Personer_2] ON [dbo].[Personer]
(
	[FagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Personer_3]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Personer_3] ON [dbo].[Personer]
(
	[InnmeldtDato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Personer_4]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Personer_4] ON [dbo].[Personer]
(
	[IkkeEpost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Personer_5]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Personer_5] ON [dbo].[Personer]
(
	[IkkePost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Personer_6]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Personer_6] ON [dbo].[Personer]
(
	[Medlem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RengjRulle]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_RengjRulle] ON [dbo].[RengjRulle]
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RengjRulle_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_RengjRulle_1] ON [dbo].[RengjRulle]
(
	[RenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RengjRulle_2]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_RengjRulle_2] ON [dbo].[RengjRulle]
(
	[ArrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Arrangement]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Arrangement] ON [dbo].[Selskaper]
(
	[KundeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Arrangement_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Arrangement_1] ON [dbo].[Selskaper]
(
	[ArrAnsvID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Arrangement_2]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Arrangement_2] ON [dbo].[Selskaper]
(
	[ArrStedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Arrangement_3]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Arrangement_3] ON [dbo].[Selskaper]
(
	[ArrTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Arrangement_4]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Arrangement_4] ON [dbo].[Selskaper]
(
	[BekrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Arrangement_5]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Arrangement_5] ON [dbo].[Selskaper]
(
	[SelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Arrangement_7]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Arrangement_7] ON [dbo].[Selskaper]
(
	[MatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Selskaper]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Selskaper] ON [dbo].[Selskaper]
(
	[ArrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArrVarer]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_ArrVarer] ON [dbo].[SelskapVarer]
(
	[SelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArrVarer_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_ArrVarer_1] ON [dbo].[SelskapVarer]
(
	[VareID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Skipsledelse]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Skipsledelse] ON [dbo].[Skipsledelse]
(
	[SesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Skipsledelse_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Skipsledelse_1] ON [dbo].[Skipsledelse]
(
	[SOID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Skipsledelse_2]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Skipsledelse_2] ON [dbo].[Skipsledelse]
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Styre]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Styre] ON [dbo].[Styre]
(
	[SesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_VakterLand]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_VakterLand] ON [dbo].[VakterLand]
(
	[DPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_VakterLand_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_VakterLand_1] ON [dbo].[VakterLand]
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Vaktliste]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Vaktliste] ON [dbo].[Vaktliste]
(
	[ArrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Vaktliste_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Vaktliste_1] ON [dbo].[Vaktliste]
(
	[VaktID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Vaktliste_2]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Vaktliste_2] ON [dbo].[Vaktliste]
(
	[Land] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_VaktskvarterSjø]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_VaktskvarterSjø] ON [dbo].[VaktskvarterSjø]
(
	[ArrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_VareKorr]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_VareKorr] ON [dbo].[VareKorr]
(
	[VareID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Varer]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Varer] ON [dbo].[Varer]
(
	[VareTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_xKompEnhet]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_xKompEnhet] ON [dbo].[xKompEnhet]
(
	[Flag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_xRulleMooring]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_xRulleMooring] ON [dbo].[xRulleMooring]
(
	[IkkeRulle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_xStillingKompEnhet]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_xStillingKompEnhet] ON [dbo].[xStillingKompEnhet]
(
	[KEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_xStillingKompEnhet_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_xStillingKompEnhet_1] ON [dbo].[xStillingKompEnhet]
(
	[SOID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_xStillingOmb]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_xStillingOmb] ON [dbo].[xStillingOmb]
(
	[FagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_xStillingOmb_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_xStillingOmb_1] ON [dbo].[xStillingOmb]
(
	[IkkeMannskap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_xStillingOmbPre]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_xStillingOmbPre] ON [dbo].[xStillingOmbPre]
(
	[SOID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_xStillingOmbPre_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_xStillingOmbPre_1] ON [dbo].[xStillingOmbPre]
(
	[SOPreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Z1Rapporter]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Z1Rapporter] ON [dbo].[zRapporter]
(
	[ApplNr] ASC,
	[RepNr] ASC,
	[TabNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Z1Rapporter_1]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Z1Rapporter_1] ON [dbo].[zRapporter]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Z1Rapporter_2]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [IX_Z1Rapporter_2] ON [dbo].[zRapporter]
(
	[Spesial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [zRapporter$ID]    Script Date: 08.12.2019 15:19:29 ******/
CREATE NONCLUSTERED INDEX [zRapporter$ID] ON [dbo].[zRapporter]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_ArrNavn]  DEFAULT ('ArrNavn') FOR [ArrNavn]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_Sted]  DEFAULT ('Sted') FOR [Sted]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_Varighet]  DEFAULT ((2)) FOR [Varighet]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_Seilas]  DEFAULT ((0)) FOR [Seilas]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_Selskap_1]  DEFAULT ((0)) FOR [Selskap]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_OpenShip]  DEFAULT ((0)) FOR [OpenShip]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_Dugnad]  DEFAULT ((0)) FOR [Dugnad]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_Deltagelse]  DEFAULT ((0)) FOR [Deltagelse]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_Kontingent]  DEFAULT ((0)) FOR [Kontingent]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_Kostdag]  DEFAULT ((0)) FOR [Kostdag]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_Overnatt]  DEFAULT ((0)) FOR [Overnatt]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_Parkering]  DEFAULT ((0)) FOR [Parkering]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_SeskontAvheng]  DEFAULT ((0)) FOR [SeskontAvheng]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_TurReturID]  DEFAULT ((0)) FOR [TurReturID]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_VaktlengdeSeilas]  DEFAULT ((0)) FOR [VaktlengdeSeilas]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_VaktlengdeLand]  DEFAULT ((0)) FOR [VaktlengdeLand]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_Avlyst]  DEFAULT ((0)) FOR [Avlyst]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_Sikkerhetskurs]  DEFAULT ((0)) FOR [Sikkerhetskurs]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_VentelisteArr]  DEFAULT ((0)) FOR [VentelisteArr]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_SesID]  DEFAULT ((110)) FOR [SesID]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_Gangetid]  DEFAULT ((0)) FOR [Gangetid]
GO
ALTER TABLE [dbo].[Arrangementer] ADD  CONSTRAINT [DF_Arrangementer_Distanse]  DEFAULT ((0)) FOR [Distanse]
GO
ALTER TABLE [dbo].[Deltagelse] ADD  CONSTRAINT [DF_Deltagelse_Avmeldt]  DEFAULT ((0)) FOR [Avmeldt]
GO
ALTER TABLE [dbo].[Deltagelse] ADD  CONSTRAINT [DF_Deltagelse_Venteliste]  DEFAULT ((0)) FOR [Venteliste]
GO
ALTER TABLE [dbo].[Deltagelse] ADD  CONSTRAINT [DF_Deltagelse_RengjTildelt]  DEFAULT ((0)) FOR [RengjTildelt]
GO
ALTER TABLE [dbo].[Deltagelse] ADD  CONSTRAINT [DF_Deltagelse_BunkTildelt]  DEFAULT ((0)) FOR [BunkTildelt]
GO
ALTER TABLE [dbo].[Deltagelse] ADD  CONSTRAINT [DF_Deltagelse_Besetning]  DEFAULT ((1)) FOR [Besetning]
GO
ALTER TABLE [dbo].[Deltagelse] ADD  CONSTRAINT [DF_Deltagelse_IkkeBesetning]  DEFAULT ((0)) FOR [IkkeBesetning]
GO
ALTER TABLE [dbo].[Deltagelse] ADD  CONSTRAINT [DF_Deltagelse_Medfarende]  DEFAULT ((0)) FOR [Medfarende]
GO
ALTER TABLE [dbo].[Deltagelse] ADD  CONSTRAINT [DF_Deltagelse_ReiseOpplegg]  DEFAULT ((0)) FOR [ReiseOpplegg]
GO
ALTER TABLE [dbo].[Deltagelse] ADD  CONSTRAINT [DF_Deltagelse_Parkering]  DEFAULT ((0)) FOR [Parkering]
GO
ALTER TABLE [dbo].[Deltagelse] ADD  CONSTRAINT [DF_Deltagelse_Fullmakt]  DEFAULT ((0)) FOR [Fullmakt]
GO
ALTER TABLE [dbo].[Deltagelse] ADD  CONSTRAINT [DF_Deltagelse_Overnatt]  DEFAULT ((0)) FOR [Overnatt]
GO
ALTER TABLE [dbo].[Deltagelse] ADD  CONSTRAINT [DF_Deltagelse_Brannvakt]  DEFAULT ((0)) FOR [Brannvakt]
GO
ALTER TABLE [dbo].[Deltagelse] ADD  CONSTRAINT [DF_Deltagelse_Flag]  DEFAULT ((0)) FOR [Flag]
GO
ALTER TABLE [dbo].[Dugnader] ADD  CONSTRAINT [DF_Dugnader_Planl]  DEFAULT ((0)) FOR [Planl]
GO
ALTER TABLE [dbo].[Dugnader] ADD  CONSTRAINT [DF_Dugnader_ArrID]  DEFAULT ((0)) FOR [ArrID]
GO
ALTER TABLE [dbo].[DugnadInnsats] ADD  CONSTRAINT [DF_DugnadInnsats_ArrID]  DEFAULT ((1)) FOR [ArrID]
GO
ALTER TABLE [dbo].[Julekort] ADD  CONSTRAINT [DF_Julekort_julekort]  DEFAULT ((1)) FOR [julekort]
GO
ALTER TABLE [dbo].[Julekort] ADD  CONSTRAINT [DF_Julekort_Privat]  DEFAULT ((0)) FOR [Privat]
GO
ALTER TABLE [dbo].[KompEnhetPerson] ADD  CONSTRAINT [DF_KompEnhetPerson_Godkj]  DEFAULT ((0)) FOR [Godkj]
GO
ALTER TABLE [dbo].[Kunde] ADD  CONSTRAINT [DF_Kunde_AltaInternt]  DEFAULT ((0)) FOR [AltaInternt]
GO
ALTER TABLE [dbo].[Kunde] ADD  CONSTRAINT [DF_Kunde_Sponsor]  DEFAULT ((0)) FOR [Sponsor]
GO
ALTER TABLE [dbo].[MedlemSesong] ADD  CONSTRAINT [DF_MedlemSesong_BetaltKont]  DEFAULT ((0)) FOR [BetaltKont]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_Medlem]  DEFAULT ((0)) FOR [Medlem]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_IkkePost]  DEFAULT ((-1)) FOR [IkkePost]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_IkkeEpost]  DEFAULT ((-1)) FOR [IkkeEpost]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_SOID]  DEFAULT ((1)) FOR [SOID]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_FagID]  DEFAULT ((1)) FOR [FagID]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_Sertifikat]  DEFAULT ((0)) FOR [Sertifikat]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_KvalFag]  DEFAULT ((0)) FOR [KvalFag]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_ReservasjonBilde]  DEFAULT ((0)) FOR [ReservasjonBilde]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_Aktiv]  DEFAULT ((0)) FOR [Aktiv]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_Seilende]  DEFAULT ((0)) FOR [Seilende]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_Medhjelperselskap]  DEFAULT ((0)) FOR [Medhjelperselskap]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_Gjest]  DEFAULT ((0)) FOR [Gjest]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_KvalSjef]  DEFAULT ((0)) FOR [KvalSjef]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_KvalNav]  DEFAULT ((0)) FOR [KvalNav]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_KvalDekk]  DEFAULT ((0)) FOR [KvalDekk]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_KvalDekk1]  DEFAULT ((0)) FOR [KvalGnist]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_KvalMaskin]  DEFAULT ((0)) FOR [KvalMaskin]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_KvalRøyk]  DEFAULT ((0)) FOR [KvalRøyk]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_KvalMaskinist]  DEFAULT ((0)) FOR [KvalMaskinist]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_KvalMaskinsjef]  DEFAULT ((0)) FOR [KvalMaskinsjef]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_KvalElektriker]  DEFAULT ((0)) FOR [KvalElektriker]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_KvalForpleining]  DEFAULT ((0)) FOR [KvalForpleining]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_KvalKokk]  DEFAULT ((0)) FOR [KvalKokk]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_KvalInt]  DEFAULT ((0)) FOR [KvalInt]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_KvalSanitet]  DEFAULT ((0)) FOR [KvalSanitet]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_KvalVakt]  DEFAULT ((0)) FOR [KvalVakt]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_KvalPct]  DEFAULT ((0)) FOR [KvalPct]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_WorkUp_1]  DEFAULT ((0)) FOR [WorkUp]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_SertSikkerh]  DEFAULT ((0)) FOR [SertSikkerh]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_SertDO]  DEFAULT ((0)) FOR [SertDO]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_SertMO]  DEFAULT ((0)) FOR [SertMO]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_SertEO]  DEFAULT ((0)) FOR [SertEO]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_HonMedl]  DEFAULT ((0)) FOR [HonMedl]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_Administrasjon]  DEFAULT ((0)) FOR [Administrasjon]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_Skipsledelse]  DEFAULT ((0)) FOR [Skipsledelse]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_Styret]  DEFAULT ((0)) FOR [Styret]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_Staben]  DEFAULT ((0)) FOR [Staben]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_ParkeringStd]  DEFAULT ((0)) FOR [ParkeringStd]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_KontBetSesong]  DEFAULT ((0)) FOR [KontBetSesong]
GO
ALTER TABLE [dbo].[Personer] ADD  CONSTRAINT [DF_Personer_Flag]  DEFAULT ((0)) FOR [Flag]
GO
ALTER TABLE [dbo].[Selskaper] ADD  CONSTRAINT [DF_Arrangement_Kaffe]  DEFAULT ((0)) FOR [Kaffe]
GO
ALTER TABLE [dbo].[Selskaper] ADD  CONSTRAINT [DF_Arrangement_Orientering]  DEFAULT ((0)) FOR [Orientering]
GO
ALTER TABLE [dbo].[Selskaper] ADD  CONSTRAINT [DF_Arrangement_Båtdekk]  DEFAULT ((0)) FOR [Båtdekk]
GO
ALTER TABLE [dbo].[Selskaper] ADD  CONSTRAINT [DF_Arrangement_MannMesse]  DEFAULT ((0)) FOR [MannMesse]
GO
ALTER TABLE [dbo].[Selskaper] ADD  CONSTRAINT [DF_Arrangement_ForMesse]  DEFAULT ((0)) FOR [ForMesse]
GO
ALTER TABLE [dbo].[Selskaper] ADD  CONSTRAINT [DF_Arrangement_AktMesse]  DEFAULT ((0)) FOR [AktMesse]
GO
ALTER TABLE [dbo].[Selskaper] ADD  CONSTRAINT [DF_Arrangement_SeilasTimer]  DEFAULT ((0)) FOR [SeilasTimer]
GO
ALTER TABLE [dbo].[Selskaper] ADD  CONSTRAINT [DF_Arrangement_OvernattAnt]  DEFAULT ((0)) FOR [OvernattAnt]
GO
ALTER TABLE [dbo].[Selskaper] ADD  CONSTRAINT [DF_Z_Arrangement_LeieHele]  DEFAULT ((0)) FOR [LeieHele]
GO
ALTER TABLE [dbo].[Selskaper] ADD  CONSTRAINT [DF_Z_Arrangement_Hele]  DEFAULT ((0)) FOR [Hele]
GO
ALTER TABLE [dbo].[Selskaper] ADD  CONSTRAINT [DF_Arrangement_BekrID]  DEFAULT ((1)) FOR [BekrID]
GO
ALTER TABLE [dbo].[Selskaper] ADD  CONSTRAINT [DF_Arrangement_Oppgjort]  DEFAULT ((0)) FOR [Oppgjort]
GO
ALTER TABLE [dbo].[SelskapMat] ADD  CONSTRAINT [DF_Z_ArrMat_MatKost]  DEFAULT ((0)) FOR [MatKost]
GO
ALTER TABLE [dbo].[SelskapStatus] ADD  CONSTRAINT [DF_ArrStatus_Arrangering]  DEFAULT ((0)) FOR [Arrangering]
GO
ALTER TABLE [dbo].[SelskapTyper] ADD  CONSTRAINT [DF_ArrTyper_AltaInternt]  DEFAULT ((0)) FOR [AltaInternt]
GO
ALTER TABLE [dbo].[SelskapVarer] ADD  CONSTRAINT [DF_Z_ArrVarer_AntFakt]  DEFAULT ((0)) FOR [AntFakt]
GO
ALTER TABLE [dbo].[SelskapVarer] ADD  CONSTRAINT [DF_Z_ArrVarer_AntBong]  DEFAULT ((0)) FOR [AntBong]
GO
ALTER TABLE [dbo].[SelskapVarer] ADD  CONSTRAINT [DF_Z_ArrVarer_AntKontant]  DEFAULT ((0)) FOR [AntKontant]
GO
ALTER TABLE [dbo].[StamBes] ADD  CONSTRAINT [DF_StamBes_Ubesatt]  DEFAULT ((0)) FOR [Ubesatt]
GO
ALTER TABLE [dbo].[StamBes] ADD  CONSTRAINT [DF_StamBes_Rapport]  DEFAULT ((0)) FOR [Rapport]
GO
ALTER TABLE [dbo].[StamBes] ADD  CONSTRAINT [DF_StamBes_Alarmpost_1]  DEFAULT ((0)) FOR [Alarmpost]
GO
ALTER TABLE [dbo].[StandardVerdier] ADD  CONSTRAINT [DF_Z_StandardVerdier_LeieHele]  DEFAULT ((0)) FOR [LeieHele]
GO
ALTER TABLE [dbo].[Vaktliste] ADD  CONSTRAINT [DF_Vaktliste_Land]  DEFAULT ((0)) FOR [Land]
GO
ALTER TABLE [dbo].[xBrukere] ADD  CONSTRAINT [DF_xBrukere_Admin]  DEFAULT ((0)) FOR [Admin]
GO
ALTER TABLE [dbo].[xBrukere] ADD  CONSTRAINT [DF_xBrukere_Arrang]  DEFAULT ((0)) FOR [Arrang]
GO
ALTER TABLE [dbo].[xBrukere] ADD  CONSTRAINT [DF_xBrukere_Medl]  DEFAULT ((0)) FOR [Medl]
GO
ALTER TABLE [dbo].[xBrukere] ADD  CONSTRAINT [DF_xBrukere_BrukerType]  DEFAULT ((0)) FOR [Begrenset]
GO
ALTER TABLE [dbo].[xKompEnhet] ADD  CONSTRAINT [DF_xKompEnhet_KravMinimum_1]  DEFAULT ((0)) FOR [KravMinimum]
GO
ALTER TABLE [dbo].[xKompEnhet] ADD  CONSTRAINT [DF_xKompEnhet_WorkUp]  DEFAULT ((0)) FOR [WorkUp]
GO
ALTER TABLE [dbo].[xKompEnhet] ADD  CONSTRAINT [DF_xKompEnhet_SertSikkerh]  DEFAULT ((0)) FOR [SertSikkerh]
GO
ALTER TABLE [dbo].[xKompEnhet] ADD  CONSTRAINT [DF_xKompEnhet_SertDO]  DEFAULT ((0)) FOR [SertDO]
GO
ALTER TABLE [dbo].[xKompEnhet] ADD  CONSTRAINT [DF_xKompEnhet_SertMO]  DEFAULT ((0)) FOR [SertMO]
GO
ALTER TABLE [dbo].[xKompEnhet] ADD  CONSTRAINT [DF_xKompEnhet_SertEO]  DEFAULT ((0)) FOR [SertEO]
GO
ALTER TABLE [dbo].[xKompEnhet] ADD  CONSTRAINT [DF_xKompEnhet_Flag]  DEFAULT ((0)) FOR [Flag]
GO
ALTER TABLE [dbo].[xRulleMooring] ADD  CONSTRAINT [DF_xRulleMooring_IkkeRulle]  DEFAULT ((0)) FOR [IkkeRulle]
GO
ALTER TABLE [dbo].[xSesonger] ADD  CONSTRAINT [DF_xSesonger_MedlChk]  DEFAULT ((0)) FOR [MedlChk]
GO
ALTER TABLE [dbo].[xStillingOmb] ADD  CONSTRAINT [DF_xStillingOmb_IkkeMannskap]  DEFAULT ((0)) FOR [IkkeMannskap]
GO
ALTER TABLE [dbo].[xStillingOmb] ADD  CONSTRAINT [DF_xStillingOmb_Ledelse]  DEFAULT ((0)) FOR [Ledelse]
GO
ALTER TABLE [dbo].[xStillingOmbPre] ADD  CONSTRAINT [DF_xStillingOmbPre_PreSekv]  DEFAULT ((1)) FOR [PreSekv]
GO
ALTER TABLE [dbo].[zRapporter] ADD  CONSTRAINT [DF__zRapporte__RepNr__74D93D45]  DEFAULT ((0)) FOR [RepNr]
GO
ALTER TABLE [dbo].[zRapporter] ADD  CONSTRAINT [DF__zRapporte__TabNr__75CD617E]  DEFAULT ((0)) FOR [TabNr]
GO
ALTER TABLE [dbo].[zRapporter] ADD  CONSTRAINT [DF__zRapporte__Seila__76C185B7]  DEFAULT ((0)) FOR [Spesial]
GO
ALTER TABLE [dbo].[Arrangementer]  WITH CHECK ADD  CONSTRAINT [FK_Arrangementer_xSesonger] FOREIGN KEY([SesID])
REFERENCES [dbo].[xSesonger] ([SesID])
GO
ALTER TABLE [dbo].[Arrangementer] CHECK CONSTRAINT [FK_Arrangementer_xSesonger]
GO
ALTER TABLE [dbo].[BunkTildeling]  WITH CHECK ADD  CONSTRAINT [FK_BunkTildeling_Arrangementer] FOREIGN KEY([ArrID])
REFERENCES [dbo].[Arrangementer] ([ArrID])
GO
ALTER TABLE [dbo].[BunkTildeling] CHECK CONSTRAINT [FK_BunkTildeling_Arrangementer]
GO
ALTER TABLE [dbo].[BunkTildeling]  WITH CHECK ADD  CONSTRAINT [FK_BunkTildeling_Personer] FOREIGN KEY([PID])
REFERENCES [dbo].[Personer] ([PID])
GO
ALTER TABLE [dbo].[BunkTildeling] CHECK CONSTRAINT [FK_BunkTildeling_Personer]
GO
ALTER TABLE [dbo].[BunkTildeling]  WITH CHECK ADD  CONSTRAINT [FK_BunkTildeling_xBunks] FOREIGN KEY([BunkID])
REFERENCES [dbo].[xBunks] ([BunkID])
GO
ALTER TABLE [dbo].[BunkTildeling] CHECK CONSTRAINT [FK_BunkTildeling_xBunks]
GO
ALTER TABLE [dbo].[DagAktivitet]  WITH CHECK ADD  CONSTRAINT [FK_DagAktivitet_DagsProgram] FOREIGN KEY([DPID])
REFERENCES [dbo].[DagsProgram] ([DPID])
GO
ALTER TABLE [dbo].[DagAktivitet] CHECK CONSTRAINT [FK_DagAktivitet_DagsProgram]
GO
ALTER TABLE [dbo].[Deltagelse]  WITH CHECK ADD  CONSTRAINT [FK_Deltagelse_Arrangementer] FOREIGN KEY([ArrID])
REFERENCES [dbo].[Arrangementer] ([ArrID])
GO
ALTER TABLE [dbo].[Deltagelse] CHECK CONSTRAINT [FK_Deltagelse_Arrangementer]
GO
ALTER TABLE [dbo].[Deltagelse]  WITH CHECK ADD  CONSTRAINT [FK_Deltagelse_Personer] FOREIGN KEY([PID])
REFERENCES [dbo].[Personer] ([PID])
GO
ALTER TABLE [dbo].[Deltagelse] CHECK CONSTRAINT [FK_Deltagelse_Personer]
GO
ALTER TABLE [dbo].[Deltagelse]  WITH CHECK ADD  CONSTRAINT [FK_Deltagelse_xRengjPoster] FOREIGN KEY([RenID])
REFERENCES [dbo].[xRengjPoster] ([RenID])
GO
ALTER TABLE [dbo].[Deltagelse] CHECK CONSTRAINT [FK_Deltagelse_xRengjPoster]
GO
ALTER TABLE [dbo].[Deltagelse]  WITH CHECK ADD  CONSTRAINT [FK_Deltagelse_xRulleMooring] FOREIGN KEY([RFID])
REFERENCES [dbo].[xRulleMooring] ([RFID])
GO
ALTER TABLE [dbo].[Deltagelse] CHECK CONSTRAINT [FK_Deltagelse_xRulleMooring]
GO
ALTER TABLE [dbo].[Deltagelse]  WITH CHECK ADD  CONSTRAINT [FK_Deltagelse_xStillingOmb] FOREIGN KEY([SOID])
REFERENCES [dbo].[xStillingOmb] ([SOID])
GO
ALTER TABLE [dbo].[Deltagelse] CHECK CONSTRAINT [FK_Deltagelse_xStillingOmb]
GO
ALTER TABLE [dbo].[Deltagelse]  WITH CHECK ADD  CONSTRAINT [FK_Deltagelse_xVaktPoster] FOREIGN KEY([VPID])
REFERENCES [dbo].[xVaktPoster] ([VPID])
GO
ALTER TABLE [dbo].[Deltagelse] CHECK CONSTRAINT [FK_Deltagelse_xVaktPoster]
GO
ALTER TABLE [dbo].[Dugnader]  WITH CHECK ADD  CONSTRAINT [FK_Dugnader_xSesonger] FOREIGN KEY([SesID])
REFERENCES [dbo].[xSesonger] ([SesID])
GO
ALTER TABLE [dbo].[Dugnader] CHECK CONSTRAINT [FK_Dugnader_xSesonger]
GO
ALTER TABLE [dbo].[DugnadInnsats]  WITH CHECK ADD  CONSTRAINT [FK_DugnadInnsats_Arrangementer] FOREIGN KEY([ArrID])
REFERENCES [dbo].[Arrangementer] ([ArrID])
GO
ALTER TABLE [dbo].[DugnadInnsats] CHECK CONSTRAINT [FK_DugnadInnsats_Arrangementer]
GO
ALTER TABLE [dbo].[DugnadInnsats]  WITH CHECK ADD  CONSTRAINT [FK_DugnadInnsats_Dugnader] FOREIGN KEY([DugID])
REFERENCES [dbo].[Dugnader] ([DugID])
GO
ALTER TABLE [dbo].[DugnadInnsats] CHECK CONSTRAINT [FK_DugnadInnsats_Dugnader]
GO
ALTER TABLE [dbo].[DugnadInnsats]  WITH CHECK ADD  CONSTRAINT [FK_DugnadInnsats_Personer] FOREIGN KEY([PID])
REFERENCES [dbo].[Personer] ([PID])
GO
ALTER TABLE [dbo].[DugnadInnsats] CHECK CONSTRAINT [FK_DugnadInnsats_Personer]
GO
ALTER TABLE [dbo].[Fartoylag]  WITH CHECK ADD  CONSTRAINT [FK_Fartoylag_Personer] FOREIGN KEY([PID])
REFERENCES [dbo].[Personer] ([PID])
GO
ALTER TABLE [dbo].[Fartoylag] CHECK CONSTRAINT [FK_Fartoylag_Personer]
GO
ALTER TABLE [dbo].[Fartoylag]  WITH CHECK ADD  CONSTRAINT [FK_Fartoylag_xSesonger] FOREIGN KEY([VvID])
REFERENCES [dbo].[xVerv] ([VvID])
GO
ALTER TABLE [dbo].[Fartoylag] CHECK CONSTRAINT [FK_Fartoylag_xSesonger]
GO
ALTER TABLE [dbo].[Fartoylag]  WITH CHECK ADD  CONSTRAINT [FK_Fartoylag_xVerv] FOREIGN KEY([VvID])
REFERENCES [dbo].[xVerv] ([VvID])
GO
ALTER TABLE [dbo].[Fartoylag] CHECK CONSTRAINT [FK_Fartoylag_xVerv]
GO
ALTER TABLE [dbo].[Gjester]  WITH CHECK ADD  CONSTRAINT [FK_Gjester_Arrangementer] FOREIGN KEY([ArrID])
REFERENCES [dbo].[Arrangementer] ([ArrID])
GO
ALTER TABLE [dbo].[Gjester] CHECK CONSTRAINT [FK_Gjester_Arrangementer]
GO
ALTER TABLE [dbo].[Keys]  WITH CHECK ADD  CONSTRAINT [FK_Keys_Keys] FOREIGN KEY([PID])
REFERENCES [dbo].[Personer] ([PID])
GO
ALTER TABLE [dbo].[Keys] CHECK CONSTRAINT [FK_Keys_Keys]
GO
ALTER TABLE [dbo].[KompEnhetPerson]  WITH CHECK ADD  CONSTRAINT [FK_KompEnhetPerson_Personer] FOREIGN KEY([PID])
REFERENCES [dbo].[Personer] ([PID])
GO
ALTER TABLE [dbo].[KompEnhetPerson] CHECK CONSTRAINT [FK_KompEnhetPerson_Personer]
GO
ALTER TABLE [dbo].[KompEnhetPerson]  WITH CHECK ADD  CONSTRAINT [FK_KompEnhetPerson_Personer1] FOREIGN KEY([PID])
REFERENCES [dbo].[Personer] ([PID])
GO
ALTER TABLE [dbo].[KompEnhetPerson] CHECK CONSTRAINT [FK_KompEnhetPerson_Personer1]
GO
ALTER TABLE [dbo].[KompEnhetPerson]  WITH CHECK ADD  CONSTRAINT [FK_KompEnhetPerson_xKompEnhet] FOREIGN KEY([KEID])
REFERENCES [dbo].[xKompEnhet] ([KEID])
GO
ALTER TABLE [dbo].[KompEnhetPerson] CHECK CONSTRAINT [FK_KompEnhetPerson_xKompEnhet]
GO
ALTER TABLE [dbo].[Konto]  WITH CHECK ADD  CONSTRAINT [FK_Konto_Konto] FOREIGN KEY([PID])
REFERENCES [dbo].[Personer] ([PID])
GO
ALTER TABLE [dbo].[Konto] CHECK CONSTRAINT [FK_Konto_Konto]
GO
ALTER TABLE [dbo].[MedlemEffekter]  WITH CHECK ADD  CONSTRAINT [FK_MedlemEffekter_Effekter] FOREIGN KEY([EffID])
REFERENCES [dbo].[Effekter] ([EffID])
GO
ALTER TABLE [dbo].[MedlemEffekter] CHECK CONSTRAINT [FK_MedlemEffekter_Effekter]
GO
ALTER TABLE [dbo].[MedlemEffekter]  WITH CHECK ADD  CONSTRAINT [FK_MedlemEffekter_Personer] FOREIGN KEY([PID])
REFERENCES [dbo].[Personer] ([PID])
GO
ALTER TABLE [dbo].[MedlemEffekter] CHECK CONSTRAINT [FK_MedlemEffekter_Personer]
GO
ALTER TABLE [dbo].[MedlemSesong]  WITH CHECK ADD  CONSTRAINT [FK_MedlemSesong_Personer] FOREIGN KEY([PID])
REFERENCES [dbo].[Personer] ([PID])
GO
ALTER TABLE [dbo].[MedlemSesong] CHECK CONSTRAINT [FK_MedlemSesong_Personer]
GO
ALTER TABLE [dbo].[MedlemSesong]  WITH CHECK ADD  CONSTRAINT [FK_MedlemSesong_xSesonger] FOREIGN KEY([SesID])
REFERENCES [dbo].[xSesonger] ([SesID])
GO
ALTER TABLE [dbo].[MedlemSesong] CHECK CONSTRAINT [FK_MedlemSesong_xSesonger]
GO
ALTER TABLE [dbo].[ParkerArr]  WITH CHECK ADD  CONSTRAINT [FK_ParkerArr_Arrangementer] FOREIGN KEY([ArrID])
REFERENCES [dbo].[Arrangementer] ([ArrID])
GO
ALTER TABLE [dbo].[ParkerArr] CHECK CONSTRAINT [FK_ParkerArr_Arrangementer]
GO
ALTER TABLE [dbo].[ParkerPersoner]  WITH CHECK ADD  CONSTRAINT [FK_ParkerPersoner_ParkerArr] FOREIGN KEY([ParkID])
REFERENCES [dbo].[ParkerArr] ([ParkID])
GO
ALTER TABLE [dbo].[ParkerPersoner] CHECK CONSTRAINT [FK_ParkerPersoner_ParkerArr]
GO
ALTER TABLE [dbo].[ParkerPersoner]  WITH CHECK ADD  CONSTRAINT [FK_ParkerPersoner_Personer] FOREIGN KEY([PID])
REFERENCES [dbo].[Personer] ([PID])
GO
ALTER TABLE [dbo].[ParkerPersoner] CHECK CONSTRAINT [FK_ParkerPersoner_Personer]
GO
ALTER TABLE [dbo].[Personer]  WITH CHECK ADD  CONSTRAINT [FK_Personer_StamBes] FOREIGN KEY([SBID])
REFERENCES [dbo].[StamBes] ([SBID])
GO
ALTER TABLE [dbo].[Personer] CHECK CONSTRAINT [FK_Personer_StamBes]
GO
ALTER TABLE [dbo].[Personer]  WITH CHECK ADD  CONSTRAINT [FK_Personer_xRulleMooring] FOREIGN KEY([RFID])
REFERENCES [dbo].[xRulleMooring] ([RFID])
GO
ALTER TABLE [dbo].[Personer] CHECK CONSTRAINT [FK_Personer_xRulleMooring]
GO
ALTER TABLE [dbo].[Personer]  WITH CHECK ADD  CONSTRAINT [FK_Personer_xStillingOmb] FOREIGN KEY([SOID])
REFERENCES [dbo].[xStillingOmb] ([SOID])
GO
ALTER TABLE [dbo].[Personer] CHECK CONSTRAINT [FK_Personer_xStillingOmb]
GO
ALTER TABLE [dbo].[RengjRulle]  WITH CHECK ADD  CONSTRAINT [FK_RengjRulle_Arrangementer] FOREIGN KEY([ArrID])
REFERENCES [dbo].[Arrangementer] ([ArrID])
GO
ALTER TABLE [dbo].[RengjRulle] CHECK CONSTRAINT [FK_RengjRulle_Arrangementer]
GO
ALTER TABLE [dbo].[RengjRulle]  WITH CHECK ADD  CONSTRAINT [FK_RengjRulle_Personer] FOREIGN KEY([PID])
REFERENCES [dbo].[Personer] ([PID])
GO
ALTER TABLE [dbo].[RengjRulle] CHECK CONSTRAINT [FK_RengjRulle_Personer]
GO
ALTER TABLE [dbo].[RengjRulle]  WITH CHECK ADD  CONSTRAINT [FK_RengjRulle_xRengjPoster] FOREIGN KEY([RenID])
REFERENCES [dbo].[xRengjPoster] ([RenID])
GO
ALTER TABLE [dbo].[RengjRulle] CHECK CONSTRAINT [FK_RengjRulle_xRengjPoster]
GO
ALTER TABLE [dbo].[Selskaper]  WITH CHECK ADD  CONSTRAINT [FK_Selskaper_Arrangementer] FOREIGN KEY([ArrID])
REFERENCES [dbo].[Arrangementer] ([ArrID])
GO
ALTER TABLE [dbo].[Selskaper] CHECK CONSTRAINT [FK_Selskaper_Arrangementer]
GO
ALTER TABLE [dbo].[Selskaper]  WITH CHECK ADD  CONSTRAINT [FK_Selskaper_Kunde] FOREIGN KEY([KundeID])
REFERENCES [dbo].[Kunde] ([KundeID])
GO
ALTER TABLE [dbo].[Selskaper] CHECK CONSTRAINT [FK_Selskaper_Kunde]
GO
ALTER TABLE [dbo].[Selskaper]  WITH CHECK ADD  CONSTRAINT [FK_Selskaper_Personer] FOREIGN KEY([ArrAnsvID])
REFERENCES [dbo].[Personer] ([PID])
GO
ALTER TABLE [dbo].[Selskaper] CHECK CONSTRAINT [FK_Selskaper_Personer]
GO
ALTER TABLE [dbo].[Selskaper]  WITH CHECK ADD  CONSTRAINT [FK_Selskaper_Personer1] FOREIGN KEY([ArrAssID])
REFERENCES [dbo].[Personer] ([PID])
GO
ALTER TABLE [dbo].[Selskaper] CHECK CONSTRAINT [FK_Selskaper_Personer1]
GO
ALTER TABLE [dbo].[Selskaper]  WITH CHECK ADD  CONSTRAINT [FK_Selskaper_SelskapMat] FOREIGN KEY([MatID])
REFERENCES [dbo].[SelskapMat] ([MatID])
GO
ALTER TABLE [dbo].[Selskaper] CHECK CONSTRAINT [FK_Selskaper_SelskapMat]
GO
ALTER TABLE [dbo].[Selskaper]  WITH CHECK ADD  CONSTRAINT [FK_Selskaper_SelskapSted] FOREIGN KEY([ArrStedID])
REFERENCES [dbo].[SelskapSted] ([ArrStedID])
GO
ALTER TABLE [dbo].[Selskaper] CHECK CONSTRAINT [FK_Selskaper_SelskapSted]
GO
ALTER TABLE [dbo].[Selskaper]  WITH CHECK ADD  CONSTRAINT [FK_Selskaper_SelskapTyper] FOREIGN KEY([ArrTypeID])
REFERENCES [dbo].[SelskapTyper] ([ArrTypeID])
GO
ALTER TABLE [dbo].[Selskaper] CHECK CONSTRAINT [FK_Selskaper_SelskapTyper]
GO
ALTER TABLE [dbo].[SelskapVarer]  WITH CHECK ADD  CONSTRAINT [FK_ArrVarer_Varer] FOREIGN KEY([VareID])
REFERENCES [dbo].[Varer] ([VareID])
GO
ALTER TABLE [dbo].[SelskapVarer] CHECK CONSTRAINT [FK_ArrVarer_Varer]
GO
ALTER TABLE [dbo].[Skipsledelse]  WITH CHECK ADD  CONSTRAINT [FK_Skipsledelse_Personer] FOREIGN KEY([PID])
REFERENCES [dbo].[Personer] ([PID])
GO
ALTER TABLE [dbo].[Skipsledelse] CHECK CONSTRAINT [FK_Skipsledelse_Personer]
GO
ALTER TABLE [dbo].[Skipsledelse]  WITH CHECK ADD  CONSTRAINT [FK_Skipsledelse_xSesonger] FOREIGN KEY([SOID])
REFERENCES [dbo].[xStillingOmb] ([SOID])
GO
ALTER TABLE [dbo].[Skipsledelse] CHECK CONSTRAINT [FK_Skipsledelse_xSesonger]
GO
ALTER TABLE [dbo].[Skipsledelse]  WITH CHECK ADD  CONSTRAINT [FK_Skipsledelse_xStillingOmb] FOREIGN KEY([SOID])
REFERENCES [dbo].[xStillingOmb] ([SOID])
GO
ALTER TABLE [dbo].[Skipsledelse] CHECK CONSTRAINT [FK_Skipsledelse_xStillingOmb]
GO
ALTER TABLE [dbo].[StamBes]  WITH CHECK ADD  CONSTRAINT [FK_StamBes_Personer] FOREIGN KEY([PrimID])
REFERENCES [dbo].[Personer] ([PID])
GO
ALTER TABLE [dbo].[StamBes] CHECK CONSTRAINT [FK_StamBes_Personer]
GO
ALTER TABLE [dbo].[StamBes]  WITH CHECK ADD  CONSTRAINT [FK_StamBes_Personer1] FOREIGN KEY([SekID])
REFERENCES [dbo].[Personer] ([PID])
GO
ALTER TABLE [dbo].[StamBes] CHECK CONSTRAINT [FK_StamBes_Personer1]
GO
ALTER TABLE [dbo].[StamBes]  WITH CHECK ADD  CONSTRAINT [FK_StamBes_xStillingOmb] FOREIGN KEY([SOID])
REFERENCES [dbo].[xStillingOmb] ([SOID])
GO
ALTER TABLE [dbo].[StamBes] CHECK CONSTRAINT [FK_StamBes_xStillingOmb]
GO
ALTER TABLE [dbo].[Styre]  WITH CHECK ADD  CONSTRAINT [FK_Styre_xSesonger] FOREIGN KEY([SesID])
REFERENCES [dbo].[xSesonger] ([SesID])
GO
ALTER TABLE [dbo].[Styre] CHECK CONSTRAINT [FK_Styre_xSesonger]
GO
ALTER TABLE [dbo].[VakterLand]  WITH CHECK ADD  CONSTRAINT [FK_VakterLand_Arrangementer] FOREIGN KEY([ArrID])
REFERENCES [dbo].[Arrangementer] ([ArrID])
GO
ALTER TABLE [dbo].[VakterLand] CHECK CONSTRAINT [FK_VakterLand_Arrangementer]
GO
ALTER TABLE [dbo].[VakterLand]  WITH CHECK ADD  CONSTRAINT [FK_VakterLand_DagsProgram] FOREIGN KEY([DPID])
REFERENCES [dbo].[DagsProgram] ([DPID])
GO
ALTER TABLE [dbo].[VakterLand] CHECK CONSTRAINT [FK_VakterLand_DagsProgram]
GO
ALTER TABLE [dbo].[VakterLand]  WITH CHECK ADD  CONSTRAINT [FK_VakterLand_Personer] FOREIGN KEY([PID])
REFERENCES [dbo].[Personer] ([PID])
GO
ALTER TABLE [dbo].[VakterLand] CHECK CONSTRAINT [FK_VakterLand_Personer]
GO
ALTER TABLE [dbo].[Vaktliste]  WITH CHECK ADD  CONSTRAINT [FK_Vaktliste_Arrangementer] FOREIGN KEY([ArrID])
REFERENCES [dbo].[Arrangementer] ([ArrID])
GO
ALTER TABLE [dbo].[Vaktliste] CHECK CONSTRAINT [FK_Vaktliste_Arrangementer]
GO
ALTER TABLE [dbo].[VaktskvarterSjø]  WITH CHECK ADD  CONSTRAINT [FK_VaktskvarterSjø_Arrangementer] FOREIGN KEY([ArrID])
REFERENCES [dbo].[Arrangementer] ([ArrID])
GO
ALTER TABLE [dbo].[VaktskvarterSjø] CHECK CONSTRAINT [FK_VaktskvarterSjø_Arrangementer]
GO
ALTER TABLE [dbo].[VareKorr]  WITH CHECK ADD  CONSTRAINT [FK_VareKorr_Varer] FOREIGN KEY([VareID])
REFERENCES [dbo].[Varer] ([VareID])
GO
ALTER TABLE [dbo].[VareKorr] CHECK CONSTRAINT [FK_VareKorr_Varer]
GO
ALTER TABLE [dbo].[Varer]  WITH CHECK ADD  CONSTRAINT [FK_Varer_VareTyper] FOREIGN KEY([VareTypeID])
REFERENCES [dbo].[VareTyper] ([VareTypeID])
GO
ALTER TABLE [dbo].[Varer] CHECK CONSTRAINT [FK_Varer_VareTyper]
GO
ALTER TABLE [dbo].[VarerSalg]  WITH CHECK ADD  CONSTRAINT [FK_VarerSalg_Varer] FOREIGN KEY([VareID])
REFERENCES [dbo].[Varer] ([VareID])
GO
ALTER TABLE [dbo].[VarerSalg] CHECK CONSTRAINT [FK_VarerSalg_Varer]
GO
ALTER TABLE [dbo].[xStillingKompEnhet]  WITH CHECK ADD  CONSTRAINT [FK_xStillingKompEnhet_xKompEnhet] FOREIGN KEY([KEID])
REFERENCES [dbo].[xKompEnhet] ([KEID])
GO
ALTER TABLE [dbo].[xStillingKompEnhet] CHECK CONSTRAINT [FK_xStillingKompEnhet_xKompEnhet]
GO
ALTER TABLE [dbo].[xStillingKompEnhet]  WITH CHECK ADD  CONSTRAINT [FK_xStillingKompEnhet_xStillingOmb] FOREIGN KEY([SOID])
REFERENCES [dbo].[xStillingOmb] ([SOID])
GO
ALTER TABLE [dbo].[xStillingKompEnhet] CHECK CONSTRAINT [FK_xStillingKompEnhet_xStillingOmb]
GO
ALTER TABLE [dbo].[xStillingOmb]  WITH CHECK ADD  CONSTRAINT [FK_xStillingOmb_XFagområde] FOREIGN KEY([FagID])
REFERENCES [dbo].[xFagområde] ([FagID])
GO
ALTER TABLE [dbo].[xStillingOmb] CHECK CONSTRAINT [FK_xStillingOmb_XFagområde]
GO
ALTER TABLE [dbo].[xStillingOmbPre]  WITH CHECK ADD  CONSTRAINT [FK_xStillingOmbPre_xStillingOmb] FOREIGN KEY([SOID])
REFERENCES [dbo].[xStillingOmb] ([SOID])
GO
ALTER TABLE [dbo].[xStillingOmbPre] CHECK CONSTRAINT [FK_xStillingOmbPre_xStillingOmb]
GO
ALTER TABLE [dbo].[xStillingOmbPre]  WITH CHECK ADD  CONSTRAINT [FK_xStillingOmbPre_xStillingOmb1] FOREIGN KEY([SOPreID])
REFERENCES [dbo].[xStillingOmb] ([SOID])
GO
ALTER TABLE [dbo].[xStillingOmbPre] CHECK CONSTRAINT [FK_xStillingOmbPre_xStillingOmb1]
GO
/****** Object:  StoredProcedure [dbo].[usp_ArrDeltagelse]    Script Date: 08.12.2019 15:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gerhard
-- Create date: 22.07.2018
-- Description:	Deltagerliste for spesifikk ArrID
-- =============================================
CREATE PROCEDURE [dbo].[usp_ArrDeltagelse] 
	-- Add the parameters for the stored procedure here
	@ArrID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Arrangementer.ArrID AS Arrangementer_ArrID, 
		Arrangementer.Seilas, 
		Deltagelse.ArrID AS Deltagelse_ArrID, 
		Deltagelse.PID AS Deltagelse_PID, 
		Deltagelse.Avmeldt, 
		Personer.PID AS Personer_PID, 
		Deltagelse.Venteliste
	FROM Personer RIGHT JOIN (Arrangementer LEFT JOIN Deltagelse ON Arrangementer.ArrID = Deltagelse.ArrID) ON Personer.PID = Deltagelse.PID
	WHERE Deltagelse.Avmeldt = 0 AND Deltagelse.ArrID = @ArrID
	--ORDER BY Deltagelse.Venteliste DESC , Personer.ENavn + ', ' + Personer.FNavn


END
GO
/****** Object:  StoredProcedure [dbo].[usp_ArrGjesterScr]    Script Date: 08.12.2019 15:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gerhard
-- Create date: 22.08.2018
-- Description:	Gjesteliste for spesifikk ArrID
-- =============================================
CREATE PROCEDURE [dbo].[usp_ArrGjesterScr] 
	-- Add the parameters for the stored procedure here
	@ArrID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Gjester.GID,
			Gjester.ArrID,
			Gjester.GjesteNavn,
			Gjester.GjesteAdresse,
			Gjester.GjesteTelefon,
			Gjester.GjesteEpost,
			Gjester.Liferaft,
			Gjester.GjesteNOK,
			Gjester.GjesteNOKAdresse,
			Gjester.GjesteNOKTelefon,
			Gjester.GjesteNOKEpost,
			Gjester.Merknad,
			Gjester.Ansvar, 
			Gjester.SSMA_TimeStamp
		FROM Gjester
			
		WHERE Gjester.ArrID = @ArrID
		ORDER BY Gjester.GjesteNavn;


END
GO
/****** Object:  StoredProcedure [dbo].[usp_AvmeldingerScr]    Script Date: 08.12.2019 15:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gerhard
-- Create date: 07.08.2018
-- Description:	Deltagerliste for spesifikk ArrID
-- =============================================
CREATE PROCEDURE [dbo].[usp_AvmeldingerScr] 
	-- Add the parameters for the stored procedure here
	@ArrID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Deltagelse.ArrID, 
			Deltagelse.PID AS Deltagelse_PID,
			Deltagelse.Avmeldt, 
			Deltagelse.DeltagMerknad,
			Personer.PID AS Personer_PID, 
			Personer.ENavn, 
			Personer.FNavn, 
			Personer.Kalles, 
			[ENavn]+ ', ' + [FNavn] AS Navn,  
			Personer.TelfPrivat, 
			Personer.TelfKontor, 
			Personer.TelfMobil, 
			[TelfPrivat] + ', ' + [TelfKontor] + ', ' + [TelfMobil] AS Telefon, 
			Personer.Epost, 
			[TelfMobil] + ', ' + [Epost] AS TeleMail,
			Personer.Medlemsnummer
		FROM Personer RIGHT JOIN Deltagelse ON Personer.PID = Deltagelse.PID
		WHERE Deltagelse.Avmeldt=1 And Deltagelse.ArrID = @ArrID
		ORDER BY Personer.ENavn, Personer.FNavn;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Besetning]    Script Date: 08.12.2019 15:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gerhard
-- Create date: 22.07.2018
-- Description:	Deltagerliste for spesifikk ArrID
-- =============================================
CREATE PROCEDURE [dbo].[usp_Besetning] 
	-- Add the parameters for the stored procedure here
	@ArrID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Deltagelse.ArrID, 
			Deltagelse.PID,   
			Deltagelse.Venteliste, 
			Deltagelse.Avmeldt,
			Deltagelse.BunkTildelt,
			Deltagelse.RengjTildelt, 
			Deltagelse.RengjPost,
			Personer.PID, 
			Personer.ENavn, 
			Personer.FNavn, 
			Personer.ENavn + ', ' + Personer.FNavn AS Navn
		FROM Personer RIGHT JOIN Deltagelse ON Personer.PID = Deltagelse.PID
		WHERE Deltagelse.Avmeldt = 0 AND Deltagelse.ArrID = @ArrID
		ORDER BY [ENavn] + ', ' + [FNavn];


END
GO
/****** Object:  StoredProcedure [dbo].[usp_BesetningBunks]    Script Date: 08.12.2019 15:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gerhard
-- Create date: 24.08.2018
-- Description:	Rengjøringsrulle for spesifikk ArrID
-- =============================================
CREATE PROCEDURE [dbo].[usp_BesetningBunks] 
	-- Add the parameters for the stored procedure here
	@ArrID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Deltagelse.PID AS Deltagelse_PID,
			[ENavn] + ', ' + [FNavn] AS Navn,
			Deltagelse.Avmeldt, 
			Deltagelse.Venteliste, 
			Deltagelse.ArrID, 
			Deltagelse.BunkTildelt, 
			Deltagelse.RulleKommentar, 
			Deltagelse.RengjTildelt, 
			Deltagelse.RengjPost
		FROM Personer RIGHT JOIN Deltagelse ON Personer.PID = Deltagelse.PID
		WHERE Deltagelse.Avmeldt=0 AND Deltagelse.ArrID = @ArrID
		ORDER BY Navn;
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_BunkTildeling]    Script Date: 08.12.2019 15:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gerhard
-- Create date: 07.08.18
-- Description:	Liste over arrangements køyer for tildeling
-- =============================================
CREATE PROCEDURE [dbo].[usp_BunkTildeling]
	-- Add the parameters for the stored procedure here
	@ArrID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Deltagelse.PID AS Deltagelse_PID, 
			[ENavn] + ', ' + [FNavn] AS Navn, 
			Deltagelse.Avmeldt, 
			Deltagelse.Venteliste, 
			Deltagelse.ArrID, 
			Deltagelse.BunkTildelt, 
			Deltagelse.RulleKommentar, 
			Deltagelse.RengjTildelt, 
			Deltagelse.RengjPost
		FROM Personer RIGHT JOIN Deltagelse ON Personer.PID = Deltagelse.PID
		WHERE Deltagelse.Avmeldt=0 AND Deltagelse.ArrID=@ArrID
		ORDER BY [Navn];
END
GO
/****** Object:  StoredProcedure [dbo].[usp_BunkTildelingScr]    Script Date: 08.12.2019 15:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gerhard
-- Create date: 07.08.2018
-- Description:	Køytildeling for spesifikk ArrID
-- =============================================
CREATE PROCEDURE [dbo].[usp_BunkTildelingScr] 
	-- Add the parameters for the stored procedure here
	@ArrID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT xBunks.BunkID AS xBunks_BunkID, 
			xBunks.Rom, xBunks.Bunk, 
			xBunks.Side, 
			xBunks.Bunkrekke, 
			xBunks.Vertikal, 
			xBunks.Forkort, 
			xBunks.BrukesAv, 
			xBunks.RomSekv, 
			BunkTildeling.ArrID, 
			BunkTildeling.PID, 
			BunkTildeling.BunkID AS BunkTildeling_BunkID
		FROM xBunks RIGHT JOIN BunkTildeling ON xBunks.BunkID = BunkTildeling.BunkID
		WHERE BunkTildeling.ArrID = @ArrID
		ORDER BY xBunks.BunkID, xBunks.RomSekv;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_BunkTildelingVaktKv]    Script Date: 08.12.2019 15:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gerhard
-- Create date: 30.08.2018
-- Description:	Køytildeling pr vaktskv for spesifikk ArrID
-- =============================================
Create PROCEDURE [dbo].[usp_BunkTildelingVaktKv] 
	-- Add the parameters for the stored procedure here
	@ArrID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT xBunks.BunkID AS xBunks_BunkID, 
			xBunks.Rom, 
			xBunks.Bunk, 
			xBunks.Side, 
			xBunks.Bunkrekke, 
			xBunks.Vertikal, 
			xBunks.Forkort, 
			xBunks.BrukesAv, 
			xBunks.RomSekv, 
			BunkTildeling.ArrID AS BunkTildeling_ArrID, 
			BunkTildeling.PID AS BunkTildeling_PID, 
			BunkTildeling.BunkID AS BunkTildeling_BunkID, 
			Deltagelse.ArrID AS Deltagelse_ArrID, 
			Deltagelse.PID AS Deltagelse_PID, 
			Deltagelse.Vakt2, 
			Deltagelse.Vakt3, 
			Deltagelse.Avmeldt, 
			Deltagelse.Venteliste
		FROM xBunks RIGHT JOIN (BunkTildeling LEFT JOIN Deltagelse ON BunkTildeling.PID = Deltagelse.PID) ON xBunks.BunkID = BunkTildeling.BunkID
		WHERE Deltagelse.ArrID=@ArrID AND Deltagelse.Avmeldt=0;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DagAktivitet_Oppdater]    Script Date: 08.12.2019 15:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_DagAktivitet_Oppdater] 
	-- Add the parameters for the stored procedure here
	@DpID int
	,@Start nvarchar(5)
	,@Slutt nvarchar(5)
	,@Aktivitet nvarchar(max)
	,@Ansvar nvarchar(255)
	,@Antrekk nvarchar(255)
	,@Merknad nvarchar(255)
AS
BEGIN

	DECLARE @totalCount Int
	SELECT @totalCount = COUNT(DPID) FROM [dbo].[DagAktivitet] 
	WHERE DPID = @DpID

	IF @totalCount = 0
	BEGIN

		INSERT INTO [dbo].[DagAktivitet]
			   ([Start]
			   ,[Slutt]
			   ,[Aktivitet]
			   ,[Ansvar]
			   ,[Antrekk]
			   ,[Merknad])
		 VALUES
			   (@Start
			   ,@Slutt
			   ,@Aktivitet
			   ,@Ansvar
			   ,@Antrekk
			   ,@Merknad)
	END

	ELSE

	BEGIN
		UPDATE [dbo].[DagAktivitet]
		   SET [Start] = @Start
			  ,[Slutt] = @Slutt
			  ,[Aktivitet] = @Aktivitet
			  ,[Ansvar] = @Ansvar
			  ,[Antrekk] = @Antrekk
			  ,[Merknad] = @Merknad
		 WHERE [DPID] = @DpID
	 END

 END
GO
/****** Object:  StoredProcedure [dbo].[usp_Deltagelse]    Script Date: 08.12.2019 15:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gerhard
-- Create date: 22.07.2018
-- Description:	Deltagerliste for spesifikk ArrID
-- =============================================
CREATE PROCEDURE [dbo].[usp_Deltagelse] 
	-- Add the parameters for the stored procedure here
	@ArrID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Deltagelse.ArrID AS Deltagelse_ArrID, 
			Deltagelse.PID AS Deltagelse_PID, 
			Deltagelse.ReiseOpplegg, 
			Deltagelse.Venteliste, 
			Deltagelse.Avmeldt,  
			Deltagelse.Kostdag,
			Arrangementer.ArrID AS Arrangementer_ArrID,
			Arrangementer.ArrNavn, 
			Arrangementer.Dato,
			--Year([Dato]) AS DeltSesong,
			Arrangementer.Seilas, 
			Arrangementer.OpenShip, 
			Arrangementer.SesID,
			Personer.PID AS Personer_PID, 
			Personer.ENavn, 
			Personer.FNavn, 
			Personer.ENavn + ', ' + Personer.FNavn AS DeltNavn, 
			Personer.FagID
			FROM Personer RIGHT OUTER JOIN (Arrangementer LEFT OUTER JOIN Deltagelse ON Arrangementer.ArrID = Deltagelse.ArrID) ON Personer.PID = Deltagelse.PID
			WHERE Deltagelse.Avmeldt = 0 AND Deltagelse.ArrID = @ArrID;


END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeltagelseDugnad]    Script Date: 08.12.2019 15:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gerhard
-- Create date: 07.08.2018
-- Description:	Deltagerliste for spesifikk dugnad
-- =============================================
CREATE PROCEDURE [dbo].[usp_DeltagelseDugnad]
	-- Add the parameters for the stored procedure here
	--@ArrID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Dugnader.DugID AS Dugnader_DugID, 
	Dugnader.Dato, Dugnader.Type, 
	Dugnader.SesID, 
	DugnadInnsats.PID AS DugnadInnsats_PID, 
	DugnadInnsats.DugID AS DugnadInnsats_DugID, 
	DugnadInnsats.Timer, 
	Personer.PID AS Personer_PID, 
	[ENavn] + ', ' + [Kalles] AS Navn
FROM Personer RIGHT JOIN (Dugnader LEFT JOIN DugnadInnsats ON Dugnader.[DugID] = DugnadInnsats.[DugID]) ON Personer.[PID] = DugnadInnsats.[PID]
WHERE DugnadInnsats.Timer>0;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_RengjPostScr]    Script Date: 08.12.2019 15:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gerhard
-- Create date: 24.08.2018
-- Description:	Rengjøringsposter for spesifikk ArrID
-- =============================================
CREATE PROCEDURE [dbo].[usp_RengjPostScr] 
	-- Add the parameters for the stored procedure here
	@ArrID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	SELECT xRengjPoster.RenID AS xRengjPoster_RenID,
			xRengjPoster.RengjSted,
			xRengjPoster.Sekvens,
			RengjRulle.ArrID,
			RengjRulle.PID,
			RengjRulle.RenID AS RengjRulle_RenID
		FROM xRengjPoster LEFT JOIN RengjRulle ON xRengjPoster.RenID = RengjRulle.RenID
		WHERE RengjRulle.ArrID = @ArrID
		ORDER BY xRengjPoster.RenID, xRengjPoster.RengjSted, xRengjPoster.Sekvens;

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Arrangementer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 323
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "xSesonger"
            Begin Extent = 
               Top = 6
               Left = 274
               Bottom = 136
               Right = 459
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwAktivFromDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwAktivFromDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Arrangementer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 344
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 15
         End
         Begin Table = "xSesonger"
            Begin Extent = 
               Top = 6
               Left = 274
               Bottom = 136
               Right = 459
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwAktiviteter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwAktiviteter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Arrangementer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 6
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vWEvents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vWEvents'
GO
