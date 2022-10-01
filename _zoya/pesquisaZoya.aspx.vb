Imports System.Web.UI.WebControls.Label
Imports System.Web.UI.WebControls.DataList
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _candidato_pesquisaZoya
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("publicaZoya") <> 0 Then
            tablePublicado.Visible = False
        Else
            tablePublicado.Visible = True
        End If

        If Request.QueryString("idZoyaC") <> "" Then
            EnviaConvite(Right(Request.QueryString("idZoyaC"), Len(Request.QueryString("idZoyaC")) - 24), Request.QueryString("idZoyaZ"))
        End If

        LabelMensagem.Text = "<br><b>Defina os parâmetros de pesquisa.</b><br>Para encontrar os profissionais que estão ou não no Zoya, preencha os campos abaixo:"

        msnPsqLabel.Text = "Preencha um dos critérios acima e clique em pesquisar..."
        msnPsqLabel.Visible = True

    End Sub

    Protected Sub IBPesquisaNome_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBPesquisaNome.Click
        DataListPesquisaG.DataSourceID = "SqlPesquisaNome"
    End Sub

    Protected Sub IBPesquisaEmail_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBPesquisaEmail.Click
        DataListPesquisaG.DataSourceID = "SqlPesquisaEmail"
    End Sub

    Protected Sub DataListPesquisaG_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListPesquisaG.ItemDataBound

        Dim A As Integer = 0

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            A = A + 1

            publicarLabelRES.Text = DirectCast(e.Item.DataItem, DataRowView).Item("publicar")

            Dim myLabel As Label = DirectCast(e.Item.FindControl("publicarLabel"), Label)

            If myLabel.Text Then
                myLabel.Text = "<b>Status:</b> Publicado"
            Else
                myLabel.Text = "<b>Status:</b> Não publicado"
            End If

            Dim myButtom As ImageButton = DirectCast(e.Item.FindControl("IBConvite"), ImageButton)

            If DirectCast(e.Item.DataItem, DataRowView).Item("idCadastroUser") <> Session("idCadastroUser") Then
                myButtom.PostBackUrl = "pesquisaZoya.aspx?idZoyaC=" & Session("ticket") & DirectCast(e.Item.DataItem, DataRowView).Item("idCadastroUser") & "&idZoyaZ=" & DirectCast(e.Item.DataItem, DataRowView).Item("idZoya")
            Else
                myButtom.ImageUrl = "~/images/zoya/profile.gif"
                myButtom.Enabled = False
            End If

            Dim myLink As LinkButton = DirectCast(e.Item.FindControl("NomeResponsavelLinkButton"), LinkButton)
            myLink.PostBackUrl = "~/_zoya/zoya_profile.aspx?idZoyaC=" & Session("ticket") & DirectCast(e.Item.DataItem, DataRowView).Item("idCadastroUser") & "&idZoyaZ=" & Session("ticket") & DirectCast(e.Item.DataItem, DataRowView).Item("idZoya") & "&idUserZoya=" & Session("ticket") & DirectCast(e.Item.DataItem, DataRowView).Item("idUser") & "&idcurriculoZoya=" & Session("ticket") & DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo")

            If A = 1 Then
                msnPsqLabel.Text = "Você encontrou " & A & " profissional."
            Else
                msnPsqLabel.Text = "Você encontrou " & A & " profissionais."
            End If

        End If

    End Sub

    Sub EnviaConvite(ByVal idZoyaC As String, ByVal idZoyaZ As String)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("uspIncConviteZoya", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idZoya", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idZoya").Value = idZoyaZ


        prm = New SqlParameter("@idCadastroUser", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idCadastroUser").Value = idZoyaC


        prm = New SqlParameter("@idCadastroUserR", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idCadastroUserR").Value = Session("idCadastroUser")


        prm = New SqlParameter("@msn", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@msn").Value = "Convite para adicionar profile."


        cn.Open()

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader()

            dr.Read()

            Select Case dr("idZoya")

                Case 99999999
                    tablemsn.Visible = False
                    tbG.Visible = False
                    tablemsnerror.Visible = False
                    tablemsnOK.Visible = True
                    notFound.Visible = False
                Case 0
                    tablemsn.Visible = True
                    tbG.Visible = False
                    tablemsnerror.Visible = False
                    tablemsnOK.Visible = False
                    notFound.Visible = False
                Case Else
                    tablemsn.Visible = False
                    tbG.Visible = False
                    tablemsnerror.Visible = True
                    tablemsnOK.Visible = False
                    notFound.Visible = False
            End Select

            dr.Close()

        Catch ex As Exception

        End Try


        cn.Close()

    End Sub

End Class
