Imports System.Web.HttpRuntime
Imports System.Web.HttpException
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports user


Partial Class _candidato_zoyaGeral
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        lblInst.Text = "Para participar do Zoya, preencha o formulário abaixo.<br>Estas serão as informações apresentadas em seu <b>Marketing Pessoal</b>."

        Dim oSQL As String = ""
        Dim oReader As SqlDataReader = Nothing
        Dim oConnection As SqlConnection
        Dim zoyaView As String = ""

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        Dim oCommand As SqlCommand

        oSQL = "SELECT tbCadastroUser.idCadastroUser, tbZoya.idZoya FROM tbCadastroUser LEFT OUTER JOIN tbZoya ON tbCadastroUser.idCadastroUser = tbZoya.idCadastroUser WHERE (tbCadastroUser.idCadastroUser = " & Session("idCadastroUser") & ")"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        If oReader.HasRows() Then

            oReader.Read()

            Try

                If Not oReader("idZoya") Is DBNull.Value Then
                    FormView1.DefaultMode = FormViewMode.Edit
                Else
                    FormView1.DefaultMode = FormViewMode.Insert
                End If

            Catch ex As Exception

            End Try

        Else

        End If

        oReader.Close()
        oConnection.Close()

        formPesquisa.Visible = True

    End Sub


    Protected Sub TxtBoxC(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSourcePsq.Selecting

        If Len(TextBox1.Text) >= 5 Then
            Dim SearchTxt As String = Replace(TextBox1.Text, " ", "%")
            e.Command.Parameters("@buscador").Value = "%" & SearchTxt & "%"
        Else
            e.Command.Parameters("@buscador").Value = ""
        End If

    End Sub

    Protected Sub GetInfo(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.SelectedIndexChanged
        resTxt.Text = Convert.ToInt32(GridView2.SelectedValue)
        CType(FormView1.FindControl("idfuncaoTextBox"), TextBox).Text = Convert.ToInt32(GridView2.SelectedValue)
        msn.Text = "Função selecionada:<br>[" & GridView2.SelectedDataKey("dsfuncao") & "]"
    End Sub

    Protected Sub CheckBox1_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("NomeResponsavelTextBox"), TextBox).Text = Session("nome")
    End Sub

    Protected Sub CheckBox2_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("emailRecadosTextBox"), TextBox).Text = Session("emailUser")
    End Sub

    Protected Sub SqlZoya_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlZoya.Updated
        msn.CssClass = "msnOK"
        msn.Text = "Seu profile foi atualizado com sucesso!<br><a href='/_candidato/zoyaview.aspx'>[Veja no Zoya]</a>"
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

    Protected Sub SqlZoya_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlZoya.Inserting

        e.Command.Parameters("@idfuncao").Value = resTxt.Text
        e.Command.Parameters("@idCadastroUser").Value = Session("idCadastroUser")
        e.Command.Parameters("@idcurriculo").Value = Session("idcurriculo")

        e.Command.Parameters("@dsGeral").Value = Replace(CType(FormView1.FindControl("dsGeralTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@dsServicosOferecidos").Value = Replace(CType(FormView1.FindControl("dsServicosOferecidosTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@dsTrabalhosPublicados").Value = Replace(CType(FormView1.FindControl("dsTrabalhosPublicadosTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@idUser").Value = Session("idUser")

        msn.CssClass = "msnOK"
        msn.Text = "Seu profile já está publicado no Zoya!<br><a href='/_candidato/zoyaview.aspx'>[Veja no Zoya]</a>"

    End Sub

    Protected Sub SqlZoya_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlZoya.Updating

        e.Command.Parameters("@dsGeral").Value = Replace(CType(FormView1.FindControl("dsGeralTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@dsServicosOferecidos").Value = Replace(CType(FormView1.FindControl("dsServicosOferecidosTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@dsTrabalhosPublicados").Value = Replace(CType(FormView1.FindControl("dsTrabalhosPublicadosTextBox"), TextBox).Text, Chr(10), "<br>")

        e.Command.Parameters("@idAreaAtuacaoP").Value = CType(FormView1.FindControl("Area1DropDownList"), DropDownList).SelectedValue.ToString
        e.Command.Parameters("@idAreaAtuacaoS").Value = CType(FormView1.FindControl("Area2DropDownList"), DropDownList).SelectedValue.ToString

    End Sub

    Protected Sub SqlZoya_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlZoya.Inserted

        REM ** *********************************************************************************************************
        REM ** TEM QUE CARREGAR A SESSION("IDZOYA") AQUI...
        REM ** *********************************************************************************************************

        Dim p As New user
        Session("idZoya") = p.ZoyaID(Session("idCadastroUser"))
        Response.Redirect("zoyaview.aspx")

    End Sub

End Class
