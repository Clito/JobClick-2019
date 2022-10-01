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
        idCadastroEmpresaLabel.Text = Session("idCadastroEmpresa")
    End Sub

    Protected Sub ImageButtonCredito350_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonCredito350.Click, ImageButtonCred5.Click

        Dim myPagSeguroProd As New UOL.PagSeguro.Produto
        Dim myPagSeguroDiv As New UOL.PagSeguro.VendaPagSeguro
        Dim myPagSeguroCliente As New UOL.PagSeguro.Cliente
        myPagSeguroSeg.NPIRequest = Application("token")

        VendaPagSeguroCredito.UrlPagSeguro = myURL
        VendaPagSeguroCredito.EmailCobranca = Application("emailAdmin")
        VendaPagSeguroCredito.CodigoReferencia = Session("idCadastroEmpresa")

        myPagSeguroCliente.Bairro = System.Web.HttpContext.Current.Session("Bairro")
        myPagSeguroCliente.Cep = System.Web.HttpContext.Current.Session("CEP")
        myPagSeguroCliente.Cidade = System.Web.HttpContext.Current.Session("Cidade")
        myPagSeguroCliente.Uf = System.Web.HttpContext.Current.Session("uf")
        myPagSeguroCliente.ComplementoEndereco = System.Web.HttpContext.Current.Session("Complemento")
        myPagSeguroCliente.DDD = System.Web.HttpContext.Current.Session("ddd")
        myPagSeguroCliente.Email = System.Web.HttpContext.Current.Session("Email")
        myPagSeguroCliente.Endereco = System.Web.HttpContext.Current.Session("Endereco")
        myPagSeguroCliente.Nome = System.Web.HttpContext.Current.Session("Nome")
        myPagSeguroCliente.Numero = "0" 'System.Web.HttpContext.Current.Session("Numero")
        myPagSeguroCliente.Pais = "BRA"
        myPagSeguroCliente.Telefone = Replace(System.Web.HttpContext.Current.Session("telefoneGestor"), "-", "")

        Dim checkDigit As String = ""

        myPagSeguroProd.Codigo = "500CRED500-05"
        myPagSeguroProd.Descricao = "5 Créditos com 500 SMS"
        myPagSeguroProd.Frete = "0"
        myPagSeguroProd.Peso = "0"
        myPagSeguroProd.Quantidade = "1"
        myPagSeguroProd.Valor = "160"

        VendaPagSeguroCredito.Produtos.Add(myPagSeguroProd)


        VendaPagSeguroCredito.Cliente = myPagSeguroCliente
        VendaPagSeguroCredito.Executar(Response)

    End Sub


    Protected Sub ImageButtonCredito180_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonCredito180.Click, ImageButton1.Click
        Dim myPagSeguroProd As New UOL.PagSeguro.Produto
        Dim myPagSeguroDiv As New UOL.PagSeguro.VendaPagSeguro
        Dim myPagSeguroCliente As New UOL.PagSeguro.Cliente
        myPagSeguroSeg.NPIRequest = Application("token")

        VendaPagSeguroCredito.UrlPagSeguro = myURL
        VendaPagSeguroCredito.EmailCobranca = Application("emailAdmin")
        VendaPagSeguroCredito.CodigoReferencia = Session("idCadastroEmpresa")

        myPagSeguroCliente.Bairro = System.Web.HttpContext.Current.Session("Bairro")
        myPagSeguroCliente.Cep = System.Web.HttpContext.Current.Session("CEP")
        myPagSeguroCliente.Cidade = System.Web.HttpContext.Current.Session("Cidade")
        myPagSeguroCliente.Uf = System.Web.HttpContext.Current.Session("uf")
        myPagSeguroCliente.ComplementoEndereco = System.Web.HttpContext.Current.Session("Complemento")
        myPagSeguroCliente.DDD = System.Web.HttpContext.Current.Session("ddd")
        myPagSeguroCliente.Email = System.Web.HttpContext.Current.Session("Email")
        myPagSeguroCliente.Endereco = System.Web.HttpContext.Current.Session("Endereco")
        myPagSeguroCliente.Nome = System.Web.HttpContext.Current.Session("Nome")
        myPagSeguroCliente.Numero = "0" 'System.Web.HttpContext.Current.Session("Numero")
        myPagSeguroCliente.Pais = "BRA"
        myPagSeguroCliente.Telefone = Replace(System.Web.HttpContext.Current.Session("telefoneGestor"), "-", "")

        Dim checkDigit As String = ""

        myPagSeguroProd.Codigo = "300CRED300-03"
        myPagSeguroProd.Descricao = "3 Créditos com 300 SMS"
        myPagSeguroProd.Frete = "0"
        myPagSeguroProd.Peso = "0"
        myPagSeguroProd.Quantidade = "1"
        myPagSeguroProd.Valor = "85"

        VendaPagSeguroCredito.Produtos.Add(myPagSeguroProd)


        VendaPagSeguroCredito.Cliente = myPagSeguroCliente
        VendaPagSeguroCredito.Executar(Response)
    End Sub

    Protected Sub ImageButtonCredito55_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonCredito55.Click, ImageButton2.Click
        Dim myPagSeguroProd As New UOL.PagSeguro.Produto
        Dim myPagSeguroDiv As New UOL.PagSeguro.VendaPagSeguro
        Dim myPagSeguroCliente As New UOL.PagSeguro.Cliente
        myPagSeguroSeg.NPIRequest = Application("token")

        VendaPagSeguroCredito.UrlPagSeguro = myURL
        VendaPagSeguroCredito.EmailCobranca = Application("emailAdmin")
        VendaPagSeguroCredito.CodigoReferencia = Session("idCadastroEmpresa")

        myPagSeguroCliente.Bairro = System.Web.HttpContext.Current.Session("Bairro")
        myPagSeguroCliente.Cep = System.Web.HttpContext.Current.Session("CEP")
        myPagSeguroCliente.Cidade = System.Web.HttpContext.Current.Session("Cidade")
        myPagSeguroCliente.Uf = System.Web.HttpContext.Current.Session("uf")
        myPagSeguroCliente.ComplementoEndereco = System.Web.HttpContext.Current.Session("Complemento")
        myPagSeguroCliente.DDD = System.Web.HttpContext.Current.Session("ddd")
        myPagSeguroCliente.Email = System.Web.HttpContext.Current.Session("Email")
        myPagSeguroCliente.Endereco = System.Web.HttpContext.Current.Session("Endereco")
        myPagSeguroCliente.Nome = System.Web.HttpContext.Current.Session("Nome")
        myPagSeguroCliente.Numero = "0" 'System.Web.HttpContext.Current.Session("Numero")
        myPagSeguroCliente.Pais = "BRA"
        myPagSeguroCliente.Telefone = Replace(System.Web.HttpContext.Current.Session("telefoneGestor"), "-", "")

        Dim checkDigit As String = ""

        myPagSeguroProd.Codigo = "200CRED200-03"
        myPagSeguroProd.Descricao = "1 Crédito com 200 SMS"
        myPagSeguroProd.Frete = "0"
        myPagSeguroProd.Peso = "0"
        myPagSeguroProd.Quantidade = "1"
        myPagSeguroProd.Valor = "30"

        VendaPagSeguroCredito.Produtos.Add(myPagSeguroProd)


        VendaPagSeguroCredito.Cliente = myPagSeguroCliente
        VendaPagSeguroCredito.Executar(Response)
    End Sub
End Class
