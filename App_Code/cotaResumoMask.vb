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
''' Classe cotaResumoMask, contem os atritubos de um: _numQuotaToSend, _numQuotaSended, _numCurrentBalance.
''' </summary>

Public Class cotaResumoMask

    Private _numQuotaToSend As String
    Private _numQuotaSended As String
    Private _numCurrentBalance As String

    Public Sub New()
        MyBase.New()
    End Sub

    Public Property numQuotaToSend() As String
        Get
            Return _numQuotaToSend
        End Get
        Set(ByVal value As String)
            _numQuotaToSend = value
        End Set
    End Property

    Public Property numQuotaSended() As String
        Get
            Return _numQuotaSended
        End Get
        Set(ByVal value As String)
            _numQuotaSended = value
        End Set
    End Property

    Public Property numCurrentBalance() As String
        Get
            Return _numCurrentBalance
        End Get
        Set(ByVal value As String)
            _numCurrentBalance = value
        End Set
    End Property

End Class
