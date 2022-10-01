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

    Sub EnviaEmail(nomeQuemIndicou As String, emailQuemIndicou As String, nomeIndicado As String, apresentacao As String, idIndicadoCandidatoRES As Int32)

        Dim myEmail As New EmailSQL
        Dim myBody As New BodyEmail
        Dim Body As String = ""
        Dim sBody As String = ""
        Dim dbBody As String = ""

        Dim MODELO As String = "Curriculo"

        Dim URL As String = Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.AbsolutePath, "")

        Body = Body & "<table border='0' width='100%'>" & Chr(10)
        Body = Body & "<tr>" & Chr(10)
        Body = Body & "<td><font face='Verdana' size='2'>O profissional: <b>" & nomeIndicado & "</b> informou que você o indicou, apresentamos a você os dados completos deste profissional:<br><b>Apresentação pessoal:</b><br>" & apresentacao & "</font></td>" & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "<tr>" & Chr(10)
        Body = Body & "<td><font face='Verdana' size='2'>E-mail para contato: " & Session("emailUser") & "</font></td>" & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "<tr>" & Chr(10)
        Body = Body & "<td><br><font face='Verdana' size='2'>Clique no link abaixo para ver o currículo do profissional e confirmar ou não a sua indicação:<br><a href='" & URL & "/_anonimo/mycurriculoIndica.aspx?idU=" & Session("idUser") & "&id=" & Session("idcurriculo") & "&idRes=" & idIndicadoCandidatoRES & "'>Para visualizar o currículo [Clique aqui]</a> ou se preferir copie e cole em seu navegador o link abaixo:<br>" & URL & "/_anonimo/mycurriculoIndica.aspx?idU=" & Session("idUser") & "&id=" & Session("idcurriculo") & "&idRes=" & idIndicadoCandidatoRES & "</font></td>" & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "</table>" & Chr(10)

        dbBody = dbBody & myBody.GetBodySetup(MODELO, Application("idsetup")).ToString

        sBody = Replace(Replace(dbBody.ToString, "#", Body.ToString), "*", URL)

        myEmail.EnviamensagemSQL(sBody, nomeQuemIndicou.ToString, emailQuemIndicou.ToString, "Indicação de profissional - Solicitamos a sua confirmação.")

    End Sub

    Protected Sub LinkButtonConfirma_Click(sender As Object, e As System.EventArgs) Handles LinkButtonConfirma.Click

        If idcurriculoSelecionado.Text = "" Then
            CVLabelSelect.CssClass = "msn"
            CVLabelSelect.Text = "Informe qual CV será apresentado!"
            PanelAviso.Visible = True
            AVISOLABEL.Text = AVISOLABEL.Text & "• Informe qual CV será apresentado!<br>"
            AVISOLABEL.CssClass = "msn"
            ImageButtonAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"
            Return
        End If

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_INDICA_CANDIDATO_DIRETO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCurriculo").Value = idcurriculoSelecionado.Text

        prm = New SqlParameter("@nomeQuemIndicou", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nomeQuemIndicou").Value = nomeQuemIndicouTextBox.Text

        prm = New SqlParameter("@emailQuemIndicou", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@emailQuemIndicou").Value = emailQuemIndicouTextBox.Text

        prm = New SqlParameter("@nomeIndicado", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nomeIndicado").Value = Session("nome")

        prm = New SqlParameter("@emailIndicado", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@emailIndicado").Value = Session("emailUser")

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            idIndicadoCandidatoRESLabel.Text = dr("idIndicadoCandidatoRES").ToString ' <---- UTILIZADO PARA LOCALIZAR A INDICAÇÃO INFORMADA!

            CVLabelSelect.CssClass = "msnOK"
            CVLabelSelect.Text = "Indicação enviada!"
            PanelAviso.Visible = True
            AVISOLABEL.Text = AVISOLABEL.Text & "• Indicação enviada com sucesso.<br>"
            AVISOLABEL.CssClass = "msnOK"
            ImageButtonAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
            EnviaEmail(nomeQuemIndicouTextBox.Text, emailQuemIndicouTextBox.Text, Session("nome"), apresentacaoTextBox.Text, idIndicadoCandidatoRESLabel.Text)
            dr.Close()
            cn.Close()
        Catch ex As Exception
            CVLabelSelect.CssClass = "msn"
            CVLabelSelect.Text = "Indicação não foi confirmada!<br>Verifique se o e-mail está correto."
            PanelAviso.Visible = True
            AVISOLABEL.Text = AVISOLABEL.Text & "• Indicação não foi confirmada! Verifique se o e-mail está correto.<br>"
            AVISOLABEL.CssClass = "msn"
            ImageButtonAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"
        End Try

    End Sub

    Protected Sub LinkButtonFECHARAVISO_Click(sender As Object, e As System.EventArgs) Handles LinkButtonFECHARAVISO.Click
        PanelAviso.Visible = False
        AVISOLABEL.Text = ""
    End Sub
    Protected Sub ImageButtonAVISO_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAVISO.Click
        PanelAviso.Visible = False
        AVISOLABEL.Text = ""
    End Sub

End Class
