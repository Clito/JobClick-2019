Imports BoletoNet
Imports geraProtocolo

Partial Class _parceiroJobClick_boleto
    Inherits System.Web.UI.Page

    Dim txtDescricaoMovimento As String = ""
    Dim txtDescricaoStatus As String = ""

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

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
            Response.Redirect("/")
        End If

        If Not IsPostBack Then

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

            REM ** **************************************************************************
            txtValorBoleto.Text = valor
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

            LabelContrato.Text = Replace(Replace(Replace(Replace(Replace(Replace(LabelContrato.Text, "EMPRESA", Session("nmempresa")), "CNPJ", Session("cnpj")), "USUARIO", Session("nome")), "VALOR", FormatCurrency(valor)), "DATA", txtVencimento.Text), "NUMERO", txtNumeroDocumentoBoleto.Text)

        End If
    End Sub


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Response.Redirect("boleto_print.aspx?NossoNumeroBoleto=" & txtNossoNumeroBoleto.Text & "&txtTipo=A" & "&NumeroDocumento=" & txtNumeroDocumentoBoleto.Text & "&ValorBoleto=" & Request.QueryString("valor") & "&idVagaPublica=" & idVagaPublicaLabel.Text & "&txtDescricaoMovimento=" & txtDescricaoMovimento & "&txtDescricaoStatus=" & txtDescricaoStatus)
    End Sub

End Class
