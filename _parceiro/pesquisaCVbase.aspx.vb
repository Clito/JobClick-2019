Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Partial Class _parceiro_pesquisaCVbase
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        LabelCabec.Text = Request.QueryString("autoTit")
        PanelCVCandidato.Visible = False
        Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")

        If idCadastroEmpresaFilha = "" Then
            Response.Redirect("Default.aspx")
        End If

        If idCadastroEmpresaFilha <> "" Then
            idCadastroEmpresaFilhaLabel.Text = Session("idCadastroEmpresaFilha")
        End If

        VerificaPesquisa()

    End Sub

    Sub VerificaPesquisa()

        REM *** ******************************************************************************************
        REM *** LIBERA BOTÃO DE PESQUISA APENAS SE HOUVER FILTROS CADASTRADOS
        REM *** ******************************************************************************************
        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_LIBERA_PESQUISA_CANDIDATO_BASE", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idRH_Gestor", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader()

        dr.Read()
        If dr("liberaBotao") = 1 Then
            ImageButtonPSQ.Visible = True
        Else
            ImageButtonPSQ.Visible = False
        End If
        dr.Close()

        cn.Close()

    End Sub

    Protected Sub GridViewFiltro_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewFiltro.SelectedIndexChanged
        idFiltroDinamicoMontadorLabel.Text = GridViewFiltro.SelectedDataKey("idFiltroDinamicoMontador")
        idRH_GestorLabel.Text = GridViewFiltro.SelectedDataKey("idRH_Gestor")
    End Sub

    Protected Sub FormViewFiltro_DataBound(sender As Object, e As System.EventArgs) Handles FormViewFiltro.DataBound
        Try
            CType(FormViewFiltro.FindControl("idProcessoSeletivoTextBox"), TextBox).Text = idProcessoSeletivoLabel.Text
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub SqlFiltro_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlFiltro.Updated
        GridViewFiltro.DataBind()
        VerificaPesquisa()
    End Sub

    Protected Sub SqlFiltro_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlFiltro.Inserted
        GridViewFiltro.DataBind()
        VerificaPesquisa()
    End Sub

    Protected Sub SqlFiltro_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlFiltro.Deleted
        GridViewFiltro.DataBind()
        VerificaPesquisa()
    End Sub

    Sub GetPesquisaRES()

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        con.Open()
        Dim query As String = "spPesquisaCandidato_CONSULTOR " & Session("idRH_Gestor")
        Dim da As New SqlDataAdapter(query, con)
        Dim ds As New DataSet()
        da.Fill(ds)
        con.Close()

        GridViewResPesquisa.DataSource = ds.Tables(0)

        GridViewResPesquisa.DataBind()
        GridViewFiltro.DataBind()

        PanelApresentaRes.Visible = True
        PanelApresentaRes.DataBind()

    End Sub

    Protected Sub SqlFiltro_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlFiltro.Inserting
        e.Command.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")
    End Sub

    Protected Sub ImageButtonClose_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonClose.Click
        PanelApresentaRes.Visible = False
    End Sub

    Protected Sub GridViewResPesquisa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewResPesquisa.SelectedIndexChanged
        PanelCVCandidato.Visible = True
        idcurriculoLabel.Text = GridViewResPesquisa.SelectedDataKey("idcurriculo")
        idUserLabel.Text = GridViewResPesquisa.SelectedDataKey("idUser")

    End Sub

    Protected Sub ImageButtonPSQ_Click(sender As Object, e As EventArgs) Handles ImageButtonPSQ.Click
        PanelApresentaRes.Visible = True

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROCESSOSELETIVO_FILTROS_XML_CONSULTOR", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRH_Gestor").Value = Session("idRH_Gestor")

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idSetup")

        cn.Open()

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Close()

        Catch ex As Exception

        End Try

        cn.Close()

        GetPesquisaRES()
    End Sub

    Protected Sub ImageButtonImprimir_Click1(sender As Object, e As EventArgs) Handles ImageButtonImprimir.Click
        Dim idUser As String = idUserLabel.Text
        Dim idCurriculo As String = idcurriculoLabel.Text
        Dim DocName As String = CType(DataListCV.Items(0).FindControl("nomeLabel0"), Label).Text
        Response.Redirect("/_anonimo/_mycurriculoDOC_Consultor.aspx?idCadastroUser=0&idUser=" & idUser & "&id=" & idCurriculo & "&DocName=" & DocName)
    End Sub
End Class
