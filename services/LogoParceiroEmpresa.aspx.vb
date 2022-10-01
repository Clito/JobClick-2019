Imports System.Data.SqlClient
Imports System.Web.Script.Serialization

Partial Class services_LogoParceiroEmpresa
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim idParceiroEmpresa As String = Request.QueryString("idParceiroEmpresa")

        Response.ContentType = "application/json"
        Response.Write(logoParceiroEmpresa(idParceiroEmpresa))

    End Sub

    Public Function logoParceiroEmpresa(ByVal idParceiroEmpresa As Integer) As String

        Dim jss As New JavaScriptSerializer()
        Dim sbRes As New StringBuilder()
        Dim ResultSet As New Hashtable

        If idParceiroEmpresa <> 0 Then

            Dim myConnection As SqlConnection
            Dim myCommand As SqlCommand
            Dim dr As SqlDataReader
            Try
                myConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
                myConnection.Open()
                myCommand = New SqlCommand("select logoVaga, logoBGTitulo from tbCadastroEmpresa where idCadastroEmpresa = '" & idParceiroEmpresa & "'", myConnection)
                dr = myCommand.ExecuteReader

                Do
                    While dr.Read()
                        If (IsDBNull(dr("logoVaga")) = False) Then
                            If (dr("logoVaga") <> "") Then
                                ResultSet.Add("ResultSet_Logo", "/images/buscador/" & dr("logoVaga"))
                            End If
                            If (IsDBNull(dr("logoBGTitulo")) = False) Then
                                If (dr("logoBGTitulo") <> "") Then
                                    ResultSet.Add("ResultSet_BGTitulo", "/images/BGTitulo/" & dr("logoBGTitulo"))
                                End If
                            End If
                            ResultSet.Add("ResultStatus", True)
                        Else
                            ResultSet.Add("ResultStatus", False)
                            ResultSet.Add("ResultStatus_ErrorMessage", "Empresa sem Logotipo Cadastrado")
                        End If
                    End While
                Loop While dr.NextResult()

                dr.Close()
                myConnection.Close()
            Catch e As Exception
                ResultSet.Add("ResultStatus", False)
                ResultSet.Add("ResultStatus_ErrorMessage", "Erro - " & e.Message.ToString)
            End Try
        Else
            ResultSet.Add("ResultStatus", False)
            ResultSet.Add("ResultStatus_ErrorMessage", "idParceiroEmpresa não informado")
        End If

        jss.Serialize(ResultSet, sbRes)

        Return sbRes.ToString()

    End Function
End Class
