Imports System.Diagnostics
Imports System.Web.SessionState
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Web.SessionState.HttpSessionState
Imports System.Web.HttpCookie
Imports System.DBNull
Imports System.Security.Principal
Imports System.Web.Security

Partial Class HOTSITE_Default
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection
        Dim HTML As String = ""
        Dim QUEBRA As String = ""
        Dim SETUPEmp As Int32 = 1
        Session("idSetup") = 1

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT idsetup, idCadastroEmpresa, sSmtp, emailAdmin, nomeAdmin, sSubject, sTitle, celular, operadora, meta, fonte, url, google, token, SETLayout FROM tbsetup WHERE (idsetup = " & SETUPEmp & ")"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        REM ** ***************************************************************
        REM ** CONFIGURAÇÃO DO SISTEMA DE ENVIO DE E-MAIL - DB
        REM ** ***************************************************************

        Try

            If oReader.HasRows() Then

                oReader.Read()

                Application("emailAdmin") = oReader("emailAdmin")
                Application("nomeAdmin") = oReader("nomeAdmin")
                Application("sSMTP") = oReader("sSmtp")
                Application("sSubject") = oReader("sSubject")
                Application("Title") = oReader("sTitle")
                Application("idsetup") = oReader("idsetup")
                Application("idCadastroEmpresa") = oReader("idCadastroEmpresa")
                Application("token") = oReader("token")

                If Not oReader("celular") Is DBNull.Value Then
                    Application("celular") = oReader("celular")
                Else
                    Application("celular") = ""
                End If

                If Not oReader("operadora") Is DBNull.Value Then
                    Application("operadora") = oReader("operadora")
                Else
                    Application("operadora") = ""
                End If

                If Not oReader("meta") Is DBNull.Value Then
                    Application("meta") = oReader("meta")
                Else
                    Application("meta") = ""
                End If

                If Not oReader("fonte") Is DBNull.Value Then
                    Application("fonte") = oReader("fonte")
                Else
                    Application("fonte") = ""
                End If

                If Not oReader("url") Is DBNull.Value Then
                    Application("url") = oReader("url")
                Else
                    Application("url") = ""
                End If

                If Not oReader("google") Is DBNull.Value Then
                    Application("google") = oReader("google")
                Else
                    Application("google") = ""
                End If

                If Not oReader("SETLayout") Is DBNull.Value Then
                    Session("SETLayout") = oReader("SETLayout")
                Else
                    Session("SETLayout") = "jobclick"
                End If


            Else

                Application("emailAdmin") = ""
                Application("nomeAdmin") = ""
                Application("sSMTP") = ""
                Application("sSubject") = ""
                Application("Title") = "Favor configurar o sistema!"
                Application("celular") = ""
                Application("operadora") = ""
                Application("meta") = ""
                Application("google") = ""

            End If

        Catch ex As Exception

        End Try

        oConnection.Close()


        Application.Lock()
        Application("Sessions") = Application("Sessions") + 1
        Application("Hits") = Application("Hits") + 1
        Application("path") = Request.PhysicalApplicationPath


        REM ** **************************************************************
        REM ** IDIOMA PADRÃO (PORTUGUÊS)
        REM ** **************************************************************

        Session("Idioma") = "pt-BR"
        Session("timerIni") = 0
        Session("ip") = Request.UserHostAddress
        Session("ticket") = Session.SessionID
        Session("CHAVE") = 0

        Try

            If Request.Cookies("userInfo")("nome") <> "" And Request.Cookies("userInfo")("cadastroTipo") <> "" Then
                Session("nome") = Request.Cookies("userInfo")("nome")
                Session("cadastroTipo") = Request.Cookies("userInfo")("cadastroTipo")
            End If

        Catch ex As Exception

        End Try

        Response.Redirect("/empresa.aspx")

    End Sub
End Class

