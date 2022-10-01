Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Partial Class _empresa_filtroPS
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")

        If idCadastroEmpresaFilha = "" Then
            Response.Redirect("Default.aspx")
        End If

        If idCadastroEmpresaFilha <> "" Then
            idCadastroEmpresaFilhaLabel.Text = Session("idCadastroEmpresaFilha")
        End If

    End Sub

    Protected Sub DropDownListSelectEmpresa_DataBound(sender As Object, e As System.EventArgs) Handles DropDownListSelectEmpresa.DataBound
        Try
            Dim myDropDownListSelectEmpresa As DropDownList = DropDownListSelectEmpresa
            myDropDownListSelectEmpresa.Items.Insert(0, New ListItem("-- Selecione uma Empresa --", "0"))
            myDropDownListSelectEmpresa.SelectedValue = Session("idCadastroEmpresaFilha")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownListSelectEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownListSelectEmpresa.SelectedIndexChanged
        idCadastroEmpresaFilhaLabel.Text = DropDownListSelectEmpresa.SelectedValue
        idProcessoSeletivoLabel.Text = 0
        FormViewFiltro.Visible = False
        Session("idCadastroEmpresaFilha") = idCadastroEmpresaFilhaLabel.Text
    End Sub

    Protected Sub GridViewVAGA_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewVAGA.SelectedIndexChanged
        idProcessoSeletivoLabel.Text = GridViewVAGA.SelectedDataKey("idProcessoSeletivo")
        idRH_GestorLabel.Text = GridViewVAGA.SelectedDataKey("idRH_Gestor")

        If idProcessoSeletivoLabel.Text = 0 Then
            FormViewFiltro.Visible = False
            Passo1Label0.Visible = True
            Passo1Label0.Text = "Passo 2 (dois) - Editar ou Incluir os filtros dinâmicos:<br><b>(Ops... Primeiro é necessário criar o Processo Seletivo!)</b>"
        Else
            FormViewFiltro.Visible = True
            Passo1Label0.Visible = True
            Passo1Label0.Text = "Passo 2 (dois) - Editar ou Incluir os filtros dinâmicos:"
        End If

    End Sub


    Protected Sub GridViewFiltro_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewFiltro.SelectedIndexChanged
        idFiltroDinamicoMontadorLabel.Text = GridViewFiltro.SelectedDataKey("idFiltroDinamicoMontador")
    End Sub

    Protected Sub FormViewFiltro_DataBound(sender As Object, e As System.EventArgs) Handles FormViewFiltro.DataBound
        Try
            CType(FormViewFiltro.FindControl("idProcessoSeletivoTextBox"), TextBox).Text = idProcessoSeletivoLabel.Text
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub SqlFiltro_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlFiltro.Updated
        GridViewFiltro.DataBind()
    End Sub

    Protected Sub SqlFiltro_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlFiltro.Inserted
        GridViewFiltro.DataBind()
    End Sub

    Protected Sub SqlFiltro_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlFiltro.Deleted
        GridViewFiltro.DataBind()
    End Sub

    Protected Sub LinkButtonXML_Click(sender As Object, e As System.EventArgs) Handles LinkButtonXML.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROCESSOSELETIVO_FILTROS_XML", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

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

        GridViewFiltro.DataBind()

        GetPesquisaRES()

    End Sub

    Sub GetPesquisaRES()

        'Dim cn As SqlConnection
        'Dim cmd As SqlCommand
        'Dim prm As SqlParameter

        'cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        'Dim command As New SqlCommand
        'Dim adapter As New SqlDataAdapter(command)

        'cmd = New SqlCommand("spPesquisaCandidato", cn)
        'cmd.CommandType = CommandType.StoredProcedure

        'prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
        'prm.Direction = ParameterDirection.Input
        'cmd.Parameters.Add(prm)
        'cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

        'cn.Open()

        'Dim dr As SqlDataReader = cmd.ExecuteReader

        'If dr.HasRows Then
        '    dr.Read()

        'End If

        'cn.Close()

        'GridViewResPesquisa.DataBind()

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        con.Open()
        Dim query As String = "spPesquisaCandidato " & idProcessoSeletivoLabel.Text
        Dim da As New SqlDataAdapter(query, con)
        Dim ds As New DataSet()
        da.Fill(ds)
        con.Close()
        GridViewResPesquisa.DataSource = ds.Tables(0)
        GridViewResPesquisa.DataBind()

    End Sub

End Class

