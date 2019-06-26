Attribute VB_Name = "Slettinger"
Option Compare Database

Public Sub SlettUtstyr() 'IKKE I BRUK
'On Error GoTo ErrorHandler

    strTitle = "Obs!"    ' Definere tittel.
    strMsg = "Vær oppmerksom på at du har bedt om å slette et objekt/utstyr!" _
    & Chr(13) & Chr(10) & "Utstyret og alle tilhørende jobber og reservedeler vil bli slettet!" _
    & Chr(13) & Chr(10) & "Slettete elementer kan ikke gjenopprettes!" _
    & Chr(13) & Chr(10) & "Ønsker du å fortsette?"
    'Definere meldingens innhold
    
    strStyle = vbYesNo + vbInformation    ' Definere knapper
    
    strResponse = MsgBox(strMsg, strStyle, strTitle)
    
    If strResponse = vbYes Then

         
        Set rst = db.OpenRecordset("Select * From Sertifikat Where Sertifikat.KompID = " & "" & lngID & "" & "", dbOpenDynaset, dbSeeChanges)
        If rst.BOF = False Then
            rst.MoveFirst
            Do Until rst.EOF
                rst.Delete
                rst.MoveNext
            Loop
        End If
        rst.Close
        
        Set rst = db.OpenRecordset("Select * From UtstyrReserve Where UtstyrReserve.KompID = " & "" & lngID & "" & "", dbOpenDynaset, dbSeeChanges)
        If rst.BOF = False Then
            rst.MoveFirst
            Do Until rst.EOF
                rst.Delete
                rst.MoveNext
            Loop
        End If
        rst.Close
        
        Set rst = db.OpenRecordset("Select * From UtstyrPlassering Where UtstyrPlassering.KompID = " & "" & lngID & "" & "", dbOpenDynaset, dbSeeChanges)
        If rst.BOF = False Then
            rst.MoveFirst
            Do Until rst.EOF
                rst.Delete
                rst.MoveNext
            Loop
        End If
        rst.Close
        
        Set rst = db.OpenRecordset("Select * From Jobb Where Jobb.KompID = " & "" & lngID & "" & "", dbOpenDynaset, dbSeeChanges)
        If rst.BOF = False Then
            rst.MoveFirst
            Do Until rst.EOF
                lngJobbID = rst![JobbID]
                
                Set rDef = db.OpenRecordset("Select * From JobbDok Where JobbDok.JobbID = " & "" & lngJobbID & "" & "", dbOpenDynaset, dbSeeChanges)
                If rDef.BOF = False Then
                    rDef.MoveFirst
                    Do Until rDef.EOF
                        rDef.Delete
                        rDef.MoveNext
                    Loop
                End If
                rDef.Close
               
                Set rDef = db.OpenRecordset("Select * From JobbDok Where JobbDok.JobbID = " & "" & lngJobbID & "" & "", dbOpenDynaset, dbSeeChanges)
                If rDef.BOF = False Then
                    rDef.MoveFirst
                    Do Until rDef.EOF
                        rDef.Delete
                        rDef.MoveNext
                    Loop
                End If
                rDef.Close
                
                
                Set rDef = db.OpenRecordset("Select * From JobbDato Where JobbDato.JobbID = " & "" & lngJobbID & "" & "", dbOpenDynaset, dbSeeChanges)
                If rDef.BOF = False Then
                    rDef.MoveFirst
                    Do Until rDef.EOF
                        rDef.Delete
                        rDef.MoveNext
                    Loop
                End If
                rDef.Close
                
                Set rDef = db.OpenRecordset("Select * From JobbNorm Where JobbNorm.JobbID = " & "" & lngJobbID & "" & "", dbOpenDynaset, dbSeeChanges)
                If rDef.BOF = False Then
                    rDef.MoveFirst
                    Do Until rDef.EOF
                        rDef.Delete
                        rDef.MoveNext
                    Loop
                End If
                rDef.Close
                
                Set rDef = db.OpenRecordset("Select * From ArbeidsListe Where ArbeidsListe.JobbID = " & "" & lngJobbID & "" & "", dbOpenDynaset, dbSeeChanges)
                If rDef.BOF = False Then
                    rDef.MoveFirst
                    Do Until rDef.EOF
                        rDef.Delete
                        rDef.MoveNext
                    Loop
                End If
                rDef.Close
                
                
                rst.Delete
                rst.MoveNext
            Loop
        End If
        rst.Close
    
        Set rst = db.OpenRecordset("Select * From Utstyr Where Utstyr.KompID = " & "" & lngID & "" & "", dbOpenDynaset, dbSeeChanges)
        If rst.BOF = False Then
            rst.Delete
        End If
        rst.Close
    End If
        
Exit_ErrorHandler:
    Exit Sub
ErrorHandler:
    MsgBox Err.Description
    Resume Exit_ErrorHandler
End Sub
