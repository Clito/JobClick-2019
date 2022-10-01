Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Xml
Imports System.IO
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.DBNull

Public Class analytics

    Public Shared Function analyticsRegion(ByVal IP As String) As analyticsMask

        Dim en As analyticsMask = New analyticsMask

        Dim IPRes As String = ""
        Dim CountryCode As String = ""
        Dim CountryName As String = ""
        Dim RegionCode As String = ""
        Dim RegionName As String = ""
        Dim City As String = ""
        Dim Latitude As String = ""
        Dim Longitude As String = ""

        REM ** VERIFICA SE O IP ESTÁ REGISTRADO NA BASE DE DADOS
        REM ** *************************************************************************************

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        Dim checkDigit As String = ""

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_AD_IP]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@IP", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@IP").Value = IP

        cn.Open()

        Try

            Dim dr As SqlDataReader = cmd.ExecuteReader

            If dr.HasRows Then

                dr.Read()

                If dr("idADIP") <> 0 Then

                    rs = True

                    IPRes = dr("IPRes")
                    CountryCode = dr("CountryCode")
                    CountryName = dr("CountryName")
                    RegionCode = dr("RegionCode")
                    RegionName = dr("RegionName")
                    City = dr("City")
                    Latitude = dr("Latitude")
                    Longitude = dr("Longitude")

                    en.IPRes = IPRes
                    en.CountryCode = CountryCode
                    en.CountryName = CountryName
                    en.RegionCode = RegionCode
                    en.RegionName = RegionName
                    en.City = City
                    en.Latitude = Latitude
                    en.Longitude = Longitude

                End If

            End If

            dr.Close()

        Catch ex As Exception

            rs = False

        End Try

        cn.Close()

        REM ** [FIM]
        REM ** *************************************************************************************

        REM ** SE NÃO EXISTE REGISTRO FAZ A PESQUISA E GRAVA NA BASE DE DADOS
        REM ** *************************************************************************************

        If Not rs Then

            Dim XMLRes As String = ""

            Try

                Dim objXml As New XmlDocument
                Dim CaminhoXml As String = "http://freegeoip.net/xml/" + IP
                objXml.Load(CaminhoXml)

                IPRes = objXml.SelectSingleNode("Response").ChildNodes(0).InnerText
                CountryCode = objXml.SelectSingleNode("Response").ChildNodes(1).InnerText
                CountryName = objXml.SelectSingleNode("Response").ChildNodes(2).InnerText
                RegionCode = objXml.SelectSingleNode("Response").ChildNodes(3).InnerText
                RegionName = objXml.SelectSingleNode("Response").ChildNodes(4).InnerText
                City = objXml.SelectSingleNode("Response").ChildNodes(5).InnerText
                Latitude = objXml.SelectSingleNode("Response").ChildNodes(7).InnerText
                Longitude = objXml.SelectSingleNode("Response").ChildNodes(8).InnerText

                en.IPRes = IPRes
                en.CountryCode = CountryCode
                en.CountryName = CountryName
                en.RegionCode = RegionCode
                en.RegionName = RegionName
                en.City = City
                en.Latitude = Latitude
                en.Longitude = Longitude

                REM ** GRAVA NA BASE DE DADOS

                cmd = New SqlCommand("[_USP_AD_IP_INSERT]", cn)
                cmd.CommandType = CommandType.StoredProcedure

                prm = New SqlParameter("@IP", SqlDbType.VarChar, 255)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@IP").Value = IPRes

                prm = New SqlParameter("@CountryCode", SqlDbType.VarChar, 10)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@CountryCode").Value = CountryCode

                prm = New SqlParameter("@CountryName", SqlDbType.VarChar, 80)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@CountryName").Value = CountryName

                prm = New SqlParameter("@RegionCode", SqlDbType.VarChar, 10)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@RegionCode").Value = RegionCode

                prm = New SqlParameter("@RegionName", SqlDbType.VarChar, 255)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@RegionName").Value = RegionName

                prm = New SqlParameter("@City", SqlDbType.VarChar, 180)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@City").Value = City

                prm = New SqlParameter("@Latitude", SqlDbType.VarChar, 250)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@Latitude").Value = Latitude

                prm = New SqlParameter("@Longitude", SqlDbType.VarChar, 250)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)
                cmd.Parameters("@Longitude").Value = Longitude

                cn.Open()

                Try

                    Dim dr As SqlDataReader = cmd.ExecuteReader

                    dr.Read()

                    dr.Close()

                Catch ex As Exception

                    rs = False

                End Try

                cn.Close()

            Catch ex As Exception

            End Try

        End If

        Return en

    End Function

End Class



