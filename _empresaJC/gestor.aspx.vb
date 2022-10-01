
Partial Class _empresa_gestor
    Inherits System.Web.UI.Page

    Protected Sub SqlDataSource3_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource3.Updated
        If e.AffectedRows > 0 Then
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub SqlDataSource3_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource3.Inserted
        If e.AffectedRows > 0 Then
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub SqlDataSource3_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource3.Deleted
        If e.AffectedRows > 0 Then
            GridView1.DataBind()
        End If
    End Sub

    Protected Sub SqlDataSource6_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource6.Updated
        If e.AffectedRows > 0 Then
            GridView2.DataBind()
        End If
    End Sub

    Protected Sub SqlDataSource6_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource6.Inserted
        If e.AffectedRows > 0 Then
            GridView2.DataBind()
        End If
    End Sub

    Protected Sub SqlDataSource6_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource6.Deleted
        If e.AffectedRows > 0 Then
            GridView1.DataBind()
            GridView2.DataBind()
        End If
    End Sub
End Class
