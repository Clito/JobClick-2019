Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
''' <summary>
''' Classe que apresenta os anúncios com o filtro do navegador.
''' </summary>
''' 

Public Class ad

    Private _idAD As Int32
    Private _tipoVaga As Int32
    Private _nomeAD As String
    Private _chamadaVaga As String
    Private _dsVaga As String
    Private _redeAD As String
    Private _cidadeAD As String
    Private _estadoAD As String
    Private _paisAD As String
    Private _publicarEm As Int32
    Private _longitude As String
    Private _latitude As String
    Private _lance As Decimal
    Private _orcamento As Decimal
    Private _URLdestino As String
    Private _palavrachave As String
    Private _cntClick As Int32
    Private _cntImpressao As Int32
    Private _cntMergulho As Int32
    Private _qtdImpressao As Int32

    Public Sub New()
        MyBase.New()
    End Sub

    Public Property idAD() As Int32
        Get
            Return _idAD
        End Get
        Set(ByVal value As Int32)
            _idAD = value
        End Set
    End Property

    Public Property tipoVaga() As Int32
        Get
            Return _tipoVaga
        End Get
        Set(ByVal value As Int32)
            _tipoVaga = value
        End Set
    End Property

    Public Property nomeAD() As String
        Get
            Return _nomeAD
        End Get
        Set(ByVal value As String)
            _nomeAD = value
        End Set
    End Property

    Public Property chamadaVaga() As String
        Get
            Return _chamadaVaga
        End Get
        Set(ByVal value As String)
            _chamadaVaga = value
        End Set
    End Property

    Public Property dsVaga() As String
        Get
            Return _dsVaga
        End Get
        Set(ByVal value As String)
            _dsVaga = value
        End Set
    End Property

    Public Property redeAD() As String
        Get
            Return _redeAD
        End Get
        Set(ByVal value As String)
            _redeAD = value
        End Set
    End Property

    Public Property cidadeAD() As String
        Get
            Return _cidadeAD
        End Get
        Set(ByVal value As String)
            _cidadeAD = value
        End Set
    End Property

    Public Property estadoAD() As String
        Get
            Return _estadoAD
        End Get
        Set(ByVal value As String)
            _estadoAD = value
        End Set
    End Property

    Public Property paisAD() As String
        Get
            Return _paisAD
        End Get
        Set(ByVal value As String)
            _paisAD = value
        End Set
    End Property

    Public Property publicarEm() As Int32
        Get
            Return _publicarEm
        End Get
        Set(ByVal value As Int32)
            _publicarEm = value
        End Set
    End Property

    Public Property longitude() As String
        Get
            Return _longitude
        End Get
        Set(ByVal value As String)
            _longitude = value
        End Set
    End Property

    Public Property latitude() As String
        Get
            Return _latitude
        End Get
        Set(ByVal value As String)
            _latitude = value
        End Set
    End Property

    Public Property lance() As Decimal
        Get
            Return _lance
        End Get
        Set(ByVal value As Decimal)
            _lance = value
        End Set
    End Property

    Public Property orcamento() As Decimal
        Get
            Return _orcamento
        End Get
        Set(ByVal value As Decimal)
            _orcamento = value
        End Set
    End Property

    Public Property URLdestino() As String
        Get
            Return _URLdestino
        End Get
        Set(ByVal value As String)
            _URLdestino = value
        End Set
    End Property

    Public Property palavrachave() As String
        Get
            Return _palavrachave
        End Get
        Set(ByVal value As String)
            _palavrachave = value
        End Set
    End Property

    Public Property cntClick() As Int32
        Get
            Return _cntClick
        End Get
        Set(ByVal value As Int32)
            _cntClick = value
        End Set
    End Property

    Public Property cntImpressao() As Int32
        Get
            Return _cntImpressao
        End Get
        Set(ByVal value As Int32)
            _cntImpressao = value
        End Set
    End Property

    Public Property cntMergulho() As Int32
        Get
            Return _cntMergulho
        End Get
        Set(ByVal value As Int32)
            _cntMergulho = value
        End Set
    End Property

    Public Property qtdImpressao() As Int32
        Get
            Return _qtdImpressao
        End Get
        Set(ByVal value As Int32)
            _qtdImpressao = value
        End Set
    End Property

End Class
