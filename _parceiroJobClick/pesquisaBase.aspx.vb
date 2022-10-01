Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports System.IO
Imports email
Imports ReplaceForm
Imports criptografia

Partial Class _parceiroJobClick_pesquisaBase
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            idFiltroDinamicoJSONLabel.Text = ""
            If Request.QueryString("idVaga") <> "" Then
                Select Case Request.QueryString("idVaga")
                    Case "0"
                        tituloVaga.Text = "Filtro para pesquisa na base geral"
                        PaneldeVagas.Visible = False
                        PanelFiltros.Visible = True
                        idVagaPublicaLabel.Text = "0"
                        idFiltroDinamicoJSONLabel.Text = ""
                        FormViewFiltros.DataBind()
                    Case Is > "0"
                        idVagaPublicaLabel.Text = Request.QueryString("idVaga")
                        GridViewFiltrosAplicados.DataBind()
                        GridViewVAGA.DataBind()
                        idFiltroDinamicoJSONLabel.Text = ""
                        FormViewFiltros.DataBind()
                        idCadastroEmpresaLabel.Text = Session("idCadastroEmpresa")
                        PaneldeVagas.Visible = True
                        PanelFiltros.Visible = False
                End Select
                idVagaPublicaLabel.Text = Request.QueryString("idVaga")
            End If
        End If
    End Sub

    Protected Sub LinkButtonVagaRelacionamento_Click(sender As Object, e As EventArgs) Handles LinkButtonVagaRelacionamento.Click
        LabelAVISOFiltro.Visible = False
        idVagaPublicaLabel.Text = ""
        GridViewFiltrosAplicados.DataBind()
        GridViewVAGA.DataBind()
        idFiltroDinamicoJSONLabel.Text = ""
        FormViewFiltros.DataBind()
        idCadastroEmpresaLabel.Text = Session("idCadastroEmpresa")
        PaneldeVagas.Visible = True
        PanelFiltros.Visible = False
    End Sub

    Protected Sub ImageButtonFechaVagas_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonFechaVagas.Click
        LabelAVISOFiltro.Visible = True
        PaneldeVagas.Visible = False
        idCadastroEmpresaLabel.Text = ""
    End Sub

    Protected Sub LinkButtonVagaGeral_Click(sender As Object, e As EventArgs) Handles LinkButtonVagaGeral.Click
        LabelAVISOFiltro.Visible = False
        tituloVaga.Text = "Filtro para pesquisa na base geral"
        PaneldeVagas.Visible = False
        PanelFiltros.Visible = True
        idVagaPublicaLabel.Text = "0"
        idFiltroDinamicoJSONLabel.Text = ""
        FormViewFiltros.DataBind()
    End Sub


    Protected Sub ImageButtonFecharFiltro_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonFecharFiltro.Click
        LabelAVISOFiltro.Visible = True
        PanelFiltros.Visible = False
        idVagaPublicaLabel.Text = ""
        GridViewFiltrosAplicados.DataBind()
        GridViewVAGA.DataBind()
    End Sub

    Protected Sub GridViewFiltrosAplicados_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewFiltrosAplicados.SelectedIndexChanged
        idFiltroDinamicoJSONLabel.Text = GridViewFiltrosAplicados.SelectedDataKey("idFiltroDinamicoJSON")
        dsFiltroDinamicoJSONLabel.Text = GridViewFiltrosAplicados.SelectedDataKey("dsFiltroDinamicoJSON")
    End Sub

    Protected Sub SqlDataSourceFiltrosAplicadosForm_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourceFiltrosAplicadosForm.Updated
        GridViewFiltrosAplicados.DataBind()
        FormViewFiltros.DataBind()
        GridViewVAGA.DataBind()
        FormViewFiltros.DefaultMode = FormViewMode.ReadOnly
    End Sub

    Protected Sub SqlDataSourceFiltrosAplicadosForm_Deleted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourceFiltrosAplicadosForm.Deleted
        GridViewFiltrosAplicados.DataBind()
        FormViewFiltros.DataBind()
        GridViewVAGA.DataBind()
        FormViewFiltros.DefaultMode = FormViewMode.ReadOnly
    End Sub

    Protected Sub SqlDataSourceFiltrosAplicadosForm_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSourceFiltrosAplicadosForm.Inserted
        GridViewFiltrosAplicados.DataBind()
        FormViewFiltros.DataBind()
        GridViewVAGA.DataBind()
        FormViewFiltros.DefaultMode = FormViewMode.ReadOnly
    End Sub

    Protected Sub GridViewVAGA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewVAGA.SelectedIndexChanged
        idVagaPublicaLabel.Text = GridViewVAGA.SelectedDataKey("idVagaPublica")
        tituloVaga.Text = "Filtro(s) para a vaga " & GridViewVAGA.SelectedDataKey("codigo") & " - " & GridViewVAGA.SelectedDataKey("titVagaPublica")
        PanelFiltros.Visible = True
        PaneldeVagas.Visible = False
        FormViewFiltros.DataBind()
        GridViewVAGA.DataBind()
        GridViewFiltrosAplicados.DataBind()
    End Sub

    Protected Sub FormViewFiltros_DataBound(sender As Object, e As EventArgs) Handles FormViewFiltros.DataBound
        Try
            CType(FormViewFiltros.FindControl("FiltroDescricaoLabel"), Label).Text = dsFiltroDinamicoJSONLabel.Text
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewVAGA_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridViewVAGA.RowDataBound
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
                    myImageButtonSelect.ToolTip = "Ver o(s) filtro(s) desta vaga. OBS.: Vaga anunciada no Vagas Patrocinadas"
                Case "0"
                    e.Row.BackColor = Drawing.Color.LightGray  '  NO AD.
                    myImageButtonSelect.ToolTip = "Ver o(s) filtro(s) desta vaga."
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

    Protected Sub SqlDataSourceFiltrosAplicadosForm_Inserting(sender As Object, e As SqlDataSourceCommandEventArgs) Handles SqlDataSourceFiltrosAplicadosForm.Inserting
        e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")
        e.Command.Parameters("@idVaga").Value = idVagaPublicaLabel.Text
    End Sub

    Protected Sub GridViewFiltrosAplicados_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridViewFiltrosAplicados.RowDataBound

        If GridViewFiltrosAplicados.Rows.Count > 0 Then
            Try
                CType(FormViewFiltros.FindControl("LinkButtonRUN_FORM"), LinkButton).Visible = True
            Catch ex As Exception
                LinkButtonPSQ_TOP.Visible = True
            End Try

            Try
                CType(FormViewFiltros.FindControl("LinkButtonPESQUISA"), LinkButton).Visible = True
            Catch ex As Exception
                LinkButtonPSQ_TOP.Visible = True
            End Try


        Else

            Try
                CType(FormViewFiltros.FindControl("LinkButtonRUN_FORM"), LinkButton).Visible = False
            Catch ex As Exception
                LinkButtonPSQ_TOP.Visible = False
            End Try

            Try
                CType(FormViewFiltros.FindControl("LinkButtonPESQUISA"), LinkButton).Visible = False
            Catch ex As Exception
                LinkButtonPSQ_TOP.Visible = False
            End Try

        End If

    End Sub


    Protected Sub LinkButtonRUN_FORM_Click(sender As Object, e As EventArgs)
        REM ** ************************************************************************************
        REM ** REDIRECIONA PARA A PÁGINA DE RESULTADOS DA PESQUISA COM OS PARÂMETROS

        Response.Redirect("resultadoPesquisa.aspx?idVaga=" & idVagaPublicaLabel.Text)

        REM ** ************************************************************************************
    End Sub

    Protected Sub LinkButtonRUN_Empty_Click(sender As Object, e As EventArgs)
        REM ** ************************************************************************************
        REM ** REDIRECIONA PARA A PÁGINA DE RESULTADOS DA PESQUISA COM OS PARÂMETROS

        Response.Redirect("resultadoPesquisa.aspx?idVaga=" & idVagaPublicaLabel.Text)

        REM ** ************************************************************************************
    End Sub


    Protected Sub LinkButtonPESQUISA_Click(sender As Object, e As EventArgs)
        REM ** ************************************************************************************
        REM ** REDIRECIONA PARA A PÁGINA DE RESULTADOS DA PESQUISA COM OS PARÂMETROS

        Response.Redirect("resultadoPesquisa.aspx?idVaga=" & idVagaPublicaLabel.Text)

        REM ** ************************************************************************************
    End Sub

    Protected Sub LinkButtonPSQ_TOP_Click(sender As Object, e As EventArgs) Handles LinkButtonPSQ_TOP.Click
        REM ** ************************************************************************************
        REM ** REDIRECIONA PARA A PÁGINA DE RESULTADOS DA PESQUISA COM OS PARÂMETROS

        Response.Redirect("resultadoPesquisa.aspx?idVaga=" & idVagaPublicaLabel.Text)

        REM ** ************************************************************************************
    End Sub

    Protected Sub GridViewFiltrosLibarados_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            CType(FormViewFiltros.FindControl("IDFiltroLiberadoTextBox"), TextBox).Text = CType(FormViewFiltros.FindControl("GridViewFiltrosLibarados"), GridView).SelectedDataKey("idFiltroDinamicoJSON_Liberado")
            CType(FormViewFiltros.FindControl("LabelInfo"), Label).Text = CType(FormViewFiltros.FindControl("GridViewFiltrosLibarados"), GridView).SelectedDataKey("informacaoSobreFiltro")
        Catch ex As Exception

        End Try
        Try
            CType(FormViewFiltros.FindControl("pesquisaTextoTextBox"), TextBox).Visible = True
            CType(FormViewFiltros.FindControl("InsertButton"), LinkButton).Visible = True
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub UpdateCancelButton_Click(sender As Object, e As EventArgs)
        idFiltroDinamicoJSONLabel.Text = ""
    End Sub
End Class
