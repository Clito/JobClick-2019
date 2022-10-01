Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter

Partial Class _empresa__processo_gestao
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("idProcessoSeletivo") = "" Then
            Response.Redirect("/_empresaJC/")
        Else
            lblidProcessoSeletivo.Text = Request.QueryString("idProcessoSeletivo")
            lblTituloProcesso.Text = "Filtro [" & Request.QueryString("dsProcesso") & "]"
            lblidvaga.Text = Request.QueryString("idvaga")
        End If


        REM ** ************************************************************************************************
        REM ** VERIFICA SE EXSITE REGISTRO EM FILTRO PESSOAL - DEFINE FORM (INSERT/EDIT)
        REM ** ************************************************************************************************


        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        Dim oCommand As SqlCommand

        oSQL = "SELECT idFiltro, idProcessoSeletivo FROM tbFiltro WHERE (idProcessoSeletivo = " & lblidProcessoSeletivo.Text & ")"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        If oReader.HasRows() Then
            oReader.Read()
            FormView2.DefaultMode = FormViewMode.Edit
            lblidFiltro.Text = oReader("idFiltro")
        Else
            FormView2.DefaultMode = FormViewMode.Insert
        End If

        oReader.Close()
        oConnection.Close()



    End Sub

    Protected Sub SqlPessoalForm_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlPessoalForm.Inserting

        e.Command.Parameters("@idProcessoSeletivo").Value = lblidProcessoSeletivo.Text.ToString
        'e.Command.Parameters("@portadorDef").Value = 0
        'e.Command.Parameters("@trabalhando").Value = 0

    End Sub

    Protected Sub InsertCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("main_processo.aspx")
    End Sub

    Protected Sub UpdateCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("main_processo.aspx")
    End Sub

    Protected Sub SqlPessoalForm_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlPessoalForm.Inserted

        REM ** ************************************************************************************************
        REM ** VERIFICA SE EXSITE REGISTRO EM FILTRO PESSOAL - DEFINE FORM (INSERT/EDIT)
        REM ** ************************************************************************************************


        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        Dim oCommand As SqlCommand

        oSQL = "SELECT idFiltro, idProcessoSeletivo FROM tbFiltro WHERE (idProcessoSeletivo = " & lblidProcessoSeletivo.Text & ")"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        If oReader.HasRows() Then
            oReader.Read()
            FormView2.DefaultMode = FormViewMode.Edit
            lblidFiltro.Text = oReader("idFiltro")
        Else
            FormView2.DefaultMode = FormViewMode.Insert
        End If

        oReader.Close()
        oConnection.Close()


    End Sub


    Protected Sub SqlPessoalForm_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlPessoalForm.Updated
        Response.Redirect("processo.aspx?dsProcesso=" & Request.QueryString("dsProcesso") & "&id=" & Request.QueryString("idProcessoSeletivo") & "&idvaga=" & lblidvaga.Text)
    End Sub


    Protected Sub ButtonClose_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("main_processo.aspx")
    End Sub

End Class
