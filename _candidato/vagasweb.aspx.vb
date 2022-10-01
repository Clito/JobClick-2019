Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports email
Imports BodyEmail

Partial Class _candidato_vagasweb
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        idVagaWeblbl.Text = Request.QueryString("id")

        If Session("dscurriculo") <> "" Then
            html.Visible = True
            html.Text = "Você irá enviar o currículo: <br>[<font color='#FF0000'>" + Replace(Session("dscurriculo"), "<b>Curriculo:</b> ", "") + "</font>]"
        End If

    End Sub

    Protected Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound
        CType(e.Item.FindControl("LinkButton1"), LinkButton).PostBackUrl = "vagasweb.aspx?id=" & CType(e.Item.FindControl("LinkButton1"), LinkButton).Text
    End Sub

    Protected Sub DataList2_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList2.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            If CType(e.Item.FindControl("publicarLabel"), Label).Text Then
                CType(e.Item.FindControl("publicarLabel"), Label).Text = "Aberta"
            Else
                CType(e.Item.FindControl("publicarLabel"), Label).Text = "Fechada"
            End If

            CType(e.Item.FindControl("ImageWEB"), ImageButton).CommandArgument = CType(e.Item.FindControl("idVagaPublicaLabel"), Label).Text

        End If

    End Sub

    Protected Sub IBPesquisa_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBPesquisa.Click
        DataList2.DataSourceID = "SqlDataSource3"
    End Sub

    Protected Sub TrocaDBconn(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataList1.SelectedIndexChanged
        DataList2.DataSourceID = "SqlDataSource2"
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Panel1.Visible = False
    End Sub

    Protected Sub myCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)

        lblIdVagaAberta.Text = e.CommandArgument.ToString
        Panel1.Visible = True

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        Dim sbody As String = ""

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT idVagaPublica, idfuncao, titVagaPublica, dsVagaPublica, email, data, codigo, referencia, publicar FROM tbVagaPublica WHERE (idVagaPublica=" & lblIdVagaAberta.Text & ")"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        Try

            oReader.Read()

            email_info.Text = oReader("email")

            If Not oReader("codigo") Is DBNull.Value Then
                codigo.Text = oReader("codigo") & " - " & oReader("titVagaPublica")
            Else
                codigo.Text = oReader("titVagaPublica")
            End If

            If Not oReader("referencia") Is DBNull.Value Then
                DsVaga.Text = oReader("referencia")
            Else
                DsVaga.Text = ""
            End If

        Catch ex As Exception

        End Try

        oConnection.Close()

    End Sub

    Protected Sub sisEmail_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles sisEmail.Click


        Dim myEmail As New email
        Dim myBody As New BodyEmail
        Dim Body As String = ""
        Dim sBody As String = ""
        Dim dbBody As String = ""

        Dim MODELO As String = "Curriculo"

        Dim URL As String = Replace(Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.Query, ""), Request.UrlReferrer.AbsolutePath, "")

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

        cmd.Parameters("@codigo").Value = codigo.Text.ToString


        prm = New SqlParameter("@apresentacao", SqlDbType.Text, 16)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@apresentacao").Value = aprTextBox.Text.ToString

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
        Body = Body & "<td><br><font face='Verdana' size='2'>Clique no link abaixo para ver o currículo:<br><a href='" & URL & "/_anonimo/mycurriculo.aspx?idUser=" & Session("idUser") & "&id=" & Session("idcurriculo") & "&idRes=" & idpublica.ToString & "'>Para visualizar o currículo [Clique aqui]</a> ou se preferir copie e cole em seu navegador o link abaixo:<br>" & URL & "/_anonimo/mycurriculo.aspx?idUser=" & Session("idUser") & "&id=" & Session("idcurriculo") & "&idRes=" & idpublica.ToString & "</font></td>" & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "</table>" & Chr(10)

        dbBody = dbBody & myBody.GetBody(MODELO, Session("idSetup")).ToString

        sBody = Replace(Replace(dbBody.ToString, "#", Body.ToString), "*", URL)


        myEmail.enviar(sBody, codigo.Text.ToString, email_info.Text.ToString, Application("idsetup"))

        Response.Redirect("vagasweb.aspx")


    End Sub

    Protected Sub btTodas_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btTodas.Click
        DataList2.DataSourceID = "SqlDataTodas"
    End Sub
End Class
