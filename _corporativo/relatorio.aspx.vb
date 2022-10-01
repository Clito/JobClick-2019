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
    End Sub

    Protected Sub LinkButtonPSQ_Click(sender As Object, e As System.EventArgs) Handles LinkButtonPSQ.Click, LinkButtonPesquisar.Click, LinkButtonPesquisar0.Click

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

                Case dr("procedureTipo") = "REL_FaixaEtaria"
                    PanelFaixa.Visible = True
                    PanelAno.Visible = False
                    PanelCHATPIE.Visible = True
                    selectSQL = "EXEC [" & procedureTipo & "] " & TextBoxDE.Text & " , " & TextBoxATE.Text
                    chart_bind(chartPrimeiroParametro, "REL_FaixaEtaria", 2, TextBoxDE.Text, TextBoxATE.Text, "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                Case dr("procedureTipo") = "REL_LocalPreferencia"
                    PanelFaixa.Visible = False
                    PanelAno.Visible = False
                    PanelCHATPIE.Visible = True
                    selectSQL = "EXEC [" & procedureTipo & "]"
                    chart_bind(chartPrimeiroParametro, "REL_LocalPreferencia", 0, "", "", "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                Case dr("procedureTipo") = "REL_VagaAbertaXFechada"
                    If TextBoxANO.Text = "" Then
                        TextBoxANO.Text = Year(Now())
                    End If
                    PanelCHATPIE.Visible = True
                    PanelAno.Visible = True
                    PanelFaixa.Visible = False
                    selectSQL = "EXEC [" & procedureTipo & "] " & TextBoxANO.Text & "," & idCadastroEmpresaLabel.Text
                    chart_bind(chartPrimeiroParametro, "REL_VagaAbertaXFechada", 2, TextBoxANO.Text, idCadastroEmpresaLabel.Text, "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                Case dr("procedureTipo") = "REL_CBOCandidato"
                    PanelFaixa.Visible = False
                    PanelAno.Visible = False
                    PanelCHATPIE.Visible = False
                    selectSQL = "EXEC [" & procedureTipo & "] 1,''," & idCadastroEmpresaLabel.Text

                Case dr("procedureTipo") = "REL_CBOVaga"
                    PanelFaixa.Visible = False
                    PanelAno.Visible = False
                    PanelCHATPIE.Visible = False
                    selectSQL = "EXEC [" & procedureTipo & "]" & idCadastroEmpresaLabel.Text

                Case dr("procedureTipo") = "REL_InstituicaoProcessoSeletivo"
                    PanelFaixa.Visible = False
                    PanelAno.Visible = False
                    PanelCHATPIE.Visible = False
                    selectSQL = "EXEC [" & procedureTipo & "]" & idCadastroEmpresaLabel.Text

                Case dr("procedureTipo") = "REL_InstituicaoEnsino"
                    PanelFaixa.Visible = False
                    PanelAno.Visible = False
                    PanelCHATPIE.Visible = False
                    selectSQL = "EXEC [" & procedureTipo & "]"

                Case dr("procedureTipo") = "REL_Origem_Cadastramento"
                    PanelFaixa.Visible = False
                    PanelAno.Visible = False
                    PanelCHATPIE.Visible = True
                    selectSQL = "EXEC [" & procedureTipo & "]"
                    chart_bind(chartPrimeiroParametro, "REL_Origem_Cadastramento", 0, "", "", "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                Case dr("procedureTipo") = "REL_Trabalhando"
                    PanelFaixa.Visible = False
                    PanelAno.Visible = False
                    PanelCHATPIE.Visible = True
                    selectSQL = "EXEC [" & procedureTipo & "]"
                    chart_bind(chartPrimeiroParametro, "REL_Trabalhando", 0, "", "", "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                Case dr("procedureTipo") = "REL_ProcessoSeletivo"
                    PanelFaixa.Visible = False
                    PanelAno.Visible = False
                    PanelCHATPIE.Visible = True
                    selectSQL = "EXEC [" & procedureTipo & "]" & idCadastroEmpresaLabel.Text
                    chart_bind(chartPrimeiroParametro, "REL_ProcessoSeletivo", 1, idCadastroEmpresaLabel.Text, "", "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                Case dr("procedureTipo") = "REL_FaseProcessoSeletivo"
                    PanelFaixa.Visible = False
                    PanelAno.Visible = False
                    PanelCHATPIE.Visible = False
                    selectSQL = "EXEC [" & procedureTipo & "]" & idProcessoSeletivoLabel.Text
                    'chart_bind(chartPrimeiroParametro, "REL_FaseProcessoSeletivo", 1, idCadastroEmpresaLabel.Text, "", "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                Case dr("procedureTipo") = "REL_Sexo"
                    PanelFaixa.Visible = False
                    PanelAno.Visible = False
                    PanelCHATPIE.Visible = True
                    selectSQL = "EXEC [" & procedureTipo & "]"
                    chart_bind(chartPrimeiroParametro, "REL_Sexo", 0, "", "", "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                Case dr("procedureTipo") = "REL_NivelFormacaoAcademica"
                    PanelFaixa.Visible = False
                    PanelAno.Visible = False
                    PanelCHATPIE.Visible = True
                    selectSQL = "EXEC [" & procedureTipo & "]"
                    chart_bind(chartPrimeiroParametro, "REL_NivelFormacaoAcademica", 0, "", "", "", "", chartPrimeiraLinha, chartCampo1, chartCampo2, chartCampo3, chartCampo4, chartCampo1, chartnumeroCampo)

                Case Else
                    PanelFaixa.Visible = False
                    PanelAno.Visible = False
                    PanelCHATPIE.Visible = False
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

        Try

            adapter.Fill(ds)
            REM ** ********************************************************
            REM ** CHART (CONFIGURAÇÃO) GOOGLE
            REM ** ********************************************************

            GridViewRelatorio.DataSource = ds
            GridViewRelatorio.DataBind()

        Catch ex As Exception
            PanelCHATPIE.Visible = False
            LabeldsRelatorio.Text = "Relatório não encontrado." & Err.Description
        End Try



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
                selectSQL = "EXEC [" & proc & "]" & parametro1 & "," & parametro2
            Case nroparametro = 3
                selectSQL = "EXEC [" & proc & "]" & parametro1 & "," & parametro2 & "," & parametro3
            Case nroparametro = 4
                selectSQL = "EXEC [" & proc & "]" & parametro1 & "," & parametro2 & "," & parametro3 & "," & parametro4
        End Select


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
                        If chartPrimeiroParametro = 0 Then
                            str.Append("'" & dt.Rows(i)(Trim(chartCampo1)) & "'")
                        Else
                            str.Append(dt.Rows(i)(Trim(chartCampo1)))
                        End If
                        str.Append("],")
                    Next
                Case chartnumeroCampo = 2
                    For i = 0 To dt.Rows.Count - 1
                        str.Append("[")
                        If chartPrimeiroParametro = 0 Then
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
                        If chartPrimeiroParametro = 0 Then
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
                        If chartPrimeiroParametro = 0 Then
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
                        If chartPrimeiroParametro = 0 Then
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

    Private Sub table_bind(chartPrimeiroParametro As Int16, proc As String, nroparametro As Int16, parametro1 As String, parametro2 As String, parametro3 As String, parametro4 As String, chartPrimeiraLinha As String, chartCampo1 As String, chartCampo2 As String, chartCampo3 As String, chartCampo4 As String, chartCampo5 As String, chartnumeroCampo As String)

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
                selectSQL = "EXEC [" & proc & "]" & parametro1 & "," & parametro2
            Case nroparametro = 3
                selectSQL = "EXEC [" & proc & "]" & parametro1 & "," & parametro2 & "," & parametro3
            Case nroparametro = 4
                selectSQL = "EXEC [" & proc & "]" & parametro1 & "," & parametro2 & "," & parametro3 & "," & parametro4
        End Select


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
                        If chartPrimeiroParametro = 0 Then
                            str.Append("'" & dt.Rows(i)(Trim(chartCampo1)) & "'")
                        Else
                            str.Append(dt.Rows(i)(Trim(chartCampo1)))
                        End If
                        str.Append("],")
                    Next
                Case chartnumeroCampo = 2
                    For i = 0 To dt.Rows.Count - 1
                        str.Append("[")
                        If chartPrimeiroParametro = 0 Then
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
                        If chartPrimeiroParametro = 0 Then
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
                        If chartPrimeiroParametro = 0 Then
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
                        If chartPrimeiroParametro = 0 Then
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
            parametrotableLabel.Text = Replace(str.ToString(), "],]", "]]")

            con.Close()

        Catch
        Finally
            con.Close()
        End Try

    End Sub

    Protected Sub LinkButtonLIMPAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonLIMPAR.Click
        TextBoxPesquisaRELATORIO.Text = ""
        PanelRELATORIO.Visible = False
        PanelFaixa.Visible = False
        PanelAno.Visible = False
        PanelCHATPIE.Visible = False
    End Sub

End Class
