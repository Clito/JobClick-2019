Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Text.Encoding
Imports System.DBNull

Partial Class _admin_contrato
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridViewEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewEmpresa.SelectedIndexChanged
        idSetupLabel.Text = GridViewEmpresa.SelectedDataKey("idsetup")
        idCadastroEmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("idCadastroEmpresa")
        EmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("empresa")
        GridViewEmpresa.Visible = False
        Contrato.Visible = True
    End Sub

    Protected Sub LinkButtonRESET_Click(sender As Object, e As System.EventArgs)
        idSetupLabel.Text = ""
        idCadastroEmpresaLabel.Text = ""
        EmpresaLabel.Text = "Selecione uma empresa"
        GridViewEmpresa.Visible = True
        Contrato.Visible = False
    End Sub

    Protected Sub LinkButtonFechar_Click(sender As Object, e As System.EventArgs)
        idSetupLabel.Text = ""
        idCadastroEmpresaLabel.Text = ""
        GridViewEmpresa.Visible = True
        Contrato.Visible = False
    End Sub

    Protected Sub LinkButtonCargaTermo_Click(sender As Object, e As System.EventArgs)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_CARGA_TERMO_CONDICAO]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = idSetupLabel.Text

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        Contrato.DataBind()

    End Sub

    Protected Sub SqlContratoFORM_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlContratoFORM.Updated
        Contrato.DataBind()
    End Sub

    Protected Sub SqlContratoFORM_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlContratoFORM.Inserted
        Contrato.DataBind()
    End Sub

    Protected Sub SqlContratoFORM_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlContratoFORM.Deleted
        Contrato.DataBind()
    End Sub
End Class
