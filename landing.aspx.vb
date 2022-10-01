
Partial Class _parceiro_landing
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Request.QueryString("companykey") <> Nothing Then
            Dim companykey As String = Request.QueryString("companykey")
            Dim decodedBytes As Byte() = Convert.FromBase64String(companykey)
            Dim idEmpresa As String = Encoding.UTF8.GetString(decodedBytes)
            Session("idCadastroEmpresa_Layout") = idEmpresa
        Else
            Session("idCadastroEmpresa_Layout") = 1
        End If
    End Sub
End Class
