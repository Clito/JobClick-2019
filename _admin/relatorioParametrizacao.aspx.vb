Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Text.Encoding
Imports System.DBNull
Partial Class _admin_relatorioParametrizacao
    Inherits System.Web.UI.Page

    Protected Sub GridViewEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewEmpresa.SelectedIndexChanged
        idSetupLabel.Text = GridViewEmpresa.SelectedDataKey("idsetup")
        idCadastroEmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("idCadastroEmpresa")
        EmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("empresa")
        GridViewEmpresa.Visible = False
    End Sub

    Protected Sub GridViewRELATORIO_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewRELATORIO.SelectedIndexChanged
        idRelatorioLabel.Text = GridViewRELATORIO.SelectedValue
    End Sub

    Protected Sub LinkButtonCARGA_Click(sender As Object, e As System.EventArgs)
        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_CARGA_RELATORIO]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = idSetupLabel.Text

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        GridViewRELATORIO.DataBind()

    End Sub
End Class
