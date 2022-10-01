Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter

Public Class userCandidato
    Private _idUser As Int32
    Private _url As String
    Private _idTypeUser As String
    Private _emailRes As String
    Private _idCadastroUser As Int32
    Private _dataultimoacess As String
    Private _nome As String
    Private _isCandidato As Int32
    Private _idCurriculo As Int32
    Private _dscurriculo As String
    Private _foto As String

    Private _Bairro As String
    Private _CEP As String
    Private _Cidade As String
    Private _uf As String
    Private _Complemento As String
    Private _ddd As String
    Private _telefone As String
    Private _Endereco As String

    Private _Token As String



    Public Sub New()
        MyBase.New()
    End Sub

    Public Property idUser() As Int32
        Get
            Return _idUser
        End Get
        Set(ByVal value As Int32)
            _idUser = value
        End Set
    End Property

    Public Property url() As String
        Get
            Return _url
        End Get
        Set(ByVal value As String)
            _url = value
        End Set
    End Property

    Public Property idTypeUser() As String
        Get
            Return _idTypeUser
        End Get
        Set(ByVal value As String)
            _idTypeUser = value
        End Set
    End Property

    Public Property emailRes() As String
        Get
            Return _emailRes
        End Get
        Set(ByVal value As String)
            _emailRes = value
        End Set
    End Property

    Public Property idCadastroUser() As String
        Get
            Return _idCadastroUser
        End Get
        Set(ByVal value As String)
            _idCadastroUser = value
        End Set
    End Property

    Public Property dataultimoacess() As String
        Get
            Return _dataultimoacess
        End Get
        Set(ByVal value As String)
            _dataultimoacess = value
        End Set
    End Property

    Public Property nome() As String
        Get
            Return _nome
        End Get
        Set(ByVal value As String)
            _nome = value
        End Set
    End Property

    Public Property isCandidato() As String
        Get
            Return _isCandidato
        End Get
        Set(ByVal value As String)
            _isCandidato = value
        End Set
    End Property

    Public Property idCurriculo() As String
        Get
            Return _idCurriculo
        End Get
        Set(ByVal value As String)
            _idCurriculo = value
        End Set
    End Property

    Public Property dscurriculo() As String
        Get
            Return _dscurriculo
        End Get
        Set(ByVal value As String)
            _dscurriculo = value
        End Set
    End Property

    Public Property foto() As String
        Get
            Return _foto
        End Get
        Set(ByVal value As String)
            _foto = value
        End Set
    End Property

    Public Property Bairro() As String
        Get
            Return _Bairro
        End Get
        Set(ByVal value As String)
            _Bairro = value
        End Set
    End Property

    Public Property CEP() As String
        Get
            Return _CEP
        End Get
        Set(ByVal value As String)
            _CEP = value
        End Set
    End Property

    Public Property Cidade() As String
        Get
            Return _Cidade
        End Get
        Set(ByVal value As String)
            _Cidade = value
        End Set
    End Property

    Public Property uf() As String
        Get
            Return _uf
        End Get
        Set(ByVal value As String)
            _uf = value
        End Set
    End Property

    Public Property Complemento() As String
        Get
            Return _Complemento
        End Get
        Set(ByVal value As String)
            _Complemento = value
        End Set
    End Property

    Public Property ddd() As String
        Get
            Return _ddd
        End Get
        Set(ByVal value As String)
            _ddd = value
        End Set
    End Property

    Public Property telefone() As String
        Get
            Return _telefone
        End Get
        Set(ByVal value As String)
            _telefone = value
        End Set
    End Property

    Public Property Endereco() As String
        Get
            Return _Endereco
        End Get
        Set(ByVal value As String)
            _Endereco = value
        End Set
    End Property

    Public Property Token() As String
        Get
            Return _Token
        End Get
        Set(ByVal value As String)
            _Token = value
        End Set
    End Property

End Class
