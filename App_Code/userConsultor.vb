Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter

Public Class userConsultor

    Function statusUser() As Boolean

        Dim status As Boolean = False
        If (HttpContext.Current.User.Identity.IsAuthenticated) Then
            status = True
        End If

        Return status

    End Function

    Public Function validaUtilizador(ByVal sU As String, ByVal sP As String, ByVal sE As String) As Boolean

        Dim sUser As String = sU
        Dim sPwd As String = sP
        Dim sEml As String = sE
        Dim txtgrupo As String
        Dim idUser As Int32 = 0


        Dim dr As SqlDataReader = Nothing
        Dim resposta As Boolean = False
        Dim sSQL As String
        Dim Connection As SqlConnection

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT idUser, userName, password, email, bloquear, grupo FROM vwuser WHERE (userName = '" + sUser + "') AND (password = '" + sPwd + "') AND (email='" + sEml + "')"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then

                dr.Read()
                txtgrupo = dr("grupo")
                resposta = True
                FormsAuthentication.SetAuthCookie(txtgrupo, True)

            End If

        Catch ex As SqlClient.SqlException

        Finally

            dr.Close()
            Connection.Close()

        End Try

        Return resposta

    End Function

    Public Function validaConsultor(ByVal sU As String, ByVal sP As String, ByVal sE As String, ByVal idCadastroEmpresa As String) As String

        Dim sUser As String = sU
        Dim sPwd As String = sP
        Dim sEml As String = sE
        Dim resposta As String = "0"
        Dim idUser As Int32 = 0

        Dim dr As SqlDataReader = Nothing
        Dim sSQL As String
        Dim Connection As SqlConnection

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT idRH_Gestor, idCadastroEmpresa, idRH, nome, [password], email, bloquear, data FROM tbRH_Gestor WHERE (nome = '" + sUser + "') AND ([password] = '" + sPwd + "') AND (email='" + sEml + "') AND (idCadastroEmpresa = '" + idCadastroEmpresa + "')"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then

                dr.Read()
                resposta = dr("idRH_Gestor")
                FormsAuthentication.SetAuthCookie("Empresa", True)

            End If

        Catch ex As SqlClient.SqlException

        Finally

            dr.Close()
            Connection.Close()

        End Try

        Return resposta

    End Function


    Function idUser#(ByVal sU As String, ByVal sP As String, ByVal sE As String)

        Dim sUser As String = sU
        Dim sPwd As String = sP
        Dim sEml As String = sE
        Dim txtgrupo As String


        Dim dr As SqlDataReader = Nothing
        Dim resposta As Int32
        Dim sSQL As String
        Dim Connection As SqlConnection

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT idUser, userName, password, email, bloquear, grupo FROM vwuser WHERE (userName = '" + sUser + "') AND (password = '" + sPwd + "') AND (email='" + sEml + "')"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then

                dr.Read()
                txtgrupo = dr("grupo")
                resposta = dr("idUser")
                FormsAuthentication.SetAuthCookie(txtgrupo, True)

            End If

        Catch ex As SqlClient.SqlException

        Finally

            dr.Close()
            Connection.Close()

        End Try

        idUser = resposta

    End Function

    Function idCadastroUser(ByVal idUser As Int32) As String

        Dim resposta As String

        Dim dr As SqlDataReader = Nothing
        Dim sSQL As String
        Dim Connection As SqlConnection

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT idCadastroUser FROM tbCadastroUser WHERE (idUser = " + idUser.ToString + ")"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then
                dr.Read()
                resposta = dr("idCadastroUser").ToString
            Else
                resposta = ""
            End If

        Finally

            dr.Close()
            Connection.Close()

        End Try

        idCadastroUser = resposta

    End Function

    Function idCadastroEmpresa(ByVal idUser As Int32) As String

        Dim resposta As String = ""

        Dim dr As SqlDataReader = Nothing
        Dim sSQL As String
        Dim Connection As SqlConnection

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT idCadastroEmpresa FROM tbCadastroEmpresa WHERE (idUser = " + idUser.ToString + ")"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then
                dr.Read()
                resposta = dr("idCadastroEmpresa").ToString
            Else
                resposta = ""
            End If

        Finally

            dr.Close()
            Connection.Close()

        End Try

        idCadastroEmpresa = resposta

    End Function


    Public Function AutoLogin(ByVal id As Int32) As String

        Dim txtgrupo As String
        Dim idUser As Int32 = 0

        Dim dr As SqlDataReader = Nothing
        Dim resposta As Boolean = False
        Dim sSQL As String
        Dim Connection As SqlConnection

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT idUser, userName, password, email, bloquear, grupo FROM vwuser WHERE (idUser = " + id + ")"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then

                dr.Read()
                txtgrupo = dr("grupo")
                resposta = True
                FormsAuthentication.SetAuthCookie(txtgrupo, True)

            End If

        Catch ex As SqlClient.SqlException

        Finally

            dr.Close()
            Connection.Close()

        End Try

        AutoLogin = ""

    End Function

    Function Contador(ByVal idUser As Int32) As String

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False
        Dim dataultimoacessRES As String = ""

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spContadorAcesso", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idUser", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idUser").Value = idUser.ToString

        Try

            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            dataultimoacessRES = dr("dataultimoacess")
            dr.Close()

            rs = True

        Catch ex As Exception

            dataultimoacessRES = "Primeiro acesso..."
            rs = False

        End Try

        cn.Close()

        REM ** **********************************************************************
        REM ** ATUALIZA CONTADOR DE ACESSO E DATA DE ACESSO [FIM]
        REM ** **********************************************************************

        Contador = dataultimoacessRES

    End Function

End Class
