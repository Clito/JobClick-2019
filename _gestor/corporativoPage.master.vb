Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _corporativo_corporativoPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

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

        Dim idRH_Gestor As String = Session("idRH_Gestor")
        If idRH_Gestor <> "" Then
            If Request.QueryString("Info") <> "" Then
                Select Case Request.QueryString("Info")
                    Case "10"
                        ApresentaCabec.Text = "Menu Principal"
                        LinkButtonMP.ToolTip = "Clique aqui para voltar ao menu principal"
                        LinkButtonMP.Attributes.Add("style", "font-weight:bold")
                        'LinkButtonMP.PostBackUrl = "~/_corporativo/Default.aspx?Info=10"
                        LimpaPREVIEWVAGA()
                    Case "20"
                        ApresentaCabec.Text = "Dados da Empresa"
                        HyperLinkNOVAVAGA.ToolTip = "Clique aqui para atualizar os dados de sua empresa"
                        HyperLinkNOVAVAGA.Attributes.Add("style", "font-weight:bold")
                        'HyperLinkNOVAVAGA.NavigateUrl = "~/_corporativo/cadastroVaga.aspx?Info=20"
                    Case "30"
                        ApresentaCabec.Text = "Indicação"
                        LinkButtonPESQUISAVAGA.ToolTip = "Clique aqui para indicar um profissional para uma oportunidade"
                        LinkButtonPESQUISAVAGA.Attributes.Add("style", "font-weight:bold")
                        'LinkButtonPESQUISAVAGA.PostBackUrl = "~/_corporativo/pesquisaVaga.aspx?Info=30"
                        LimpaPREVIEWVAGA()
                    Case "40"
                        ApresentaCabec.Text = "Outlook (Mensagens do Consultor)"
                        LinkButtonPESQUISAPS.ToolTip = "Clique aqui para responder as solicitações do Consultor"
                        LinkButtonPESQUISAPS.Attributes.Add("style", "font-weight:bold")
                        'LinkButtonPESQUISAPS.PostBackUrl = "~/_corporativo/pesquisaPS.aspx?Info=40"
                        LimpaPREVIEWVAGA()
                    Case "43"
                        ApresentaCabec.Text = "Acompanhamento"
                        LinkButtonQUIZ.ToolTip = "Clique aqui para ver o andamento do Processo Seletivo"
                        LinkButtonQUIZ.Attributes.Add("style", "font-weight:bold")
                        'LinkButtonQUIZ.PostBackUrl = "~/_corporativo/quiz.aspx?Info=43"
                        LimpaPREVIEWVAGA()
                    Case "60"
                        ApresentaCabec.Text = "Encerrar seus trabalhos"
                        LinkButtonLOGOUT.ToolTip = "Clique aqui para encerrar as suas atividades"
                        LinkButtonLOGOUT.Attributes.Add("style", "font-weight:bold")
                        'LinkButtonLOGOUT.PostBackUrl = "~/_corporativo/logout.aspx?Info=60"
                        LimpaPREVIEWVAGA()
                    Case "100"
                        ApresentaCabec.Text = "Salas Virtuais"
                End Select
            Else
                ApresentaCabec.Text = "Menu Principal"
                LinkButtonMP.ToolTip = "Clique aqui para voltar ao menu principal"
                LinkButtonMP.Attributes.Add("style", "font-weight:bold")
                LinkButtonMP.PostBackUrl = "~/_corporativo/Default.aspx?Info=10"
            End If
        Else
            Response.Redirect("/")
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

