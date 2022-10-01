Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports checkdigit
Imports System.DBNull
Imports ReplaceForm

Partial Class _empresa_cadastraVaga
    Inherits System.Web.UI.Page

    Dim myReplace As New ReplaceForm

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        LabelCabec.Text = Request.QueryString("autoTit")

        Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")

        If idCadastroEmpresaFilha = "" Then
            Response.Redirect("Default.aspx")
        End If
    End Sub

    Protected Sub ImageButtonClosePanel_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonClosePanel.Click
        PanelPSQ.Visible = False
    End Sub

    Protected Sub ImageButtonPSQ_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonPSQ.Click
        FuncaoPesquisaLabel.Text = TextBoxPsq.Text
        PanelPSQ.Visible = False
        PanelPesquisaNOVA.Visible = True
    End Sub

    Protected Sub ImageButtonNovaPesquisa_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonNovaPesquisa.Click
        TextBoxPsq.Text = ""
        PanelPSQ.Visible = True
        PanelPesquisaNOVA.Visible = True
    End Sub

    Protected Sub GridViewPsqCargo_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewPsqCargo.SelectedIndexChanged
        idfuncaoLabel.Text = GridViewPsqCargo.SelectedDataKey("idfuncao")
        dsfuncaoLabel.Text = GridViewPsqCargo.SelectedDataKey("dsfuncao")

        FormViewVaga.Visible = True
        PanelFormVaga.Visible = True
        PanelPesquisaNOVA.Visible = False
    End Sub

    Protected Sub UpdateCancelButton_Click(sender As Object, e As System.EventArgs)
        FormViewVaga.DataBind()
        FormViewVaga.Visible = False
    End Sub

    Protected Sub LinkButtonCancelarVaga_Click(sender As Object, e As System.EventArgs)
        FormViewVaga.DataBind()
        FormViewVaga.Visible = False
        PanelFormVaga.Visible = False
    End Sub

    Protected Sub InsertCancelButton_Click(sender As Object, e As System.EventArgs)
        FormViewVaga.DataBind()
        FormViewVaga.Visible = False
        PanelFormVaga.Visible = False
        PanelPesquisaNOVA.Visible = True
    End Sub

    Protected Sub SqlDataSourceVagaPublicadaForm_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSourceVagaPublicadaForm.Inserting

        e.Command.Parameters("@Protocolo").Value = ProtocoloLabel.Text
        e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")
        e.Command.Parameters("@idCadastroEmpresa_Filha").Value = Session("idCadastroEmpresaFilha")
        e.Command.Parameters("@idPerfilVaga").Value = idPerfilVagaLabel.Text
        e.Command.Parameters("@iddsAnuncioEmpresa").Value = CType(FormViewVaga.FindControl("DropDownListApresentacao"), DropDownList).SelectedValue
        e.Command.Parameters("@idNivelHierarquico").Value = CType(FormViewVaga.FindControl("DropDownListExtrutura"), DropDownList).SelectedValue
        e.Command.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")
        e.Command.Parameters("@idRH_Consultor").Value = 0
        e.Command.Parameters("@idfuncao").Value = idfuncaoLabel.Text
        e.Command.Parameters("@dsfuncao").Value = dsfuncaoLabel.Text
        e.Command.Parameters("@data_ini").Value = CType(FormViewVaga.FindControl("data_iniTextbox"), TextBox).Text
        e.Command.Parameters("@data_fim").Value = CType(FormViewVaga.FindControl("data_fimTextbox"), TextBox).Text
        e.Command.Parameters("@liberarEmail").Value = CType(FormViewVaga.FindControl("liberarEmailCheckBox0"), CheckBox).Checked
        e.Command.Parameters("@publicar").Value = CType(FormViewVaga.FindControl("publicarCheckBox0"), CheckBox).Checked
        e.Command.Parameters("@idSetup").Value = Session("idSetup")

    End Sub

    Protected Sub DropDownListSelectEmpresa_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSelectEmpresa.SelectedIndexChanged
        idCadastroEmpresaFilhaLabel.Text = DropDownListSelectEmpresa.SelectedValue
        Session("idCadastroEmpresaFilha") = idCadastroEmpresaFilhaLabel.Text
    End Sub

    Protected Sub DropDownListSelectEmpresa_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListSelectEmpresa.DataBound
        Try
            Dim myDropDownListSelectEmpresa As DropDownList = DropDownListSelectEmpresa
            myDropDownListSelectEmpresa.Items.Insert(0, New ListItem("-- Selecione uma Empresa --", "0"))
            myDropDownListSelectEmpresa.SelectedValue = Session("idCadastroEmpresaFilha")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewListaPerfil_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewListaPerfil.SelectedIndexChanged
        FuncaoPesquisaLabel.Text = GridViewListaPerfil.SelectedDataKey("Cargo")
        ProtocoloLabel.Text = GridViewListaPerfil.SelectedDataKey("Protocolo")
        idRH_GestorLabel.Text = GridViewListaPerfil.SelectedDataKey("idRH_Gestor")
        idPerfilVagaLabel.Text = GridViewListaPerfil.SelectedDataKey("idPerfilVaga")
        If GridViewListaPerfil.SelectedDataKey("idstatusvaga") = "Providenciar" Then
            Response.Redirect("_cadastroLevantamento.aspx?autoTit=Providenciar o Levantamento para a vaga: " & FuncaoPesquisaLabel.Text)
        End If
        PanelPesquisaNOVA.Visible = True
    End Sub

    Protected Sub FormViewVaga_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormViewVaga.DataBound

        CType(FormViewVaga.FindControl("data_iniTextBox"), TextBox).Text = Now()
        CType(FormViewVaga.FindControl("data_fimTextBox"), TextBox).Text = Now().AddDays(7)
        CType(FormViewVaga.FindControl("codvagaTextBox"), TextBox).Text = ProtocoloLabel.Text

    End Sub

    Protected Sub SqlDataSourceVagaPublicadaForm_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSourceVagaPublicadaForm.Inserted
        Response.Redirect("_runProcessoSeletivo.aspx?autoTit=Pesquisa%20de%20Candidatos")
    End Sub

    Protected Sub ImageButtonCadCargo_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonCadCargo.Click
        PanelCargoInsert.Visible = True
        TextBoxNovoCargo.Text = FuncaoPesquisaLabel.Text
    End Sub

    Protected Sub ImageButtonCancCargo_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonCancCargo.Click
        PanelCargoInsert.Visible = False
    End Sub

    Protected Sub ImageButtonIncCargo_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonIncCargo.Click

        If TextBoxNovoCargo.Text <> "" Then

            Dim CARACTER As String = TextBoxNovoCargo.Text.Substring(0, 1)

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("_USP_CADASTRO_AUTOMATICO_FUNCAO", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@CARACTER", SqlDbType.VarChar, 1)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@CARACTER").Value = CARACTER

            prm = New SqlParameter("@dsfuncao", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@dsfuncao").Value = TextBoxNovoCargo.Text

            cn.Open()

            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Close()
            cn.Close()

            FuncaoPesquisaLabel.Text = TextBoxNovoCargo.Text
            GridViewPsqCargo.DataBind()
            GridViewListaPerfil.DataBind()
            PanelCargoInsert.Visible = False

        End If

    End Sub
End Class
