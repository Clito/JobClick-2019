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
            Response.Redirect("/_empresa/")
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

        e.Command.Parameters("@idFiltro").Value = lblidFiltro.Text
        e.Command.Parameters("@idProcessoSeletivo").Value = lblidProcessoSeletivo.Text.ToString
        e.Command.Parameters("@disponibilidade").Value = CType(FormView2.FindControl("DropDownListdisponibilidade"), DropDownList).SelectedValue
        e.Command.Parameters("@Intercambio_idTipoIntercambio").Value = CType(FormView2.FindControl("DropDownListIntercambio_idTipoIntercambio"), DropDownList).SelectedValue
        e.Command.Parameters("@AreaAtuacao_idAreaAtuacao").Value = CType(FormView2.FindControl("DropDownListAreaAtuacao_idAreaAtuacao"), DropDownList).SelectedValue

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

    Protected Sub DropDownListAreaAtuacao_idAreaAtuacao_DataBound(sender As Object, e As System.EventArgs)
        'DropDownListAreaAtuacao_idAreaAtuacao
        Try
            Dim myDropDownListAreaAtuacao_idAreaAtuacao As DropDownList = CType(FormView2.FindControl("DropDownListAreaAtuacao_idAreaAtuacao"), DropDownList)
            myDropDownListAreaAtuacao_idAreaAtuacao.Items.Insert(0, New ListItem("-- Selecione --", "0"))
            myDropDownListAreaAtuacao_idAreaAtuacao.SelectedValue = CType(FormView2.FindControl("DropDownListAreaAtuacao_idAreaAtuacao"), DropDownList).Text
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownListdisponibilidade_DataBound(sender As Object, e As System.EventArgs)
        'DropDownListdisponibilidade
        Try
            Dim myDropDownListdisponibilidade As DropDownList = CType(FormView2.FindControl("DropDownListdisponibilidade"), DropDownList)
            myDropDownListdisponibilidade.Items.Insert(0, New ListItem("-- Selecione --", "0"))
            myDropDownListdisponibilidade.SelectedValue = CType(FormView2.FindControl("DropDownListdisponibilidade"), DropDownList).Text
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownListExperienciaInformatica_idTipoConhecimentoRel_DataBound(sender As Object, e As System.EventArgs)
        Try
            Dim myDropDownListExperienciaInformatica_idTipoConhecimentoRel As DropDownList = CType(FormView2.FindControl("DropDownListExperienciaInformatica_idTipoConhecimentoRel"), DropDownList)
            myDropDownListExperienciaInformatica_idTipoConhecimentoRel.Items.Insert(0, New ListItem("-- Selecione --", "0"))
            myDropDownListExperienciaInformatica_idTipoConhecimentoRel.SelectedValue = CType(FormView2.FindControl("DropDownListExperienciaInformatica_idTipoConhecimentoRel"), DropDownList).Text
        Catch ex As Exception

        End Try
    End Sub
End Class
