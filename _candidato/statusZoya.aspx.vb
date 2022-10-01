Imports System.Web.UI.WebControls.Label
Imports System.Web.UI.WebControls.DataList
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull


Partial Class _candidato_statusZoya
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub SqlConviteEdit_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs)
        DataList1.DataBind()
    End Sub

    Protected Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound
        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then
            DataList1.ShowHeader = True
        Else
            DataList1.ShowHeader = False
        End If
    End Sub

    Protected Sub SqlConviteEdit_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs)

        Dim oReader As SqlDataReader = Nothing
        Dim oConnection As SqlConnection

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        Dim oCommand As SqlCommand

        Dim prm As SqlParameter

        oCommand = New SqlCommand("uspIncConvidadoZoya", oConnection)
        oCommand.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idZoya", SqlDbType.Int, 8)
        prm.Direction = ParameterDirection.Input
        oCommand.Parameters.Add(prm)

        oCommand.Parameters("@idZoya").Value = Session("idZoya")


        prm = New SqlParameter("@idCadastroUser", SqlDbType.Int, 8)
        prm.Direction = ParameterDirection.Input
        oCommand.Parameters.Add(prm)

        oCommand.Parameters("@idCadastroUser").Value = Session("idCadastroUser")


        prm = New SqlParameter("@idZoyaConvite", SqlDbType.Int, 8)
        prm.Direction = ParameterDirection.Input
        oCommand.Parameters.Add(prm)

        oCommand.Parameters("@idZoyaConvite").Value = e.Command.Parameters("@idZoyaConvite").Value

        oConnection.Open()
        Dim dr As SqlDataReader = oCommand.ExecuteReader
        dr.Close()
        oConnection.Close()

        tbOK.Visible = True
        DataList1.Visible = False

    End Sub

End Class
