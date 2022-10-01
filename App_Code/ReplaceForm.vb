Imports Microsoft.VisualBasic

Public Class ReplaceForm

    Function ReplaceIn(TextToRelace As String) As String

        Dim TextReplaceRes As String = ""

        If InStr(1, TextToRelace, "<br>") > 0 Then
            TextReplaceRes = Replace(TextToRelace, "<br>", Chr(10))
        Else
            TextReplaceRes = Replace(TextToRelace, Chr(10), "<br>")
        End If

        Return TextReplaceRes

    End Function

End Class
