Imports Microsoft.VisualBasic

Public Class analyticsMask
    Private _IPRes As String
    Private _CountryCode As String
    Private _CountryName As String
    Private _RegionCode As String
    Private _RegionName As String
    Private _City As String
    Private _Longitude As String
    Private _Latitude As String


    Public Sub New()
        MyBase.New()
    End Sub

    Public Property IPRes() As String
        Get
            Return _IPRes
        End Get
        Set(ByVal value As String)
            _IPRes = value
        End Set
    End Property

    Public Property CountryCode() As String
        Get
            Return _CountryCode
        End Get
        Set(ByVal value As String)
            _CountryCode = value
        End Set
    End Property

    Public Property CountryName() As String
        Get
            Return _CountryName
        End Get
        Set(ByVal value As String)
            _CountryName = value
        End Set
    End Property

    Public Property RegionCode() As String
        Get
            Return _RegionCode
        End Get
        Set(ByVal value As String)
            _RegionCode = value
        End Set
    End Property

    Public Property RegionName() As String
        Get
            Return _RegionName
        End Get
        Set(ByVal value As String)
            _RegionName = value
        End Set
    End Property

    Public Property City() As String
        Get
            Return _City
        End Get
        Set(ByVal value As String)
            _City = value
        End Set
    End Property

    Public Property Longitude() As String
        Get
            Return _Longitude
        End Get
        Set(ByVal value As String)
            _Longitude = value
        End Set
    End Property

    Public Property Latitude() As String
        Get
            Return _Latitude
        End Get
        Set(ByVal value As String)
            _Latitude = value
        End Set
    End Property
End Class
