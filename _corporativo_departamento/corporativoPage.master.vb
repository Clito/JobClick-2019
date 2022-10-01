Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _corporativo_corporativoPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        REM ** ************************************************************************************
        REM ** ASSOCIADOS (Session("liberaQtdCad"))
        REM ** PARA OS ASSOCIADOS, VERIFICAÇÃO DA QUANTIDADE DE PROCESSOS SELETIVOS EM CRÉDITO
        REM ** VERIFICAÇÃO DO TIPO DE CONTA: 
        REM ** (ANUAL): DATA DO TÉRMINO DO CONTRATO
        REM ** (DEMANDA): QUANTIDADE DE CRÉDITOS
        REM ** 
        REM ** AÇÃO PARA FALTA DE REGULAMENTAÇÂO
        REM ** IMPEDIR A ABERTURA DE NOVAS VAGAS COM A SESSION("libera_associado") = 0
        REM ** ************************************************************************************

        If (Session("liberaQtdCad") <= 0 And Session("idTypeUser") = "CorporativoAssociado") Then
            Session("libera_associado") = 0
            HyperLinkNOVAVAGA.Enabled = True
            HyperLinkNOVAVAGA.ToolTip = "Para iniciar os trabalhos escolha qual modalidade você irá usar"
            HyperLinkNOVAVAGA.NavigateUrl = "_creditoAssociado.aspx"
        Else
            Session("libera_associado") = 1
        End If

        REM ** ************************************************************************************
        REM ** [FIM] - ASSOCIADOS
        REM ** ************************************************************************************
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Session("idCadastroEmpresa_Layout") = Nothing Then
            Session("idCadastroEmpresa_Layout") = 1
            Session("CustomCSS") = "/* Padrão */"
        Else
            Dim rs As SqlDataReader = Nothing
            Dim SQLquery As String
            Dim conn As SqlConnection

            conn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            Dim SQLCommand As SqlCommand

            SQLquery = "SELECT ISNULL(customcss, '/* Sem CSS Custom */') as CustomCSS FROM tbSetup WHERE (idcadastroempresa = '" & Session("idCadastroEmpresa_Layout") & "')"

            conn.Open()

            SQLCommand = New SqlCommand(SQLquery, conn)
            rs = SQLCommand.ExecuteReader()

            Try

                If rs.HasRows() Then
                    rs.Read()
                    Session("CustomCSS") = rs("CustomCSS")
                Else
                    Session("CustomCSS") = ""
                End If

            Catch ex As Exception
            End Try

            rs.Close()
            conn.Close()
        End If

        Dim css As HtmlGenericControl
        css = New HtmlGenericControl
        css.TagName = "style"
        css.Attributes.Add("type", "text/css")
        css.InnerHtml = Session("CustomCSS")
        Page.Header.Controls.Add(css)

        Dim nomeEMPRESA As String = Session("nmempresa")

        If nomeEMPRESA <> "" Then
            Dim Cont As Int16 = InStr(Session("nmempresa"), " ")
            If Cont = 0 Then
                PPLabelNomeEmpresa.Text = Session("nmempresa")
            Else
                PPLabelNomeEmpresa.Text = Left(Session("nmempresa"), Cont)
            End If
        Else
            PPLabelNomeEmpresa.Text = "JobClick"
        End If


        If Request.QueryString("Info") <> "" Then
            Select Case Request.QueryString("Info")
                Case "10"
                    ApresentaCabec.Text = "Menu Principal"
                    LinkButtonMP.ToolTip = "Clique aqui para voltar ao menu principal"
                    LinkButtonMP.Attributes.Add("style", "font-weight:bold")
                    LinkButtonMP.PostBackUrl = "~/_corporativo_departamento/Default.aspx?Info=10"
                    LimpaPREVIEWVAGA()
                Case "20"
                    ApresentaCabec.Text = "Fale com o RH"
                    HyperLinkNOVAVAGA.ToolTip = "Comunicação interna com o RH"
                    HyperLinkNOVAVAGA.Attributes.Add("style", "font-weight:bold")
                    HyperLinkNOVAVAGA.NavigateUrl = "~/_corporativo_departamento/email_PerfilVaga.aspx?Info=20"
                    LimpaPREVIEWVAGA()
                Case "30"
                    ApresentaCabec.Text = "Requisição de vaga"
                    LinkButtonPESQUISAVAGA.ToolTip = "Requisição de aumento de quadro de funcionários"
                    LinkButtonPESQUISAVAGA.Attributes.Add("style", "font-weight:bold")
                    'LinkButtonPESQUISAVAGA.PostBackUrl = "~/_corporativo_departamento/cadastroVaga.aspx?Info=30"
                    LinkButtonPESQUISAVAGA.PostBackUrl = "~/_corporativo_departamento/requisitaVaga.aspx?Info=30"
                Case "40"
                    ApresentaCabec.Text = "Processo Seletivo"
                    LinkButtonPESQUISAPS.ToolTip = "Clique aqui para acompanhar os processos seletivos abertos e fechados no sistema"
                    LinkButtonPESQUISAPS.Attributes.Add("style", "font-weight:bold")
                    LinkButtonPESQUISAPS.PostBackUrl = "~/_corporativo_departamento/acompanhaPS.aspx?Info=40"
                    LimpaPREVIEWVAGA()
                Case "43"
                    ApresentaCabec.Text = "Avaliações online"
                    LinkButtonQUIZ.ToolTip = "Clique aqui para criar ou atualizar uma avaliação online"
                    LinkButtonQUIZ.Attributes.Add("style", "font-weight:bold")
                    LinkButtonQUIZ.PostBackUrl = "~/_corporativo_departamento/quiz.aspx?Info=43"
                    LimpaPREVIEWVAGA()
                Case "50"
                    ApresentaCabec.Text = "Relatórios"
                    LinkButtonRELATORIO.ToolTip = "Clique aqui para visualizar os relatórios e gráficos do sistema"
                    LinkButtonRELATORIO.Attributes.Add("style", "font-weight:bold")
                    LinkButtonRELATORIO.PostBackUrl = "~/_corporativo_departamento/relatorio.aspx?Info=50"
                    LimpaPREVIEWVAGA()
                Case "60"
                    ApresentaCabec.Text = "Encerrar seus trabalhos"
                    LinkButtonLOGOUT.ToolTip = "Clique aqui para encerrar as suas atividades"
                    LinkButtonLOGOUT.Attributes.Add("style", "font-weight:bold")
                    LinkButtonLOGOUT.PostBackUrl = "~/_corporativo_departamento/logout.aspx?Info=60"
                    LimpaPREVIEWVAGA()
                Case "100"
                    ApresentaCabec.Text = "Salas Virtuais"
            End Select
        Else
            ApresentaCabec.Text = "Menu Principal"
            LinkButtonMP.ToolTip = "Clique aqui para voltar ao menu principal"
            LinkButtonMP.Attributes.Add("style", "font-weight:bold")
            LinkButtonMP.PostBackUrl = "~/_corporativo_departamento/Default.aspx?Info=10"
        End If

    End Sub

    Sub LimpaPREVIEWVAGA()

        Dim PROTOCOLO As String = Session("protocolo")

        If PROTOCOLO <> "" Then
            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("_USP_PREVIEW_DO_ANUNCIO_VAGA_DELETE", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@Protocolo", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Protocolo").Value = PROTOCOLO

            Try
                cn.Open()
                Dim dr As SqlDataReader = cmd.ExecuteReader
                cn.Close()
            Catch ex As Exception

            End Try
            Session("protocolo") = ""
        End If

    End Sub

End Class

