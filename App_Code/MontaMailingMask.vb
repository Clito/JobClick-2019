Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Public Class MontaMailingMask

    Private _IncstrNameGroup As String
    Private _IncDynamicFieldTag1 As String
    Private _IncDynamicFieldTag2 As String
    Private _IncDynamicFieldTag3 As String
    Private _IncDynamicFieldTag4 As String
    Private _IncDynamicFieldTag5 As String
    Private _IncDynamicFieldTag6 As String
    Private _IncDynamicFieldTag7 As String
    Private _IncDynamicFieldTag8 As String
    Private _IncDynamicFieldTag9 As String
    Private _IncDynamicFieldTag10 As String


    Public Sub New()
        MyBase.New()
    End Sub

    Public Property IncstrNameGroup() As String
        Get
            Return _IncstrNameGroup
        End Get
        Set(ByVal value As String)
            _IncstrNameGroup = value
        End Set
    End Property

    Public Property IncDynamicFieldTag1() As String
        Get
            Return _IncDynamicFieldTag1
        End Get
        Set(ByVal value As String)
            _IncDynamicFieldTag1 = value
        End Set
    End Property

    Public Property IncDynamicFieldTag2() As String
        Get
            Return _IncDynamicFieldTag2
        End Get
        Set(ByVal value As String)
            _IncDynamicFieldTag2 = value
        End Set
    End Property

    Public Property IncDynamicFieldTag3() As String
        Get
            Return _IncDynamicFieldTag3
        End Get
        Set(ByVal value As String)
            _IncDynamicFieldTag3 = value
        End Set
    End Property

    Public Property IncDynamicFieldTag4() As String
        Get
            Return _IncDynamicFieldTag4
        End Get
        Set(ByVal value As String)
            _IncDynamicFieldTag4 = value
        End Set
    End Property

    Public Property IncDynamicFieldTag5() As String
        Get
            Return _IncDynamicFieldTag5
        End Get
        Set(ByVal value As String)
            _IncDynamicFieldTag5 = value
        End Set
    End Property

    Public Property IncDynamicFieldTag6() As String
        Get
            Return _IncDynamicFieldTag6
        End Get
        Set(ByVal value As String)
            _IncDynamicFieldTag6 = value
        End Set
    End Property

    Public Property IncDynamicFieldTag7() As String
        Get
            Return _IncDynamicFieldTag7
        End Get
        Set(ByVal value As String)
            _IncDynamicFieldTag7 = value
        End Set
    End Property

    Public Property IncDynamicFieldTag8() As String
        Get
            Return _IncDynamicFieldTag8
        End Get
        Set(ByVal value As String)
            _IncDynamicFieldTag8 = value
        End Set
    End Property

    Public Property IncDynamicFieldTag9() As String
        Get
            Return _IncDynamicFieldTag9
        End Get
        Set(ByVal value As String)
            _IncDynamicFieldTag9 = value
        End Set
    End Property

    Public Property IncDynamicFieldTag10() As String
        Get
            Return _IncDynamicFieldTag10
        End Get
        Set(ByVal value As String)
            _IncDynamicFieldTag10 = value
        End Set
    End Property

End Class
