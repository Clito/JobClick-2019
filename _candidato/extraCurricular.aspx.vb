
Partial Class _candidato_extraCurricular
    Inherits System.Web.UI.Page

    Protected Sub DropDownListTipo_SelectedIndexChanged(sender As Object, e As System.EventArgs)
        AtividadeExtracurricularTipoLabel.Text = CType(FormViewExtra.FindControl("DropDownListTipo"), DropDownList).SelectedValue
        MSNError.Text = ""
    End Sub

    Protected Sub GridViewAtividade_SelectedIndexChanged(sender As Object, e As System.EventArgs)
        dsAtividadeExtracurricularAtividadeLabel.Text = CType(FormViewExtra.FindControl("GridViewAtividade"), GridView).SelectedDataKey("dsAtividadeExtracurricularAtividade")
        CType(FormViewExtra.FindControl("DicasLabel"), Label).Text = "<br><b>" & CType(FormViewExtra.FindControl("GridViewAtividade"), GridView).SelectedDataKey("dsAtividadeExtracurricularAtividade") & "<br>Dica:</b> " & CType(FormViewExtra.FindControl("GridViewAtividade"), GridView).SelectedDataKey("Dicas") & "<br>"
        MSNError.Text = ""
    End Sub

    Protected Sub LinkButtonBack_Click(sender As Object, e As System.EventArgs)
        Response.Redirect("/_candidato")
    End Sub

    Protected Sub SqlExtraForm_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlExtraForm.Inserting

        e.Command.Parameters("@dsAtividadeExtracurricularAtividade").Value = dsAtividadeExtracurricularAtividadeLabel.Text
        e.Command.Parameters("@AtividadeExtracurricularTipo").Value = AtividadeExtracurricularTipoLabel.Text
        e.Command.Parameters("@idcurriculo").Value = Session("idcurriculo")
        e.Command.Parameters("@dataCadastro").Value = Now()

        If AtividadeExtracurricularTipoLabel.Text = "" Then
            e.Cancel = True
            MSNError.Text = "<br>Você precisa selecionar um tipo de Atividade Extra Curricular.<br>"
        End If

        If CType(FormViewExtra.FindControl("dsAtividadeExtracurricularTextBox"), TextBox).Text = "" Then
            e.Cancel = True
            MSNError.Text = "<br>Você precisa descrever a sua experiência nesta Atividade Extra Curricular.<br>"
        End If

    End Sub

    Protected Sub SqlExtraForm_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlExtraForm.Inserted
        AtividadeLista.DataBind()
        AtividadeLista.Visible = True
        AtividadeExtracurricularTipoLabel.Text = ""
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Seus dados foram salvos com sucesso!<br>"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        AVISOLABEL.CssClass = "msnOK"
    End Sub

    Protected Sub AtividadeLista_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles AtividadeLista.SelectedIndexChanged
        idAtividadeExtracurricularLabel.Text = AtividadeLista.SelectedDataKey("idAtividadeExtracurricular")
        MSNError.Text = ""
    End Sub

    Protected Sub SqlExtraForm_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlExtraForm.Updated
        AtividadeLista.DataBind()
        AtividadeLista.Visible = True
        AtividadeExtracurricularTipoLabel.Text = ""
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Seus dados foram atualizados com sucesso!<br>"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        AVISOLABEL.CssClass = "msnOK"
    End Sub

    Protected Sub SqlExtraForm_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlExtraForm.Deleted
        AtividadeLista.DataBind()
        AtividadeLista.Visible = True
        AtividadeExtracurricularTipoLabel.Text = ""
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Seus dados foram excluidos com sucesso!<br>"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        AVISOLABEL.CssClass = "msnOK"
    End Sub

    Protected Sub NewButton_Click(sender As Object, e As System.EventArgs)
        AtividadeLista.Visible = False
    End Sub

    Protected Sub LinkButtonCANCELAR_Click(sender As Object, e As System.EventArgs)
        Response.Redirect("extraCurricular.aspx")
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        PanelAviso.Visible = False
    End Sub
End Class
