﻿Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.DBNull
Imports protocolo

Public Class geraProtocoloIndica

    Function getNrProtocoloIndica(ByVal idsetup As Int32) As String
        Dim NrProtocolo As String = "0"

        Dim myProtocolo As New protocolo

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        Dim checkDigit As String = ""

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[usp_PROTOCOLO]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idsetup", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idsetup").Value = idsetup

        cn.Open()

        Try

            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Read()

            checkDigit = myProtocolo.geraCheckDigitRES(dr("nrPROTOCOLO"))
            NrProtocolo = Year(Now()) & "I/" & dr("nrPROTOCOLO") & "-" & checkDigit

            dr.Close()

            rs = True

        Catch ex As Exception


            rs = False

        End Try

        cn.Close()

        Return NrProtocolo

    End Function

End Class
