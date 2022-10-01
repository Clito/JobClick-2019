
Partial Class bemvindo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim idCadastroEmpresa As Int32

        If (Request.QueryString("idempresa") <> Nothing) And (Request.QueryString("idempresa") > 0) Then
            idCadastroEmpresa = Request.QueryString("idempresa")
        Else
            idCadastroEmpresa = 1
        End If

        lbl_idCadastroEmpresa.Text = idCadastroEmpresa

    End Sub
End Class
