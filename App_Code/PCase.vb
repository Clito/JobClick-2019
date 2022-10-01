Imports Microsoft.VisualBasic

Public Class PCase

    Function PCase(ByVal strInput As String) As String
        Dim I As Integer
        Dim CurrentChar, PrevChar As Char
        Dim strOutput As String

        PrevChar = ""
        strOutput = ""

        For I = 1 To Len(strInput)
            CurrentChar = Mid(strInput, I, 1)

            Select Case PrevChar
                Case "", " ", ".", "-", ",", """", "'"
                    strOutput = strOutput & UCase(CurrentChar)
                Case Else
                    strOutput = strOutput & LCase(CurrentChar)
            End Select

            PrevChar = CurrentChar
        Next I

        Return strOutput

    End Function

End Class
