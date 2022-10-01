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


Public Class adService

    Public Shared Function GetAD(ByVal IPLiberaContagemRes As String, ByVal cidadeADRes As String, ByVal estadoADRes As String, ByVal paisADRes As String, ByVal pesquisaOnServer As String) As ad

        Dim service As br.com.jobclick.wsjobclick.WSsponsoredAD = New br.com.jobclick.wsjobclick.WSsponsoredAD

        Dim ds As DataSet = service.getAD(IPLiberaContagemRes, cidadeADRes, estadoADRes, paisADRes, pesquisaOnServer)

        Dim en As ad = New ad
        If (Not (ds) Is Nothing) Then
            If (ds.Tables(0).Rows.Count > 0) Then
                en.idAD = ds.Tables(0).Rows(0)("idAD").ToString
                en.tipoVaga = ds.Tables(0).Rows(0)("tipoVaga").ToString
                en.nomeAD = ds.Tables(0).Rows(0)("nomeAD").ToString
                en.chamadaVaga = ds.Tables(0).Rows(0)("chamadaVaga").ToString
                en.dsVaga = ds.Tables(0).Rows(0)("dsVaga").ToString
                en.URLdestino = ds.Tables(0).Rows(0)("URLdestino").ToString
            End If
        End If

        Return en
    End Function

End Class
