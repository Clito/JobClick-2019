Imports System.Web.UI.WebControls.Label
Imports System.Web.UI.WebControls.DataList
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _empresa__processo_validaCV
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        idvagaLabel.Text = Request.QueryString("idvaga")
        idcurriculoLabel.Text = Request.QueryString("idcurriculo")
        idProcessoLabel.Text = Request.QueryString("id")
        idUserLabel.Text = Request.QueryString("idUser")
        idCadastroUserLabel.Text = Request.QueryString("idCadastroUser")

        LBVoltar.PostBackUrl = "processo.aspx?id=" & idProcessoLabel.Text & "&idvaga=" & idvagaLabel.Text & "&dsProcesso=" & Request.QueryString("dsProcesso")

        MultimidiaLabel.Text = GetMultimidia(idCadastroUserLabel.Text)


        If idcurriculoLabel.Text <> "" Then

            REM ** *****************************************************************************
            REM ** FOTO DO CANDIDATO
            REM ** *****************************************************************************

            Dim HTMLFoto As String = ""
            Dim Foto As String = ""

            Dim oReader As SqlDataReader = Nothing
            Dim oSQL As String
            Dim oConnection As SqlConnection

            oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
            Dim oCommand As SqlCommand

            oSQL = "SELECT nome, foto FROM tbCadastroUser WHERE (idCadastroUser = " + idUserLabel.Text + ")"

            oConnection.Open()

            oCommand = New SqlCommand(oSQL, oConnection)
            oReader = oCommand.ExecuteReader()

            If oReader.HasRows() Then

                oReader.Read()

                Try

                    If Not oReader("foto") Is DBNull.Value Then
                        Foto = "<img border='0' title='" & oReader("nome") & "' src='" & oReader("foto") & "' width='110' height='110'>"
                    Else
                        Foto = "<img border='0' title='Foto não publicada!' src='/_candidato/foto/null.gif' width='110' height='110'>"
                    End If

                Catch ex As Exception

                End Try


                HTMLFoto = HTMLFoto & "<table border='0' id='MyFoto' cellspacing='0' cellpadding='0'>" & Chr(10)
                HTMLFoto = HTMLFoto & "<tr>" & Chr(10)
                HTMLFoto = HTMLFoto & "<td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<img border='0' src='/images/layout/fotoe.gif' width='13' height='5'></td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<img border='0' src='/images/layout/fotoc.gif' width='110' height='5'></td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<img border='0' src='/images/layout/fotod.gif' width='11' height='5'></td>" & Chr(10)
                HTMLFoto = HTMLFoto & "</tr>" & Chr(10)
                HTMLFoto = HTMLFoto & "<tr>" & Chr(10)
                HTMLFoto = HTMLFoto & "<td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<img border='0' src='/images/layout/fotoe.gif' width='13' height='5'></td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<td valign='top'>" & Foto & "</td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<img border='0' src='/images/layout/fotod.gif' width='11' height='5'></td>" & Chr(10)
                HTMLFoto = HTMLFoto & "</tr>" & Chr(10)
                HTMLFoto = HTMLFoto & "<tr>" & Chr(10)
                HTMLFoto = HTMLFoto & "<td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<img border='0' src='/images/layout/fotoe.gif' width='13' height='5'></td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<img border='0' src='/images/layout/fotoc.gif' width='110' height='5'></td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<img border='0' src='/images/layout/fotod.gif' width='11' height='5'></td>" & Chr(10)
                HTMLFoto = HTMLFoto & "</tr>" & Chr(10)
                HTMLFoto = HTMLFoto & "</table>" & Chr(10)


            Else

                HTMLFoto = "<br><br><br><br><br><br><br><br><br>"

            End If

            lblFoto.Text = HTMLFoto

            oReader.Close()
            oConnection.Close()

        End If

    End Sub



    REM ** *******************************************************************************************************
    REM ** CURRICULO
    REM ** *******************************************************************************************************

    Private Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then
            If DirectCast(e.Item.DataItem, DataRowView).Item("portadorDef") Then
                ImageDef.Visible = True
            Else
                ImageDef.Visible = False
            End If
        End If

    End Sub


    Private Sub DataList4_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList4.ItemDataBound


        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label25.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label25.Text.ToString <> "" Then
            DataList4.ShowHeader = True
        Else
            DataList4.ShowHeader = False
        End If

    End Sub


    Private Sub DataList5_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList5.ItemDataBound


        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label31.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo")

            Dim myLabel As Label = DirectCast(e.Item.FindControl("concluidoLabel"), Label)

            If myLabel.Text Then
                myLabel.Text = "Curso concluído"
            Else
                myLabel.Text = "Curso não concluído"
            End If

        End If

        If Label31.Text.ToString <> "" Then
            DataList5.ShowHeader = True
        Else
            DataList5.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList6_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList6.ItemDataBound


        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label41.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label41.Text.ToString <> "" Then
            DataList6.ShowHeader = True
        Else
            DataList6.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList7_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList7.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label42.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label42.Text.ToString <> "" Then
            DataList7.ShowHeader = True
        Else
            DataList7.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList8_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList8.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label43.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label43.Text.ToString <> "" Then
            DataList8.ShowHeader = True
        Else
            DataList8.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList9_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList9.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label44.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label44.Text.ToString <> "" Then
            DataList9.ShowHeader = True
        Else
            DataList9.ShowHeader = False
        End If

    End Sub


    Function GetMultimidia(ByVal idCadastroUserF As String) As String

        Dim HTML As String = ""
        Dim HTMLFoto As String = ""
        Dim Foto As String = ""
        Dim EditM As String = ""

        If idCadastroUserF <> "" Then

            Dim oReader As SqlDataReader = Nothing
            Dim oSQL As String
            Dim oConnection As SqlConnection

            oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
            Dim oCommand As SqlCommand

            oSQL = "SELECT idMultimidia, idCadastroUser, url, dsMultimídia FROM tbMultimidia WHERE (idCadastroUser = " + idCadastroUserF + ")"

            oConnection.Open()


            oCommand = New SqlCommand(oSQL, oConnection)
            oReader = oCommand.ExecuteReader()

            If oReader.HasRows() Then

                HTML = HTML & "<table width='350px' border='0' cellpadding='0' cellspacing='0'>" & Chr(10)

                Do While oReader.Read()

                    Dim idMultimidia As Integer = oReader("idMultimidia")
                    Dim idCadastroUser As String = oReader("idCadastroUser")
                    Dim url As String = Replace(oReader("url"), "/watch?v=", "/v/")
                    Dim dsMultimídia As String = oReader("dsMultimídia")

                    EditM = ""

                    HTML = HTML & "<tr>" & Chr(10)
                    HTML = HTML & "<td width='175px' valign='top'><object width='175' height='134'><param name='movie' value='" & url & "'></param><param name='wmode' value='transparent'></param><embed src='" & url & "' type='application/x-shockwave-flash' wmode='transparent' width='175' height='134'></embed></object></td>" & Chr(10)
                    HTML = HTML & "<td width='20px' valign='top'></td>" & Chr(10)
                    HTML = HTML & "<td width='175px' valign='top'>" & dsMultimídia & "<br><br>" & EditM & "</td>" & Chr(10)
                    HTML = HTML & "</tr>" & Chr(10)
                    HTML = HTML & "<tr>" & Chr(10)
                    HTML = HTML & "<td width='20px'><img border='0' src='/images/20px.gif' width='20' height='20'></td>" & Chr(10)
                    HTML = HTML & "<td width='20px' valign='top'></td>" & Chr(10)
                    HTML = HTML & "<td width='20px'><img border='0' src='/images/20px.gif' width='20' height='20'></td>" & Chr(10)
                    HTML = HTML & "</tr>" & Chr(10)

                Loop

                HTML = HTML & "</table>" & Chr(10)

            End If

            oReader.Close()
            oConnection.Close()

        End If

        Return HTML

    End Function

    Protected Sub IBFechar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBFechar.Click

        Response.Redirect("processo.aspx?id=" & idProcessoLabel.Text & "&idvaga=" & idvagaLabel.Text & "&dsProcesso=" & Request.QueryString("dsProcesso"))

    End Sub


    Protected Sub IBIncluir_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBIncluir.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spProcessoSeletivo_Insert", cn)
        cmd.CommandType = CommandType.StoredProcedure


        prm = New SqlParameter("@idvaga", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idvaga").Value = idvagaLabel.Text

        prm = New SqlParameter("@idcurriculo", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idcurriculo").Value = idcurriculoLabel.Text


        prm = New SqlParameter("@apresentacao", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@apresentacao").Value = "Seu currículo foi selecionado pelo sistema de busca JobClick."

        prm = New SqlParameter("@msnRH", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@msnRH").Value = "Seu CV foi selecionado para avaliação."


        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader
        dr.Close()

        cn.Close()

        Response.Redirect("processo.aspx?id=" & idProcessoLabel.Text & "&idvaga=" & idvagaLabel.Text & "&dsProcesso=" & Request.QueryString("dsProcesso"))

    End Sub

End Class
