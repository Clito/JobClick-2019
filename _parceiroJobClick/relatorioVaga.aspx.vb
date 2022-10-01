Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _parceiroJobClick_relatorioVaga
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        REM ** RELATÓRIO E CHART 
        REM ** ************************************************************

        REM ** VAGA (MODELO)

        LabeldsRelatorio.Text = "Visualização das vagas publicadas"
        chartModeloLabel.Text = "PieChart"

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_RELATORIO_JSON_VAGASPUBLICAS", cn)
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

    Protected Sub GridViewVAGA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewVAGA.SelectedIndexChanged
        Response.Redirect("alterarVaga.aspx?idVagaPublica=" & GridViewVAGA.SelectedDataKey("idVagaPublica") & "&titVagaPublica=" & GridViewVAGA.SelectedDataKey("titVagaPublica") & "&URL=relatorioVaga.aspx")
    End Sub


    Protected Sub GridViewVAGA_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridViewVAGA.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim flgAprovado As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "topAn"))
            Dim flgidVagaPublica As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "idVagaPublica"))

            Dim myImageButtonSelect As New ImageButton
            myImageButtonSelect = e.Row.FindControl("ImageButtonSelect")

            Dim myLinkButtonVAGA As New LinkButton
            myLinkButtonVAGA = e.Row.FindControl("LinkButtonVAGA")

            Select Case flgAprovado
                Case "1"
                    e.Row.BackColor = Drawing.Color.YellowGreen ' AD OK.
                    myImageButtonSelect.ImageUrl = "~/_parceiroJobClick/images/viewDescricaoOK.png"
                    myImageButtonSelect.ToolTip = "Analytics - Vaga anunciada no Vagas Patrocinadas"
                    myImageButtonSelect.PostBackUrl = "analytics.aspx"
                    myLinkButtonVAGA.PostBackUrl = "alterarVaga.aspx?idVagaPublica=" & flgidVagaPublica & "&URL=relatorioVaga.aspx" & "&titVagaPublica=" & myLinkButtonVAGA.Text
                    myLinkButtonVAGA.ToolTip = "Para editar os dados desta publicação, clique aqui"
                Case "0"
                    e.Row.BackColor = Drawing.Color.LightGray  '  NO AD.
                Case Else
                    myLinkButtonVAGA.PostBackUrl = "alterarVaga.aspx?idVagaPublica=" & flgidVagaPublica & "&URL=relatorioVaga.aspx" & "&titVagaPublica=" & myLinkButtonVAGA.Text
                    myLinkButtonVAGA.ToolTip = "Para editar os dados desta publicação, clique aqui"
            End Select

        End If
    End Sub
End Class
