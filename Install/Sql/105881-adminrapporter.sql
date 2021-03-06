/****** Object:  Table [dbo].[zRapporter]    Script Date: 26.06.2019 11:00:22 ******/
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
/****** Object:  Index [IX_Z1Rapporter]    Script Date: 26.06.2019 11:00:22 ******/
CREATE NONCLUSTERED INDEX [IX_Z1Rapporter] ON [dbo].[zRapporter]
(
	[ApplNr] ASC,
	[RepNr] ASC,
	[TabNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Z1Rapporter_1]    Script Date: 26.06.2019 11:00:22 ******/
CREATE NONCLUSTERED INDEX [IX_Z1Rapporter_1] ON [dbo].[zRapporter]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Z1Rapporter_2]    Script Date: 26.06.2019 11:00:22 ******/
CREATE NONCLUSTERED INDEX [IX_Z1Rapporter_2] ON [dbo].[zRapporter]
(
	[Spesial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [zRapporter$ID]    Script Date: 26.06.2019 11:00:22 ******/
CREATE NONCLUSTERED INDEX [zRapporter$ID] ON [dbo].[zRapporter]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[zRapporter] ADD  CONSTRAINT [DF__zRapporte__RepNr__74D93D45]  DEFAULT ((0)) FOR [RepNr]
GO
ALTER TABLE [dbo].[zRapporter] ADD  CONSTRAINT [DF__zRapporte__TabNr__75CD617E]  DEFAULT ((0)) FOR [TabNr]
GO
ALTER TABLE [dbo].[zRapporter] ADD  CONSTRAINT [DF__zRapporte__Seila__76C185B7]  DEFAULT ((0)) FOR [Spesial]
GO
