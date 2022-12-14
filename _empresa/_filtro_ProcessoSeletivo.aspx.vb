Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Partial Class _empresa_filtro_ProcessoSeletivo
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        LabelCabec.Text = Request.QueryString("autoTit")
        Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")

        If idCadastroEmpresaFilha = "" Then
            Response.Redirect("Default.aspx")
        End If

        If idCadastroEmpresaFilha <> "" Then
            idCadastroEmpresaFilhaLabel.Text = Session("idCadastroEmpresaFilha")
        End If

        If Not IsPostBack Then
            CargoLabel.Text = ""
            ProtocoloCabecLabel.Text = ""
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
        CargoLabel.Text = ""
        ProtocoloCabecLabel.Text = ""
        idCadastroEmpresaFilhaLabel.Text = DropDownListSelectEmpresa.SelectedValue
        idProcessoSeletivoLabel.Text = 0
        FormViewFiltro.Visible = False
        Session("idCadastroEmpresaFilha") = idCadastroEmpresaFilhaLabel.Text
    End Sub

    Protected Sub GridViewVAGA_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewVAGA.SelectedIndexChanged

        CargoLabel.Text = GridViewVAGA.SelectedDataKey("dsCargo")
        ProtocoloCabecLabel.Text = GridViewVAGA.SelectedDataKey("Protocolo")

        idProcessoSeletivoLabel.Text = GridViewVAGA.SelectedDataKey("idProcessoSeletivo")
        idRH_GestorLabel.Text = GridViewVAGA.SelectedDataKey("idRH_Gestor")

        idFiltroDinamicoMontadorLabel.Text = ""

        If idProcessoSeletivoLabel.Text = 0 Then
            FormViewFiltro.Visible = False
            Passo1Label0.Visible = True
            Passo1Label0.Text = "Passo 2 (dois) - Editar ou Incluir os filtros dinâmicos:<br><b>(Ops... Primeiro é necessário criar o Processo Seletivo!)</b>"
        Else
            FormViewFiltro.Visible = True
            Passo1Label0.Visible = True
            Passo1Label0.Text = "Passo 2 (dois) - Editar ou Incluir os filtros dinâmicos:"
        End If

        LinkButtonXML.Visible = True

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

        PanelApresentaRes.Visible = True

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

        GetPesquisaRES()

    End Sub

    Sub GetPesquisaRES()

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        con.Open()
        Dim query As String = "spPesquisaCandidato " & idProcessoSeletivoLabel.Text
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
        e.Command.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text
    End Sub

    Protected Sub ImageButtonClose_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonClose.Click
        PanelApresentaRes.Visible = False
    End Sub

    Protected Sub GridViewResPesquisa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewResPesquisa.SelectedIndexChanged

        idcurriculoLabel.Text = GridViewResPesquisa.SelectedDataKey("idcurriculo")
        idUserLabel.Text = GridViewResPesquisa.SelectedDataKey("idUser")
        PanelCV.Visible = True

        REM ** LIMPA DOS DADOS DO CURRÍCULO ANTERIOR
        Label25.Text = ""
        Label31.Text = ""
        Label41.Text = ""
        Label42.Text = ""
        Label43.Text = ""
        Label44.Text = ""
        LabelDf.Text = ""
        LabelDp.Text = ""

    End Sub





    REM ** ********************************************************************************************************************
    REM ** CV
    REM ** ********************************************************************************************************************


    Protected Sub ImageButtonPanel_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonPanel.Click
        PanelCV.Visible = False
    End Sub


    Private Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then
            If DirectCast(e.Item.DataItem, DataRowView).Item("portadorDef") Then
                ImageDef.Visible = True
            End If

            Dim myFoto As String = ""

            myFoto = DirectCast(e.Item.DataItem, DataRowView).Item("foto").ToString

            If myFoto <> "" Then
                ImageCV.ImageUrl = myFoto
            Else
                ImageCV.ImageUrl = "~/images/cvnoImage.png"
            End If

        End If

    End Sub


    Private Sub DataList4_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList4.ItemDataBound


        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label25.Text = DirectCast(e.Item.DataItem, DataRowView).Item("dsinstituicao").ToString

        End If

        If Label25.Text.ToString <> "" Then
            DataList4.ShowHeader = True
        Else
            DataList4.ShowHeader = False
        End If

    End Sub


    Private Sub DataList5_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList5.ItemDataBound


        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label31.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo")

            Dim myLabel As Label = DirectCast(e.Item.FindControl("concluidoLabel"), Label)

            If myLabel.Text Then
                myLabel.Text = "Curso concluído"
            Else
                myLabel.Text = "Curso não concluído"
            End If

        End If

        If Label31.Text.ToString <> "" Then
            DataList5.ShowHeader = True
        Else
            DataList5.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList6_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList6.ItemDataBound


        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label41.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label41.Text.ToString <> "" Then
            DataList6.ShowHeader = True
        Else
            DataList6.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList7_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList7.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label42.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label42.Text.ToString <> "" Then
            DataList7.ShowHeader = True
        Else
            DataList7.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList8_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList8.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label43.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label43.Text.ToString <> "" Then
            DataList8.ShowHeader = True
        Else
            DataList8.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList9_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList9.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label44.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label44.Text.ToString <> "" Then
            DataList9.ShowHeader = True
        Else
            DataList9.ShowHeader = False
        End If

    End Sub

    Protected Sub DataListDef_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListDef.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then
            LabelDf.Text = DirectCast(e.Item.DataItem, DataRowView).Item("Obs").ToString
        End If

        If LabelDf.Text.ToString <> "" Then
            DataListDef.ShowHeader = True
        Else
            DataListDef.ShowHeader = False
        End If

    End Sub



    REM ** ********************************************************************************************************************
    REM ** CV
    REM ** ********************************************************************************************************************

End Class
