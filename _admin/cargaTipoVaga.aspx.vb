Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Text.Encoding
Imports System.DBNull

Partial Class _admin_cargaTipoVaga
    Inherits System.Web.UI.Page

    Protected Sub GridViewEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewEmpresa.SelectedIndexChanged
        idSetupLabel.Text = GridViewEmpresa.SelectedDataKey("idsetup")
        idCadastroEmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("idCadastroEmpresa")
        EmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("empresa")
        GridViewEmpresa.Visible = False
        PanelCARGARESET.Visible = True
    End Sub

    Protected Sub GridViewTipoVaga_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewTipoVaga.SelectedIndexChanged
        idTipoVagaLabel.Text = GridViewTipoVaga.SelectedDataKey("idTipoVaga")
    End Sub

    Protected Sub LinkButtonRESET_Click(sender As Object, e As System.EventArgs) Handles LinkButtonRESET.Click
        idCadastroEmpresaLabel.Text = ""
        idTipoVagaLabel.Text = ""
        idSetupLabel.Text = ""
        PanelCARGARESET.Visible = False
        GridViewEmpresa.Visible = True
    End Sub

    Protected Sub SqlTIPOVAGAFORM_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlTIPOVAGAFORM.Updating
        e.Command.Parameters("@idSetup").Value = idSetupLabel.Text
    End Sub

    Protected Sub SqlTIPOVAGAFORM_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlTIPOVAGAFORM.Inserting
        e.Command.Parameters("@idSetup").Value = idSetupLabel.Text
    End Sub


    Protected Sub SqlTIPOVAGAFORM_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlTIPOVAGAFORM.Deleted
        GridViewTipoVaga.DataBind()
    End Sub

    Protected Sub SqlTIPOVAGAFORM_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlTIPOVAGAFORM.Inserted
        GridViewTipoVaga.DataBind()
    End Sub

    Protected Sub SqlTIPOVAGAFORM_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlTIPOVAGAFORM.Updated
        GridViewTipoVaga.DataBind()
    End Sub

    Protected Sub LinkButtonCARGATIPO_Click(sender As Object, e As System.EventArgs) Handles LinkButtonCARGATIPO.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_CARGA_TIPOVAGA]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = idSetupLabel.Text

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        GridViewTipoVaga.DataBind()

    End Sub
End Class
