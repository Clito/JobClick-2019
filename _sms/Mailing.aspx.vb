
Partial Class _modulo_Mailing
    Inherits System.Web.UI.Page

    Dim myMontaMailing As MontaMailingMask = New MontaMailingMask

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("idGroup") = "" Then
            Response.Redirect("Grupo.aspx")
        Else
            idGroupLabel.Text = Request.QueryString("idGroup")
            Session("tituloBanner") = "Mailing " & Request.QueryString("strNameGroup")
        End If

    End Sub

    Protected Sub SqlDataForm_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataForm.Inserting
        e.Command.Parameters("@FKidClient").Value = Session("idClient")
        e.Command.Parameters("@FKidGroup").Value = idGroupLabel.Text
        e.Command.Parameters("@flgActive").Value = True
        e.Command.Parameters("@ROW_FKidUserCreate").Value = Session("idUser_SMS")
        e.Command.Parameters("@ROW_datCreate").Value = Now()
    End Sub

    Protected Sub SqlDataForm_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataForm.Updating
        e.Command.Parameters("@FKidClient").Value = Session("idClient")
        e.Command.Parameters("@FKidGroup").Value = idGroupLabel.Text
        e.Command.Parameters("@ROW_FKidUserAlter").Value = Session("idUser_SMS")
        e.Command.Parameters("@ROW_datAlter").Value = Now()
        e.Command.Parameters("@ROW_FKidUserCreate").Value = Session("idUser_SMS")
        e.Command.Parameters("@ROW_datCreate").Value = Now()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        idMailingLabel.Text = GridView1.SelectedValue
    End Sub

    Protected Sub SqlDataForm_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataForm.Updated
        GridView1.DataBind()
    End Sub

    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound
        myMontaMailing = MontaMailing.MontaMailingForm(Session("idClient"), Session("idProject"), idGroupLabel.Text)
        Try
            If myMontaMailing.IncDynamicFieldTag1.ToString <> "" Then
                CType(FormView1.FindControl("DynamicFieldValue1Label"), Label).Text = myMontaMailing.IncDynamicFieldTag1.ToString & ":<br>"
            Else
                CType(FormView1.FindControl("DynamicFieldValue1TextBox"), TextBox).Visible = False
                CType(FormView1.FindControl("DynamicFieldValue1Label"), Label).Visible = False
            End If
        Catch ex As Exception

        End Try

        Try
            If myMontaMailing.IncDynamicFieldTag2.ToString <> "" Then
                CType(FormView1.FindControl("DynamicFieldValue2Label"), Label).Text = "<br>" & myMontaMailing.IncDynamicFieldTag2.ToString & ":<br>"
            Else
                CType(FormView1.FindControl("DynamicFieldValue2TextBox"), TextBox).Visible = False
                CType(FormView1.FindControl("DynamicFieldValue2Label"), Label).Visible = False
            End If
        Catch ex As Exception

        End Try

        Try
            If myMontaMailing.IncDynamicFieldTag3.ToString <> "" Then
                CType(FormView1.FindControl("DynamicFieldValue3Label"), Label).Text = "<br>" & myMontaMailing.IncDynamicFieldTag3.ToString & ":<br>"
            Else
                CType(FormView1.FindControl("DynamicFieldValue3TextBox"), TextBox).Visible = False
                CType(FormView1.FindControl("DynamicFieldValue3Label"), Label).Visible = False
            End If
        Catch ex As Exception

        End Try

        Try
            If myMontaMailing.IncDynamicFieldTag4.ToString <> "" Then
                CType(FormView1.FindControl("DynamicFieldValue4Label"), Label).Text = "<br>" & myMontaMailing.IncDynamicFieldTag4.ToString & ":<br>"
            Else
                CType(FormView1.FindControl("DynamicFieldValue4TextBox"), TextBox).Visible = False
                CType(FormView1.FindControl("DynamicFieldValue4Label"), Label).Visible = False
            End If
        Catch ex As Exception

        End Try

        Try
            If myMontaMailing.IncDynamicFieldTag5.ToString <> "" Then
                CType(FormView1.FindControl("DynamicFieldValue5Label"), Label).Text = "<br>" & myMontaMailing.IncDynamicFieldTag5.ToString & ":<br>"
            Else
                CType(FormView1.FindControl("DynamicFieldValue5TextBox"), TextBox).Visible = False
                CType(FormView1.FindControl("DynamicFieldValue5Label"), Label).Visible = False
            End If
        Catch ex As Exception

        End Try

        Try
            If myMontaMailing.IncDynamicFieldTag6.ToString <> "" Then
                CType(FormView1.FindControl("DynamicFieldValue6Label"), Label).Text = "<br>" & myMontaMailing.IncDynamicFieldTag6.ToString & ":<br>"
            Else
                CType(FormView1.FindControl("DynamicFieldValue6TextBox"), TextBox).Visible = False
                CType(FormView1.FindControl("DynamicFieldValue6Label"), Label).Visible = False
            End If
        Catch ex As Exception

        End Try

        Try
            If myMontaMailing.IncDynamicFieldTag7.ToString <> "" Then
                CType(FormView1.FindControl("DynamicFieldValue7Label"), Label).Text = "<br>" & myMontaMailing.IncDynamicFieldTag7.ToString & ":<br>"
            Else
                CType(FormView1.FindControl("DynamicFieldValue7TextBox"), TextBox).Visible = False
                CType(FormView1.FindControl("DynamicFieldValue7Label"), Label).Visible = False
            End If
        Catch ex As Exception

        End Try

        Try
            If myMontaMailing.IncDynamicFieldTag8.ToString <> "" Then
                CType(FormView1.FindControl("DynamicFieldValue8Label"), Label).Text = "<br>" & myMontaMailing.IncDynamicFieldTag8.ToString & ":<br>"
            Else
                CType(FormView1.FindControl("DynamicFieldValue8TextBox"), TextBox).Visible = False
                CType(FormView1.FindControl("DynamicFieldValue8Label"), Label).Visible = False
            End If
        Catch ex As Exception

        End Try

        Try
            If myMontaMailing.IncDynamicFieldTag9.ToString <> "" Then
                CType(FormView1.FindControl("DynamicFieldValue9Label"), Label).Text = "<br>" & myMontaMailing.IncDynamicFieldTag9.ToString & ":<br>"
            Else
                CType(FormView1.FindControl("DynamicFieldValue9TextBox"), TextBox).Visible = False
                CType(FormView1.FindControl("DynamicFieldValue9Label"), Label).Visible = False
            End If
        Catch ex As Exception

        End Try

        Try
            If myMontaMailing.IncDynamicFieldTag10.ToString <> "" Then
                CType(FormView1.FindControl("DynamicFieldValue10Label"), Label).Text = "<br>" & myMontaMailing.IncDynamicFieldTag10.ToString & ":<br>"
            Else
                CType(FormView1.FindControl("DynamicFieldValue10TextBox"), TextBox).Visible = False
                CType(FormView1.FindControl("DynamicFieldValue10Label"), Label).Visible = False
            End If
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub SqlDataForm_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataForm.Inserted
        GridView1.DataBind()
    End Sub

    Protected Sub SqlDataForm_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataForm.Deleted
        GridView1.DataBind()
    End Sub
End Class
