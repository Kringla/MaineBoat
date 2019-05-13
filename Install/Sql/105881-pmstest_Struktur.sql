USE [105881-pmstest]
GO

ALTER TABLE [dbo].[Struktur] DROP CONSTRAINT [FK_Struktur_XDetalj]
GO

ALTER TABLE [dbo].[Struktur] DROP CONSTRAINT [DF_Struktur_Lavest]
GO

ALTER TABLE [dbo].[Struktur] DROP CONSTRAINT [DF_Struktur_Benyttes]
GO

ALTER TABLE [dbo].[Struktur] DROP CONSTRAINT [DF_Struktur_AntUtstyr]
GO

ALTER TABLE [dbo].[Struktur] DROP CONSTRAINT [DF_Struktur_Parent]
GO

ALTER TABLE [dbo].[Struktur] DROP CONSTRAINT [DF_Struktur_Trinn]
GO

/****** Object:  Table [dbo].[Struktur]    Script Date: 09.05.2019 10:46:48 ******/
DROP TABLE [dbo].[Struktur]
GO

/****** Object:  Table [dbo].[Struktur]    Script Date: 09.05.2019 10:46:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Struktur](
	[StrID] [int] IDENTITY(1,1) NOT NULL,
	[StrNr] [nvarchar](25) NULL,
	[Trinn] [int] NOT NULL,
	[StrElement] [nvarchar](200) NULL,
	[StrKomponenter] [nvarchar](max) NULL,
	[ParentID] [int] NULL,
	[AntUtstyr] [int] NULL,
	[Merknad] [nvarchar](max) NULL,
	[Benyttes] [bit] NULL,
	[Lavest] [bit] NULL,
	[DetaljID] [int] NULL,
	[StrNrTidl] [nvarchar](255) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Struktur] PRIMARY KEY CLUSTERED 
(
	[StrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Struktur] ADD  CONSTRAINT [DF_Struktur_Trinn]  DEFAULT ((1)) FOR [Trinn]
GO

ALTER TABLE [dbo].[Struktur] ADD  CONSTRAINT [DF_Struktur_Parent]  DEFAULT ((0)) FOR [ParentID]
GO

ALTER TABLE [dbo].[Struktur] ADD  CONSTRAINT [DF_Struktur_AntUtstyr]  DEFAULT ((0)) FOR [AntUtstyr]
GO

ALTER TABLE [dbo].[Struktur] ADD  CONSTRAINT [DF_Struktur_Benyttes]  DEFAULT ((1)) FOR [Benyttes]
GO

ALTER TABLE [dbo].[Struktur] ADD  CONSTRAINT [DF_Struktur_Lavest]  DEFAULT ((1)) FOR [Lavest]
GO

ALTER TABLE [dbo].[Struktur]  WITH CHECK ADD  CONSTRAINT [FK_Struktur_XDetalj] FOREIGN KEY([DetaljID])
REFERENCES [dbo].[XDetalj] ([DetaljID])
GO

ALTER TABLE [dbo].[Struktur] CHECK CONSTRAINT [FK_Struktur_XDetalj]
GO

