Imports UOL.PagSeguro
Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.DBNull
Imports System.Xml

Partial Class _anonimo_retorno
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        RetornoPagSeguroRetorno.UrlNPI = "https://pagseguro.uol.com.br/pagseguro-ws/checkout/NPI.jhtml"
        RetornoPagSeguroRetorno.Token = Application("token")

        If Request.QueryString("transaction_id") <> "" Then
            LabelStatus.Text = "Código de transação: <b>" & Request.QueryString("transaction_id") & "</b> mantenha com você até o final da transação."
        Else
            LabelStatus.Text = "Código de transação: <b>" & Session("ticket") & "</b> mantenha com você até o final da transação."
        End If

    End Sub

    Protected Sub RetornoPagSeguroRetorno_VendaNaoAutenticada(sender As Object, e As UOL.PagSeguro.VendaNaoAutenticadaEventArgs)
        errorLabel.Text = errorLabel.Text & "Não autenticado!"
    End Sub

    Protected Sub RetornoPagSeguroRetorno_FalhaProcessarRetorno(sender As Object, e As UOL.PagSeguro.FalhaProcessarRetornoEventArgs)
        errorLabel.Text = errorLabel.Text & "Falha!"
    End Sub

    Protected Sub RetornoPagSeguroRetorno_RetornoVerificado(sender As Object, e As UOL.PagSeguro.VendaAutenticadaEventArgs)
        errorLabel.Text = errorLabel.Text & "Verificado!"
    End Sub

    Protected Sub RetornoPagSeguroRetorno_VendaEfetuada(ByVal retornoVenda As UOL.PagSeguro.RetornoVenda) Handles RetornoPagSeguroRetorno.VendaEfetuada

        Dim Utilizado As String = ""
        Dim nmempresa As String = ""

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        Dim Valor As Decimal = retornoVenda.Produtos.Item(0).Valor
        Dim Creditos As Decimal = Right(retornoVenda.Produtos.Item(0).Codigo, 2)
        Dim SMS As Int32 = Left(retornoVenda.Produtos.Item(0).Codigo, 3)
        Dim IdStatus As Integer = retornoVenda.StatusTransacao
        Dim TipoPagamento As String = retornoVenda.TipoPagamentoDescricao
        Dim ref_transacao As String = retornoVenda.CodigoReferencia
        Dim StatusTransacao As String = retornoVenda.StatusTransacaoDescricao
        Dim TransacaoID As String = retornoVenda.CodigoTransacao

        REM ** *********************************************************************************
        REM ** REPRESENTANTES
        REM ** *********************************************************************************

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_CREDITO_UTILIZADO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idCadastroEmpresa").Value = ref_transacao

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

            Utilizado = dr("Utilizado")
            nmempresa = dr("nmempresa")

        End If

        dr.Close()
        cn.Close()



        REM ** *********************************************************************************
        REM ** [LIBERA CRÉDITOS AO CLIENTE]
        REM ** *********************************************************************************

        Dim myAcessoDados As New PagSeguro_Retorno
        myAcessoDados.RetornoPagSeguroVenda(ref_transacao, retornoVenda.CodigoTransacao, retornoVenda.Cliente.Nome, retornoVenda.Cliente.Email, IdStatus, retornoVenda.StatusTransacaoDescricao, Valor, retornoVenda.Data, TipoPagamento, retornoVenda.Anotacao, Creditos, nmempresa, Session("idSetup"), SMS)

        REM ** *********************************************************************************
        REM ** [FIM]
        REM ** *********************************************************************************

    End Sub

    Protected Sub ButtonVoltar_Click(sender As Object, e As System.EventArgs) Handles ButtonVoltar.Click
        Dim UserNivel As String = HttpContext.Current.User.Identity.Name
        Select Case UserNivel
            Case "RHUser"
                Response.Redirect("/_empresa/_extrato.aspx?autoTit=Extrato")
            Case "EmpresaJobClick"
                Response.Redirect("/_empresaJC")
            Case Else
                Response.Redirect("/")
        End Select
    End Sub

End Class
