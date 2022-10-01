Imports System.Data.SqlClient
Imports System.Web.Script.Serialization
Imports System.Data
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter

Partial Class services_CheckCandidatura
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Dim idCurriculo As String = Request.QueryString("idCurriculo")
        Dim ProtocoloVaga As String = Request.QueryString("ProtocoloVaga")
        Dim idNivelVaga As String = Request.QueryString("idNivelVaga")


        Response.ContentType = "application/json"
        Response.Write(CheckRelVaga(
                                      idCurriculo _
                                      , ProtocoloVaga _
                                      , idNivelVaga _
                                    ))
    End Sub

    Public Function CheckRelVaga(ByVal idCurriculo As String, ByVal ProtocoloVaga As String, ByVal idNivelVaga As String) As String

        Dim jss As New JavaScriptSerializer()
        Dim sbRes As New StringBuilder()
        Dim ResultSet As New Hashtable

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False
        Dim dr As SqlDataReader

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        If idNivelVaga = 1 Then

            cmd = New SqlCommand("_USP_VERIFICAVAGA_USER", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idcurriculo", SqlDbType.Int, 4)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idcurriculo").Value = idCurriculo

            prm = New SqlParameter("@Protocolo", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Protocolo").Value = ProtocoloVaga

            cn.Open()

            Try

                dr = cmd.ExecuteReader

                ResultSet.Add("ResultStatus", True)

                If dr.HasRows() Then
                    dr.Read()
                    ResultSet.Add("ResultSet", dr("Status"))
                Else
                    ResultSet.Add("ResultSet", "0")
                End If

                dr.Close()
            Catch ex As Exception
                ResultSet.Add("ResultStatus", False)
                ResultSet.Add("ResultStatus_ErrorMessage", "Erro - " & ex.Message.ToString)
            Finally
            End Try
            cn.Close()

        ElseIf idNivelVaga = 2 Then

            cn.Open()

            cmd = New SqlCommand("Select * from tbpublicaCurriculo where idcurriculo = '" & idCurriculo & "' and codigo like '" & ProtocoloVaga & "%'", cn)

            Try

                dr = cmd.ExecuteReader

                ResultSet.Add("ResultStatus", True)

                If dr.HasRows() Then
                    ResultSet.Add("ResultSet", True)
                Else
                    ResultSet.Add("ResultSet", False)
                End If

                dr.Close()
            Catch ex As Exception
                ResultSet.Add("ResultStatus", False)
                ResultSet.Add("ResultStatus_ErrorMessage", "Erro - " & ex.Message.ToString)
            End Try


            cn.Close()

        End If

        jss.Serialize(ResultSet, sbRes)

        Return sbRes.ToString()

    End Function
End Class
