Imports PCase
Partial Class _candidato_formacao
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ImageMapBrasil_Click(sender As Object, e As System.Web.UI.WebControls.ImageMapEventArgs) Handles ImageMapBrasil.Click
        DropDownListUF.SelectedValue = e.PostBackValue
        UFLabel.Text = e.PostBackValue
        ImageButtonNovaEntidade.Visible = True
    End Sub

    Protected Sub DropDownListCIDADES_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownListCIDADES.SelectedIndexChanged
        CidadeLabel.Text = DropDownListCIDADES.SelectedValue
        GridViewLISTA.DataBind()
    End Sub

    Protected Sub DropDownListUF_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownListUF.SelectedIndexChanged
        UFLabel.Text = DropDownListUF.SelectedValue
        ImageButtonNovaEntidade.Visible = True
    End Sub


    Protected Sub GridViewCURSO_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewCURSO.SelectedIndexChanged
        idFormacaoLabel.Text = GridViewCURSO.SelectedDataKey("idFormacao")
        FormViewFormacao.ChangeMode(FormViewMode.Edit)
    End Sub

    Protected Sub DropDownListTIPO_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownListTIPO.SelectedIndexChanged
        TIPOLabel.Text = DropDownListTIPO.SelectedValue
        ImageMapBrasil.Visible = False
    End Sub

    Protected Sub DropDownListTIPO_DataBound(sender As Object, e As System.EventArgs) Handles DropDownListTIPO.DataBound
        Try
            Dim myDropDownListTIPO As DropDownList = DropDownListTIPO
            myDropDownListTIPO.Items.Insert(0, New ListItem("-- Selecione --", ""))

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownListCIDADES_DataBound(sender As Object, e As System.EventArgs) Handles DropDownListCIDADES.DataBound
        Try
            Dim myDropDownListCIDADES As DropDownList = DropDownListCIDADES
            myDropDownListCIDADES.Items.Insert(0, New ListItem("-- Selecione --", ""))

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub SqlDataSourceFORM_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSourceFORM.Updating
        e.Command.Parameters("@idcurriculo").Value = Session("idCurriculo")
        e.Command.Parameters("@idTipoFormacao").Value = CType(FormViewFormacao.FindControl("DropDownListTipoFormacao"), DropDownList).SelectedValue
    End Sub

    Protected Sub SqlDataSourceFORM_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSourceFORM.Updated
        GridViewCURSO.DataBind()
    End Sub

    Protected Sub SqlDataSourceFORM_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSourceFORM.Inserting
        e.Command.Parameters("@idcurriculo").Value = Session("idCurriculo")
        e.Command.Parameters("@idTipoFormacao").Value = CType(FormViewFormacao.FindControl("DropDownListTipoFormacao"), DropDownList).SelectedValue
        e.Command.Parameters("@idInstituicao").Value = idInstituicaoLabel.Text
    End Sub

    Protected Sub SqlDataSourceFORM_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSourceFORM.Inserted
        EntidadeNomeLabel.Text = ""
        GridViewCURSO.DataBind()
    End Sub

    Protected Sub SqlDataSourceFORM_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSourceFORM.Deleted
        GridViewCURSO.DataBind()
    End Sub

    Protected Sub ImageButtonIncFormacao_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonIncFormacao.Click
        PanelPesquisa.Visible = True
        ImageMapBrasil.Visible = True
    End Sub

    Protected Sub GridViewLISTA_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewLISTA.SelectedIndexChanged

        FormViewFormacao.ChangeMode(FormViewMode.Insert)
        idInstituicaoLabel.Text = GridViewLISTA.SelectedDataKey("idInstituicao")
        PanelPesquisa.Visible = False

        EntidadeNomeLabel.Visible = True
        EntidadeNomeLabel.Text = GridViewLISTA.SelectedDataKey("dsinstituicao")

    End Sub


    Protected Sub LinkButtonFechar_Click(sender As Object, e As System.EventArgs) Handles LinkButtonFechar.Click
        PanelPesquisa.Visible = False
    End Sub

    Protected Sub ImageButtonNovaEntidade_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonNovaEntidade.Click
        ImageMapBrasil.Visible = False
        ImageButtonNovaEntidade.Visible = False
        FormViewEntidade.Visible = True
    End Sub

    Protected Sub InsertCancelButton_Click(sender As Object, e As System.EventArgs)
        ImageMapBrasil.Visible = True
        ImageButtonNovaEntidade.Visible = True
        FormViewEntidade.Visible = False
    End Sub

    Protected Sub SqlEntidadeFORM_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlEntidadeFORM.Inserted

        GridViewCURSO.DataBind()

        SqlDataUF.DataBind()
        SqlCidadeEntidade_UF.DataBind()
        SqlTIPOENTIDADE.DataBind()

        Try
            DropDownListTIPO.SelectedItem.Value = CType(FormViewEntidade.FindControl("DropDownListTipo"), DropDownList).SelectedValue
            DropDownListCIDADES.SelectedValue = CType(FormViewEntidade.FindControl("estadoTextBox"), TextBox).Text
        Catch ex As Exception

        End Try

        DropDownListCIDADES.DataBind()
        DropDownListTIPO.DataBind()
        GridViewLISTA.DataBind()
        msn0.CssClass = "msnOK"
        msn0.Text = "A Entidade foi cadastrada."
    End Sub

    Protected Sub SqlEntidadeFORM_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlEntidadeFORM.Inserting
        REM ** ********************************************************************************************************
        REM ** VERIFICA AS INFORMAÇÕES NECESSÁRIAS
        REM ** ********************************************************************************************************

        If CType(FormViewEntidade.FindControl("dsinstituicaoTextBox"), TextBox).Text = "" Then
            msn0.Text = "O nome da Entidade é Obrigatório."
            e.Cancel = True
        End If

        If CType(FormViewEntidade.FindControl("estadoTextBox"), TextBox).Text = "" Then
            msn0.Text = "A cidade onde a Entidade está é Obrigatória."
            e.Cancel = True
        End If

        If CType(FormViewEntidade.FindControl("DropDownListTIPO"), DropDownList).SelectedItem.Value = "0" Then
            msn0.Text = "O grupo da entidades é Obrigatório."
            e.Cancel = True
        End If

        If CType(FormViewEntidade.FindControl("DropDownListTIPO"), DropDownList).SelectedItem.Value = "-- Informe Grupo --" Then
            msn0.Text = "O grupo da entidades é Obrigatório."
            e.Cancel = True
        End If


        If CType(FormViewEntidade.FindControl("DropDownListUF"), DropDownList).SelectedItem.Value = "  " Then
            msn0.Text = "Informe a Sigla do estado."
            e.Cancel = True
        End If

        If CType(FormViewEntidade.FindControl("DropDownListUF"), DropDownList).SelectedItem.Value = "0" Then
            msn0.Text = "Informe a Sigla do estado."
            e.Cancel = True
        End If

        Dim myPCase As New PCase
        e.Command.Parameters("@dsinstituicao").Value = myPCase.PCase(CType(FormViewEntidade.FindControl("dsinstituicaoTextBox"), TextBox).Text)
        e.Command.Parameters("@estado").Value = myPCase.PCase(CType(FormViewEntidade.FindControl("estadoTextBox"), TextBox).Text)

    End Sub


    Protected Sub InsertCancelButton_Click1(sender As Object, e As System.EventArgs)
        EntidadeNomeLabel.Text = ""
    End Sub

    Protected Sub ImageButtonVoltar_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonVoltar.Click
        Response.Redirect("/_candidato")
    End Sub

End Class
