Imports System.Web.UI.WebControls.Label
Imports System.Web.UI.WebControls.DataList
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class profile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("idProfile") <> "" Then
            idProfileLabel.Text = Request.QueryString("idProfile")
        Else
            Response.Redirect("/")
        End If

        Try
            ImageButtonBack.PostBackUrl = "profissional_jobclick.aspx?idindex=" & Request.QueryString("idindex")
            HyperLinkPesquisa.NavigateUrl = "profissional_jobclick.aspx?idindex=" & Request.QueryString("idindex")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DataListProfile_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListProfile.ItemDataBound

        If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.SelectedItem Then

            Dim privacidadeLabel As Label = DirectCast(e.Item.FindControl("privacidadeLabel"), Label)
            Dim nomeLabel As Label = DirectCast(e.Item.FindControl("nomeLabel"), Label)
            Dim idCadastroUserLabel As Label = DirectCast(e.Item.FindControl("idCadastroUserLabel"), Label)
            Dim ImageCandidato As Image = DirectCast(e.Item.FindControl("ImageCandidato"), Image)
            Dim MultimidiaLabel As Label = DirectCast(e.Item.FindControl("MultimidiaLabel"), Label)
            Dim sexoLabel As Label = DirectCast(e.Item.FindControl("sexoLabel"), Label)
            MultimidiaLabel.Text = GetMultimidia(idCadastroUserLabel.Text)

            If DirectCast(e.Item.FindControl("privacidadeLabel"), Label).Text Then
                nomeLabel.Text = "Privacidade requerida"
                ImageCandidato.ImageUrl = "/_candidato/foto/null_privacidade.gif"
            Else
                If ImageCandidato.ImageUrl.ToString = "" Then
                    Select Case sexoLabel.Text
                        Case "Feminino"
                            ImageCandidato.ImageUrl = "/_candidato/foto/null_feminino.gif"
                        Case "Masculino"
                            ImageCandidato.ImageUrl = "/_candidato/foto/null_masculino.gif"
                    End Select
                End If
            End If

        End If

    End Sub

    Function GetMultimidia(ByVal idCadastroUserF As String) As Object

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

                    EditM = "" '"<a href='zoyaview.aspx?idMultimidia=" & idMultimidia & "'>Editar</a>"

                    HTML = HTML & "<tr>" & Chr(10)
                    HTML = HTML & "<td width='175px' valign='top'><object width='175' height='134'><param name='movie' value='" & url & "'></param><param name='wmode' value='transparent'></param><embed src='" & url & "' type='application/x-shockwave-flash' wmode='transparent' width='175' height='134'></embed></object></td>" & Chr(10)
                    HTML = HTML & "<td width='20px' valign='top'></td>" & Chr(10)
                    HTML = HTML & "<td width='175px' valign='top'>" & dsMultimídia & "<br><br>" & EditM & "</td>" & Chr(10)
                    HTML = HTML & "</tr>" & Chr(10)
                    HTML = HTML & "<tr>" & Chr(10)
                    HTML = HTML & "<td><img border='0' src='/images/20px.gif' width='20' height='20'></td>" & Chr(10)
                    HTML = HTML & "<td width='20px' valign='top'></td>" & Chr(10)
                    HTML = HTML & "<td><img border='0' src='/images/20px.gif' width='20' height='20'></td>" & Chr(10)
                    HTML = HTML & "</tr>" & Chr(10)

                Loop

                HTML = HTML & "</table>" & Chr(10)

            End If

            oReader.Close()
            oConnection.Close()

        End If

        Return HTML

    End Function

    Protected Sub LinkButtonAdicionar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButtonAdicionar.Click
        PanelLogin.Visible = True
        PanelLogin.Focus()
        userTB.Focus()
        lblStatusBotton.Text = "vaga"
    End Sub

    Protected Sub ImageButtonAdd_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAdd.Click
        PanelLogin.Visible = True
        PanelLogin.Focus()
        userTB.Focus()
        lblStatusBotton.Text = "vaga"
    End Sub

    Protected Sub IBClose_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBClose.Click
        msn.Text = ""
        candidatar.Visible = False
        help.Visible = False
        PanelLogin.Visible = False
        email.Visible = False
    End Sub

    Protected Sub InsertCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles FecharLB.Click

        lblStatusBotton.Text = ""

        PanelLogin.Visible = False
        candidatar.Visible = False
        email.Visible = False
        help.Visible = False

        msnRel.Text = ""
        msnDuv.Text = ""

    End Sub



    Protected Sub ImageButtonLogin_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonLogin.Click

        LoginVaga.Visible = False

        Dim sUser As String = Replace(userTB.Text, "'", "")
        Dim sPwd As String = Replace(senhaTB.Text, "'", "")
        Dim sEml As String = Replace(emailTB.Text, "'", "")
        Dim idUser As Int32 = 0

        Dim dr As SqlDataReader = Nothing
        Dim sSQL As String
        Dim Connection As SqlConnection

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT idUser, userName, password, email, bloquear, grupo, idcurriculo, dscurriculo, nome FROM vwuser_pocket WHERE (userName = '" & sUser & "') AND (password = '" & sPwd & "') AND (email='" & sEml & "')"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then

                dr.Read()
                lblidUser.Text = dr("idUser")
                lblemail.Text = dr("email")
                lblnome.Text = dr("nome") & ","
                aprStatus.Visible = True

            Else

                LoginVaga.Visible = True
                msn.Text = "<br>Verifique seus dados de acesso...<br>Obs.: É obrigatório ser uma empresa cadastrada!<br><a href='/_anonimo/cadastroEmpresa.aspx'>Cadastre sua empresa agora!</a>"

            End If

        Catch ex As SqlClient.SqlException

        Finally

            dr.Close()
            Connection.Close()

        End Try

    End Sub

End Class
