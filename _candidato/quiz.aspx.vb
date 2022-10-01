Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient

Partial Class _usuario_quiz
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        DataListQUIZ.DataBind()
        PanelAviso.Visible = False
    End Sub

    Protected Sub DataListQUIZ_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataListQUIZ.SelectedIndexChanged
        PanelQUIZSELECIONADO.Visible = True
        idQuizLabel.Text = DataListQUIZ.SelectedValue
        idperguntaquizLabel.Text = ""
        DataListQUIZ.Visible = False
        horaINILabel.Text = Now()
    End Sub

    Protected Sub GridViewQuestoes_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewQuestoes.SelectedIndexChanged

        idRespostaLabel.Text = GridViewQuestoes.SelectedDataKey("idRespostaQuiz")
        idQuizLabel.Text = GridViewQuestoes.SelectedDataKey("idQuiz")
        idperguntaquizLabel.Text = GridViewQuestoes.SelectedDataKey("idPerguntaQuiz")

        REM ** *********************************************************************************************
        REM ** GRAVA A RESPOSTA DO CANDIDATO
        REM ** *********************************************************************************************

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_QUIZ_CANDIDATO_GRAVA_RESPOSTA]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idQuiz", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idQuiz").Value = idQuizLabel.Text

        prm = New SqlParameter("@idPerguntaQuiz", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idPerguntaQuiz").Value = idperguntaquizLabel.Text

        prm = New SqlParameter("@idRespostaQuiz", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRespostaQuiz").Value = idRespostaLabel.Text

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        prm = New SqlParameter("@idUser", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idUser").Value = Session("idUser")

        prm = New SqlParameter("@horaINI", SqlDbType.DateTime)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@horaINI").Value = horaINILabel.Text

        prm = New SqlParameter("@DeltaT", SqlDbType.Decimal)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@DeltaT").Value = DateDiff(DateInterval.Second, CDate(horaINILabel.Text), Now())

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                If dr("C") = "1" Then
                    SqlQUIZ.DataBind()
                    SqlQUIZSELECIONADO.DataBind()
                    DataListINTERNO.DataBind()
                    GridViewQuestoes.Visible = False
                    PanelAviso.Visible = True
                    AVISOLABEL.Text = "• " & dr("MENSAGEM") & "<br>"
                    AVISOLABEL.CssClass = "msnOK"
                    ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
                    horaINILabel.Visible = False
                    DataListQUIZ.DataBind()
                    DataListQUIZ.Visible = True
                End If
            End If

        Catch ex As Exception

        Finally
            cn.Close()
        End Try

        horaINILabel.Text = Now()
        GridViewQuestoes.DataBind()

    End Sub

    Protected Sub GridViewQuestoes_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewQuestoes.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("[_USP_QUIZ_CANDIDATO_LIMPA_PERGUNTA_RESPONDIDA]", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idUser", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idUser").Value = Session("idUser")

            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows Then
                While dr.Read()
                    Dim myidPerguntaQuiz As Int32 = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "idPerguntaQuiz"))
                    If dr("idPerguntaQuiz") = myidPerguntaQuiz Then
                        e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#b5d7b4")
                        e.Row.Visible = False
                    End If
                End While
            End If
            cn.Close()

        End If

    End Sub

    Protected Sub LinkButtonCANCELARDentro_Click(sender As Object, e As System.EventArgs)

    End Sub
End Class
