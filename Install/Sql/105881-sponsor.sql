/****** Object:  Table [dbo].[tblAktivitet]    Script Date: 02.03.2020 14:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAktivitet](
	[AktID] [int] IDENTITY(1,1) NOT NULL,
	[OrgID] [int] NULL,
	[AktTypeID] [int] NULL,
	[Sak] [nvarchar](255) NULL,
	[SakHandling] [nvarchar](max) NULL,
	[SakAnsvar] [nvarchar](50) NULL,
	[SakDato] [datetime2](0) NULL,
	[SakFrist] [datetime2](0) NULL,
	[SakUtført] [bit] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_tblAktivitet] PRIMARY KEY CLUSTERED 
(
	[AktID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFondLegat]    Script Date: 02.03.2020 14:39:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFondLegat](
	[FondID] [int] IDENTITY(1,1) NOT NULL,
	[OrgID] [int] NULL,
	[SøknadPeriode] [nvarchar](255) NULL,
	[SøknadDetaljer] [nvarchar](max) NULL,
	[SøknadBegrensning] [float] NULL,
	[SøknadMerknad] [nvarchar](max) NULL,
	[SøknadFrist] [nvarchar](255) NULL,
	[NesteSøknad] [datetime2](0) NULL,
	[TildeltBeløp] [float] NULL,
	[RapportKrav] [nvarchar](max) NULL,
	[RapportFrist] [nvarchar](255) NULL,
	[SøknadStatusID] [int] NULL,
	[SøknadOppfølger] [nvarchar](255) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_tblFondLegat] PRIMARY KEY CLUSTERED 
(
	[FondID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrganisasjon]    Script Date: 02.03.2020 14:39:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrganisasjon](
	[OrgID] [int] IDENTITY(1,1) NOT NULL,
	[OrgNavnKort] [nvarchar](255) NULL,
	[OrgNavnFull] [nvarchar](255) NULL,
	[OrgAdr1] [nvarchar](255) NULL,
	[OrgAdr2] [nvarchar](255) NULL,
	[OrgPost] [nvarchar](255) NULL,
	[OrgSted] [nvarchar](255) NULL,
	[OrgWeb] [nvarchar](max) NULL,
	[OrgTelf] [nvarchar](255) NULL,
	[OrgMerknad] [nvarchar](max) NULL,
	[OrgKontakt] [nvarchar](255) NULL,
	[OrgKontaktMobil] [nvarchar](255) NULL,
	[OrgKontaktEpost] [nvarchar](255) NULL,
	[OrgKontaktMerknad] [nvarchar](max) NULL,
	[OrgFLKontakt] [nvarchar](255) NULL,
	[OrgFLKontakt2] [nvarchar](255) NULL,
	[OrgFLNettverk] [nvarchar](max) NULL,
	[SuppTypeID] [int] NOT NULL,
	[OrgTypeID] [int] NULL,
	[StatusTypeID] [int] NULL,
	[Prioritet] [nvarchar](1) NULL,
	[TildBeløpSist] [float] NULL,
	[TildDatoSist] [datetime2](0) NULL,
	[Flagg] [bit] NULL,
	[InfoSponsor] [bit] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_tblOrganisasjon] PRIMARY KEY CLUSTERED 
(
	[OrgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSponsor]    Script Date: 02.03.2020 14:39:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSponsor](
	[SponsorID] [int] IDENTITY(1,1) NOT NULL,
	[OrgID] [int] NULL,
	[AvtaleSum] [float] NULL,
	[AvtaleSumPeriode] [nvarchar](255) NULL,
	[AvtaleYtelse] [nvarchar](max) NULL,
	[AvtaleMerknad] [nvarchar](max) NULL,
	[AvtaleOppfølger] [nvarchar](50) NULL,
	[MedlemNobleDame] [bit] NULL,
	[RapportKrav] [nvarchar](max) NULL,
	[RapportFrist] [nvarchar](255) NULL,
	[AvtaleInngått] [datetime2](0) NULL,
	[AvtaleVarighet] [nvarchar](255) NULL,
	[AvtaleStatusID] [int] NULL,
	[AvtaleMotiv] [nvarchar](max) NULL,
	[AvtaleMedia] [nvarchar](max) NULL,
	[SponTypeID] [int] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_tblSponsor] PRIMARY KEY CLUSTERED 
(
	[SponsorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTildeling]    Script Date: 02.03.2020 14:39:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTildeling](
	[TildID] [int] IDENTITY(1,1) NOT NULL,
	[OrgID] [int] NULL,
	[TildBeløp] [float] NULL,
	[TildDato] [datetime2](0) NULL,
	[TildMerk] [nvarchar](255) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_tblTildeling] PRIMARY KEY CLUSTERED 
(
	[TildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblXAktType]    Script Date: 02.03.2020 14:39:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblXAktType](
	[AktTypeID] [int] IDENTITY(1,1) NOT NULL,
	[AktType] [nvarchar](255) NULL,
	[AktTypeBeskr] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblXAktType] PRIMARY KEY CLUSTERED 
(
	[AktTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblXAnsvPerson]    Script Date: 02.03.2020 14:39:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblXAnsvPerson](
	[Ansvarlig] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tblXAnsvPerson] PRIMARY KEY CLUSTERED 
(
	[Ansvarlig] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblXAvtaleStatus]    Script Date: 02.03.2020 14:39:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblXAvtaleStatus](
	[AvtaleStatusID] [int] IDENTITY(1,1) NOT NULL,
	[AvtaleStatus] [nvarchar](255) NULL,
	[AvtaleStatusBeskr] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblXAvtaleStatus] PRIMARY KEY CLUSTERED 
(
	[AvtaleStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblXOrgType]    Script Date: 02.03.2020 14:39:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblXOrgType](
	[OrgTypeID] [int] IDENTITY(1,1) NOT NULL,
	[OrgType] [nvarchar](255) NULL,
	[OrgTypeBeskr] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblXOrgType] PRIMARY KEY CLUSTERED 
(
	[OrgTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblXSøknadStatus]    Script Date: 02.03.2020 14:39:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblXSøknadStatus](
	[SøknadStatusID] [int] IDENTITY(1,1) NOT NULL,
	[SøknadStatus] [nvarchar](255) NULL,
	[SøknadStatusBeskr] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblXSøknadStatus] PRIMARY KEY CLUSTERED 
(
	[SøknadStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblXSponsingType]    Script Date: 02.03.2020 14:39:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblXSponsingType](
	[SponTypeID] [int] IDENTITY(1,1) NOT NULL,
	[SponType] [nvarchar](255) NULL,
	[SponTypeBeskr] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblXSponsingType] PRIMARY KEY CLUSTERED 
(
	[SponTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblXStatusType]    Script Date: 02.03.2020 14:39:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblXStatusType](
	[StatusTypeID] [int] IDENTITY(1,1) NOT NULL,
	[StatusType] [nvarchar](255) NULL,
	[StatusTypeBeskr] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblXStatusType] PRIMARY KEY CLUSTERED 
(
	[StatusTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblXSupportType]    Script Date: 02.03.2020 14:39:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblXSupportType](
	[SuppTypeID] [int] IDENTITY(1,1) NOT NULL,
	[SuppType] [nvarchar](255) NULL,
	[SuppTypeBeskr] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblXSupportType] PRIMARY KEY CLUSTERED 
(
	[SuppTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAktivitet] ON 

INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (3, 3, 2, N'Sponsormøte', N'Samle og presentere engang til høsten', N'-', CAST(N'2017-06-23T00:00:00.0000000' AS DateTime2), CAST(N'2017-07-07T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (4, 68, 2, N'Forsikring', N'Må kontaktes med prosjekt', N'Tore Pettersen', CAST(N'2018-02-18T00:00:00.0000000' AS DateTime2), CAST(N'2018-03-11T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (5, 61, 2, N'Rekrutteringsvideo', N'Sjekk video', N'Fredrik Huseby', CAST(N'2017-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2018-02-21T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (6, 62, 2, N'Koordinering internt', N'Jan Ove Nilsen snakker med Morten Huseby om ????', N'Morten Huseby', CAST(N'2018-02-07T00:00:00.0000000' AS DateTime2), CAST(N'2018-02-21T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (7, 95, 2, N'Relevanssjekk', N'Sjekk om organisajonens formål har relevans for Fartøylaget', N'-', CAST(N'2018-02-07T00:00:00.0000000' AS DateTime2), CAST(N'2018-02-21T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (8, 1, 2, N'Møte', N'Avtale møte????', N'Fredrik Huseby', CAST(N'2017-12-07T00:00:00.0000000' AS DateTime2), CAST(N'2018-02-21T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (9, 72, 5, N'Telefonsamtale', N'Med Leiv Inge Steig,  EVP/leder sentral markedskoord. 920 60 111', N'Morten Huseby', CAST(N'2018-02-26T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (10, 72, 3, N'Søknad', N'Sendt epost med søknad/info', N'-', CAST(N'2017-12-11T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (11, 77, 2, N'Relevans', N'Sjekk om organisajonens formål har relevans for Fartøylaget', N'Henning Bull', CAST(N'2018-02-08T00:00:00.0000000' AS DateTime2), CAST(N'2018-02-22T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (12, 78, 2, N'Utforsk', N'Sjekke muligheter og frister', N'-', CAST(N'2018-02-08T00:00:00.0000000' AS DateTime2), CAST(N'2018-02-22T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (13, 64, 5, N'Søknad', N'Faktura sendt
Søknad utfylt og sendt.', N'Fredrik Huseby', CAST(N'2018-02-20T00:00:00.0000000' AS DateTime2), CAST(N'2017-10-30T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (14, 58, 3, N'Søknad', N'Søknad utfylt og sendt', N'-', CAST(N'2017-10-30T00:00:00.0000000' AS DateTime2), CAST(N'2017-10-30T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (15, 58, 5, N'Søknad', N'Søknad avslått', N'-', NULL, NULL, 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (16, 59, 2, N'Søknadsbestemmelser', N'Undersøke', N'Lars A Tobiassen', CAST(N'2018-02-08T00:00:00.0000000' AS DateTime2), CAST(N'2018-02-22T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (17, 103, 2, N'Kontakt', N'Jens Kleven planlegger å ta ta kontakt', N'Jens Kleven', CAST(N'2018-02-20T00:00:00.0000000' AS DateTime2), CAST(N'2018-03-12T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (18, 62, 4, N'Sponsor kontrakt', N'I prosess', N'Morten Huseby', CAST(N'2018-02-27T00:00:00.0000000' AS DateTime2), CAST(N'2018-03-13T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (19, 5, 1, N'Ny sak', N'Epost om', N'Tore Pettersen', CAST(N'2018-02-27T00:00:00.0000000' AS DateTime2), CAST(N'2018-03-13T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (20, 107, 5, N'Søknad', N'16.2 Tlf. om årsak. Forklaring: Mye henv. om støtte, Alta ikke spesielt aktuell hverkenteknologisk og produktmessig
13.2 Avslag om støtte', N'Morten Huseby', CAST(N'2018-02-16T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (21, 81, 2, N'Forespørsel', N'Sende forespørsel', N'Morten Huseby', CAST(N'2018-02-20T00:00:00.0000000' AS DateTime2), CAST(N'2018-03-13T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (22, 82, 2, N'Kontakt', N'Ring Olaf Thon', N'Jan Ove Nilsen', CAST(N'2018-02-20T00:00:00.0000000' AS DateTime2), CAST(N'2018-03-13T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (23, 3, 4, N'Søknad', N'Faktura sendt', N'Fredrik Huseby', CAST(N'2018-02-20T00:00:00.0000000' AS DateTime2), CAST(N'2018-03-13T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (24, 56, 2, N'Andre tilskuddsordninger', N'Sjekke andre tilskuddsordninger innen FD iht JONs samtale med dep råd Røksund', N'Morten Huseby', CAST(N'2018-02-21T00:00:00.0000000' AS DateTime2), CAST(N'2018-03-14T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (25, 63, 2, N'Opprette kontakt', N'Kontakte Dir Ingvar Mathisen mht. status og muligheter ifm. Oslo Kulturhavn', N'Jan Ove Nilsen', CAST(N'2018-02-21T00:00:00.0000000' AS DateTime2), CAST(N'2018-03-14T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (26, 71, 2, N'Skape kontakt', N'Kontakte Tom Solberg', N'Morten Huseby', CAST(N'2018-02-21T00:00:00.0000000' AS DateTime2), CAST(N'2018-03-14T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (27, 57, 2, N'Finne status', N'Finne ut hva som er status', N'Jan Ove Nilsen', CAST(N'2018-02-28T00:00:00.0000000' AS DateTime2), CAST(N'2018-03-14T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (28, 76, 2, N'Se på muligheter', N'Sjekke muligheter etter avslag fra KDA, Kongsberg', N'Morten Huseby', CAST(N'2018-02-21T00:00:00.0000000' AS DateTime2), CAST(N'2018-03-14T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (29, 75, 2, N'Sjekke muligheter', N'Sjekke muligheter etter avslag fra KDA, Kongsberg', N'Morten Huseby', CAST(N'2018-02-21T00:00:00.0000000' AS DateTime2), CAST(N'2018-03-14T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (30, 108, 2, N'Kontakt', N'Kontakte Chr Ringnes', N'Jens Kleven', CAST(N'2018-02-28T00:00:00.0000000' AS DateTime2), CAST(N'2018-03-14T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (31, 109, 2, N'Kontakt', N'Kontakte Slyngstad', N'Jens Kleven', CAST(N'2018-02-21T00:00:00.0000000' AS DateTime2), CAST(N'2018-03-14T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (32, 115, 5, N'Info sendt', N'Informasjon til sponsorer', N'Morten Huseby', CAST(N'2018-03-05T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (33, 116, 5, N'Info sendt', N'Informasjon til sponsorer', N'Morten Huseby', CAST(N'2018-03-05T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (34, 56, 5, N'Info sendt', N'Informasjon til sponsorer', N'Morten Huseby', CAST(N'2018-03-05T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (35, 117, 5, N'Info sendt', N'Informasjon til sponsorer', N'Morten Huseby', CAST(N'2018-03-05T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (36, 68, 5, N'Info sendt', N'Informasjon til sponsorer', N'Morten Huseby', CAST(N'2018-03-05T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (37, 4, 5, N'Info sendt', N'Informasjon til sponsorer', N'Morten Huseby', CAST(N'2018-03-05T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (38, 2, 5, N'Info sendt', N'Informasjon til sponsorer', N'Morten Huseby', CAST(N'2018-03-05T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (39, 3, 5, N'Info sendt', N'Informasjon til sponsorer', N'Morten Huseby', CAST(N'2018-03-05T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (40, 64, 5, N'Info sendt', N'Informasjon til sponsorer', N'Morten Huseby', CAST(N'2018-03-05T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (41, 61, 5, N'Info sendt', N'Informasjon til sponsorer', N'Morten Huseby', CAST(N'2018-03-05T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (42, 1, 5, N'Info sendt', N'Informasjon til sponsorer', N'Morten Huseby', CAST(N'2018-03-05T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (43, 6, 5, N'Info sendt', N'Informasjon til sponsorer', N'Morten Huseby', CAST(N'2018-03-05T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (44, 112, 5, N'Info sendt', N'Informasjon til sponsorer', N'Morten Huseby', CAST(N'2018-03-05T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (45, 110, 5, N'Info sendt', N'Informasjon til sponsorer', N'Morten Huseby', CAST(N'2018-03-05T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (46, 62, 5, N'Info sendt', N'Informasjon til sponsorer', N'Morten Huseby', CAST(N'2018-03-05T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[tblAktivitet] ([AktID], [OrgID], [AktTypeID], [Sak], [SakHandling], [SakAnsvar], [SakDato], [SakFrist], [SakUtført]) VALUES (47, 63, 5, N'Info sendt', N'Informasjon til sponsorer', N'Morten Huseby', CAST(N'2018-03-05T00:00:00.0000000' AS DateTime2), NULL, 1)
SET IDENTITY_INSERT [dbo].[tblAktivitet] OFF
SET IDENTITY_INSERT [dbo].[tblFondLegat] ON 

INSERT [dbo].[tblFondLegat] ([FondID], [OrgID], [SøknadPeriode], [SøknadDetaljer], [SøknadBegrensning], [SøknadMerknad], [SøknadFrist], [NesteSøknad], [TildeltBeløp], [RapportKrav], [RapportFrist], [SøknadStatusID], [SøknadOppfølger]) VALUES (1, 5, N'232W', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[tblFondLegat] ([FondID], [OrgID], [SøknadPeriode], [SøknadDetaljer], [SøknadBegrensning], [SøknadMerknad], [SøknadFrist], [NesteSøknad], [TildeltBeløp], [RapportKrav], [RapportFrist], [SøknadStatusID], [SøknadOppfølger]) VALUES (2, 61, N'Årlig', NULL, 50000, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'Fredrik Huseby')
INSERT [dbo].[tblFondLegat] ([FondID], [OrgID], [SøknadPeriode], [SøknadDetaljer], [SøknadBegrensning], [SøknadMerknad], [SøknadFrist], [NesteSøknad], [TildeltBeløp], [RapportKrav], [RapportFrist], [SøknadStatusID], [SøknadOppfølger]) VALUES (3, 86, NULL, N'Finnes på https://www.sparebankstiftelsen.no/no/sok-stotte', 0, NULL, N'1.2 og 1.9 hvert år', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[tblFondLegat] ([FondID], [OrgID], [SøknadPeriode], [SøknadDetaljer], [SøknadBegrensning], [SøknadMerknad], [SøknadFrist], [NesteSøknad], [TildeltBeløp], [RapportKrav], [RapportFrist], [SøknadStatusID], [SøknadOppfølger]) VALUES (4, 95, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[tblFondLegat] ([FondID], [OrgID], [SøknadPeriode], [SøknadDetaljer], [SøknadBegrensning], [SøknadMerknad], [SøknadFrist], [NesteSøknad], [TildeltBeløp], [RapportKrav], [RapportFrist], [SøknadStatusID], [SøknadOppfølger]) VALUES (5, 70, NULL, NULL, 0, N'
Søknadsformalia på http://www.legatsiden.no/innhold/visettlegat.php?id=3549', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[tblFondLegat] ([FondID], [OrgID], [SøknadPeriode], [SøknadDetaljer], [SøknadBegrensning], [SøknadMerknad], [SøknadFrist], [NesteSøknad], [TildeltBeløp], [RapportKrav], [RapportFrist], [SøknadStatusID], [SøknadOppfølger]) VALUES (6, 77, NULL, NULL, 0, NULL, N'1.11', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[tblFondLegat] ([FondID], [OrgID], [SøknadPeriode], [SøknadDetaljer], [SøknadBegrensning], [SøknadMerknad], [SøknadFrist], [NesteSøknad], [TildeltBeløp], [RapportKrav], [RapportFrist], [SøknadStatusID], [SøknadOppfølger]) VALUES (7, 82, NULL, NULL, 0, NULL, N'31.3 og 30.9', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[tblFondLegat] ([FondID], [OrgID], [SøknadPeriode], [SøknadDetaljer], [SøknadBegrensning], [SøknadMerknad], [SøknadFrist], [NesteSøknad], [TildeltBeløp], [RapportKrav], [RapportFrist], [SøknadStatusID], [SøknadOppfølger]) VALUES (8, 64, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 4, N'Fredrik Huseby')
INSERT [dbo].[tblFondLegat] ([FondID], [OrgID], [SøknadPeriode], [SøknadDetaljer], [SøknadBegrensning], [SøknadMerknad], [SøknadFrist], [NesteSøknad], [TildeltBeløp], [RapportKrav], [RapportFrist], [SøknadStatusID], [SøknadOppfølger]) VALUES (9, 58, NULL, N'Søkt om kr. 500.000 til spesielt formål (reservedel)', 0, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL)
INSERT [dbo].[tblFondLegat] ([FondID], [OrgID], [SøknadPeriode], [SøknadDetaljer], [SøknadBegrensning], [SøknadMerknad], [SøknadFrist], [NesteSøknad], [TildeltBeløp], [RapportKrav], [RapportFrist], [SøknadStatusID], [SøknadOppfølger]) VALUES (11, 1, N'Årlig i 4 år', NULL, 0, NULL, NULL, CAST(N'2020-03-01T00:00:00.0000000' AS DateTime2), 70000, N'Årlig rapport', N'Høst', 6, N'Lars A Tobiassen')
INSERT [dbo].[tblFondLegat] ([FondID], [OrgID], [SøknadPeriode], [SøknadDetaljer], [SøknadBegrensning], [SøknadMerknad], [SøknadFrist], [NesteSøknad], [TildeltBeløp], [RapportKrav], [RapportFrist], [SøknadStatusID], [SøknadOppfølger]) VALUES (12, 59, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[tblFondLegat] ([FondID], [OrgID], [SøknadPeriode], [SøknadDetaljer], [SøknadBegrensning], [SøknadMerknad], [SøknadFrist], [NesteSøknad], [TildeltBeløp], [RapportKrav], [RapportFrist], [SøknadStatusID], [SøknadOppfølger]) VALUES (13, 65, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL)
INSERT [dbo].[tblFondLegat] ([FondID], [OrgID], [SøknadPeriode], [SøknadDetaljer], [SøknadBegrensning], [SøknadMerknad], [SøknadFrist], [NesteSøknad], [TildeltBeløp], [RapportKrav], [RapportFrist], [SøknadStatusID], [SøknadOppfølger]) VALUES (14, 56, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL)
INSERT [dbo].[tblFondLegat] ([FondID], [OrgID], [SøknadPeriode], [SøknadDetaljer], [SøknadBegrensning], [SøknadMerknad], [SøknadFrist], [NesteSøknad], [TildeltBeløp], [RapportKrav], [RapportFrist], [SøknadStatusID], [SøknadOppfølger]) VALUES (15, 56, N'Årlig', NULL, 0, NULL, N'1.10', CAST(N'2018-10-01T00:00:00.0000000' AS DateTime2), 0, N'Vise at beløpet har gått med til å informere om Foprsvaret.', NULL, 6, N'Jan H Syvertsen')
INSERT [dbo].[tblFondLegat] ([FondID], [OrgID], [SøknadPeriode], [SøknadDetaljer], [SøknadBegrensning], [SøknadMerknad], [SøknadFrist], [NesteSøknad], [TildeltBeløp], [RapportKrav], [RapportFrist], [SøknadStatusID], [SøknadOppfølger]) VALUES (16, 78, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[tblFondLegat] OFF
SET IDENTITY_INSERT [dbo].[tblOrganisasjon] ON 

INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (1, N'Horn', N'Hans Herman Horns stiftelse', N'Procurator AS, 	Boks 1656 Vika', NULL, N'0120', N'Oslo', N'#http://www.legatsiden.no/innhold/visettlegat.php?id=3047#', N'2311 6400', NULL, N'Hans Herman Horn', N'950 77 037', N'post@procurator.no', N'horn@fjellbakke.no', N'Lars A Tobiassen', NULL, NULL, 3, 3, 2, N'0', 75000, CAST(N'2017-07-01T00:00:00.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (2, N'Jotun', N'Jotun AS', N'Postboks.2021', NULL, N'3202', N'Sandefjord', N'www.jotun.com#http://www.jotun.com#', N'33 45 70 00', NULL, N'Dag Nyrud', N'906 00960', N'dag.nyrud@jotun.no', NULL, N'Edgar Huseby', NULL, NULL, 2, 2, 2, N'0', NULL, NULL, 0, 1)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (3, N'Teleplan', N'Teleplan gruppen AS', N'Fornebuveien 31', N'-', N'1326', N'Lysaker', N'www.teleplan.no#http://www.teleplan.no#', N'6712 7000', NULL, N'Marianne Holter-Sørensen', NULL, N'mhs@teleplan.no', NULL, N'Gerhard B Ihlen', NULL, NULL, 2, 2, 2, N'0', NULL, NULL, 1, 1)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (4, N'Lloyds', N'Lloyds Register Marine', N'Drammensveien 169', N'Postboks 376 Skøyen', N'0213', N'Oslo', N'www.lr.org#http://www.lr.org#', N'23 28 22 00', N'Brutto beløp', N'Robert Nyiredy, Stein Vangen', NULL, N'robert.nyiredy@lr.org;stein.vangen@lr.org', N'Ref Fredrik. Jan Ove Nilsen', N'Morten Huseby', N'Fredrik Huseby', N'Svein O Mogan', 2, 5, 2, N'0', 200000, CAST(N'2016-11-01T00:00:00.0000000' AS DateTime2), 0, 1)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (5, N'Frank Mohn', N'Frank Mohn AS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Tore Pettersen', NULL, NULL, 2, 2, 4, N'2', NULL, NULL, 1, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (6, N'Castrol', N'Castrol Norge AS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Pål Sørdal', NULL, N'paal.sordal@bp.com', NULL, N'Bjørn Vargset', NULL, NULL, 2, 2, 2, N'0', NULL, NULL, 0, 1)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (56, N'Forsvardept', N'Forsvarsdepartementet', NULL, NULL, NULL, NULL, NULL, NULL, N'Ref. C Neraal epost 22.11.17
Hvordan selge inn / øke tilskuddet - Uten at det går på bekostning av annen støtte de gir?', N'Arne Røksund, FD', NULL, N'postmottak@fd.dep.no', N'Steinar Willassen. Jan Ove Nilsen', N'Jan H Syvertsen', NULL, NULL, 3, 4, 2, N'0', 100000, CAST(N'2018-02-01T00:00:00.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (57, N'Skoleprosjekt', N'Skoleprosjekt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Morten Wærhe. Jan Ove Nilsen', N'Lars A Tobiassen', N'Henning Bull', NULL, 1, 4, 3, N'1', NULL, NULL, 1, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (58, N'Stiftelsen UNI', N'Stiftelsen UNI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Fredrik Huseby', NULL, NULL, 3, 3, 3, N'1', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (59, N'Storebrand', N'Storebrand', NULL, NULL, NULL, NULL, NULL, NULL, N' Ref Lars Tobiassen epost 3.11.17', NULL, NULL, NULL, N'Undersøke med Lars', N'Lars A Tobiassen', NULL, NULL, 3, 2, 3, N'1', NULL, NULL, 1, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (60, N'Thyssen', N'Thyssen Ag', NULL, NULL, NULL, NULL, NULL, NULL, N'Ref. Carstens erfaring m/Thyssen - epost 19.10.17', N'v/B.O.S Defense (Knut Midtbø)', N'6792 6000', NULL, N'Jan Ove Nilsen snakker med Morten Huseby', N'Morten Huseby', NULL, N'Adm Grimstvedt (Ex GIS), Carsten Neraal', 2, 2, 3, N'1', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (61, N'Ander Wilhelmsen', N'A.Wilhelmsen Foundation ', NULL, NULL, NULL, NULL, N'#https://www.awfoundation.no/#', N'2201 4200', N'Se epost 17.10.17', N'Tom Furulund, 
Camilla Salvesen', NULL, N'post@awfoundation.no; 
csalvesen@awilhlmsen.no', NULL, N'Fredrik Huseby', NULL, NULL, 3, 3, 2, N'0', 50000, CAST(N'2017-05-01T00:00:00.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (62, N'Bertil O Steen', N'Bertil O. Steen Defence', NULL, NULL, NULL, NULL, NULL, NULL, N'Lars epost 14.9.17 om B.O.S/Thyssen', N'Knut Midtbø', NULL, N'knut.midtbo@bos.no', N'Jan Ove Nilsen snakker med Morten Huseby', N'Morten Huseby', NULL, NULL, 2, 2, 2, N'0', NULL, NULL, 1, 1)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (63, N'Oslo Havnevesen', N'Oslo Havnevesen', NULL, NULL, NULL, NULL, N'www.oslohavn.no#http://www.oslohavn.no#', NULL, NULL, N'Anette Brække', NULL, N'anette.braekke@ohv.oslo.no    ', N'Hvor lenge?', N'Jan Ove Nilsen', NULL, NULL, 1, 4, 2, N'0', 30000, CAST(N'2017-06-01T00:00:00.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (64, N'Steensland', N'Steensland stiftelse', N'
Fredrik Stangsgt. 4E', NULL, N'
0272', N'Oslo', NULL, NULL, N'Oppdatering.
Ref. Fredrik Huseby epost 16.11.17', N'Michael Steenland-Brun (Tonje Wekre), Melanie Tone Steensland Gotteberg', NULL, N'twekre@steensland.com;melanie@audley.no', NULL, N'Fredrik Huseby', NULL, NULL, 3, 3, 2, N'0', NULL, NULL, 0, 1)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (65, N'ABB', N'ABB AS', NULL, NULL, NULL, NULL, NULL, NULL, N'Prosjekt orientert sponsing? Ref. Edgar epost 8.12.17', NULL, NULL, NULL, NULL, N'Edgar Huseby', NULL, NULL, 2, 2, 4, N'2', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (66, N'Detroit', N'Detroit/Clevland', NULL, NULL, NULL, NULL, NULL, NULL, N'Ref. Edgar epost 8.12.17', NULL, NULL, NULL, NULL, N'Edgar Huseby', NULL, NULL, 2, 2, 4, N'2', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (67, N'DnV', N'Det Norske Veritas', NULL, NULL, NULL, NULL, N'#https://www.dnvgl.com/#', NULL, N'Ref. C Neraal epost 22.11.17', N'Bjørn T Markussen', NULL, NULL, NULL, N'Jan Ove Nilsen', NULL, NULL, 2, 9, 4, N'2', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (68, N'Gard', N'Gard', NULL, NULL, NULL, NULL, N'#http://www.gard.no/web/frontpage#', NULL, NULL, N'Paulsen, Abrahamsen, Mette Ellefsen', NULL, N'mette.ellefsen@updates.gard.no', NULL, N'Jan Ove Nilsen', NULL, NULL, 2, 2, 3, N'1', NULL, NULL, 1, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (69, N'Grieg', N'Grieg Port Security/Fram Marine', NULL, NULL, NULL, NULL, NULL, NULL, N'Ref. C Neraal epost 22.11.17', N'Halvard Heimland, 
Rune Birkelund, Kjetil Brun Hansen', NULL, NULL, NULL, N'Morten Huseby', N'Jan Ove Nilsen', NULL, 2, 9, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (70, N'Høegh stiftelsen', N'Høegh-stiftelsen', NULL, NULL, NULL, NULL, N'#http://www.legatsiden.no/innhold/visettlegat.php?id=3549#', NULL, N'Sponser Narvik', NULL, NULL, NULL, NULL, N'Edgar Huseby', NULL, NULL, 3, 3, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (71, N'Høegh LNG', N'Høegh LNG', NULL, NULL, NULL, NULL, NULL, NULL, N'Ref. epost 1.12.17', N'Tom Solberg', NULL, N'tom.solberg@hoeghlng.com', NULL, N'Edgar Huseby', NULL, NULL, 2, 6, 4, N'2', NULL, NULL, 1, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (72, N'KDA', N'Kongsberg Defence & Aerospace', NULL, NULL, NULL, NULL, N'#https://www.kongsberg.com/#', NULL, N'Ref Per Skard', N'Kyrre Lone', N'920 60 081', N'kyrre.lone@kongsberg.com', NULL, N'Morten Huseby', NULL, NULL, 2, 2, 5, N'X', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (73, N'Kitron', N'Kitron', NULL, NULL, NULL, NULL, N'#http://www.kitron.com/#', NULL, NULL, NULL, NULL, NULL, NULL, N'Jan Ove Nilsen', NULL, NULL, 2, 2, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (74, N'Klaveness', N'Klaveness Management', NULL, NULL, NULL, NULL, N'#https://klaveness.com/about-us/#', NULL, N'Ref. C Neraal epost 22.11.17', N'Jan Erik Rogde', NULL, NULL, NULL, N'Carsten Neraal', N'Jan Ove Nilsen', NULL, 2, 6, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (75, N'Kongsberg Digital', N'Kongsberg Digital/Renewables & Utilities', NULL, NULL, NULL, NULL, NULL, NULL, N'NB! koord med Mortens kontakt m/KDA', NULL, NULL, NULL, NULL, N'Jan Ove Nilsen', NULL, NULL, 2, 2, 4, N'3', NULL, NULL, 1, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (76, N'Kongsberg Maritime', N'Kongsberg Maritime', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Harald Årø, 
Johnny Løcka ', NULL, NULL, NULL, N'Jan Ove Nilsen', NULL, NULL, 2, 2, 4, N'3', NULL, NULL, 1, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (77, N'Kulturminnefondet', N'Kulturminnefondet', NULL, NULL, NULL, NULL, N'https://kulturminnefondet.no/#https://kulturminnefondet.no/#', NULL, NULL, NULL, NULL, NULL, N'Steinar Willassen. 99094917', N'Henning Bull', NULL, NULL, 3, 3, 4, N'3', NULL, NULL, 1, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (78, N'Kulturrådet', N'Kulturrådet', NULL, NULL, NULL, NULL, N'#http://www.kulturradet.no/stotteordning/-/vis/prosjektstotte-kulturvern#', NULL, NULL, NULL, NULL, NULL, NULL, N'Steinar Willassen', NULL, NULL, 3, 3, 4, N'3', NULL, NULL, 1, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (79, N'NHO', N'Norges Hovedorganisasjon', NULL, NULL, NULL, NULL, N'www.nho.no#http://www.nho.no#', NULL, N'Ref. C Neraal epost 22.11.17', N'Truls Baklid', NULL, NULL, NULL, N'Jan Ove Nilsen', NULL, NULL, 2, 5, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (80, N'Hull Club', N'Norwegian Hull Club', NULL, NULL, NULL, NULL, N'#https://www.norclub.com/#', NULL, N'Ref. C Neraal epost 22.11.17', N'Morten Jakobsen', NULL, NULL, NULL, N'Jan Ove Nilsen', NULL, NULL, 2, 5, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (81, N'O B Wiik', N'O B Wiik', N'Industriveien 13', NULL, N'2020', N'Skedsmokorset', N'www.obwiik.no#http://www.obwiik.no#', NULL, NULL, NULL, NULL, N'obw@obwiik.no', NULL, N'Morten Huseby', N'Edgar Huseby', NULL, 2, 2, 3, N'1', NULL, NULL, 1, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (82, N'Olav Thon', N'Olav Thon stiftelsen', NULL, NULL, NULL, NULL, N'#https://ots.olavthonstiftelser.no/soknad-stotte-allmennyttige-formal/#', NULL, N'Ring Olaf Thon', NULL, NULL, N'olavthonstiftelsen@olavthon.no', NULL, N'Jan Ove Nilsen', NULL, NULL, 3, 3, 3, N'1', NULL, NULL, 1, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (83, N'Rederiforbundet', N'Rederiforbundet', NULL, NULL, NULL, NULL, N'#https://www.rederi.no/#', NULL, N'Ref. C Neraal epost 22.11.17', N'Odd Arne Haueng', N'926 58 127', NULL, NULL, N'Jan Ove Nilsen', N'Edgar Huseby', NULL, 1, 5, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (84, N'Siemens', N'Siemens Norge', NULL, NULL, NULL, NULL, NULL, NULL, N'Tips fra K Midtbø, BOS', NULL, NULL, NULL, NULL, N'-', NULL, NULL, 2, 2, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (85, N'Sons of Norway', N'Sons of Norway', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Edgar/Bryan', NULL, NULL, 2, 5, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (86, N'Sparebankstiftelsen DNB', N'Sparebankstiftelsen DNB', NULL, NULL, NULL, NULL, N'#https://www.sparebankstiftelsen.no/no/om-stiftelsen#', NULL, NULL, NULL, NULL, NULL, NULL, N'Morten Huseby', NULL, NULL, 3, 3, 5, N'X', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (87, N'Stavanger Havn', N'Stavanger Havn', NULL, NULL, NULL, NULL, NULL, NULL, N'Ref ONS', N'Steffen Mikalsen', NULL, N'steffen@stavanger.havn.no       ', NULL, N'Steinar Willassen', NULL, NULL, 2, 4, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (88, N'Stiftelsen Christian Radich', N'Stiftelsen Christian Radich', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Vidar Pederstad, leder', NULL, NULL, NULL, N'-', NULL, NULL, 1, 3, 5, N'X', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (89, N'TESS', N'TESS', NULL, NULL, NULL, NULL, NULL, NULL, N'Ref. Fredrik Huseby epost 17.11.17', NULL, NULL, NULL, NULL, N'Jan Ove Nilsen', NULL, N'Morten Wærhe', 2, 2, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (90, N'Thales', N'Thales', NULL, NULL, NULL, NULL, N'#https://www.thalesgroup.com/en/countries/europe/norway#', NULL, N'Tips fra K Midtbø, BOS > NB! ordre på nye kystvaktfartøy', NULL, NULL, NULL, NULL, N'Jan Ove Nilsen', NULL, NULL, 2, 2, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (91, N'USA', N'USA kanaler', NULL, NULL, NULL, NULL, NULL, NULL, N'Kampanjestart
19.12.17 Bryan besøk SON i US', NULL, NULL, NULL, NULL, N'Morten Huseby', N'Steinar Willassen', N'Svein Mogan, Tore Pettersen', 1, 1, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (92, N'Vard', N'Vard', NULL, NULL, NULL, NULL, N'#http://www.vard.com/Pages/default.aspx#', NULL, NULL, N'Vard Langstein', NULL, NULL, NULL, N'Jan Ove Nilsen', NULL, NULL, 2, 2, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (93, N'Warrisk', N'Den norske krigsforsikring for skip', NULL, NULL, NULL, NULL, N'#https://www.warrisk.no/#', NULL, NULL, NULL, NULL, NULL, NULL, N'Jan Ove Nilsen', N'Steinar Willassen', NULL, 2, 2, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (94, N'Wartsile', N'Wartsile Valmarine', NULL, NULL, NULL, NULL, N'#https://www.wartsila.com/valmarine#', NULL, N'Ref. C Neraal epost 22.11.17
Undersøke med Lars Tobiassen', N'Morten Uhl Knudsen', NULL, NULL, NULL, N'-', NULL, NULL, 2, 2, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (95, N'Gjensidige', N'Gjensidigestiftelsen', NULL, NULL, NULL, NULL, N'#http://www.gjensidigestiftelsen.no/#', NULL, NULL, NULL, NULL, NULL, NULL, N'Jan Ove Nilsen', N'Morten Huseby', NULL, 3, 3, 3, N'1', NULL, NULL, 1, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (96, N'Colour Line', N'Colour Line AS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'-', NULL, NULL, 2, 6, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (97, N'Kjell Inge Røkke', N'Kjell Inge Røkke', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'-', NULL, NULL, 2, 1, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (98, N'Telenor', N'Telenor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'-', NULL, NULL, 2, 2, 3, N'1', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (99, N'Tine', N'Tine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'-', NULL, NULL, 2, 2, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (100, N'Nordmannsforbundet', N'Nordmannsforbundet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Brian Antrobus', N'Edgar Huseby', NULL, 1, 5, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (101, N'NAMMO', N'NAMMO Group', NULL, NULL, NULL, NULL, N'#https://www.nammo.com/#', NULL, NULL, NULL, NULL, NULL, NULL, N'-', NULL, NULL, 2, 2, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (102, N'Wilh. Wilhelmsen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Edgar Huseby', NULL, NULL, 2, 6, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (103, N'Petter Olsen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Jens Kleven', NULL, N'"Familiære" kontakter', 1, 1, 4, N'3', NULL, NULL, 1, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (104, N'Oslo Kommune', NULL, NULL, NULL, NULL, NULL, N'www.oslo.kommune.no#http://www.oslo.kommune.no#', NULL, NULL, NULL, NULL, NULL, NULL, N'Morten Huseby', N'Tore Pettersen', N'"Langs havna" /"Havnelangs"?', 1, 1, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (105, N'NRK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Rune Alstedt', N'458 62 119', NULL, NULL, N'Morten Huseby', N'Ø Hallre', NULL, 1, 3, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (106, N'Norshipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Edgar Huseby', N'Tore Pettersen', NULL, 1, 1, 4, N'3', NULL, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (107, N'Kongsberg KDA', N'Kongsberg Defence & Aerospace AS', NULL, NULL, NULL, NULL, N'#https://www.kongsberg.com/#', NULL, NULL, N'Kyrre Lone', N'920 60 081', N'kyrre.lone@kongsberg.com', NULL, N'Morten Huseby', NULL, NULL, 2, 2, 5, N'X', 0, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (108, N'Chr Ringnes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Jens Kleven', NULL, NULL, 1, 1, 1, NULL, 0, NULL, 1, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (109, N'NBIM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Slyngstad', NULL, NULL, NULL, N'Jens Kleven', NULL, NULL, 1, 1, 1, NULL, 0, NULL, 1, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (110, N'Marinetrans', NULL, NULL, NULL, NULL, NULL, N'#http://www3.marinetrans.com/#/about#', NULL, NULL, N'Snorre', NULL, N'snorre@marinetrans.com', NULL, N'Edgar Huseby', NULL, NULL, 2, 6, 3, N'1', 0, NULL, 0, 1)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (111, N'Relieff', NULL, NULL, NULL, NULL, NULL, N'www.relieff.no#http://www.relieff.no#', NULL, NULL, N'Eva Maria Utvåg', NULL, N'eva@relieff.no', NULL, N'Edgar Huseby', NULL, NULL, 2, 2, 3, N'1', 0, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (112, N'Fuglesangs', NULL, NULL, NULL, NULL, NULL, N'#http://www.fuglesangs.no/om-oss/selskapsinfo/#', NULL, NULL, N'Frank Nymoen', NULL, N'frank.nymoen@fuglesangs.no', NULL, N'Edgar Huseby', NULL, NULL, 2, 2, 3, N'1', 0, NULL, 0, 1)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (113, N'_Adminitrativt sponsorgruppe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'-', NULL, NULL, 1, 1, 1, NULL, 0, NULL, 0, 0)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (115, N'Forsvarsmuseet', NULL, NULL, NULL, NULL, NULL, N'#http://forsvaretsmuseer.no/#', NULL, NULL, N'Obltn Steinar W Aasland', N'488 67 149', N'saasland@mil.no', NULL, N'Gerhard B Ihlen', NULL, NULL, 1, 4, 1, NULL, 0, NULL, 1, 1)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (116, N'Forsvarsstaben', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'OK Henning Knudsen_Hauge', N'932 23 768', N'hehauge@mil.no', NULL, N'-', NULL, NULL, 1, 1, 1, NULL, 0, NULL, 1, 1)
INSERT [dbo].[tblOrganisasjon] ([OrgID], [OrgNavnKort], [OrgNavnFull], [OrgAdr1], [OrgAdr2], [OrgPost], [OrgSted], [OrgWeb], [OrgTelf], [OrgMerknad], [OrgKontakt], [OrgKontaktMobil], [OrgKontaktEpost], [OrgKontaktMerknad], [OrgFLKontakt], [OrgFLKontakt2], [OrgFLNettverk], [SuppTypeID], [OrgTypeID], [StatusTypeID], [Prioritet], [TildBeløpSist], [TildDatoSist], [Flagg], [InfoSponsor]) VALUES (117, N'Scanbroker', N'Glander International Bunkering', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Ørjan Hauge', NULL, N'orjan@scanb.no; orjan@gibunkering.com', NULL, N'-', NULL, NULL, 1, 1, 2, N'0', 0, NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[tblOrganisasjon] OFF
SET IDENTITY_INSERT [dbo].[tblSponsor] ON 

INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (1, 1, 70000, N'årlig', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (2, 3, 50000, N'Årlig', N'Kun beløp.', NULL, NULL, 1, N'Ingen', NULL, CAST(N'2015-06-20T00:00:00.0000000' AS DateTime2), N'Inntil videre', 4, NULL, NULL, 2)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (3, 2, 0, N'Årlig', N'Maling og tilhørende midler produsert av/for Jotun fabrikker.', NULL, NULL, 1, N'Ingen', NULL, NULL, NULL, 4, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (4, 4, 200000, N'Hvert 2. år', NULL, N'Deltagelse som "party ship" under Offshore messe i', NULL, 0, N'Ingen', NULL, CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), N'Hvert annet år inntil oppsagt', 4, N'Plattform for selskaper under ONS', NULL, 2)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (5, 6, 0, NULL, N'POL-produkter', NULL, N'Bjørn Vargset', 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (6, 5, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, N'Tidl marinnemann. Framo pumper levert til Forsvaret i stort antall.', NULL, 2)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (7, 56, 0, NULL, NULL, NULL, N'Steinar Willassen', 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (8, 57, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (9, 58, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (10, 59, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (11, 60, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (12, 61, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (13, 62, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (14, 63, 30000, NULL, NULL, N'Forutsetter deltagelse i Oslo Kulturnatt', NULL, 0, N'Ukjent', NULL, NULL, N'For 2018', 1, NULL, NULL, 2)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (15, 64, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (16, 65, 0, NULL, N'Elektro prosjekt?', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 4)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (17, 66, 0, NULL, N'Maskindeler', NULL, N'Edgar Huseby', 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (18, 67, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (19, 68, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (20, 69, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (21, 70, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (22, 71, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (23, 72, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (24, 73, 0, NULL, N'Elektro', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, N'Tips fra K Midtbø, BOS', NULL, 5)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (25, 74, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (26, 75, 0, NULL, N'Elektro', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (27, 76, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (28, 77, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (29, 78, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (30, 79, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (31, 80, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (32, 81, 0, NULL, N'Presenning', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (33, 82, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (34, 83, 0, NULL, N'El materiell', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 4)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (35, 84, 0, NULL, N'El materiell?', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (36, 85, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (37, 86, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (38, 87, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (39, 88, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (40, 89, 0, NULL, N'Slanger og koblinger?', NULL, N'Bjørn Vargset', 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (41, 90, 0, NULL, N'Elektro', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (42, 91, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (43, 92, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (44, 93, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (45, 94, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (46, 95, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (47, 96, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (48, 97, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (49, 98, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (50, 99, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (51, 101, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (52, 102, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (53, 103, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (54, 104, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (55, 105, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (56, 106, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (57, 107, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (58, 100, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (59, 108, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (60, 109, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (61, 110, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (62, 111, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (63, 111, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (64, 112, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (65, 112, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (66, 113, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (67, 115, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (68, 116, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (69, 117, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblSponsor] ([SponsorID], [OrgID], [AvtaleSum], [AvtaleSumPeriode], [AvtaleYtelse], [AvtaleMerknad], [AvtaleOppfølger], [MedlemNobleDame], [RapportKrav], [RapportFrist], [AvtaleInngått], [AvtaleVarighet], [AvtaleStatusID], [AvtaleMotiv], [AvtaleMedia], [SponTypeID]) VALUES (70, 117, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[tblSponsor] OFF
SET IDENTITY_INSERT [dbo].[tblTildeling] ON 

INSERT [dbo].[tblTildeling] ([TildID], [OrgID], [TildBeløp], [TildDato], [TildMerk]) VALUES (1, 61, 50000, CAST(N'2017-05-01T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[tblTildeling] ([TildID], [OrgID], [TildBeløp], [TildDato], [TildMerk]) VALUES (2, 56, 100000, CAST(N'2018-02-01T00:00:00.0000000' AS DateTime2), N'Prosjekt Infospredning')
INSERT [dbo].[tblTildeling] ([TildID], [OrgID], [TildBeløp], [TildDato], [TildMerk]) VALUES (3, 56, 115000, CAST(N'2017-02-01T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[tblTildeling] ([TildID], [OrgID], [TildBeløp], [TildDato], [TildMerk]) VALUES (4, 1, 75000, CAST(N'2017-07-01T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[tblTildeling] ([TildID], [OrgID], [TildBeløp], [TildDato], [TildMerk]) VALUES (5, 4, 200000, CAST(N'2016-11-01T00:00:00.0000000' AS DateTime2), N'Brutto beløp')
INSERT [dbo].[tblTildeling] ([TildID], [OrgID], [TildBeløp], [TildDato], [TildMerk]) VALUES (6, 63, 30000, CAST(N'2017-06-01T00:00:00.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[tblTildeling] OFF
SET IDENTITY_INSERT [dbo].[tblXAktType] ON 

INSERT [dbo].[tblXAktType] ([AktTypeID], [AktType], [AktTypeBeskr]) VALUES (1, N'-', N'?')
INSERT [dbo].[tblXAktType] ([AktTypeID], [AktType], [AktTypeBeskr]) VALUES (2, N'Definert', N'Definert/planlagt aktivitet')
INSERT [dbo].[tblXAktType] ([AktTypeID], [AktType], [AktTypeBeskr]) VALUES (3, N'Påbegynt', N'Aktivitet under gjennomføring')
INSERT [dbo].[tblXAktType] ([AktTypeID], [AktType], [AktTypeBeskr]) VALUES (4, N'> 50% ferdig', N'Mer enn 50% ferdigstilt')
INSERT [dbo].[tblXAktType] ([AktTypeID], [AktType], [AktTypeBeskr]) VALUES (5, N'Utført/avsluttet', N'Avsluttet aktivitet')
SET IDENTITY_INSERT [dbo].[tblXAktType] OFF
INSERT [dbo].[tblXAnsvPerson] ([Ansvarlig]) VALUES (N'-')
INSERT [dbo].[tblXAnsvPerson] ([Ansvarlig]) VALUES (N'Bjørn Vargset')
INSERT [dbo].[tblXAnsvPerson] ([Ansvarlig]) VALUES (N'Brian Antrobus')
INSERT [dbo].[tblXAnsvPerson] ([Ansvarlig]) VALUES (N'Carsten Neraal')
INSERT [dbo].[tblXAnsvPerson] ([Ansvarlig]) VALUES (N'Edgar Huseby')
INSERT [dbo].[tblXAnsvPerson] ([Ansvarlig]) VALUES (N'Fredrik Huseby')
INSERT [dbo].[tblXAnsvPerson] ([Ansvarlig]) VALUES (N'Gerhard B Ihlen')
INSERT [dbo].[tblXAnsvPerson] ([Ansvarlig]) VALUES (N'Henning Bull')
INSERT [dbo].[tblXAnsvPerson] ([Ansvarlig]) VALUES (N'Jan H Syvertsen')
INSERT [dbo].[tblXAnsvPerson] ([Ansvarlig]) VALUES (N'Jan Ove Nilsen')
INSERT [dbo].[tblXAnsvPerson] ([Ansvarlig]) VALUES (N'Jens Kleven')
INSERT [dbo].[tblXAnsvPerson] ([Ansvarlig]) VALUES (N'Lars A Tobiassen')
INSERT [dbo].[tblXAnsvPerson] ([Ansvarlig]) VALUES (N'Morten Huseby')
INSERT [dbo].[tblXAnsvPerson] ([Ansvarlig]) VALUES (N'Ø Hallre')
INSERT [dbo].[tblXAnsvPerson] ([Ansvarlig]) VALUES (N'Steinar Willassen')
INSERT [dbo].[tblXAnsvPerson] ([Ansvarlig]) VALUES (N'Svein A Karlsen')
INSERT [dbo].[tblXAnsvPerson] ([Ansvarlig]) VALUES (N'Svein Mogan')
INSERT [dbo].[tblXAnsvPerson] ([Ansvarlig]) VALUES (N'Tore Pettersen')
SET IDENTITY_INSERT [dbo].[tblXAvtaleStatus] ON 

INSERT [dbo].[tblXAvtaleStatus] ([AvtaleStatusID], [AvtaleStatus], [AvtaleStatusBeskr]) VALUES (1, N'-', N'Ukjent status')
INSERT [dbo].[tblXAvtaleStatus] ([AvtaleStatusID], [AvtaleStatus], [AvtaleStatusBeskr]) VALUES (2, N'Sondering', N'Undersøkelser pågår')
INSERT [dbo].[tblXAvtaleStatus] ([AvtaleStatusID], [AvtaleStatus], [AvtaleStatusBeskr]) VALUES (3, N'Under utarbeidelse', N'Bearbeides aktivt')
INSERT [dbo].[tblXAvtaleStatus] ([AvtaleStatusID], [AvtaleStatus], [AvtaleStatusBeskr]) VALUES (4, N'Avtale i kraft', N'Aktivt støtte fra sponsor/fond/materialer')
INSERT [dbo].[tblXAvtaleStatus] ([AvtaleStatusID], [AvtaleStatus], [AvtaleStatusBeskr]) VALUES (5, N'Avsluttet', N'Avsluttet støtte')
INSERT [dbo].[tblXAvtaleStatus] ([AvtaleStatusID], [AvtaleStatus], [AvtaleStatusBeskr]) VALUES (6, N'Avsluttet/Ny sondering', NULL)
SET IDENTITY_INSERT [dbo].[tblXAvtaleStatus] OFF
SET IDENTITY_INSERT [dbo].[tblXOrgType] ON 

INSERT [dbo].[tblXOrgType] ([OrgTypeID], [OrgType], [OrgTypeBeskr]) VALUES (1, N'Ikke definert', N'-')
INSERT [dbo].[tblXOrgType] ([OrgTypeID], [OrgType], [OrgTypeBeskr]) VALUES (2, N'Industri', N'Forretningsmessig grunnlag')
INSERT [dbo].[tblXOrgType] ([OrgTypeID], [OrgType], [OrgTypeBeskr]) VALUES (3, N'Stiftelse', N'Fond/legat det kan søkes om midler fra')
INSERT [dbo].[tblXOrgType] ([OrgTypeID], [OrgType], [OrgTypeBeskr]) VALUES (4, N'Offentlig', N'Følger offentlig regelverk ved tildeling av misler')
INSERT [dbo].[tblXOrgType] ([OrgTypeID], [OrgType], [OrgTypeBeskr]) VALUES (5, N'Organisasjon', N'Organisasjon')
INSERT [dbo].[tblXOrgType] ([OrgTypeID], [OrgType], [OrgTypeBeskr]) VALUES (6, N'Shipping', NULL)
INSERT [dbo].[tblXOrgType] ([OrgTypeID], [OrgType], [OrgTypeBeskr]) VALUES (7, N'Finans, bank. Forsikring', NULL)
INSERT [dbo].[tblXOrgType] ([OrgTypeID], [OrgType], [OrgTypeBeskr]) VALUES (8, N'Oljeindustri', NULL)
INSERT [dbo].[tblXOrgType] ([OrgTypeID], [OrgType], [OrgTypeBeskr]) VALUES (9, N'Konsulent', NULL)
SET IDENTITY_INSERT [dbo].[tblXOrgType] OFF
SET IDENTITY_INSERT [dbo].[tblXSøknadStatus] ON 

INSERT [dbo].[tblXSøknadStatus] ([SøknadStatusID], [SøknadStatus], [SøknadStatusBeskr]) VALUES (1, N'-', N'Ukjent status')
INSERT [dbo].[tblXSøknadStatus] ([SøknadStatusID], [SøknadStatus], [SøknadStatusBeskr]) VALUES (2, N'Undersøkelse', N'Undersøker muligheter')
INSERT [dbo].[tblXSøknadStatus] ([SøknadStatusID], [SøknadStatus], [SøknadStatusBeskr]) VALUES (3, N'Under utarbeidelse', N'Søknad under utarbeidelse')
INSERT [dbo].[tblXSøknadStatus] ([SøknadStatusID], [SøknadStatus], [SøknadStatusBeskr]) VALUES (4, N'Søknad sendt', N'Søknad sendt')
INSERT [dbo].[tblXSøknadStatus] ([SøknadStatusID], [SøknadStatus], [SøknadStatusBeskr]) VALUES (5, N'Mer info ønsket', N'Fond ønsker uytterligere info')
INSERT [dbo].[tblXSøknadStatus] ([SøknadStatusID], [SøknadStatus], [SøknadStatusBeskr]) VALUES (6, N'Positivt svar', N'Søknad innvilget')
INSERT [dbo].[tblXSøknadStatus] ([SøknadStatusID], [SøknadStatus], [SøknadStatusBeskr]) VALUES (7, N'Negativt svar', N'Søknad avvist')
SET IDENTITY_INSERT [dbo].[tblXSøknadStatus] OFF
SET IDENTITY_INSERT [dbo].[tblXSponsingType] ON 

INSERT [dbo].[tblXSponsingType] ([SponTypeID], [SponType], [SponTypeBeskr]) VALUES (1, N'Ikke definert', N'-')
INSERT [dbo].[tblXSponsingType] ([SponTypeID], [SponType], [SponTypeBeskr]) VALUES (2, N'Økonomisk', N'Støtte med økonomiske midler')
INSERT [dbo].[tblXSponsingType] ([SponTypeID], [SponType], [SponTypeBeskr]) VALUES (3, N'Materiell', N'Støtte med varer')
INSERT [dbo].[tblXSponsingType] ([SponTypeID], [SponType], [SponTypeBeskr]) VALUES (4, N'Arbeid', N'Støtte med arbeidsutførelse, konsultering ol')
INSERT [dbo].[tblXSponsingType] ([SponTypeID], [SponType], [SponTypeBeskr]) VALUES (5, N'Prosjektleveranse', N'Støtte med prosjektgjennomføring')
SET IDENTITY_INSERT [dbo].[tblXSponsingType] OFF
SET IDENTITY_INSERT [dbo].[tblXStatusType] ON 

INSERT [dbo].[tblXStatusType] ([StatusTypeID], [StatusType], [StatusTypeBeskr]) VALUES (1, N'Ukjent', N'Ukjent status')
INSERT [dbo].[tblXStatusType] ([StatusTypeID], [StatusType], [StatusTypeBeskr]) VALUES (2, N'Aktiv', N'Aktivt støtte fra sponsor/fond/materialer')
INSERT [dbo].[tblXStatusType] ([StatusTypeID], [StatusType], [StatusTypeBeskr]) VALUES (3, N'Bearbeides', N'Bearbeides aktivt')
INSERT [dbo].[tblXStatusType] ([StatusTypeID], [StatusType], [StatusTypeBeskr]) VALUES (4, N'Potensiell', N'Mulig bearbeidelse')
INSERT [dbo].[tblXStatusType] ([StatusTypeID], [StatusType], [StatusTypeBeskr]) VALUES (5, N'Avsluttet', N'Avsluttet støtte')
SET IDENTITY_INSERT [dbo].[tblXStatusType] OFF
SET IDENTITY_INSERT [dbo].[tblXSupportType] ON 

INSERT [dbo].[tblXSupportType] ([SuppTypeID], [SuppType], [SuppTypeBeskr]) VALUES (1, N'Ikke definert', N'-')
INSERT [dbo].[tblXSupportType] ([SuppTypeID], [SuppType], [SuppTypeBeskr]) VALUES (2, N'Sponsor', N'Støtte med økonomiske midler eller naturalia')
INSERT [dbo].[tblXSupportType] ([SuppTypeID], [SuppType], [SuppTypeBeskr]) VALUES (3, N'Fond/legat', N'Støtte i form av økonomiske midler etter søknad')
SET IDENTITY_INSERT [dbo].[tblXSupportType] OFF
/****** Object:  Index [IX_tblAktivitet]    Script Date: 02.03.2020 14:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_tblAktivitet] ON [dbo].[tblAktivitet]
(
	[OrgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_tblAktivitet_1]    Script Date: 02.03.2020 14:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_tblAktivitet_1] ON [dbo].[tblAktivitet]
(
	[AktTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_tblFondLegat]    Script Date: 02.03.2020 14:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_tblFondLegat] ON [dbo].[tblFondLegat]
(
	[OrgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_tblOrganisasjon]    Script Date: 02.03.2020 14:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_tblOrganisasjon] ON [dbo].[tblOrganisasjon]
(
	[OrgTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_tblOrganisasjon_1]    Script Date: 02.03.2020 14:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_tblOrganisasjon_1] ON [dbo].[tblOrganisasjon]
(
	[StatusTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_tblOrganisasjon_2]    Script Date: 02.03.2020 14:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_tblOrganisasjon_2] ON [dbo].[tblOrganisasjon]
(
	[SuppTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_tblSponsor]    Script Date: 02.03.2020 14:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_tblSponsor] ON [dbo].[tblSponsor]
(
	[OrgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_tblSponsor_1]    Script Date: 02.03.2020 14:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_tblSponsor_1] ON [dbo].[tblSponsor]
(
	[SponTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_tblSponsor_2]    Script Date: 02.03.2020 14:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_tblSponsor_2] ON [dbo].[tblSponsor]
(
	[AvtaleStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_tblTildeling]    Script Date: 02.03.2020 14:39:30 ******/
CREATE NONCLUSTERED INDEX [IX_tblTildeling] ON [dbo].[tblTildeling]
(
	[OrgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAktivitet] ADD  CONSTRAINT [DF_tblAktivitet_SakUtført]  DEFAULT ((0)) FOR [SakUtført]
GO
ALTER TABLE [dbo].[tblSponsor] ADD  CONSTRAINT [DF_tblSponsor_MedlemNobleDame]  DEFAULT ((0)) FOR [MedlemNobleDame]
GO
ALTER TABLE [dbo].[tblAktivitet]  WITH CHECK ADD  CONSTRAINT [FK_tblAktivitet_tblOrganisasjon] FOREIGN KEY([OrgID])
REFERENCES [dbo].[tblOrganisasjon] ([OrgID])
GO
ALTER TABLE [dbo].[tblAktivitet] CHECK CONSTRAINT [FK_tblAktivitet_tblOrganisasjon]
GO
ALTER TABLE [dbo].[tblAktivitet]  WITH CHECK ADD  CONSTRAINT [FK_tblAktivitet_tblXAktType] FOREIGN KEY([AktTypeID])
REFERENCES [dbo].[tblXAktType] ([AktTypeID])
GO
ALTER TABLE [dbo].[tblAktivitet] CHECK CONSTRAINT [FK_tblAktivitet_tblXAktType]
GO
ALTER TABLE [dbo].[tblFondLegat]  WITH CHECK ADD  CONSTRAINT [FK_tblFondLegat_tblOrganisasjon] FOREIGN KEY([OrgID])
REFERENCES [dbo].[tblOrganisasjon] ([OrgID])
GO
ALTER TABLE [dbo].[tblFondLegat] CHECK CONSTRAINT [FK_tblFondLegat_tblOrganisasjon]
GO
ALTER TABLE [dbo].[tblFondLegat]  WITH CHECK ADD  CONSTRAINT [FK_tblFondLegat_tblXSøknadStatus] FOREIGN KEY([SøknadStatusID])
REFERENCES [dbo].[tblXSøknadStatus] ([SøknadStatusID])
GO
ALTER TABLE [dbo].[tblFondLegat] CHECK CONSTRAINT [FK_tblFondLegat_tblXSøknadStatus]
GO
ALTER TABLE [dbo].[tblOrganisasjon]  WITH CHECK ADD  CONSTRAINT [FK_tblOrganisasjon_tblXOrgType] FOREIGN KEY([OrgTypeID])
REFERENCES [dbo].[tblXOrgType] ([OrgTypeID])
GO
ALTER TABLE [dbo].[tblOrganisasjon] CHECK CONSTRAINT [FK_tblOrganisasjon_tblXOrgType]
GO
ALTER TABLE [dbo].[tblOrganisasjon]  WITH CHECK ADD  CONSTRAINT [FK_tblOrganisasjon_tblXStatusType] FOREIGN KEY([StatusTypeID])
REFERENCES [dbo].[tblXStatusType] ([StatusTypeID])
GO
ALTER TABLE [dbo].[tblOrganisasjon] CHECK CONSTRAINT [FK_tblOrganisasjon_tblXStatusType]
GO
ALTER TABLE [dbo].[tblOrganisasjon]  WITH CHECK ADD  CONSTRAINT [FK_tblOrganisasjon_tblXSupportType] FOREIGN KEY([SuppTypeID])
REFERENCES [dbo].[tblXSupportType] ([SuppTypeID])
GO
ALTER TABLE [dbo].[tblOrganisasjon] CHECK CONSTRAINT [FK_tblOrganisasjon_tblXSupportType]
GO
ALTER TABLE [dbo].[tblSponsor]  WITH CHECK ADD  CONSTRAINT [FK_tblSponsor_tblOrganisasjon] FOREIGN KEY([OrgID])
REFERENCES [dbo].[tblOrganisasjon] ([OrgID])
GO
ALTER TABLE [dbo].[tblSponsor] CHECK CONSTRAINT [FK_tblSponsor_tblOrganisasjon]
GO
ALTER TABLE [dbo].[tblSponsor]  WITH CHECK ADD  CONSTRAINT [FK_tblSponsor_tblXSponsingType] FOREIGN KEY([SponTypeID])
REFERENCES [dbo].[tblXSponsingType] ([SponTypeID])
GO
ALTER TABLE [dbo].[tblSponsor] CHECK CONSTRAINT [FK_tblSponsor_tblXSponsingType]
GO
ALTER TABLE [dbo].[tblSponsor]  WITH CHECK ADD  CONSTRAINT [FK_tblSponsor_tblXStatusType] FOREIGN KEY([AvtaleStatusID])
REFERENCES [dbo].[tblXStatusType] ([StatusTypeID])
GO
ALTER TABLE [dbo].[tblSponsor] CHECK CONSTRAINT [FK_tblSponsor_tblXStatusType]
GO
ALTER TABLE [dbo].[tblTildeling]  WITH CHECK ADD  CONSTRAINT [FK_tblTildeling_tblOrganisasjon] FOREIGN KEY([OrgID])
REFERENCES [dbo].[tblOrganisasjon] ([OrgID])
GO
ALTER TABLE [dbo].[tblTildeling] CHECK CONSTRAINT [FK_tblTildeling_tblOrganisasjon]
GO
