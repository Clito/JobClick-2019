Imports Microsoft.VisualBasic

Public Class PrimeiroNome
    Function FirstNome(ByVal sNome As String) As String
        Dim sNom As String
        Dim sNom2 As String
        Dim iPos As Integer

        sNome = Trim(sNome)

        For iNum = 1 To Len(sNome)
            sNom2 = Mid(sNome, iNum, 1)
            If sNom2 = " " Then
                iPos = iNum
                Exit For
            End If
        Next
        sNom = Left(sNome, iPos - 1)
        FirstNome = sNom
    End Function
End Class
