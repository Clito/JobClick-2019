Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Text.Encoding
Imports System.DBNull

Partial Class _admin_cargaOrigem
    Inherits System.Web.UI.Page

    Protected Sub GridViewORIGEM_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewORIGEM.SelectedIndexChanged
        OrigemLabel.Text = GridViewORIGEM.SelectedValue
    End Sub

    Protected Sub GridViewEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewEmpresa.SelectedIndexChanged
        idCadastroEmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("idCadastroEmpresa")
    End Sub

    Protected Sub LinkButtonCARGA_Click(sender As Object, e As System.EventArgs)
        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_CARGA_ORIGEM]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresaLabel.Text

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        GridViewORIGEM.DataBind()

    End Sub

    Protected Sub SqlORIGEM_FORM_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlORIGEM_FORM.Inserting
        e.Command.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresaLabel.Text
    End Sub

    Protected Sub SqlORIGEM_FORM_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlORIGEM_FORM.Inserted
        GridViewORIGEM.DataBind()
    End Sub

    Protected Sub SqlORIGEM_FORM_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlORIGEM_FORM.Deleted
        GridViewORIGEM.DataBind()
    End Sub

    Protected Sub SqlORIGEM_FORM_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlORIGEM_FORM.Updated
        GridViewORIGEM.DataBind()
    End Sub
End Class
