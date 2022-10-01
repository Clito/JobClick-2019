Imports user
Imports criptografia
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports myValidaCNPJ
Imports email
Imports BodyEmail
Imports ReplaceForm

Partial Class _empresa_perfilVagaAcompanhamento
    Inherits System.Web.UI.Page

    Dim myReplace As New ReplaceForm

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        LabelCabec.Text = Request.QueryString("autoTit")

        Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")

        If idCadastroEmpresaFilha = "" Then
            Response.Redirect("Default.aspx")
        End If
    End Sub

    Protected Sub GridViewListaPerfilVaga_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewListaPerfilVaga.SelectedIndexChanged
        idPublicaPerfilVagaLabel.Text = GridViewListaPerfilVaga.SelectedDataKey("idPublicaPerfilVaga")
        ProtocoloLabel.Text = GridViewListaPerfilVaga.SelectedDataKey("Protocolo")
        FormGestor.Visible = True
    End Sub

    Protected Sub ButtonAprLevantamento_Click(sender As Object, e As System.EventArgs) Handles ButtonAprLevantamento.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spIncPerfilVagaCOMENTARIO_EMPRESA_CONSULTOR", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@Protocolo", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@Protocolo").Value = ProtocoloLabel.Text

        prm = New SqlParameter("@mensagem", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@mensagem").Value = "<b>Consultor: </b>" & myReplace.ReplaceIn(mensagemTextBox.Text)

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()
        Response.Redirect("_atualizaacompanhaLevantamento.aspx?autoTit=Comunica%u00e7%u00e3o+com+o+Gestor (Mensagem enviada)")

    End Sub

    Protected Sub Back_Click(sender As Object, e As System.EventArgs) Handles Back.Click
        Response.Redirect("_atualizaacompanhaLevantamento.aspx?autoTit=Comunica%u00e7%u00e3o+com+o+Gestor+sobre+os+Levantamentos")
    End Sub
End Class
