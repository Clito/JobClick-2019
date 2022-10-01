
Partial Class _admin_extrato
    Inherits System.Web.UI.Page

    Protected Sub GridViewEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewEmpresa.SelectedIndexChanged
        idSetupLabel.Text = GridViewEmpresa.SelectedDataKey("idsetup")
        idCadastroEmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("idCadastroEmpresa")
        EmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("empresa")
        GridViewEmpresa.Visible = False
        PanelEXTRATO.Visible = True
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Dim Cont As Int32 = 2010
            Dim YearRef As Int32 = Year(Now()) + 5

            While Cont < YearRef
                DropDownListANO.Items.Add(New ListItem(Cont, Cont))
                Cont = Cont + 1
            End While

            DropDownListANO.SelectedValue = Year(Now())
            DropDownListMES.SelectedValue = Month(Now())

        End If

    End Sub


    Protected Sub LinkButtonEXTRATO_Click(sender As Object, e As EventArgs) Handles LinkButtonEXTRATO.Click

        ano.Text = DropDownListANO.SelectedValue
        mes.Text = DropDownListMES.SelectedValue

        SqlExtrato.DataBind()

    End Sub
End Class
