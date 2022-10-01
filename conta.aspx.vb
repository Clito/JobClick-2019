Imports user
Imports myValidaCPF
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull


Partial Class _anonimo_conta
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CType(FormView1.FindControl("userNameTextBox"), TextBox).Focus()
    End Sub


    Sub OnInsertConta(ByVal source As Object, ByVal e As SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Inserted

        If e.AffectedRows > 0 Then

            Dim pws As String = e.Command.Parameters("@password").Value
            Dim userName As String = e.Command.Parameters("@userName").Value
            Dim email As String = e.Command.Parameters("@email").Value

            Dim AutoLogon As New user

            Try

                Session("idUser") = AutoLogon.idUser(userName, pws, email)
                AutoLogon.AutoLogin(Session("idUser"))

            Catch ex As Exception

            End Try

            Response.Redirect("/_candidato/cadastro.aspx?idUser=" & Session("idUser"))

        End If

    End Sub


    Function VerificaUser(ByVal userName, ByVal email)

        Dim status As Boolean = False
        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spVerifyUser", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@email", SqlDbType.VarChar, 180)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@email").Value = email.ToString

        cn.Open()

        Try

            Dim dr As SqlDataReader = cmd.ExecuteReader

            If dr.HasRows() Then
                status = True
            Else
                status = False
            End If

            dr.Close()

        Catch ex As Exception

        End Try


        cn.Close()

        lblText.Text = status.ToString

        Return status

    End Function


    Protected Sub SqlDataSource1_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Inserting

        Dim userName As String
        Dim email As String
        Dim status As Boolean = False
        Dim statusCPF As Boolean = False

        userName = e.Command.Parameters("@userName").Value
        email = e.Command.Parameters("@email").Value

        status = VerificaUser(userName, email)

        If status Then
            lblText.Text = "* Este e-mail já está cadastrado em nosso banco de dados, <br>caso tenha esquecido a sua senha [<a href='../senha.aspx'>clique aqui</a>].<br><br>"
            e.Cancel = True
        Else
            lblText.Text = ""
        End If

        e.Command.Parameters("@idTypeUser").Value = "Candidato"

    End Sub


    Protected Sub goback(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Response.Redirect("/")
    End Sub

End Class
