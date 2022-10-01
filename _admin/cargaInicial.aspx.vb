Imports user
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports myValidaCNPJ


Partial Class _admin_cargaInicial
    Inherits System.Web.UI.Page

    Protected Sub GridViewEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewEmpresa.SelectedIndexChanged

        idSetupLabel.Text = GridViewEmpresa.SelectedDataKey("idsetup")
        idCadastroEmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("idCadastroEmpresa")
        lblCabec.Text = "Você irá dar a carga na empresa"
        AvisoLabel.Text = "<b>Atenção:</b><br>Esta carga deve ser aplicada apenas para as novas empresas cadastradas por você!"
        EmpresaLabel.Text = ":  " & GridViewEmpresa.SelectedDataKey("empresa")
        GridViewEmpresa.Visible = False
        LabelEmpresa.Visible = False

    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        lblCabec.Text = "Carga completa para as novas empresas"
        AvisoLabel.Text = ""
    End Sub

    Protected Sub GridViewEmpresaSetup_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewEmpresaSetup.SelectedIndexChanged
        idCadastroEmpresaLabel.Text = GridViewEmpresaSetup.SelectedDataKey("idCadastroEmpresa_CE")

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_CARGA_EMPRESA_ONDEMAND]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@IdStatus", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresaLabel.Text
        cmd.Parameters("@IdStatus").Value = 1

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

        End If

        dr.Close()
        cn.Close()

        GridViewEmpresaSetup.DataBind()
        GridViewEmpresa.DataBind()

    End Sub
End Class
