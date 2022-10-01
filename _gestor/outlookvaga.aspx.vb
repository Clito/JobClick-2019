Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _gestor_outlookvaga
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        PanelAviso.Visible = False
        PanelPreviewVaga.Visible = False
    End Sub

    Protected Sub GridViewVAGA_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewVAGA.SelectedIndexChanged

        idVagaAnuncioPREVIEWLabel.Text = GridViewVAGA.SelectedDataKey("idVagaAnuncioPREVIEW")
        ProtocoloLabel.Text = GridViewVAGA.SelectedDataKey("Protocolo")
        idCadastroEmpresaLabel.Text = GridViewVAGA.SelectedDataKey("idCadastroEmpresa")
        idVagaAnuncio_PREVIEW_HistoricoLabel.Text = GridViewVAGA.SelectedDataKey("idVagaAnuncio_PREVIEW_Historico")
        idRH_GestorLabel.Text = GridViewVAGA.SelectedDataKey("idRH_Gestor")
        emailResLabel.Text = GridViewVAGA.SelectedDataKey("emailRes")
        nomeResLabel.Text = GridViewVAGA.SelectedDataKey("nomeRes")
        nomeGESTORLabel.Text = GridViewVAGA.SelectedDataKey("nomeGESTOR")
        emailGESTORLabel.Text = GridViewVAGA.SelectedDataKey("emailGESTOR")
        nomeANALISTA_CONSULTORLabel.Text = GridViewVAGA.SelectedDataKey("nomeANALISTA_CONSULTOR")
        emailANALISTA_CONSULTORLabel.Text = GridViewVAGA.SelectedDataKey("emailANALISTA_CONSULTOR")

        FORMMENSAGEM.Visible = True

    End Sub

    Protected Sub LinkButtonFechar_Click(sender As Object, e As System.EventArgs) Handles LinkButtonFechar.Click
        idVagaAnuncioPREVIEWLabel.Text = ""
        FORMMENSAGEM.Visible = False
    End Sub


    Protected Sub LinkButtonANUNCIO_Click(sender As Object, e As System.EventArgs) Handles LinkButtonANUNCIO.Click
        PanelPreviewVaga.Visible = True
    End Sub

    Sub EnviaMENSAGEM()

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_OUTLOOK_GESTOR_VAGA_SALVA_HISTORICO_ENVIA]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idVagaAnuncio_PREVIEW", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idVagaAnuncio_PREVIEW").Value = idVagaAnuncioPREVIEWLabel.Text

        prm = New SqlParameter("@idVagaAnuncio_PREVIEW_Historico", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idVagaAnuncio_PREVIEW_Historico").Value = idVagaAnuncio_PREVIEW_HistoricoLabel.Text

        prm = New SqlParameter("@Protocolo", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@Protocolo").Value = ProtocoloLabel.Text

        prm = New SqlParameter("@SMS", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@SMS").Value = 0

        prm = New SqlParameter("@mensagemHistorico", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@mensagemHistorico").Value = TextBoxMensagem.Text

        prm = New SqlParameter("@nomeGESTOR", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nomeGESTOR").Value = nomeResLabel.Text

        prm = New SqlParameter("@emailGESTOR", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@emailGESTOR").Value = emailResLabel.Text

        prm = New SqlParameter("@nomeCONSULTOR", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nomeCONSULTOR").Value = nomeANALISTA_CONSULTORLabel.Text

        prm = New SqlParameter("@emailCONSULTOR", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@emailCONSULTOR").Value = emailANALISTA_CONSULTORLabel.Text

        prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor").Value = idRH_GestorLabel.Text

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresaLabel.Text

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            cn.Close()

            PanelAviso.Visible = True
            AVISOLABEL.Text = "• E-mail enviado com sucesso.<br>"
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_gestor/images/buttonOK.png"
            DataListOutLookView.DataBind()

        Catch ex As Exception

            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Erro ao enviar seu e-mail.<br>" & Err.Description
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_gestor/images/buttonNOK.png"

        End Try

    End Sub

    Protected Sub LinkButtonEnviar_Click(sender As Object, e As System.EventArgs) Handles LinkButtonEnviar.Click
        EnviaMENSAGEM()
    End Sub

End Class
