Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Partial Class _parceiroJobClick_relatorioCandidato
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        REM ** RELATÓRIO E CHART 
        REM ** ************************************************************

        REM ** VAGA (MODELO)

        LabeldsRelatorio.Text = "Visualização das candidaturas"
        chartModeloLabel.Text = "ColumnChart"

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_RELATORIO_JSON_VAGASPUBLICASXCANDIDATURA", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

        Try

            cn.Open()

            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Read()

            parametroLabel.Text = dr("JSonRES")

            dr.Close()
            cn.Close()

        Catch ex As Exception

        End Try

    End Sub

    Protected Sub GridViewCANDIDATURA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewCANDIDATURA.SelectedIndexChanged
        Response.Redirect("alterarVaga.aspx?idVagaPublica=" & GridViewCANDIDATURA.SelectedDataKey("idVagaPublica") & "&titVagaPublica=" & GridViewCANDIDATURA.SelectedDataKey("titVagaPublica"))
    End Sub
End Class
