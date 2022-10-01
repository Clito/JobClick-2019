Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports enviaemail


Partial Class _candidato_outlook
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblidcurriculo.Text = Request.QueryString("id")

        If URLLabel.Text = "" Then
            Dim URL As String = Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.AbsolutePath, "")
            URLLabel.Text = URL
        End If

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        lblidRELduvida_vaga.Text = GridView1.SelectedDataKey("idRELduvida_vaga")
        nomeGestorLabel.Text = GridView1.SelectedDataKey("nomeGestor")
        emailGestorLabel.Text = GridView1.SelectedDataKey("emailGestor")
        dsfuncaoLabel.Text = GridView1.SelectedDataKey("dsfuncao")
        getidvaga(lblidRELduvida_vaga.Text)

    End Sub

    Protected Sub ImageButton6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        lblidRELduvida_vaga.Text = ""
    End Sub

    Protected Sub SqlEntradaSelect_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlEntradaSelect.Deleted
        GridView1.DataBind()
        lblidRELduvida_vaga.Text = ""
    End Sub

    Protected Sub GridView2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.SelectedIndexChanged
        lblidRELduvida_vagaEnviado.Text = GridView2.SelectedValue.ToString
    End Sub

    Protected Sub ImageButton7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        lblidRELduvida_vagaEnviado.Text = ""
    End Sub

    Protected Sub SqlEntradaSelect_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlEntradaSelect.Inserting
        e.Command.Parameters("@respostaRH").Value = Replace(CType(FormView1.FindControl("respostaRHTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@idvaga").Value = lblidvaga.Text
        e.Command.Parameters("@idcurriculo").Value = lblidcurriculo.Text
        e.Command.Parameters("@liberarRH").Value = True
        e.Command.Parameters("@liberarCandidato").Value = False
    End Sub

    Protected Sub SqlEntradaSelect_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlEntradaSelect.Updating
        e.Command.Parameters("@duvida").Value = Replace(CType(FormView1.FindControl("TextBoxRES"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@respostaRH").Value = Replace(CType(FormView1.FindControl("respostaRHTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@liberarRH").Value = False
        e.Command.Parameters("@liberarCandidato").Value = False
    End Sub

    Protected Sub getidvaga(ByVal id)

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        Dim sbody As String = ""

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT idRELduvida_vaga, idvaga, idcurriculo FROM tbRELduvida_vaga WHERE (idRELduvida_vaga = " & id & ")"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        Try

            oReader.Read()
            lblidcurriculo.Text = oReader("idcurriculo")
            lblidvaga.Text = oReader("idvaga")

        Catch ex As Exception

        End Try

        oConnection.Close()

    End Sub

    Protected Sub SqlEntradaSelect_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlEntradaSelect.Updated

        Dim myEmail As New enviaemail
        myEmail.enviarZoya(URLLabel.Text, nomeGestorLabel.Text, emailGestorLabel.Text, "Dúvida de Candidatos", Application("nomeAdmin"), Application("emailAdmin"), Application("sSMTP"), "DuvidaVaga", nomeGestorLabel.Text, dsfuncaoLabel.Text, Session("nome"), "")

        GridView1.DataBind()
        GridView2.DataBind()
        lblidRELduvida_vaga.Text = ""
        DataList1.DataBind()

    End Sub

    Protected Sub respostaRHTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim Linha As String = "_______________________________________________________________" & Chr(10)

        CType(FormView1.FindControl("respostaRHTextBox"), TextBox).Text = Replace(CType(FormView1.FindControl("respostaRHTextBox"), TextBox).Text, "<br>", "")
        CType(FormView1.FindControl("TextBoxRES"), TextBox).Text = Chr(10) & Chr(10) & Chr(10) & Chr(10) & Linha & Chr(10) & Replace(CType(FormView1.FindControl("duvidaTextBox"), TextBox).Text, "<br>", "") & Chr(10) & Chr(10) & Replace(CType(FormView1.FindControl("respostaRHTextBox"), TextBox).Text, "<br>", "")

        CType(FormView1.FindControl("TextBoxRES"), TextBox).Focus()

    End Sub
End Class
