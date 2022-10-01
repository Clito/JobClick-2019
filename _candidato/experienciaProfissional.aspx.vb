Imports System.Web
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _candidato_experienciaProfissional
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        PanelAviso.Visible = False
        PanelAvisoErr.Visible = False

        If Not Page.IsPostBack Then
            dsexperienciaTextBox.Attributes.Add("onkeypress", "limitarTexto(this, contador, 5000);")
            dsexperienciaTextBox.Attributes.Add("onkeyup", "limitarTexto(this, contador, 5000);")
        End If

    End Sub

    Protected Sub LinkButtonSalvar_Click(sender As Object, e As System.EventArgs) Handles LinkButtonSalvar.Click

        Dim ATUAL As Int32

        REM ** ********************************************************************************************************
        REM ** LÓGICA PARA PEGAR O ID DO CARGO
        REM ** ********************************************************************************************************

        Dim tamanhoString As Int32 = Len(cargoTextBox.Text)
        Dim posicaoInicial As Int32 = InStr(1, cargoTextBox.Text, " ", 1)

        idfuncaoLabel.Text = Left(cargoTextBox.Text, posicaoInicial)

        If IsNumeric(Trim(idfuncaoLabel.Text)) Then
            If posicaoInicial > 0 Then
                idfuncaoLabel.Text = Left(cargoTextBox.Text, posicaoInicial)
            Else
                idfuncaoLabel.Text = "000000"
            End If
        Else
            idfuncaoLabel.Text = "000000"
        End If


        REM ** ********************************************************************************************************
        REM ** LÓGICA PARA VERIFICAR A DATA
        REM ** ********************************************************************************************************

        Dim dataINI As String = "1" & "/" & mesITextBox.Text & "/" & anoITextBox.Text
        Dim dataFIM As String = "1" & "/" & mesFTextBox.Text & "/" & anoFTextBox.Text
        Dim ERROGeral As Boolean = False

        If Not IsDate(dataINI) Then
            PanelAvisoErr.Visible = True
            AVISOLABELErr.Text = "• Informe uma data válida do início do contrato.<br>"
            AVISOLABELErr.CssClass = "msn"
            ImageAVISOErr.ImageUrl = "~/_candidato/images/buttonNOK.png"
            ERROGeral = True
        End If

        REM ** VERIFICA SE É A ATUAL
        If CheckBoxATUAL.Checked Then
            ATUAL = 1
        Else
            If Not IsDate(dataFIM) Then
                ATUAL = 0
                PanelAvisoErr.Visible = True
                AVISOLABELErr.Text = AVISOLABEL.Text & "• Informe uma data válida do afastamento.<br>"
                AVISOLABELErr.CssClass = "msn"
                ImageAVISOErr.ImageUrl = "~/_candidato/images/buttonNOK.png"
                ERROGeral = True
            End If
        End If


        If idfuncaoLabel.Text = "0" Then
            PanelPESQUISA.Visible = True
            PanelAvisoErr.Visible = True
            AVISOLABELErr.Text = AVISOLABEL.Text & "• Informe o cargo que está em sua carteira profissional.<br>"
            AVISOLABELErr.CssClass = "msn"
            ImageAVISOErr.ImageUrl = "~/_candidato/images/buttonNOK.png"
            ERROGeral = True
        End If

        If Not ERROGeral Then
            REM ** ********************************************************************************************************
            REM ** GRAVA A EXPERIÊNCIA PROFISSIONAL
            REM ** ********************************************************************************************************

            Dim oReader As SqlDataReader = Nothing
            Dim oConnection As SqlConnection

            oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
            Dim oCommand As SqlCommand

            Dim prm As SqlParameter

            oCommand = New SqlCommand("_USP_EXPERIENCIA_PROFISSIONAL_INSERT_AUTOPREENCHIMENTO", oConnection)
            oCommand.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idcurriculo", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@idcurriculo").Value = Session("idcurriculo")

            prm = New SqlParameter("@idfuncao", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@idfuncao").Value = 0

            prm = New SqlParameter("@idCBOOcupacao", SqlDbType.VarChar, 6)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@idCBOOcupacao").Value = idfuncaoLabel.Text

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

            prm = New SqlParameter("@funcao", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@funcao").Value = Trim(Replace(cargoTextBox.Text, idfuncaoLabel.Text, ""))

            prm = New SqlParameter("@nomeempresa", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@nomeempresa").Value = nomeempresaTextBox.Text

            prm = New SqlParameter("@dsexperiencia", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@dsexperiencia").Value = dsexperienciaTextBox.Text

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
                AVISOLABEL.Text = "• Erro ao tentar gravar seus dados.<br>" & Err.Description
                AVISOLABEL.CssClass = "msn"
                ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"

            End Try

        End If


    End Sub

    Protected Sub FecharPSQ_Click(sender As Object, e As System.EventArgs) Handles FecharPSQ.Click
        PanelPESQUISA.Visible = False
    End Sub

    Protected Sub GridViewCARGO_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewCARGO.SelectedIndexChanged
        idfuncaoLabel.Text = GridViewCARGO.SelectedDataKey("idCBOOcupacao")
        cargoTextBox.Text = GridViewCARGO.SelectedDataKey("dsCBOSinonimo") & " [" & GridViewCARGO.SelectedDataKey("idCBOOcupacao") & "]"
        PanelAvisoErr.Visible = True
        AVISOLABELErr.Text = "• Cargo selecionado:<br>[" & GridViewCARGO.SelectedDataKey("dsCBOSinonimo") & " - " & GridViewCARGO.SelectedDataKey("idCBOOcupacao") & "].<br>"
        AVISOLABELErr.CssClass = "msnOK"
        ImageAVISOErr.ImageUrl = "~/_candidato/images/buttonOK.png"
    End Sub

    Protected Sub CheckBoxATUAL_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBoxATUAL.CheckedChanged
        If CheckBoxATUAL.Checked Then
            DATAFIM_TR.Visible = False
        Else
            DATAFIM_TR.Visible = True
        End If
    End Sub
End Class
