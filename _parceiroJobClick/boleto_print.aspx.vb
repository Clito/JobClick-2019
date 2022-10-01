Imports BoletoNet
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _parceiroJobClick_boleto_print
    Inherits System.Web.UI.Page


    Dim txtTipo As String = "A"
    Dim pagamentoConfirmado As Int32 = 1

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim txtDescricaoMovimento As String = ""
        Dim txtDescricaoStatus As String = ""

        If Not IsPostBack Then

            REM ** **************************************************************************
            REM ** LÓGICA DE DATA DE VENCIMENTO
            REM ** SE FOR ATÉ 12:00:00 O PAGAMENTO É NO DIA
            REM ** APÓS AS 12:00:00 A DATA SERÁ PARA O DIA SEGUINTE
            REM ** **************************************************************************

            txtTipo = "A"

            If Hour(Now()) > 12 Then
                Dim DataVencimento As Date
                DataVencimento = New DateTime(Year(Now()), Month(Now()), Day(Now())).ToString("dd/MM/yyyy")
                txtVencimento.Text = DataVencimento.AddDays(1)
            Else
                txtVencimento.Text = New DateTime(Year(Now()), Month(Now()), Day(Now())).ToString("dd/MM/yyyy")
            End If

            txtValorBoleto.Text = Request.QueryString("ValorBoleto")
            txtNumeroDocumentoBoleto.Text = Replace(Request.QueryString("NumeroDocumento"), "-", "")
            idVagaPublicaLabel.Text = Request.QueryString("idVagaPublica")

            'Cedente
            txtCodigoCedente.Text = "627120"
            txtNossoNumeroBoleto.Text = Replace(Request.QueryString("NossoNumeroBoleto"), "-", "")
            txtCPFCNPJ.Text = "02.775.679/0001-16"
            txtNomeCedente.Text = "Cheyenne Estúdio Multimídia Ltda. (JobClick)"
            txtAgenciaCendente.Text = "0740"
            txtContaCedente.Text = "62712"

            'Sacado
            txtCPFCNPJSacado.Text = Session("cnpj")
            txtNomeSacado.Text = Session("nmempresa")
            txtEnderecoSacado.Text = Session("endereco") & Session("numero")
            txtBairroSacado.Text = Session("bairro")
            txtCidadeSacado.Text = Session("cidade")
            txtCEPSacado.Text = Session("cep")
            txtUFSacado.Text = Session("uf")

            txtDescricaoMovimento = Request.QueryString("txtDescricaoMovimento")
            txtDescricaoStatus = Request.QueryString("txtDescricaoStatus")

            RegistraBOLETO(txtDescricaoMovimento, txtDescricaoStatus)
            PrintBOLETO()
        Else
            enviaBOLETO()
            Response.Redirect("vagaPatrocinada.aspx")
        End If


    End Sub


    Sub RegistraBOLETO(txtDescricaoMovimento As String, txtDescricaoStatus As String)
        REM ** ***********************************************************************************
        REM ** VIZUALIZAÇÃO DO BOLETO É REGISTRADO O CRÉDITO NA CONTA DA EMPRESA (PROMESSA)
        REM ** ***********************************************************************************

        Dim CreditoRes As New Credito

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_AD_EXTRATO_CREDITO]", cn)
        cmd.CommandType = CommandType.StoredProcedure


        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

        prm = New SqlParameter("@idVagaPublica", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idVagaPublica").Value = idVagaPublicaLabel.Text

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        prm = New SqlParameter("@idUsuario", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idUsuario").Value = Session("idUser")

        prm = New SqlParameter("@SALDO", SqlDbType.Decimal, 18, 2)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@SALDO").Value = CreditoRes.RestaCreditoAD(Session("idSetup"), Session("idCadastroEmpresa"), Session("idUser"))

        prm = New SqlParameter("@txtVencimento", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtVencimento").Value = txtVencimento.Text

        prm = New SqlParameter("@txtValorBoleto", SqlDbType.Decimal, 18, 2)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtValorBoleto").Value = txtValorBoleto.Text

        prm = New SqlParameter("@txtNumeroDocumentoBoleto", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtNumeroDocumentoBoleto").Value = txtNumeroDocumentoBoleto.Text

        prm = New SqlParameter("@txtCodigoCedente", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtCodigoCedente").Value = txtCodigoCedente.Text

        prm = New SqlParameter("@txtNossoNumeroBoleto", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtNossoNumeroBoleto").Value = txtNossoNumeroBoleto.Text

        prm = New SqlParameter("@txtCPFCNPJ", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtCPFCNPJ").Value = txtCPFCNPJ.Text

        prm = New SqlParameter("@txtNomeCedente", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtNomeCedente").Value = txtNomeCedente.Text

        prm = New SqlParameter("@txtAgenciaCendente", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtAgenciaCendente").Value = txtAgenciaCendente.Text

        prm = New SqlParameter("@txtContaCedente", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtContaCedente").Value = txtContaCedente.Text

        prm = New SqlParameter("@txtCPFCNPJSacado", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtCPFCNPJSacado").Value = txtCPFCNPJSacado.Text

        prm = New SqlParameter("@txtNomeSacado", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtNomeSacado").Value = txtNomeSacado.Text

        prm = New SqlParameter("@txtEnderecoSacado", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtEnderecoSacado").Value = txtEnderecoSacado.Text

        prm = New SqlParameter("@txtBairroSacado", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtBairroSacado").Value = txtBairroSacado.Text

        prm = New SqlParameter("@txtCidadeSacado", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtCidadeSacado").Value = txtCidadeSacado.Text

        prm = New SqlParameter("@txtCEPSacado", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtCEPSacado").Value = txtCEPSacado.Text

        prm = New SqlParameter("@txtUFSacado", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtUFSacado").Value = txtUFSacado.Text

        prm = New SqlParameter("@txtDescricaoMovimento", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtDescricaoMovimento").Value = txtDescricaoMovimento

        prm = New SqlParameter("@txtDescricaoStatus", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtDescricaoStatus").Value = txtDescricaoStatus

        prm = New SqlParameter("@txtTipo", SqlDbType.Char, 1)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtTipo").Value = txtTipo

        prm = New SqlParameter("@pagamentoConfirmado", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@pagamentoConfirmado").Value = pagamentoConfirmado

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

    End Sub
    Sub PrintBOLETO()

        'Informa os dados do cedente
        Dim c = New Cedente(txtCPFCNPJ.Text, txtNomeCedente.Text, txtAgenciaCendente.Text, txtContaCedente.Text)
        'Dependendo da carteira, é necessário informar o código do cedente (o banco que fornece)
        c.Codigo = CInt(txtCodigoCedente.Text)

        'Dados para preenchimento do boleto (data de vencimento, valor, carteira e nosso número)
        Dim b = New Boleto(CDate(txtVencimento.Text), CDbl(txtValorBoleto.Text), "109", txtNossoNumeroBoleto.Text, c)

        'Dependendo da carteira, é necessário o número do documento
        b.NumeroDocumento = txtNumeroDocumentoBoleto.Text

        'Informa os dados do sacado
        b.Sacado = New Sacado(txtCPFCNPJSacado.Text, txtNomeSacado.Text)
        b.Sacado.Endereco.End = txtEnderecoSacado.Text
        b.Sacado.Endereco.Bairro = txtBairroSacado.Text
        b.Sacado.Endereco.Cidade = txtCidadeSacado.Text
        b.Sacado.Endereco.CEP = txtCEPSacado.Text
        b.Sacado.Endereco.UF = txtUFSacado.Text

        Dim i As New Instrucao_Itau()
        i.Descricao = "Não Receber após o vencimento"
        b.Instrucoes.Add(i)

        'Espécie do Documento - [R] Recibo
        b.EspecieDocumento = New EspecieDocumento_Itau(99)

        Dim bb As New BoletoBancario()
        bb.CodigoBanco = 341 '-> Referente ao código do Santander
        bb.Boleto = b
        bb.MostrarCodigoCarteira = True
        bb.Boleto.Valida()

        'true -> Mostra o compravante de entrega
        'false -> Oculta o comprovante de entrega
        bb.MostrarComprovanteEntrega = False

        panelDados.Visible = False

        If panelBoleto.Controls.Count = 0 Then
            panelBoleto.Controls.Add(bb)
        End If

        '03399.08063 49800.000330 32007.101028 8 41680000065640 -> correta
        '03399.08063 49800.000330 32007.101028 8 41680000065640
        '03399.08063 49800.000330 32007.101028 1 41680000065640
        '03399.08063 49800.003334 20071.301012 6 41680000065640
        '03399.08063 49800.000330 32007.101028 1 41680000065640

        '03399.08063 49800.003334 20071.301020 4 41680000065640
        '03399.08063 49800.003334 20071.301020 4 41680000065640


    End Sub

    Sub enviaBOLETO()

        Dim myEmailEmpresa As New user
        Dim emailEmpresa As String = myEmailEmpresa.GetEMAIL(Session("idCadastroEmpresa"))

        Dim myEmailProspect As New email
        Dim HTML_Usuario As String = ""
        HTML_Usuario = HTML_Usuario & "<p>A/C: " & txtNomeSacado.Text & ":<br></p>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<p>Obrigado por comprar créditos do JobClick.<br />" & Chr(10)
        HTML_Usuario = HTML_Usuario & "Neste momento foi liberado seus créditos para serem utilizados na divulgação de vagas e em outros serviços disponibilizado para sua empresa.<br />" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<br />" & Chr(10)
        HTML_Usuario = HTML_Usuario & "Para emitir uma segunda via deste boleto copie e cole em seu navegador o link abaixo:<br />" & Chr(10)
        HTML_Usuario = HTML_Usuario & "http://www.jobclick.com.br/_parceiroJobClick/boleto_print_email.aspx?NumeroDocumento=" & txtNumeroDocumentoBoleto.Text & "<br />" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<br />" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<p>Agradecemos pela atenção,<br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "Departamento Comercial JobClick<br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<b>Obs.:</b><br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "Caso não tenha feita esta solicitação, pedimos para avisar o ocorrido para que possamos tomar as providências cabíveis.<br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "<br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "comercial@jobclick.com.br<br>" & Chr(10)
        HTML_Usuario = HTML_Usuario & "</p>" & Chr(10)

        Dim HTML_Comercial As String = ""
        HTML_Comercial = HTML_Comercial & "Foi emitido no sistema JobClick boleto para a compra de créditos<br />" & Chr(10)
        HTML_Comercial = HTML_Comercial & "<strong>Nome da Empresa:</strong> " & txtNomeSacado.Text & "<br>" & Chr(10)

        myEmailProspect.EnviamensagemSQL(HTML_Usuario, txtNomeSacado.Text, emailEmpresa, "Contato Comercial JobClick")
        myEmailProspect.EnviamensagemSQL(HTML_Comercial, "Contato comercial", "comercial@jobclick.com.br", "Emissão de boleto JobClick.")

    End Sub

End Class
