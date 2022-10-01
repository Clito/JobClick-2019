
Partial Class _parceiroJobClick_parceiroMasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim idCadastroEmpresa As String = Session("idCadastroEmpresa")
        If idCadastroEmpresa = "" Then
            Response.Redirect("/")
        End If
    End Sub

End Class

