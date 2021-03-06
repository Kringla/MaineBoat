/****** Object:  Table [dbo].[Komponent]    Script Date: 02.03.2020 14:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Komponent](
	[KompID] [int] IDENTITY(1,1) NOT NULL,
	[Trinn] [int] NULL,
	[Komponent] [nvarchar](200) NULL,
	[KompNr] [nvarchar](50) NULL,
	[ParentID] [int] NULL,
	[AntJobb] [int] NULL,
	[Merknad] [nvarchar](max) NULL,
	[Benyttes] [bit] NULL,
	[Lavest] [bit] NULL,
	[SerNr] [int] NULL,
	[DetaljID] [int] NULL,
	[KompNrTidl] [nvarchar](255) NULL,
	[Flag] [bit] NULL,
 CONSTRAINT [PK_Struktur_1] PRIMARY KEY CLUSTERED 
(
	[KompID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwKomponentTre]    Script Date: 02.03.2020 14:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwKomponentTre]
AS
SELECT        TOP (100) PERCENT KompID, KompNr, Komponent, ParentID, Benyttes, { fn IFNULL(KompNr, '') } + ' ' + Komponent AS KompNavn
FROM            dbo.Komponent
WHERE        (Benyttes = 1) AND (KompID > 1)
ORDER BY KompNr
GO
/****** Object:  View [dbo].[vwStrukturTre]    Script Date: 02.03.2020 14:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwStrukturTre]
AS
SELECT        TOP (100) PERCENT StrID, StrNr, StrElement, ParentID, Benyttes, { fn IFNULL(StrNr, '') } + ' ' + StrElement AS StrNavn
FROM            dbo.Struktur
WHERE        (Benyttes = 1) AND (StrID > 1)
ORDER BY StrNr
GO
/****** Object:  Table [dbo].[Arbeidsdatoer]    Script Date: 02.03.2020 14:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arbeidsdatoer](
	[ArbID] [int] IDENTITY(1,1) NOT NULL,
	[ArbDato] [datetime] NULL,
 CONSTRAINT [PK_Arbeidsdatoer] PRIMARY KEY CLUSTERED 
(
	[ArbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Arbeidsliste]    Script Date: 02.03.2020 14:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arbeidsliste](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[JobbID] [int] NULL,
	[ArbID] [int] NOT NULL,
 CONSTRAINT [PK_Arbeidsliste] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brannapp]    Script Date: 02.03.2020 14:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brannapp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeApparat] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[Skiftet] [nvarchar](255) NULL,
	[SlukkType] [nvarchar](255) NULL,
	[FullVekt] [nvarchar](255) NULL,
	[CO2VektDriv] [nvarchar](255) NULL,
	[Plassering] [nvarchar](255) NULL,
	[SvcDato] [datetime] NULL,
	[Intervall] [datetime] NULL,
	[Signatur] [nvarchar](255) NULL,
 CONSTRAINT [PK_Brannapp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DistanseTid]    Script Date: 02.03.2020 14:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DistanseTid](
	[SerID] [int] IDENTITY(1,1) NOT NULL,
	[Seilas] [nvarchar](255) NULL,
	[Dato] [datetime] NULL,
	[Merknad] [nvarchar](max) NULL,
	[SeiltDistanse] [real] NULL,
	[TotalDistanse] [real] NULL,
	[SeiltTid] [real] NULL,
	[TotalTid] [real] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_DistanseTid] PRIMARY KEY CLUSTERED 
(
	[SerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dokumenter]    Script Date: 02.03.2020 14:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dokumenter](
	[DokID] [int] IDENTITY(1,1) NOT NULL,
	[DokFork] [nvarchar](255) NULL,
	[DokTittel] [nvarchar](255) NULL,
	[Utgiver] [nvarchar](255) NULL,
	[Utgitt] [nvarchar](255) NULL,
	[Media] [nvarchar](255) NULL,
	[Tegning] [bit] NULL,
	[PlassID] [int] NULL,
	[ElektronFil] [bit] NULL,
	[DokFil] [nvarchar](255) NULL,
	[Antall] [int] NULL,
	[HylleSkap] [nvarchar](255) NULL,
	[Merknad] [nvarchar](255) NULL,
	[DetaljID] [int] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Dokumenter] PRIMARY KEY CLUSTERED 
(
	[DokID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobb]    Script Date: 02.03.2020 14:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobb](
	[JobbID] [int] IDENTITY(1,1) NOT NULL,
	[KompID] [int] NULL,
	[DetaljID] [int] NULL,
	[PriID] [int] NULL,
	[JobbKode] [nvarchar](5) NULL,
	[JobbNavn] [nvarchar](255) NULL,
	[JobbBeskrivelse] [nvarchar](max) NULL,
	[Kontroll] [bit] NULL,
	[Arbeid] [bit] NULL,
	[IntTID] [int] NULL,
	[IntervallDag] [int] NULL,
	[IntervallUke] [int] NULL,
	[IntervallMnd] [real] NULL,
	[IntervallYear] [int] NULL,
	[Frist] [datetime] NULL,
	[Startet] [bit] NULL,
	[Completed] [bit] NULL,
	[IntervallGange] [int] NULL,
	[CompletedGange] [int] NULL,
	[NesteGange] [int] NULL,
	[Dokking] [bit] NULL,
	[Underveis] [bit] NULL,
	[UnderLand] [bit] NULL,
	[Dugnad] [bit] NULL,
	[SendtAnsv] [datetime] NULL,
	[KvalSikr] [nvarchar](max) NULL,
	[AnsvPerson] [nvarchar](255) NULL,
	[StillingID] [int] NULL,
	[Kriterier] [varchar](8000) NULL,
	[Skjema] [varchar](8000) NULL,
	[Merknad] [nvarchar](max) NULL,
	[Flag] [bit] NULL,
	[StartetDato] [datetime] NULL,
	[CompletedDato] [datetime] NULL,
	[NesteDato] [datetime] NULL,
	[KontrollOK] [bit] NULL,
	[Measurement] [nvarchar](max) NULL,
	[KontrollResultat] [nvarchar](max) NULL,
	[KontrollSign] [nvarchar](255) NULL,
	[ArbeidBeskrivelse] [nvarchar](max) NULL,
	[ArbeidSign] [nvarchar](255) NULL,
	[ArbeidOK] [bit] NULL,
	[Bilder] [varchar](8000) NULL,
	[Rapporter] [varchar](8000) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Jobb] PRIMARY KEY CLUSTERED 
(
	[JobbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobbDato]    Script Date: 02.03.2020 14:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobbDato](
	[SerID] [int] IDENTITY(1,1) NOT NULL,
	[JobbID] [int] NOT NULL,
	[StartetDato] [datetime] NULL,
	[CompletedDato] [datetime] NULL,
	[NesteDato] [datetime] NULL,
	[NesteGange] [int] NULL,
	[KontrollOK] [bit] NULL,
	[Measurement] [nvarchar](max) NULL,
	[KontrollResultat] [nvarchar](max) NULL,
	[KontrollSign] [nvarchar](255) NULL,
	[ArbeidBeskrivelse] [nvarchar](max) NULL,
	[ArbeidSign] [nvarchar](255) NULL,
	[ArbeidOK] [bit] NULL,
	[Bilder] [varchar](8000) NULL,
	[Rapporter] [varchar](8000) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_JobbDato] PRIMARY KEY CLUSTERED 
(
	[SerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobbDok]    Script Date: 02.03.2020 14:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobbDok](
	[SerID] [int] IDENTITY(1,1) NOT NULL,
	[JobbID] [int] NULL,
	[DokID] [int] NULL,
	[DokRef] [nvarchar](255) NULL,
	[DokImg] [varchar](8000) NULL,
 CONSTRAINT [PK_JobbDok] PRIMARY KEY CLUSTERED 
(
	[SerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobbNorm]    Script Date: 02.03.2020 14:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobbNorm](
	[SerID] [int] IDENTITY(1,1) NOT NULL,
	[JobbID] [int] NULL,
	[NormID] [int] NULL,
 CONSTRAINT [PK_JobbNorm] PRIMARY KEY CLUSTERED 
(
	[SerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kontakter]    Script Date: 02.03.2020 14:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kontakter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Firma] [nvarchar](255) NULL,
	[Navn] [nvarchar](255) NULL,
	[Adr] [nvarchar](255) NULL,
	[Poststed] [nvarchar](255) NULL,
	[Land] [nvarchar](25) NULL,
	[Telf] [nvarchar](25) NULL,
	[Epost] [nvarchar](255) NULL,
	[Kontakttype] [nvarchar](max) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Kontakter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Livvester]    Script Date: 02.03.2020 14:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Livvester](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeVest] [nvarchar](255) NULL,
	[Plassering] [nvarchar](255) NULL,
	[FastLivAntall] [int] NULL,
	[StatusLivAntall] [int] NULL,
	[FastAnnetAntall] [int] NULL,
	[StatusAnnetAntall] [int] NULL,
	[DatoTeltSist] [datetime] NULL,
	[Signatur] [nvarchar](255) NULL,
	[Merknad] [nvarchar](255) NULL,
 CONSTRAINT [PK_Livvester] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Middel]    Script Date: 02.03.2020 14:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Middel](
	[MiddelID] [int] IDENTITY(1,1) NOT NULL,
	[MiddelNavn] [nvarchar](255) NULL,
	[MiddelTypeID] [int] NOT NULL,
	[EnhetVolum] [nvarchar](255) NULL,
	[Emballasje] [nvarchar](15) NULL,
	[PrisInn] [real] NULL,
	[StatusBeholdning] [real] NULL,
	[StatusDato] [datetime] NULL,
	[Merknader] [nvarchar](255) NULL,
	[AntMin] [real] NULL,
	[Fabrikat] [nvarchar](255) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Middel] PRIMARY KEY CLUSTERED 
(
	[MiddelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MiddelDetalj]    Script Date: 02.03.2020 14:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MiddelDetalj](
	[MidDetID] [int] IDENTITY(1,1) NOT NULL,
	[MiddelID] [int] NULL,
	[PlassID] [int] NULL,
	[Beholdning] [real] NULL,
	[AntKorrig] [real] NULL,
	[AntInn] [real] NULL,
	[AntTelt] [real] NULL,
	[Merknader] [nvarchar](255) NULL,
 CONSTRAINT [PK_MiddelDetalj] PRIMARY KEY CLUSTERED 
(
	[MidDetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MiddelKorr]    Script Date: 02.03.2020 14:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MiddelKorr](
	[MiddelKorrID] [int] IDENTITY(1,1) NOT NULL,
	[MiddelID] [int] NULL,
	[AntKorrig] [real] NULL,
	[AntInn] [real] NULL,
	[AntTelt] [real] NULL,
	[AntStatusStart] [real] NULL,
	[Bruker] [nvarchar](255) NULL,
	[Merknader] [nvarchar](255) NULL,
	[KorrDato] [datetime] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_MiddelKorr] PRIMARY KEY CLUSTERED 
(
	[MiddelKorrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MiddelType]    Script Date: 02.03.2020 14:24:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MiddelType](
	[MiddelTypeID] [int] IDENTITY(1,1) NOT NULL,
	[MiddelType] [nvarchar](1) NOT NULL,
	[MiddelBeskrivelse] [nvarchar](255) NULL,
 CONSTRAINT [PK_MiddelType] PRIMARY KEY CLUSTERED 
(
	[MiddelTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Norm]    Script Date: 02.03.2020 14:24:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Norm](
	[NormID] [int] IDENTITY(1,1) NOT NULL,
	[Gjelder] [nvarchar](255) NULL,
	[Beskrivelse] [nvarchar](max) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Norm] PRIMARY KEY CLUSTERED 
(
	[NormID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservedel]    Script Date: 02.03.2020 14:24:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservedel](
	[DelID] [int] IDENTITY(1,1) NOT NULL,
	[DelNavn] [nvarchar](255) NULL,
	[Fabrikat] [nvarchar](255) NULL,
	[DelNummer] [nvarchar](255) NULL,
	[NATOnr] [nvarchar](255) NULL,
	[Spesifikasjon] [nvarchar](255) NULL,
	[EnhetVolum] [real] NULL,
	[Emballasje] [nvarchar](15) NULL,
	[EmbMerking] [nvarchar](255) NULL,
	[PrisInn] [real] NULL,
	[StatusDato] [datetime] NULL,
	[StatusBeholdning] [int] NULL,
	[AntMin] [int] NULL,
	[Merknad] [nvarchar](max) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Reservedel] PRIMARY KEY CLUSTERED 
(
	[DelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservedelPlass]    Script Date: 02.03.2020 14:24:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservedelPlass](
	[DelPlassID] [int] IDENTITY(1,1) NOT NULL,
	[DelID] [int] NULL,
	[PlassID] [int] NULL,
	[Beholdning] [int] NULL,
	[AntKorrig] [int] NULL,
	[AntInn] [int] NULL,
	[AntTelt] [int] NULL,
	[Merknader] [nvarchar](255) NULL,
 CONSTRAINT [PK_ReservedelPlass] PRIMARY KEY CLUSTERED 
(
	[DelPlassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sertifikat]    Script Date: 02.03.2020 14:24:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sertifikat](
	[SertID] [int] IDENTITY(1,1) NOT NULL,
	[KompID] [int] NULL,
	[SertNavn] [nvarchar](255) NULL,
	[SertNummer] [nvarchar](255) NULL,
	[SertDato] [datetime] NULL,
	[SertUtsteder] [nvarchar](255) NULL,
	[Intervall] [int] NULL,
	[FornyDato] [datetime] NULL,
	[Gjelder] [nvarchar](255) NULL,
	[Merknad] [nvarchar](max) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Sertifikat] PRIMARY KEY CLUSTERED 
(
	[SertID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sjekkliste]    Script Date: 02.03.2020 14:24:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sjekkliste](
	[SjkID] [int] IDENTITY(1,1) NOT NULL,
	[SjkTittel] [nvarchar](255) NOT NULL,
	[SjkBruk] [nvarchar](max) NULL,
	[DetaljID] [int] NULL,
	[StrID] [int] NULL,
	[KompID] [int] NULL,
	[SjkBrukesNår] [nvarchar](255) NULL,
	[SjkBrukesAv] [nvarchar](255) NULL,
 CONSTRAINT [PK_Sjekkliste] PRIMARY KEY CLUSTERED 
(
	[SjkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SjekkPunkt]    Script Date: 02.03.2020 14:24:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SjekkPunkt](
	[SjkDetID] [int] IDENTITY(1,1) NOT NULL,
	[SjkID] [int] NOT NULL,
	[SjkSer] [smallint] NOT NULL,
	[SjkSubTittel] [nvarchar](255) NULL,
	[SjkInnhold] [nvarchar](500) NULL,
	[SjkNB] [nvarchar](255) NULL,
 CONSTRAINT [PK_SjekkPunkter] PRIMARY KEY CLUSTERED 
(
	[SjkDetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utstyr]    Script Date: 02.03.2020 14:24:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utstyr](
	[UtstyrID] [int] IDENTITY(1,1) NOT NULL,
	[KompID] [int] NULL,
	[Utstyr] [nvarchar](255) NULL,
	[Fabrikat] [nvarchar](255) NULL,
	[Modell] [nvarchar](max) NULL,
	[Kapasitet] [nvarchar](255) NULL,
	[Serienr] [nvarchar](max) NULL,
	[NATOnr] [nvarchar](255) NULL,
	[DetaljID] [int] NULL,
	[KravSertifikat] [bit] NULL,
	[Reserve] [bit] NULL,
	[GangetidBasis] [bit] NULL,
	[GangetidStatus] [int] NULL,
	[ByggeYear] [nvarchar](255) NULL,
	[AntJobber] [int] NULL,
	[AntJobberUtf] [int] NULL,
	[Merknad] [nvarchar](max) NULL,
	[PlassID] [int] NULL,
	[Antall] [int] NULL,
	[Flag] [bit] NULL,
 CONSTRAINT [PK_Utstyr] PRIMARY KEY CLUSTERED 
(
	[UtstyrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UtstyrDok]    Script Date: 02.03.2020 14:24:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UtstyrDok](
	[SerID] [int] IDENTITY(1,1) NOT NULL,
	[KompID] [int] NULL,
	[DokID] [int] NULL,
 CONSTRAINT [PK_UtstyrDok] PRIMARY KEY CLUSTERED 
(
	[SerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UtstyrGangetid]    Script Date: 02.03.2020 14:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UtstyrGangetid](
	[UGID] [int] IDENTITY(1,1) NOT NULL,
	[KompID] [int] NULL,
	[GangetidUke] [int] NULL,
	[GangetidTotal] [int] NULL,
	[Merknad] [nvarchar](max) NULL,
	[LoggDato] [datetime] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_UtstyrGangetid] PRIMARY KEY CLUSTERED 
(
	[UGID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UtstyrOld]    Script Date: 02.03.2020 14:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UtstyrOld](
	[UtstyrID] [int] IDENTITY(1,1) NOT NULL,
	[Utstyr] [nvarchar](200) NULL,
	[UtstyrNr] [nchar](2) NULL,
	[StrID] [int] NULL,
	[KompID] [int] NULL,
	[Fabrikat] [nvarchar](255) NULL,
	[Modell] [nvarchar](max) NULL,
	[Kapasitet] [nvarchar](255) NULL,
	[Serienr] [nvarchar](max) NULL,
	[NATOnr] [nvarchar](255) NULL,
	[DetaljID] [int] NULL,
	[KravSertifikat] [bit] NULL,
	[Reserve] [bit] NULL,
	[GangetidBasis] [bit] NULL,
	[GangetidStatus] [int] NULL,
	[ByggeYear] [nvarchar](255) NULL,
	[AntJobber] [int] NULL,
	[AntJobberUtf] [int] NULL,
	[Merknad] [nvarchar](max) NULL,
	[PlassID] [int] NULL,
	[Antall] [int] NULL,
	[Flag] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UtstyrPlassering]    Script Date: 02.03.2020 14:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UtstyrPlassering](
	[SerID] [int] IDENTITY(1,1) NOT NULL,
	[PlassID] [int] NULL,
	[KompID] [int] NULL,
 CONSTRAINT [PK_UtstyrPlassering] PRIMARY KEY CLUSTERED 
(
	[SerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UtstyrReserve]    Script Date: 02.03.2020 14:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UtstyrReserve](
	[SerID] [int] IDENTITY(1,1) NOT NULL,
	[DelID] [int] NULL,
	[KompID] [int] NULL,
 CONSTRAINT [PK_UtstyrReserve] PRIMARY KEY CLUSTERED 
(
	[SerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XDetalj]    Script Date: 02.03.2020 14:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XDetalj](
	[DetaljID] [int] IDENTITY(1,1) NOT NULL,
	[DetaljNavn] [nvarchar](255) NULL,
	[StillingID] [int] NULL,
 CONSTRAINT [PK_XDetalj] PRIMARY KEY CLUSTERED 
(
	[DetaljID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XEnhet]    Script Date: 02.03.2020 14:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XEnhet](
	[Emball] [nvarchar](255) NULL,
	[EmbID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_XEnhet] PRIMARY KEY CLUSTERED 
(
	[EmbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XIntervall]    Script Date: 02.03.2020 14:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XIntervall](
	[IntTID] [int] IDENTITY(1,1) NOT NULL,
	[IntType] [nvarchar](255) NULL,
	[IntTypeBeskr] [nvarchar](255) NULL,
 CONSTRAINT [PK_XIntervall] PRIMARY KEY CLUSTERED 
(
	[IntTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XParameter]    Script Date: 02.03.2020 14:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XParameter](
	[StdID] [int] IDENTITY(1,1) NOT NULL,
	[HovedBeholdning] [nvarchar](255) NULL,
	[CCBeholdning] [nvarchar](255) NULL,
	[HovedSertifikat] [nvarchar](255) NULL,
	[CCSertifikat] [nvarchar](255) NULL,
	[HovedProcure] [nvarchar](255) NULL,
	[CCProcure] [nvarchar](255) NULL,
	[HovedNav] [nvarchar](255) NULL,
	[CCNav] [nvarchar](255) NULL,
	[FilbaneLager] [nvarchar](255) NULL,
 CONSTRAINT [PK_XParameter] PRIMARY KEY CLUSTERED 
(
	[StdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XPerson]    Script Date: 02.03.2020 14:24:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XPerson](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[PersonInitial] [nvarchar](3) NULL,
	[PersonNavn] [nvarchar](255) NULL,
 CONSTRAINT [PK_XPerson] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XPlassering]    Script Date: 02.03.2020 14:24:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XPlassering](
	[PlassID] [int] IDENTITY(1,1) NOT NULL,
	[Plassering] [nvarchar](255) NULL,
	[Reserve] [bit] NULL,
	[Middel] [bit] NULL,
	[Utstyr] [bit] NULL,
	[Jobb] [bit] NULL,
	[Dok] [bit] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_XPlassering] PRIMARY KEY CLUSTERED 
(
	[PlassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XPrioritet]    Script Date: 02.03.2020 14:24:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XPrioritet](
	[PriID] [int] IDENTITY(1,1) NOT NULL,
	[Prioritet] [nvarchar](255) NULL,
	[PrioritetBeskriv] [nvarchar](255) NULL,
 CONSTRAINT [PK_XPrioritet] PRIMARY KEY CLUSTERED 
(
	[PriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XStilling]    Script Date: 02.03.2020 14:24:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XStilling](
	[StillingID] [int] IDENTITY(1,1) NOT NULL,
	[StillingTittel] [nvarchar](255) NULL,
	[PersonNavn] [nvarchar](255) NULL,
	[Epost] [nvarchar](255) NULL,
 CONSTRAINT [PK_XStilling] PRIMARY KEY CLUSTERED 
(
	[StillingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Arbeidsliste]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Arbeidsliste] ON [dbo].[Arbeidsliste]
(
	[JobbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Arbeidsliste_1]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Arbeidsliste_1] ON [dbo].[Arbeidsliste]
(
	[ArbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Brannapp]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Brannapp] ON [dbo].[Brannapp]
(
	[SvcDato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DistanseTid]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_DistanseTid] ON [dbo].[DistanseTid]
(
	[Dato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Dokumenter]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Dokumenter] ON [dbo].[Dokumenter]
(
	[DetaljID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Dokumenter_1]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Dokumenter_1] ON [dbo].[Dokumenter]
(
	[PlassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobb]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Jobb] ON [dbo].[Jobb]
(
	[PriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobb_10]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Jobb_10] ON [dbo].[Jobb]
(
	[KompID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobb_2]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Jobb_2] ON [dbo].[Jobb]
(
	[StillingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobb_3]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Jobb_3] ON [dbo].[Jobb]
(
	[DetaljID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobb_4]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Jobb_4] ON [dbo].[Jobb]
(
	[JobbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobb_5]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Jobb_5] ON [dbo].[Jobb]
(
	[IntTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobb_6]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Jobb_6] ON [dbo].[Jobb]
(
	[Flag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobb_7]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Jobb_7] ON [dbo].[Jobb]
(
	[Frist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobb_8]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Jobb_8] ON [dbo].[Jobb]
(
	[Completed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Jobb_9]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Jobb_9] ON [dbo].[Jobb]
(
	[CompletedGange] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobbDato]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_JobbDato] ON [dbo].[JobbDato]
(
	[JobbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobbDok]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_JobbDok] ON [dbo].[JobbDok]
(
	[JobbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobbDok_1]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_JobbDok_1] ON [dbo].[JobbDok]
(
	[DokID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobbNorm]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_JobbNorm] ON [dbo].[JobbNorm]
(
	[JobbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobbNorm_1]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_JobbNorm_1] ON [dbo].[JobbNorm]
(
	[NormID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Middel]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Middel] ON [dbo].[Middel]
(
	[MiddelTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MiddelDetalj]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_MiddelDetalj] ON [dbo].[MiddelDetalj]
(
	[PlassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MiddelDetalj_1]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_MiddelDetalj_1] ON [dbo].[MiddelDetalj]
(
	[MiddelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MiddelKorr]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_MiddelKorr] ON [dbo].[MiddelKorr]
(
	[MiddelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReservedelPlass]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_ReservedelPlass] ON [dbo].[ReservedelPlass]
(
	[DelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReservedelPlass_1]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_ReservedelPlass_1] ON [dbo].[ReservedelPlass]
(
	[PlassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sertifikat_1]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Sertifikat_1] ON [dbo].[Sertifikat]
(
	[FornyDato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sertifikat_2]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Sertifikat_2] ON [dbo].[Sertifikat]
(
	[KompID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Utstyr_1]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Utstyr_1] ON [dbo].[Utstyr]
(
	[DetaljID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Utstyr_2]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Utstyr_2] ON [dbo].[Utstyr]
(
	[PlassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Utstyr_3]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_Utstyr_3] ON [dbo].[Utstyr]
(
	[KompID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UtstyrDok_1]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_UtstyrDok_1] ON [dbo].[UtstyrDok]
(
	[DokID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UtstyrDok_2]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_UtstyrDok_2] ON [dbo].[UtstyrDok]
(
	[KompID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UtstyrGangetid_1]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_UtstyrGangetid_1] ON [dbo].[UtstyrGangetid]
(
	[KompID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UtstyrPlassering]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_UtstyrPlassering] ON [dbo].[UtstyrPlassering]
(
	[KompID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UtstyrPlassering_1]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_UtstyrPlassering_1] ON [dbo].[UtstyrPlassering]
(
	[PlassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UtstyrReserve]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_UtstyrReserve] ON [dbo].[UtstyrReserve]
(
	[KompID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UtstyrReserve_1]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_UtstyrReserve_1] ON [dbo].[UtstyrReserve]
(
	[DelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_XDetalj]    Script Date: 02.03.2020 14:24:12 ******/
CREATE NONCLUSTERED INDEX [IX_XDetalj] ON [dbo].[XDetalj]
(
	[StillingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DistanseTid] ADD  CONSTRAINT [DF_DistanseTid_SeiltDistanse]  DEFAULT ((0)) FOR [SeiltDistanse]
GO
ALTER TABLE [dbo].[DistanseTid] ADD  CONSTRAINT [DF_DistanseTid_TotalDistanse]  DEFAULT ((0)) FOR [TotalDistanse]
GO
ALTER TABLE [dbo].[DistanseTid] ADD  CONSTRAINT [DF_DistanseTid_SeiltTid]  DEFAULT ((0)) FOR [SeiltTid]
GO
ALTER TABLE [dbo].[DistanseTid] ADD  CONSTRAINT [DF_DistanseTid_TotalTid]  DEFAULT ((0)) FOR [TotalTid]
GO
ALTER TABLE [dbo].[Dokumenter] ADD  CONSTRAINT [DF_Dokumenter_Tegning]  DEFAULT ((0)) FOR [Tegning]
GO
ALTER TABLE [dbo].[Dokumenter] ADD  CONSTRAINT [DF_Dokumenter_ElektronFil]  DEFAULT ((0)) FOR [ElektronFil]
GO
ALTER TABLE [dbo].[Dokumenter] ADD  CONSTRAINT [DF_Dokumenter_Antall]  DEFAULT ((0)) FOR [Antall]
GO
ALTER TABLE [dbo].[Jobb] ADD  CONSTRAINT [DF_Jobb_Kontroll]  DEFAULT ((0)) FOR [Kontroll]
GO
ALTER TABLE [dbo].[Jobb] ADD  CONSTRAINT [DF_Jobb_Arbeid]  DEFAULT ((1)) FOR [Arbeid]
GO
ALTER TABLE [dbo].[Jobb] ADD  CONSTRAINT [DF_Jobb_Startet]  DEFAULT ((0)) FOR [Startet]
GO
ALTER TABLE [dbo].[Jobb] ADD  CONSTRAINT [DF_Jobb_Completed]  DEFAULT ((0)) FOR [Completed]
GO
ALTER TABLE [dbo].[Jobb] ADD  CONSTRAINT [DF_Jobb_Dokking]  DEFAULT ((0)) FOR [Dokking]
GO
ALTER TABLE [dbo].[Jobb] ADD  CONSTRAINT [DF_Jobb_Underveis]  DEFAULT ((0)) FOR [Underveis]
GO
ALTER TABLE [dbo].[Jobb] ADD  CONSTRAINT [DF_Jobb_UnderLand]  DEFAULT ((1)) FOR [UnderLand]
GO
ALTER TABLE [dbo].[Jobb] ADD  CONSTRAINT [DF_Jobb_Dugnad]  DEFAULT ((1)) FOR [Dugnad]
GO
ALTER TABLE [dbo].[Jobb] ADD  CONSTRAINT [DF_Jobb_Flag]  DEFAULT ((0)) FOR [Flag]
GO
ALTER TABLE [dbo].[Jobb] ADD  CONSTRAINT [DF_Jobb_KontrollOK_1]  DEFAULT ((0)) FOR [KontrollOK]
GO
ALTER TABLE [dbo].[Jobb] ADD  CONSTRAINT [DF_Jobb_ArbeidOK_1]  DEFAULT ((0)) FOR [ArbeidOK]
GO
ALTER TABLE [dbo].[JobbDato] ADD  CONSTRAINT [DF_JobbDato_NesteGange]  DEFAULT ((0)) FOR [NesteGange]
GO
ALTER TABLE [dbo].[JobbDato] ADD  CONSTRAINT [DF_JobbDato_KontrollOK]  DEFAULT ((0)) FOR [KontrollOK]
GO
ALTER TABLE [dbo].[JobbDato] ADD  CONSTRAINT [DF_JobbDato_ArbeidOK]  DEFAULT ((0)) FOR [ArbeidOK]
GO
ALTER TABLE [dbo].[Komponent] ADD  CONSTRAINT [DF_Komponent_SerNr]  DEFAULT ((0)) FOR [SerNr]
GO
ALTER TABLE [dbo].[Komponent] ADD  CONSTRAINT [DF_Komponent_Flag]  DEFAULT ((0)) FOR [Flag]
GO
ALTER TABLE [dbo].[Livvester] ADD  CONSTRAINT [DF_Livvester_FastLivAntall]  DEFAULT ((0)) FOR [FastLivAntall]
GO
ALTER TABLE [dbo].[Livvester] ADD  CONSTRAINT [DF_Livvester_StatusLivAntall]  DEFAULT ((0)) FOR [StatusLivAntall]
GO
ALTER TABLE [dbo].[Livvester] ADD  CONSTRAINT [DF_Livvester_FastAnnetAntall]  DEFAULT ((0)) FOR [FastAnnetAntall]
GO
ALTER TABLE [dbo].[Livvester] ADD  CONSTRAINT [DF_Livvester_StatusAnnetAntall]  DEFAULT ((0)) FOR [StatusAnnetAntall]
GO
ALTER TABLE [dbo].[Middel] ADD  CONSTRAINT [DF_Middel_PrisInn]  DEFAULT ((0)) FOR [PrisInn]
GO
ALTER TABLE [dbo].[Middel] ADD  CONSTRAINT [DF_Middel_StatusBeholdning]  DEFAULT ((0)) FOR [StatusBeholdning]
GO
ALTER TABLE [dbo].[Middel] ADD  CONSTRAINT [DF_Middel_AntMin]  DEFAULT ((0)) FOR [AntMin]
GO
ALTER TABLE [dbo].[MiddelDetalj] ADD  CONSTRAINT [DF_MiddelDetalj_Beholdning]  DEFAULT ((0)) FOR [Beholdning]
GO
ALTER TABLE [dbo].[MiddelDetalj] ADD  CONSTRAINT [DF_MiddelDetalj_AntKorrig]  DEFAULT ((0)) FOR [AntKorrig]
GO
ALTER TABLE [dbo].[MiddelDetalj] ADD  CONSTRAINT [DF_MiddelDetalj_AntInn]  DEFAULT ((0)) FOR [AntInn]
GO
ALTER TABLE [dbo].[MiddelDetalj] ADD  CONSTRAINT [DF_MiddelDetalj_AntTelt]  DEFAULT ((0)) FOR [AntTelt]
GO
ALTER TABLE [dbo].[MiddelKorr] ADD  CONSTRAINT [DF_MiddelKorr_AntKorrig]  DEFAULT ((0)) FOR [AntKorrig]
GO
ALTER TABLE [dbo].[MiddelKorr] ADD  CONSTRAINT [DF_MiddelKorr_AntInn]  DEFAULT ((0)) FOR [AntInn]
GO
ALTER TABLE [dbo].[MiddelKorr] ADD  CONSTRAINT [DF_MiddelKorr_AntTelt]  DEFAULT ((0)) FOR [AntTelt]
GO
ALTER TABLE [dbo].[MiddelKorr] ADD  CONSTRAINT [DF_MiddelKorr_AntStatusStart]  DEFAULT ((0)) FOR [AntStatusStart]
GO
ALTER TABLE [dbo].[Reservedel] ADD  CONSTRAINT [DF_Reservedel_StatusBeholdning]  DEFAULT ((0)) FOR [StatusBeholdning]
GO
ALTER TABLE [dbo].[Reservedel] ADD  CONSTRAINT [DF_Reservedel_AntMin]  DEFAULT ((0)) FOR [AntMin]
GO
ALTER TABLE [dbo].[ReservedelPlass] ADD  CONSTRAINT [DF_ReservedelPlass_Beholdning]  DEFAULT ((0)) FOR [Beholdning]
GO
ALTER TABLE [dbo].[ReservedelPlass] ADD  CONSTRAINT [DF_ReservedelPlass_AntKorrig]  DEFAULT ((0)) FOR [AntKorrig]
GO
ALTER TABLE [dbo].[ReservedelPlass] ADD  CONSTRAINT [DF_ReservedelPlass_AntInn]  DEFAULT ((0)) FOR [AntInn]
GO
ALTER TABLE [dbo].[ReservedelPlass] ADD  CONSTRAINT [DF_ReservedelPlass_AntTelt]  DEFAULT ((0)) FOR [AntTelt]
GO
ALTER TABLE [dbo].[Sertifikat] ADD  CONSTRAINT [DF_Sertifikat_Intervall]  DEFAULT ((0)) FOR [Intervall]
GO
ALTER TABLE [dbo].[Utstyr] ADD  CONSTRAINT [DF_Utstyr_DetaljID]  DEFAULT ((0)) FOR [DetaljID]
GO
ALTER TABLE [dbo].[Utstyr] ADD  CONSTRAINT [DF_Utstyr_KravSertifikat]  DEFAULT ((0)) FOR [KravSertifikat]
GO
ALTER TABLE [dbo].[Utstyr] ADD  CONSTRAINT [DF_Utstyr_Reserve]  DEFAULT ((0)) FOR [Reserve]
GO
ALTER TABLE [dbo].[Utstyr] ADD  CONSTRAINT [DF_Utstyr_GangetidBasis]  DEFAULT ((0)) FOR [GangetidBasis]
GO
ALTER TABLE [dbo].[Utstyr] ADD  CONSTRAINT [DF_Utstyr_GangetidStatus]  DEFAULT ((0)) FOR [GangetidStatus]
GO
ALTER TABLE [dbo].[Utstyr] ADD  CONSTRAINT [DF_Utstyr_AntJobber]  DEFAULT ((0)) FOR [AntJobber]
GO
ALTER TABLE [dbo].[Utstyr] ADD  CONSTRAINT [DF_Utstyr_AntJobberUtf]  DEFAULT ((0)) FOR [AntJobberUtf]
GO
ALTER TABLE [dbo].[Utstyr] ADD  CONSTRAINT [DF_Utstyr_Antall]  DEFAULT ((0)) FOR [Antall]
GO
ALTER TABLE [dbo].[Utstyr] ADD  CONSTRAINT [DF_Utstyr_Flag]  DEFAULT ((0)) FOR [Flag]
GO
ALTER TABLE [dbo].[UtstyrGangetid] ADD  CONSTRAINT [DF_UtstyrGangetid_GangetidUke]  DEFAULT ((0)) FOR [GangetidUke]
GO
ALTER TABLE [dbo].[UtstyrGangetid] ADD  CONSTRAINT [DF_UtstyrGangetid_GangetidTotal]  DEFAULT ((0)) FOR [GangetidTotal]
GO
ALTER TABLE [dbo].[XPlassering] ADD  CONSTRAINT [DF_XPlassering_Reserve]  DEFAULT ((0)) FOR [Reserve]
GO
ALTER TABLE [dbo].[XPlassering] ADD  CONSTRAINT [DF_XPlassering_Middel]  DEFAULT ((0)) FOR [Middel]
GO
ALTER TABLE [dbo].[XPlassering] ADD  CONSTRAINT [DF_XPlassering_Utstyr]  DEFAULT ((0)) FOR [Utstyr]
GO
ALTER TABLE [dbo].[XPlassering] ADD  CONSTRAINT [DF_XPlassering_Jobb]  DEFAULT ((0)) FOR [Jobb]
GO
ALTER TABLE [dbo].[XPlassering] ADD  CONSTRAINT [DF_XPlassering_Dok]  DEFAULT ((0)) FOR [Dok]
GO
ALTER TABLE [dbo].[Arbeidsliste]  WITH CHECK ADD  CONSTRAINT [FK_Arbeidsliste_Arbeidsdatoer] FOREIGN KEY([ArbID])
REFERENCES [dbo].[Arbeidsdatoer] ([ArbID])
GO
ALTER TABLE [dbo].[Arbeidsliste] CHECK CONSTRAINT [FK_Arbeidsliste_Arbeidsdatoer]
GO
ALTER TABLE [dbo].[Arbeidsliste]  WITH CHECK ADD  CONSTRAINT [FK_Arbeidsliste_Jobb] FOREIGN KEY([JobbID])
REFERENCES [dbo].[Jobb] ([JobbID])
GO
ALTER TABLE [dbo].[Arbeidsliste] CHECK CONSTRAINT [FK_Arbeidsliste_Jobb]
GO
ALTER TABLE [dbo].[Dokumenter]  WITH CHECK ADD  CONSTRAINT [FK_Dokumenter_XDetalj] FOREIGN KEY([DetaljID])
REFERENCES [dbo].[XDetalj] ([DetaljID])
GO
ALTER TABLE [dbo].[Dokumenter] CHECK CONSTRAINT [FK_Dokumenter_XDetalj]
GO
ALTER TABLE [dbo].[Dokumenter]  WITH CHECK ADD  CONSTRAINT [FK_Dokumenter_XPlassering] FOREIGN KEY([PlassID])
REFERENCES [dbo].[XPlassering] ([PlassID])
GO
ALTER TABLE [dbo].[Dokumenter] CHECK CONSTRAINT [FK_Dokumenter_XPlassering]
GO
ALTER TABLE [dbo].[Jobb]  WITH CHECK ADD  CONSTRAINT [FK_Jobb_Komponent] FOREIGN KEY([KompID])
REFERENCES [dbo].[Komponent] ([KompID])
GO
ALTER TABLE [dbo].[Jobb] CHECK CONSTRAINT [FK_Jobb_Komponent]
GO
ALTER TABLE [dbo].[Jobb]  WITH CHECK ADD  CONSTRAINT [FK_Jobb_XDetalj] FOREIGN KEY([DetaljID])
REFERENCES [dbo].[XDetalj] ([DetaljID])
GO
ALTER TABLE [dbo].[Jobb] CHECK CONSTRAINT [FK_Jobb_XDetalj]
GO
ALTER TABLE [dbo].[Jobb]  WITH CHECK ADD  CONSTRAINT [FK_Jobb_XIntervall] FOREIGN KEY([IntTID])
REFERENCES [dbo].[XIntervall] ([IntTID])
GO
ALTER TABLE [dbo].[Jobb] CHECK CONSTRAINT [FK_Jobb_XIntervall]
GO
ALTER TABLE [dbo].[Jobb]  WITH CHECK ADD  CONSTRAINT [FK_Jobb_XPrioritet] FOREIGN KEY([PriID])
REFERENCES [dbo].[XPrioritet] ([PriID])
GO
ALTER TABLE [dbo].[Jobb] CHECK CONSTRAINT [FK_Jobb_XPrioritet]
GO
ALTER TABLE [dbo].[JobbDato]  WITH CHECK ADD  CONSTRAINT [FK_JobbDato_Jobb] FOREIGN KEY([JobbID])
REFERENCES [dbo].[Jobb] ([JobbID])
GO
ALTER TABLE [dbo].[JobbDato] CHECK CONSTRAINT [FK_JobbDato_Jobb]
GO
ALTER TABLE [dbo].[JobbDok]  WITH CHECK ADD  CONSTRAINT [FK_JobbDok_Jobb] FOREIGN KEY([JobbID])
REFERENCES [dbo].[Jobb] ([JobbID])
GO
ALTER TABLE [dbo].[JobbDok] CHECK CONSTRAINT [FK_JobbDok_Jobb]
GO
ALTER TABLE [dbo].[JobbDok]  WITH CHECK ADD  CONSTRAINT [FK_JobbDok_JobbDok1] FOREIGN KEY([SerID])
REFERENCES [dbo].[JobbDok] ([SerID])
GO
ALTER TABLE [dbo].[JobbDok] CHECK CONSTRAINT [FK_JobbDok_JobbDok1]
GO
ALTER TABLE [dbo].[JobbNorm]  WITH CHECK ADD  CONSTRAINT [FK_JobbNorm_Jobb] FOREIGN KEY([JobbID])
REFERENCES [dbo].[Jobb] ([JobbID])
GO
ALTER TABLE [dbo].[JobbNorm] CHECK CONSTRAINT [FK_JobbNorm_Jobb]
GO
ALTER TABLE [dbo].[JobbNorm]  WITH CHECK ADD  CONSTRAINT [FK_JobbNorm_JobbNorm] FOREIGN KEY([SerID])
REFERENCES [dbo].[JobbNorm] ([SerID])
GO
ALTER TABLE [dbo].[JobbNorm] CHECK CONSTRAINT [FK_JobbNorm_JobbNorm]
GO
ALTER TABLE [dbo].[Komponent]  WITH CHECK ADD  CONSTRAINT [FK_Komponent_XDetalj] FOREIGN KEY([DetaljID])
REFERENCES [dbo].[XDetalj] ([DetaljID])
GO
ALTER TABLE [dbo].[Komponent] CHECK CONSTRAINT [FK_Komponent_XDetalj]
GO
ALTER TABLE [dbo].[Middel]  WITH CHECK ADD  CONSTRAINT [FK_Middel_MiddelType] FOREIGN KEY([MiddelTypeID])
REFERENCES [dbo].[MiddelType] ([MiddelTypeID])
GO
ALTER TABLE [dbo].[Middel] CHECK CONSTRAINT [FK_Middel_MiddelType]
GO
ALTER TABLE [dbo].[MiddelDetalj]  WITH CHECK ADD  CONSTRAINT [FK_MiddelDetalj_Middel] FOREIGN KEY([MiddelID])
REFERENCES [dbo].[Middel] ([MiddelID])
GO
ALTER TABLE [dbo].[MiddelDetalj] CHECK CONSTRAINT [FK_MiddelDetalj_Middel]
GO
ALTER TABLE [dbo].[MiddelDetalj]  WITH CHECK ADD  CONSTRAINT [FK_MiddelDetalj_XPlassering] FOREIGN KEY([PlassID])
REFERENCES [dbo].[XPlassering] ([PlassID])
GO
ALTER TABLE [dbo].[MiddelDetalj] CHECK CONSTRAINT [FK_MiddelDetalj_XPlassering]
GO
ALTER TABLE [dbo].[MiddelKorr]  WITH CHECK ADD  CONSTRAINT [FK_MiddelKorr_Middel] FOREIGN KEY([MiddelID])
REFERENCES [dbo].[Middel] ([MiddelID])
GO
ALTER TABLE [dbo].[MiddelKorr] CHECK CONSTRAINT [FK_MiddelKorr_Middel]
GO
ALTER TABLE [dbo].[ReservedelPlass]  WITH CHECK ADD  CONSTRAINT [FK_ReservedelPlass_Reservedel] FOREIGN KEY([DelID])
REFERENCES [dbo].[Reservedel] ([DelID])
GO
ALTER TABLE [dbo].[ReservedelPlass] CHECK CONSTRAINT [FK_ReservedelPlass_Reservedel]
GO
ALTER TABLE [dbo].[ReservedelPlass]  WITH CHECK ADD  CONSTRAINT [FK_ReservedelPlass_XPlassering] FOREIGN KEY([PlassID])
REFERENCES [dbo].[XPlassering] ([PlassID])
GO
ALTER TABLE [dbo].[ReservedelPlass] CHECK CONSTRAINT [FK_ReservedelPlass_XPlassering]
GO
ALTER TABLE [dbo].[Sjekkliste]  WITH CHECK ADD  CONSTRAINT [FK_Sjekkliste_XDetalj] FOREIGN KEY([DetaljID])
REFERENCES [dbo].[XDetalj] ([DetaljID])
GO
ALTER TABLE [dbo].[Sjekkliste] CHECK CONSTRAINT [FK_Sjekkliste_XDetalj]
GO
ALTER TABLE [dbo].[Utstyr]  WITH NOCHECK ADD  CONSTRAINT [FK_Utstyr_XDetalj] FOREIGN KEY([DetaljID])
REFERENCES [dbo].[XDetalj] ([DetaljID])
GO
ALTER TABLE [dbo].[Utstyr] CHECK CONSTRAINT [FK_Utstyr_XDetalj]
GO
ALTER TABLE [dbo].[Utstyr]  WITH CHECK ADD  CONSTRAINT [FK_Utstyr_XPlassering] FOREIGN KEY([PlassID])
REFERENCES [dbo].[XPlassering] ([PlassID])
GO
ALTER TABLE [dbo].[Utstyr] CHECK CONSTRAINT [FK_Utstyr_XPlassering]
GO
ALTER TABLE [dbo].[UtstyrDok]  WITH CHECK ADD  CONSTRAINT [FK_UtstyrDok_Dokumenter] FOREIGN KEY([DokID])
REFERENCES [dbo].[Dokumenter] ([DokID])
GO
ALTER TABLE [dbo].[UtstyrDok] CHECK CONSTRAINT [FK_UtstyrDok_Dokumenter]
GO
ALTER TABLE [dbo].[UtstyrDok]  WITH CHECK ADD  CONSTRAINT [FK_UtstyrDok_Komponent] FOREIGN KEY([KompID])
REFERENCES [dbo].[Komponent] ([KompID])
GO
ALTER TABLE [dbo].[UtstyrDok] CHECK CONSTRAINT [FK_UtstyrDok_Komponent]
GO
ALTER TABLE [dbo].[UtstyrGangetid]  WITH CHECK ADD  CONSTRAINT [FK_UtstyrGangetid_Komponent] FOREIGN KEY([KompID])
REFERENCES [dbo].[Komponent] ([KompID])
GO
ALTER TABLE [dbo].[UtstyrGangetid] CHECK CONSTRAINT [FK_UtstyrGangetid_Komponent]
GO
ALTER TABLE [dbo].[UtstyrPlassering]  WITH CHECK ADD  CONSTRAINT [FK_UtstyrPlassering_Komponent] FOREIGN KEY([KompID])
REFERENCES [dbo].[Komponent] ([KompID])
GO
ALTER TABLE [dbo].[UtstyrPlassering] CHECK CONSTRAINT [FK_UtstyrPlassering_Komponent]
GO
ALTER TABLE [dbo].[UtstyrPlassering]  WITH CHECK ADD  CONSTRAINT [FK_UtstyrPlassering_XPlassering] FOREIGN KEY([PlassID])
REFERENCES [dbo].[XPlassering] ([PlassID])
GO
ALTER TABLE [dbo].[UtstyrPlassering] CHECK CONSTRAINT [FK_UtstyrPlassering_XPlassering]
GO
ALTER TABLE [dbo].[UtstyrReserve]  WITH CHECK ADD  CONSTRAINT [FK_UtstyrReserve_Komponent] FOREIGN KEY([KompID])
REFERENCES [dbo].[Komponent] ([KompID])
GO
ALTER TABLE [dbo].[UtstyrReserve] CHECK CONSTRAINT [FK_UtstyrReserve_Komponent]
GO
ALTER TABLE [dbo].[UtstyrReserve]  WITH CHECK ADD  CONSTRAINT [FK_UtstyrReserve_Reservedel] FOREIGN KEY([DelID])
REFERENCES [dbo].[Reservedel] ([DelID])
GO
ALTER TABLE [dbo].[UtstyrReserve] CHECK CONSTRAINT [FK_UtstyrReserve_Reservedel]
GO
ALTER TABLE [dbo].[XDetalj]  WITH CHECK ADD  CONSTRAINT [FK_XDetalj_XStilling] FOREIGN KEY([StillingID])
REFERENCES [dbo].[XStilling] ([StillingID])
GO
ALTER TABLE [dbo].[XDetalj] CHECK CONSTRAINT [FK_XDetalj_XStilling]
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
         Begin Table = "Komponent"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwKomponentTre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwKomponentTre'
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
         Begin Table = "Struktur"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 8
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwStrukturTre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwStrukturTre'
GO
