
Partial Class _candidato_conhecimento
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        PanelAviso.Visible = False
        idexprofissionalInformaticaLabel.Text = ""
    End Sub

    Protected Sub ValorID(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource2.Inserting
        If DropDownList1.SelectedItem.Value <> 0 And DropDownList2.SelectedItem.Value <> "" Then
            e.Command.Parameters("@idTipoConhecimento").Value = DropDownList1.SelectedItem.Value
            e.Command.Parameters("@idTipoConhecimentoRel").Value = DropDownList2.SelectedItem.Value
            e.Command.Parameters("@obs").Value = Replace(CType(FormView1.FindControl("obsTextBox"), TextBox).Text, Chr(10), "<br>")
        Else
            e.Cancel = True
            MSNLabel.Text = "Selecione um conhecimento!"
        End If
    End Sub

    Protected Sub IncOK(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource2.Inserted
        PanelAviso.Visible = True
        DropInfo.Visible = False
        AVISOLABEL.Text = "• Seu conhecimento foi salvo com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        GridViewInfo.DataBind()
    End Sub


    Protected Sub DelOk(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource2.Deleted
        PanelAviso.Visible = True
        DropInfo.Visible = False
        AVISOLABEL.Text = "• O conhecimento foi excluído com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        GridViewInfo.DataBind()
    End Sub

    Protected Sub ShowDrop(ByVal sender As Object, ByVal e As System.EventArgs)
        DropInfo.Visible = True
    End Sub

    Protected Sub HideDrop(ByVal sender As Object, ByVal e As System.EventArgs)
        DropInfo.Visible = False
        Response.Redirect("/_candidato")
    End Sub

    Protected Sub UpdOK(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource2.Updated

        PanelAviso.Visible = True
        DropInfo.Visible = False
        AVISOLABEL.Text = "• Seu conhecimento foi atualizado com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        GridViewInfo.DataBind()

    End Sub

    Protected Sub VaPara(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("conhecimento.aspx")
    End Sub

    Protected Sub SqlDataSource2_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource2.Updating
        'obsTextBox
        e.Command.Parameters("@obs").Value = Replace(CType(FormView1.FindControl("obsTextBox"), TextBox).Text, Chr(10), "<br>")
    End Sub

    Protected Sub obsTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("obsTextBox"), TextBox).Text = Replace(CType(FormView1.FindControl("obsTextBox"), TextBox).Text, "<br>", "")
    End Sub

    Protected Sub linkbuttonINC_Click(sender As Object, e As System.EventArgs)
        DropInfo.Visible = True
    End Sub

    Protected Sub linkbuttonCANCELAR_Click(sender As Object, e As System.EventArgs)
        DropInfo.Visible = False
    End Sub

    Protected Sub GridViewInfo_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewInfo.SelectedIndexChanged
        idexprofissionalInformaticaLabel.Text = GridViewInfo.SelectedDataKey("idexprofissionalInformatica")
        idTipoConhecimentoLabel.Text = GridViewInfo.SelectedDataKey("idTipoConhecimento")
        idTipoConhecimentoRelLabel.Text = GridViewInfo.SelectedDataKey("idTipoConhecimentoRel")
        DropInfo.Visible = False
    End Sub
End Class
