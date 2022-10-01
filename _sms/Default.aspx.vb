Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Nullable
Imports System.IO

Partial Class _modulo_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim HtmlBanner As String = ""
        Dim HtmlLateral As String = ""

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("SMSCenterConnectionString").ConnectionString)

        cmd = New SqlCommand("spUserPermission", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@strLogin", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@strPassword", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@strLogin").Value = Session("userName_SMS")
        cmd.Parameters("@strPassword").Value = Session("PWD_SMS")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        REM ** **************************************************************************************************
        REM ** [INICIO] - MENU BANNER
        REM ** **************************************************************************************************
        HtmlBanner = HtmlBanner & "<div class='mainmenu'>" & Chr(10)
        HtmlBanner = HtmlBanner & "<ul>" & Chr(10)
        HtmlBanner = HtmlBanner & "<li class='li_nc'><a href='/_user/' target='_self' >Home</a></li>" & Chr(10)
        REM ** **************************************************************************************************
        REM ** [FIM] - MENU BANNER
        REM ** **************************************************************************************************


        REM ** **************************************************************************************************
        REM ** [INICIO] - MENU LATERAL
        REM ** **************************************************************************************************
        HtmlLateral = HtmlLateral & "<table class='mainmenu'>" & Chr(10)
        REM ** **************************************************************************************************
        REM ** [FIM] - MENU LATERAL
        REM ** **************************************************************************************************

        If dr.HasRows() Then

            Session("User") = Session("userName_SMS")
            Session("PWD") = Session("PWD_SMS")


            While dr.Read

                Dim flgAllow As Boolean = dr("flgAllow")

                Select Case flgAllow
                    Case True
                        Select Case dr("strPermissionType")
                            Case "Relatório"
                                HtmlBanner = HtmlBanner & "<li class='li_hc'><a href='/_modulo/" & dr("strPermissionCaller") & "' target='_self' >" & dr("strPermissionName") & "</a></li>" & Chr(10)
                            Case "Menu"
                                HtmlLateral = HtmlLateral & "<tr>" & Chr(10)
                                HtmlLateral = HtmlLateral & "<td class='li_nc'><a href='/_modulo/" & dr("strPermissionCaller") & "' target='_self' >" & dr("strPermissionName") & "</a></li>" & Chr(10)
                                HtmlLateral = HtmlLateral & "</tr>" & Chr(10)
                        End Select
                End Select

                Session("idClient") = dr("idClient")
                Session("idUser_SMS") = dr("idUser")

            End While

            REM ** **************************************************************************************************
            REM ** [INICIO] - BASE MENU BANNER
            REM ** **************************************************************************************************
            HtmlBanner = HtmlBanner & "</ul>" & Chr(10)
            HtmlBanner = HtmlBanner & "</div>" & Chr(10)

            Session("NavBanner") = HtmlBanner
            REM ** **************************************************************************************************
            REM ** [FIM] - BASE MENU BANNER
            REM ** **************************************************************************************************


            REM ** **************************************************************************************************
            REM ** [INICIO] - BASE MENU LATERAL
            REM ** **************************************************************************************************
            HtmlLateral = HtmlLateral & "<tr>" & Chr(10)
            HtmlLateral = HtmlLateral & "<td class='li_nc'><a href='/logout.aspx' target='_self' >Sair</a></li>" & Chr(10)
            HtmlLateral = HtmlLateral & "</tr>" & Chr(10)
            HtmlLateral = HtmlLateral & "</table>" & Chr(10)

            Session("NavLateral") = HtmlLateral
            REM ** **************************************************************************************************
            REM ** [FIM] - BASE MENU LATERAL
            REM ** **************************************************************************************************

        End If

        dr.Close()
        cn.Close()

    End Sub
End Class
