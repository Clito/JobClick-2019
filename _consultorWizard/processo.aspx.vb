Imports System.Web.UI.WebControls.Label
Imports System.Web.UI.WebControls.DataList
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _empresa__processo_processo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        idVagaLabel.Text = Request.QueryString("idvaga")
        idProcessoSeletivoLabel.Text = Request.QueryString("id")
        lblTituloProcesso.Text = "[" & Request.QueryString("dsProcesso") & "]"

        PanelcurriculoView.Visible = False

        idcurriculoLabel.Text = ""
        idUserLabel.Text = ""

        Label31.Text = ""
        Label25.Text = ""
        Label41.Text = ""
        Label42.Text = ""
        Label43.Text = ""
        Label44.Text = ""

        PStable(idVagaLabel.Text)

        LBEditFiltroPessoal.PostBackUrl = "filtro.aspx?dsProcesso=" & Request.QueryString("dsProcesso") & "&idProcessoSeletivo=" & Request.QueryString("id") & "&idvaga=" & Request.QueryString("idvaga")

    End Sub



    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        idcurriculoLabel.Text = GridView1.DataKeys(GridView1.SelectedIndex).Values("idcurriculo")
        idRELcandidato_vagaRES.Text = GridView1.DataKeys(GridView1.SelectedIndex).Values("idRELcandidato_vaga")
        idUserLabel.Text = GridView1.DataKeys(GridView1.SelectedIndex).Values("idUser")

        If Not GridView1.DataKeys(GridView1.SelectedIndex).Values("idMultimidia") Is DBNull.Value Then
            idmultimidiaLabel.Text = GridView1.DataKeys(GridView1.SelectedIndex).Values("idMultimidia")
        Else
            idmultimidiaLabel.Text = "0"
        End If

        MultimidiaLabel.Text = GetMultimidia(GridView1.DataKeys(GridView1.SelectedIndex).Values("idCadastroUser"))

        If idcurriculoLabel.Text <> "" Then

            If CommandLabel.Text = "cv" Or CommandLabel.Text = "edt" Then

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

        End If


        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spContadorCV", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idRELcandidato_vaga", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idRELcandidato_vaga").Value = idRELcandidato_vagaRES.Text

        cn.Open()

        Try

            Dim dr As SqlDataReader = cmd.ExecuteReader()
            dr.Close()

        Catch ex As Exception

        End Try


        cn.Close()

    End Sub




    Protected Sub GridView2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.SelectedIndexChanged

        idRELcandidato_vagaRES.Text = GridView2.DataKeys(GridView2.SelectedIndex).Values("idRELcandidato_vaga")
        idcurriculoLabel.Text = GridView2.DataKeys(GridView2.SelectedIndex).Values("idcurriculo")
        idUserLabel.Text = GridView2.DataKeys(GridView2.SelectedIndex).Values("idUser")

        If Not GridView2.DataKeys(GridView2.SelectedIndex).Values("idMultimidia") Is DBNull.Value Then
            idmultimidiaLabel.Text = GridView2.DataKeys(GridView2.SelectedIndex).Values("idMultimidia")
        Else
            idmultimidiaLabel.Text = "0"
        End If

        MultimidiaLabel.Text = GetMultimidia(GridView2.DataKeys(GridView2.SelectedIndex).Values("idCadastroUser"))

        If idcurriculoLabel.Text <> "" Then

            If CommandLabel.Text = "cv" Or CommandLabel.Text = "edt" Then

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

        End If


        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spContadorCV", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idRELcandidato_vaga", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idRELcandidato_vaga").Value = idRELcandidato_vagaRES.Text

        cn.Open()

        Try

            Dim dr As SqlDataReader = cmd.ExecuteReader()
            dr.Close()

        Catch ex As Exception

        End Try


        cn.Close()

    End Sub




    Protected Sub myCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)

        Select Case e.CommandArgument
            Case "cv"
                CommandLabel.Text = e.CommandArgument
                PanelcurriculoView.Visible = True
                ComandoButton.Visible = True
                ComandoEdit.Visible = False
            Case "edt"
                CommandLabel.Text = e.CommandArgument
                PanelcurriculoView.Visible = True
                ComandoButton.Visible = False
                ComandoEdit.Visible = True
        End Select

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

    Protected Sub IBFechar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBFechar.Click, IBFechar2.Click

        PanelcurriculoView.Visible = False
        idcurriculoLabel.Text = ""
        idRELcandidato_vagaRES.Text = ""
        idUserLabel.Text = ""
        GridView1.DataBind()

    End Sub


    Protected Sub IBIncluir_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBIncluir.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spProcessoSeletivo", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@indicador", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@indicador").Value = 1

        prm = New SqlParameter("@idRELcandidato_vaga", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idRELcandidato_vaga").Value = idRELcandidato_vagaRES.Text

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader
        dr.Close()

        cn.Close()

        GridView1.DataBind()
        GridView2.DataBind()

    End Sub

    Protected Sub IBLiberar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBLiberar.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spProcessoSeletivo", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@indicador", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@indicador").Value = 999

        prm = New SqlParameter("@idRELcandidato_vaga", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idRELcandidato_vaga").Value = idRELcandidato_vagaRES.Text

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader
        dr.Close()

        cn.Close()

        GridView1.DataBind()
        GridView2.DataBind()

    End Sub


    Sub PStable(ByVal idVaga As String)

        Dim HTML As String = ""

        If idVaga <> "" Then

            Dim oSQL As String = "SELECT idRELcandidato_vaga, idvaga, idcurriculo, apresentacao, liberarRH, liberarCandidato, msnRH, GerarProcesso, contador, data, dataRes, nome, url, dsMultimídia, idUser, idMultimidia, idCadastroUser FROM vwPS WHERE (idvaga = " & idVaga & ") AND (GerarProcesso = 1) AND (liberarCandidato = 0)"
            Dim oReader As SqlDataReader = Nothing
            Dim oConnection As SqlConnection

            oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
            Dim oCommand As SqlCommand


            oConnection.Open()


            oCommand = New SqlCommand(oSQL, oConnection)
            oReader = oCommand.ExecuteReader()

            If oReader.HasRows() Then

                HTML = HTML & "<table border='0' width='614' cellpadding='0' cellspacing='0' id='PS'>" & Chr(10)
                HTML = HTML & "<tr>" & Chr(10)
                HTML = HTML & "<td width='574px'><span class='textBold'>Candidatos selecionados</span></td>" & Chr(10)
                HTML = HTML & "<td width='20px'><img src='/images/layout/psCV.gif'></td>" & Chr(10)
                HTML = HTML & "<td width='20px'><img src='/images/layout/PSreprovado.gif'></td>" & Chr(10)
                HTML = HTML & "</tr>" & Chr(10)

                Do While oReader.Read()

                    HTML = HTML & "<tr>" & Chr(10)
                    HTML = HTML & "<td width='574px'>" & oReader("nome") & "</td>" & Chr(10)
                    HTML = HTML & "<td width='20px'><img src='/images/layout/PSlinkIntCV.gif'></td>" & Chr(10)
                    HTML = HTML & "<td width='20px'><input type='image' value='Botão' name='B3' img src='/images/layout/PSlinkIntCV.gif' CommandName='Select' oncommand='myCommand'></td>" & Chr(10)
                    HTML = HTML & "</tr>" & Chr(10)

                Loop

                HTML = HTML & "</table>" & Chr(10)

            End If

            oReader.Close()
            oConnection.Close()

        End If

        'HTMLPS.Text = HTML

    End Sub

    Protected Sub SqlPS_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlPS.Updated
        GridView1.DataBind()
        GridView2.DataBind()
    End Sub

    Protected Sub IBLiberarPS_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBLiberar2.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spProcessoSeletivo", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@indicador", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@indicador").Value = 0

        prm = New SqlParameter("@idRELcandidato_vaga", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idRELcandidato_vaga").Value = idRELcandidato_vagaRES.Text

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader
        dr.Close()

        cn.Close()

        GridView1.DataBind()
        GridView2.DataBind()

    End Sub


    Protected Sub GridView3_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView3.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

            GridView3.ShowHeader = False

            Dim myButton = New ImageButton()

            If e.Row.RowState = DataControlRowState.Normal Or e.Row.RowState = DataControlRowState.Alternate Then
                myButton = e.Row.FindControl("IBSelect")
                myButton.ImageUrl = "~/images/selectRow.gif"
                myButton.PostBackUrl = "validaCV.aspx?id=" & idProcessoSeletivoLabel.Text & "&idvaga=" & idVagaLabel.Text & "&idcurriculo=" & e.Row.Cells(1).Text & "&idUser=" & e.Row.Cells(3).Text & "&idCadastroUser=" & e.Row.Cells(2).Text & "&dsProcesso=" & Request.QueryString("dsProcesso")

                e.Row.Cells(0).Visible = False
                e.Row.Cells(1).Visible = False
                e.Row.Cells(2).Visible = False
                e.Row.Cells(3).Visible = False

            End If

        End If

    End Sub
End Class
