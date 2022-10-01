Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports geraProtocolo

Partial Class _parceiroJobClick_contratoOnline
    Inherits System.Web.UI.Page

    Dim Cabec As String = ""

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Cabec = Request.QueryString("plano")

        If Not IsPostBack Then
            LabelCabec.Text = LabelCabec.Text & Cabec
            CONTRATO(Cabec)
        End If

    End Sub

    Sub CONTRATO(CONTRATO As String) ' PEGA O CONTRATO RELACIONADO AO SERVIÇO

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_CONTRATO_ONLINE_TEMP", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@TipoContrato", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@TipoContrato").Value = CONTRATO

        Try

            cn.Open()

            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Read()

            ContratoLabel.Text = Replace(Replace(Replace(Replace(Replace(Replace(Replace(dr("Contrato"), "#CLIENTE#", Session("nmempresa")), "#CNPJ#", Session("cnpj")), "#LOGRADOURO#", Session("endereco") & Session("numero") & " - " & Session("bairro") & " - " & Session("cidade")), "#IE#", "ISENTO"), "#DIA#", Day(Now)), "#MES#", MonthName(Month(Now))), "#ANO#", Year(Now))

            dr.Close()
            cn.Close()

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LinkButtonACEITE_Click(sender As Object, e As EventArgs) Handles LinkButtonACEITE.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_CONTRATO_ONLINE_TEMP", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@TipoContrato", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@TipoContrato").Value = Request.QueryString("plano")

        prm = New SqlParameter("@gravaContrato", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@gravaContrato").Value = 1

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

        prm = New SqlParameter("@copiaContrato", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@copiaContrato").Value = ContratoLabel.Text


        Try

            cn.Open()

            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Close()
            cn.Close()

        Catch ex As Exception

        End Try

        Dim txtDescricaoMovimento As String = ""
        Dim txtDescricaoStatus As String = ""

        txtDescricaoMovimento = "Contrato"
        txtDescricaoStatus = "Pendente de pagamento"

        Dim txtNossoNumeroBoleto As String = ""
        Dim txtNumeroDocumentoBoleto As String = ""

        Dim myNumeroDocumento As New geraProtocolo
        Dim myNossoNumero As New geraProtocolo

        txtNossoNumeroBoleto = myNossoNumero.nossonumero(Session("idSetup"))
        txtNumeroDocumentoBoleto = myNumeroDocumento.NumeroDocumento(Session("idSetup"))

        REM ** **************************************************************************
        REM ** REDIRECIONA PARA A IMPRESSÃO DO BOLETO
        REM ** **************************************************************************
        Response.Redirect("comprar.aspx?NossoNumeroBoleto=" & txtNossoNumeroBoleto & "&NumeroDocumento=" & txtNumeroDocumentoBoleto & "&valor=" & Request.QueryString("valor") & "&idVagaPublica=0" & "&txtDescricaoMovimento=" & txtDescricaoMovimento & "&txtDescricaoStatus=" & txtDescricaoStatus & "&txtTipo=P" & "&TipoProduto=" & Cabec)

    End Sub
End Class
