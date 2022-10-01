Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _parceiroJobClick_confirmacaoPagamento
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        PanelAviso.Visible = False
        txtNumeroDocumentoBoletoTextBox.Focus()

        If Request.QueryString("id") <> "" Then
            txtNumeroDocumentoBoletoTextBox.Text = Request.QueryString("id")
        End If

    End Sub

    Protected Sub LinkButtonCONFIRMAR_Click(sender As Object, e As EventArgs) Handles LinkButtonCONFIRMAR.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        Dim mynumeroDocumento As String = Convert.ToString(txtNumeroDocumentoBoletoTextBox.Text)

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_AD_CONFIRMA_PG_BOLETO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

        prm = New SqlParameter("@txtNumeroDocumentoBoleto", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@txtNumeroDocumentoBoleto").Value = mynumeroDocumento

        prm = New SqlParameter("@confirma", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@confirma").Value = 1


        cn.Open()

        Try

            Dim dr As SqlDataReader = cmd.ExecuteReader

            If dr.HasRows Then
                AVISOLABEL.Text = "Confirmação registrada com sucesso!"
                ImageAviso.ImageUrl = "~/_parceiroJobClick/images/ok.jpg"
                PanelAviso.Visible = True
            Else
                AVISOLABEL.Text = "Boleto não encontrado!"
                ImageAviso.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
                PanelAviso.Visible = True
            End If

            dr.Close()

        Catch ex As Exception
            AVISOLABEL.Text = "Boleto não encontrado!"
            ImageAviso.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
            PanelAviso.Visible = True
        End Try

        GridViewBOLETO.DataBind()
        cn.Close()

    End Sub

    Protected Sub GridViewBOLETO_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridViewBOLETO.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            CabecBoletoLabel.Text = "Boletos emitidos e confirmados"
        End If
    End Sub
End Class
