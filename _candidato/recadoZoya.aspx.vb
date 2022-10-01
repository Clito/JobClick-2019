Imports System.Web.UI.WebControls.Label
Imports System.Web.UI.WebControls.DataList
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _candidato_recadoZoya
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        msnLabel.Text = "Sua mensagem foi enviada com sucesso!. "
        LabelNULL.Text = "Nenhuma mensagem até o momento..."
    End Sub

    Protected Sub SqlOutlookForm_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs)
        DataList1.DataBind()
        tablemsnOK.Visible = True
    End Sub

    Protected Sub SqlOutlookForm_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs)
        DataList1.DataBind()
    End Sub

    Protected Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound
        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then
            tableNULL.Visible = False
        End If
    End Sub

    Protected Sub SqlOutlookZoyaView_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlOutlookZoyaView.Deleted
        Response.Redirect("recadoZoya.aspx")
    End Sub
End Class
