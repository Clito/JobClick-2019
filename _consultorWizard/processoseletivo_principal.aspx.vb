Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _empresa_processoseletivo_principal
    Inherits System.Web.UI.Page


    Protected Sub DropDownListVaga_DataBound(sender As Object, e As System.EventArgs) Handles DropDownListVaga.DataBound
        Try
            Dim myDropDownListVaga As DropDownList = DropDownListVaga
            myDropDownListVaga.Items.Insert(0, New ListItem("-- Selecione --", "0"))
            myDropDownListVaga.SelectedValue = DropDownListVaga.SelectedValue
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownListFase_DataBound(sender As Object, e As System.EventArgs) Handles DropDownListFase.DataBound
        Try
            Dim myDropDownListFase As DropDownList = DropDownListFase
            myDropDownListFase.Items.Insert(0, New ListItem("-- Selecione --", "0"))
            myDropDownListFase.SelectedValue = DropDownListFase.SelectedValue
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownListConsultor_DataBound(sender As Object, e As System.EventArgs)
        Try
            Dim myDropDownListConsultor As DropDownList = DropDownListConsultor
            myDropDownListConsultor.Items.Insert(0, New ListItem("-- Selecione --", "0"))
            myDropDownListConsultor.SelectedValue = DropDownListConsultor.SelectedValue
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownListSelectEmpresa_DataBound(sender As Object, e As System.EventArgs) Handles DropDownListSelectEmpresa.DataBound
        Try
            Dim myDropDownListSelectEmpresa As DropDownList = DropDownListSelectEmpresa
            myDropDownListSelectEmpresa.Items.Insert(0, New ListItem("-- Selecione uma Empresa --", "0"))
            myDropDownListSelectEmpresa.SelectedValue = Session("idCadastroEmpresaFilha")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub ButtonSalvar_Click(sender As Object, e As System.EventArgs) Handles ButtonSalvar.Click

        REM *** *********************************************************************************************************
        REM *** GRAVA O PROCESSO SELETIVO E SUAS FASES

        Dim myAlertDate As Int32 = -1
        myAlertDate = DateDiff(DateInterval.Day, Convert.ToDateTime(dataIniTextBox.Text), Convert.ToDateTime(dataFimTextBox.Text))

        If myAlertDate <= 0 Then
            msnLabel.Text = "A data de encerramento não deve ser menor ou igual a data de início!"
        Else
            msnLabel.Text = ""

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("_USP_PROCESSOSELETIVO_INSERT", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idSetup", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idSetup").Value = Session("idSetup")

            prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

            prm = New SqlParameter("@idVaga", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idVaga").Value = idVagaLabel.Text

            prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            If DropDownListConsultor.SelectedValue <> "" Then
                cmd.Parameters("@idRH_Gestor").Value = DropDownListConsultor.SelectedValue
            Else
                cmd.Parameters("@idRH_Gestor").Value = 0
            End If

            prm = New SqlParameter("@dsProcesso", SqlDbType.VarChar, 100)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            If dsProcessoTextBox.Text <> "" Then
                cmd.Parameters("@dsProcesso").Value = dsProcessoTextBox.Text
            Else
                cmd.Parameters("@dsProcesso").Value = ""
            End If

            prm = New SqlParameter("@idProcessoSeletivo", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idProcessoSeletivo").Value = idProcessoSeletivoLabel.Text

            prm = New SqlParameter("@idTipoFaseProcessoSeletivo", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idTipoFaseProcessoSeletivo").Value = DropDownListFase.SelectedValue

            prm = New SqlParameter("@dataIni", SqlDbType.DateTime)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@dataIni").Value = dataIniTextBox.Text

            prm = New SqlParameter("@dataFim", SqlDbType.DateTime)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@dataFim").Value = dataFimTextBox.Text

            prm = New SqlParameter("@mensagemAprovado", SqlDbType.VarChar, 2000)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@mensagemAprovado").Value = mensagemAprovadoTextBox.Text

            prm = New SqlParameter("@mensagemNAprovado", SqlDbType.VarChar, 2000)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@mensagemNAprovado").Value = mensagemReprovadoTextBox.Text

            prm = New SqlParameter("@encerrado", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@encerrado").Value = 0

            cn.Open()

            Try
                Dim dr As SqlDataReader = cmd.ExecuteReader

                dr.Close()

            Catch ex As Exception

            End Try

            cn.Close()

        End If

        GridViewListaProcessoSeletivo.DataBind()
        GridViewVAGA.DataBind()

        LimpaForm()

    End Sub

    Sub LimpaForm()

        DropDownListVaga.SelectedValue = "0"
        DropDownListConsultor.SelectedValue = "0"
        dsProcessoTextBox.Text = ""
        dataTextBox.Text = ""
        dataIniTextBox.Text = ""
        dataFimTextBox.Text = ""
        mensagemAprovadoTextBox.Text = ""
        mensagemReprovadoTextBox.Text = ""
        DropDownListFase.SelectedValue = "0"

        PanelProcessoSeletivoCompleto.Visible = False
        PanelProcessoSeletivoFases.Visible = False

        ImageButtonPS.Visible = False
        ImageButtonFPS.Visible = True

    End Sub

    Protected Sub GridViewListaProcessoSeletivo_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewListaProcessoSeletivo.SelectedIndexChanged
        idFaseProcessoSeletivoLabel.Text = GridViewListaProcessoSeletivo.SelectedDataKey("idFaseProcessoSeletivo")

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROCESSOSELETIVO_LISTA_EXCLUIR", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text

        cn.Open()

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Close()

        Catch ex As Exception

        End Try

        cn.Close()

        GridViewListaProcessoSeletivo.DataBind()

    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")

        If idCadastroEmpresaFilha = "" Then
            Response.Redirect("Default.aspx")
        End If

        If idCadastroEmpresaFilha <> "" Then
            idCadastroEmpresaFilhaLabel.Text = Session("idCadastroEmpresaFilha")
        End If
    End Sub

    Protected Sub DropDownListSelectEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownListSelectEmpresa.SelectedIndexChanged
        idCadastroEmpresaFilhaLabel.Text = DropDownListSelectEmpresa.SelectedValue
        Session("idCadastroEmpresaFilha") = idCadastroEmpresaFilhaLabel.Text
        idProcessoSeletivoLabel.Text = ""
        idVagaLabel.Text = ""

        PanelProcessoSeletivoCompleto.Visible = False
        PanelProcessoSeletivoFases.Visible = False

        ImageButtonPS.Visible = False
        ImageButtonFPS.Visible = False

        GridViewVAGA.DataBind()
        GridViewListaProcessoSeletivo.DataBind()

    End Sub

    Protected Sub GridViewVAGA_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewVAGA.SelectedIndexChanged

        idProcessoSeletivoLabel.Text = GridViewVAGA.SelectedDataKey("idProcessoSeletivo")
        idVagaLabel.Text = GridViewVAGA.SelectedDataKey("idVaga")
        idRH_GestorLabel.Text = GridViewVAGA.SelectedDataKey("idRH_Gestor")

        DropDownListVaga.SelectedValue = idVagaLabel.Text
        DropDownListVaga.DataBind()

        DropDownListConsultor.SelectedValue = idRH_GestorLabel.Text
        DropDownListConsultor.DataBind()

        PanelProcessoSeletivoCompleto.Visible = False
        PanelProcessoSeletivoFases.Visible = False

        If idProcessoSeletivoLabel.Text = 0 Then
            REM ** ***********************************************************
            REM ** INICIA UM NOVO PROCESSO SELETIVO
            REM ** ***********************************************************
            ImageButtonPS.Visible = True
            ImageButtonFPS.Visible = False
            Passo2Label.Visible = True
            Passo3Label.Visible = False
        Else
            REM ** ***********************************************************
            REM ** INCLUI FASES NO PROCESSO SELETIVO
            REM ** ***********************************************************
            ImageButtonPS.Visible = False
            ImageButtonFPS.Visible = True
            Passo2Label.Visible = False
            Passo3Label.Visible = True
        End If
    End Sub

    Protected Sub ImageButtonPS_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonPS.Click
        PanelProcessoSeletivoCompleto.Visible = True
        PanelProcessoSeletivoFases.Visible = True
    End Sub

    Protected Sub ButtonHideForm_Click(sender As Object, e As System.EventArgs) Handles ButtonHideForm.Click
        PanelProcessoSeletivoCompleto.Visible = False
        PanelProcessoSeletivoFases.Visible = False
    End Sub

    Protected Sub ImageButtonFPS_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonFPS.Click
        PanelProcessoSeletivoCompleto.Visible = False
        PanelProcessoSeletivoFases.Visible = True
    End Sub

    Protected Sub SqlPSVisaoGeral_Deleting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlPSVisaoGeral.Deleting
        e.Command.Parameters("@idFaseProcessoSeletivo").Value = idFaseProcessoSeletivoLabel.Text
        GridViewListaProcessoSeletivo.DataBind()
    End Sub
End Class
