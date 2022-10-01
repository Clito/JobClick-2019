Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _admin_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        SetupLabel.Text = "Empresa: " & Session("nomeEmpresa")
        UsuariosOnlineLabel.Text = "Usuários online: " & Application("Hits") & " Usuários ativos: " & Application("Sessions")
        Session("NomeUsuarioCC") = Session("nome")
    End Sub

    Protected Sub GridViewEMPRESA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewEMPRESA.SelectedIndexChanged
        REM CRIA O REGISTRO NA TABELA tbsetup

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_AD_STATUS_EMPRESA]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = GridViewEMPRESA.SelectedDataKey("idCadastroEmpresa")

        prm = New SqlParameter("@idUser", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idUser").Value = GridViewEMPRESA.SelectedDataKey("idUser")

        prm = New SqlParameter("@idCadastroUser", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroUser").Value = GridViewEMPRESA.SelectedDataKey("idCadastroUser")

        prm = New SqlParameter("@idTypeUser", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idTypeUser").Value = GridViewEMPRESA.SelectedDataKey("idTypeUser")


        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

        End If

        dr.Close()
        cn.Close()

        GridViewEMPRESA.DataBind()

    End Sub
End Class
