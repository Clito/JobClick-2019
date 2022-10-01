Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports checkdigit
Imports System.DBNull
Imports ReplaceForm

Partial Class _empresa__vaga_Default
    Inherits System.Web.UI.Page

    Dim myReplace As New ReplaceForm

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")

        If idCadastroEmpresaFilha = "" Then
            Response.Redirect("Default.aspx")
        End If

        If idCadastroEmpresaFilha <> "" Then
            idCadastroEmpresaFilhaLabel.Text = Session("idCadastroEmpresaFilha")
        End If
    End Sub

    Protected Sub GridViewAnuncioApr_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewAnuncioApr.SelectedIndexChanged
        iddsempresaLabel.Text = GridViewAnuncioApr.SelectedDataKey("iddsempresa")
    End Sub

    Protected Sub DropDownListEmpresa_DataBound(sender As Object, e As System.EventArgs)
        Try
            Dim myDropDownListEmpresa As DropDownList = CType(FormViewApresentaAnuncio.FindControl("DropDownListEmpresa"), DropDownList)
            myDropDownListEmpresa.Items.Insert(0, New ListItem("-- Selecione uma Empresa --", ""))
            myDropDownListEmpresa.SelectedValue = CType(FormViewApresentaAnuncio.FindControl("DropDownListEmpresa"), DropDownList).SelectedValue
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub SqlApresentacaoEmpresasFORM_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlApresentacaoEmpresasFORM.Inserting
        e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")
        e.Command.Parameters("@dsempresaVaga").Value = myReplace.ReplaceIn(CType(FormViewApresentaAnuncio.FindControl("dsempresaVagaTextBox"), TextBox).Text)
        e.Command.Parameters("@msnCandidato").Value = myReplace.ReplaceIn(CType(FormViewApresentaAnuncio.FindControl("msnCandidatoTextBox"), TextBox).Text)
        e.Command.Parameters("@msnCandidatoFim").Value = myReplace.ReplaceIn(CType(FormViewApresentaAnuncio.FindControl("msnCandidatoFimTextBox"), TextBox).Text)
    End Sub

    Protected Sub SqlApresentacaoEmpresasFORM_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlApresentacaoEmpresasFORM.Updating
        e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")
        e.Command.Parameters("@dsempresaVaga").Value = myReplace.ReplaceIn(CType(FormViewApresentaAnuncio.FindControl("dsempresaVagaTextBox"), TextBox).Text)
        e.Command.Parameters("@msnCandidato").Value = myReplace.ReplaceIn(CType(FormViewApresentaAnuncio.FindControl("msnCandidatoTextBox"), TextBox).Text)
        e.Command.Parameters("@msnCandidatoFim").Value = myReplace.ReplaceIn(CType(FormViewApresentaAnuncio.FindControl("msnCandidatoFimTextBox"), TextBox).Text)
    End Sub

    Protected Sub SqlApresentacaoEmpresasFORM_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlApresentacaoEmpresasFORM.Updated
        GridViewAnuncioApr.DataBind()
    End Sub

    Protected Sub SqlApresentacaoEmpresasFORM_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlApresentacaoEmpresasFORM.Inserted
        GridViewAnuncioApr.DataBind()
    End Sub

    Protected Sub SqlApresentacaoEmpresasFORM_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlApresentacaoEmpresasFORM.Deleted
        GridViewAnuncioApr.DataBind()
    End Sub

    Protected Sub FecharGridView_Click(sender As Object, e As System.EventArgs)
        iddsempresaLabel.Text = ""
    End Sub

    Protected Sub FormViewApresentaAnuncio_DataBound(sender As Object, e As System.EventArgs) Handles FormViewApresentaAnuncio.DataBound
        Try
            CType(FormViewApresentaAnuncio.FindControl("dsempresaVagaTextBox"), TextBox).Text = myReplace.ReplaceIn(CType(FormViewApresentaAnuncio.FindControl("dsempresaVagaTextBox"), TextBox).Text)
            CType(FormViewApresentaAnuncio.FindControl("msnCandidatoTextBox"), TextBox).Text = myReplace.ReplaceIn(CType(FormViewApresentaAnuncio.FindControl("msnCandidatoTextBox"), TextBox).Text)
            CType(FormViewApresentaAnuncio.FindControl("msnCandidatoFimTextBox"), TextBox).Text = myReplace.ReplaceIn(CType(FormViewApresentaAnuncio.FindControl("msnCandidatoFimTextBox"), TextBox).Text)
        Catch ex As Exception

        End Try
    End Sub

 
    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewPsqCargo.SelectedIndexChanged
        idfuncaoLabel.Text = GridViewPsqCargo.SelectedDataKey("idfuncao")
        dsfuncaoLabel.Text = GridViewPsqCargo.SelectedDataKey("dsfuncao")
        TextBoxPsq.Text = ""
        PanelPSQ.Visible = False
        ResPSQLabel.CssClass = "msnOK"
        ResPSQLabel.Text = "Você selecionou o seguinte cargo: " & dsfuncaoLabel.Text
        FormViewVaga.Visible = True
    End Sub

    Protected Sub ImageButtonAvisoPSQ_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAvisoPSQ.Click
        PanelPSQ.Visible = True
    End Sub

    Protected Sub LinkButtonPSQ_Click(sender As Object, e As System.EventArgs) Handles LinkButtonPSQ.Click
        PanelPSQ.Visible = True
    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        PanelPSQ.Visible = False
    End Sub

    Protected Sub ImageButtonPSQ_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonPSQ.Click
        PanelPSQ.Visible = False
    End Sub

    Protected Sub DropDownList1_DataBound(sender As Object, e As System.EventArgs) Handles DropDownListEmpresa.DataBound
        Try
            Dim myDropDownListEmpresa As DropDownList = DropDownListEmpresa
            myDropDownListEmpresa.Items.Insert(0, New ListItem("-- Selecione uma empresa --", ""))
            myDropDownListEmpresa.SelectedValue = Session("idCadastroEmpresaFilha") 'DropDownListEmpresa.Text
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownListEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownListEmpresa.SelectedIndexChanged
        idCadastroEmpresaFilhaLabel.Text = DropDownListEmpresa.SelectedValue
    End Sub

    Protected Sub GridViewVagasPublicadas_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewVagasPublicadas.SelectedIndexChanged
        idvagaLabel.Text = GridViewVagasPublicadas.SelectedDataKey("idVaga")
        FormViewVaga.Visible = True
    End Sub


    Protected Sub UpdateCancelButton_Click(sender As Object, e As System.EventArgs)
        idvagaLabel.Text = ""
        FormViewVaga.DataBind()
        FormViewVaga.Visible = False
    End Sub

    Protected Sub LinkButtonCancelarVaga_Click(sender As Object, e As System.EventArgs)
        idvagaLabel.Text = ""
        FormViewVaga.DataBind()
        FormViewVaga.Visible = False
    End Sub

    REM *** ******************************************************************************
    REM *** MOMENTO EM QUE É GRAVADA A VAGA NA TABELA _tbVaga CRIADA PARA A NOVA FASE DO JOBCLICK

    Protected Sub SqlDataSourceVagaPublicadaForm_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSourceVagaPublicadaForm.Inserting

        e.Command.Parameters("@Protocolo").Value = CType(FormViewVaga.FindControl("DropDownListProtocolo"), DropDownList).SelectedItem.Text
        e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")
        e.Command.Parameters("@idCadastroEmpresa_Filha").Value = idCadastroEmpresaFilhaLabel.Text
        e.Command.Parameters("@idPerfilVaga").Value = CType(FormViewVaga.FindControl("DropDownListProtocolo"), DropDownList).SelectedValue
        e.Command.Parameters("@iddsAnuncioEmpresa").Value = CType(FormViewVaga.FindControl("DropDownListApresentacao"), DropDownList).SelectedValue
        e.Command.Parameters("@idNivelHierarquico").Value = CType(FormViewVaga.FindControl("DropDownListExtrutura"), DropDownList).SelectedValue
        e.Command.Parameters("@idRH_Gestor").Value = CType(FormViewVaga.FindControl("DropDownListConsultor"), DropDownList).SelectedValue
        e.Command.Parameters("@idRH_Consultor").Value = 0
        e.Command.Parameters("@idfuncao").Value = idfuncaoLabel.Text
        e.Command.Parameters("@dsfuncao").Value = dsfuncaoLabel.Text

        ProtocoloLabel.Text = CType(FormViewVaga.FindControl("DropDownListProtocolo"), DropDownList).SelectedItem.Text

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
    Protected Sub SqlDataSourceVagaPublicadaForm_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSourceVagaPublicadaForm.Inserted

        GravaAnuncio(ProtocoloLabel.Text)
        GridViewVagasPublicadas.DataBind()

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

    Protected Sub DropDownListApresentacao_DataBound(sender As Object, e As System.EventArgs)
        Try
            Dim myDropDownListApresentacao As DropDownList = CType(FormViewVaga.FindControl("DropDownListApresentacao"), DropDownList)
            myDropDownListApresentacao.Items.Insert(0, New ListItem("-- Selecione uma apresentação --", ""))
            myDropDownListApresentacao.SelectedValue = CType(FormViewVaga.FindControl("DropDownListApresentacao"), DropDownList).SelectedValue
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownListConsultor_DataBound(sender As Object, e As System.EventArgs)
        Try
            Dim myDropDownListConsultor As DropDownList = CType(FormViewVaga.FindControl("DropDownListConsultor"), DropDownList)
            myDropDownListConsultor.Items.Insert(0, New ListItem("-- Selecione um Consultor --", ""))
            myDropDownListConsultor.SelectedValue = CType(FormViewVaga.FindControl("DropDownListConsultor"), DropDownList).SelectedValue
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub FormViewVaga_DataBound(sender As Object, e As System.EventArgs) Handles FormViewVaga.DataBound
        Try
            CType(FormViewVaga.FindControl("HyperLinkPreView"), HyperLink).NavigateUrl = "~/_empresa/previewVaga.aspx?Protocolo=" & CType(FormViewVaga.FindControl("ProtocoloLabel"), Label).Text
        Catch ex As Exception

        End Try
    End Sub



End Class
