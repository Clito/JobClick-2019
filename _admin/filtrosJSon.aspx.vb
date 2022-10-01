
Partial Class _admin_filtrosJSon
    Inherits System.Web.UI.Page

    Protected Sub SqlDataSourceFILTROJSONFORM_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourceFILTROJSONFORM.Updated
        GridViewFiltroJSon.DataBind()
    End Sub

    Protected Sub SqlDataSourceFILTROJSONFORM_Deleted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourceFILTROJSONFORM.Deleted
        GridViewFiltroJSon.DataBind()
    End Sub

    Protected Sub SqlDataSourceFILTROJSONFORM_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourceFILTROJSONFORM.Inserted
        GridViewFiltroJSon.DataBind()
    End Sub
End Class
