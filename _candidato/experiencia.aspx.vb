Imports System.Web
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports ReplaceForm

Partial Class _candidato_experiencia
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            PanelAviso.Visible = False
            PanelCARGO_UPDATE.Visible = False
            PanelNAVEGADOR.Visible = True

            dsexperienciaTextBox.Attributes.Add("onkeypress", "limitarTexto(this, contador, 5000);")
            dsexperienciaTextBox.Attributes.Add("onkeyup", "limitarTexto(this, contador, 5000);")

        End If
    End Sub

    Protected Sub DataListLISTAEMPRESA_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DataListLISTAEMPRESA.SelectedIndexChanged
        idexprofissionalLabel.Text = DataListLISTAEMPRESA.SelectedValue
        DADOCANDIDATO(DataListLISTAEMPRESA.SelectedValue)
    End Sub

    Sub DADOCANDIDATO(idexprofissional As String)

        PanelNAVEGADOR.Visible = False
        PanelCARGO_UPDATE.Visible = True
        Dim myReplace As New ReplaceForm

        REM ** ***************************************************************************************************
        REM ** PEGA OS DADOS DA EXPERIÊNCIA DO CANDIDATO
        REM ** ***************************************************************************************************

        Dim oReader As SqlDataReader = Nothing
        Dim oConnection As SqlConnection

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        Dim oCommand As SqlCommand

        Dim prm As SqlParameter

        oCommand = New SqlCommand("_USP_EXPERIENCIA_PROFISSIONAL_SELECT_AUTOPREENCHIMENTO", oConnection)
        oCommand.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idcurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        oCommand.Parameters.Add(prm)
        oCommand.Parameters("@idcurriculo").Value = Session("idcurriculo")

        prm = New SqlParameter("@idexprofissional", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        oCommand.Parameters.Add(prm)
        oCommand.Parameters("@idexprofissional").Value = idexprofissional

        Try
            oConnection.Open()

            Dim dr As SqlDataReader = oCommand.ExecuteReader

            If dr.HasRows() Then

                dr.Read()

                nomeempresaTextBox.Text = dr("nomeempresa")
                cargoTextBox.Text = dr("dsfuncao")
                dsexperienciaTextBox.Text = myReplace.ReplaceIn(dr("dsexperiencia"))
                DropDownListATUACAO.SelectedValue = dr("idAreaAtuacao")
                DropDownListPORTE.SelectedValue = dr("idPorte")
                DropDownListRelacaoTrabalhista.SelectedValue = dr("idRelacaoTrabalhista")

                If dr("atual") = 0 Then
                    CheckBoxATUAL.Checked = "False"
                    DATAFIM_TR.Visible = True
                Else
                    CheckBoxATUAL.Checked = "True"
                    DATAFIM_TR.Visible = False
                End If

                mesITextBox.Text = dr("mes_ini")
                anoITextBox.Text = dr("ano_ini")
                mesFTextBox.Text = dr("mes_fim")
                anoFTextBox.Text = dr("ano_fim")

                SqlNivelProfissional.DataBind()
                DropDownListNivelProfissional.DataBind()

                DropDownListNivelProfissional.SelectedItem.Text = dr("dsNivelProfissional")


            End If

            dr.Close()
            oConnection.Close()

        Catch ex As Exception

        End Try

    End Sub
    Protected Sub LinkButtonCANCELAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonCANCELAR.Click
        PanelCARGO_UPDATE.Visible = False
        PanelNAVEGADOR.Visible = True
        idexprofissionalLabel.Text = "0"
    End Sub

    Protected Sub LinkButtonSalvar_Click(sender As Object, e As System.EventArgs) Handles LinkButtonSalvar.Click

        Dim ATUAL As Int32

        REM ** ********************************************************************************************************
        REM ** LÓGICA PARA VERIFICAR A DATA
        REM ** ********************************************************************************************************

        Dim dataINI As String = "1" & "/" & mesITextBox.Text & "/" & anoITextBox.Text
        Dim dataFIM As String = "1" & "/" & mesFTextBox.Text & "/" & anoFTextBox.Text
        Dim ERROGeral As Boolean = False

        If Not IsDate(dataINI) Then
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Informe uma data válida para o início do contrato.<br>"
            AVISOLABEL.CssClass = "msn"
            ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"
            ERROGeral = True
        End If

        REM ** VERIFICA SE É A ATUAL
        If CheckBoxATUAL.Checked Then
            ATUAL = 1
        Else
            If Not IsDate(dataFIM) Then
                ATUAL = 0
                PanelAviso.Visible = True
                AVISOLABEL.Text = AVISOLABEL.Text & "• Informe uma data válida do afastamento.<br>"
                AVISOLABEL.CssClass = "msn"
                ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"
                ERROGeral = True
            End If
        End If

        If Not ERROGeral Then

            REM ** ***************************************************************************************************
            REM ** GRAVA AS ALTERAÇÕES DOS DADOS DA EXPERIÊNCIA DO CANDIDATO
            REM ** ***************************************************************************************************
            Dim myReplace As New ReplaceForm

            Dim oReader As SqlDataReader = Nothing
            Dim oConnection As SqlConnection

            oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
            Dim oCommand As SqlCommand

            Dim prm As SqlParameter

            oCommand = New SqlCommand("_USP_EXPERIENCIA_PROFISSIONAL_UPDATE_AUTOPREENCHIMENTO", oConnection)
            oCommand.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idexprofissional", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@idexprofissional").Value = idexprofissionalLabel.Text

            prm = New SqlParameter("@idAreaAtuacao", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@idAreaAtuacao").Value = DropDownListATUACAO.SelectedValue

            prm = New SqlParameter("@idPorte", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@idPorte").Value = DropDownListPORTE.SelectedValue

            prm = New SqlParameter("@idRelacaoTrabalhista", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@idRelacaoTrabalhista").Value = DropDownListRelacaoTrabalhista.SelectedValue

            prm = New SqlParameter("@idNivelProfissional", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@idNivelProfissional").Value = DropDownListNivelProfissional.SelectedValue

            prm = New SqlParameter("@nomeempresa", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@nomeempresa").Value = nomeempresaTextBox.Text

            prm = New SqlParameter("@dsexperiencia", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@dsexperiencia").Value = myReplace.ReplaceIn(dsexperienciaTextBox.Text)

            prm = New SqlParameter("@data_ini", SqlDbType.DateTime)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@data_ini").Value = dataINI

            If ATUAL = 0 Then
                prm = New SqlParameter("@data_fim", SqlDbType.DateTime)
                prm.Direction = ParameterDirection.Input
                oCommand.Parameters.Add(prm)
                oCommand.Parameters("@data_fim").Value = dataFIM
            End If

            prm = New SqlParameter("@atual", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@atual").Value = ATUAL

            Try
                oConnection.Open()
                Dim dr As SqlDataReader = oCommand.ExecuteReader
                dr.Close()
                oConnection.Close()

                PanelAviso.Visible = True
                AVISOLABEL.Text = "• Sua experiência profissional foi salva com sucesso.<br>"
                AVISOLABEL.CssClass = "msnOK"

            Catch ex As Exception

                PanelAviso.Visible = True
                AVISOLABEL.Text = "• Houve um erro ao tentar gravar seus dados, tente mais tarde.<br>" & Err.Description
                AVISOLABEL.CssClass = "msn"
                ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"

            End Try

        End If

    End Sub


    Protected Sub LinkButtonEXCLUIR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonEXCLUIR.Click
        REM ** ***************************************************************************************************
        REM ** EXCLUI OS DADOS DA EXPERIÊNCIA DO CANDIDATO
        REM ** ***************************************************************************************************

        Dim oReader As SqlDataReader = Nothing
        Dim oConnection As SqlConnection

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        Dim oCommand As SqlCommand

        Dim prm As SqlParameter

        oCommand = New SqlCommand("_USP_EXPERIENCIA_PROFISSIONAL_DELETE_AUTOPREENCHIMENTO", oConnection)
        oCommand.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idcurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        oCommand.Parameters.Add(prm)
        oCommand.Parameters("@idcurriculo").Value = Session("idcurriculo")

        prm = New SqlParameter("@idexprofissional", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        oCommand.Parameters.Add(prm)
        oCommand.Parameters("@idexprofissional").Value = idexprofissionalLabel.Text

        Try
            oConnection.Open()
            Dim dr As SqlDataReader = oCommand.ExecuteReader
            dr.Close()
            oConnection.Close()

            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Sua experiência profissional foi excluida com sucesso.<br>"
            AVISOLABEL.CssClass = "msnOK"
            PanelCARGO_UPDATE.Visible = False

        Catch ex As Exception

            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Houve um erro ao tentar excluir seus dados, tente mais tarde.<br>" & Err.Description
            AVISOLABEL.CssClass = "msn"
            ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"

        End Try

    End Sub

    Protected Sub CheckBoxATUAL_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxATUAL.CheckedChanged
        If CheckBoxATUAL.Checked Then
            DATAFIM_TR.Visible = False
        Else
            DATAFIM_TR.Visible = True
        End If
    End Sub
End Class
