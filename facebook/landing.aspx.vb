Imports System.Web.HttpUtility

Partial Class facebook_landing
    Inherits System.Web.UI.Page

    Public Function Base64Encode(str As String) As String
        Dim encbuff As Byte() = System.Text.Encoding.UTF8.GetBytes(str)

        Return Convert.ToBase64String(encbuff)
    End Function

    Public Function Encode(str As String) As String

        Return UrlEncode(Base64Encode(str))
    End Function

End Class
