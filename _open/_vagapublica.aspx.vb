Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports checkdigit
Imports System.DBNull
Imports geraProtocolo

Partial Class _empresa_vagapublica
    Inherits System.Web.UI.Page

    Dim myProtocolo As New geraProtocolo

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LabelCabec.Text = Request.QueryString("autoTit")
    End Sub

    Protected Sub SqlForm_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlForm.Inserting
        e.Command.Parameters("@dsVagaPublica").Value = Replace(CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@codigo").Value = myProtocolo.getNrProtocolo(Session("idSetup"))
        e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa").ToString
        e.Command.Parameters("@idfuncao").Value = idfuncaoLabel.Text
        e.Command.Parameters("@data").Value = Now()
    End Sub

    Protected Sub SqlForm_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlForm.Updated
        GridViewListaVagas.DataBind()
    End Sub

    Protected Sub SqlForm_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlForm.Deleted
        GridViewListaVagas.DataBind()
    End Sub

    Protected Sub SqlForm_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlForm.Inserted
        GridViewListaVagas.DataBind()
    End Sub

    Protected Sub SqlForm_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlForm.Updating
        e.Command.Parameters("@dsVagaPublica").Value = Replace(CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text, Chr(10), "<br>")
    End Sub

    Protected Sub dsVagaPublicaTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text = Replace(CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text, "<br>", "")
    End Sub

    Protected Sub ImageButtonClose_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonClose.Click
        PanelPSQ.Visible = False
    End Sub

    Protected Sub ImageButtonPSQ_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonPSQ.Click
        PanelPSQ.Visible = False
        FormViewVaga.Visible = True
    End Sub

    Protected Sub GridViewListaVagas_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewListaVagas.SelectedIndexChanged
        idVagaPublicaLabel.Text = GridViewListaVagas.SelectedDataKey("idVagaPublica")
        FormViewVaga.Visible = True
    End Sub

    Protected Sub ImageButtonPSQL_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonPSQL.Click
        PanelPSQ.Visible = True
    End Sub

    Protected Sub PSQlb_Click(sender As Object, e As System.EventArgs) Handles PSQlb.Click
        PanelPSQ.Visible = True
        idVagaPublicaLabel.Text = ""
    End Sub

    Protected Sub GridViewPsqCargo_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewPsqCargo.SelectedIndexChanged

        idfuncaoLabel.Text = GridViewPsqCargo.SelectedDataKey("idfuncao")
        dsfuncaoLabel.Text = GridViewPsqCargo.SelectedDataKey("dsfuncao")
        FormViewVaga.Visible = True
        TextBoxPsq.Text = ""

        FormViewVaga.ChangeMode(FormViewMode.Insert)

        Try
            CType(FormViewVaga.FindControl("titVagaPublicaTextBox"), TextBox).Text = dsfuncaoLabel.Text
            CType(FormViewVaga.FindControl("emailTextBox"), TextBox).Text = Session("email")
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub FormViewVaga_DataBound(sender As Object, e As System.EventArgs) Handles FormViewVaga.DataBound
        Try
            CType(FormViewVaga.FindControl("titVagaPublicaTextBox"), TextBox).Text = dsfuncaoLabel.Text
            CType(FormViewVaga.FindControl("emailTextBox"), TextBox).Text = Session("email")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LinkButtonCancelar_Click(sender As Object, e As System.EventArgs)
        idVagaPublicaLabel.Text = ""
    End Sub

    Protected Sub PSQlb2_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles PSQlb2.Click
        PanelPSQ.Visible = True
        idVagaPublicaLabel.Text = ""
    End Sub

    Protected Sub CheckBoxPNE_CheckedChanged(sender As Object, e As System.EventArgs)
        If CType(FormViewVaga.FindControl("CheckBoxPNE"), CheckBox).Checked = True Then
            Try
                CType(FormViewVaga.FindControl("titVagaPublicaTextBox"), TextBox).Text = CType(FormViewVaga.FindControl("titVagaPublicaTextBox"), TextBox).Text + " - PNE"
            Catch
            End Try
            Try
                CType(FormViewVaga.FindControl("titVagaPublicaEditTextBox"), TextBox).Text = CType(FormViewVaga.FindControl("titVagaPublicaEditTextBox"), TextBox).Text + " - PNE"
            Catch
            End Try

            CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text = "- Vaga para Portadores de Necessidades Especiais -" + vbCrLf + vbCrLf + CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text


        ElseIf CType(FormViewVaga.FindControl("CheckBoxPNE"), CheckBox).Checked = False Then
            Try
                CType(FormViewVaga.FindControl("titVagaPublicaTextBox"), TextBox).Text = Replace(CType(FormViewVaga.FindControl("titVagaPublicaTextBox"), TextBox).Text, " - PNE", "")
            Catch
            End Try
            Try
                CType(FormViewVaga.FindControl("titVagaPublicaEditTextBox"), TextBox).Text = Replace(CType(FormViewVaga.FindControl("titVagaPublicaEditTextBox"), TextBox).Text, " - PNE", "")
            Catch
            End Try

            CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text = Replace(CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text, "- Vaga para Portadores de Necessidades Especiais -" + vbCrLf + vbCrLf, "")
            CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text = Replace(CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text, "- Vaga para Portadores de Necessidades Especiais -" + vbCrLf, "")
            CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text = Replace(CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text, "- Vaga para Portadores de Necessidades Especiais -", "")
        End If
    End Sub
End Class
