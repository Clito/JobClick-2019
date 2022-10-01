Imports email
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter


Partial Class _admin_faq
    Inherits System.Web.UI.Page



    Protected Sub UpdFAQ(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource2.Updated

        Dim status As Boolean
        Dim EnviarPara As String
        Dim EmailEnviarPara As String
        Dim pergunta As String
        Dim resposta As String
        Dim ticket As String
        Dim ip As String

        status = e.Command.Parameters("@status").Value
        EnviarPara = e.Command.Parameters("@nome").Value
        EmailEnviarPara = e.Command.Parameters("@email").Value
        pergunta = e.Command.Parameters("@pergunta").Value
        resposta = e.Command.Parameters("@resposta").Value
        ticket = e.Command.Parameters("@ticket").Value
        ip = e.Command.Parameters("@ip").Value

        If status Then
            EnviaEmail(EnviarPara, EmailEnviarPara, pergunta, resposta, ticket, ip)
            msn.Text = "E-mail enviado com sucesso!"
        Else
            msn.Text = "Registro atualizado com sucesso, não foi enviado e-mail ao usuário."
        End If

    End Sub


    Protected Sub GoBack(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("faq.aspx")
    End Sub



    Sub EnviaEmail(ByVal EnviarPara, ByVal EmailEnviarPara, ByVal pergunta, ByVal resposta, ByVal ticket, ByVal ip)

        Dim EnviaRes As New EmailSQL

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        Dim RecuperaConta As New email
        Dim iBody As String = ""
        Dim dbBody As String = ""
        Dim sBody As String = ""

        REM ** ***************************************************************************************************
        Dim MODELO As String = "Geral"
        REM ** ***************************************************************************************************

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT idmensagem, sbody FROM tbmensagem WHERE(idmensagem = '" & MODELO & "')"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        REM ** ***************************************************************************************************
        REM ** CONFIGURAÇÃO DO SISTEMA DE ENVIO DE E-MAIL - DB
        REM ** ***************************************************************************************************

        Try

            If oReader.HasRows() Then
                oReader.Read()
                dbBody = oReader("sbody")
            Else
                dbBody = ""
            End If

        Catch ex As Exception

        End Try

        oConnection.Close()


        iBody = iBody & "<table border='0' width='100%' id='email'>" & Chr(10)
        iBody = iBody & "<tr>" & Chr(10)
        iBody = iBody & "<td><font face='Verdana' size='2'>Resposta para a seguinte pergunta feita pelo site:</font></td>" & Chr(10)
        iBody = iBody & "</tr>" & Chr(10)
        iBody = iBody & "<tr>" & Chr(10)
        iBody = iBody & "<td><font face='Verdana' size='1'>Caro(a):<br>" + EnviarPara + "<br><b>Sua pergunta:</b><br>" + pergunta + "</font></td>" & Chr(10)
        iBody = iBody & "</tr>" & Chr(10)
        iBody = iBody & "<tr>" & Chr(10)
        iBody = iBody & "<td><font face='Verdana' size='1'><b>Nossa resposta:</b><br>" + resposta + "</font></td>" & Chr(10)
        iBody = iBody & "</tr>" & Chr(10)
        iBody = iBody & "<tr>" & Chr(10)
        iBody = iBody & "<td><font face='Verdana' size='1'>Ticket: " + ticket + " | IP: " + ip + "</font></td>" & Chr(10)
        iBody = iBody & "</tr>" & Chr(10)
        iBody = iBody & "</table>" & Chr(10)

        Dim URL As String = Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.AbsolutePath, "")

        REM ** ***************************************************************************************************
        sBody = sBody & Replace(Replace(dbBody, "#", iBody), "*", URL)
        REM ** ***************************************************************************************************

        EnviaRes.EnviamensagemSQL(sBody, EnviarPara, EmailEnviarPara, "Sistema FAQ - JobClick")

    End Sub

    Protected Sub DelFAQ(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource2.Deleted
        GridView1.DataBind()
    End Sub
End Class
