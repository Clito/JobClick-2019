Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _empresa__vaga_outlook
    Inherits System.Web.UI.Page

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        lblidRELduvida_vaga.Text = GridView1.SelectedValue.ToString
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
        e.Command.Parameters("@respostaRH").Value = Replace(CType(FormView1.FindControl("respostaRHTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@liberarRH").Value = True
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
        GridView1.DataBind()
        GridView2.DataBind()
        lblidRELduvida_vaga.Text = ""
        DataList1.DataBind()
    End Sub

    Protected Sub respostaRHTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("respostaRHTextBox"), TextBox).Text = ""
        CType(FormView1.FindControl("respostaRHTextBox"), TextBox).Focus()
    End Sub

End Class
