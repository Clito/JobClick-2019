Imports System.Web.UI.WebControls.Label
Imports System.Web.UI.WebControls.DataList
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull


Partial Class _candidato_mycurriculoDOC
    Inherits System.Web.UI.Page

    Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("id") <> "" Then

            REM ** *****************************************************************************
            REM ** FOTO DO CANDIDATO
            REM ** *****************************************************************************

            Dim HTMLFoto As String = ""
            Dim Foto As String = ""
            Dim TheFoto As String = ""
            Dim URL As String = "http://www.jobclick.com.br"

            REM ** *****************************************************************************
            REM ** IMAGEM 
            REM ** *****************************************************************************

            Dim oReader As SqlDataReader = Nothing
            Dim oSQL As String
            Dim oConnection As SqlConnection

            oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
            Dim oCommand As SqlCommand

            oSQL = "SELECT nome, foto FROM tbCadastroUser WHERE (idCadastroUser = " + Request.QueryString("idUser") + ")"

            oConnection.Open()

            oCommand = New SqlCommand(oSQL, oConnection)
            oReader = oCommand.ExecuteReader()

            If oReader.HasRows() Then

                oReader.Read()

                Try

                    If Not oReader("foto") Is DBNull.Value Then

                        TheFoto = oReader("foto")

                        Foto = "<img border='0' title='" & oReader("nome") & "' src='http://www.jobclick.com.br" & TheFoto & "' width='110' height='110'>"
                    Else
                        Foto = "<img border='0' title='Foto não publicada!' src='http://www.jobclick.com.br/_candidato/foto/null.gif' width='110' height='110'>"
                    End If

                Catch ex As Exception

                End Try


                HTMLFoto = HTMLFoto & "<table border='0' id='MyFoto' cellspacing='0' cellpadding='0'>" & Chr(10)
                HTMLFoto = HTMLFoto & "<tr>" & Chr(10)
                HTMLFoto = HTMLFoto & "<td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<img border='0' src='http://www.jobclick.com.br/images/layout/fotoe.gif' width='13' height='5'></td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<img border='0' src='http://www.jobclick.com.br/images/layout/fotoc.gif' width='110' height='5'></td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<img border='0' src='http://www.jobclick.com.br/images/layout/fotod.gif' width='11' height='5'></td>" & Chr(10)
                HTMLFoto = HTMLFoto & "</tr>" & Chr(10)
                HTMLFoto = HTMLFoto & "<tr>" & Chr(10)
                HTMLFoto = HTMLFoto & "<td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<img border='0' src='http://www.jobclick.com.br/images/layout/fotoe.gif' width='13' height='5'></td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<td valign='top'>" & Foto & "</td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<img border='0' src='http://www.jobclick.com.br/images/layout/fotod.gif' width='11' height='5'></td>" & Chr(10)
                HTMLFoto = HTMLFoto & "</tr>" & Chr(10)
                HTMLFoto = HTMLFoto & "<tr>" & Chr(10)
                HTMLFoto = HTMLFoto & "<td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<img border='0' src='http://www.jobclick.com.br/images/layout/fotoe.gif' width='13' height='5'></td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<img border='0' src='http://www.jobclick.com.br/images/layout/fotoc.gif' width='110' height='5'></td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<td>" & Chr(10)
                HTMLFoto = HTMLFoto & "<img border='0' src='http://www.jobclick.com.br/images/layout/fotod.gif' width='11' height='5'></td>" & Chr(10)
                HTMLFoto = HTMLFoto & "</tr>" & Chr(10)
                HTMLFoto = HTMLFoto & "</table>" & Chr(10)


            Else

                HTMLFoto = "<br><br><br><br><br><br><br><br><br><img border='0' src='http://www.jobclick.com.br/images/candidato/padraoC.gif' width='134' height='131'>"

            End If

            lblFoto.Text = HTMLFoto

            oReader.Close()
            oConnection.Close()

        Else

            Response.Redirect("/")

        End If

    End Sub


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

End Class
