
Partial Class _parceiroJobClick_extrato
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            mes.Text = Now.Month()
            ano.Text = Now.Year()
            DropDownListMES.SelectedValue = Now.Month()
            DropDownListANO.SelectedValue = Now.Year()
        End If

        LabelCabecExtrato.Text = "Movimentação do mês " & MonthName(Month(Now)) & " de " & Year(Now)

    End Sub

    Protected Sub DropDownListMES_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownListMES.SelectedIndexChanged
        mes.Text = DropDownListMES.SelectedValue
        LabelCabecExtrato.Text = "Movimentação em " & MonthName(DropDownListMES.SelectedValue)
    End Sub

    Protected Sub DropDownListANO_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownListANO.SelectedIndexChanged
        ano.Text = DropDownListANO.SelectedValue
        LabelCabecExtrato.Text = "Movimentação referente ao ano " & DropDownListANO.SelectedValue
    End Sub

End Class
