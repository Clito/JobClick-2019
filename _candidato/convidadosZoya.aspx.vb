Imports System.Web.UI.WebControls.Label
Imports System.Web.UI.WebControls.DataList
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _candidato_convidadosZoya
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (IsPostBack) Then
            If idZoyaConvLabel.Text = "" Then
                FormView1.ChangeMode(FormViewMode.ReadOnly)
                FormView1.DataBind()
            Else
                FormView1.ChangeMode(FormViewMode.Insert)
                FormView1.DataBind()
            End If
        End If

    End Sub

    Protected Sub DataListPesquisaG_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListPesquisaG.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            publicarLabelRES.Text = DirectCast(e.Item.DataItem, DataRowView).Item("publicar")

            Dim myLabel As Label = DirectCast(e.Item.FindControl("publicarLabel"), Label)

            If myLabel.Text Then
                myLabel.Text = "<b>Status:</b> Publicado"
            Else
                myLabel.Text = "<b>Status:</b> Não publicado"
            End If

            Dim myidZoyaRel As Label = DirectCast(e.Item.FindControl("idZoyaRelLabel"), Label)
            Dim myidCadastroUser As Label = DirectCast(e.Item.FindControl("idCadastroUserLabel"), Label)


            Dim myLinkDel As ImageButton = DirectCast(e.Item.FindControl("ImageButtonDEL"), ImageButton)
            myLinkDel.CommandArgument = myidZoyaRel.Text

            Dim myLinkDep As ImageButton = DirectCast(e.Item.FindControl("ImageButtonDp"), ImageButton)
            myLinkDep.CommandArgument = myidCadastroUser.Text

            Dim myLink As LinkButton = DirectCast(e.Item.FindControl("NomeResponsavelLinkButton"), LinkButton)
            myLink.PostBackUrl = "~/_zoya/zoya_profile.aspx?idZoyaC=" & Session("ticket") & DirectCast(e.Item.DataItem, DataRowView).Item("idCadastroUser") & "&idZoyaZ=" & Session("ticket") & DirectCast(e.Item.DataItem, DataRowView).Item("idZoyaZoya") & "&idUserZoya=" & Session("ticket") & DirectCast(e.Item.DataItem, DataRowView).Item("idUser") & "&idcurriculoZoya=" & Session("ticket") & DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo")

        End If

    End Sub

    Protected Sub DataListPesquisaG_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataListPesquisaG.SelectedIndexChanged

        idZoyaConvLabel.Text = DataListPesquisaG.SelectedValue

        If idZoyaConvLabel.Text = "" Then
            FormView1.ChangeMode(FormViewMode.ReadOnly)
            GridView1.Visible = True
            DataListPesquisaG.Visible = True
            FormView1.DataBind()
        Else
            FormView1.ChangeMode(FormViewMode.Insert)
            GridView1.Visible = False
            DataListPesquisaG.Visible = False
            FormView1.DataBind()

            REM ** RECUPERA DADOS DO PROFISSIONAL
            REM ** **********************************************************************************************************
            Dim dr As SqlDataReader = Nothing
            Dim sSQL As String
            Dim Connection As SqlConnection

            Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            Dim command As SqlCommand

            sSQL = "SELECT idZoya, idCadastroUser, NomeResponsavel, emailRecados FROM tbZoya WHERE (idCadastroUser = " & idZoyaConvLabel.Text & ")"

            Try

                Connection.Open()

                command = New SqlCommand(sSQL, Connection)
                dr = command.ExecuteReader()

                If dr.HasRows() Then

                    dr.Read()
                    CType(FormView1.FindControl("LabelNomeResponsavel"), Label).Text = "Mensagem será enviada para: <b>" & dr("NomeResponsavel") & "</b>"
                    CType(FormView1.FindControl("idCadastroUserRTextBox"), TextBox).Text = Session("idCadastroUser")
                    CType(FormView1.FindControl("idCadastroUserTextBox"), TextBox).Text = dr("idCadastroUser")
                    CType(FormView1.FindControl("nomeTextBox"), TextBox).Text = Session("nome")
                    CType(FormView1.FindControl("emailTextBox"), TextBox).Text = Session("emailUser")

                End If

            Catch ex As SqlClient.SqlException

            Finally

                dr.Close()
                Connection.Close()

            End Try

        End If

    End Sub


    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

        idZoyaConvLabel.Text = ""

        If idZoyaConvLabel.Text = "" Then
            FormView1.ChangeMode(FormViewMode.ReadOnly)
            GridView1.Visible = True
            DataListPesquisaG.Visible = True
            FormView1.DataBind()
        Else
            FormView1.ChangeMode(FormViewMode.Insert)
            GridView1.Visible = False
            FormView1.DataBind()
        End If

    End Sub

    Protected Sub SqlOutlookZoya_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlOutlookZoya.Inserted
        tablemsnOK.Visible = True
        FormView1.Visible = False
    End Sub

    Protected Sub myCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)


        Select Case e.CommandName
            Case "D"
                idGeralLabel.Text = e.CommandArgument
                FormViewDEP.Visible = True
            Case "E"
                ExcluirRel(e.CommandArgument)
        End Select

    End Sub

    Protected Sub InsertCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        FormViewDEP.Visible = False
    End Sub

    Protected Sub SqlDepoimento_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDepoimento.Inserting

        e.Command.Parameters("@idCadastroUser").Value = idGeralLabel.Text
        e.Command.Parameters("@idCadastroUserD").Value = Session("idCadastroUser")

    End Sub

    Protected Sub SqlDepoimento_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDepoimento.Inserted
        FormViewDEP.Visible = False
        GridView1.Visible = False
        DataListPesquisaG.Visible = False
        lblmsn.Text = "Seu depoimento foi enviado com sucesso!"
        tablemsnOK.Visible = True
    End Sub

    Sub ExcluirRel(ByVal idZoyaRel As String)

        Dim dr As SqlDataReader = Nothing
        Dim sSQL As String
        Dim Connection As SqlConnection
        Dim idCadastroUserR As String = ""
        Dim idCadastroUser As String = ""

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT idZoyaRel, idCadastroUser, idCadastroUserR FROM tbZoyaRelacionamento WHERE(idZoyaRel = " & idZoyaRel & ")"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then

                dr.Read()
                idCadastroUserR = dr("idCadastroUserR")
                idCadastroUser = dr("idCadastroUser")

            End If

        Catch ex As SqlClient.SqlException

        Finally

            dr.Close()
            Connection.Close()

        End Try

        Dim oSQLDEL1 As String = "DELETE FROM tbZoyaRelacionamento WHERE (idCadastroUser = " & idCadastroUser & ") AND (idCadastroUserR = " & idCadastroUserR & ")"

        Try

            Connection.Open()

            command = New SqlCommand(oSQLDEL1, Connection)
            dr = command.ExecuteReader()

        Catch ex As SqlClient.SqlException

        Finally

            dr.Close()
            Connection.Close()

        End Try


        Dim oSQLDEL2 As String = "DELETE FROM tbZoyaRelacionamento WHERE (idCadastroUser = " & idCadastroUserR & ") AND (idCadastroUserR = " & idCadastroUser & ")"

        Try

            Connection.Open()

            command = New SqlCommand(oSQLDEL2, Connection)
            dr = command.ExecuteReader()

        Catch ex As SqlClient.SqlException

        Finally

            dr.Close()
            Connection.Close()

        End Try

        GridView1.DataBind()
        DataListPesquisaG.DataBind()

    End Sub

End Class
