Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _parceiroJobClick_alterarVaga
    Inherits System.Web.UI.Page

    Protected Sub LinkButtonPSQ_Click(sender As Object, e As EventArgs) Handles LinkButtonPSQ.Click
        PSQLabel.Text = TextBoxPSQ.Text
        GridViewVagasPublicadas.Visible = True
    End Sub

    Protected Sub LinkButtonTodas_Click(sender As Object, e As EventArgs) Handles LinkButtonTodas.Click
        PSQLabel.Text = " "
        SqlDataSourceVagasPublicas.SelectParameters("searchVaga").DefaultValue = " "
        SqlDataSourceVagasPublicas.DataBind()
        GridViewVagasPublicadas.Visible = True
    End Sub

    Protected Sub GridViewVagasPublicadas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewVagasPublicadas.SelectedIndexChanged
        idVagaPublicaLabel.Text = GridViewVagasPublicadas.SelectedDataKey("idVagaPublica")
        idADLabel.Text = GridViewVagasPublicadas.SelectedDataKey("idAD")
        referenciaLabel.Text = GridViewVagasPublicadas.SelectedDataKey("referencia")
        FormViewVagaPublica.Visible = True
        GridViewVagasPublicadas.Visible = False
    End Sub

    Protected Sub LinkButtonCargosINSERT_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub CheckBoxPNE_CheckedChanged(sender As Object, e As EventArgs)
        If CType(FormViewVagaPublica.FindControl("CheckBoxPNE"), CheckBox).Checked = True Then
            Try
                CType(FormViewVagaPublica.FindControl("titVagaPublicaTextBox"), TextBox).Text = CType(FormViewVagaPublica.FindControl("titVagaPublicaTextBox"), TextBox).Text + " - PNE"
            Catch
            End Try
            Try
                CType(FormViewVagaPublica.FindControl("titVagaPublicaEditTextBox"), TextBox).Text = CType(FormViewVagaPublica.FindControl("titVagaPublicaEditTextBox"), TextBox).Text + " - PNE"
            Catch
            End Try

            CType(FormViewVagaPublica.FindControl("dsVagaPublicaTextBox"), TextBox).Text = "- Vaga para Portadores de Necessidades Especiais -" + vbCrLf + vbCrLf + CType(FormViewVagaPublica.FindControl("dsVagaPublicaTextBox"), TextBox).Text


        ElseIf CType(FormViewVagaPublica.FindControl("CheckBoxPNE"), CheckBox).Checked = False Then
            Try
                CType(FormViewVagaPublica.FindControl("titVagaPublicaTextBox"), TextBox).Text = Replace(CType(FormViewVagaPublica.FindControl("titVagaPublicaTextBox"), TextBox).Text, " - PNE", "")
            Catch
            End Try
            Try
                CType(FormViewVagaPublica.FindControl("titVagaPublicaEditTextBox"), TextBox).Text = Replace(CType(FormViewVagaPublica.FindControl("titVagaPublicaEditTextBox"), TextBox).Text, " - PNE", "")
            Catch
            End Try

            CType(FormViewVagaPublica.FindControl("dsVagaPublicaTextBox"), TextBox).Text = Replace(CType(FormViewVagaPublica.FindControl("dsVagaPublicaTextBox"), TextBox).Text, "- Vaga para Portadores de Necessidades Especiais -" + vbCrLf + vbCrLf, "")
            CType(FormViewVagaPublica.FindControl("dsVagaPublicaTextBox"), TextBox).Text = Replace(CType(FormViewVagaPublica.FindControl("dsVagaPublicaTextBox"), TextBox).Text, "- Vaga para Portadores de Necessidades Especiais -" + vbCrLf, "")
            CType(FormViewVagaPublica.FindControl("dsVagaPublicaTextBox"), TextBox).Text = Replace(CType(FormViewVagaPublica.FindControl("dsVagaPublicaTextBox"), TextBox).Text, "- Vaga para Portadores de Necessidades Especiais -", "")
        End If
    End Sub

    Protected Sub dsVagaPublicaTextBox_DataBinding(sender As Object, e As EventArgs)
        CType(FormViewVagaPublica.FindControl("dsVagaPublicaTextBox"), TextBox).Text = Replace(CType(FormViewVagaPublica.FindControl("dsVagaPublicaTextBox"), TextBox).Text, "<br>", "")
    End Sub

    Protected Sub UpdateCancelButton_Click(sender As Object, e As EventArgs)
        If Request.QueryString("URL") <> "" Then
            Response.Redirect(Request.QueryString("URL"))
        End If
        idVagaPublicaLabel.Text = ""
        TextBoxPSQ.Text = ""
        GridViewVagasPublicadas.DataBind()
        GridViewVagasPublicadas.Visible = True
        FormViewVagaPublica.Visible = False
    End Sub

    Protected Sub LinkButtonCargos_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub SqlForm_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlForm.Updated

        REM ** CASO SEJA UMA DESPUBLICAÇÃO E A VAGA TENHA UMA PUBLICAÇÃO EM "VAGAS PATROCINADAS" SERÁ CALCULADO ESTONO
        REM ** ****************************************************************************


        REM ** ATUALIZA O AD CASO EXISTA
        REM ** ****************************************************************************

        REM ** [FIM] **********************************************************************

        If Not CType(FormViewVagaPublica.FindControl("publicarCheckBox"), CheckBox).Checked And idADLabel.Text <> "0" Then
            If idADLabel.Text <> "" Then
                ESTORNO(idADLabel.Text)
            End If
        End If

        AVISOLABEL.Text = "A vaga foi salva com sucesso!"
        AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
        ImageAVISO.ImageUrl = "~/_parceiroJobClick/images/ok.jpg"
        PanelAviso.Visible = True
        FormViewVagaPublica.Visible = False
        GridViewVagasPublicadas.Visible = True
        GridViewVagasPublicadas.DataBind()

    End Sub

    Protected Sub SqlForm_Deleted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlForm.Deleted

        REM ** CASO ESTA VAGA TENHA UMA PUBLICAÇÃO EM "VAGAS PATROCINADAS" SERÁ CALCULADO ESTONO
        REM ** ****************************************************************************

        If Not idADLabel.Text <> "0" Then
            ESTORNO(idADLabel.Text)
        End If

        AVISOLABEL.Text = "A vaga foi excluída com sucesso!"
        AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
        ImageAVISO.ImageUrl = "~/_parceiroJobClick/images/ok.jpg"
        PanelAviso.Visible = True
        FormViewVagaPublica.Visible = False
        GridViewVagasPublicadas.Visible = True
        GridViewVagasPublicadas.DataBind()
    End Sub


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        PanelAviso.Visible = False
        If Request.QueryString("idVagaPublica") <> "" Then
            idVagaPublicaLabel.Text = Request.QueryString("idVagaPublica")
            TextBoxPSQ.Text = Request.QueryString("titVagaPublica")
            SqlDataSourceVagasPublicas.SelectParameters("searchVaga").DefaultValue = TextBoxPSQ.Text
            SqlDataSourceVagasPublicas.DataBind()
            FormViewVagaPublica.Visible = True
            GridViewVagasPublicadas.Visible = False
            LinkButtonVagasPatrocinadas.Visible = True
            LinkButtonVagasPatrocinadas.PostBackUrl = Request.QueryString("URL")
            URLReturn.Value = Request.QueryString("URL")
        Else
            LinkButtonVagasPatrocinadas.Visible = False
            URLReturn.Value = "alterarVaga.aspx"
        End If
    End Sub

    Sub ESTORNO(idAD As Int32)

        Dim CreditoRes As New Credito

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter


        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_AD_ESTORNO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idAD", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idAD").Value = idAD

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        prm = New SqlParameter("@idUsuario", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idUsuario").Value = Session("idUser")

        prm = New SqlParameter("@saldo", SqlDbType.Decimal, 19, 2)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@saldo").Value = CreditoRes.RestaCreditoAD(Session("idSetup"), Session("idCadastroEmpresa"), Session("idUser"))

        prm = New SqlParameter("@CodVaga", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@CodVaga").Value = referenciaLabel.Text

        cn.Open()

        Try

            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Close()

        Catch ex As Exception

        End Try

        cn.Close()

    End Sub

    Protected Sub GridViewVagasPublicadas_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridViewVagasPublicadas.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim flgAprovado As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "topAn"))
            Dim flgPublicar As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "publicar"))
            Dim flgidVagaPublica As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "idVagaPublica"))

            Dim myImageButtonSelect As New ImageButton
            myImageButtonSelect = e.Row.FindControl("ImageButtonSelect")

            Select Case flgAprovado
                Case "1"
                    e.Row.BackColor = Drawing.Color.YellowGreen ' AD OK.
                    myImageButtonSelect.ImageUrl = "~/_parceiroJobClick/images/viewDescricaoOK.png"
                    myImageButtonSelect.ToolTip = "Vaga anunciada no Vagas Patrocinadas"
                    myImageButtonSelect.PostBackUrl = "analytics.aspx"
                Case "0"
                    e.Row.BackColor = Drawing.Color.LightGray  '  NO AD.
            End Select

            Select Case flgPublicar
                Case False
                    e.Row.BackColor = System.Drawing.Color.FromName("#ffa9a9")  'Não publicada.
                    myImageButtonSelect.ImageUrl = "~/_parceiroJobClick/images/viewDescricao.png"
                    myImageButtonSelect.ToolTip = "Vaga não está publicada."
                    myImageButtonSelect.PostBackUrl = "alterarVaga.aspx?idVagaPublica=" & flgidVagaPublica
            End Select

        End If
    End Sub

    Protected Sub SqlForm_Updating(sender As Object, e As SqlDataSourceCommandEventArgs) Handles SqlForm.Updating
        e.Command.Parameters("@dsVagaPublica").Value = Replace(CType(FormViewVagaPublica.FindControl("dsVagaPublicaTextBox"), TextBox).Text, Chr(13) + Chr(10), " ")

        ATUALIZA_AD(Replace(CType(FormViewVagaPublica.FindControl("dsVagaPublicaTextBox"), TextBox).Text, Chr(13) + Chr(10), " "))

    End Sub

    Sub ATUALIZA_AD(dsVaga As String)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter


        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_AD_ATUALIZA_VAGAPUBLICA", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idVagaPublica", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idVagaPublica").Value = idVagaPublicaLabel.Text

        prm = New SqlParameter("@dsVaga", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@dsVaga").Value = dsVaga

        prm = New SqlParameter("@confirma", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@confirma").Value = 1


        cn.Open()

        Try

            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Close()

        Catch ex As Exception

        End Try

        cn.Close()

    End Sub
End Class
