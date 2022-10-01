Imports UOL.PagSeguro
Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.DBNull
Imports System.Xml
Partial Class _empresaJC_loja
    Inherits System.Web.UI.Page

    Dim myPagSeguroSeg As New UOL.PagSeguro.VendaAutenticadaEventArgs

    Dim myURL As String = "https://pagseguro.uol.com.br/checkout/checkout.jhtml"

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        idCadastroEmpresa_layoutLabel.Text = Session("idCadastroEmpresa_layout")
        LabelCabec.Text = "Associação de profissionais "
        idCadastroEmpresaLabel.Text = Session("idCadastroEmpresa_layout")
        emailUserLabel.Text = Session("emailUser")
    End Sub

    Protected Sub GridViewPRODUTOS_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewPRODUTOS.SelectedIndexChanged

        Dim myPagSeguroProd As New UOL.PagSeguro.Produto
        Dim myPagSeguroDiv As New UOL.PagSeguro.VendaPagSeguro
        Dim myPagSeguroCliente As New UOL.PagSeguro.Cliente
        myPagSeguroSeg.NPIRequest = Application("token")

        VendaPagSeguroCredito.UrlPagSeguro = myURL
        VendaPagSeguroCredito.EmailCobranca = Application("emailAdmin")
        VendaPagSeguroCredito.CodigoReferencia = Session("idCadastroUser")

        myPagSeguroCliente.Bairro = Session("Bairro")
        myPagSeguroCliente.Cep = Session("CEP")
        myPagSeguroCliente.Cidade = Session("Cidade")
        myPagSeguroCliente.Uf = Session("uf")
        myPagSeguroCliente.ComplementoEndereco = Session("Complemento")
        myPagSeguroCliente.DDD = Session("dddCandidato")
        myPagSeguroCliente.Telefone = Replace(Session("telefoneCandidato"), "-", "")
        myPagSeguroCliente.Email = Session("emailUser")
        myPagSeguroCliente.Endereco = Session("Endereco")
        myPagSeguroCliente.Nome = Session("nome")
        myPagSeguroCliente.Numero = "0"
        myPagSeguroCliente.Pais = "BRA"

        Dim checkDigit As String = ""

        myPagSeguroProd.Codigo = GridViewPRODUTOS.SelectedDataKey("idProduto")
        myPagSeguroProd.Descricao = GridViewPRODUTOS.SelectedDataKey("Produto")
        myPagSeguroProd.Frete = "0"
        myPagSeguroProd.Peso = "0"
        myPagSeguroProd.Quantidade = GridViewPRODUTOS.SelectedDataKey("qtd")
        myPagSeguroProd.Valor = GridViewPRODUTOS.SelectedDataKey("preco")

        VendaPagSeguroCredito.Produtos.Add(myPagSeguroProd)
        VendaPagSeguroCredito.Cliente = myPagSeguroCliente
        VendaPagSeguroCredito.Executar(Response)

    End Sub

    Protected Sub LinkButtonVoltar_Click(sender As Object, e As EventArgs)
        Response.Redirect("~/_candidato/_extrato.aspx")
    End Sub
End Class
