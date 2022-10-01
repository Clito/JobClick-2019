Imports email
Imports BodyEmail
Imports System.IO
Imports System.Text
Imports System.Xml
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports criptografia



Partial Class _candidato_publicar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim URL As String = Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.AbsolutePath, "")

        If Session("dscurriculo") <> "" Then
            html.Visible = True
            html.Text = "Você está trabalhando com o currículo: [<font color='#FF0000'>" + Replace(Session("dscurriculo"), "<b>Curriculo:</b> ", "") + "</font>]"
        End If

        aprTextBox.Attributes.Add("onkeypress", "limitarTexto(this, contador, 180);")
        aprTextBox.Attributes.Add("onkeyup", "limitarTexto(this, contador, 180);")

    End Sub

    Protected Sub SqlDataSource1_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Inserted
        Response.Redirect("publicar.aspx")
    End Sub

    Protected Sub SqlDataSource1_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Deleted
        Response.Redirect("publicar.aspx")
    End Sub

    Protected Sub LinkButtonDOWNLOAD_Click(sender As Object, e As System.EventArgs) Handles LinkButtonDOWNLOAD.Click

        Response.Redirect("../_anonimo/mycurriculoDOC.aspx?DocName=" & DocName.Text & "&idUser=" & Session("idUser") & "&id=" & Session("idcurriculo"))

    End Sub

    Protected Sub LinkButtonENVIOCV_Click(sender As Object, e As System.EventArgs) Handles LinkButtonENVIOCV.Click

        Dim myEmail As New EmailSQL
        Dim myBody As New BodyEmail
        Dim Body As String = ""
        Dim sBody As String = ""
        Dim dbBody As String = ""
        Dim status As Boolean = False

        Dim MODELO As String = "Curriculo"

        Dim URL As String = Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.AbsolutePath, "")

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        Dim idpublica As Int32 = 0

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spIncEmail", cn)
        cmd.CommandType = CommandType.StoredProcedure


        prm = New SqlParameter("@idUser", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idUser").Value = Session("idUser").ToString


        prm = New SqlParameter("@idcurriculo", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idcurriculo").Value = Session("idcurriculo").ToString


        prm = New SqlParameter("@emailTO", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@emailTO").Value = email_info.Text.ToString


        prm = New SqlParameter("@midia", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@midia").Value = DsVaga.Text.ToString


        prm = New SqlParameter("@codigo", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        If codigo.Text <> "" Then
            cmd.Parameters("@codigo").Value = codigo.Text.ToString
        Else
            cmd.Parameters("@codigo").Value = "Não informado"
        End If

        prm = New SqlParameter("@apresentacao", SqlDbType.Text, 16)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@apresentacao").Value = Left(aprTextBox.Text.ToString, 180)

        cn.Open()


        Dim dr As SqlDataReader = cmd.ExecuteReader()

        Try

            dr.Read()
            idpublica = dr("idpublica").ToString

        Catch ex As Exception

        End Try

        dr.Close()
        cn.Close()


        Body = Body & "<table border='0' width='100%'>" & Chr(10)
        Body = Body & "<tr>" & Chr(10)
        Body = Body & "<td><font face='Verdana' size='2'>Candidato: " & Session("nome") & "<br>Dados de referência: " & codigo.Text & "<br>" & DsVaga.Text & "<br><br>" & aprTextBox.Text & "</font></td>" & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "<tr>" & Chr(10)
        Body = Body & "<td><font face='Verdana' size='2'>E-mail para contato: " & Session("emailUser") & "</font></td>" & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "<tr>" & Chr(10)
        Body = Body & "<td><br><font face='Verdana' size='2'>Clique no link abaixo para ver o currículo:<br><a href='" & URL & "/_anonimo/mycurriculo.aspx?idUser=" & criptografia.Criptografar(Session("idUser"), "#!$a36?@") & "&id=" & criptografia.Criptografar(Session("idcurriculo"), "#!$a36?@") & "&idRes=" & criptografia.Criptografar(idpublica.ToString, "#!$a36?@") & "'>Para visualizar o currículo [Clique aqui]</a></font></td>" & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "</table>" & Chr(10)

        dbBody = dbBody & myBody.GetBody(MODELO, Session("idSetup")).ToString

        sBody = Replace(Replace(dbBody.ToString, "#", Body.ToString), "*", URL)

        status = myEmail.EnviamensagemSQL(sBody, email_info.Text, email_info.Text, "Candidato Jobclick: " & codigo.Text)

        If status Then
            PanelAviso.Visible = True
            AVISOLABEL.Text = AVISOLABEL.Text & "• Seu Currículo Vitae foi enviado com sucesso.<br>"
            AVISOLABEL.CssClass = "msnOK"
            ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        Else
            PanelAviso.Visible = True
            AVISOLABEL.Text = AVISOLABEL.Text & "• Seu Currículo Vitae não foi enviado, tente mais tarde.<br>"
            AVISOLABEL.CssClass = "msn"
            ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"

        End If

    End Sub


    Protected Sub LinkButtonCancelar1_Click(sender As Object, e As System.EventArgs) Handles LinkButtonCancelar1.Click
        word.Visible = False
        email.Visible = False
        PanelNAVEGADOR.Visible = True
    End Sub

    Protected Sub LinkButtonCancelar2_Click(sender As Object, e As System.EventArgs) Handles LinkButtonCancelar2.Click
        word.Visible = False
        email.Visible = False
        PanelNAVEGADOR.Visible = True
    End Sub

    Protected Sub LinkButtonDOWNLOAD2_Click(sender As Object, e As System.EventArgs) Handles LinkButtonDOWNLOAD2.Click
        word.Visible = True
        email.Visible = False
        PanelNAVEGADOR.Visible = False
    End Sub

    Protected Sub LinkButtonEMAIL_Click(sender As Object, e As System.EventArgs) Handles LinkButtonEMAIL.Click
        word.Visible = False
        email.Visible = True
        PanelNAVEGADOR.Visible = False
    End Sub

End Class
