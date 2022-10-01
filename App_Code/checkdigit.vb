Imports Microsoft.VisualBasic

Public Class checkdigit

    Function CALCDIG10(ByVal cadeia As Integer) As Integer

        Dim mult As Integer = (Len(cadeia) Mod 2)
        mult = mult + 1
        Dim total As Integer = 0
        Dim pos As Integer
        Dim res As Integer

        For pos = 1 To Len(cadeia)
            res = Mid(cadeia, pos, 1) * mult
            If res > 9 Then
                res = Int(res / 10) + (res Mod 10)
            End If
            total = total + res
            If mult = 2 Then
                mult = 1
            Else
                mult = 2
            End If
        Next

        total = ((10 - (total Mod 10)) Mod 10)

        CALCDIG10 = total

    End Function

End Class
