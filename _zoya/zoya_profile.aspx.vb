Imports System.Web.HttpRuntime
Imports System.Web.HttpException
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _zoya_zoya_profile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim idZoyaC As String = ""
        Dim idZoyaZ As String = ""
        Dim idUserZoya As String = ""
        Dim idCurriculoZoya As String = ""

        If Request.QueryString("idZoyaC") <> "" Then

            idZoyaC = Right(Request.QueryString("idZoyaC"), Len(Request.QueryString("idZoyaC")) - 24)
            idZoyaZ = Right(Request.QueryString("idZoyaZ"), Len(Request.QueryString("idZoyaZ")) - 24)
            idUserZoya = Right(Request.QueryString("idUserZoya"), Len(Request.QueryString("idUserZoya")) - 24)
            idCurriculoZoya = Right(Request.QueryString("idcurriculoZoya"), Len(Request.QueryString("idcurriculoZoya")) - 24)

            idZoyaLabel.Text = idZoyaZ
            idCadastroUserZoyaLabel.Text = idZoyaC
            idUserLabel.Text = idUserZoya
            idcurriculoLabel.Text = idCurriculoZoya

            REM ** ****************************************************************************************************
            REM ** CONTADOR ZOYA
            REM ** ****************************************************************************************************


            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("uspContadorZoya", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idZoya", SqlDbType.Int, 4)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@idZoya").Value = idZoyaLabel.Text


            prm = New SqlParameter("@idCadastroUser", SqlDbType.Int, 4)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@idCadastroUser").Value = idCadastroUserZoyaLabel.Text


            prm = New SqlParameter("@idcurriculo", SqlDbType.Int, 4)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@idcurriculo").Value = 0 REM ** CONTADOR DE VIEW (PROFILE)

            cn.Open()

            Try
                Dim dr As SqlDataReader = cmd.ExecuteReader()
                dr.Close()

            Catch ex As Exception

            End Try


            cn.Close()

            REM ** ****************************************************************************************************
            REM ** CONTADOR ZOYA
            REM ** ****************************************************************************************************

            CType(FormView1.FindControl("imageZoyaLabel"), Label).Text = imagemZoyaHTML(idZoyaZ)

        Else

            Response.Redirect("/_zoya")

        End If

        If Session("idCadastroUser") <> "" Then

            Dim HTMLFoto As String = ""
            Dim Foto As String = ""

            Dim oReader As SqlDataReader = Nothing
            Dim oSQL As String
            Dim oConnection As SqlConnection

            oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
            Dim oCommand As SqlCommand

            oSQL = "SELECT nome, foto FROM tbCadastroUser WHERE (idCadastroUser = " + idZoyaC + ")"

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

                HTMLFoto = "<br><br><br><br><br><br><br><br><br><img border='0' src='~/images/candidato/padraoC.gif' width='134' height='131'>"

            End If

            lblFoto.Text = HTMLFoto

            oReader.Close()
            oConnection.Close()

        Else
            Response.Redirect("/")
        End If

    End Sub


    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound

        Dim resCV As CheckBox = CType(FormView1.FindControl("apresentarCVCheckBox"), CheckBox)
        Dim resMM As CheckBox = CType(FormView1.FindControl("apresentarMultimidiaCheckBox"), CheckBox)
        Dim resFC As CheckBox = CType(FormView1.FindControl("apresentarContatoCheckBox"), CheckBox)
        Dim resPP As CheckBox = CType(FormView1.FindControl("publicarCheckBox"), CheckBox)

        Dim lblidfuncao As Label = CType(FormView1.FindControl("idfuncaoLabel"), Label)
        Dim lbltrabalho As Label = CType(FormView1.FindControl("dsTrabalhosPublicadosLabel"), Label)
        Dim lblServico As Label = CType(FormView1.FindControl("dsServicosOferecidosLabel"), Label)
        Dim lblArea As Label = CType(FormView1.FindControl("idAreaAtuacaoPLabel"), Label)

        If resPP.Checked Then
            Session("publicaZoya") = 1
        Else
            Session("publicaZoya") = 0
        End If

        If lblServico.Text <> "" Then
            CType(FormView1.FindControl("lblGeral0"), Label).Visible = True
        Else
            CType(FormView1.FindControl("lblGeral0"), Label).Visible = False
            CType(FormView1.FindControl("dsServicosOferecidosLabel"), Label).Visible = False
        End If

        If lbltrabalho.Text <> "" Then
            CType(FormView1.FindControl("lblGeral1"), Label).Visible = True
        Else
            CType(FormView1.FindControl("lblGeral1"), Label).Visible = False
            CType(FormView1.FindControl("dsTrabalhosPublicadosLabel"), Label).Visible = False
        End If

        If resMM.Checked Then
            ConteudoMultimidia.Text = GetPaginaPrincipal(idCadastroUserZoyaLabel.Text)
        Else
            lblGeralVideos.Visible = False
            FormView2.Visible = False
        End If

        If resFC.Checked Then
            CType(FormView1.FindControl("lblGeralFormaContato"), Label).Visible = True
            CType(FormView1.FindControl("GridView1"), GridView).Visible = True
        Else
            CType(FormView1.FindControl("lblGeralFormaContato"), Label).Visible = False
            CType(FormView1.FindControl("GridView1"), GridView).Visible = False
        End If

        If resCV.Checked Then
            ImageButtonCV.Visible = True
        Else
            ImageButtonCV.Visible = False
        End If

        lblidfuncaoRES.Text = lblidfuncao.Text
        lblAreaRES.Text = lblArea.Text

        GridView2.DataBind()
        GridView3.DataBind()

    End Sub


    Function GetPaginaPrincipal(ByVal idCadastroUserF As String) As Object

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

                    REM EditM = "<a href='zoyaview.aspx?idMultimidia=" & idMultimidia & "'>Editar</a>"

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

    Protected Sub SqlMultimidia_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlMultimidia.Inserting

        e.Command.Parameters("@idCadastroUser").Value = idCadastroUserZoyaLabel.Text
        ConteudoMultimidia.Text = GetPaginaPrincipal(idCadastroUserZoyaLabel.Text)

        e.Command.Parameters("@dsMultimídia").Value = Replace(CType(FormView2.FindControl("dsMultimídiaTextBox"), TextBox).Text, Chr(10), "<br>")

    End Sub

    Protected Sub SqlMultimidia_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlMultimidia.Updating

        e.Command.Parameters("@idCadastroUser").Value = idCadastroUserZoyaLabel.Text
        e.Command.Parameters("@dsMultimídia").Value = Replace(CType(FormView2.FindControl("dsMultimídiaTextBox"), TextBox).Text, Chr(10), "<br>")

    End Sub

    Protected Sub dsMultimídiaTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)

        CType(FormView2.FindControl("dsMultimídiaTextBox"), TextBox).Text = Replace(CType(FormView2.FindControl("dsMultimídiaTextBox"), TextBox).Text, "<br>", "")

    End Sub

    Protected Sub UpdateCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("zoyaview.aspx")
    End Sub


    Protected Sub SqlMultimidia_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlMultimidia.Updated
        ConteudoMultimidia.Text = GetPaginaPrincipal(idCadastroUserZoyaLabel.Text)
        Response.Redirect("zoyaview.aspx")
    End Sub

    Protected Sub SqlMultimidia_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlMultimidia.Inserted
        ConteudoMultimidia.Text = GetPaginaPrincipal(idCadastroUserZoyaLabel.Text)
    End Sub

    Protected Sub dsGeralTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("dsGeralTextBox"), TextBox).Text = Replace(CType(FormView1.FindControl("dsGeralTextBox"), TextBox).Text, "<br>", "")
    End Sub

    Protected Sub dsServicosOferecidosTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("dsServicosOferecidosTextBox"), TextBox).Text = Replace(CType(FormView1.FindControl("dsServicosOferecidosTextBox"), TextBox).Text, "<br>", "")
    End Sub

    Protected Sub dsTrabalhosPublicadosTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("dsTrabalhosPublicadosTextBox"), TextBox).Text = Replace(CType(FormView1.FindControl("dsTrabalhosPublicadosTextBox"), TextBox).Text, "<br>", "")
    End Sub

    Protected Sub SqlZoyaView_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlZoyaView.Updating
        e.Command.Parameters("@dsGeral").Value = Replace(CType(FormView1.FindControl("dsGeralTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@dsServicosOferecidos").Value = Replace(CType(FormView1.FindControl("dsServicosOferecidosTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@dsTrabalhosPublicados").Value = Replace(CType(FormView1.FindControl("dsTrabalhosPublicadosTextBox"), TextBox).Text, Chr(10), "<br>")
    End Sub

    Protected Sub SqlZoyaView_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlZoyaView.Inserting
        e.Command.Parameters("@dsGeral").Value = Replace(CType(FormView1.FindControl("dsGeralTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@dsServicosOferecidos").Value = Replace(CType(FormView1.FindControl("dsServicosOferecidosTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@dsTrabalhosPublicados").Value = Replace(CType(FormView1.FindControl("dsTrabalhosPublicadosTextBox"), TextBox).Text, Chr(10), "<br>")
    End Sub

    Protected Sub SqlZoyaView_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlZoyaView.Updated

        Dim resMM As CheckBox = CType(FormView1.FindControl("apresentarMultimidiaCheckBox"), CheckBox)

        If resMM.Checked Then
            ConteudoMultimidia.Text = GetPaginaPrincipal(idCadastroUserZoyaLabel.Text)
            lblGeralVideos.Visible = True
            FormView2.Visible = True
        Else
            ConteudoMultimidia.Text = GetPaginaPrincipal(0)
            lblGeralVideos.Visible = False
            FormView2.Visible = False
        End If

    End Sub

    REM ** ********************************************************************************************************************
    REM ** CV
    REM ** ********************************************************************************************************************

    Private Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then
            If DirectCast(e.Item.DataItem, DataRowView).Item("portadorDef") Then
                ImageDef.Visible = True
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

    Protected Sub ImageButtonCV_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonCV.Click

        PanelCV.Visible = True

        REM ** ****************************************************************************************************
        REM ** CONTADOR ZOYA
        REM ** ****************************************************************************************************


        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("uspContadorZoya", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idZoya", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idZoya").Value = idZoyaLabel.Text


        prm = New SqlParameter("@idCadastroUser", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idCadastroUser").Value = 0 REM ** CONTADOR DE VIEW (CURRICULO)


        prm = New SqlParameter("@idcurriculo", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idcurriculo").Value = idcurriculoLabel.Text

        cn.Open()

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader()
            dr.Close()

        Catch ex As Exception

        End Try


        cn.Close()

        REM ** ****************************************************************************************************
        REM ** CONTADOR ZOYA
        REM ** ****************************************************************************************************

    End Sub

    Protected Sub ImageButtonPanel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonPanel.Click
        PanelCV.Visible = False
    End Sub

    Protected Sub DataListDp_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListDp.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            LabelDp.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idCadastroUser").ToString

        End If

        If LabelDp.Text.ToString <> "" Then
            DataListDp.ShowHeader = True
        Else
            DataListDp.ShowHeader = False
        End If

    End Sub


    Function imagemZoyaHTML(ByVal idZoya As Integer) As String

        Dim HTMLFoto As String = ""

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        Dim oCommand As SqlCommand

        oSQL = "SELECT idZoya, imageZoya, Descricao, Tamanho, Tipo FROM tbZoya WHERE (idZoya = " & idZoya & ")"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        oReader.Read()

        Try

            If Not oReader("imageZoya") Is DBNull.Value Then
                HTMLFoto = "<img border='0' title='" & oReader("Descricao") & "' src='" & oReader("imageZoya") & "'>"
            End If

        Catch ex As Exception

        End Try

        oReader.Close()
        oConnection.Close()

        Return HTMLFoto

    End Function

End Class
