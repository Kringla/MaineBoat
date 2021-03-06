USE [105881-selskap]
GO
/****** Object:  Table [dbo].[ArrTyper]    Script Date: 28.03.2019 16:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArrTyper](
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
/****** Object:  Table [dbo].[Kunde]    Script Date: 28.03.2019 16:18:11 ******/
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
/****** Object:  Table [dbo].[Arrangement]    Script Date: 28.03.2019 16:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arrangement](
	[ArrID] [int] IDENTITY(1,1) NOT NULL,
	[KundeID] [int] NOT NULL,
	[ArrTypeID] [int] NULL,
	[ArrStedID] [int] NULL,
	[ArrDato] [date] NULL,
	[AnkKl] [nvarchar](5) NULL,
	[SluttKl] [nvarchar](5) NULL,
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
	[ArrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArrSted]    Script Date: 28.03.2019 16:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArrSted](
	[ArrStedID] [int] IDENTITY(1,1) NOT NULL,
	[Sted] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_ArrSted] PRIMARY KEY CLUSTERED 
(
	[ArrStedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwArrangement]    Script Date: 28.03.2019 16:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwArrangement]
AS
SELECT        dbo.Arrangement.ArrDato, dbo.Arrangement.AnkKl, dbo.Arrangement.SluttKl, dbo.ArrSted.Sted, dbo.Kunde.KundeNavn, dbo.ArrTyper.ArrType, dbo.Arrangement.ArrID
FROM            dbo.Arrangement INNER JOIN
                         dbo.ArrSted ON dbo.Arrangement.ArrStedID = dbo.ArrSted.ArrStedID INNER JOIN
                         dbo.Kunde ON dbo.Arrangement.KundeID = dbo.Kunde.KundeID INNER JOIN
                         dbo.ArrTyper ON dbo.Arrangement.ArrTypeID = dbo.ArrTyper.ArrTypeID
GO
/****** Object:  Table [dbo].[ArrMat]    Script Date: 28.03.2019 16:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArrMat](
	[MatID] [int] IDENTITY(1,1) NOT NULL,
	[MatKode] [nvarchar](2) NOT NULL,
	[MatBeskrivelse] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_ArrMat] PRIMARY KEY CLUSTERED 
(
	[MatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArrPers]    Script Date: 28.03.2019 16:18:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArrPers](
	[PersID] [int] IDENTITY(1,1) NOT NULL,
	[Person] [nvarchar](3) NOT NULL,
	[PersonNavn] [nvarchar](255) NOT NULL,
	[Sluttet] [bit] NOT NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_ArrPers] PRIMARY KEY CLUSTERED 
(
	[PersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArrStatus]    Script Date: 28.03.2019 16:18:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArrStatus](
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
/****** Object:  Table [dbo].[ArrVarer]    Script Date: 28.03.2019 16:18:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArrVarer](
	[ArrVareID] [int] IDENTITY(1,1) NOT NULL,
	[ArrID] [int] NOT NULL,
	[VareID] [int] NOT NULL,
	[AntFakt] [smallint] NULL,
	[AntBong] [smallint] NULL,
	[AntKontant] [smallint] NULL,
	[Merknader] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StandardEpost]    Script Date: 28.03.2019 16:18:12 ******/
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
/****** Object:  Table [dbo].[StandardVerdier]    Script Date: 28.03.2019 16:18:12 ******/
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
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_StandardVerdier] PRIMARY KEY CLUSTERED 
(
	[StdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VareKorr]    Script Date: 28.03.2019 16:18:12 ******/
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
/****** Object:  Table [dbo].[Varer]    Script Date: 28.03.2019 16:18:12 ******/
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
/****** Object:  Table [dbo].[VarerSalg]    Script Date: 28.03.2019 16:18:12 ******/
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
/****** Object:  Table [dbo].[VareTyper]    Script Date: 28.03.2019 16:18:12 ******/
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
SET IDENTITY_INSERT [dbo].[Arrangement] ON 

INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (6, 3, 5, 1, CAST(N'2014-11-19' AS Date), N'18:00', N'23:00', 12, 0, NULL, NULL, 3, NULL, 0, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, N'Karl Ove Ingebrigtsen', N'Karl-Ove.Ingebrigtsen@lr.org', N'90847537', 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (7, 4, 5, 1, CAST(N'2017-11-24' AS Date), N'17:00', N'23:00', 12, 350, N'Musserende', N'Lutefisk m/ tilbehør', 3, N'Øl, alkoholfritt, akevitt', 1, 20, NULL, 0, 250, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'Roger Monsen', NULL, 4, NULL, N'Som kundenavn', N'evenwk@gmail.com', N'992 08 768', 1, NULL, 1)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (8, 3, 5, 1, CAST(N'2017-01-19' AS Date), N'18:00', N'23:00', 12, 350, N'Cava, Bris og Eplesider i styrehuset. Salt. Maks 2 glass pr person', N'Forrett Lakseterrin.
Hovedrett: Erter kjøtt og mølje og rogn 
Dessert: Abborfromasj', 2, N'Munkholm/Pils og akevitt. Maks 12 glass akevitt pr gjest', 1, 20, N'Hodepinetabletter etter middag', 1, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3000, 12, 250, N'Hans Borti Salvesen', NULL, 10, 12, N'Bjørn Inge Bakken', N'bjorn.inge.bakken@lr.org', NULL, 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (12, 13, 5, 1, CAST(N'2014-11-26' AS Date), N'18:30', N'23:00', 6, 0, NULL, NULL, 3, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, N'Jørn P Johnsen', NULL, N'990 93 152', 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (14, 14, 5, 1, CAST(N'2017-11-30' AS Date), N'18:00', N'23:00', 8, 0, NULL, NULL, 3, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, N'Sten O. Solberge', N'sos@adeb.no', N'982 94 589', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (15, 15, 5, 1, CAST(N'2018-12-01' AS Date), N'18:00', N'23:00', 12, 400, NULL, NULL, 2, NULL, 0, 20, NULL, 0, 4000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', N'lars.tobiassen@hotmail.com', N'901 42 321', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (17, 10, 5, 1, CAST(N'2014-11-20' AS Date), N'18:00', N'23:00', 12, 350, N'Cava, Bris og Eplesider', N'Erter, kjøtt og flesk
Abborfromasj', 1, N'Munkholm/Pils og akevitt. Maks 12 glass akevitt pr gjest', 1, 20, NULL, 1, 300, 11, 0, 0, 0, 0, 0, 0, 0, 0, 3, 5000, 4, 250, N'Roger Monsen', NULL, 4, 13, N'S Masserud', NULL, N'922 31 968', 3, NULL, 1)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (18, 16, 5, 1, CAST(N'2014-12-03' AS Date), N'18:00', N'23:00', 12, 0, NULL, NULL, 3, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, N'S Fjærvoll', N'serge.fjaervoll@gmail.com', N'406 39 065', 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (20, 5, 1, 1, CAST(N'2014-12-09' AS Date), N'19:00', N'23:30', 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, N'Som kundenavn', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (21, 18, 5, 1, CAST(N'2017-12-14' AS Date), N'18:00', N'23:00', 10, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 4000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 250, NULL, NULL, NULL, NULL, N'Carsten Neraal', N'Carsten.Neraal@asker,kommune,no', NULL, 2, NULL, 1)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (22, 19, 5, 1, CAST(N'2018-12-07' AS Date), N'18:00', N'23:00', 14, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 4000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 250, NULL, NULL, NULL, NULL, N'Ole Bull', N'opbull@deltacunsult.no', N'92687814', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (24, 12, 5, 1, CAST(N'2017-12-12' AS Date), N'18:00', N'23:00', 10, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 4000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', N'knut.midtbo@bos.no', NULL, 2, NULL, 1)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (25, 21, 5, 1, CAST(N'2014-12-13' AS Date), N'18:00', N'23:00', 14, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 4000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', NULL, N'998 66 239', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (26, 22, 5, 1, CAST(N'2018-11-24' AS Date), N'18:00', N'23:00', 8, 0, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 250, NULL, NULL, NULL, NULL, N'Sven Ellefsen', NULL, N'926 22 887', 2, N'Gjør alt selv…….', 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (27, 6, 5, 1, CAST(N'2015-01-16' AS Date), N'18:00', N'23:00', 14, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 4000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', N'agr@teleplan.no', N'930 67 105', 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (28, 9, 5, 1, CAST(N'2014-11-12' AS Date), N'18:00', N'23:00', 14, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 4000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', NULL, NULL, 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (29, 7, 5, 1, CAST(N'2014-11-11' AS Date), N'18:00', N'23:00', 12, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 4000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', NULL, NULL, 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (30, 3, 5, 1, CAST(N'2017-12-08' AS Date), N'18:00', N'23:00', 12, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 4000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 250, NULL, NULL, NULL, NULL, N'Bjørn Inge Bakken', N'bjorn.inge.bakken@lr.org', N'92805442', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (31, 8, 5, 1, CAST(N'2014-11-06' AS Date), N'18:00', N'23:00', 13, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 4000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 250, NULL, NULL, NULL, NULL, N'O-A Uttberg', NULL, N'920 15 690', 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (32, 11, 5, 1, CAST(N'2017-12-13' AS Date), N'18:00', N'23:00', 11, 400, NULL, NULL, 4, NULL, 0, 20, NULL, 0, 4000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2000, 0, 250, N'Alta', NULL, NULL, NULL, N'Som kundenavn', NULL, N'951 44 477', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (33, 23, 5, 1, CAST(N'2016-11-30' AS Date), N'18:00', N'23:00', 12, 400, N'Musserende', NULL, 3, N' øl', 1, 20, NULL, 0, 50, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', N'gerhard@ihlen.net', N'930 67 135', 2, N'Kunden sørger for akevitt', 1)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (34, 3, 5, 1, CAST(N'2015-11-20' AS Date), N'18:00', N'23:00', 12, 400, N'Moet Chandon', N'Lutefisk m/ tilbehør', 3, N'Øl, akevitt, vin, mineralvann', 1, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 1, 6, N'Bjørn Inge Bakken', N'bjorn.inge.bakken@lr.org', N'92805442', 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (35, 3, 5, 1, CAST(N'2015-12-10' AS Date), N'18:00', N'23:00', 12, 400, N'Moet Chandon', N'Lutefisk m/ tilbehør', 3, N'Øl, akevitt, vin, mineralvann', 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 1, NULL, N'Bjørn Inge Bakken', N'bjorn.inge.bakken@lr.org', N'92804452', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (36, 3, 5, 1, CAST(N'2015-11-13' AS Date), N'18:00', N'23:00', 12, 400, N'Moet Chandon', N'Lutefisk m/ tilbehør', 3, N'Øl, akevitt, vin, mineralvann', 1, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 1, NULL, N'Karl Ove Ingebrigtsen', N'karl-ove.Ingebrigtsen@lr.org', N'90847537', 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (37, 3, 5, 1, CAST(N'2017-02-13' AS Date), N'18:00', N'23:00', 12, 400, N'Moet Chandon', N'Lutefisk m/ tilbehør', 2, N'Øl, akevitt, vin, mineralvann', 1, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 1, 6, N'Karl Ove Ingebrigtsen', N'karl-ove.Ingebrigtsen@lr.org', N'90847537', 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (39, 24, 5, 1, CAST(N'2017-12-15' AS Date), N'18:00', N'23:00', 12, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, N'Lars', NULL, 1, NULL, N'Jørn Longem', N'jal@Teleplan.no', N'93067112', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (40, 24, 5, 1, CAST(N'2017-11-22' AS Date), N'18:00', N'23:00', 12, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 1, NULL, N'Jørn Longem / C.C. Welhaven', N'jal@Teleplan.no', N'93067112', 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (41, 4, 5, 1, CAST(N'2018-11-23' AS Date), N'18:00', N'23:00', 12, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 1, 18, N'Even Kristoffersen', N'evenwk@gmail.com', N'99208768', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (42, 4, 5, 1, CAST(N'2018-12-13' AS Date), N'18:00', N'23:00', 12, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 1, NULL, N'Even Kristoffersen', N'evenwk@gmail.com', N'99208768', 2, NULL, 1)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (43, 14, 5, 1, CAST(N'2015-11-26' AS Date), N'18:00', N'23:00', 8, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 1, 27, N'Stein O Solberg', N'sos@adeb.no', N'98294589', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (44, 16, 5, 1, CAST(N'2015-12-04' AS Date), N'18:00', N'23:00', 12, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 30, 18, N'S Fjærvoll', N'serge.fjaervoll@gmail.com', N'406 39 065', 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (45, 19, 5, 1, CAST(N'2017-12-01' AS Date), N'18:00', N'23:00', 14, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 1, 18, N'Ole Bull', N'opbull@deltaconsult.no', N'92687814', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (46, 8, 5, 1, CAST(N'2015-11-05' AS Date), N'18:00', N'23:00', 13, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, N'Hans Borti Salvesen', N'95216915', 29, 28, N'Brynjulf Freberg', NULL, NULL, 5, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (48, 26, 9, 2, CAST(N'2015-08-20' AS Date), N'18:00', N'23:00', 20, 400, NULL, NULL, NULL, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 21, NULL, N'Jørn Baade', NULL, NULL, 2, N'Seilas med middagservering / grilling', 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (49, 9, 5, 1, CAST(N'2015-11-11' AS Date), N'18:00', N'23:00', 14, 0, NULL, NULL, 3, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 10, 22, N'Arvid Paulsen', NULL, N'95779783', 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (50, 15, 5, 1, CAST(N'2018-12-31' AS Date), N'18:00', N'23:00', 12, 400, NULL, NULL, 2, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 1, NULL, N'Lars Tobiassen', N'lars.tobiassen@hotmail.com', N'90142321', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (52, 27, 5, 1, CAST(N'2014-12-15' AS Date), N'18:00', N'23:00', 6, 350, NULL, N'Pinnekjøtt', 4, N'Øl, akevitt, mineralvann', 1, 20, NULL, 0, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, N'Svein O. Mogan', N'95201405', NULL, NULL, N'Som kundenavn', N'caerichsen@fhs.mil.no', NULL, 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (54, 29, 6, 2, CAST(N'2015-06-16' AS Date), N'18:00', N'23:00', 20, 400, NULL, NULL, 10, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, N'Roger Monsen', NULL, 4, NULL, N'Oslo Nord Rotaryklubb', N'amkvalsnes@gmail.com', N'46695431', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (56, 2, NULL, NULL, CAST(N'2014-09-27' AS Date), N'18:00', N'23:00', 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, N'Som kundenavn', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (58, 30, 5, 1, CAST(N'2015-01-17' AS Date), N'17:00', N'23:00', 10, 250, NULL, N'Bacalao', 12, N'Øl, akevitt, mineralvann', 1, 20, NULL, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Tore Pettersen', N'ibackl@online.no', N'959 69 346', 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (59, 30, 5, 1, CAST(N'2016-12-03' AS Date), N'18:00', N'23:00', 9, 350, N'Musserende', N'Lutefisk m/ tilbehør', 3, N'øl, akevitt, alkoholfritt', 1, 20, NULL, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 1, 18, N'Tore Pettersen', N'sjef@m314alta.org', N'90639358', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (60, 32, 6, 8, CAST(N'2018-05-17' AS Date), N'13:00', N'17:00', 0, 400, NULL, NULL, 15, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, N'Roger Monsen', NULL, 4, NULL, N'Petter Krosby', N'petter.krosby@gmail.com', N'977 19 206', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (61, 33, 9, 1, CAST(N'2015-05-19' AS Date), N'12:00', N'23:00', 20, 400, NULL, NULL, 10, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Petter Sørensen', NULL, N'918 28 237', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (62, 34, 5, 1, CAST(N'2017-03-11' AS Date), N'18:00', N'23:00', 15, 400, NULL, NULL, 2, NULL, 0, 20, NULL, 0, 300, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'OK Morten Berard-Andersen', NULL, N'6480 3830', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (63, 35, 9, 2, CAST(N'2015-05-28' AS Date), N'18:00', N'23:00', 40, 400, NULL, NULL, 10, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Terje Næss', NULL, N'6923 8211', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (65, 20, 5, 1, CAST(N'2015-11-28' AS Date), N'18:00', N'23:00', 12, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 1, 18, N'Svein B Nielsen', N'snielsen@mil.no', NULL, 5, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (66, 36, 5, 1, CAST(N'2015-11-18' AS Date), N'18:00', N'23:00', 12, 400, N'Musserende på bro', N'Lutefisk
Dessert, TBD', 3, N'Øl og akevitt', 1, 20, N'Konjakk til kaffe', 1, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 1, 26, N'Som kundenavn', N'rune.edvard.andersen@hotmail.com', N'948 15 755', 5, N'Antall gjester bestemmes senere. Pris er gitt som for 2014. Ev endringer til anslått selvkost vil bli varslet, med rett til å avbestille', 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (67, 37, 9, 8, CAST(N'2017-09-09' AS Date), N'17:00', N'20:00', 25, 400, NULL, NULL, 2, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 2, NULL, N'Ståle Hartman', N'@mil.no', N'48285297', 5, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (68, 38, 5, 1, CAST(N'2017-01-24' AS Date), N'18:00', N'23:00', 10, 400, NULL, NULL, 5, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'O/K Magne Hovland', N'mhovland@mil.no', N'920 13 001', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (70, 39, 5, 1, CAST(N'2015-10-01' AS Date), N'17:00', N'23:00', 12, 400, NULL, NULL, 2, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 8, NULL, N'Moritz Askildt', N'moritz.askildt@online.no', NULL, 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (71, 18, 2, 3, CAST(N'2018-04-07' AS Date), N'18:00', N'23:00', 6, 400, NULL, NULL, 10, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 30, 27, N'Carsten Neraal', N'Carsten.neraal@asker.kommune.no', NULL, 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (72, 18, 5, 1, CAST(N'2017-11-16' AS Date), N'18:00', N'23:00', 8, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 30, NULL, N'Carsten Neeraal', N'carsten.neraal@akser.kommune.no', NULL, 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (73, 40, 9, 2, CAST(N'2016-06-02' AS Date), N'16:00', N'23:00', 12, 0, N'Musserende med/uten alkohol', N'Fiskesuppe', 17, N'Øl, mineralvann, alkoholfri øl', 1, NULL, N'Kringle', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5000, 0, 250, N'Hans B Salvesen', NULL, 9, NULL, N'H H Horn', N'horn@fjellbakke.no', N'95077037', 2, N'Selvkostprising utover seilas.', 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (74, 41, 6, 2, CAST(N'2015-09-02' AS Date), N'17:00', N'23:00', 25, NULL, NULL, NULL, NULL, N'Øl og mineralvann', 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', NULL, NULL, 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (75, 42, 4, 1, CAST(N'2015-10-03' AS Date), N'12:30', N'23:00', 0, 400, NULL, NULL, 16, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Terje Haaverstad', NULL, NULL, 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (76, 43, 5, 1, CAST(N'2015-11-06' AS Date), N'18:00', N'23:00', 0, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 1, 28, N'Singdahlsen', NULL, N'905 66 818', 5, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (77, 38, 5, 2, CAST(N'2018-06-26' AS Date), N'18:00', N'23:00', 0, 400, NULL, NULL, 10, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 15, 5, N'O/K Magne Hovland', NULL, N'992 08 735', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (78, 22, 5, 1, CAST(N'2016-09-08' AS Date), N'18:00', N'23:00', 0, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 9, NULL, N'Som kundenavn', NULL, N'92622887', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (79, 38, 5, 1, CAST(N'2015-11-25' AS Date), N'18:00', N'23:00', 0, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 15, 5, N'O/K Magne Hovland', NULL, NULL, 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (80, 44, 7, 7, CAST(N'2015-11-10' AS Date), N'08:00', N'23:00', 14, 400, NULL, NULL, 16, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, N'HBS', NULL, NULL, NULL, N'Brian Sangill', N'bs@hvsa.dk', NULL, 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (81, 7, 5, 1, CAST(N'2015-12-08' AS Date), N'18:00', N'23:00', 8, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Monica Dahlberg Eikeland', NULL, NULL, 5, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (82, 34, 5, 2, CAST(N'2018-06-19' AS Date), N'18:00', N'23:00', 14, 400, NULL, NULL, 10, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 29, 18, N'OK Morten Berard-Andersen', NULL, N'6480 3830', 5, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (83, 34, NULL, 1, CAST(N'2015-12-17' AS Date), N'18:00', N'23:00', 0, 400, NULL, NULL, NULL, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'OK Morten Berard-Andersen', NULL, N'6480 3830', 5, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (84, 45, NULL, 1, CAST(N'2015-12-16' AS Date), N'18:00', N'23:00', 10, 400, NULL, NULL, NULL, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, 29, 18, N'Som kundenavn', NULL, NULL, 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (85, 46, 5, 7, CAST(N'2015-10-20' AS Date), N'18:00', N'23:00', 15, 400, NULL, NULL, 2, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, N'L A Tobiassen', NULL, NULL, NULL, N'Som kundenavn', NULL, NULL, 3, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (86, 24, 5, 1, CAST(N'2016-12-14' AS Date), N'18:00', N'23:00', 10, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Jørn Longem', N'jal@teleplan.no', N'93067112', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (87, 36, 5, 1, CAST(N'2016-01-23' AS Date), N'18:00', N'23:00', 0, 400, NULL, NULL, NULL, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, N'Lars A Tobiassen', NULL, 22, NULL, N'Som kundenavn', NULL, NULL, 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (88, 12, 5, 1, CAST(N'2015-12-07' AS Date), N'18:00', N'23:00', 12, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', NULL, NULL, 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (89, 47, 7, 1, CAST(N'2016-04-07' AS Date), N'18:00', N'23:00', 6, 400, NULL, NULL, 10, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Inge Kampnes', NULL, N'47483709', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (90, 48, 5, 1, CAST(N'2017-03-21' AS Date), N'18:00', N'13:00', 18, 400, NULL, NULL, 6, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Wright', NULL, NULL, 5, N'Seilas fra kl 17.00', 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (91, 49, 8, 7, CAST(N'2016-05-28' AS Date), N'09:00', N'00:00', 12, 400, NULL, NULL, NULL, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'?', NULL, NULL, 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (92, 50, 5, 1, CAST(N'2016-06-06' AS Date), N'17:00', N'23:00', 0, 400, NULL, NULL, 10, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'H.B. Salvesen', N'borti@online.no', N'95216915', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (93, 51, 7, 1, CAST(N'2016-09-26' AS Date), N'17:00', N'23:00', 0, 400, NULL, NULL, 19, NULL, 0, 20, NULL, 0, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'E. Dagslett', NULL, N'91390671', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (94, 58, 9, 8, CAST(N'2016-06-11' AS Date), N'17:00', N'23:00', 20, 400, NULL, NULL, 10, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Bjørnar Brekke', N'bbrekke@mil.no', NULL, 5, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (95, 59, 7, 1, CAST(N'2018-04-10' AS Date), N'18:00', N'23:00', 12, 400, NULL, NULL, 9, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Kjell Olsen', NULL, NULL, 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (96, 60, 1, 1, CAST(N'2016-09-13' AS Date), N'18:00', N'23:00', 8, 400, NULL, NULL, NULL, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', N'hankh@online.no', N'99208767', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (97, 62, 1, 1, CAST(N'2018-05-24' AS Date), N'18:00', N'23:00', 14, 400, NULL, NULL, 10, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Inge Thorsen', N'inge2rsl@gmail.com', N'9175876', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (99, 63, 1, 1, CAST(N'2016-12-15' AS Date), N'18:00', N'23:00', 8, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', N'sandra.tjorn@gmail.no', N'95912286', 5, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (101, 65, 1, 1, CAST(N'2016-06-20' AS Date), N'18:00', N'23:00', 15, 400, NULL, NULL, 10, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Henning Bull', N'sponsor@m314alta,org', N'95543333', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (102, 66, 1, 2, CAST(N'2016-06-21' AS Date), N'18:00', N'23:00', 0, 400, NULL, NULL, 10, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Jan Nyegaarden', N'jny@teleplan.no', N'93067087', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (104, 67, 5, 1, CAST(N'2016-10-27' AS Date), N'18:00', N'23:00', 20, 400, NULL, NULL, 2, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Vilhelm Koefoed', N'V@koefoed.no', N'90277527', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (109, 71, 9, 1, CAST(N'2018-06-14' AS Date), N'10:00', N'23:00', 8, 400, NULL, NULL, 14, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', N'saasland@mil.no', N'48867149', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (110, 72, 5, 1, CAST(N'2018-01-12' AS Date), N'18:00', N'23:00', 14, 400, NULL, NULL, 2, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Malin Svellingen', NULL, N'95742642', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (112, 18, 5, 1, CAST(N'2017-11-21' AS Date), N'18:00', N'23:00', 8, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Carsten Neraal', N'carsten.neraal@asker.kommune.no', NULL, 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (115, 16, 5, 1, CAST(N'2018-01-26' AS Date), N'18:00', N'23:00', 12, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'S Fjærvoll', N'serge.fjaervoll@gmail.com', NULL, 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (116, 77, 5, 1, CAST(N'2016-12-15' AS Date), N'18:00', N'23:00', 10, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Britt Solli', N'britt.solli@fd.dep.no', N'97544074', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (117, 78, 5, 1, CAST(N'2017-02-03' AS Date), N'18:00', N'23:00', 7, 400, NULL, NULL, 2, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Carten Neraal', N'carsten.neraal@asker.kommune.no', N'90973434', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (119, 79, 5, 1, CAST(N'2017-12-06' AS Date), N'18:00', N'23:00', 7, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', N'ccw@teleplan.no', NULL, 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (120, 80, 4, 1, CAST(N'2016-12-08' AS Date), N'14:00', N'23:00', 14, 400, NULL, NULL, 11, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', N'ragna-elisabeth.tosterud@fd.no', N'91376238', 5, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (121, 81, 5, 1, CAST(N'2017-02-27' AS Date), N'17:00', N'23:00', 10, 400, NULL, NULL, 6, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', N'anne.pebensen@fd.dep.no', N'41653625', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (123, 83, 7, 1, CAST(N'2017-04-19' AS Date), N'18:00', N'23:00', 0, 400, NULL, NULL, 9, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', N'petteer.krosby@gmail.com', N'97719206', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (125, 85, 6, 1, CAST(N'2017-06-01' AS Date), N'18:00', N'23:00', 15, 400, NULL, NULL, 10, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Anders Veel', N'cinc@online.no', NULL, 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (126, 86, 1, 1, CAST(N'2017-10-06' AS Date), N'18:00', N'23:00', 15, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Thomas', N'julius@online.no', N'91850317', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (127, 87, 7, 1, CAST(N'2017-09-27' AS Date), N'08:00', N'23:00', 10, 400, NULL, NULL, NULL, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', NULL, NULL, 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (128, 88, 1, 1, CAST(N'2017-12-20' AS Date), N'18:00', N'23:00', 14, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Magnus Lunde', N'malunde@fhs.mil.no', NULL, 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (129, 89, 9, 8, CAST(N'2017-10-20' AS Date), N'18:00', N'23:00', 25, 400, NULL, NULL, 19, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'L. tobiassen', N'leder@m314alta.org', N'90142321', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (130, 114, 5, 1, CAST(N'2017-11-02' AS Date), N'18:00', N'23:00', 14, 400, NULL, NULL, 2, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', N'lara.tobiassen@hotmail.com', N'90142321', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (131, 91, 5, 1, CAST(N'2017-12-11' AS Date), N'18:00', N'23:00', 8, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Marianne Rafn Skuse', N'marianne-rafn.skuse@fd.dep.no', N'91105125', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (133, 16, 5, 1, CAST(N'2018-11-30' AS Date), N'18:00', N'23:00', 14, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'S Fjærvoll', N'serge.fjaervoll@gmail.com', NULL, 2, NULL, 0)
GO
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (135, 93, 5, 1, CAST(N'2018-03-16' AS Date), N'18:00', N'23:00', 0, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Kjell Olsen', NULL, NULL, 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (136, 94, 5, 1, CAST(N'2017-12-01' AS Date), N'14:00', N'23:00', 7, 400, NULL, NULL, 3, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Ole Rosengren', N'orosengrren@mil.no', N'9302516', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (137, 95, 7, 1, CAST(N'2017-12-04' AS Date), N'12:00', N'23:00', 7, 400, NULL, NULL, NULL, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'G. Midkandal', N'gmidkandal@mil.no', N'4895685', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (138, 96, 5, 1, CAST(N'2017-12-02' AS Date), N'18:00', N'23:00', 9, 400, NULL, NULL, 4, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Oddmund Enæs', N'oddmund.enaes@paretoam.com', N'91160567', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (139, 97, 4, 1, CAST(N'2018-08-10' AS Date), N'12:00', N'23:00', 15, 400, NULL, NULL, 10, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Hanne Lystad', NULL, N'99492500', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (140, 98, 8, 1, CAST(N'2018-03-08' AS Date), N'17:00', N'23:00', 14, 400, NULL, NULL, 19, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Jan Petter Husebye', N'jan.petter.husebye@gmail.com', N'95061496', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (142, 100, 5, 1, CAST(N'2018-03-13' AS Date), N'18:00', N'23:00', 10, 400, NULL, NULL, 2, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Aleksander Jankov', N'ajankov@mil.no', N'41604742', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (145, 102, 5, 1, CAST(N'2018-05-30' AS Date), N'18:00', N'23:00', 10, 400, NULL, NULL, 10, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Maylen', N'selskap@m314alta.org', N'41407161', 5, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (146, 103, 5, 1, CAST(N'2018-08-18' AS Date), N'18:00', N'23:00', 12, 400, NULL, NULL, 2, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Per Husby', NULL, N'97004510', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (147, 104, 5, 1, CAST(N'2018-05-30' AS Date), N'18:00', N'23:00', 0, 400, NULL, NULL, 10, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', NULL, N'kristin-degnes@sykehuset.innland.no', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (148, 105, 5, 1, CAST(N'2018-06-14' AS Date), N'18:00', N'23:00', 14, 400, NULL, NULL, 10, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', N'oystein@omholt.info', N'97600087', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (149, 114, 4, 1, CAST(N'2018-05-23' AS Date), N'13:00', N'23:00', 6, 400, NULL, NULL, 14, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Morten Huseby', N'm-huse@onlinge.no', N'90786554', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (150, 107, 3, 8, CAST(N'2018-06-09' AS Date), N'16:00', N'23:00', 6, 400, NULL, NULL, 10, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Merete Rosenberg', N'mereterosenberg@gmail.com', N'98408318', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (151, 108, 1, 1, CAST(N'2018-09-11' AS Date), N'18:00', N'23:00', 14, 400, NULL, NULL, 2, NULL, 0, 20, NULL, 0, 300, 0, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Vibeke Alnæs Hoffmann', N'vibeke.alnaes.hoffmann@ifs.mil.no', N'91534156', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (152, 85, 1, 7, CAST(N'2019-02-23' AS Date), N'18:00', N'23:00', 24, 400, N'TBD', N'TBD', 6, N'Ja', 0, 20, NULL, 0, 300, NULL, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Anders Veel', N'membership@online.no', NULL, 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (154, 111, 1, 1, CAST(N'2018-10-24' AS Date), N'18:00', N'23:00', 10, 400, NULL, NULL, NULL, NULL, 0, 20, NULL, 0, 300, NULL, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', NULL, NULL, 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (155, 13, NULL, 1, CAST(N'2018-11-10' AS Date), NULL, NULL, NULL, 400, NULL, NULL, NULL, NULL, 0, 20, NULL, 0, 300, NULL, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Jørn P Johnsen', NULL, N'990 93 152', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (156, 112, NULL, NULL, CAST(N'2018-11-16' AS Date), NULL, NULL, NULL, 400, NULL, NULL, NULL, NULL, 0, 20, NULL, 0, 300, NULL, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'?', NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (157, 113, NULL, NULL, CAST(N'2019-01-11' AS Date), NULL, NULL, NULL, 400, NULL, NULL, NULL, NULL, 0, 20, NULL, 0, 300, NULL, 5000, 0, 5000, 0, 3000, 0, 3000, 0, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'?', NULL, NULL, 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (159, 23, 7, 3, CAST(N'2018-11-14' AS Date), N'13:00', N'15:00', 5, 100, NULL, NULL, 14, NULL, 1, 20, NULL, 0, 50, NULL, 5000, 0, 5000, 0, 3000, 0, 0, 1, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Som kundenavn', N'gerhard@ihlen.net', N'930 67 135', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (162, 5, 7, 1, CAST(N'2019-01-09' AS Date), N'17:00', N'23:00', 8, 0, NULL, NULL, 11, N'Øl og akevitt', 0, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, N'Styreleder', N'gerhard@ihlen.net', N'930 67 135', 2, N'Servering fra ca 18:30.', 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (164, 119, 7, 3, CAST(N'2019-02-07' AS Date), N'14:00', N'16:00', 5, 0, NULL, N'Egen bevertning', NULL, NULL, 1, 20, NULL, 0, 0, NULL, 5000, 0, 5000, 0, 3000, 0, 0, 1, 0, 5000, 0, 250, NULL, NULL, NULL, NULL, N'Gerhard Ihlen', N'gerhard@ihlen.net', N'93067135', 2, NULL, 0)
INSERT [dbo].[Arrangement] ([ArrID], [KundeID], [ArrTypeID], [ArrStedID], [ArrDato], [AnkKl], [SluttKl], [ArrAntall], [KuvertPris], [Aperitif], [Meny], [MatID], [Drikke], [Kaffe], [KaffePris], [AnnenServ], [Orientering], [Bidrag], [GjestAntall], [LeieBåtdekk], [Båtdekk], [LeieMesseMann], [MannMesse], [LeieMesseFor], [ForMesse], [LeieMesseAkt], [AktMesse], [SeilasTimer], [SeilasPris], [OvernattAnt], [OvernattPris], [AnsvNavn], [AnsvTelf], [ArrAnsvID], [ArrAssID], [KundeKontakt], [KundeEpost], [KundeTlf], [BekrID], [Merknader], [Oppgjort]) VALUES (165, 85, 1, 1, CAST(N'2020-02-21' AS Date), N'18:00', N'23:00', 14, 400, NULL, N'Skipskost', 2, N'Øl, akevitt, konjakk, portvin', 1, 20, NULL, 0, 0, NULL, 5000, 0, 5000, 1, 3000, 0, 2000, 0, 0, 5000, 0, 250, N'Lars Tobiassen', N'901 42 321', 31, 22, N'Anders Veel', N'vsf@online.no', N'908 56 099', 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[Arrangement] OFF
SET IDENTITY_INSERT [dbo].[ArrMat] ON 

INSERT [dbo].[ArrMat] ([MatID], [MatKode], [MatBeskrivelse]) VALUES (1, N'Sp', N'Spekemat')
INSERT [dbo].[ArrMat] ([MatID], [MatKode], [MatBeskrivelse]) VALUES (2, N'Sk', N'Skipskost')
INSERT [dbo].[ArrMat] ([MatID], [MatKode], [MatBeskrivelse]) VALUES (3, N'Lu', N'Lutefisk')
INSERT [dbo].[ArrMat] ([MatID], [MatKode], [MatBeskrivelse]) VALUES (4, N'Pi', N'Pinnekjøtt')
INSERT [dbo].[ArrMat] ([MatID], [MatKode], [MatBeskrivelse]) VALUES (5, N'He', N'Hellefisk/kveite')
INSERT [dbo].[ArrMat] ([MatID], [MatKode], [MatBeskrivelse]) VALUES (6, N'To', N'Torsk')
INSERT [dbo].[ArrMat] ([MatID], [MatKode], [MatBeskrivelse]) VALUES (7, N'La', N'Laks')
INSERT [dbo].[ArrMat] ([MatID], [MatKode], [MatBeskrivelse]) VALUES (8, N'Ør', N'Ørret')
INSERT [dbo].[ArrMat] ([MatID], [MatKode], [MatBeskrivelse]) VALUES (9, N'Ss', N'Stormsuppe')
INSERT [dbo].[ArrMat] ([MatID], [MatKode], [MatBeskrivelse]) VALUES (10, N'Re', N'Reker m/tilbehør')
INSERT [dbo].[ArrMat] ([MatID], [MatKode], [MatBeskrivelse]) VALUES (11, N'Ju', N'Juletallerken')
INSERT [dbo].[ArrMat] ([MatID], [MatKode], [MatBeskrivelse]) VALUES (12, N'Ba', N'Baccalao')
INSERT [dbo].[ArrMat] ([MatID], [MatKode], [MatBeskrivelse]) VALUES (13, N'Fd', N'Flesk og duppe')
INSERT [dbo].[ArrMat] ([MatID], [MatKode], [MatBeskrivelse]) VALUES (14, N'Sm', N'Smørbrød')
INSERT [dbo].[ArrMat] ([MatID], [MatKode], [MatBeskrivelse]) VALUES (15, N'Gr', N'Grillmat')
INSERT [dbo].[ArrMat] ([MatID], [MatKode], [MatBeskrivelse]) VALUES (16, N'Ta', N'Tapas')
INSERT [dbo].[ArrMat] ([MatID], [MatKode], [MatBeskrivelse]) VALUES (17, N'Fs', N'Fiskesuppe')
INSERT [dbo].[ArrMat] ([MatID], [MatKode], [MatBeskrivelse]) VALUES (18, N'Bg', N'Baguetter')
INSERT [dbo].[ArrMat] ([MatID], [MatKode], [MatBeskrivelse]) VALUES (19, N'Pø', N'Pølser og lompe')
SET IDENTITY_INSERT [dbo].[ArrMat] OFF
SET IDENTITY_INSERT [dbo].[ArrPers] ON 

INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (1, N'NN', N'Ikke utnevnt', 0)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (2, N'SOM', N'Svein O Mogan', 1)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (3, N'SAK', N'Svein Arild Karlsen', 0)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (4, N'RM', N'Roger Monsen', 1)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (5, N'PIJ', N'Per Ivar Josefsson', 0)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (6, N'EK', N'Einar Kvarving', 0)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (7, N'KA', N'Knut Arnesen', 1)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (8, N'FF', N'Fredrik Fon', 1)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (9, N'SE', N'Sven E Ellefsen', 0)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (10, N'HBS', N'Hans Borti Salvesen', 1)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (11, N'SRB', N'Sidsel R Børmark', 1)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (12, N'BB', N'Brit Bjerkaas', 0)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (13, N'AP', N'Arvid Paulsen', 1)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (14, N'OKL', N'Ole Kr. Langseth', 0)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (15, N'CH', N'Claus Hansen', 1)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (16, N'IL', N'Ingerid Liodden', 1)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (17, N'EM', N'Else Marit Thoresen', 0)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (18, N'SM', N'Sheila Myhre', 1)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (19, N'PG', N'Pål Gløersen', 1)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (20, N'PK', N'Petter Krosby', 0)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (21, N'FMJ', N'Frank M Johannessen', 0)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (22, N'LAT', N'Lars A Tobiassen', 0)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (23, N'HHB', N'Henning H Bull', 0)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (24, N'ABN', N'Anne B Nielsen', 1)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (25, N'KOT', N'Kjell Olav Thune', 0)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (26, N'MBS', N'Maarten B Sangvig', 1)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (27, N'JH', N'Jacob Holden', 0)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (28, N'MP', N'Marino Pedersen', 0)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (29, N'''-', N'Ikke utnevnt', 0)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (30, N'CN', N'Carsten Neraal', 0)
INSERT [dbo].[ArrPers] ([PersID], [Person], [PersonNavn], [Sluttet]) VALUES (31, N'CAT', N'Catering firma', 0)
SET IDENTITY_INSERT [dbo].[ArrPers] OFF
SET IDENTITY_INSERT [dbo].[ArrStatus] ON 

INSERT [dbo].[ArrStatus] ([BekrID], [BekrShort], [Bekreftelse], [Arrangering]) VALUES (1, N'U', N'Ubekreftet', 0)
INSERT [dbo].[ArrStatus] ([BekrID], [BekrShort], [Bekreftelse], [Arrangering]) VALUES (2, N'B', N'Bestilt', 0)
INSERT [dbo].[ArrStatus] ([BekrID], [BekrShort], [Bekreftelse], [Arrangering]) VALUES (3, N'G', N'Gjennomført', 1)
INSERT [dbo].[ArrStatus] ([BekrID], [BekrShort], [Bekreftelse], [Arrangering]) VALUES (4, N'F', N'Fakturert', 0)
INSERT [dbo].[ArrStatus] ([BekrID], [BekrShort], [Bekreftelse], [Arrangering]) VALUES (5, N'X', N'Avbestilt', 0)
SET IDENTITY_INSERT [dbo].[ArrStatus] OFF
SET IDENTITY_INSERT [dbo].[ArrSted] ON 

INSERT [dbo].[ArrSted] ([ArrStedID], [Sted]) VALUES (1, N'Mannskapsmesse')
INSERT [dbo].[ArrSted] ([ArrStedID], [Sted]) VALUES (2, N'Båtdekk')
INSERT [dbo].[ArrSted] ([ArrStedID], [Sted]) VALUES (3, N'Aktre messe')
INSERT [dbo].[ArrSted] ([ArrStedID], [Sted]) VALUES (4, N'Forre messe')
INSERT [dbo].[ArrSted] ([ArrStedID], [Sted]) VALUES (5, N'Mannskaps- og aktre messe')
INSERT [dbo].[ArrSted] ([ArrStedID], [Sted]) VALUES (6, N'Mannskaps- og forre messe')
INSERT [dbo].[ArrSted] ([ArrStedID], [Sted]) VALUES (7, N'Alle messer')
INSERT [dbo].[ArrSted] ([ArrStedID], [Sted]) VALUES (8, N'Hele fartøyet')
SET IDENTITY_INSERT [dbo].[ArrSted] OFF
SET IDENTITY_INSERT [dbo].[ArrTyper] ON 

INSERT [dbo].[ArrTyper] ([ArrTypeID], [ArrType], [ArrBeskrivelse], [AltaInternt]) VALUES (1, N'Messeaften', N'Middag', 0)
INSERT [dbo].[ArrTyper] ([ArrTypeID], [ArrType], [ArrBeskrivelse], [AltaInternt]) VALUES (2, N'Ankerdram', N'Øl og dram', 0)
INSERT [dbo].[ArrTyper] ([ArrTypeID], [ArrType], [ArrBeskrivelse], [AltaInternt]) VALUES (3, N'Uspesifisert', N'Frivakt, tilfeldig besøk, dugnad o.l.', 0)
INSERT [dbo].[ArrTyper] ([ArrTypeID], [ArrType], [ArrBeskrivelse], [AltaInternt]) VALUES (4, N'Lunsj', N'Lunsj', 0)
INSERT [dbo].[ArrTyper] ([ArrTypeID], [ArrType], [ArrBeskrivelse], [AltaInternt]) VALUES (5, N'Middag', N'Middag 2-3 retter', 0)
INSERT [dbo].[ArrTyper] ([ArrTypeID], [ArrType], [ArrBeskrivelse], [AltaInternt]) VALUES (6, N'Stående buffet/grilling', N'Servering på båtdekk', 0)
INSERT [dbo].[ArrTyper] ([ArrTypeID], [ArrType], [ArrBeskrivelse], [AltaInternt]) VALUES (7, N'Møte', N'Møte med mat/drikke', 0)
INSERT [dbo].[ArrTyper] ([ArrTypeID], [ArrType], [ArrBeskrivelse], [AltaInternt]) VALUES (8, N'Åpen skip', N'Salg under åpen skip', 0)
INSERT [dbo].[ArrTyper] ([ArrTypeID], [ArrType], [ArrBeskrivelse], [AltaInternt]) VALUES (9, N'Seilas m/servering', N'Seilas med servering underveis', 0)
SET IDENTITY_INSERT [dbo].[ArrTyper] OFF
SET IDENTITY_INSERT [dbo].[ArrVarer] ON 

INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (56, 18, 1, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (57, 18, 2, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (58, 18, 3, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (59, 18, 4, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (60, 18, 5, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (61, 18, 6, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (62, 18, 7, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (63, 18, 8, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (64, 18, 9, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (65, 18, 10, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (66, 18, 11, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (67, 18, 12, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (68, 18, 13, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (69, 18, 14, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (70, 18, 15, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (71, 18, 16, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (72, 18, 17, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (73, 18, 18, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (74, 18, 19, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (75, 18, 20, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (76, 18, 21, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (77, 18, 22, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (78, 18, 23, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (79, 18, 24, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (80, 18, 25, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (81, 18, 26, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (82, 18, 27, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (164, 8, 1, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (165, 8, 2, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (166, 8, 3, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (167, 8, 4, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (168, 8, 5, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (169, 8, 6, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (170, 8, 7, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (171, 8, 8, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (172, 8, 9, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (173, 8, 10, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (174, 8, 11, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (175, 8, 12, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (176, 8, 13, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (177, 8, 14, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (178, 8, 15, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (179, 8, 16, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (180, 8, 17, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (181, 8, 18, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (182, 8, 19, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (183, 8, 20, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (184, 8, 21, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (185, 8, 22, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (186, 8, 23, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (187, 8, 24, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (188, 8, 25, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (189, 8, 26, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (190, 8, 27, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (191, 21, 1, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (192, 21, 2, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (193, 21, 3, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (194, 21, 4, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (195, 21, 5, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (196, 21, 6, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (197, 21, 7, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (198, 21, 8, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (199, 21, 9, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (200, 21, 10, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (201, 21, 11, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (202, 21, 12, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (203, 21, 13, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (204, 21, 14, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (205, 21, 15, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (206, 21, 16, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (207, 21, 17, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (208, 21, 18, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (209, 21, 19, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (210, 21, 20, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (211, 21, 21, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (212, 21, 22, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (213, 21, 23, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (214, 21, 24, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (215, 21, 25, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (216, 21, 26, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (217, 21, 27, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (218, 14, 1, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (219, 14, 2, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (220, 14, 3, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (221, 14, 4, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (222, 14, 5, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (223, 14, 6, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (224, 14, 7, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (225, 14, 8, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (226, 14, 9, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (227, 14, 10, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (228, 14, 11, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (229, 14, 12, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (230, 14, 13, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (231, 14, 14, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (232, 14, 15, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (233, 14, 16, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (234, 14, 17, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (235, 14, 18, 0, 0, 0, NULL)
GO
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (236, 14, 19, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (237, 14, 20, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (238, 14, 21, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (239, 14, 22, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (240, 14, 23, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (241, 14, 24, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (242, 14, 25, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (243, 14, 26, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (244, 14, 27, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (245, 22, 1, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (246, 22, 2, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (247, 22, 3, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (248, 22, 4, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (249, 22, 5, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (250, 22, 6, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (251, 22, 7, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (252, 22, 8, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (253, 22, 9, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (254, 22, 10, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (255, 22, 11, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (256, 22, 12, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (257, 22, 13, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (258, 22, 14, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (259, 22, 15, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (260, 22, 16, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (261, 22, 17, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (262, 22, 18, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (263, 22, 19, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (264, 22, 20, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (265, 22, 21, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (266, 22, 22, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (267, 22, 23, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (268, 22, 24, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (269, 22, 25, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (270, 22, 26, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (271, 22, 27, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (299, 24, 1, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (300, 24, 2, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (301, 24, 3, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (302, 24, 4, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (303, 24, 5, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (304, 24, 6, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (305, 24, 7, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (306, 24, 8, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (307, 24, 9, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (308, 24, 10, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (309, 24, 11, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (310, 24, 12, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (311, 24, 13, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (312, 24, 14, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (313, 24, 15, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (314, 24, 16, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (315, 24, 17, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (316, 24, 18, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (317, 24, 19, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (318, 24, 20, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (319, 24, 21, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (320, 24, 22, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (321, 24, 23, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (322, 24, 24, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (323, 24, 25, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (324, 24, 26, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (325, 24, 27, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (326, 15, 1, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (327, 15, 2, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (328, 15, 3, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (329, 15, 4, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (330, 15, 5, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (331, 15, 6, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (332, 15, 7, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (333, 15, 8, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (334, 15, 9, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (335, 15, 10, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (336, 15, 11, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (337, 15, 12, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (338, 15, 13, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (339, 15, 14, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (340, 15, 15, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (341, 15, 16, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (342, 15, 17, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (343, 15, 18, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (344, 15, 19, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (345, 15, 20, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (346, 15, 21, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (347, 15, 22, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (348, 15, 23, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (349, 15, 24, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (350, 15, 25, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (351, 15, 26, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (352, 15, 27, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (353, 7, 1, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (354, 7, 2, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (355, 7, 3, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (356, 7, 4, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (357, 7, 5, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (358, 7, 6, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (359, 7, 7, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (360, 7, 8, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (361, 7, 9, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (362, 7, 10, 0, 0, 0, NULL)
GO
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (363, 7, 11, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (364, 7, 12, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (365, 7, 13, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (366, 7, 14, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (367, 7, 15, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (368, 7, 16, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (369, 7, 17, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (370, 7, 18, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (371, 7, 19, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (372, 7, 20, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (373, 7, 21, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (374, 7, 22, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (375, 7, 23, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (376, 7, 24, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (377, 7, 25, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (378, 7, 26, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (379, 7, 27, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (434, 25, 1, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (435, 25, 2, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (436, 25, 3, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (437, 25, 4, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (438, 25, 5, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (439, 25, 6, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (440, 25, 7, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (441, 25, 8, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (442, 25, 9, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (443, 25, 10, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (444, 25, 11, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (445, 25, 12, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (446, 25, 13, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (447, 25, 14, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (448, 25, 15, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (449, 25, 16, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (450, 25, 17, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (451, 25, 18, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (452, 25, 19, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (453, 25, 20, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (454, 25, 21, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (455, 25, 22, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (456, 25, 23, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (457, 25, 24, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (458, 25, 25, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (459, 25, 26, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (460, 25, 27, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (461, 26, 1, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (462, 26, 2, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (463, 26, 3, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (464, 26, 4, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (465, 26, 5, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (466, 26, 6, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (467, 26, 7, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (468, 26, 8, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (469, 26, 9, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (470, 26, 10, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (471, 26, 11, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (472, 26, 12, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (473, 26, 13, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (474, 26, 14, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (475, 26, 15, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (476, 26, 16, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (477, 26, 17, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (478, 26, 18, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (479, 26, 19, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (480, 26, 20, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (481, 26, 21, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (482, 26, 22, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (483, 26, 23, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (484, 26, 24, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (485, 26, 25, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (486, 26, 26, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (487, 26, 27, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (488, 27, 1, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (489, 27, 2, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (490, 27, 3, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (491, 27, 4, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (492, 27, 5, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (493, 27, 6, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (494, 27, 7, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (495, 27, 8, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (496, 27, 9, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (497, 27, 10, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (498, 27, 11, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (499, 27, 12, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (500, 27, 13, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (501, 27, 14, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (502, 27, 15, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (503, 27, 16, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (504, 27, 17, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (505, 27, 18, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (506, 27, 19, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (507, 27, 20, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (508, 27, 21, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (509, 27, 22, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (510, 27, 23, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (511, 27, 24, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (512, 27, 25, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (513, 27, 26, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (514, 27, 27, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (515, 28, 1, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (516, 28, 2, 0, 0, 0, NULL)
GO
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (517, 28, 3, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (518, 28, 4, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (519, 28, 5, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (520, 28, 6, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (521, 28, 7, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (522, 28, 8, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (523, 28, 9, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (524, 28, 10, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (525, 28, 11, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (526, 28, 12, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (527, 28, 13, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (528, 28, 14, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (529, 28, 15, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (530, 28, 16, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (531, 28, 17, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (532, 28, 18, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (533, 28, 19, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (534, 28, 20, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (535, 28, 21, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (536, 28, 22, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (537, 28, 23, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (538, 28, 24, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (539, 28, 25, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (540, 28, 26, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (541, 28, 27, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (542, 29, 1, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (543, 29, 2, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (544, 29, 3, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (545, 29, 4, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (546, 29, 5, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (547, 29, 6, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (548, 29, 7, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (549, 29, 8, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (550, 29, 9, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (551, 29, 10, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (552, 29, 11, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (553, 29, 12, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (554, 29, 13, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (555, 29, 14, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (556, 29, 15, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (557, 29, 16, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (558, 29, 17, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (559, 29, 18, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (560, 29, 19, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (561, 29, 20, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (562, 29, 21, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (563, 29, 22, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (564, 29, 23, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (565, 29, 24, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (566, 29, 25, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (567, 29, 26, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (568, 29, 27, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (569, 12, 1, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (570, 12, 2, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (571, 12, 3, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (572, 12, 4, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (573, 12, 5, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (574, 12, 6, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (575, 12, 7, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (576, 12, 8, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (577, 12, 9, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (578, 12, 10, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (579, 12, 11, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (580, 12, 12, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (581, 12, 13, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (582, 12, 14, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (583, 12, 15, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (584, 12, 16, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (585, 12, 17, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (586, 12, 18, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (587, 12, 19, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (588, 12, 20, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (589, 12, 21, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (590, 12, 22, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (591, 12, 23, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (592, 12, 24, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (593, 12, 25, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (594, 12, 26, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (595, 12, 27, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (596, 6, 1, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (597, 6, 2, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (598, 6, 3, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (599, 6, 4, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (600, 6, 5, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (601, 6, 6, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (602, 6, 7, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (603, 6, 8, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (604, 6, 9, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (605, 6, 10, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (606, 6, 11, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (607, 6, 12, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (608, 6, 13, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (609, 6, 14, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (610, 6, 15, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (611, 6, 16, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (612, 6, 17, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (613, 6, 18, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (614, 6, 19, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (615, 6, 20, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (616, 6, 21, 0, 0, 0, NULL)
GO
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (617, 6, 22, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (618, 6, 23, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (619, 6, 24, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (620, 6, 25, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (621, 6, 26, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (622, 6, 27, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (623, 30, 1, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (624, 30, 2, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (625, 30, 3, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (626, 30, 4, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (627, 30, 5, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (628, 30, 6, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (629, 30, 7, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (630, 30, 8, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (631, 30, 9, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (632, 30, 10, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (633, 30, 11, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (634, 30, 12, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (635, 30, 13, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (636, 30, 14, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (637, 30, 15, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (638, 30, 16, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (639, 30, 17, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (640, 30, 18, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (641, 30, 19, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (642, 30, 20, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (643, 30, 21, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (644, 30, 22, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (645, 30, 23, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (646, 30, 24, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (647, 30, 25, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (648, 30, 26, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (649, 30, 27, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (650, 31, 1, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (651, 31, 2, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (652, 31, 3, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (653, 31, 4, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (654, 31, 5, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (655, 31, 6, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (656, 31, 7, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (657, 31, 8, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (658, 31, 9, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (659, 31, 10, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (660, 31, 11, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (661, 31, 12, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (662, 31, 13, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (663, 31, 14, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (664, 31, 15, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (665, 31, 16, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (666, 31, 17, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (667, 31, 18, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (668, 31, 19, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (669, 31, 20, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (670, 31, 21, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (671, 31, 22, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (672, 31, 23, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (673, 31, 24, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (674, 31, 25, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (675, 31, 26, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (676, 31, 27, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (677, 32, 1, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (678, 32, 2, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (679, 32, 3, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (680, 32, 4, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (681, 32, 5, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (682, 32, 6, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (683, 32, 7, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (684, 32, 8, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (685, 32, 9, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (686, 32, 10, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (687, 32, 11, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (688, 32, 12, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (689, 32, 13, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (690, 32, 14, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (691, 32, 15, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (692, 32, 16, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (693, 32, 17, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (694, 32, 18, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (695, 32, 19, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (696, 32, 20, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (697, 32, 21, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (698, 32, 22, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (699, 32, 23, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (700, 32, 24, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (701, 32, 25, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (702, 32, 26, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (703, 32, 27, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (731, 20, 1, 0, 48, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (732, 20, 2, 0, 2, 4, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (737, 20, 7, 0, 6, 4, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (758, 33, 1, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (759, 33, 2, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (760, 33, 3, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (761, 33, 4, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (762, 33, 5, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (763, 33, 6, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (764, 33, 7, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (765, 33, 8, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (766, 33, 9, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (767, 33, 10, 0, 0, 0, NULL)
GO
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (768, 33, 11, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (769, 33, 12, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (770, 33, 13, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (771, 33, 14, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (772, 33, 15, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (773, 33, 16, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (774, 33, 17, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (775, 33, 18, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (776, 33, 19, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (777, 33, 20, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (778, 33, 21, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (779, 33, 22, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (780, 33, 23, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (781, 33, 24, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (782, 33, 25, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (783, 33, 26, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (784, 33, 27, 0, 0, 0, NULL)
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (809, 17, 8, 12, 0, 0, N'0')
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (810, 17, 13, 15, 0, 0, N'0')
INSERT [dbo].[ArrVarer] ([ArrVareID], [ArrID], [VareID], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (811, 17, 23, 9, 0, 0, N'0')
SET IDENTITY_INSERT [dbo].[ArrVarer] OFF
SET IDENTITY_INSERT [dbo].[Kunde] ON 

INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (1, N'Intendant/stuert', NULL, NULL, NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (2, N'Besetning', NULL, NULL, NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (3, N'Lloyds Register Consultants', NULL, N'bjorn.inge.bakken@lr.org', NULL, NULL, NULL, 0, 1, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (4, N'Even Kristoffersen', NULL, NULL, NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (5, N'Styret FL M314 Alta', NULL, NULL, NULL, NULL, N'-', 1, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (6, N'Anne Grethe Rushford', NULL, NULL, NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (7, N'Forsvarsdept (FD),  Utvikling & Administrasjon', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (8, N'Sjøforsvarets Info Offisersforening', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (9, N'Arvid Paulsen', NULL, NULL, NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (10, N'Forsvarsstaben (FST), Adjutantstaben', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (11, N'Thomas Næss', NULL, NULL, NULL, NULL, N'Major i Hæren', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (12, N'Knut Midtbø', NULL, NULL, NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (13, N'Forsvarets logistikkorg (FLO), Stab', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (14, N'Stein O Solberg', NULL, NULL, NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (15, N'Lars Tobiassen', NULL, NULL, NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (16, N'KPMG', N'Serge Fjærvoll', N'serge.fjaervoll@gmail.com', NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (17, N'Skipssjef', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (18, N'Carsten Neraal', NULL, N'carsten.neraal@asker.kommune.no', NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (19, N'Odd Fellow, Viken', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (20, N'Svein B Nielsen', NULL, NULL, NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (21, N'Jan Falkenberg', NULL, NULL, NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (22, N'Sven Ellefsen', NULL, NULL, NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (23, N'Gerhard B Ihlen', N'Gerhard B Ihlen', N'gerhard@ihlen.net', N'Hamang Terrasse 77', N'1336 Sandvika', N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (24, N'Teleplan Consulting', NULL, NULL, NULL, NULL, N'-', 0, 1, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (26, N'Jørn Baade KS', NULL, NULL, NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (27, N'Forsvarets høgskole (FHS)', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (29, N'Oslo Nord Rotaryklubb', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (30, N'Tore Pettersen', NULL, NULL, NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (32, N'Lambertseter Ungdomskorps', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (33, N'Oslo Brann- og redningsetat', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (34, N'Forsvarets logistikkorg (FLO), Transport', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (35, N'Forsvarets høyskoleforening', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (36, N'Rune E Andersen', NULL, NULL, NULL, NULL, N'Privat kunde', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (37, N'Forsvarets Musikk', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (38, N'Forsvarsstaben (FST), Stab/adm', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (39, N'De Sjøkyndiges Forbund', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (40, N'H H Horn', NULL, NULL, NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (41, N'Einar Tamber', NULL, NULL, NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (42, N'Forsvarsdept (FD),  IFS', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (43, N'Norges Orlogsforbund', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (44, N'Hvide Sande S&B', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (45, N'Dag A Westermoen Søraa', NULL, NULL, NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (46, N'Kongsberg Defence AS', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (47, N'Forsvarsdept (FD),  IV-avd', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (48, N'Stenslandsfondet', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (49, N'Oslo Fotoklubb', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (50, N'Nesoddens Dampskibsekspeditørers Forening', NULL, NULL, N'Hummerkloen 7', N'0139 Oslo', N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (51, N'Røyken Rotary', NULL, NULL, N'Dagslettvn. 6', N'3430  Spikkestad', N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (58, N'HMK Garde', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (59, N'Oslo Orlogsforening', NULL, NULL, N'Gartnervn. 24', N'3478 Nærsnes', N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (60, N'Kom. Herland', NULL, N'hankh@online.no', NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (62, N'NROF avd. Oslo', NULL, N'arthorva@online.no', NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (63, N'Sandra Tjørn', NULL, N'sandra.tjorn@gmail.com', NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (65, N'Holm Eiendom', NULL, NULL, NULL, NULL, N'-', 0, 1, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (66, N'Teleplan Defence System', NULL, NULL, N'Fornebuvn. 31', N'1324 Lysaker', N'-', 0, 1, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (67, N'Forsvarets Sanitet, Sjø (FSAN/SJØ)', NULL, NULL, NULL, N'5550 Haakonsvern', N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (71, N'Forsvarsmuseet (FM)', NULL, N'saasland@mil.no', NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (72, N'Malin Svellingen', NULL, NULL, N'Bjørneroa 9', N'3472 Bødalen', N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (74, N'Elisabeth Ihlen', NULL, N'elisabeth.ihlen@outlook.com', NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (77, N'Forsvarsdept (FD), ????', NULL, N'britt.solli@fd.dep.no', NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (78, N'Asker Kommune', NULL, N'carsten.neraal@asker.kommune.no', NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (79, N'Teleplan Eiendom', NULL, N'CCW@teleplan.no', NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (80, N'Forsvarsdept (FD),  IV-2', NULL, N'ragna-elisabeth.tosterud@fd.no', NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (81, N'Forsvarsdept (FD),  II', NULL, N'anne.prebensen@fd.dep.no', NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (83, N'Petter Krosby', NULL, N'petter.krosby@gmail.com', NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (84, N'Marino Pedersen', NULL, N'Marino Pedersen', NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (85, N'VSF', N'Anders Veel', N'vsf@online.no', N'Ostadalsveien 79', N'0753 Oslo', N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (86, N'Thomas', NULL, N'julius@online.no', NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (87, N'Høegh LNG', N'Edgar Huseby', N'edgar.huseby@hoeghlng.com', NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (88, N'Forsvarets høgskole (FHS), Masterstud.', NULL, N'malunde@fhs.mil.no', NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (89, N'Medlemmer M314 Alta', NULL, N'regnskap@m314alta.org', NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (91, N'Forsvarsdept (FD),  ???', NULL, N'marianne-rafn.skuse@fd.dep.no', NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (93, N'SHV (Sjøheimevernet)', NULL, NULL, NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (94, N'Forsvarsdept (FD),  ???', N'Ole Rosengren', N'orosengren@mil.no', NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (95, N'Forsvarsdept (FD), ?', N'G. Midkandal', N'gmidkandal@mil.no', NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (96, N'Pareto', N'Oddmund Enæs', N'oddmund.enaes@paretoam.com', NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (97, N'Hanne Lystad', NULL, NULL, NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (98, N'Jan Petter Husebye', NULL, N'jan.petter.husebye@gmail.com', NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (100, N'Forsvarsstaben (FST), ???', NULL, N'ajankov@mil.no', NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (101, N'Dag W. Sørensen', NULL, NULL, NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (102, N'Ukjent', NULL, NULL, NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (103, N'British Gun Club', NULL, NULL, N'Bjørneroa 8', N'3472 Bødalen', N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (104, N'Kristin Degnes', NULL, N'kristin.degnes@sykehuset-innlandet.no', NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (105, N'Øystein Omholt', NULL, N'oystein@omholt', NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (107, N'Merete Rosenberg', NULL, N'mereterosenberg@gmail.com', NULL, NULL, N'-', 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (108, N'Institutt for forsvarsstudier', NULL, N'vibeke.alnaes.hoffmann@ifs.mil.no', NULL, NULL, N'-', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (109, N'Forsvarets Senior forbund', NULL, NULL, N'Pb. 1550, Sentrum', N' 0015 Oslo', N'NB eget ref, nummer', 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (111, N'Morten Huseby', NULL, NULL, NULL, NULL, NULL, 0, 0, 0)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (112, N'Lundin Offshore', NULL, NULL, NULL, NULL, NULL, 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (113, N'Mime Oil', NULL, NULL, NULL, NULL, NULL, 0, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (114, N'Sponsoransvarlig', NULL, NULL, NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (115, N'Daglig leder', NULL, NULL, NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[Kunde] ([KundeID], [KundeNavn], [KundeKontakt], [KundeEpost], [FaktAdrGatePB], [FaktAdrSted], [Kommentarer], [AltaInternt], [Sponsor], [Firma]) VALUES (119, N'Skiforeningen Den Sterke Stav', NULL, N'post@sterkestav.no', N'c/o Gerhard Ihlen, Hamang Terrasse 77', N'1336 Sandvika', N'Forening med SVÆRT små midler', 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Kunde] OFF
SET IDENTITY_INSERT [dbo].[StandardEpost] ON 

INSERT [dbo].[StandardEpost] ([StdID], [HovedOrdre], [CCOrdre], [HovedFaktGrunn], [CCFaktGrunn], [HovedArrListe], [CCArrListe], [HovedVareBeh], [CCVareBeh], [HovedFaktura], [CCFaktura], [FilbaneLager]) VALUES (1, NULL, N'selskap@m314alta.org;leder@m314alta.org;stuert@m314alta.org', N'regnskap@m314alta.org', N'selskap@m314alta.org', N'selskap@m314alta.org;skipssjef@m314alta.org;leder@m314alta.org;nk@m314alta.org', N'regnskap@m314alta.org', N'selskap@m314alta.org', N'regnskap@m314alta.org', NULL, N'selskap@m314alta.org;regnskap@m314alta.org', N'D:\')
SET IDENTITY_INSERT [dbo].[StandardEpost] OFF
SET IDENTITY_INSERT [dbo].[StandardVerdier] ON 

INSERT [dbo].[StandardVerdier] ([StdID], [TimePrisSeil], [StkPrisBidrag], [StkPrisKaffe], [StkPrisKuvert], [stkPrisOvernatt], [LeieBåtdekk], [LeieMesseMann], [LeieMesseFor], [LeieMesseAkt]) VALUES (1, 5000, 0, 20, 400, 250, 5000, 5000, 3000, 2000)
SET IDENTITY_INSERT [dbo].[StandardVerdier] OFF
SET IDENTITY_INSERT [dbo].[VareKorr] ON 

INSERT [dbo].[VareKorr] ([VareKorrID], [VareID], [AntKorrig], [AntInn], [AntTelt], [AntStatusStart], [Bruker], [Merknader], [KorrDato]) VALUES (1, 1, -1, 24, 0, 0, N'Gerhard Ihlen', NULL, CAST(N'2014-09-18' AS Date))
INSERT [dbo].[VareKorr] ([VareKorrID], [VareID], [AntKorrig], [AntInn], [AntTelt], [AntStatusStart], [Bruker], [Merknader], [KorrDato]) VALUES (4, 4, 2, 0, 12, 0, N'Roger Monsen', NULL, CAST(N'2014-09-20' AS Date))
INSERT [dbo].[VareKorr] ([VareKorrID], [VareID], [AntKorrig], [AntInn], [AntTelt], [AntStatusStart], [Bruker], [Merknader], [KorrDato]) VALUES (5, 5, 2, 0, 12, 0, N'Ole Olesen', NULL, CAST(N'2014-10-21' AS Date))
INSERT [dbo].[VareKorr] ([VareKorrID], [VareID], [AntKorrig], [AntInn], [AntTelt], [AntStatusStart], [Bruker], [Merknader], [KorrDato]) VALUES (7, 7, -16, 0, 8, 0, N'Ole Olesen', N'Fytterakkern', CAST(N'2014-10-21' AS Date))
INSERT [dbo].[VareKorr] ([VareKorrID], [VareID], [AntKorrig], [AntInn], [AntTelt], [AntStatusStart], [Bruker], [Merknader], [KorrDato]) VALUES (8, 1, -9, 0, 234, 243, N'gondor', N'0', CAST(N'2014-11-18' AS Date))
INSERT [dbo].[VareKorr] ([VareKorrID], [VareID], [AntKorrig], [AntInn], [AntTelt], [AntStatusStart], [Bruker], [Merknader], [KorrDato]) VALUES (9, 6, 0, 6, 0, 0, N'Gerhard', N'0', CAST(N'2014-11-18' AS Date))
INSERT [dbo].[VareKorr] ([VareKorrID], [VareID], [AntKorrig], [AntInn], [AntTelt], [AntStatusStart], [Bruker], [Merknader], [KorrDato]) VALUES (10, 8, 0, 4, 0, 0, N'Gerhard', N'0', CAST(N'2014-11-18' AS Date))
INSERT [dbo].[VareKorr] ([VareKorrID], [VareID], [AntKorrig], [AntInn], [AntTelt], [AntStatusStart], [Bruker], [Merknader], [KorrDato]) VALUES (11, 13, 0, 5, 0, 0, N'Gerhard', N'0', CAST(N'2014-11-18' AS Date))
INSERT [dbo].[VareKorr] ([VareKorrID], [VareID], [AntKorrig], [AntInn], [AntTelt], [AntStatusStart], [Bruker], [Merknader], [KorrDato]) VALUES (12, 30, 0, 20, 0, 0, N'Roger', N'0', CAST(N'2014-12-11' AS Date))
INSERT [dbo].[VareKorr] ([VareKorrID], [VareID], [AntKorrig], [AntInn], [AntTelt], [AntStatusStart], [Bruker], [Merknader], [KorrDato]) VALUES (13, 23, 0, 6, 0, 4, N'roger', N'', CAST(N'2014-12-12' AS Date))
INSERT [dbo].[VareKorr] ([VareKorrID], [VareID], [AntKorrig], [AntInn], [AntTelt], [AntStatusStart], [Bruker], [Merknader], [KorrDato]) VALUES (14, 23, -3, 0, 7, 10, N'roger', N'', CAST(N'2014-12-12' AS Date))
SET IDENTITY_INSERT [dbo].[VareKorr] OFF
SET IDENTITY_INSERT [dbo].[Varer] ON 

INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (1, N'Ringnes pils', 2, 0.33, N'Flaske', 18.9, 157, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (2, N'White Dog', 2, 0.33, N'Flaske', 0, 88, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (3, N'Heineken', 2, 0.5, N'Boks', 18.9, 114, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (4, N'Vørterøl', 1, 0.33, N'Flaske', 16.5, 14, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (5, N'Munkholm alkofri', 1, 0.33, N'Flaske', 18.9, 28, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (6, N'Cola', 1, 0.33, N'Boks', 18.9, 0, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (7, N'Cola Zero', 1, 0.33, N'Boks', 18.9, 0, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (8, N'Blå Farris', 1, 0.5, N'Flaske', 18.9, 59, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (9, N'Pepsi Max', 1, 0.5, N'Flaske', 18.9, 62, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (10, N'Villa Ch.', 1, 0.5, N'Flaske', 18.9, 38, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (11, N'Solo', 1, 0.5, N'Flaske', 18.9, 15, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (12, N'Tonic Water', 1, 0.5, N'Flaske', 18.9, 89, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (13, N'Club Soda', 1, 0.5, N'Flaske', 18.9, 7, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (14, N'Jacobs Creek Cava', 3, 0.75, N'Flaske', 120, 6, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (15, N'Blue Nun Gold Edition', 3, 0.75, N'Flaske', 120, 4, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (16, N'Rotkappchen', 3, 0.75, N'Flaske', 0, 1, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (17, N'Domaine Horgules', 3, 0.75, N'Flaske', 100, 14, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (18, N'Valpolichella', 3, 0.75, N'Flaske', 115, 9, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (19, N'Sandeman Sherry', 4, 0.75, N'Flaske', 170, 1.5, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (20, N'Bombay Saphire', 5, 0.7, N'Flaske', 360, 2, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (21, N'Bache Gabrielsen XO', 5, 0.7, N'Flaske', 550, 4, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (22, N'Talisker Whiskey', 5, 0.7, N'Flaske', 380, 1, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (23, N'Gammel Opland', 5, 0.7, N'Flaske', 425, 7, CAST(N'2014-12-12' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (24, N'Drambuie', 5, 0.7, N'Flaske', 400, 0.5, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (25, N'St. Halvard', 5, 0.7, N'Flaske', 270, 1, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (26, N'Cointreau', 5, 0.7, N'Flaske', 400, 1, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (27, N'Stolichnaya', 5, 0.7, N'Flaske', 310, 1, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (28, N'Moet & Chandon Champagne', 3, 0.75, N'Flaske', 390, 1, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (29, N'Pepsi', 1, 0.5, N'Flaske', 18.9, 31, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
INSERT [dbo].[Varer] ([VareID], [VareNavn], [VareTypeID], [EnhetVolum], [Emballasje], [PrisInn], [StatusBeholdning], [StatusDato], [AntKorrig], [AntInn], [AntTelt], [Merknader]) VALUES (30, N'Corona', 1, 0.33, N'Flaske', 35.9, 20, CAST(N'2014-12-11' AS Date), 0, 0, 0, N'')
SET IDENTITY_INSERT [dbo].[Varer] OFF
SET IDENTITY_INSERT [dbo].[VarerSalg] ON 

INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (1, 1, 25, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (2, 2, 25, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (3, 3, 25, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (4, 4, 20, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (5, 5, 20, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (6, 6, 20, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (7, 7, 20, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (8, 8, 20, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (9, 9, 20, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (10, 10, 20, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (11, 11, 20, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (12, 12, 20, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (13, 13, 20, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (14, 14, 120, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (15, 15, 120, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (16, 16, 0, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (17, 17, 120, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (18, 18, 115, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (19, 19, 170, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (20, 20, 360, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (21, 21, 550, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (22, 22, 380, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (23, 23, 425, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (24, 24, 40, 17, N'4 cl', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (25, 25, 40, 17, N'4 cl', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (26, 26, 40, 17, N'4 cl', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (27, 27, 40, 17, N'4 cl', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (28, 28, 390, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (29, 29, 20, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (31, 26, 400, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (32, 25, 270, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (33, 27, 310, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (34, 24, 400, 1, N'Hel enhet', 0, 0, 0, N'')
INSERT [dbo].[VarerSalg] ([VareSalgID], [VareID], [PrisUt], [SkjenkeAntall], [Skjenkemål], [AntFakt], [AntBong], [AntKontant], [Merknader]) VALUES (35, 30, 40, 1, N'Hel', 0, 0, 0, N'')
SET IDENTITY_INSERT [dbo].[VarerSalg] OFF
SET IDENTITY_INSERT [dbo].[VareTyper] ON 

INSERT [dbo].[VareTyper] ([VareTypeID], [VareType], [VareBeskrivelse]) VALUES (1, N'M', N'Mineralvann')
INSERT [dbo].[VareTyper] ([VareTypeID], [VareType], [VareBeskrivelse]) VALUES (2, N'Ø', N'Øl')
INSERT [dbo].[VareTyper] ([VareTypeID], [VareType], [VareBeskrivelse]) VALUES (3, N'V', N'Vin')
INSERT [dbo].[VareTyper] ([VareTypeID], [VareType], [VareBeskrivelse]) VALUES (4, N'S', N'Sterkvin')
INSERT [dbo].[VareTyper] ([VareTypeID], [VareType], [VareBeskrivelse]) VALUES (5, N'B', N'Brennevin')
SET IDENTITY_INSERT [dbo].[VareTyper] OFF
/****** Object:  Index [IX_Arrangement]    Script Date: 28.03.2019 16:18:14 ******/
CREATE NONCLUSTERED INDEX [IX_Arrangement] ON [dbo].[Arrangement]
(
	[KundeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Arrangement_1]    Script Date: 28.03.2019 16:18:14 ******/
CREATE NONCLUSTERED INDEX [IX_Arrangement_1] ON [dbo].[Arrangement]
(
	[ArrAnsvID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Arrangement_2]    Script Date: 28.03.2019 16:18:14 ******/
CREATE NONCLUSTERED INDEX [IX_Arrangement_2] ON [dbo].[Arrangement]
(
	[ArrStedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Arrangement_3]    Script Date: 28.03.2019 16:18:14 ******/
CREATE NONCLUSTERED INDEX [IX_Arrangement_3] ON [dbo].[Arrangement]
(
	[ArrTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Arrangement_4]    Script Date: 28.03.2019 16:18:14 ******/
CREATE NONCLUSTERED INDEX [IX_Arrangement_4] ON [dbo].[Arrangement]
(
	[BekrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Arrangement_5]    Script Date: 28.03.2019 16:18:14 ******/
CREATE NONCLUSTERED INDEX [IX_Arrangement_5] ON [dbo].[Arrangement]
(
	[ArrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Arrangement_6]    Script Date: 28.03.2019 16:18:14 ******/
CREATE NONCLUSTERED INDEX [IX_Arrangement_6] ON [dbo].[Arrangement]
(
	[ArrDato] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Arrangement_7]    Script Date: 28.03.2019 16:18:14 ******/
CREATE NONCLUSTERED INDEX [IX_Arrangement_7] ON [dbo].[Arrangement]
(
	[MatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArrVarer]    Script Date: 28.03.2019 16:18:14 ******/
CREATE NONCLUSTERED INDEX [IX_ArrVarer] ON [dbo].[ArrVarer]
(
	[ArrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArrVarer_1]    Script Date: 28.03.2019 16:18:14 ******/
CREATE NONCLUSTERED INDEX [IX_ArrVarer_1] ON [dbo].[ArrVarer]
(
	[VareID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_VareKorr]    Script Date: 28.03.2019 16:18:14 ******/
CREATE NONCLUSTERED INDEX [IX_VareKorr] ON [dbo].[VareKorr]
(
	[VareID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Varer]    Script Date: 28.03.2019 16:18:14 ******/
CREATE NONCLUSTERED INDEX [IX_Varer] ON [dbo].[Varer]
(
	[VareTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Arrangement] ADD  CONSTRAINT [DF_Arrangement_Kaffe]  DEFAULT ((0)) FOR [Kaffe]
GO
ALTER TABLE [dbo].[Arrangement] ADD  CONSTRAINT [DF_Arrangement_Orientering]  DEFAULT ((0)) FOR [Orientering]
GO
ALTER TABLE [dbo].[Arrangement] ADD  CONSTRAINT [DF_Arrangement_Båtdekk]  DEFAULT ((0)) FOR [Båtdekk]
GO
ALTER TABLE [dbo].[Arrangement] ADD  CONSTRAINT [DF_Arrangement_MannMesse]  DEFAULT ((0)) FOR [MannMesse]
GO
ALTER TABLE [dbo].[Arrangement] ADD  CONSTRAINT [DF_Arrangement_ForMesse]  DEFAULT ((0)) FOR [ForMesse]
GO
ALTER TABLE [dbo].[Arrangement] ADD  CONSTRAINT [DF_Arrangement_AktMesse]  DEFAULT ((0)) FOR [AktMesse]
GO
ALTER TABLE [dbo].[Arrangement] ADD  CONSTRAINT [DF_Arrangement_SeilasTimer]  DEFAULT ((0)) FOR [SeilasTimer]
GO
ALTER TABLE [dbo].[Arrangement] ADD  CONSTRAINT [DF_Arrangement_OvernattAnt]  DEFAULT ((0)) FOR [OvernattAnt]
GO
ALTER TABLE [dbo].[Arrangement] ADD  CONSTRAINT [DF_Arrangement_BekrID]  DEFAULT ((1)) FOR [BekrID]
GO
ALTER TABLE [dbo].[Arrangement] ADD  CONSTRAINT [DF_Arrangement_Oppgjort]  DEFAULT ((0)) FOR [Oppgjort]
GO
ALTER TABLE [dbo].[ArrPers] ADD  CONSTRAINT [DF_ArrPers_Sluttet]  DEFAULT ((0)) FOR [Sluttet]
GO
ALTER TABLE [dbo].[ArrStatus] ADD  CONSTRAINT [DF_ArrStatus_Arrangering]  DEFAULT ((0)) FOR [Arrangering]
GO
ALTER TABLE [dbo].[ArrTyper] ADD  CONSTRAINT [DF_ArrTyper_AltaInternt]  DEFAULT ((0)) FOR [AltaInternt]
GO
ALTER TABLE [dbo].[Kunde] ADD  CONSTRAINT [DF_Kunde_AltaInternt]  DEFAULT ((0)) FOR [AltaInternt]
GO
ALTER TABLE [dbo].[Kunde] ADD  CONSTRAINT [DF_Kunde_Sponsor]  DEFAULT ((0)) FOR [Sponsor]
GO
ALTER TABLE [dbo].[Arrangement]  WITH CHECK ADD  CONSTRAINT [FK_Arrangement_ArrMat] FOREIGN KEY([MatID])
REFERENCES [dbo].[ArrMat] ([MatID])
GO
ALTER TABLE [dbo].[Arrangement] CHECK CONSTRAINT [FK_Arrangement_ArrMat]
GO
ALTER TABLE [dbo].[Arrangement]  WITH CHECK ADD  CONSTRAINT [FK_Arrangement_ArrPers] FOREIGN KEY([ArrAnsvID])
REFERENCES [dbo].[ArrPers] ([PersID])
GO
ALTER TABLE [dbo].[Arrangement] CHECK CONSTRAINT [FK_Arrangement_ArrPers]
GO
ALTER TABLE [dbo].[Arrangement]  WITH CHECK ADD  CONSTRAINT [FK_Arrangement_ArrPers1] FOREIGN KEY([ArrAssID])
REFERENCES [dbo].[ArrPers] ([PersID])
GO
ALTER TABLE [dbo].[Arrangement] CHECK CONSTRAINT [FK_Arrangement_ArrPers1]
GO
ALTER TABLE [dbo].[Arrangement]  WITH CHECK ADD  CONSTRAINT [FK_Arrangement_ArrSted] FOREIGN KEY([ArrStedID])
REFERENCES [dbo].[ArrSted] ([ArrStedID])
GO
ALTER TABLE [dbo].[Arrangement] CHECK CONSTRAINT [FK_Arrangement_ArrSted]
GO
ALTER TABLE [dbo].[Arrangement]  WITH CHECK ADD  CONSTRAINT [FK_Arrangement_ArrTyper] FOREIGN KEY([ArrTypeID])
REFERENCES [dbo].[ArrTyper] ([ArrTypeID])
GO
ALTER TABLE [dbo].[Arrangement] CHECK CONSTRAINT [FK_Arrangement_ArrTyper]
GO
ALTER TABLE [dbo].[Arrangement]  WITH CHECK ADD  CONSTRAINT [FK_Arrangement_Kunde] FOREIGN KEY([KundeID])
REFERENCES [dbo].[Kunde] ([KundeID])
GO
ALTER TABLE [dbo].[Arrangement] CHECK CONSTRAINT [FK_Arrangement_Kunde]
GO
ALTER TABLE [dbo].[ArrVarer]  WITH CHECK ADD  CONSTRAINT [FK_ArrVarer_Arrangement] FOREIGN KEY([ArrID])
REFERENCES [dbo].[Arrangement] ([ArrID])
GO
ALTER TABLE [dbo].[ArrVarer] CHECK CONSTRAINT [FK_ArrVarer_Arrangement]
GO
ALTER TABLE [dbo].[ArrVarer]  WITH CHECK ADD  CONSTRAINT [FK_ArrVarer_Varer] FOREIGN KEY([VareID])
REFERENCES [dbo].[Varer] ([VareID])
GO
ALTER TABLE [dbo].[ArrVarer] CHECK CONSTRAINT [FK_ArrVarer_Varer]
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
         Begin Table = "Arrangement"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ArrSted"
            Begin Extent = 
               Top = 111
               Left = 275
               Bottom = 207
               Right = 445
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kunde"
            Begin Extent = 
               Top = 6
               Left = 470
               Bottom = 136
               Right = 656
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ArrTyper"
            Begin Extent = 
               Top = 6
               Left = 694
               Bottom = 136
               Right = 880
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
      Begin ColumnWidths = 10
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
       ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwArrangement'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwArrangement'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwArrangement'
GO
