'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated from a template.
'
'     Manual changes to this file may cause unexpected behavior in your application.
'     Manual changes to this file will be overwritten if the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Imports System
Imports System.Collections.Generic

Namespace PMSDataAccess

    Partial Public Class XIntervall
        Public Property IntTID As Integer
        Public Property IntType As String
        Public Property IntTypeBeskr As String
    
        Public Overridable Property Jobbs As ICollection(Of Jobb) = New HashSet(Of Jobb)
    
    End Class

End Namespace
