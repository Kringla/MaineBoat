/****** Object:  StoredProcedure [dbo].[usp_ArrDeltagelse]    Script Date: 02.04.2019 07:38:01 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_ArrGjesterScr]    Script Date: 02.04.2019 07:38:01 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_AvmeldingerScr]    Script Date: 02.04.2019 07:38:01 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Besetning]    Script Date: 02.04.2019 07:38:01 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_BesetningBunks]    Script Date: 02.04.2019 07:38:01 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_BunkTildeling]    Script Date: 02.04.2019 07:38:01 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_BunkTildelingScr]    Script Date: 02.04.2019 07:38:01 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_BunkTildelingVaktKv]    Script Date: 02.04.2019 07:38:01 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_DagAktivitet_Oppdater]    Script Date: 02.04.2019 07:38:01 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Deltagelse]    Script Date: 02.04.2019 07:38:01 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_DeltagelseDugnad]    Script Date: 02.04.2019 07:38:01 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_DeltagelseScr]    Script Date: 02.04.2019 07:38:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_DeltagelseScr] 
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
			Deltagelse.ReiseOpplegg, 
			Deltagelse.Venteliste, 
			Deltagelse.Avmeldt, 
			Deltagelse.Sekvens, 
			Deltagelse.BunkTildelt, 
			Deltagelse.ReiseMerknad, 
			Deltagelse.Kostdag, 
			Deltagelse.Rullekommentar,
			Deltagelse.DeltagMerknad, 
			Deltagelse.Besetning, 
			Deltagelse.IkkeBesetning, 
			Deltagelse.Medfarende, 
			Deltagelse.Parkering, 
			Deltagelse.Overnatt, 
			Deltagelse.Brannvakt,
			Personer.PID AS Personer_PID, 
			Personer.ENavn, 
			Personer.FNavn, 
			Personer.Kalles, 
			[ENavn]+ ', ' + [FNavn] AS Navn, 
			Personer.Born, 
			--Year(Date()-[Born])-1900 AS Alder, 
			Personer.Sikkerhetskurs, 
			Personer.TelfPrivat, 
			Personer.TelfKontor, 
			Personer.TelfMobil, 
			[TelfPrivat] + ', ' + [TelfKontor] + ', ' + [TelfMobil] AS Telefon, 
			Personer.Epost, 
			[TelfMobil] + ', ' + [Epost] AS TeleMail,
			Personer.RegBil,  
			Personer.Aktiv, 
			Personer.Bakgrunn, 
			Personer.AktivOmr, 
			Personer.FagID, 
			Personer.Seilende, 
			Personer.KvalFag, 
			Personer.KvalMerknad, 
			Personer.KvalMangel, 
			Personer.KvalSjef, 
			Personer.KvalNav, 
			Personer.KvalDekk, 
			Personer.KvalMaskin, 
			Personer.KvalMaskinist, 
			Personer.KvalElektriker, 
			Personer.KvalSanitet, 
			Personer.KvalVakt, 
			Personer.KvalForpleining, 
			Personer.KvalKokk, 
			Personer.Kommentar, 
			Personer.NOKOppdat, 
			Personer.NOKNavn, 
			Personer.NOKRelasjon, 
			Personer.NOKAdr, 
			Personer.NOKEpost, 
			Personer.NOKPostSted, 
			Personer.NOKTelf, 
			[NOKRelasjon] + ', ' + [NOKNavn] + ', ' + [NOKAdr] + ', ' + [NOKPostSted] + ', ' + [NOKTelf] + ', ' + [NOKEpost] AS NOK, 
			Personer.KontBetSesong, 
			Personer.Medlemsnummer, 
			Personer.Sertifikater
		FROM Personer RIGHT JOIN Deltagelse ON Personer.PID = Deltagelse.PID
		WHERE Deltagelse.Avmeldt=0 And Deltagelse.ArrID = @ArrID
		ORDER BY Deltagelse.Venteliste DESC, Personer.ENavn, Personer.FNavn;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_RengjPostScr]    Script Date: 02.04.2019 07:38:01 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_RulleScr]    Script Date: 02.04.2019 07:38:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gerhard
-- Create date: 07.08.2018
-- Description:	Generalrulle spesifikk ArrID
-- =============================================
CREATE PROCEDURE [dbo].[usp_RulleScr] 
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
			Deltagelse.ReiseOpplegg, 
			Deltagelse.Venteliste, 
			Deltagelse.DeltagMerknad, 
			Deltagelse.Avmeldt, 
			Deltagelse.RengjPost,
			Deltagelse.SOID AS Deltagelse_SOID, 
			Deltagelse.Bunk, 
			Deltagelse.Vakt2, 
			Deltagelse.Vakt3, 
			Deltagelse.LifeRaft, 
			Deltagelse.Havari, 
			Deltagelse.RFID, 
			Deltagelse.RenID, 
			Deltagelse.RulleKommentar, 
			Deltagelse.IkkeBesetning, 
			Deltagelse.Brannvakt, 
			Personer.PID AS Personer_PID, 
			Personer.ENavn, 
			Personer.FNavn, 
			[ENavn] + ', ' + [FNavn] AS Navn, 
			Personer.Born, 
			--Year(Date()-[Born])-1900 AS Alder, 
			Personer.Sikkerhetskurs,
			Personer.Aktiv, 
			Personer.AktivOmr, 
			Personer.FagID, 
			Personer.KvalFag, 
			Personer.KvalMerknad, 
			Personer.KvalMangel, 
			Personer.Bakgrunn, 
			Personer.Seilende, 
			Personer.KvalNav, 
			Personer.KvalDekk, 
			Personer.KvalMaskinist, 
			Personer.KvalMaskin, 
			Personer.KvalElektriker, 
			Personer.KvalVakt, 
			Personer.KvalSanitet, 
			Personer.KvalForpleining, 
			Personer.KvalKokk, 
			Personer.Kommentar AS Personer_Kommentar, 
			xStillingOmb.StillingOmb, 
			xStillingOmb.SekvNr, 
			xStillingOmb.SOID AS xStillingOmb_SOID
			--IIf([Vakt2]="K","Kongens",IIf([vakt2]="D","Dronningens","Ikke tildelt")) AS 2Vakt
		FROM Personer RIGHT JOIN (xStillingOmb RIGHT JOIN Deltagelse ON xStillingOmb.SOID = Deltagelse.SOID) ON Personer.PID = Deltagelse.PID
		WHERE Deltagelse.Avmeldt = 0 AND Deltagelse.ArrID = @ArrID;


END
GO
