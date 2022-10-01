Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _corporativo_quiz
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        PanelAviso.Visible = False
    End Sub

    Protected Sub GridViewQuiz_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewQuiz.SelectedIndexChanged
        idQuizLabel.Text = GridViewQuiz.SelectedDataKey("idQuiz")
        idPerguntaQuizLabel.Text = ""
        idRespostaQuizLabel.Text = ""
    End Sub

    Protected Sub LinkButtonFechar_Click(sender As Object, e As System.EventArgs)
        idQuizLabel.Text = "0"
    End Sub

    Protected Sub SqlDataViewQuizFORM_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataViewQuizFORM.Inserted
        GridViewQuiz.DataBind()
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Avaliação incluída com sucesso!<br>"
        AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
        ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
    End Sub

    Protected Sub SqlDataViewQuizFORM_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataViewQuizFORM.Updated
        GridViewQuiz.DataBind()
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Avaliação atualizada com sucesso!<br>"
        AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
        ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
    End Sub


    Protected Sub SqlDataViewQuizFORM_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs)
        GridViewQuiz.DataBind()
    End Sub

    Protected Sub GridViewPergunta_SelectedIndexChanged(sender As Object, e As System.EventArgs)
        Try
            idPerguntaQuizLabel.Text = CType(FormViewQUIZ.FindControl("GridViewPergunta"), GridView).SelectedDataKey("idPerguntaQuiz")
            idRespostaQuizLabel.Text = CType(FormViewQUIZ.FindControl("GridViewPergunta"), GridView).SelectedDataKey("idRespostaQuiz")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub SqlDataViewQuizRespostaFORM_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs)

        e.Command.Parameters("@idQuiz").Value = idQuizLabel.Text
        If idPerguntaQuizLabel.Text <> "" Then
            e.Command.Parameters("@idPerguntaQuiz").Value = idPerguntaQuizLabel.Text
        Else
            e.Command.Parameters("@idPerguntaQuiz").Value = "0"
        End If
        e.Command.Parameters("@idRespostaQuiz").Value = "0"

    End Sub

    Protected Sub SqlDataViewQuizRespostaFORM_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs)
        CType(FormViewQUIZ.FindControl("GridViewPergunta"), GridView).DataBind()
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Resposta incluída com sucesso!<br>"
        AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
        ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
    End Sub

    Protected Sub SqlDataViewQuizRespostaFORM_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs)
        CType(FormViewQUIZ.FindControl("GridViewPergunta"), GridView).DataBind()
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Resposta atualizada com sucesso!<br>"
        AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
        ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"
    End Sub

    Protected Sub LinkButtonFecharForm_Click(sender As Object, e As System.EventArgs)
        idPerguntaQuizLabel.Text = ""
        idRespostaQuizLabel.Text = ""
    End Sub

    Protected Sub FormViewQUIZ_DataBound(sender As Object, e As System.EventArgs) Handles FormViewQUIZ.DataBound
        Try
            If CType(FormViewQUIZ.FindControl("publicarLabel"), Label).Text = 0 Then
                CType(FormViewQUIZ.FindControl("publicarLabel"), Label).Text = "Não Publicado"
            Else
                CType(FormViewQUIZ.FindControl("publicarLabel"), Label).Text = "Publicado"
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub FormViewPerguntaResposta_DataBound(sender As Object, e As System.EventArgs)
        Try
            If idPerguntaQuizLabel.Text <> "" Then
                Dim myFormViewPerguntaResposta As FormView = CType(FormViewQUIZ.FindControl("FormViewPerguntaResposta"), FormView)
                CType(myFormViewPerguntaResposta.FindControl("perguntaQuizTextBoxI"), TextBox).ToolTip = "Apenas preencha a resposta para a pergunta selecionada."
                CType(myFormViewPerguntaResposta.FindControl("perguntaQuizTextBoxI"), TextBox).Enabled = False
                CType(myFormViewPerguntaResposta.FindControl("RequiredFieldValidatorP"), RequiredFieldValidator).Visible = False
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub SqlDataViewQuizFORM_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataViewQuizFORM.Inserting
        e.Command.Parameters("@idSetup").Value = Session("idSetup")
        e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")
        e.Command.Parameters("@dataQuiz").Value = Now()
    End Sub

    Protected Sub LinkButtonExcluir_Click(sender As Object, e As System.EventArgs)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_QUIZ_EMPRESA_DELETE_PERGUNTA]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idRespostaQuiz", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRespostaQuiz").Value = idRespostaQuizLabel.Text

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            cn.Close()

        Catch ex As Exception

        End Try

        CType(FormViewQUIZ.FindControl("GridViewPergunta"), GridView).DataBind()
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Resposta excluída com sucesso!<br>"
        AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
        ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"

    End Sub


    Protected Sub GridViewPergunta_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs)

    End Sub
End Class
