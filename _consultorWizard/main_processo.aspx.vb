
Partial Class _empresa__processo_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        idProcessoSeletivolbl.Text = Session("idRH_Gestor")
        If Session("idRH_Gestor") <> "" Then
            GridView1.DataSourceID = "SqlProcessoSeletivoViewGestor"
        End If
    End Sub

    Protected Sub DDidvaga_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        If Session("idRH_Gestor") <> "" Then
            CType(FormView1.FindControl("DDidvaga"), DropDownList).DataSourceID = "SqlVagaGestor"
        Else
            CType(FormView1.FindControl("DDidvaga"), DropDownList).DataSourceID = "SqlVaga"
        End If
    End Sub

    Protected Sub SqlProcessoSeletivoForm_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlProcessoSeletivoForm.Inserting
        e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")
    End Sub


    Protected Sub SqlProcessoSeletivoForm_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlProcessoSeletivoForm.Inserted
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        idProcessoSeletivolbl.Text = GridView1.SelectedValue.ToString
    End Sub

    Protected Sub DDGestor_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("DDGestor"), DropDownList).Items.Insert(0, "Selecione um consultor")
        If Session("idRH_Gestor") <> "" Then
            CType(FormView1.FindControl("DDGestor"), DropDownList).DataSourceID = "SqlGestor_Gestor"
        End If
    End Sub

    Protected Sub SqlProcessoSeletivoForm_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlProcessoSeletivoForm.Updated
        GridView1.DataBind()
    End Sub

End Class
