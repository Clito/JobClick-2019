Imports BoletoNet
Imports geraProtocolo
Imports UOL.PagSeguro
Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.DBNull
Imports System.Xml

Partial Class _parceiroJobClick_comprar
    Inherits System.Web.UI.Page
    Dim txtDescricaoMovimento As String = ""
    Dim txtDescricaoStatus As String = ""

    Dim TipoProduto As String = ""

    Dim myPagSeguroSeg As New UOL.PagSeguro.VendaAutenticadaEventArgs

    Dim myURL As String = "https://pagseguro.uol.com.br/security/webpagamentos/webpagto.aspx"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        TipoProduto = Request.QueryString("TipoProduto")

        PanelAviso.Visible = False

        Dim valor As String = "0"
        Dim myNumeroDocumento As New geraProtocolo
        Dim myNossoNumero As New geraProtocolo

        REM ** ******************************************************************************
        REM ** TEXTO PARA O EXTRATO
        REM ** ******************************************************************************
        REM ** @txtDescricaoMovimento VARCHAR(255) = NULL
        REM ** @txtDescricaoStatus VARCHAR(255) = NULL 

        txtDescricaoMovimento = Request.QueryString("txtDescricaoMovimento")
        txtDescricaoStatus = Request.QueryString("txtDescricaoStatus")

        REM ** ******************************************************************************
        REM ** MONTA COMPORMISSO DE PAGAMENTO
        REM ** ******************************************************************************
        If Request.QueryString("valor") <> "" Then
            valor = Request.QueryString("valor")
            idVagaPublicaLabel.Text = Request.QueryString("idVagaPublica")
        Else
            valor = "20,00"
            idVagaPublicaLabel.Text = Request.QueryString("idVagaPublica")
        End If

        If Not IsPostBack Then

            REM ** **************************************************************************
            REM ** LÓGICA DE DATA DE VENCIMENTO
            REM ** SE FOR ATÉ 12:00:00 O PAGAMENTO É NO DIA
            REM ** APÓS AS 12:00:00 A DATA SERÁ PARA O DIA SEGUINTE
            REM ** **************************************************************************

            Dim DataVencimento As Date
            DataVencimento = New DateTime(Year(Now()), Month(Now()), Day(Now())).ToString("dd/MM/yyyy")
            txtVencimentoDOC.Text = DataVencimento.AddDays(2)
            txtVencimento.Text = New DateTime(Year(Now()), Month(Now()), Day(Now())).ToString("dd/MM/yyyy")

            REM ** **************************************************************************
            TextBoxValor.Text = valor
            txtNumeroDocumentoBoleto.Text = myNumeroDocumento.NumeroDocumento(Session("idSetup"))

            'Cedente
            txtCodigoCedente.Text = "627120"
            txtNossoNumeroBoleto.Text = myNossoNumero.nossonumero(Session("idSetup"))
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
            txtdddSacado.Text = Session("ddd")
            txttelefoneSacado.Text = Session("telefone")

            LabelContrato.Text = Replace(Replace(Replace(Replace(Replace(Replace(LabelContrato.Text, "EMPRESA", Session("nmempresa")), "CNPJ", Session("cnpj")), "USUARIO", Session("nome")), "VALOR", FormatCurrency(valor)), "DATA", txtVencimento.Text), "NUMERO", txtNumeroDocumentoBoleto.Text)

        End If
    End Sub

    Protected Sub ButtonPagamentoPS_Click(sender As Object, e As EventArgs) Handles ButtonPagamentoPS.Click

        Dim Valordacompra As Decimal = 0

        If TextBoxValor.Text <> "" Then ' VERIFICA SE O VALOR NÃO É NULO

            If IsNumeric(TextBoxValor.Text) = True Then ' VERIFICA SE O VALOR É NUMÉRICO

                Valordacompra = TextBoxValor.Text

                If Valordacompra >= 20 Then ' VERIFICA SE O VALOR É O MÍNIMO PERMITIDO

                    Dim myPagSeguroProd As New UOL.PagSeguro.Produto
                    Dim myPagSeguroDiv As New UOL.PagSeguro.VendaPagSeguro
                    Dim myPagSeguroCliente As New UOL.PagSeguro.Cliente
                    myPagSeguroSeg.NPIRequest = Application("token")

                    VendaPagSeguroCredito.UrlPagSeguro = myURL
                    VendaPagSeguroCredito.EmailCobranca = Application("emailAdmin")
                    VendaPagSeguroCredito.CodigoReferencia = Session("idSetup")

                    myPagSeguroCliente.Bairro = Session("bairro")
                    myPagSeguroCliente.Cep = Session("cep")
                    myPagSeguroCliente.Cidade = Session("cidade")
                    myPagSeguroCliente.Uf = Session("uf")
                    myPagSeguroCliente.ComplementoEndereco = Session("complemento")
                    myPagSeguroCliente.DDD = Session("ddd")
                    myPagSeguroCliente.Telefone = Replace(Session("telefone"), "-", "")
                    myPagSeguroCliente.Email = Session("emailRes")
                    myPagSeguroCliente.Endereco = Session("endereco")
                    myPagSeguroCliente.Nome = Session("nome")
                    myPagSeguroCliente.Numero = Session("numero")
                    myPagSeguroCliente.Pais = "BRA"

                    Dim checkDigit As String = ""

                    myPagSeguroProd.Codigo = Session("idUser")
                    myPagSeguroProd.Descricao = "Créditos Jobclick"
                    myPagSeguroProd.Frete = "0"
                    myPagSeguroProd.Peso = "0"
                    myPagSeguroProd.Quantidade = "1"
                    myPagSeguroProd.Valor = Valordacompra

                    VendaPagSeguroCredito.Produtos.Add(myPagSeguroProd)
                    VendaPagSeguroCredito.Cliente = myPagSeguroCliente
                    VendaPagSeguroCredito.Executar(Response)

                Else

                    REM VALOR DA COMPRA INFERIOR À 20,00 CRÉDITOS
                    PanelAviso.Visible = True
                    AVISOLABEL.Text = "Informamos que a relação de (R$) reais e créditos e de 1 para 1, ou seja, 1(um) real para 1(um) crédito.<br>O <b>valor mínimo</b> para compra é de <b>R$ 20,00</b> (vinte Reais) ou seja 20 (vinte Créditos), que serão depositados em sua conta para usar neste e em outros serviços que disponibilizamos para você."
                    ImageAviso.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"

                End If
            Else
                REM VALOR DA COMPRA INFERIOR À 20,00 CRÉDITOS
                PanelAviso.Visible = True
                AVISOLABEL.Text = "O valor deve ser numérico!"
                ImageAviso.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
            End If
        Else
            REM VALOR DA COMPRA INFERIOR À 20,00 CRÉDITOS
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Informamos que a relação de (R$) reais e créditos e de 1 para 1, ou seja, 1(um) real para 1(um) crédito.<br>O <b>valor mínimo</b> para compra é de <b>R$ 20,00</b> (vinte Reais) ou seja 20 (vinte Créditos), que serão depositados em sua conta para usar neste e em outros serviços que disponibilizamos para você."
            ImageAviso.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
        End If

    End Sub
End Class
