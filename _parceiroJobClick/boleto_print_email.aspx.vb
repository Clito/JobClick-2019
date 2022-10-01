Imports BoletoNet
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Partial Class _parceiroJobClick_boleto_print_email
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        FormsAuthentication.SetAuthCookie("parceiroJobClick", False)

        If Not IsPostBack Then
            REM ** **************************************************************************
            REM ** IMPRESSÃO DE BOLETO VIA E-MAIL
            If Request.QueryString("NumeroDocumento") <> "" Then

                REM ** RECUPERA OS DADOS DO BOLETO

                Dim cn As SqlConnection
                Dim cmd As SqlCommand
                Dim prm As SqlParameter


                cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

                cmd = New SqlCommand("_USP_AD_BOLETO_SEGUNDA_VIA", cn)
                cmd.CommandType = CommandType.StoredProcedure

                prm = New SqlParameter("@txtNumeroDocumentoBoleto", SqlDbType.Int)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@txtNumeroDocumentoBoleto").Value = Request.QueryString("NumeroDocumento")

                cn.Open()

                Try

                    Dim dr As SqlDataReader = cmd.ExecuteReader

                    If dr.HasRows Then

                        dr.Read()

                        REM ** **************************************************************************
                        REM ** LÓGICA DE DATA DE VENCIMENTO
                        REM ** SE FOR ATÉ 12:00:00 O PAGAMENTO É NO DIA
                        REM ** APÓS AS 12:00:00 A DATA SERÁ PARA O DIA SEGUINTE
                        REM ** **************************************************************************

                        If Hour(Now()) > 12 Then
                            Dim DataVencimento As Date
                            DataVencimento = New DateTime(Year(Now()), Month(Now()), Day(Now())).ToString("dd/MM/yyyy")
                            txtVencimento.Text = DataVencimento.AddDays(1)
                        Else
                            txtVencimento.Text = New DateTime(Year(Now()), Month(Now()), Day(Now())).ToString("dd/MM/yyyy")
                        End If

                        txtValorBoleto.Text = dr("txtValorBoleto")
                        txtNumeroDocumentoBoleto.Text = Replace(dr("txtNumeroDocumentoBoleto"), "-", "")

                        'Cedente
                        txtCodigoCedente.Text = dr("txtCodigoCedente")
                        txtNossoNumeroBoleto.Text = Replace(dr("txtNossoNumeroBoleto"), "-", "")
                        txtCPFCNPJ.Text = dr("txtCPFCNPJ")
                        txtNomeCedente.Text = dr("txtNomeCedente")
                        txtAgenciaCendente.Text = dr("txtAgenciaCendente")
                        txtContaCedente.Text = dr("txtContaCedente")

                        'Sacado
                        txtCPFCNPJSacado.Text = dr("txtCPFCNPJSacado")
                        txtNomeSacado.Text = dr("txtNomeSacado")
                        txtEnderecoSacado.Text = dr("txtEnderecoSacado")
                        txtBairroSacado.Text = dr("txtBairroSacado")
                        txtCidadeSacado.Text = dr("txtCidadeSacado")
                        txtCEPSacado.Text = dr("txtCEPSacado")
                        txtUFSacado.Text = dr("txtUFSacado")

                        PrintBOLETO()

                    End If

                    dr.Close()

                Catch ex As Exception

                End Try

                cn.Close()

            End If

        End If

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

        FormsAuthentication.SignOut()
        Session.Abandon()
        Session.Clear()

    End Sub

End Class
