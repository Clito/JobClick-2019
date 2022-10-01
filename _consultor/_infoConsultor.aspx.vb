
Partial Class _empresa_infoConsultor
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        LabelCabec.Text = Request.QueryString("autoTit")
        Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")

        If idCadastroEmpresaFilha = "" Then
            Response.Redirect("Default.aspx")
        End If
    End Sub


    Protected Sub SqlDataSource3_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource3.Updated
        GridView1.DataBind()
    End Sub

    Protected Sub SqlDataSource3_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource3.Inserted
        GridView1.DataBind()
    End Sub

    Protected Sub SqlDataSource3_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource3.Deleted
        GridView1.DataBind()
    End Sub

    Protected Sub SqlDataSource6_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource6.Updated
        GridView2.DataBind()
    End Sub

    Protected Sub SqlDataSource6_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource6.Inserted
        GridView2.DataBind()
    End Sub

    Protected Sub SqlDataSource6_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource6.Deleted
        GridView1.DataBind()
        GridView2.DataBind()
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
        e.Command.Parameters("@idRH").Value = CType(FormView2.FindControl("DropDownList2"), DropDownList).SelectedValue

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
        e.Command.Parameters("@idRH").Value = CType(FormView2.FindControl("DropDownList2"), DropDownList).SelectedValue

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        idUserLabel.Text = GridView1.SelectedDataKey("idUser")
    End Sub

End Class
