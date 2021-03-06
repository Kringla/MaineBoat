/****** Object:  Table [dbo].[zRapporter]    Script Date: 26.06.2019 11:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zRapporter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Rapport] [nvarchar](255) NULL,
	[RepNr] [smallint] NULL,
	[TabNr] [smallint] NULL,
	[Seilas] [bit] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [zRapporter$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [zRapporter$ID]    Script Date: 26.06.2019 11:33:11 ******/
CREATE NONCLUSTERED INDEX [zRapporter$ID] ON [dbo].[zRapporter]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[zRapporter] ADD  DEFAULT ((0)) FOR [RepNr]
GO
ALTER TABLE [dbo].[zRapporter] ADD  DEFAULT ((0)) FOR [TabNr]
GO
ALTER TABLE [dbo].[zRapporter] ADD  DEFAULT ((0)) FOR [Seilas]
GO
