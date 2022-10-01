Imports System
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf

Partial Class _corporativo_laudos_laudoCandidato
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        idLaudoLabel.Text = criptografia.Descriptografar(Request.QueryString("idLaudo"), "#!$a36?@")
        Dim DocName = "Arquivo " & idLaudoLabel.Text
        Response.AppendHeader("Content-Type", "application/msword")
        Response.AppendHeader("Content-disposition", "attachment; filename=" & DocName & ".doc")
        Response.Charset = "ISO-8859-1"
    End Sub
End Class
