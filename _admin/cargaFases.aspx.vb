Imports user
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports myValidaCNPJ

Partial Class _admin_cargaFases
    Inherits System.Web.UI.Page

    Protected Sub GridViewEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewEmpresa.SelectedIndexChanged

        idSetupLabel.Text = GridViewEmpresa.SelectedDataKey("idsetup")
        idCadastroEmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("idCadastroEmpresa")
        EmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("empresa")
        GridViewEmpresa.Visible = False
        GridViewFasesCARGA.Visible = True
        LabelEmpresa.Visible = False

    End Sub

    Protected Sub GridViewFasesCARGA_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewFasesCARGA.SelectedIndexChanged
        idTipoFaseProcessoSeletivoLabel.Text = GridViewFasesCARGA.SelectedValue
    End Sub

    Protected Sub LinkButtonRESET_Click(sender As Object, e As System.EventArgs)
        idSetupLabel.Text = ""
        idCadastroEmpresaLabel.Text = ""
        EmpresaLabel.Text = ""
        GridViewEmpresa.Visible = True
        GridViewFasesCARGA.Visible = False
        LabelEmpresa.Visible = True
        idTipoFaseProcessoSeletivoLabel.Text = ""
    End Sub

    Protected Sub SqlFASESFORM_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlFASESFORM.Inserting
        e.Command.Parameters("@idsetup").Value = idSetupLabel.Text
    End Sub

    Protected Sub SqlFASESFORM_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlFASESFORM.Updating
        e.Command.Parameters("@idsetup").Value = idSetupLabel.Text
    End Sub

    Protected Sub SqlFASESFORM_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlFASESFORM.Inserted
        GridViewFasesCARGA.DataBind()
    End Sub

    Protected Sub SqlFASESFORM_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlFASESFORM.Updated
        GridViewFasesCARGA.DataBind()
    End Sub

    Protected Sub SqlFASESFORM_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlFASESFORM.Deleted
        GridViewFasesCARGA.DataBind()
    End Sub
End Class
