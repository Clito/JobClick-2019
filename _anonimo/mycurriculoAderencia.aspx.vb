Imports System.Web.UI.WebControls.Label
Imports System.Web.UI.WebControls.DataList
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _candidato_mycurriculo
    Inherits System.Web.UI.Page

    Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("idcurriculo") <> "" Then

            REM ** *****************************************************************************
            REM ** RECUPERA AS VARIÁVEIS DA LINHA DE COMANDO
            idPerfilVagaLabel.Text = Request.QueryString("idPerfilVaga")
            idcurriculoLabel.Text = Request.QueryString("idcurriculo")
            REM ** *****************************************************************************

        Else
            Response.Redirect("/")
        End If

    End Sub


    Sub APROVACANDIDATO()

        REM ** ******************************************************************************************************
        REM ** AÇÃO DO CONSULTOR QUANTO A CANDIDATURA (GRAVA HISTÓRICO DAS AÇÕES)
        REM ** ******************************************************************************************************

        NivelAprovacaoLabel.Text = "6"
        Dim URL As String = Replace(Request.UrlReferrer.OriginalString, Request.UrlReferrer.PathAndQuery, "")

        Dim enviaEmail As New email

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_CURRICULO_ADERENCIA_EMAIL_APROVAR]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idcurriculo", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idcurriculo").Value = idcurriculoLabel.Text

        prm = New SqlParameter("@idPerfilVaga", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idPerfilVaga").Value = idPerfilVagaLabel.Text

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                PanelAviso.Visible = True
                AVISOLABEL.Text = dr("MSN")
                AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
                ImageAVISO.ImageUrl = "~/_anonimo/images/buttonOK.png"
            End If
            cn.Close()
        Catch ex As Exception
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Erro ao enviar a mensagem, candidatura não registrada!" & Err.Description
            AVISOLABEL.CssClass = "textoProcessoSeletivoFECHADO"
            ImageAVISO.ImageUrl = "~/_anonimo/images/buttonNOK.png"
        End Try


    End Sub

    Protected Sub ButtonSalvar_Click(sender As Object, e As EventArgs)
        APROVACANDIDATO()
    End Sub
End Class
