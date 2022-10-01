
Partial Class _admin_ramoAtividade
    Inherits System.Web.UI.Page

    Protected Sub GridViewRamoAtividade_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewRamoAtividade.SelectedIndexChanged
        idAreaAtuacaoLabel.Text = GridViewRamoAtividade.SelectedValue
    End Sub

    Protected Sub SqlRamoAtividadeFORM_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlRamoAtividadeFORM.Updated
        GridViewRamoAtividade.DataBind()
    End Sub

    Protected Sub SqlRamoAtividadeFORM_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlRamoAtividadeFORM.Inserted
        GridViewRamoAtividade.DataBind()
    End Sub

    Protected Sub SqlRamoAtividadeFORM_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlRamoAtividadeFORM.Deleted
        GridViewRamoAtividade.DataBind()
    End Sub

End Class
