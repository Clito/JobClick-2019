Imports System.Web
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _candidato_formacaoAcademica
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        PanelAviso.Visible = False
    End Sub

    Protected Sub LinkButtonProximo_Click(sender As Object, e As System.EventArgs) Handles LinkButtonProximo.Click
        REM ** ********************************************************************************************************
        REM ** LÓGICA PARA PEGAR O ID DA ENTIDADE EDUCACIONAL
        REM ** ********************************************************************************************************

        Dim tamanhoString As Int32 = Len(InstituicaoTextBox.Text)
        Dim posicaoInicial As Int32 = InStr(1, InstituicaoTextBox.Text, "[", 1)
        If posicaoInicial > 0 Then
            Dim pesquisa As Int32 = tamanhoString - posicaoInicial
            idInstituicaoLabel.Text = Replace(Right(InstituicaoTextBox.Text, pesquisa), "]", "")
        Else
            idInstituicaoLabel.Text = "0"
            PanelCidade.Visible = True
        End If
        PanelFORMULARIO_INC.Visible = True
        LinkButtonProximo.Visible = False
        LinkButtonMP1.Visible = False
    End Sub

    Protected Sub LinkButtonINCLUIR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonINCLUIR.Click
        PanelPRINCIPAL.Visible = False
        DataListESCOLA.Visible = False
        PanelIncluir.Visible = True
    End Sub

    Protected Sub LinkButtonINCCANCELAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonINCCANCELAR.Click
        Response.Redirect("~/_candidato/formacaoAcademica.aspx")
    End Sub

    Protected Sub LinkButtonSalvar_Click(sender As Object, e As System.EventArgs) Handles LinkButtonSalvar.Click

        Dim ERROGeral As Boolean = False


        ufLabel.Text = Right(CidadeTextBox.Text, 2)
        Dim posicaoInicial As Int32 = InStr(1, CidadeTextBox.Text, "-", 1)

        If cidadeLabel.Text <> "" Then
            cidadeLabel.Text = Left(CidadeTextBox.Text, posicaoInicial - 2)
        End If

        If Not IsDate(data_iniTextBox.Text) Then
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Informe uma data válida para o início do curso.<br>"
            AVISOLABEL.CssClass = "msn"
            ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"
            ERROGeral = True
        End If

        If Not IsDate(data_fimTextBox.Text) Then
            PanelAviso.Visible = True
            AVISOLABEL.Text = AVISOLABEL.Text & "• Informe uma data válida para o término do curso.<br>"
            AVISOLABEL.CssClass = "msn"
            ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"
            ERROGeral = True
        End If

        If Not ERROGeral Then


            Dim oReader As SqlDataReader = Nothing
            Dim oConnection As SqlConnection

            oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
            Dim oCommand As SqlCommand

            Dim prm As SqlParameter

            oCommand = New SqlCommand("_USP_FORMACAO_ACADEMICA_INSERT_AUTOPREENCHIMENTO", oConnection)
            oCommand.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idcurriculo", SqlDbType.Int, 8)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@idcurriculo").Value = Session("idcurriculo")

            prm = New SqlParameter("@idTipoFormacao", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@idTipoFormacao").Value = DropDownListTipoFormacao.SelectedItem.Value

            prm = New SqlParameter("@idInstituicao", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@idInstituicao").Value = idInstituicaoLabel.Text

            prm = New SqlParameter("@identidadeTipo", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)

            If DropDownListCURSO.SelectedItem.Value <> "" Then
                oCommand.Parameters("@identidadeTipo").Value = DropDownListCURSO.SelectedItem.Value
            Else
                oCommand.Parameters("@identidadeTipo").Value = 0
            End If

            prm = New SqlParameter("@dsinstituicao", SqlDbType.VarChar, 2000)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@dsinstituicao").Value = InstituicaoTextBox.Text

            prm = New SqlParameter("@cidade", SqlDbType.VarChar, 255)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)

            If CidadeTextBox.Text <> "" Then
                oCommand.Parameters("@cidade").Value = cidadeLabel.Text
            Else
                oCommand.Parameters("@cidade").Value = DBNull.Value
            End If

            prm = New SqlParameter("@dsCurso", SqlDbType.VarChar, 2000)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@dsCurso").Value = dsCursoTextBox.Text

            prm = New SqlParameter("@obs", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@obs").Value = obsTextBox.Text

            prm = New SqlParameter("@data_ini", SqlDbType.DateTime)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@data_ini").Value = data_iniTextBox.Text

            prm = New SqlParameter("@data_fim", SqlDbType.DateTime)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)
            oCommand.Parameters("@data_fim").Value = data_fimTextBox.Text

            prm = New SqlParameter("@uf", SqlDbType.Char, 2)
            prm.Direction = ParameterDirection.Input
            oCommand.Parameters.Add(prm)

            If ufLabel.Text <> "" Then
                oCommand.Parameters("@uf").Value = ufLabel.Text
            Else
                oCommand.Parameters("@uf").Value = DBNull.Value
            End If


            Try
                oConnection.Open()
                Dim dr As SqlDataReader = oCommand.ExecuteReader
                dr.Close()
                oConnection.Close()

                PanelAviso.Visible = True
                AVISOLABEL.Text = AVISOLABEL.Text & "• Sua formação acadêmica foi salva com sucesso.<br>"
                AVISOLABEL.CssClass = "msnOK"

            Catch ex As Exception

                PanelAviso.Visible = True
                AVISOLABEL.Text = AVISOLABEL.Text & "• Houve um erro ao tentar gravar seus dados, tente mais tarde.<br>" & Err.Description
                AVISOLABEL.CssClass = "msn"
                ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"

            End Try

        End If

    End Sub

    Protected Sub ImageAVISO_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
        PanelAviso.Visible = False
        AVISOLABEL.Text = ""
        Response.Redirect("~/_candidato/formacaoAcademica.aspx")
    End Sub

    Protected Sub DataListESCOLA_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DataListESCOLA.SelectedIndexChanged
        idFormacaoLabel.Text = DataListESCOLA.SelectedValue
        PanelPRINCIPAL.Visible = False
    End Sub

    Protected Sub UpdateCancelButton_Click(sender As Object, e As System.EventArgs)
        Response.Redirect("~/_candidato/formacaoAcademica.aspx")
    End Sub


    Protected Sub SqlFormacaoFORM_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlFormacaoFORM.Updating

        Try

        Catch ex As Exception
            PanelAviso.Visible = True
            AVISOLABEL.Text = AVISOLABEL.Text & "• Houve um erro ao tentar gravar seus dados, tente mais tarde.<br>" & Err.Description
            AVISOLABEL.CssClass = "msn"
            ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"
            e.Cancel = True
        End Try

    End Sub

    Protected Sub SqlFormacaoFORM_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlFormacaoFORM.Updated
        PanelAviso.Visible = True
        AVISOLABEL.Text = AVISOLABEL.Text & "• Sua formação acadêmica foi salva com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
    End Sub

    Protected Sub SqlFormacaoFORM_Deleted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlFormacaoFORM.Deleted
        DataListESCOLA.DataBind()
        PanelAviso.Visible = True
        AVISOLABEL.Text = AVISOLABEL.Text & "• Sua formação acadêmica foi excluída com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
    End Sub

End Class
