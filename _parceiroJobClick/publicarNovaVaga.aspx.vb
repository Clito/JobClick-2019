Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports checkdigit
Imports System.DBNull
Imports geraProtocolo

Partial Class _parceiroJobClick_publicarNovaVaga
    Inherits System.Web.UI.Page
    Dim myProtocolo As New geraProtocolo


    Protected Sub SqlForm_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlForm.Inserting
        e.Command.Parameters("@dsVagaPublica").Value = Replace(CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text, Chr(10), "<br>")

        e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa").ToString
        e.Command.Parameters("@idfuncao").Value = 0 'idCBOOcupacaoLabel.Text
        e.Command.Parameters("@dsVagaPublica").Value = Replace(CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text, Chr(13) + Chr(10), " ") 'CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text
        e.Command.Parameters("@data").Value = Now()
        e.Command.Parameters("@uf").Value = CType(FormViewVaga.FindControl("DropDownListUF"), DropDownList).SelectedItem.Text

        e.Command.Parameters("@codigo").Value = CType(FormViewVaga.FindControl("referenciaTextBox"), TextBox).Text

        If CType(FormViewVaga.FindControl("referenciaTextBox"), TextBox).Text <> "" Then
            e.Command.Parameters("@codigo").Value = CType(FormViewVaga.FindControl("referenciaTextBox"), TextBox).Text
            e.Command.Parameters("@referencia").Value = CType(FormViewVaga.FindControl("referenciaTextBox"), TextBox).Text
        Else
            e.Command.Parameters("@codigo").Value = Year(Now()) & "E0001-NF"
            e.Command.Parameters("@referencia").Value = Year(Now()) & "E0001-NF"
        End If

    End Sub

    Protected Sub SqlForm_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlForm.Updated
        GridViewListaVagas.DataBind()
        AVISOLABEL.Text = "A vaga foi atualizada com sucesso!"
        AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
        ImageAVISO.ImageUrl = "~/_parceiroJobClick/images/ok.jpg"
        PanelAviso.Visible = True
    End Sub

    Protected Sub SqlForm_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlForm.Deleted
        GridViewListaVagas.DataBind()
        AVISOLABEL.Text = "A vaga foi excluída com sucesso!"
        AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
        ImageAVISO.ImageUrl = "~/_parceiroJobClick/images/ok.jpg"
        PanelAviso.Visible = True
    End Sub

    Protected Sub SqlForm_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlForm.Inserted
        GridViewListaVagas.DataBind()
        AVISOLABEL.Text = "A vaga foi publicada com sucesso!"
        AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
        ImageAVISO.ImageUrl = "~/_parceiroJobClick/images/ok.jpg"
        PanelAviso.Visible = True
        PSQlb.Visible = True
        REM ** *******************************************
        REM ** LIMPA OS DADOS DO FORMULÁRIO
        REM ** *******************************************
        Try
            CType(FormViewVaga.FindControl("titVagaPublicaEditTextBox"), TextBox).Text = ""
            CType(FormViewVaga.FindControl("idCBOOcupacaoTextBox"), TextBox).Text = ""
            CType(FormViewVaga.FindControl("emailTextBox"), TextBox).Text = ""
            CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text = ""
        Catch ex As Exception

        End Try
        FormViewVaga.Visible = False
    End Sub

    Protected Sub SqlForm_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlForm.Updating
        e.Command.Parameters("@dsVagaPublica").Value = Replace(CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text, Chr(10), "<br>")
    End Sub

    Protected Sub dsVagaPublicaTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text = Replace(CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text, "<br>", Chr(10))
    End Sub

    Protected Sub ImageButtonPSQ_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
        PanelPSQ.Visible = False
        FormViewVaga.Visible = True
    End Sub

    Protected Sub GridViewListaVagas_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewListaVagas.SelectedIndexChanged
        idVagaPublicaLabel.Text = GridViewListaVagas.SelectedDataKey("idVagaPublica")
        FormViewVaga.Visible = True
        FormViewVaga.DefaultMode = FormViewMode.Edit
    End Sub

    Protected Sub PSQlb_Click(sender As Object, e As System.EventArgs) Handles PSQlb.Click
        PanelPSQ.Visible = True
        idVagaPublicaLabel.Text = ""
    End Sub

    Protected Sub GridViewPsqCargo_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewPsqCargo.SelectedIndexChanged

        FormViewVaga.Visible = True
        FormViewVaga.ChangeMode(FormViewMode.Insert)

        idfuncaoLabel.Text = GridViewPsqCargo.SelectedDataKey("idfuncao")
        dsfuncaoLabel.Text = GridViewPsqCargo.SelectedDataKey("dsfuncao")

        idCBOOcupacaoLabel.Text = GridViewPsqCargo.SelectedDataKey("idCBOOcupacao")
        dsCBOOcupacaoLabel.Text = GridViewPsqCargo.SelectedDataKey("dsCBOOcupacao")
        dsCBOSinonimoLabel.Text = GridViewPsqCargo.SelectedDataKey("dsCBOSinonimo")

        CargoCBO.Visible = False
        textPesquisa.Value = ""

        Try
            CType(FormViewVaga.FindControl("titVagaPublicaEditTextBox"), TextBox).Text = dsCBOSinonimoLabel.Text
            CType(FormViewVaga.FindControl("idCBOOcupacaoTextBox"), TextBox).Text = idCBOOcupacaoLabel.Text
            CType(FormViewVaga.FindControl("emailTextBox"), TextBox).Text = Session("emailRes")
            CType(FormViewVaga.FindControl("LocalTrabalhoTextBox"), TextBox).Text = CidadeLabel.Text
            CType(FormViewVaga.FindControl("DropDownListUF"), DropDownList).SelectedValue = EstadoLabel.Text
            CType(FormViewVaga.FindControl("nroVagasTextBox"), TextBox).Text = "1"
            CType(FormViewVaga.FindControl("validadeTextBoxINSERT"), TextBox).Text = Format(Date.Now.AddDays(25), "dd/M/yyyy")
            REM ** GERA NUMERO DE PROTOCOLO
            CType(FormViewVaga.FindControl("referenciaTextBox"), TextBox).Text = myProtocolo.getNrProtocoloEmpresa(Session("idSetup"))

        Catch ex As Exception

        End Try

    End Sub

    Protected Sub LinkButtonCancelar_Click(sender As Object, e As System.EventArgs)
        idVagaPublicaLabel.Text = ""
    End Sub

    Protected Sub CheckBoxPNE_CheckedChanged(sender As Object, e As System.EventArgs)
        If CType(FormViewVaga.FindControl("CheckBoxPNE"), CheckBox).Checked = True Then
            Try
                CType(FormViewVaga.FindControl("titVagaPublicaTextBox"), TextBox).Text = CType(FormViewVaga.FindControl("titVagaPublicaTextBox"), TextBox).Text + " - PNE"
            Catch
            End Try
            Try
                CType(FormViewVaga.FindControl("titVagaPublicaEditTextBox"), TextBox).Text = CType(FormViewVaga.FindControl("titVagaPublicaEditTextBox"), TextBox).Text + " - PNE"
            Catch
            End Try

            CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text = "- Vaga para Portadores de Necessidades Especiais -" + vbCrLf + vbCrLf + CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text


        ElseIf CType(FormViewVaga.FindControl("CheckBoxPNE"), CheckBox).Checked = False Then
            Try
                CType(FormViewVaga.FindControl("titVagaPublicaTextBox"), TextBox).Text = Replace(CType(FormViewVaga.FindControl("titVagaPublicaTextBox"), TextBox).Text, " - PNE", "")
            Catch
            End Try
            Try
                CType(FormViewVaga.FindControl("titVagaPublicaEditTextBox"), TextBox).Text = Replace(CType(FormViewVaga.FindControl("titVagaPublicaEditTextBox"), TextBox).Text, " - PNE", "")
            Catch
            End Try

            CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text = Replace(CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text, "- Vaga para Portadores de Necessidades Especiais -" + vbCrLf + vbCrLf, "")
            CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text = Replace(CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text, "- Vaga para Portadores de Necessidades Especiais -" + vbCrLf, "")
            CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text = Replace(CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text, "- Vaga para Portadores de Necessidades Especiais -", "")
        End If
    End Sub

    Protected Sub LinkButtonPESQUISAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonPESQUISAR.Click
        PSQlb.Visible = False
        PanelPSQ.Visible = False
        textPesquisaLabel.Text = textPesquisa.Value
        CargoCBO.Visible = True
    End Sub

    Protected Sub UpdateCancelButton_Click(sender As Object, e As System.EventArgs)
        CargoCBO.Visible = False
        FormViewVaga.Visible = False
        PanelPSQ.Visible = True
        PanelAviso.Visible = False
        PanelCargosRelacionados.Visible = False
        PSQlb.Visible = False
    End Sub

    Protected Sub LinkButtonCargos_Click(sender As Object, e As System.EventArgs)
        Try
            idCBOOcupacaoLabel.Text = CType(FormViewVaga.FindControl("idCBOOcupacaoTextBoxEdit"), TextBox).Text
            PanelCargosRelacionados.Visible = True
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LinkButtonCargosINSERT_Click(sender As Object, e As System.EventArgs)
        Try
            idCBOOcupacaoLabel.Text = idCBOOcupacaoLabel.Text
            PanelCargosRelacionados.Visible = True
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LinkButtonPular_Click(sender As Object, e As EventArgs) Handles LinkButtonPular.Click, LinkButtonPular0.Click

        FormViewVaga.Visible = True
        FormViewVaga.ChangeMode(FormViewMode.Insert)
        PanelPSQ.Visible = False
        PSQlb.Visible = False
        Try
            CType(FormViewVaga.FindControl("emailTextBox"), TextBox).Text = Session("emailRes")
            CType(FormViewVaga.FindControl("titVagaPublicaEditTextBox"), TextBox).Enabled = True
            CType(FormViewVaga.FindControl("LocalTrabalhoTextBox"), TextBox).Text = CidadeLabel.Text
            CType(FormViewVaga.FindControl("DropDownListUF"), DropDownList).SelectedValue = EstadoLabel.Text
            CType(FormViewVaga.FindControl("nroVagasTextBox"), TextBox).Text = "1"
            CType(FormViewVaga.FindControl("validadeTextBoxINSERT"), TextBox).Text = Format(Date.Now.AddDays(25), "dd/M/yyyy")
            CType(FormViewVaga.FindControl("referenciaTextBox"), TextBox).Text = myProtocolo.getNrProtocoloEmpresa(Session("idSetup"))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        CType(FormViewVaga.FindControl("UpdateButton"), LinkButton).Attributes.Add("onclick", "this.disabled='true';")

        If Request.QueryString("idMoleloVagaPublica") <> "" Then
            GetVAGA(Request.QueryString("idMoleloVagaPublica"))
        End If

        FormViewVaga.Visible = True
        PanelAviso.Visible = False
        PanelCargosRelacionados.Visible = False
        PSQlb.Visible = False
        CargoCBO.Visible = False

        REM ** ******************************************************************************
        REM ** GEO LOCALIZAÇÃO DA EMPRESA
        REM ** ******************************************************************************

        If Session("ip") <> "::1" Then
            lipClient.Text = Session("ip")
        Else
            lipClient.Text = "186.214.103.64"
        End If

        Dim LocUsuario As analyticsMask = New analyticsMask
        LocUsuario = analytics.analyticsRegion(lipClient.Text)

        ipLabel.Text = LocUsuario.IPRes
        CidadeLabel.Text = LocUsuario.City
        EstadoLabel.Text = LocUsuario.RegionName
        UFLabel.Text = LocUsuario.RegionCode
        PaisLabel.Text = LocUsuario.CountryCode

        REM ** ******************************************************************************
        REM ** [FIM] - GEO LOCALIZAÇÃO DA EMPRESA
        REM ** ******************************************************************************

    End Sub

    Sub GetVAGA(idMoleloVagaPublica As Int32)

        REM ** VAGA (MODELO)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_MODELO_VAGA", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idMoleloVagaPublica", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idMoleloVagaPublica").Value = idMoleloVagaPublica

        Try

            cn.Open()

            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Read()

            CType(FormViewVaga.FindControl("referenciaTextBox"), TextBox).Text = myProtocolo.getNrProtocoloEmpresa(Session("idSetup"))
            CType(FormViewVaga.FindControl("titVagaPublicaEditTextBox"), TextBox).Enabled = True
            CType(FormViewVaga.FindControl("titVagaPublicaEditTextBox"), TextBox).Text = dr("titulo")
            CType(FormViewVaga.FindControl("dsVagaPublicaTextBox"), TextBox).Text = Replace(dr("dsVagaModelo"), "<br>", Chr(10))
            CType(FormViewVaga.FindControl("LocalTrabalhoTextBox"), TextBox).Text = CidadeLabel.Text
            CType(FormViewVaga.FindControl("DropDownListUF"), DropDownList).SelectedValue = EstadoLabel.Text
            CType(FormViewVaga.FindControl("nroVagasTextBox"), TextBox).Text = "1"
            CType(FormViewVaga.FindControl("validadeTextBoxINSERT"), TextBox).Text = Format(Date.Now.AddDays(25), "dd/M/yyyy")
            CType(FormViewVaga.FindControl("emailTextBox"), TextBox).Text = Session("emailRes")

            TextBoxPsq.Text = dr("titulo")

            FormViewVaga.Visible = True

            dr.Close()
            cn.Close()

        Catch ex As Exception

        End Try

    End Sub

End Class
