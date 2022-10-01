<%@ Application Language="VB" %>
<%@ Import Namespace = "System.Diagnostics" %>
<%@ Import Namespace = "System.Web.SessionState" %>
<%@ Import Namespace = "System.Data.SqlClient" %>
<%@ Import Namespace = "System.Data.SqlClient.SqlDataReader" %>
<%@ Import Namespace = "System.Web.SessionState.HttpSessionState" %>
<%@ Import Namespace = "System.Web.HttpCookie" %>
<%@ Import Namespace = "System.DBNull" %>
<%@ Import Namespace = "System.Security.Principal" %>
<%@ Import Namespace = "System.Web.Security" %>

<script runat="server">
    
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
  
        Dim objErr As Exception = Server.GetLastError().GetBaseException()
        Dim err As String = "Erro na página: " & Request.Url.ToString() & ". Mensagem de erro: " & objErr.Message.ToString()
        ErrHandler.WriteError(err)
        
    End Sub

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        

        Application("Hits") = 0
        Application("Sessions") = 0
        Application("TerminatedSessions") = 0

        
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)

    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        Application.Lock()
        Application.UnLock()
    End Sub
 
     

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        
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
       
        Application.UnLock()
        
    End Sub

    Sub Session_Abandon()
        Application.Lock()
        Application("TerminatedSessions") = Application("TerminatedSessions") + 1
        Application("Hits") = Application("Hits") - 1
        Session.Clear()
        Application.UnLock()
    End Sub
    
    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        Application.Lock()
        Application("TerminatedSessions") = Application("TerminatedSessions") + 1
        Application("Hits") = Application("Hits") - 1
        Session.Clear()
        Application.UnLock()
    End Sub

       
</script>