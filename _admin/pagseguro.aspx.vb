Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _admin_pagseguro
    Inherits System.Web.UI.Page

    Protected Sub GridViewRETORNO_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewRETORNO.SelectedIndexChanged
        codeNotificacaoLabel.Text = GridViewRETORNO.SelectedDataKey("codeNotificacao")
    End Sub

    Protected Sub GridViewBOLETO_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewBOLETO.SelectedIndexChanged

        Dim AvaliaSaldoAtual As New Credito
        Dim SaldoAtual As Decimal
        SaldoAtual = AvaliaSaldoAtual.RestaCreditoAD(GridViewBOLETO.SelectedDataKey("idSetup"), GridViewBOLETO.SelectedDataKey("idCadastroEmpresa"), GridViewBOLETO.SelectedDataKey("idUsuario"))

        Dim oReader As SqlDataReader = Nothing
        Dim oConnection As SqlConnection

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        Dim oCommand As SqlCommand

        Dim prm As SqlParameter

        oCommand = New SqlCommand("_USP_AD_LIBERA_SERVICO", oConnection)
        oCommand.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idBoleto", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        oCommand.Parameters.Add(prm)
        oCommand.Parameters("@idBoleto").Value = GridViewBOLETO.SelectedDataKey("idBoleto")

        prm = New SqlParameter("@txtNumeroDocumentoBoleto", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        oCommand.Parameters.Add(prm)
        oCommand.Parameters("@txtNumeroDocumentoBoleto").Value = GridViewBOLETO.SelectedDataKey("txtNumeroDocumentoBoleto")

        prm = New SqlParameter("@idPedido", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        oCommand.Parameters.Add(prm)
        oCommand.Parameters("@idPedido").Value = GridViewBOLETO.SelectedDataKey("idPedido")

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        oCommand.Parameters.Add(prm)
        oCommand.Parameters("@idSetup").Value = GridViewBOLETO.SelectedDataKey("idSetup")

        prm = New SqlParameter("@idUsuario", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        oCommand.Parameters.Add(prm)
        oCommand.Parameters("@idUsuario").Value = GridViewBOLETO.SelectedDataKey("idUsuario")

        prm = New SqlParameter("@orcamento", SqlDbType.Decimal)
        prm.Direction = ParameterDirection.Input
        oCommand.Parameters.Add(prm)
        oCommand.Parameters("@orcamento").Value = GridViewBOLETO.SelectedDataKey("orcamento")

        prm = New SqlParameter("@saldoAtual", SqlDbType.Decimal)
        prm.Direction = ParameterDirection.Input
        oCommand.Parameters.Add(prm)
        oCommand.Parameters("@saldoAtual").Value = SaldoAtual

        prm = New SqlParameter("@txtValorBoleto", SqlDbType.Decimal)
        prm.Direction = ParameterDirection.Input
        oCommand.Parameters.Add(prm)
        oCommand.Parameters("@txtValorBoleto").Value = GridViewBOLETO.SelectedDataKey("txtValorBoleto")

        oConnection.Open()
        Dim dr As SqlDataReader = oCommand.ExecuteReader
        dr.Close()
        oConnection.Close()

        GridViewBOLETO.DataBind()

    End Sub
End Class
