Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports user
Imports myValidaCNPJ

Partial Class _empresa_cadastro
    Inherits System.Web.UI.Page

    Protected Sub IncEmp(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Inserted

        Dim p As New user
        Session("idCadastroEmpresa") = p.idCadastroEmpresa(Session("idUser"))
        msn.CssClass = "msnOK"
        msn.Text = "Os dados de sua empresa foram incluidos com sucesso!"

        Response.Redirect("/_empresaJC/default.aspx")

    End Sub

    Protected Sub UpdEmp(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Updated

        msn.CssClass = "msnOK"
        msn.Text = "Os dados de sua empresa foram atualizados com sucesso!"

        AVISOLABEL.Text = "Os dados de sua empresa foram atualizados com sucesso!"
        AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
        ImageAVISO.ImageUrl = "~/_empresaJC/images/buttonOK.png"
        PanelAviso.Visible = True

    End Sub

    Protected Sub GoBack(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("/_empresaJC/default.aspx")
    End Sub

    Protected Sub ValidaCNPJ_form(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Inserting

        Dim myValida As New myValidaCNPJ
        Dim resPesqCNPJ As Boolean = False

        REM ** ******************************************************************************
        REM ** VERIFICA SE CNPJ JÁ ESTÁ CADASTRADO NO DB
        REM ** ******************************************************************************

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spCNPJ", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@cnpj", SqlDbType.VarChar, 20)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@cnpj").Value = CType(FormViewCADASTRO.FindControl("cnpjTextBox"), TextBox).Text

        Try

            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader

            If dr.HasRows() Then
                msn.Text = "CNPJ já cadastrado!"
                e.Cancel = True
            End If

            dr.Close()

        Catch ex As Exception

        End Try

        cn.Close()

        REM ** ******************************************************************************
        REM ** [FIM] - VERIFICA SE CNPJ JÁ ESTÁ CADASTRADO NO DB
        REM ** ******************************************************************************

        If Not myValida.ValidaCNPJ(CType(FormViewCADASTRO.FindControl("cnpjTextBox"), TextBox).Text) Then
            msn.Text = "Informe CNPJ válido!"
            e.Cancel = True
        End If

    End Sub

    Protected Sub ValidaCNPJ_formUpd(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Updating

        Dim myValida As New myValidaCNPJ
        Dim resPesqCNPJ As Boolean = False

        If Not myValida.ValidaCNPJ(CType(FormViewCADASTRO.FindControl("cnpjTextBox"), TextBox).Text) Then
            msn.Text = "Informe CNPJ válido!"
            e.Cancel = True
        End If

    End Sub

End Class
