Imports System.Web.UI.WebControls.Label
Imports System.Web.UI.WebControls.DataList
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull


Partial Class _candidato_mycurriculo
    Inherits System.Web.UI.Page

    Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        idCurriculoLabel.Text = Session("idCurriculo")
        LabelCurriculoAtivo.Text = "<b>Curriculo Ativo:</b> " & Replace(Session("dscurriculo"), "<b>Curriculo:</b>", "")
    End Sub

End Class
