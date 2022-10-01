
Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull


Partial Class App_Include_id
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim sSQL As String = ""
        Dim Connection As SqlConnection
        Dim dr As SqlDataReader = Nothing
        Dim logicerro As Boolean = True
        Dim usuarios As String = ""

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim Command As SqlCommand

        sSQL = "SELECT usuarios  FROM totalusuarios"

        Try

            Connection.Open()

            Command = New SqlCommand(sSQL, Connection)
            dr = Command.ExecuteReader()

            If dr.HasRows() Then

                dr.Read()
                usuarios = dr("usuarios").ToString

            Else

                usuarios = "0"

            End If

        Catch ex As SqlClient.SqlException

        Finally

            dr.Close()
            Connection.Close()

        End Try

        Dim html As String = ""

        html = html & "<table width='750px' height='16px' cellpadding='0' cellspacing='0' align='left'>" & Chr(10)
        html = html & "<tr>" & Chr(10)
        html = html & "<td align='left' class='txtbranco'>IP: " + Session("ip") + "</td>" & Chr(10)
        REM html = html & "<td align='right' class='txtbranco'>Currículos cadastrados: " + usuarios + "</td>" & Chr(10)
        html = html & "<td align='right' class='txtbranco'>Ticket: " + Session("ticket") + "</td>" & Chr(10)
        html = html & "</tr>" & Chr(10)
        html = html & "</table>" & Chr(10)

        status.Text = html

    End Sub
End Class
