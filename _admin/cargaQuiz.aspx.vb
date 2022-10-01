Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Text.Encoding
Imports System.DBNull
Partial Class _admin_cargaQuiz
    Inherits System.Web.UI.Page

    Protected Sub GridViewEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewEmpresa.SelectedIndexChanged
        idSetupLabel.Text = GridViewEmpresa.SelectedDataKey("idsetup")
        idCadastroEmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("idCadastroEmpresa")
        EmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("empresa")
        GridViewEmpresa.Visible = False
        LabelEmpresa.Visible = False
    End Sub

    Protected Sub LinkButtonCancelar_Click(sender As Object, e As System.EventArgs) Handles LinkButtonCancelar.Click
        Response.Redirect("/_admin/cargaQuiz.aspx")
    End Sub

    Protected Sub LinkButtonCARGA_Click(sender As Object, e As System.EventArgs) Handles LinkButtonCARGA.Click
        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_ADMIN_CARGA_QUIZ_EMPRESA", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idQuiz", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idQuiz").Value = idQuizLabel.Text

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresaLabel.Text

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = idSetupLabel.Text

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        GridViewRes.DataBind()

    End Sub

    Protected Sub DropDownListQUIZ_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownListQUIZ.SelectedIndexChanged
        idQuizLabel.Text = DropDownListQUIZ.SelectedValue
        LinkButtonCARGA.Visible = True
    End Sub

    Protected Sub GridViewRes_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewRes.SelectedIndexChanged
        idQuizCOPYLabel.Text = GridViewRes.SelectedDataKey("idQuiz")
        LinkButtonAtualizar.Visible = True
    End Sub

    Protected Sub LinkButtonAtualizar_Click(sender As Object, e As EventArgs) Handles LinkButtonAtualizar.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_ADMIN_UPDATE_QUIZ_EMPRESA]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idQuiz", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idQuiz").Value = idQuizCOPYLabel.Text

        prm = New SqlParameter("@idQuizCOPY", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idQuizCOPY").Value = idQuizLabel.Text

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresaLabel.Text

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = idSetupLabel.Text

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        GridViewRes.DataBind()

    End Sub
End Class
