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

    Protected Sub DropDownListEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownListEmpresa.SelectedIndexChanged
        PanelPSQ.Visible = True
        FormViewVaga.Visible = False
        idvagaLabel.Text = ""
        Session("idCadastroEmpresaFilha") = DropDownListEmpresa.SelectedValue
    End Sub

    Protected Sub DropDownListEmpresa_DataBound(sender As Object, e As System.EventArgs) Handles DropDownListEmpresa.DataBound
        DropDownListEmpresa.SelectedValue = Session("idCadastroEmpresaFilha")
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

    Protected Sub DropDownListConsultor_DataBound(sender As Object, e As System.EventArgs)
        Try
            Dim myDropDownListConsultor As DropDownList = CType(FormViewVaga.FindControl("DropDownListConsultor"), DropDownList)
            myDropDownListConsultor.Items.Insert(0, New ListItem("-- Selecione um Consultor --", ""))
            myDropDownListConsultor.SelectedValue = CType(FormViewVaga.FindControl("DropDownListConsultor"), DropDownList).SelectedValue
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownListApresentacao_DataBound(sender As Object, e As System.EventArgs)
        Try
            Dim myDropDownListApresentacao As DropDownList = CType(FormViewVaga.FindControl("DropDownListApresentacao"), DropDownList)
            myDropDownListApresentacao.Items.Insert(0, New ListItem("-- Selecione uma apresentação --", ""))
            myDropDownListApresentacao.SelectedValue = CType(FormViewVaga.FindControl("DropDownListApresentacao"), DropDownList).SelectedValue
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub UpdateCancelButton_Click(sender As Object, e As System.EventArgs)
        FormViewVaga.DataBind()
        FormViewVaga.Visible = False
    End Sub

    Protected Sub DropDownListProtocolo_DataBound(sender As Object, e As System.EventArgs)
        Try
            Dim myDropDownListProtocolo As DropDownList = CType(FormViewVaga.FindControl("DropDownListProtocolo"), DropDownList)
            myDropDownListProtocolo.Items.Insert(0, New ListItem("-- Selecione um Levantamento Aprovado --", ""))
            myDropDownListProtocolo.SelectedValue = CType(FormViewVaga.FindControl("DropDownListProtocolo"), DropDownList).SelectedValue
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownListProtocolo_SelectedIndexChanged(sender As Object, e As System.EventArgs)
        CType(FormViewVaga.FindControl("codvagaTextBox"), TextBox).Text = CType(FormViewVaga.FindControl("DropDownListProtocolo"), DropDownList).SelectedItem.Text
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

    Protected Sub SqlDataSourceVagaPublicadaForm_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSourceVagaPublicadaForm.Inserting

        e.Command.Parameters("@Protocolo").Value = CType(FormViewVaga.FindControl("DropDownListProtocolo"), DropDownList).SelectedItem.Text
        e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")
        e.Command.Parameters("@idCadastroEmpresa_Filha").Value = Session("idCadastroEmpresaFilha")
        e.Command.Parameters("@idPerfilVaga").Value = CType(FormViewVaga.FindControl("DropDownListProtocolo"), DropDownList).SelectedValue
        e.Command.Parameters("@iddsAnuncioEmpresa").Value = CType(FormViewVaga.FindControl("DropDownListApresentacao"), DropDownList).SelectedValue
        e.Command.Parameters("@idNivelHierarquico").Value = CType(FormViewVaga.FindControl("DropDownListExtrutura"), DropDownList).SelectedValue
        e.Command.Parameters("@idRH_Gestor").Value = CType(FormViewVaga.FindControl("DropDownListConsultor"), DropDownList).SelectedValue
        e.Command.Parameters("@idRH_Consultor").Value = 0
        e.Command.Parameters("@idfuncao").Value = idfuncaoLabel.Text
        e.Command.Parameters("@dsfuncao").Value = dsfuncaoLabel.Text

        ProtocoloLabel.Text = CType(FormViewVaga.FindControl("DropDownListProtocolo"), DropDownList).SelectedItem.Text

    End Sub

    Protected Sub SqlDataSourceVagaPublicadaForm_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSourceVagaPublicadaForm.Inserted
        GravaAnuncio(ProtocoloLabel.Text)
    End Sub

    Sub GravaAnuncio(Protocolo As String)

        REM *** ******************************************************************************
        REM *** GRAVA TODAS AS INFORMAÇÕES DO LAVANTAMENTO DO PERFIL DA VAGA PARA A PUBLICAÇÃO DA VAGA
        REM *** PERMITE ALTERAR / EXCLUIR AS INFORMAÇÔES

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PUBLICACAO_VAGA_XML", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@Protocolo", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@Protocolo").Value = Protocolo

        cn.Open()

        Try

            Dim dr As SqlDataReader = cmd.ExecuteReader()
            dr.Close()

        Catch ex As Exception

        End Try
        cn.Close()

    End Sub

End Class
