
Partial Class _empresa_anuncioVaga
    Inherits System.Web.UI.Page

    Dim myReplace As New ReplaceForm

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        LabelCabec.Text = Request.QueryString("autoTit")
        Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")

        If idCadastroEmpresaFilha = "" Then
            Response.Redirect("Default.aspx")
        End If

    End Sub

    Protected Sub DropDownListEmpresa_DataBound(sender As Object, e As System.EventArgs) Handles DropDownListEmpresa.DataBound
        If Not IsPostBack Then
            Try
                Dim myDropDownListEmpresa As DropDownList = DropDownListEmpresa
                myDropDownListEmpresa.Items.Insert(0, New ListItem("-- Selecione uma empresa --", ""))
                myDropDownListEmpresa.SelectedValue = Session("idCadastroEmpresaFilha")
                Try
                    NomeEmpresaLabel.Text = "Empresa selecionada <b>" & myDropDownListEmpresa.SelectedItem.Text & "</b>"
                    idCadastroEmpresaFilhaLabel.Text = myDropDownListEmpresa.SelectedValue
                Catch ex As Exception

                End Try
            Catch ex As Exception

            End Try
        End If
    End Sub

    Protected Sub FecharGridView_Click(sender As Object, e As System.EventArgs)
        iddsempresaLabel.Text = ""
    End Sub

    Protected Sub DropDownListEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownListEmpresa.SelectedIndexChanged
        idCadastroEmpresaFilhaLabel.Text = DropDownListEmpresa.SelectedValue
        Session("idCadastroEmpresaFilha") = idCadastroEmpresaFilhaLabel.Text
        NomeEmpresaLabel.Text = "<b>Empresa selecionada " & DropDownListEmpresa.SelectedItem.Text & "</b>"
    End Sub

    Protected Sub GridViewAnuncioApr_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewAnuncioApr.SelectedIndexChanged
        iddsempresaLabel.Text = GridViewAnuncioApr.SelectedDataKey("iddsempresa")
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

    Protected Sub FormViewApresentaAnuncio_DataBound(sender As Object, e As System.EventArgs) Handles FormViewApresentaAnuncio.DataBound
        Try
            CType(FormViewApresentaAnuncio.FindControl("dsempresaVagaTextBox"), TextBox).Text = myReplace.ReplaceIn(CType(FormViewApresentaAnuncio.FindControl("dsempresaVagaTextBox"), TextBox).Text)
            CType(FormViewApresentaAnuncio.FindControl("msnCandidatoTextBox"), TextBox).Text = myReplace.ReplaceIn(CType(FormViewApresentaAnuncio.FindControl("msnCandidatoTextBox"), TextBox).Text)
            CType(FormViewApresentaAnuncio.FindControl("msnCandidatoFimTextBox"), TextBox).Text = myReplace.ReplaceIn(CType(FormViewApresentaAnuncio.FindControl("msnCandidatoFimTextBox"), TextBox).Text)
        Catch ex As Exception

        End Try
    End Sub

End Class
