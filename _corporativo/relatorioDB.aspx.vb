Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Web.Configuration
Imports System.Web.Script.Serialization
Imports chartPIEService



Partial Class _corporativo_relatorio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        idCadastroEmpresaLabel.Text = "17"

        CHART_INSTITUICAO.Visible = False

        REM ** **********************************************************************************************
        REM ** FECHA TODOS OS PAINEIS
        REM ** **********************************************************************************************

        If Not IsPostBack Then

            PanelRELATORIO.Visible = False

            REL_FaixaEtaria.Visible = False
            REL_Trabalhando.Visible = False
            REL_LocalPreferencia.Visible = False
            REL_InstituicaoProcessoSeletivo.Visible = False
            REL_InstituicaoEnsino.Visible = False
            CHART_INSTITUICAO.Visible = False
            REL_CBOCandidato.Visible = False
            REL_CBOVaga.Visible = False
            REL_Origem_Cadastramento.Visible = False
            REL_VagaAbertaXFechada.Visible = False
            REL_NivelFormacaoAcademica.Visible = False
            REL_Sexo.Visible = False
            REL_Disponibilidade.Visible = False

            protocoloLabel.Text = ""

        End If

    End Sub

    Protected Sub LinkButtonPSQ_Click(sender As Object, e As System.EventArgs) Handles LinkButtonPSQ.Click, LinkButtonPesquisar.Click, LinkButtonPesquisar0.Click

        RunChart()

    End Sub

    Private Sub chart_bind(chartPrimeiroParametro As Int16, proc As String, nroparametro As Int16, parametro1 As String, parametro2 As String, parametro3 As String, parametro4 As String, chartPrimeiraLinha As String, chartCampo1 As String, chartCampo2 As String, chartCampo3 As String, chartCampo4 As String, chartCampo5 As String, chartnumeroCampo As String)

        REM ** **************************************************************************************************************************************************************
        REM ** REFERÊNCIA: "[['Total', 'Fechadas', 'Abertas'],['2004',  1000, 400], ['2005',  1170, 460],['2006',  660, 1120],['2007',  1030, 540]]"
        REM ** **************************************************************************************************************************************************************

        Dim selectSQL As String = ""

        Select Case True
            Case nroparametro = 0
                selectSQL = "EXEC [" & proc & "]"
            Case nroparametro = 1
                selectSQL = "EXEC [" & proc & "]" & parametro1
            Case nroparametro = 2
                If IsNumeric(parametro2) Then
                    selectSQL = "EXEC [" & proc & "]" & parametro1 & "," & parametro2
                Else
                    selectSQL = "EXEC [" & proc & "]" & parametro1 & "," & "'" & parametro2 & "'"
                End If
            Case nroparametro = 3
                selectSQL = "EXEC [" & proc & "]" & parametro1 & "," & parametro2 & "," & parametro3
            Case nroparametro = 4
                selectSQL = "EXEC [" & proc & "]" & parametro1 & "," & parametro2 & "," & parametro3 & "," & parametro4
        End Select

        LabelSQL.Text = selectSQL

        Dim str As New StringBuilder()
        Dim connectionString As String = WebConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString
        Dim con As New SqlConnection(connectionString)
        Dim cmdGV As New SqlCommand(selectSQL, con)
        Dim adp As New SqlDataAdapter(cmdGV)
        Dim dt As New DataTable()

        adp.Fill(dt)
        str.Append(chartPrimeiraLinha)

        Dim i As Int32

        Try
            Select Case True
                Case chartnumeroCampo = 1
                    For i = 0 To dt.Rows.Count - 1
                        str.Append("[")
                        If chartPrimeiroParametro = 1 Then
                            str.Append("'" & dt.Rows(i)(Trim(chartCampo1)) & "',")
                        Else
                            str.Append(dt.Rows(i)(Trim(chartCampo1)) & ",")
                        End If
                        str.Append("],")
                    Next
                Case chartnumeroCampo = 2
                    For i = 0 To dt.Rows.Count - 1
                        str.Append("[")
                        If chartPrimeiroParametro = 1 Then
                            str.Append("'" & dt.Rows(i)(Trim(chartCampo1)) & "',")
                        Else
                            str.Append(dt.Rows(i)(Trim(chartCampo1)) & ",")
                        End If
                        str.Append(dt.Rows(i)(Trim(chartCampo2)))
                        str.Append("],")
                    Next
                Case chartnumeroCampo = 3
                    For i = 0 To dt.Rows.Count - 1
                        str.Append("[")
                        If chartPrimeiroParametro = 1 Then
                            str.Append("'" & dt.Rows(i)(Trim(chartCampo1)) & "',")
                        Else
                            str.Append(dt.Rows(i)(Trim(chartCampo1)) & ",")
                        End If
                        str.Append(dt.Rows(i)(Trim(chartCampo2)) & ",")
                        str.Append(dt.Rows(i)(Trim(chartCampo3)))
                        str.Append("],")
                    Next
                Case chartnumeroCampo = 4
                    For i = 0 To dt.Rows.Count - 1
                        str.Append("[")
                        If chartPrimeiroParametro = 1 Then
                            str.Append("'" & dt.Rows(i)(Trim(chartCampo1)) & "',")
                        Else
                            str.Append(dt.Rows(i)(Trim(chartCampo1)) & ",")
                        End If
                        str.Append(dt.Rows(i)(Trim(chartCampo2)) & ",")
                        str.Append(dt.Rows(i)(Trim(chartCampo3)) & ",")
                        str.Append(dt.Rows(i)(Trim(chartCampo4)))
                        str.Append("],")
                    Next
                Case chartnumeroCampo = 5
                    For i = 0 To dt.Rows.Count - 1
                        str.Append("[")
                        If chartPrimeiroParametro = 1 Then
                            str.Append("'" & dt.Rows(i)(Trim(chartCampo1)) & "',")
                        Else
                            str.Append(dt.Rows(i)(Trim(chartCampo1)) & ",")
                        End If
                        str.Append(dt.Rows(i)(Trim(chartCampo2)) & ",")
                        str.Append(dt.Rows(i)(Trim(chartCampo3)) & ",")
                        str.Append(dt.Rows(i)(Trim(chartCampo4)) & ",")
                        str.Append(dt.Rows(i)(Trim(chartCampo5)))
                        str.Append("],")
                    Next
            End Select

            str.Append("]")
            parametroLabel.Text = Replace(str.ToString(), "],]", "]]")

            con.Close()

        Catch
        Finally
            con.Close()
        End Try

    End Sub

    Protected Sub LinkButtonLIMPAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonLIMPAR.Click

        TextBoxPesquisaRELATORIO.Text = ""
        protocoloLabel.Text = ""
        parametroLabel.Text = ""

        PanelRELATORIO.Visible = False

        REL_FaixaEtaria.Visible = False
        REL_Trabalhando.Visible = False
        REL_LocalPreferencia.Visible = False
        REL_InstituicaoProcessoSeletivo.Visible = False
        REL_InstituicaoEnsino.Visible = False
        CHART_INSTITUICAO.Visible = False
        REL_CBOCandidato.Visible = False
        REL_CBOVaga.Visible = False
        REL_Origem_Cadastramento.Visible = False
        REL_VagaAbertaXFechada.Visible = False
        REL_NivelFormacaoAcademica.Visible = False
        REL_Sexo.Visible = False
        REL_Disponibilidade.Visible = False


    End Sub

    Protected Sub GridViewREL_LocalPreferencia0_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewREL_LocalPreferencia0.SelectedIndexChanged
        protocoloLabel.Text = GridViewREL_LocalPreferencia0.SelectedDataKey("Protocolo")
        CHART_INSTITUICAO.Visible = True
        RunChart()
    End Sub

    Sub RunChart()

        Dim procedureTipo As String = ""
        Dim selectSQL As String = ""

        Dim chartPrimeiraLinha As String = ""
        Dim parametro1 As String = ""
        Dim parametro2 As String = ""
        Dim parametro3 As String = ""
        Dim parametro4 As String = ""
        Dim chartCampo1 As String = ""
        Dim chartCampo2 As String = ""
        Dim chartCampo3 As String = ""
        Dim chartCampo4 As String = ""
        Dim chartCampo5 As String = ""
        Dim chartnumeroCampo As Int32 = 0
        Dim chartPrimeiroParametro As Int32 = 0
        Dim filtro As String = ""

        LabeldsRelatorio.Text = TextBoxPesquisaRELATORIO.Text
        PanelRELATORIO.Visible = True

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_MONTA_RELATORIO]", cn)

        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@relatorio", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@relatorio").Value = TextBoxPesquisaRELATORIO.Text

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows Then
            dr.Read()

            procedureTipo = dr("procedureTipo")
            chartPrimeiraLinha = dr("chartPrimeiraLinha")
            chartModeloLabel.Text = dr("chartModelo")
            parametro1 = dr("parametro1")
            parametro2 = dr("parametro2")
            parametro3 = dr("parametro3")
            parametro4 = dr("parametro4")
            chartCampo1 = dr("chartCampo1")
            chartCampo2 = dr("chartCampo2")
            chartCampo3 = dr("chartCampo3")
            chartCampo4 = dr("chartCampo4")
            chartCampo5 = dr("chartCampo5")
            chartnumeroCampo = dr("chartnumeroCampo")
            chartPrimeiroParametro = dr("chartPrimeiroParametro")
            filtro = dr("filtro")
            descritivoLabel.Text = dr("descritivo")

            procedureTipoLabel.Text = procedureTipo

            Select Case True

                REM ** ***************************************************************************************************************************************************************************************************************************************************************************

                Case dr("procedureTipo") = "REL_FaixaEtaria"
                    If DropDownListBASE.SelectedValue = "" Then
                        DropDownListBASE.SelectedValue = "Exclusiva"
                    End If
                    REL_FaixaEtaria.Visible = True
                    PanelFaixa.Visible = True

                    selectSQL = "EXEC [" & procedureTipo & "] " & TextBoxDE.Text & " , " & TextBoxATE.Text & " , " & idCadastroEmpresaLabel.Text & " , " & DropDownListBASE.SelectedValue
                    chart_bind(chartPrimeiroParametro, "REL_FaixaEtaria", 4, TextBoxDE.Text, TextBoxATE.Text, idCadastroEmpresaLabel.Text, DropDownListBASE.SelectedValue, chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                    REM ** ***************************************************************************************************************************************************************************************************************************************************************************

                Case dr("procedureTipo") = "REL_Trabalhando"
                    REL_Trabalhando.Visible = True
                    selectSQL = "EXEC [" & procedureTipo & "]"
                    chart_bind(chartPrimeiroParametro, "REL_Trabalhando", 0, "", "", "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                    REM ** ***************************************************************************************************************************************************************************************************************************************************************************

                Case dr("procedureTipo") = "REL_LocalPreferencia"
                    REL_LocalPreferencia.Visible = True
                    selectSQL = "EXEC [" & procedureTipo & "]"
                    chart_bind(chartPrimeiroParametro, "REL_LocalPreferencia", 0, "", "", "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                    REM ** ***************************************************************************************************************************************************************************************************************************************************************************

                Case dr("procedureTipo") = "REL_InstituicaoProcessoSeletivo"
                    REL_InstituicaoProcessoSeletivo.Visible = True
                    selectSQL = "EXEC [" & procedureTipo & "]" & idCadastroEmpresaLabel.Text

                    REM ** ***************************************************************************************************************************************************************************************************************************************************************************
                    REM ** ESTA PS UTILIZA NAVEGAÇÃO
                    REM ** ***************************************************************************************************************************************************************************************************************************************************************************
                    If protocoloLabel.Text <> "" Then
                        chart_bind(chartPrimeiroParametro, "REL_InstituicaoProcessoSeletivo", 2, idCadastroEmpresaLabel.Text, protocoloLabel.Text, "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)
                    End If
                    REM ** ***************************************************************************************************************************************************************************************************************************************************************************
                    REM ** [FIM] - ESTA PS UTILIZA NAVEGAÇÃO
                    REM ** ***************************************************************************************************************************************************************************************************************************************************************************

                Case dr("procedureTipo") = "REL_InstituicaoEnsino"
                    REL_InstituicaoEnsino.Visible = True
                    selectSQL = "EXEC [" & procedureTipo & "]"
                    chart_bind(chartPrimeiroParametro, "REL_InstituicaoEnsino", 0, "", "", "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                    REM ** ***************************************************************************************************************************************************************************************************************************************************************************

                Case dr("procedureTipo") = "REL_CBOCandidato"
                    REL_CBOCandidato.Visible = True
                    selectSQL = "EXEC [" & procedureTipo & "] 5,''," & idCadastroEmpresaLabel.Text
                    'chart_bind(chartPrimeiroParametro, "REL_CBOCandidato", 4, LabelNivel0.Text, LabelCBO.Text, idCadastroEmpresaLabel.Text, LabelBase.Text, chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                    REM ** ***************************************************************************************************************************************************************************************************************************************************************************

                Case dr("procedureTipo") = "REL_CBOVaga"
                    REL_CBOVaga.Visible = True
                    PanelREL_CBOVaga.Visible = True
                    selectSQL = "EXEC [" & procedureTipo & "]" & idCadastroEmpresaLabel.Text & "," & LabelCBO0.Text
                    chart_bind(chartPrimeiroParametro, "REL_CBOVaga", 2, idCadastroEmpresaLabel.Text, LabelBase.Text, "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                    REM ** ***************************************************************************************************************************************************************************************************************************************************************************

                Case dr("procedureTipo") = "REL_Disponibilidade"
                    REL_Disponibilidade.Visible = True
                    selectSQL = "EXEC [" & procedureTipo & "]"
                    chart_bind(chartPrimeiroParametro, "REL_Disponibilidade", 0, "", "", "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                    REM ** ***************************************************************************************************************************************************************************************************************************************************************************

                Case dr("procedureTipo") = "REL_Sexo"
                    REL_Sexo.Visible = True
                    selectSQL = "EXEC [" & procedureTipo & "]"
                    chart_bind(chartPrimeiroParametro, "REL_Sexo", 0, "", "", "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                    REM ** ***************************************************************************************************************************************************************************************************************************************************************************

                Case dr("procedureTipo") = "REL_NivelFormacaoAcademica"
                    REL_NivelFormacaoAcademica.Visible = True
                    selectSQL = "EXEC [" & procedureTipo & "]"
                    chart_bind(chartPrimeiroParametro, "REL_NivelFormacaoAcademica", 0, "", "", "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                    REM ** ***************************************************************************************************************************************************************************************************************************************************************************

                Case dr("procedureTipo") = "REL_VagaAbertaXFechada"
                    REL_VagaAbertaXFechada.Visible = True
                    If TextBoxANO.Text = "" Then
                        TextBoxANO.Text = Year(Now())
                    End If
                    selectSQL = "EXEC [" & procedureTipo & "] " & TextBoxANO.Text & "," & idCadastroEmpresaLabel.Text
                    chart_bind(chartPrimeiroParametro, "REL_VagaAbertaXFechada", 2, TextBoxANO.Text, idCadastroEmpresaLabel.Text, "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                    REM ** ***************************************************************************************************************************************************************************************************************************************************************************

                Case dr("procedureTipo") = "REL_Origem_Cadastramento"
                    REL_Origem_Cadastramento.Visible = True
                    selectSQL = "EXEC [" & procedureTipo & "]"
                    chart_bind(chartPrimeiroParametro, "REL_Origem_Cadastramento", 0, "", "", "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                    REM ** ***************************************************************************************************************************************************************************************************************************************************************************

                Case dr("procedureTipo") = "REL_ProcessoSeletivo"
                    selectSQL = "EXEC [" & procedureTipo & "]" & idCadastroEmpresaLabel.Text
                    chart_bind(chartPrimeiroParametro, "REL_ProcessoSeletivo", 1, idCadastroEmpresaLabel.Text, "", "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                Case dr("procedureTipo") = "REL_FaseProcessoSeletivo"
                    selectSQL = "EXEC [" & procedureTipo & "]" & idProcessoSeletivoLabel.Text
                    'chart_bind(chartPrimeiroParametro, "REL_FaseProcessoSeletivo", 1, idCadastroEmpresaLabel.Text, "", "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                Case Else
                    selectSQL = "EXEC _USP_MENSAGEM_RELATORIO"

            End Select

        End If
        dr.Close()

        cn.Close()

        REM ** 
        REM ** CARREGA O GRIDVIEW

        Dim connectionString As String = WebConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString
        Dim con As New SqlConnection(connectionString)

        Dim cmdGV As New SqlCommand(selectSQL, con)
        Dim adapter As New SqlDataAdapter(cmdGV)
        Dim ds As New DataSet()
        Dim dt As New DataTable()

        Dim jss As New JavaScriptSerializer()
        Dim sbRes As New StringBuilder()
        Dim ResultSet As New Hashtable

    End Sub

    Protected Sub GridViewREL_CBOCandidato_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewREL_CBOCandidato.SelectedIndexChanged

        LabelCBO.Text = GridViewREL_CBOCandidato.SelectedValue
        LabelNivel.Text = LabelNivel.Text + 1

    End Sub

    Protected Sub LinkButtonRESET_Click(sender As Object, e As System.EventArgs) Handles LinkButtonRESET.Click
        LabelNivel.Text = 1
        LabelCBO.Text = " "
    End Sub

    Protected Sub GridViewREL_CBOCandidato_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewREL_CBOCandidato.RowDataBound

        Dim mybutton As LinkButton

        Try
            If e.Row.RowType = DataControlRowType.DataRow Then
                mybutton = e.Row.FindControl("LinkButtonCBO")
                If LabelNivel.Text = "5" Then
                    mybutton.Enabled = False
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub

End Class
