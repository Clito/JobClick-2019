Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.DBNull
Imports System.Xml

Partial Class pagseguroRes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub GridViewRetorno_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewRetorno.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            dateLabel.Text = Year(DataBinder.Eval(e.Row.DataItem, "date")) & "-" & Month(DataBinder.Eval(e.Row.DataItem, "date")) & "-" & Day(DataBinder.Eval(e.Row.DataItem, "date")) & " 00:00:000"
            code.Text = DataBinder.Eval(e.Row.DataItem, "code")
            reference.Text = DataBinder.Eval(e.Row.DataItem, "reference")
            type.Text = DataBinder.Eval(e.Row.DataItem, "type")
            status.Text = DataBinder.Eval(e.Row.DataItem, "status")
        End If
    End Sub

    Protected Sub GridViewItens_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewItens.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            id.Text = DataBinder.Eval(e.Row.DataItem, "id")
            description.Text = DataBinder.Eval(e.Row.DataItem, "description")
            amount.Text = Replace(DataBinder.Eval(e.Row.DataItem, "amount"), ".", ",")
            creditos.Text = Right(id.Text, 2)
            sms.Text = Left(id.Text, 3)
        End If
    End Sub

    Protected Sub LinkButtonNOTIFICAR_Click(sender As Object, e As EventArgs) Handles LinkButtonNOTIFICAR.Click

        Dim myDs As DataSet = New DataSet()
        myDs.ReadXml("https://ws.pagseguro.uol.com.br/v2/transactions/" & notificationCode.Text & "?email=" & Application("emailAdmin") & "&token=" & Application("token"))

        If myDs.Tables.Count <> 0 Then
            Me.GridViewRetorno.DataSource = myDs.Tables("transaction")
            Me.GridViewRetorno.DataBind()
        End If

        If myDs.Tables.Count <> 0 Then
            Me.GridViewItens.DataSource = myDs.Tables("item")
            Me.GridViewItens.DataBind()
        End If


    End Sub
End Class
