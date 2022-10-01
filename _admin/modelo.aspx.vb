
Partial Class _admin_modelo
    Inherits System.Web.UI.Page

    Protected Sub SqlDataSourceFORM_Updating(sender As Object, e As SqlDataSourceCommandEventArgs) Handles SqlDataSourceFORM.Updating
        e.Command.Parameters("@dsVagaModelo").Value = Replace(CType(FormViewMODELO.FindControl("dsVagaModeloTextBox"), TextBox).Text, Chr(10), "<br>")
    End Sub

    Protected Sub dsVagaModeloTextBox_DataBinding(sender As Object, e As EventArgs)
        CType(FormViewMODELO.FindControl("dsVagaModeloTextBox"), TextBox).Text = Replace(CType(FormViewMODELO.FindControl("dsVagaModeloTextBox"), TextBox).Text, "<br>", "")
        CType(FormViewMODELO.FindControl("cntTextBox"), TextBox).Text = "0"
        CType(FormViewMODELO.FindControl("idSetupTextBox"), TextBox).Text = "0"
    End Sub

    Protected Sub SqlDataSourceFORM_Inserting(sender As Object, e As SqlDataSourceCommandEventArgs) Handles SqlDataSourceFORM.Inserting
        e.Command.Parameters("@dsVagaModelo").Value = Replace(CType(FormViewMODELO.FindControl("dsVagaModeloTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@titulo").Value = UCase(CType(FormViewMODELO.FindControl("tituloTextBox"), TextBox).Text)
    End Sub

    Protected Sub SqlDataSourceFORM_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourceFORM.Inserted
        GridViewMODELOLista.DataBind()
    End Sub

    Protected Sub SqlDataSourceFORM_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourceFORM.Updated
        GridViewMODELOLista.DataBind()
    End Sub

    Protected Sub LinkButtonTEXT_Click(sender As Object, e As EventArgs)
        CType(FormViewMODELO.FindControl("dsVagaModeloTextBox"), TextBox).Text = Replace(CType(FormViewMODELO.FindControl("dsVagaModeloTextBox"), TextBox).Text, Chr(13) + Chr(10), " ")
    End Sub
End Class
