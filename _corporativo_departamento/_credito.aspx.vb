Imports UOL.PagSeguro
Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.DBNull
Imports System.Xml

Partial Class _empresaJC_credito
    Inherits System.Web.UI.Page

    Dim myPagSeguroSeg As New UOL.PagSeguro.VendaAutenticadaEventArgs

    Dim myURL As String = "https://pagseguro.uol.com.br/security/webpagamentos/webpagto.aspx"

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        LabelCabec.Text = "Aquisição de Créditos para SMS"
        idCadastroEmpresaLabel.Text = Session("idCadastroEmpresa")
    End Sub

    Protected Sub GridViewPRODUTOS_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewPRODUTOS.SelectedIndexChanged

        Dim myPagSeguroProd As New UOL.PagSeguro.Produto
        Dim myPagSeguroDiv As New UOL.PagSeguro.VendaPagSeguro
        Dim myPagSeguroCliente As New UOL.PagSeguro.Cliente
        myPagSeguroSeg.NPIRequest = Application("token")

        VendaPagSeguroCredito.UrlPagSeguro = myURL
        VendaPagSeguroCredito.EmailCobranca = Application("emailAdmin")
        VendaPagSeguroCredito.CodigoReferencia = Session("idCadastroEmpresa")

        myPagSeguroCliente.Bairro = Session("Bairro")
        myPagSeguroCliente.Cep = Session("CEP")
        myPagSeguroCliente.Cidade = Session("Cidade")
        myPagSeguroCliente.Uf = Session("uf")
        myPagSeguroCliente.ComplementoEndereco = Session("Complemento")
        myPagSeguroCliente.DDD = Session("dddEmpresa")
        myPagSeguroCliente.Telefone = Replace(Session("telefoneEmpresa"), "-", "")
        myPagSeguroCliente.Email = Session("emailUser")
        myPagSeguroCliente.Endereco = Session("Endereco")
        myPagSeguroCliente.Nome = Session("nomeConsultor")
        myPagSeguroCliente.Numero = "0"
        myPagSeguroCliente.Pais = "BRA"

        Dim checkDigit As String = ""

        myPagSeguroProd.Codigo = GridViewPRODUTOS.SelectedDataKey("codProduto")
        myPagSeguroProd.Descricao = GridViewPRODUTOS.SelectedDataKey("Produto")
        myPagSeguroProd.Frete = "0"
        myPagSeguroProd.Peso = "0"
        myPagSeguroProd.Quantidade = GridViewPRODUTOS.SelectedDataKey("qtd")
        myPagSeguroProd.Valor = GridViewPRODUTOS.SelectedDataKey("preco")

        VendaPagSeguroCredito.Produtos.Add(myPagSeguroProd)
        VendaPagSeguroCredito.Cliente = myPagSeguroCliente
        VendaPagSeguroCredito.Executar(Response)

    End Sub

End Class
