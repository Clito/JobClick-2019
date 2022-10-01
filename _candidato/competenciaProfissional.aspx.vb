Imports ReplaceForm
Imports System.IO
Imports System.Text
Imports System.Xml
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports criptografia

Partial Class _candidato_competenciaProfissional
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        PanelAviso.Visible = False
        If IsPostBack Then
            msn.Text = ""
        End If
    End Sub

    Protected Sub ImageButtonNew_Load(sender As Object, e As System.EventArgs)
        FormViewCompetencia.ChangeMode(FormViewMode.Insert)
    End Sub

    Protected Sub FormViewCompetencia_DataBound(sender As Object, e As System.EventArgs) Handles FormViewCompetencia.DataBound
        Dim myReplaceForm As New ReplaceForm
        CType(FormViewCompetencia.FindControl("apresentacaoTextBox"), TextBox).Text = myReplaceForm.ReplaceIn(CType(FormViewCompetencia.FindControl("apresentacaoTextBox"), TextBox).Text)
        CType(FormViewCompetencia.FindControl("resumogeralTextBox"), TextBox).Text = myReplaceForm.ReplaceIn(CType(FormViewCompetencia.FindControl("resumogeralTextBox"), TextBox).Text)
    End Sub

    Protected Sub SqlCartaApresentacao_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlCartaApresentacao.Updating
        Dim myReplaceForm As New ReplaceForm
        e.Command.Parameters("@idcurriculo").Value = Session("idcurriculo")
        e.Command.Parameters("@apresentacao").Value = myReplaceForm.ReplaceIn(CType(FormViewCompetencia.FindControl("apresentacaoTextBox"), TextBox).Text)
        e.Command.Parameters("@resumogeral").Value = myReplaceForm.ReplaceIn(CType(FormViewCompetencia.FindControl("resumogeralTextBox"), TextBox).Text)
    End Sub

    Protected Sub SqlCartaApresentacao_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlCartaApresentacao.Inserting
        Dim myReplaceForm As New ReplaceForm
        e.Command.Parameters("@idcurriculo").Value = Session("idcurriculo")
        e.Command.Parameters("@apresentacao").Value = myReplaceForm.ReplaceIn(CType(FormViewCompetencia.FindControl("apresentacaoTextBox"), TextBox).Text)
        e.Command.Parameters("@resumogeral").Value = myReplaceForm.ReplaceIn(CType(FormViewCompetencia.FindControl("resumogeralTextBox"), TextBox).Text)
    End Sub

    Protected Sub SqlCartaApresentacao_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlCartaApresentacao.Updated
        msn.Text = "Seus dados foram salvos com sucesso!"
        msn.CssClass = "msnOK"
    End Sub

    Protected Sub GridViewObjetivo_SelectedIndexChanged(sender As Object, e As System.EventArgs)
        Try
            idObjetivoProfissionalLabel.Text = CType(FormViewObjetivoProfissional.FindControl("GridViewObjetivo"), GridView).SelectedDataKey("idObjetivoProfissional")
        Catch ex As Exception

        End Try
        CType(FormViewObjetivoProfissional.FindControl("GridViewObjetivo"), GridView).DataBind()
    End Sub

    Protected Sub GridViewObjetivo_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim ImageButtonSelectRES As WebControls.ImageButton = e.Row.FindControl("ImageButtonSelect")
            Dim myLabel As Label = e.Row.FindControl("idObjetivoProfissionalLabel")
            If myLabel.Text = idObjetivoProfissionalLabel.Text Then
                ImageButtonSelectRES.ImageUrl = "~/images/candidato/RADIOBUTTON_ON.png"
                e.Row.ControlStyle.BackColor = Drawing.Color.LightGray
            Else
                ImageButtonSelectRES.ImageUrl = "~/images/candidato/RADIOBUTTON_OFF.png"
            End If

            e.Row.Cells(0).Visible = False

        End If
    End Sub

    Protected Sub SqlObjetivoCandidato_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlObjetivoCandidato.Inserting
        If idObjetivoProfissionalLabel.Text <> "" Then
            e.Command.Parameters("@idcurriculo").Value = Session("idCurriculo")
            e.Command.Parameters("@idObjetivoProfissional").Value = idObjetivoProfissionalLabel.Text
        Else
            e.Cancel = True
            msn.Text = "<br>ATENÇÃO:<br>Informe seu objetivo profissional.<br>"
            msn.CssClass = "msn"
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Informe seu objetivo profissional.<br>"
            ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"
            AVISOLABEL.CssClass = "msn"
        End If
    End Sub

    Protected Sub SqlObjetivoCandidato_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlObjetivoCandidato.Updating
        e.Command.Parameters("@idcurriculo").Value = Session("idCurriculo")
        e.Command.Parameters("@idObjetivoProfissional").Value = idObjetivoProfissionalLabel.Text
    End Sub

    Protected Sub SqlObjetivoCandidato_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlObjetivoCandidato.Updated
        msn.Text = "<br>AVISO:<br>Seu objetivo profissional foi salvo com sucesso.<br>"
        msn.CssClass = "msnOK"
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Seu objetivo profissional foi salvo com sucesso.<br>"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        AVISOLABEL.CssClass = "msnOK"
        AtualizaObjetivo()
    End Sub

    Protected Sub SqlObjetivoCandidato_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlObjetivoCandidato.Inserted
        msn.Text = "<br>AVISO:<br>Seu objetivo profissional foi salvo com sucesso.<br>"
        msn.CssClass = "msnOK"
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Seu objetivo profissional foi salvo com sucesso.<br>"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        AVISOLABEL.CssClass = "msnOK"
        AtualizaObjetivo()
    End Sub


    Protected Sub FormViewObjetivoProfissional_DataBound(sender As Object, e As System.EventArgs) Handles FormViewObjetivoProfissional.DataBound
        Try
            idObjetivoProfissionalLabel.Text = CType(FormViewObjetivoProfissional.FindControl("idObjetivoProfissionalLabel"), Label).Text
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewRealizacao_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim ImageButtonSelectRealizacao As WebControls.ImageButton = e.Row.FindControl("ImageButtonSelectRealizacao")
            Dim myLabel As Label = e.Row.FindControl("idRealizacaoProfissionalLabel")
            If myLabel.Text = idRealizacaoProfissionalLabel.Text Then
                ImageButtonSelectRealizacao.ImageUrl = "~/images/candidato/RADIOBUTTON_ON.png"
                e.Row.ControlStyle.BackColor = Drawing.Color.LightGray
            Else
                ImageButtonSelectRealizacao.ImageUrl = "~/images/candidato/RADIOBUTTON_OFF.png"
            End If

            e.Row.Cells(0).Visible = False
        End If
    End Sub

    Protected Sub FormViewRealizacao_DataBound(sender As Object, e As System.EventArgs) Handles FormViewRealizacao.DataBound
        Try
            idRealizacaoProfissionalLabel.Text = CType(FormViewRealizacao.FindControl("idRealizacaoProfissionalLabel"), Label).Text
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridViewRealizacao_SelectedIndexChanged(sender As Object, e As System.EventArgs)
        Try
            idRealizacaoProfissionalLabel.Text = CType(FormViewRealizacao.FindControl("GridViewRealizacao"), GridView).SelectedDataKey("idRealizacaoProfissional")
        Catch ex As Exception

        End Try
        CType(FormViewRealizacao.FindControl("GridViewRealizacao"), GridView).DataBind()
    End Sub

    Protected Sub SqlRealizacaoCandidato_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlRealizacaoCandidato.Updating
        e.Command.Parameters("@idcurriculo").Value = Session("idCurriculo")
        e.Command.Parameters("@idRealizacaoProfissional").Value = idRealizacaoProfissionalLabel.Text
    End Sub

    Protected Sub SqlRealizacaoCandidato_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlRealizacaoCandidato.Inserting
        If idRealizacaoProfissionalLabel.Text <> "" Then
            e.Command.Parameters("@idcurriculo").Value = Session("idCurriculo")
            e.Command.Parameters("@idRealizacaoProfissional").Value = idRealizacaoProfissionalLabel.Text
        Else
            e.Cancel = True
            msn.Text = "<br>ATENÇÃO:<br>Informe sua realização profissional.<br>"
            msn.CssClass = "msn"
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Informe sua realização profissional.<br>"
            ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
            AVISOLABEL.CssClass = "msn"
        End If
    End Sub

    Protected Sub SqlRealizacaoCandidato_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlRealizacaoCandidato.Inserted
        msn.Text = "<br>AVISO:<br>Sua realização profissional foi salva com sucesso.<br>"
        msn.CssClass = "msnOK"
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Sua realização profissional foi salva com sucesso.<br>"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        AVISOLABEL.CssClass = "msnOK"
        AtualizaRealizacao()
    End Sub

    Protected Sub SqlRealizacaoCandidato_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlRealizacaoCandidato.Updated
        msn.Text = "<br>AVISO:<br>Sua realização profissional foi salva com sucesso.<br>"
        msn.CssClass = "msnOK"
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Sua realização profissional foi salva com sucesso.<br>"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        AVISOLABEL.CssClass = "msnOK"
        AtualizaRealizacao()
    End Sub

    Sub AtualizaObjetivo()

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        Dim idpublica As Int32 = 0

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_ATUALIZA_OBJETIVO_CANDIDATO]", cn)
        cmd.CommandType = CommandType.StoredProcedure


        prm = New SqlParameter("@idCurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCurriculo").Value = Session("idCurriculo")

        prm = New SqlParameter("@idObjetivoProfissional", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idObjetivoProfissional").Value = idObjetivoProfissionalLabel.Text

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Close()
            cn.Close()
        Catch ex As Exception
            msn.Text = "Erro ao gravar o registro no banco de dados"
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Erro ao gravar o registro no banco de dados.<br>"
            ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"
            AVISOLABEL.CssClass = "msn"
        End Try

    End Sub

    Sub AtualizaRealizacao()

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        Dim idpublica As Int32 = 0

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_ATUALIZA_REALICACAOPROFISSIONAL_CANDIDATO]", cn)
        cmd.CommandType = CommandType.StoredProcedure


        prm = New SqlParameter("@idCurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCurriculo").Value = Session("idCurriculo")

        prm = New SqlParameter("@idRealizacaoProfissional", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRealizacaoProfissional").Value = idRealizacaoProfissionalLabel.Text

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Close()
            cn.Close()
        Catch ex As Exception
            msn.Text = "Erro ao gravar o registro no banco de dados."
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Erro ao gravar o registro no banco de dados.<br>"
            ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"
            AVISOLABEL.CssClass = "msn"
        End Try

    End Sub

    Protected Sub GridViewHabilidade_SelectedIndexChanged(sender As Object, e As System.EventArgs)
        Try
            If idHabilidadeCompetenciaLabel0.Text = "" Then
                idHabilidadeCompetenciaLabel0.Text = CType(FormViewHabilidade.FindControl("GridViewHabilidade"), GridView).SelectedDataKey("idHabilidadeCompetencia")
                Session("HabilidadeCompetenciaLabel0") = idHabilidadeCompetenciaLabel0.Text
            Else
                idHabilidadeCompetenciaLabel1.Text = CType(FormViewHabilidade.FindControl("GridViewHabilidade"), GridView).SelectedDataKey("idHabilidadeCompetencia")
                Session("HabilidadeCompetenciaLabel1") = idHabilidadeCompetenciaLabel1.Text
            End If

            REM VERIFICA SE É PARA LIMPAR
            If idHabilidadeCompetenciaLabel0.Text = idHabilidadeCompetenciaLabel1.Text Then
                idHabilidadeCompetenciaLabel0.Text = ""
                idHabilidadeCompetenciaLabel1.Text = ""
                Session("HabilidadeCompetenciaLabel0") = ""
                Session("HabilidadeCompetenciaLabel1") = ""
            End If
        Catch ex As Exception

        End Try
        CType(FormViewHabilidade.FindControl("GridViewHabilidade"), GridView).DataBind()
    End Sub

    Protected Sub GridViewHabilidade_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim ImageButtonSelectHabilidade0 As WebControls.ImageButton = e.Row.FindControl("ImageButtonHabilidade0")
            Dim ImageButtonSelectHabilidade1 As WebControls.ImageButton = e.Row.FindControl("ImageButtonHabilidade1")
            Dim ImageButtonSelectHabilidade2 As WebControls.ImageButton = e.Row.FindControl("ImageButtonHabilidade2")
            Dim ImageButtonSelectHabilidade3 As WebControls.ImageButton = e.Row.FindControl("ImageButtonHabilidade3")

            Dim myLabel0 As Label = e.Row.FindControl("idHabilidadeCompetenciaLabel")
            Dim myLabel1 As Label = e.Row.FindControl("idHabilidadeCompetenciaLabel")

            If myLabel0.Text = idHabilidadeCompetenciaLabel0.Text Then
                e.Row.ControlStyle.BackColor = Drawing.Color.LightGray
            Else
                ImageButtonSelectHabilidade0.Visible = True
            End If

            If myLabel1.Text = idHabilidadeCompetenciaLabel1.Text Then
                e.Row.ControlStyle.BackColor = Drawing.Color.LightGray
            Else
                ImageButtonSelectHabilidade0.Visible = True
            End If

            If myLabel0.Text <> idHabilidadeCompetenciaLabel0.Text Then
                ImageButtonSelectHabilidade1.Visible = False
                ImageButtonSelectHabilidade0.Visible = False
            Else
                ImageButtonSelectHabilidade3.Visible = True
            End If

            If myLabel1.Text <> idHabilidadeCompetenciaLabel1.Text Then
                ImageButtonSelectHabilidade1.Visible = False
                ImageButtonSelectHabilidade0.Visible = False
            Else
                ImageButtonSelectHabilidade2.Visible = True
            End If

            e.Row.Cells(0).Visible = False

        End If

    End Sub


    Protected Sub SqlHabilidadeCandidato_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlHabilidadeCandidato.Inserting
        If idHabilidadeCompetenciaLabel0.Text <> "" And idHabilidadeCompetenciaLabel1.Text <> "" Then
            e.Command.Parameters("@idcurriculo").Value = Session("idCurriculo")
            e.Command.Parameters("@idHabilidadeCompetencia1").Value = idHabilidadeCompetenciaLabel0.Text
            e.Command.Parameters("@idHabilidadeCompetencia2").Value = idHabilidadeCompetenciaLabel1.Text
        Else
            e.Cancel = True
            msn.Text = "<br>ATENÇÃO:<br>Informe suas habilidades & competências profissionais.<br>"
            msn.CssClass = "msn"
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Informe (2) duas das suas habilidades & competências profissionais.<br>"
            ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"
            AVISOLABEL.CssClass = "msn"
        End If
    End Sub

    Protected Sub FormViewHabilidade_DataBound(sender As Object, e As System.EventArgs) Handles FormViewHabilidade.DataBound
        Try
            idHabilidadeCompetenciaLabel1.Text = CType(FormViewHabilidade.FindControl("idHabilidadeCompetenciaFORM2"), Label).Text
            idHabilidadeCompetenciaLabel0.Text = CType(FormViewHabilidade.FindControl("idHabilidadeCompetenciaFORM1"), Label).Text
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub SqlHabilidadeCandidato_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlHabilidadeCandidato.Updating
        If idHabilidadeCompetenciaLabel0.Text <> "" And idHabilidadeCompetenciaLabel1.Text <> "" Then
            e.Command.Parameters("@idcurriculo").Value = Session("idCurriculo")
            e.Command.Parameters("@idHabilidadeCompetencia1").Value = idHabilidadeCompetenciaLabel0.Text
            e.Command.Parameters("@idHabilidadeCompetencia2").Value = idHabilidadeCompetenciaLabel1.Text
        Else
            e.Cancel = True
            msn.Text = "<br>ATENÇÃO:<br>Informe suas habilidades & competências profissionais.<br>"
            msn.CssClass = "msn"
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Informe (2) duas das suas habilidades & competências profissionais.<br>"
            ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"
            AVISOLABEL.CssClass = "msn"
        End If
    End Sub

    Sub AtualizaHabilidade()

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        Dim idpublica As Int32 = 0

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_ATUALIZA_HABILIDADECOMPETENCIA_CANDIDATO]", cn)
        cmd.CommandType = CommandType.StoredProcedure


        prm = New SqlParameter("@idCurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCurriculo").Value = Session("idCurriculo")

        prm = New SqlParameter("@idHabilidadeCompetencia1", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idHabilidadeCompetencia1").Value = idHabilidadeCompetenciaLabel0.Text

        prm = New SqlParameter("@idHabilidadeCompetencia2", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idHabilidadeCompetencia2").Value = idHabilidadeCompetenciaLabel1.Text
        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Close()
            cn.Close()
        Catch ex As Exception
            msn.Text = "Erro ao gravar o registro no banco de dados."
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Erro ao gravar o registro no banco de dados.<br>"
            AVISOLABEL.CssClass = "msn"
            ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"
        End Try

    End Sub

    Protected Sub SqlHabilidadeCandidato_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlHabilidadeCandidato.Updated
        msn.Text = "<br>AVISO:<br>Suas habilidades e competências profissionais foram salvas com sucesso.<br>"
        msn.CssClass = "msnOK"
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Suas habilidades e competências profissionais foram salvas com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        AtualizaHabilidade()
    End Sub

    Protected Sub SqlHabilidadeCandidato_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlHabilidadeCandidato.Inserted
        msn.Text = "<br>AVISO:<br>Suas habilidades e competências profissionais foram salvas com sucesso.<br>"
        msn.CssClass = "msnOK"
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Suas habilidades e competências profissionais foram salvas com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        AtualizaHabilidade()
    End Sub

End Class
