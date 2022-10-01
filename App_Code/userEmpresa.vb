Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter

Public Class userEmpresa

    Private _idUser As Int32
    Private _idCadastroEmpresa As Int32
    Private _url As String
    Private _idTypeUser As String
    Private _nmempresa As String
    Private _nomeRes As String
    Private _emailRes As String
    Private _nomeConsultor As String
    Private _emailConsultor As String
    Private _idCadastroUser As Int32
    Private _idRH_Gestor As Int32
    Private _dataultimoacess As String
    Private _ddd As String
    Private _telefoneGestor As String
    Private _dddEmpresa As String
    Private _telefoneEmpresa As String
    Private _nome As String
    Private _Token As String
    Private _idSetup As Int32
    Private _liberaQtdCad As Int32
    Private _idClient_SMS As Int32
    Private _idProject_SMS As Int32
    Private _userName_SMS As String
    Private _PWD_SMS As String
    Private _bairro As String
    Private _CEP As String
    Private _Cidade As String
    Private _Endereco As String
    Private _Estado As String
    Private _uf As String
    Private _SETLayout As String
    Private _CustomCSS As String
    Private _contador As Int32
    Private _candidatoPaga As Int32


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

    Public Property idCadastroEmpresa() As Int32
        Get
            Return _idCadastroEmpresa
        End Get
        Set(ByVal value As Int32)
            _idCadastroEmpresa = value
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

    Public Property nmempresa() As String
        Get
            Return _nmempresa
        End Get
        Set(ByVal value As String)
            _nmempresa = value
        End Set
    End Property

    Public Property nomeRes() As String
        Get
            Return _nomeRes
        End Get
        Set(ByVal value As String)
            _nomeRes = value
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

    Public Property nomeConsultor() As String
        Get
            Return _nomeConsultor
        End Get
        Set(ByVal value As String)
            _nomeConsultor = value
        End Set
    End Property

    Public Property emailConsultor() As String
        Get
            Return _emailConsultor
        End Get
        Set(ByVal value As String)
            _emailConsultor = value
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

    Public Property idRH_Gestor() As String
        Get
            Return _idRH_Gestor
        End Get
        Set(ByVal value As String)
            _idRH_Gestor = value
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

    Public Property ddd() As String
        Get
            Return _ddd
        End Get
        Set(ByVal value As String)
            _ddd = value
        End Set
    End Property

    Public Property telefoneGestor() As String
        Get
            Return _telefoneGestor
        End Get
        Set(ByVal value As String)
            _telefoneGestor = value
        End Set
    End Property

    Public Property dddEmpresa() As String
        Get
            Return _dddEmpresa
        End Get
        Set(ByVal value As String)
            _dddEmpresa = value
        End Set
    End Property

    Public Property telefoneEmpresa() As String
        Get
            Return _telefoneEmpresa
        End Get
        Set(ByVal value As String)
            _telefoneEmpresa = value
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

    Public Property Token() As String
        Get
            Return _Token
        End Get
        Set(ByVal value As String)
            _Token = value
        End Set
    End Property

    Public Property idSetup() As String
        Get
            Return _idSetup
        End Get
        Set(ByVal value As String)
            _idSetup = value
        End Set
    End Property

    Public Property liberaQtdCad() As Int32
        Get
            Return _liberaQtdCad
        End Get
        Set(value As Int32)
            _liberaQtdCad = value
        End Set
    End Property

    Public Property idClient_SMS() As Int32
        Get
            Return _idClient_SMS
        End Get
        Set(value As Int32)
            _idClient_SMS = value
        End Set
    End Property

    Public Property idProject_SMS() As Int32
        Get
            Return _idProject_SMS
        End Get
        Set(value As Int32)
            _idProject_SMS = value
        End Set
    End Property

    Public Property userName_SMS() As String
        Get
            Return _userName_SMS
        End Get
        Set(value As String)
            _userName_SMS = value
        End Set
    End Property


    Public Property PWD_SMS() As String
        Get
            Return _PWD_SMS
        End Get
        Set(value As String)
            _PWD_SMS = value
        End Set
    End Property

    Public Property bairro() As String
        Get
            Return _bairro
        End Get
        Set(value As String)
            _bairro = value
        End Set
    End Property

    Public Property CEP() As String
        Get
            Return _CEP
        End Get
        Set(value As String)
            _CEP = value
        End Set
    End Property

    Public Property Cidade() As String
        Get
            Return _Cidade
        End Get
        Set(value As String)
            _Cidade = value
        End Set
    End Property

    Public Property Endereco() As String
        Get
            Return _Endereco
        End Get
        Set(value As String)
            _Endereco = value
        End Set
    End Property

    Public Property Estado() As String
        Get
            Return _Estado
        End Get
        Set(value As String)
            _Estado = value
        End Set
    End Property

    Public Property uf() As String
        Get
            Return _uf
        End Get
        Set(value As String)
            _uf = value
        End Set
    End Property

    Public Property SETLayout() As String
        Get
            Return _SETLayout
        End Get
        Set(value As String)
            _SETLayout = value
        End Set
    End Property

    Public Property CustomCSS() As String
        Get
            Return _CustomCSS
        End Get
        Set(value As String)
            _CustomCSS = value
        End Set
    End Property

    Public Property contador() As Int32
        Get
            Return _contador
        End Get
        Set(ByVal value As Int32)
            _contador = value
        End Set
    End Property

    Public Property candidatoPaga() As Int32
        Get
            Return _candidatoPaga
        End Get
        Set(ByVal value As Int32)
            _candidatoPaga = value
        End Set
    End Property

End Class
