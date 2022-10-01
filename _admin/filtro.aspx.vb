Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Text.Encoding
Imports System.DBNull

Partial Class _admin_filtro
    Inherits System.Web.UI.Page

    Protected Sub GridViewEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewEmpresa.SelectedIndexChanged
        idSetupLabel.Text = GridViewEmpresa.SelectedDataKey("idsetup")
        idCadastroEmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("idCadastroEmpresa")
        EmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("empresa")
    End Sub

    Protected Sub LinkButtonCARGA_Click(sender As Object, e As System.EventArgs)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_CARGA_FILTRO_DINAMICO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = idSetupLabel.Text

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        GridViewFiltro.DataBind()

    End Sub

    Protected Sub GridViewFiltro_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewFiltro.SelectedIndexChanged
        idFiltroDinamicoXML_LiberadoLabel.Text = GridViewFiltro.SelectedValue
    End Sub

    Protected Sub SqlFiltroFORM_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlFiltroFORM.Inserting
        e.Command.Parameters("@idSetup").Value = idSetupLabel.Text
    End Sub

    Protected Sub SqlFiltroFORM_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlFiltroFORM.Updated
        GridViewFiltro.DataBind()
    End Sub

    Protected Sub SqlFiltroFORM_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlFiltroFORM.Deleted
        GridViewFiltro.DataBind()
    End Sub

    Protected Sub SqlFiltroFORM_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlFiltroFORM.Inserted
        GridViewFiltro.DataBind()
    End Sub
End Class
