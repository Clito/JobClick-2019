Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports geraProtocoloIndica

Partial Class _candidato_indicaCandidato
    Inherits System.Web.UI.Page

    Protected Sub GridViewCV_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewCV.SelectedIndexChanged
        idcurriculoSelecionado.Text = GridViewCV.SelectedDataKey("idcurriculo")
        CVLabelSelect.CssClass = "msnOK"
        CVLabelSelect.Text = "O CV selecionado é " & GridViewCV.SelectedDataKey("dscurriculo")
        cpfLabel.Text = GridViewCV.SelectedDataKey("cpf")
    End Sub

    Protected Sub LinkButtonRESPONDER_Click(sender As Object, e As System.EventArgs) Handles LinkButtonRESPONDER.Click

        If idcurriculoSelecionado.Text = "" Then
            CVLabelSelect.CssClass = "msn"
            CVLabelSelect.Text = "Informe qual CV será apresentado!"
            Return
        End If

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_CADASTRA_INDICACAO_PROFISSIONAL_CONFIRMACAO_CANDIDATO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCurriculo").Value = idcurriculoSelecionado.Text

        prm = New SqlParameter("@protocoloInd", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@protocoloInd").Value = ProtocoloTextBox.Text

        prm = New SqlParameter("@cpf", SqlDbType.VarChar, 20)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@cpf").Value = cpfLabel.Text

        prm = New SqlParameter("@apresentacao", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@apresentacao").Value = apresentacaoTextBox.Text


        cn.Open()

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                If dr("Status") = 1 Then
                    CVLabelSelect.CssClass = "msnOK"
                    CVLabelSelect.Text = "Indicação confirmada!"
                    PanelAviso.Visible = True
                    AVISOLABEL.Text = AVISOLABEL.Text & "• Indicação confirmada com sucesso.<br>"
                    AVISOLABEL.CssClass = "msnOK"
                    ImageButtonAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
                Else
                    CVLabelSelect.CssClass = "msn"
                    CVLabelSelect.Text = "Indicação não foi confirmada!<br>Verifique se o Protocolo está correto."
                    PanelAviso.Visible = True
                    AVISOLABEL.Text = AVISOLABEL.Text & "• Indicação não foi confirmada! Verifique se o Protocolo está correto.<br>"
                    AVISOLABEL.CssClass = "msn"
                    ImageButtonAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"
                End If
            End If

            dr.Close()

        Catch ex As Exception

        End Try

        cn.Close()

    End Sub

    Protected Sub LinkButtonFECHARAVISO_Click(sender As Object, e As System.EventArgs) Handles LinkButtonFECHARAVISO.Click
        PanelAviso.Visible = False
        AVISOLABEL.Text = ""
        CVLabelSelect.Text = ""
    End Sub
    Protected Sub ImageButtonAVISO_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAVISO.Click
        PanelAviso.Visible = False
        AVISOLABEL.Text = ""
        CVLabelSelect.Text = ""
    End Sub

End Class
