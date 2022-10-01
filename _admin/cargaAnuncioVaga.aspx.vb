Imports ReplaceForm

Partial Class _admin_cargaAnuncioVaga
    Inherits System.Web.UI.Page

    Dim myRaplace As New ReplaceForm

    Protected Sub GridViewEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewEmpresa.SelectedIndexChanged
        idSetupLabel.Text = GridViewEmpresa.SelectedDataKey("idsetup")
        idCadastroEmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("idCadastroEmpresa")
        EmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("empresa")
        GridViewEmpresa.Visible = False
        LabelEmpresa.Visible = False
    End Sub

    Protected Sub GridViewANUNCIO_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewANUNCIO.SelectedIndexChanged
        iddsempresaLabel.Text = GridViewANUNCIO.SelectedDataKey("iddsempresa")
        idCadastroEmpresaANUNCIOLabel.Text = GridViewANUNCIO.SelectedDataKey("idCadastroEmpresa")
        idCadastroEmpresa_FilhaANUNCIOLabel.Text = GridViewANUNCIO.SelectedDataKey("idCadastroEmpresaFilha")
    End Sub

    Protected Sub LinkButtonCancelar_Click(sender As Object, e As System.EventArgs)
        iddsempresaLabel.Text = ""
        idCadastroEmpresaANUNCIOLabel.Text = ""
        idCadastroEmpresa_FilhaANUNCIOLabel.Text = ""
    End Sub

    Protected Sub SqlANUNCIOFORM_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlANUNCIOFORM.Updated
        GridViewANUNCIO.DataBind()
        GridViewRELACIONAMENTO.DataBind()
    End Sub

    Protected Sub SqlANUNCIOFORM_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlANUNCIOFORM.Inserted
        GridViewANUNCIO.DataBind()
        GridViewRELACIONAMENTO.DataBind()
    End Sub

    Protected Sub SqlANUNCIOFORM_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlANUNCIOFORM.Deleted
        GridViewANUNCIO.DataBind()
        GridViewRELACIONAMENTO.DataBind()
    End Sub

    Protected Sub LinkButtonRESET_Click(sender As Object, e As System.EventArgs)
        iddsempresaLabel.Text = ""
        idCadastroEmpresaANUNCIOLabel.Text = ""
        idCadastroEmpresa_FilhaANUNCIOLabel.Text = ""
        idCadastroEmpresaLabel.Text = ""
        GridViewEmpresa.Visible = True
    End Sub

    Protected Sub SqlANUNCIOFORM_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlANUNCIOFORM.Updating
        e.Command.Parameters("@dsempresaVaga").Value = myRaplace.ReplaceIn(CType(FormViewANUNCIO.FindControl("dsempresaVagaTextBox"), TextBox).Text)
        e.Command.Parameters("@msnCandidato").Value = myRaplace.ReplaceIn(CType(FormViewANUNCIO.FindControl("msnCandidatoTextBox"), TextBox).Text)
        e.Command.Parameters("@msnCandidatoFim").Value = myRaplace.ReplaceIn(CType(FormViewANUNCIO.FindControl("msnCandidatoFimTextBox"), TextBox).Text)
    End Sub

    Protected Sub FormViewANUNCIO_DataBound(sender As Object, e As System.EventArgs) Handles FormViewANUNCIO.DataBound
        Try
            CType(FormViewANUNCIO.FindControl("dsempresaVagaTextBox"), TextBox).Text = myRaplace.ReplaceIn(CType(FormViewANUNCIO.FindControl("dsempresaVagaTextBox"), TextBox).Text)
            CType(FormViewANUNCIO.FindControl("msnCandidatoTextBox"), TextBox).Text = myRaplace.ReplaceIn(CType(FormViewANUNCIO.FindControl("msnCandidatoTextBox"), TextBox).Text)
            CType(FormViewANUNCIO.FindControl("msnCandidatoFimTextBox"), TextBox).Text = myRaplace.ReplaceIn(CType(FormViewANUNCIO.FindControl("msnCandidatoFimTextBox"), TextBox).Text)
        Catch ex As Exception

        End Try
    End Sub
End Class
