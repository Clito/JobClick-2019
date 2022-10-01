Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Text.Encoding
Imports System.DBNull

Partial Class _admin_excluirUser
    Inherits System.Web.UI.Page

    Protected Sub LinkButtonPESQUISAR_Click(sender As Object, e As EventArgs) Handles LinkButtonPESQUISAR.Click
        PESQUISALabel.Text = TextBoxPESQUISA.Text
    End Sub

    Protected Sub GridViewRESULTADO_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewRESULTADO.SelectedIndexChanged
        REM ** ************************************************************************************
        REM ** EXCLUI O USUÁRIO
        REM ** ************************************************************************************

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PESQUISA_USUARIO]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idUser", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idUser").Value = GridViewRESULTADO.SelectedValue

        prm = New SqlParameter("@excluir", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@excluir").Value = 1

        prm = New SqlParameter("@nome", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nome").Value = DBNull.Value

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        GridViewRESULTADO.DataBind()

    End Sub
End Class
