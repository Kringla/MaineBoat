Attribute VB_Name = "Beregninger"
Option Compare Database

Public Sub BeregnNyStatus() 'IKKE I BRUK
'On Error GoTo ErrorHandler

    strUser = InputBox("Angi eget for- og etternavn: ", "Navn på ansvarlig kontrollør", "??")
    If strUser = "??" Or strUser = "" Then
        MsgBox "Et navn må oppgis! Prøv igjen!"
        DoCmd.OpenForm "frmMiddelEndringScr"
        Exit Sub
    End If
    strTitle = "Obs!"    ' Definere tittel.
    strMsg = "Vær oppmerksom på at de verdiene" _
    & Chr(13) & Chr(10) & "som nå er lagt inn ikke kan endres!" _
    & Chr(13) & Chr(10) & "Ønsker du å fortsette?"
    'Definere meldingens innhold
    
    strStyle = vbYesNo + vbInformation    ' Definere knapper
    
    strResponse = MsgBox(strMsg, strStyle, strTitle)
    
    If strResponse = vbYes Then

         
        Set rst = db.OpenRecordset("Select * From MiddelDetalj Where MiddelDetalj.AntInn <> 0", dbOpenDynaset, dbSeeChanges)
        Set rDef = db.OpenRecordset("MiddelKorr", dbOpenDynaset, dbSeeChanges)
        If rst.BOF = False Then
            rst.MoveFirst
            Do Until rst.EOF
                lngMiddelID = rst![MiddelID]
               
                rDef.AddNew
                rDef![MiddelID] = rst![MiddelID]
                rDef![AntInn] = Nz(rst![AntInn], 0)
                rDef![AntStatusStart] = Nz(rst![StatusBeholdning], 0)
                rDef![Merknader] = Nz(rst![Merknader], 0)
                rDef![Bruker] = strUser
                rDef![KorrDato] = Date
                rDef.Update
                
                Set rChk = db.OpenRecordset("Select * From Middel Where Middel.MiddelID = " & "" & lngMiddelID & "" & "", dbOpenDynaset, dbSeeChanges)
                rChk.Edit
                rChk![StatusDato] = Date
                rChk![StatusBeholdning] = Nz(rChk![StatusBeholdning], 0) + rst![AntInn]
                rChk.Update
                rChk.Close
                
                rst.MoveNext
            Loop
        End If
        rst.Close
        rDef.Close
        
        NullUtMiddelVerdier
        
        DoCmd.OpenForm "frmMiddelScr"
    Else
        DoCmd.OpenForm "frmMiddelEndringScr"
    End If
Exit_ErrorHandler:
    Exit Sub
ErrorHandler:
    MsgBox Err.Description
    Resume Exit_ErrorHandler
End Sub
Public Sub BeregnKontroll() 'IKKE I BRUK
'On Error GoTo ErrorHandler

    strUser = InputBox("Angi eget for- og etternavn: ", "Navn på ansvarlig kontrollør", "??")
    If strUser = "??" Or strUser = "" Then
        MsgBox "Et navn må oppgis! Prøv igjen!"
        DoCmd.OpenForm "frmKontrollScr"
        Exit Sub
    End If
    strTitle = "Obs!"    ' Definere tittel.
    strMsg = "Vær oppmerksom på at de verdiene som nå er " _
    & Chr(13) & Chr(10) & "lagt inn etter opptellingen ikke kan endres," _
    & Chr(13) & Chr(10) & "og at status nå blir oppdatert basert på disse!" _
    & Chr(13) & Chr(10) & "Ønsker du å fortsette?"
    'Definere meldingens innhold
    
    strStyle = vbYesNo + vbInformation    ' Definere knapper
    
    strResponse = MsgBox(strMsg, strStyle, strTitle)
    
    If strResponse = vbYes Then

         
        Set rst = db.OpenRecordset("Middel", dbOpenDynaset, dbSeeChanges)
        Set rDef = db.OpenRecordset("MiddelKorr", dbOpenDynaset, dbSeeChanges)
        If rst.BOF = False Then
            rst.MoveFirst
            Do Until rst.EOF
                lngMiddelID = rst![MiddelID]
                If rst![AntKorrig] <> 0 Then
                    rDef.AddNew
                    rDef![MiddelID] = rst![MiddelID]
                    rDef![AntKorrig] = Nz(rst![AntKorrig], 0)
                    rDef![AntTelt] = Nz(rst![AntTelt], 0)
                    rDef![AntStatusStart] = Nz(rst![StatusBeholdning], 0)
                    rDef![Merknader] = Nz(rst![Merknader], 0)
                    rDef![Bruker] = strUser
                    rDef![KorrDato] = Date
                    rDef.Update
                    
                    rst.Edit
                    rst![StatusDato] = Date
                    rst![StatusBeholdning] = Nz(rst![AntTelt], 0)
                    rst.Update
                
                End If
                rst.MoveNext
            Loop
        End If
        rst.Close
        rDef.Close
        
        NullUtMiddelVerdier
        
        DoCmd.OpenForm "frmMiddelScr"
    Else
        DoCmd.OpenForm "frmKontrollScr"
    End If
    
Exit_ErrorHandler:
    Exit Sub
ErrorHandler:
    MsgBox Err.Description
    Resume Exit_ErrorHandler
End Sub
Public Sub SumJobber() 'IKKE I BRUK
'On Error GoTo ErrorHandler
     
    Set rst = db.OpenRecordset("Utstyr", dbOpenDynaset, dbSeeChanges)
    If rst.BOF = False Then
        rst.MoveFirst
        Do Until rst.EOF
            lngKompID = rst![KompID]
            rst.Edit
            rst![AntJobber] = Nz(DCount("[KompID]", "Jobb", "[KompID] = " & "" & lngKompID & "" & " And [Completed] = False"), 0)
            rst![AntJobberUtf] = Nz(DCount("[KompID]", "Jobb", "[KompID] = " & "" & lngKompID & "" & " And [Completed] = True"), 0)
            
            rst.Update
            rst.MoveNext
        Loop
    End If
    rst.Close

   
Exit_ErrorHandler:
    Exit Sub
ErrorHandler:
    MsgBox Err.Description
    Resume Exit_ErrorHandler
End Sub
Public Sub SumOppdatJobb() 'IKKE I BRUK
'On Error GoTo ErrorHandler
    
     
    Set rst = db.OpenRecordset("Select * From Utstyr Where Utstyr.KompID = " & "" & lngID & "" & " ", dbOpenDynaset, dbSeeChanges)
    If rst.BOF = False Then
        
        rst.Edit
        rst![AntJobber] = Nz(DCount("[KompID]", "Jobb", "[KompID] = " & "" & lngID & "" & " And [Completed] = False"), 0)
        rst![AntJobberUtf] = Nz(DCount("[KompID]", "Jobb", "[KompID] = " & "" & lngID & "" & " And [Completed] = True"), 0)

        rst.Update
        
    End If
    rst.Close

   
Exit_ErrorHandler:
    Exit Sub
ErrorHandler:
    MsgBox Err.Description
    Resume Exit_ErrorHandler
End Sub
Public Sub SumUtstyr() 'IKKE I BRUK
'On Error GoTo ErrorHandler
     
    Set rst = db.OpenRecordset("Komponent", dbOpenDynaset, dbSeeChanges)
    If rst.BOF = False Then
        rst.MoveFirst
        Do Until rst.EOF
            lngKompID = rst![KompID]
            rst.Edit
            rst![AntUtstyr] = Nz(DCount("[KompID]", "Utstyr", "[KompID] = " & "" & lngKompID & "" & ""), 0)
            
            rst.Update
            rst.MoveNext
        Loop
    End If
    rst.Close

   
Exit_ErrorHandler:
    Exit Sub
ErrorHandler:
    MsgBox Err.Description
    Resume Exit_ErrorHandler
End Sub

