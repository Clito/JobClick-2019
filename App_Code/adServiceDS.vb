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
Imports br.com.jobclick.wsjobclick.WSsponsoredAD

Public Class adServiceDS
    Public Shared Function GetAD(ByVal IPLiberaContagemRes As String, ByVal cidadeADRes As String, ByVal estadoADRes As String, ByVal paisADRes As String, ByVal lpesquisaOnServerRes As String) As DataSet
        Dim service As br.com.jobclick.wsjobclick.WSsponsoredAD = New br.com.jobclick.wsjobclick.WSsponsoredAD
        Dim ds As DataSet = service.getAD(IPLiberaContagemRes, cidadeADRes, estadoADRes, paisADRes, lpesquisaOnServerRes)
        Return ds
    End Function
End Class
