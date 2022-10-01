
Partial Class _candidato_contato
    Inherits System.Web.UI.Page

    Protected Sub Vapara(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("/_candidato/contato.aspx")
    End Sub

    Protected Sub AtTelefone(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlCONTATOFORM.Updated
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Seu número para contato foi alterado com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        GridViewCONTATO.DataBind()
    End Sub

    Protected Sub InTelefone(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlCONTATOFORM.Inserted
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Seu número para contato foi salvo com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        GridViewCONTATO.DataBind()
    End Sub

    Protected Sub DelTelefone(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlCONTATOFORM.Deleted
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Seu número para contato foi excluído com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        GridViewCONTATO.DataBind()
    End Sub

    Protected Sub FormView1_DataBound(sender As Object, e As System.EventArgs) Handles FormViewCONTATO.DataBound
        Try
            Dim TipoTelefone As String = CType(FormViewCONTATO.FindControl("DropDownListCsms"), DropDownList).SelectedValue
            Select Case TipoTelefone
                Case "Celular"
                    CType(FormViewCONTATO.FindControl("RadioButtonListSMS"), RadioButtonList).Visible = True
                Case Else
                    CType(FormViewCONTATO.FindControl("RadioButtonListSMS"), RadioButtonList).Visible = False
            End Select
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownListCsms_SelectedIndexChanged(sender As Object, e As System.EventArgs)
        Try
            Dim TipoTelefone As String = CType(FormViewCONTATO.FindControl("DropDownListCsms"), DropDownList).SelectedValue
            Select Case TipoTelefone
                Case "Celular"
                    CType(FormViewCONTATO.FindControl("RadioButtonListSMS"), RadioButtonList).Visible = True
                Case Else
                    CType(FormViewCONTATO.FindControl("RadioButtonListSMS"), RadioButtonList).Visible = False
            End Select
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownListCsms_SelectedIndexChanged1(sender As Object, e As System.EventArgs)
        Try
            Dim TipoTelefone As String = CType(FormViewCONTATO.FindControl("DropDownListCsms"), DropDownList).SelectedValue
            Select Case TipoTelefone
                Case "Celular"
                    CType(FormViewCONTATO.FindControl("RadioButtonListSMS"), RadioButtonList).Visible = True
                Case Else
                    CType(FormViewCONTATO.FindControl("RadioButtonListSMS"), RadioButtonList).Visible = False
            End Select
        Catch ex As Exception

        End Try
    End Sub


    Protected Sub GridView1_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewCONTATO.RowDataBound

        Dim img As Image

        Try
            If e.Row.RowType = DataControlRowType.DataRow Then

                Dim EnviaSMS As Label = e.Row.FindControl("LabelSMS")
                Dim TipoTelefone As Label = e.Row.FindControl("LabelTipo")

                Select Case TipoTelefone.Text
                    Case "Celular"
                        If EnviaSMS.Text = "0" Then
                            e.Row.FindControl("LabelSMS").Visible = False
                            img = e.Row.FindControl("ImageSMS")
                            img.ImageUrl = "~/images/celularNOK.png"
                        Else
                            e.Row.FindControl("LabelSMS").Visible = False
                            img = e.Row.FindControl("ImageSMS")
                            img.ImageUrl = "~/images/celularOK.png"
                        End If
                    Case Else
                        e.Row.FindControl("LabelSMS").Visible = False
                        img = e.Row.FindControl("ImageSMS")
                        img.ImageUrl = "~/images/celularNO.png"
                End Select


            End If
        Catch ex As Exception

        End Try

    End Sub


    Protected Sub SqlDataSource4_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlCONTATOFORM.Inserting
        e.Command.Parameters("@idTipoTelefone").Value = CType(FormViewCONTATO.FindControl("DropDownListCsms"), DropDownList).SelectedValue
        e.Command.Parameters("@idCadastroUser").Value = Session("idCadastroUser")
        e.Command.Parameters("@ddd").Value = CType(FormViewCONTATO.FindControl("dddTextBox"), TextBox).Text
        e.Command.Parameters("@numero").Value = Replace(CType(FormViewCONTATO.FindControl("numeroTextBox"), TextBox).Text, "_", "")
        If CType(FormViewCONTATO.FindControl("ramalTextBox"), TextBox).Text <> "" Then
            e.Command.Parameters("@ramal").Value = CType(FormViewCONTATO.FindControl("ramalTextBox"), TextBox).Text
        End If
        e.Command.Parameters("@optin").Value = CType(FormViewCONTATO.FindControl("RadioButtonListSMS"), RadioButtonList).SelectedValue
    End Sub

    Protected Sub SqlDataSource4_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlCONTATOFORM.Updating
        e.Command.Parameters("@idTipoTelefone").Value = CType(FormViewCONTATO.FindControl("DropDownListCsms"), DropDownList).SelectedValue
        e.Command.Parameters("@idCadastroUser").Value = Session("idCadastroUser")
        e.Command.Parameters("@ddd").Value = CType(FormViewCONTATO.FindControl("dddTextBox"), TextBox).Text
        e.Command.Parameters("@numero").Value = CType(FormViewCONTATO.FindControl("numeroTextBox"), TextBox).Text
        If CType(FormViewCONTATO.FindControl("ramalTextBox"), TextBox).Text <> "" Then
            e.Command.Parameters("@ramal").Value = CType(FormViewCONTATO.FindControl("ramalTextBox"), TextBox).Text
        End If
        e.Command.Parameters("@optin").Value = CType(FormViewCONTATO.FindControl("RadioButtonListSMS"), RadioButtonList).SelectedValue
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        PanelAviso.Visible = False
        idTelefoneLabel.Text = ""
        If Session("idCadastroUser") = 0 Then
            Response.Redirect("/_candidato/cadastro.aspx")
        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewCONTATO.SelectedIndexChanged
        idTelefoneLabel.Text = GridViewCONTATO.SelectedDataKey("idTelefone")
    End Sub

End Class
