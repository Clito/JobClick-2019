Imports Rss
Imports System.Data

Partial Class canalrss
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim idUser As String = ""

        If Request.QueryString("news") <> "" Then
            idUser = Request.QueryString("news")
        Else
            idUser = "0"
        End If

        Dim r As New Rss
        Dim ds As DataSet = r.geraDataSet(idUser)

        r.OutputStream = Response.OutputStream
        r.RssTitulo = "Vagas"
        r.EditorURL = Request.Url.Host
        r.Descricao = "Jobclick"
        r.Copyright = "Copyright (C) - www.jobclick.com.br"
        r.Generator = "Gerador de RSS"
        r.ItemFonte = ds
        r.ItemTituloCampo = "Cargo"
        r.ItemDescricaoCampo = "QualificacaoHabilidadesEspecificas"
        r.ItemPublicacaoCampo = "data_ini"
        r.ItemURLCampo = "URL"

        Response.ContentEncoding = System.Text.Encoding.UTF8
        Response.ContentType = "text/xml"
        Rss.publicarRss(r)
        Response.End()


    End Sub

End Class
