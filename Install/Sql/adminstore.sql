
/****** Object:  StoredProcedure [dbo].[usp_DeltagelseScr]    Script Date: 02.04.2019 08:04:47 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_RulleScr]    Script Date: 02.04.2019 08:04:47 ******/
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
