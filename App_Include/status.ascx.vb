Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class App_Include_status
    Inherits System.Web.UI.UserControl

    Dim HTMLg As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("idcurriculo") <> "" Then

            Dim oReader As SqlDataReader = Nothing
            Dim oSQL As String
            Dim oConnection As SqlConnection

            Dim A As Int16 = 0
            Dim CNT As Int16 = GetMSN(Session("idcurriculo"))

            oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            Dim oCommand As SqlCommand

            oSQL = "SELECT Total, ProcessoSt, idcurriculo FROM vwvagasRes WHERE (idcurriculo = " & Session("idcurriculo") & ")"

            oConnection.Open()

            oCommand = New SqlCommand(oSQL, oConnection)
            oReader = oCommand.ExecuteReader()


            REM **********************************************************************************
            REM ** PARTE LATERAL
            REM **********************************************************************************

            HTMLg = HTMLg & "<table id='Status' border='0' cellpadding='0' cellspacing='0'>" & Chr(10)
            HTMLg = HTMLg & "<tr>" & Chr(10)
            HTMLg = HTMLg & "<td>" & Chr(10)
            HTMLg = HTMLg & "<b>&nbsp;Status</b><br />" & Chr(10)
            HTMLg = HTMLg & "<br />" & Chr(10)
            HTMLg = HTMLg & "</td>" & Chr(10)
            HTMLg = HTMLg & "</tr>" & Chr(10)
            HTMLg = HTMLg & "<tr>" & Chr(10)
            HTMLg = HTMLg & "<td>" & Chr(10)
            HTMLg = HTMLg & "<table id='Links' border='0' cellpadding='0' cellspacing='0'>" & Chr(10)
            HTMLg = HTMLg & "<tr>" & Chr(10)
            HTMLg = HTMLg & "<td>" & Chr(10)
            HTMLg = HTMLg & "<img border='0' src='/images/layout/navega_sup/ind_nativo.gif' /></td>" & Chr(10)
            HTMLg = HTMLg & "<td width='169'>" & Chr(10)
            HTMLg = HTMLg & "<a href='status.aspx'>Veja mais detalhes...</a></td>" & Chr(10)
            HTMLg = HTMLg & "</tr>" & Chr(10)
            HTMLg = HTMLg & "<tr>" & Chr(10)
            HTMLg = HTMLg & "<td>" & Chr(10)
            HTMLg = HTMLg & "</td>" & Chr(10)
            HTMLg = HTMLg & "<td width='169'>" & Chr(10)
            HTMLg = HTMLg & "<img border='0' src='/images/layout/navega_sup/15px.gif' /><br />" & Chr(10)


            If oReader.HasRows() Then

                Do While oReader.Read()

                    Try

                        REM **********************************************************************************
                        REM ** PARTE LATERAL (RAIZ)
                        REM **********************************************************************************
                        REM Total, ProcessoSt

                        If oReader("ProcessoSt") Then
                            HTMLg = HTMLg & "[" & oReader("Total") & "] - Processo Seletivo<br>" & Chr(10)
                        Else
                            HTMLg = HTMLg & "[" & oReader("Total") & "] - Aguardando...<br>" & Chr(10)
                        End If


                        REM **********************************************************************************
                        REM ** PARTE LATERAL
                        REM **********************************************************************************

                    Catch ex As Exception

                    End Try

                Loop

            End If

            oReader.Close()
            oConnection.Close()


            HTMLg = HTMLg & "<br></td>" & Chr(10)
            HTMLg = HTMLg & "</tr>" & Chr(10)
            HTMLg = HTMLg & "<tr>" & Chr(10)
            HTMLg = HTMLg & "<td bgcolor='#ff0000'>" & Chr(10)
            HTMLg = HTMLg & "</td>" & Chr(10)
            HTMLg = HTMLg & "<td bgcolor='#808080' width='169'>" & Chr(10)
            HTMLg = HTMLg & "<img border='0' src='/images/layout/navega_sup/1px.gif' /></td>" & Chr(10)
            HTMLg = HTMLg & "</tr>" & Chr(10)
            HTMLg = HTMLg & "<tr>" & Chr(10)
            HTMLg = HTMLg & "<td>" & Chr(10)
            HTMLg = HTMLg & "</td>" & Chr(10)
            HTMLg = HTMLg & "<td width='169'>" & Chr(10)
            HTMLg = HTMLg & "<img border='0' src='/images/layout/navega_sup/15px.gif' /></td>" & Chr(10)
            HTMLg = HTMLg & "</tr>" & Chr(10)
            HTMLg = HTMLg & "</table>" & Chr(10)
            HTMLg = HTMLg & "</td>" & Chr(10)
            HTMLg = HTMLg & "</tr>" & Chr(10)
            HTMLg = HTMLg & "</table>" & Chr(10)

            HTMLg = HTMLg & "<table id='OutLook' border='0' cellpadding='0' cellspacing='0'>" & Chr(10)
            HTMLg = HTMLg & "<tr>" & Chr(10)
            HTMLg = HTMLg & "<td>" & Chr(10)
            HTMLg = HTMLg & "<b>&nbsp;OutLook</b><br />" & Chr(10)
            HTMLg = HTMLg & "<br />" & Chr(10)
            HTMLg = HTMLg & "</td>" & Chr(10)
            HTMLg = HTMLg & "</tr>" & Chr(10)
            HTMLg = HTMLg & "<tr>" & Chr(10)
            HTMLg = HTMLg & "<td>" & Chr(10)
            HTMLg = HTMLg & "<table id='OutLookLink' border='0' cellpadding='0' cellspacing='0'>" & Chr(10)
            HTMLg = HTMLg & "<tr>" & Chr(10)
            HTMLg = HTMLg & "<td>" & Chr(10)
            HTMLg = HTMLg & "<img border='0' src='/images/layout/navega_sup/ind_nativo.gif' /></td>" & Chr(10)
            HTMLg = HTMLg & "<td width='169'>" & Chr(10)
            HTMLg = HTMLg & "<a href='outlook.aspx?id=" & Session("idcurriculo") & "'>Caixa Entrada [" & CNT & "]</a></td>" & Chr(10)
            HTMLg = HTMLg & "</tr>" & Chr(10)
            HTMLg = HTMLg & "</table>" & Chr(10)
            HTMLg = HTMLg & "</td>" & Chr(10)
            HTMLg = HTMLg & "</tr>" & Chr(10)
            HTMLg = HTMLg & "</table>" & Chr(10)

            htmlStatus.Text = HTMLg


            REM **********************************************************************************
            REM ** PARTE LATERAL
            REM **********************************************************************************

        End If

    End Sub

    Function GetMSN(ByVal idcurriculo As Integer) As Integer

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection
        Dim CNT As Integer

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT COUNT(*) AS CNT FROM tbRELduvida_vaga GROUP BY idcurriculo, liberarRH HAVING (idcurriculo = " & idcurriculo & ") AND (liberarRH = 1)"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        If oReader.HasRows() Then

            oReader.Read()
            CNT = oReader("CNT")

        End If

        oReader.Close()
        oConnection.Close()

        Return CNT

    End Function

End Class
