
Partial Class _empresa_cadastroConsultor
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        LabelCabec.Text = Request.QueryString("autoTit")

        Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")

        If idCadastroEmpresaFilha = "" Then
            Response.Redirect("Default.aspx")
        End If

    End Sub

    Protected Sub SqlDataSource3_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource3.Updating

        e.Command.Parameters("@idUser").Value = CType(FormView2.FindControl("idUserTextBox"), TextBox).Text
        e.Command.Parameters("@idCadastroEmpresa").Value = CType(FormView2.FindControl("idCadastroEmpresaTextBox"), TextBox).Text
        e.Command.Parameters("@idTypeUser").Value = CType(FormView2.FindControl("DropDownListAcesso"), DropDownList).SelectedValue
        e.Command.Parameters("@userName").Value = CType(FormView2.FindControl("usernameTextBox"), TextBox).Text
        e.Command.Parameters("@password").Value = CType(FormView2.FindControl("passwordTextBox"), TextBox).Text
        e.Command.Parameters("@email").Value = CType(FormView2.FindControl("emailTextBox"), TextBox).Text
        e.Command.Parameters("@frase").Value = CType(FormView2.FindControl("FraseTextBox"), TextBox).Text
        e.Command.Parameters("@cpf").Value = CType(FormView2.FindControl("CPFTextBox"), TextBox).Text
        e.Command.Parameters("@bloquear").Value = CType(FormView2.FindControl("bloquearCheckBox"), CheckBox).Checked
        e.Command.Parameters("@nome").Value = CType(FormView2.FindControl("nomeTextBox"), TextBox).Text
        e.Command.Parameters("@idRH").Value = CType(FormView2.FindControl("DropDownList6"), DropDownList).SelectedValue

    End Sub

    Protected Sub SqlDataSource3_Deleting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource3.Deleting
        e.Command.Parameters("@idUser").Value = idUserLabel.Text
    End Sub

    Protected Sub SqlDataSource3_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource3.Inserting

        e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")
        e.Command.Parameters("@idTypeUser").Value = CType(FormView2.FindControl("DropDownListAcesso"), DropDownList).SelectedValue
        e.Command.Parameters("@userName").Value = CType(FormView2.FindControl("usernameTextBox"), TextBox).Text
        e.Command.Parameters("@password").Value = CType(FormView2.FindControl("passwordTextBox"), TextBox).Text
        e.Command.Parameters("@email").Value = CType(FormView2.FindControl("emailTextBox"), TextBox).Text
        e.Command.Parameters("@frase").Value = CType(FormView2.FindControl("FraseTextBox"), TextBox).Text
        e.Command.Parameters("@cpf").Value = CType(FormView2.FindControl("CPFTextBox"), TextBox).Text
        e.Command.Parameters("@bloquear").Value = False
        e.Command.Parameters("@nome").Value = CType(FormView2.FindControl("nomeTextBox"), TextBox).Text
        e.Command.Parameters("@idRH").Value = CType(FormView2.FindControl("DropDownList6"), DropDownList).SelectedValue

    End Sub

End Class
