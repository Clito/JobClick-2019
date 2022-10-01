
Partial Class _anonimo__gestor_Default
    Inherits System.Web.UI.Page
    Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim SETLayout As String = Session("SETLayout_anonimo")
        If SETLayout <> "" Then
            MasterPageFile = "~/_anonimo/modulo_" & SETLayout & "/master/MasterPageGESTOR.master"
        Else
            MasterPageFile = "~/_anonimo/modulo_jobclick/master/MasterPageGESTOR.master"
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        PanelLEVANTAMENTO.Visible = False

        Dim idRH_Gestor_ANONIMO As String = Session("idRH_Gestor_ANONIMO")
        If idRH_Gestor_ANONIMO <> "" Then
            nomeLabel.Text = Session("nome_ANONIMO")
        Else
            Response.Redirect("/_anonimo/")
        End If

        ProtocoloLabel.Text = Session("jobclickProtocolo")

    End Sub

    Protected Sub GridViewListaVAGA_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewListaVAGA.SelectedIndexChanged
        idPerfilVagaLabel.Text = GridViewListaVAGA.SelectedDataKey("idPerfilVaga")
        PanelLEVANTAMENTO.Visible = True
    End Sub

    Protected Sub LinkButtonFECHAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonFECHAR.Click
        Dim myLink As String
        myLink = ""
        Dim URL As String = Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.AbsolutePath, "")
        myLink = URL & "/_anonimo/default.aspx?jobclickCryp=" & criptografia.Criptografar(Session("SETLayout_anonimo"), "#!$a36?@") & "&jobclickCrypID=" & criptografia.Criptografar(Session("idCadastroEmpresa_ANONIMO"), "#!$a36?@")
        Response.Redirect(myLink)
    End Sub
End Class
