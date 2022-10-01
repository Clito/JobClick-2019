Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class varflash_varbanner
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim NroUsuarios As String = Application("Hits").ToString
        Dim SInome As String = ""
        Dim ContadorWEB As String = ""
        Dim ContadorJOBCLICK As String = ""


        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim cmd2 As SqlCommand


        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spVagasWEB", cn)
        cmd.CommandType = CommandType.StoredProcedure

        cmd2 = New SqlCommand("spVagasJOBCLICK", cn)
        cmd2.CommandType = CommandType.StoredProcedure


        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader
        dr.Read()
        ContadorWEB = dr("Contador")
        dr.Close()

        Dim dr2 As SqlDataReader = cmd2.ExecuteReader
        dr2.Read()
        ContadorJOBCLICK = dr2("Contador")
        dr2.Close()

        cn.Close()



        If Session("msnJob") = "" Then
            Session("msnJob") = "Dúvidas e sugestões sobre o site, use o FAQ."
        End If

        If Session("nome") <> "" Then
            SInome = Session("nome")
        Else
            SInome = "Anônimo"
        End If

        If Session("dataultimoacess") = "" Then
            Session("dataultimoacess") = "Primeiro acesso..."
        End If

        varFlashBanner.Text = "&username=" + SInome + "&ip=" + "<b>IP:</b> " + Session("ip") + "&Ticket=" + "<b>Ticket:</b> " + Session("ticket") + "&msn=" & Session("msnJob") & "&nrouser=" + NroUsuarios + "&dscurriculo=" + Session("dscurriculo") + "&acesso=<b>Último acesso:</b> " + Session("dataultimoacess") + "&contadorVagas=" + ContadorWEB + "&"

    End Sub
End Class
