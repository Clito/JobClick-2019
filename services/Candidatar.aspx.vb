Imports System.Data.SqlClient
Imports System.Web.Script.Serialization
Imports System.Data
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter

Partial Class services_Candidatar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Dim idCurriculo As String = Request.QueryString("idCurriculo")
        Dim ProtocoloVaga As String = Request.QueryString("ProtocoloVaga")
        Dim idNivelVaga As String = Request.QueryString("idNivelVaga")
        Dim idVaga As String = Request.QueryString("idVaga")
        Dim strApresentacao As String = Request.QueryString("strApresentacao")
        Dim idUser As String = Request.QueryString("idUser")

        Response.ContentType = "application/json"
        Response.Write(Candidatar( _
                              idCurriculo _
                            , ProtocoloVaga _
                            , idNivelVaga _
                            , idVaga _
                            , strApresentacao _
                            , idUser _
                          ))

    End Sub

    Public Function Candidatar( _
                              ByVal idCurriculo As String _
                            , ByVal ProtocoloVaga As String _
                            , ByVal idNivelVaga As String _
                            , ByVal idVaga As String _
                            , ByVal strApresentacao As String _
                            , ByVal idUser As String _
                          ) As String

        Dim jss As New JavaScriptSerializer()
        Dim sbRes As New StringBuilder()
        Dim ResultSet As New Hashtable

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        Try

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
            cn.Open()

            cmd = New SqlCommand("_USP_CANDIDATAR", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idNivelVaga", SqlDbType.Int, 4)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@idNivelVaga").Value = idNivelVaga

            prm = New SqlParameter("@idUser", SqlDbType.Int, 4)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@idUser").Value = idUser

            prm = New SqlParameter("@idcurriculo", SqlDbType.Int, 4)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@idcurriculo").Value = idCurriculo

            prm = New SqlParameter("@idVaga", SqlDbType.Int, 4)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@idVaga").Value = idVaga

            prm = New SqlParameter("@ProtocoloVaga", SqlDbType.VarChar, -1)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@ProtocoloVaga").Value = ProtocoloVaga

            prm = New SqlParameter("@strApresentacao", SqlDbType.VarChar, -1)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@strApresentacao").Value = strApresentacao

            cmd.ExecuteReader()

            cn.Close()

            ResultSet.Add("ResultStatus", True)
        Catch ex As Exception
            ResultSet.Add("ResultStatus", False)
            ResultSet.Add("ResultStatus_ErrorMessage", "Erro - " & ex.Message.ToString)
        End Try

        jss.Serialize(ResultSet, sbRes)

        Return sbRes.ToString()
    End Function
End Class
