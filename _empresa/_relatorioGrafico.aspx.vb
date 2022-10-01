
Partial Class _empresa_relatorioGrafico
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        LabelCabec.Text = Request.QueryString("autoTit")
        Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")

        If idCadastroEmpresaFilha = "" Then
            Response.Redirect("Default.aspx")
        End If


        If idCadastroEmpresaFilha <> "" Then
            idCadastroEmpresaFilhaLabel.Text = Session("idCadastroEmpresaFilha")
        End If

        If Request.QueryString("Protocolo") <> "" Then
            ProtocoloLabel.Text = Request.QueryString("Protocolo")
            If Not IsPostBack Then
                PanelChart.Visible = True
            End If
        End If

    End Sub

    Protected Sub DropDownListSelectEmpresa_DataBound(sender As Object, e As System.EventArgs) Handles DropDownListSelectEmpresa.DataBound
        Try
            Dim myDropDownListSelectEmpresa As DropDownList = DropDownListSelectEmpresa
            myDropDownListSelectEmpresa.Items.Insert(0, New ListItem("-- Selecione uma Empresa --", "0"))
            myDropDownListSelectEmpresa.SelectedValue = Session("idCadastroEmpresaFilha")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownListSelectEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownListSelectEmpresa.SelectedIndexChanged
        idCadastroEmpresaFilhaLabel.Text = DropDownListSelectEmpresa.SelectedValue
        Session("idCadastroEmpresaFilha") = idCadastroEmpresaFilhaLabel.Text
        GridViewVAGA.DataBind()
    End Sub

    Protected Sub GridViewVAGA_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewVAGA.SelectedIndexChanged
        idProcessoSeletivoLabel.Text = GridViewVAGA.SelectedDataKey("idProcessoSeletivo")
        idRH_GestorLabel.Text = GridViewVAGA.SelectedDataKey("idRH_Gestor")
        LineChartPS.Visible = True
    End Sub

    Protected Sub ImageButtonClose_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonClose.Click
        PanelChart.Visible = False
        ProtocoloLabel.Text = ""
    End Sub


    Protected Sub RadioButtonListConsultor_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles RadioButtonListConsultor.SelectedIndexChanged
        idRH_GestorLabel.Text = RadioButtonListConsultor.SelectedValue
    End Sub

End Class
