
Partial Class facebook_Default
    Inherits System.Web.UI.Page
    Dim strJson As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim strSignedRequest As String
        strSignedRequest = Request("signed_request")

        If String.IsNullOrEmpty(strSignedRequest) = False Then
            Dim arrayRequest As Array
            arrayRequest = Split(strSignedRequest, ".")

            Dim strPayload As String
            strPayload = arrayRequest(1)
            strPayload = Replace(strPayload, "-", "+")
            strPayload = Replace(strPayload, "_", "/")

            ' padding, FromBase64String() will barf if the string is the wrong length so we need    to pad it with =
            strPayload = strPayload.PadRight(strPayload.Length + (4 - strPayload.Length Mod 4) Mod 4, "="c)

            Dim bytSignedRequest As Byte()
            bytSignedRequest = Convert.FromBase64String(strPayload)

            Dim strJson As String
            strJson = Encoding.UTF8.GetString(bytSignedRequest)

            'Response.Write("encoded: " & strPayload)
            Response.Write("<script> var app_data = " & strJson & "; window.top.location = 'http://apps.facebook.com/testejobclick/?page=' + app_data['page']['id']; </script>")
        End If

        Dim strPage As String
        strPage = Request("page")

        If String.IsNullOrEmpty(strPage) = False Then
            Response.Redirect("http://alpha.jobclick.com.br/_anonimo/vagas.aspx")
        End If

    End Sub
End Class
