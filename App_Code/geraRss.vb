Imports Microsoft.VisualBasic
Imports System.Xml
Imports System.IO
Imports System.Data.DataSet
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter


Public Class Rss

    Public OutputStream As Stream
    Public RssTitulo As String
    Public EditorURL As String
    Public Descricao As String
    Public Copyright As String
    Public Generator As String
    Public ItemFonte As DataSet
    Public ItemTituloCampo As String
    Public ItemURLCampo As String
    Public ItemDescricaoCampo As String
    Public ItemPublicacaoCampo As String

    Public Shared Sub publicarRss(ByVal r As Rss)

        Dim writer As New XmlTextWriter(r.OutputStream, System.Text.Encoding.UTF8)

        writer.WriteStartElement("rss")
        writer.WriteAttributeString("version", "2.0")
        writer.WriteStartElement("channel")
        writer.WriteElementString("title", r.RssTitulo)
        writer.WriteElementString("link", r.EditorURL)
        writer.WriteElementString("description", r.Descricao)
        writer.WriteElementString("copyright", r.Copyright)
        writer.WriteElementString("generator", r.Generator)

        For Each row As DataRow In r.ItemFonte.Tables(0).Rows
            writer.WriteStartElement("item")
            writer.WriteElementString("title", row(r.ItemTituloCampo))
            writer.WriteElementString("link", row(r.ItemURLCampo))
            writer.WriteElementString("description", row(r.ItemDescricaoCampo))
            writer.WriteElementString("pubDate", CType(Now, DateTime).ToString("ddd, dd MMM yyyy"))
            writer.WriteEndElement()
        Next

        writer.WriteEndElement()
        writer.WriteEndElement()
        writer.Flush()

    End Sub

    Function geraDataSet(ByVal idUser As String) As DataSet

        Dim conn As New SqlConnection
        Dim cmd As New SqlCommand
        Dim da As New SqlDataAdapter
        Dim ds As New DataSet
        Dim sSQL As String = ""

        conn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        sSQL = "_USP_RSS_JOBCLICK"

        cmd.Connection = conn
        cmd.CommandText = sSQL
        da.SelectCommand = cmd

        da.Fill(ds)

        conn.Dispose()
        cmd.Dispose()
        da.Dispose()

        Return ds

    End Function

End Class

