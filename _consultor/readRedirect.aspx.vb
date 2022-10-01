
Partial Class _consultor_readRedirect
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        REM ** ESTA PÁGINA FOI DESENVOLVIDA PARA AUXILIAR NA ADMINISTRAÇÃO DAS ATIVIDADES DOS CONSULTORES
        Dim URL As String = ""
        Session("idCadastroEmpresaFilha") = Request.QueryString("idCadastroEmpresaFilha")
        Session("idRH_Gestor") = Request.QueryString("idRH_Gestor")
        Session("nome") = Request.QueryString("nome")
        URL = Request.QueryString("Redirect")
        Response.Redirect(URL & "&Cargo=" & Request.QueryString("Cargo") & "&idRH_Gestor=" & Request.QueryString("idRH_Gestor") & "&idProcessoSeletivo=" & Request.QueryString("idProcessoSeletivo") & "&Protocolo=" & Request.QueryString("Protocolo") & "&idVaga=" & Request.QueryString("idVaga"))
    End Sub
End Class
