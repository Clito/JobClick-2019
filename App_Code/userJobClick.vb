Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter

Public Class userJobClick

    Function statusUser() As Boolean

        Dim status As Boolean = False
        If (HttpContext.Current.User.Identity.IsAuthenticated) Then
            status = True
        End If

        Return status

    End Function


    Public Function validaUtilizador(ByVal sP As String, ByVal sE As String) As Boolean

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

        sSQL = "SELECT idUser, userName, password, email, bloquear, grupo, url FROM vwuser WHERE (password = '" + sPwd + "') AND (email='" + sEml + "')"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then

                dr.Read()
                txtgrupo = dr("grupo")
                resposta = True
                FormsAuthentication.SetAuthCookie(txtgrupo, False)

            End If

        Catch ex As SqlClient.SqlException

        Finally

            dr.Close()
            Connection.Close()

        End Try

        Return resposta

    End Function

    Function idUser(ByVal sP As String, ByVal sE As String) As String

        Dim sPwd As String = sP
        Dim sEml As String = sE
        Dim txtgrupo As String


        Dim dr As SqlDataReader = Nothing
        Dim resposta As Int32
        Dim sSQL As String
        Dim Connection As SqlConnection

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT idUser, userName, password, email, bloquear, grupo FROM vwuser WHERE  (password = '" + sPwd + "') AND (email='" + sEml + "')"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then

                dr.Read()
                txtgrupo = dr("grupo")
                resposta = dr("idUser")
                FormsAuthentication.SetAuthCookie(txtgrupo, False)

            End If

        Catch ex As SqlClient.SqlException

        Finally

            dr.Close()
            Connection.Close()

        End Try

        idUser = resposta

    End Function

    Function idCadastroUser(ByVal idUser As Integer) As String

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

    Function idCadastroEmpresa(ByVal idUser As Integer) As String

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


    Public Function AutoLogin(ByVal id As String) As String

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
                FormsAuthentication.SetAuthCookie(txtgrupo, False)

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

    Function ZoyaID(ByVal idCadastroUser As Int32) As String

        Dim dr As SqlDataReader = Nothing
        Dim idZoya As String = "0"

        Dim sSQL As String = "SELECT idZoya, idCadastroUser FROM tbZoya WHERE (idCadastroUser = " & idCadastroUser & ")"
        Dim Connection As SqlConnection

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then

                dr.Read()
                idZoya = dr("idZoya")

            End If

            dr.Close()
            Connection.Close()

        Catch ex As SqlClient.SqlException

        Finally

        End Try

        Return idZoya

    End Function

    Function ZoyaIDCV(ByVal idCadastroUser As String) As String

        Dim idZoyaCV As String = ""

        Dim dr As SqlDataReader = Nothing

        Dim sSQL As String = "SELECT idZoya, idCadastroUser, idcurriculo FROM tbZoya WHERE (idCadastroUser = " & idCadastroUser & ")"
        Dim Connection As SqlConnection

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        Dim command As SqlCommand

        If idCadastroUser <> "" Then

            Try

                Connection.Open()

                command = New SqlCommand(sSQL, Connection)
                dr = command.ExecuteReader()

                If dr.HasRows() Then

                    dr.Read()
                    idZoyaCV = dr("idcurriculo")

                Else

                    idZoyaCV = ""

                End If

                dr.Close()
                Connection.Close()

            Catch ex As SqlClient.SqlException

            Finally

            End Try

        Else

            idZoyaCV = ""

        End If

        REM ** *************************************************************************************************************
        REM ** CV (VERIFICA NA TABELA DE CURRÍCULO E PEGA O PRIMEIRO ...
        REM ** *************************************************************************************************************

        If idZoyaCV = "" Then

            sSQL = "SELECT idcurriculo, idCadastroUser FROM tbCurriculo WHERE (idCadastroUser =  " & idCadastroUser & ")"

            Try

                Connection.Open()

                command = New SqlCommand(sSQL, Connection)
                dr = command.ExecuteReader()

                If dr.HasRows() Then

                    dr.Read()
                    idZoyaCV = dr("idcurriculo")

                End If

                dr.Close()
                Connection.Close()

            Catch ex As SqlClient.SqlException

            Finally

            End Try

        End If

        Return idZoyaCV

    End Function

    Function GetidCurriculo(ByVal idCadastroUser As String) As String

        Dim dr As SqlDataReader = Nothing

        Dim CurriculoRES As String = ""

        Dim sSQL As String = "SELECT idcurriculo, idCadastroUser FROM tbCurriculo WHERE (idCadastroUser =  " & idCadastroUser & ")"

        Dim Connection As SqlConnection

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        Dim command As SqlCommand

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then

                dr.Read()
                CurriculoRES = dr("idcurriculo")

            End If

            dr.Close()
            Connection.Close()

        Catch ex As SqlClient.SqlException

        End Try

        Return CurriculoRES

    End Function

    Public Function GetURL(ByVal id As String) As String

        Dim url As String = ""
        Dim idUser As Int32 = 0

        Dim dr As SqlDataReader = Nothing
        Dim resposta As Boolean = False
        Dim sSQL As String
        Dim Connection As SqlConnection

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT idUser, userName, password, email, bloquear, grupo, url FROM vwuser WHERE (idUser = " + id + ")"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then

                dr.Read()
                url = dr("url")

            End If

            dr.Close()
            Connection.Close()

        Catch ex As SqlClient.SqlException

        Finally

        End Try

        Return url

    End Function
End Class
