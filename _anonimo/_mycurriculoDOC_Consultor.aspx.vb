Imports System.Web.UI.WebControls.Label
Imports System.Web.UI.WebControls.DataList
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull


Partial Class _candidato_mycurriculoDOC
    Inherits System.Web.UI.Page

    Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Private Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound

        Dim mynome As String = ""
        Dim myemail As String = ""

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then
            If DirectCast(e.Item.DataItem, DataRowView).Item("portadorDef") Then
                ImageDef.Visible = True
            End If
        End If

        Dim myFoto As String = ""
        myFoto = DirectCast(e.Item.DataItem, DataRowView).Item("foto").ToString
        If myFoto <> "" Then
            ImageCandidato.ImageUrl = myFoto
        Else
            ImageCandidato.ImageUrl = Application("urlapp") & "/images/cvnoImage.png"
        End If

    End Sub


    Private Sub DataList4_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList4.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label25.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label25.Text.ToString <> "" Then
            DataList4.ShowHeader = True
        Else
            DataList4.ShowHeader = False
        End If

    End Sub


    Private Sub DataList5_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList5.ItemDataBound


        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label31.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo")

            Dim myLabel As Label = DirectCast(e.Item.FindControl("concluidoLabel"), Label)

            If myLabel.Text Then
                myLabel.Text = "Curso conclu?do"
            Else
                myLabel.Text = "Curso n?o conclu?do"
            End If

        End If

        If Label31.Text.ToString <> "" Then
            DataList5.ShowHeader = True
        Else
            DataList5.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList6_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList6.ItemDataBound


        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label41.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label41.Text.ToString <> "" Then
            DataList6.ShowHeader = True
        Else
            DataList6.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList7_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList7.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label42.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label42.Text.ToString <> "" Then
            DataList7.ShowHeader = True
        Else
            DataList7.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList8_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList8.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label43.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label43.Text.ToString <> "" Then
            DataList8.ShowHeader = True
        Else
            DataList8.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList9_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList9.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label44.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label44.Text.ToString <> "" Then
            DataList9.ShowHeader = True
        Else
            DataList9.ShowHeader = False
        End If

    End Sub

End Class
