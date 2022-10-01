Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter

Public Class chartPIE

    Private _campo As String
    Private _valor As Int32


    Public Sub New()
        MyBase.New()
    End Sub

    Public Property campo() As String
        Get
            Return _campo
        End Get
        Set(ByVal value As String)
            _campo = value
        End Set
    End Property

    Public Property valor() As Int32
        Get
            Return _valor
        End Get
        Set(ByVal value As Int32)
            _valor = value
        End Set
    End Property


End Class
