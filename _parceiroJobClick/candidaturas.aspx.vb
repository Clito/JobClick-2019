Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _parceiroJobClick_candidaturas
    Inherits System.Web.UI.Page

    Protected Sub GridViewCANDIDATURA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewCANDIDATURA.SelectedIndexChanged

        idCurriculoLabel.Text = GridViewCANDIDATURA.SelectedDataKey("idCurriculo")
        idCadastroEmpresaLabel.Text = Session("idCadastroEmpresa")

        If GridViewCANDIDATURA.SelectedDataKey("CONTATO") <> Session("idCadastroEmpresa") Then
            CONTATOLabel.Text = "0"
        Else
            CONTATOLabel.Text = GridViewCANDIDATURA.SelectedDataKey("CONTATO")
        End If

        PanelCVCandidato.Visible = True

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        PanelAviso.Visible = False
        PanelCVCandidato.Visible = False
        Dim CreditoRes As New Credito
        CreditoLabel.Text = CreditoRes.RestaCreditoAD(Session("idSetup"), Session("idCadastroEmpresa"), Session("idUser"))
    End Sub

    Protected Sub LinkButtonEntrarEmContato_Click(sender As Object, e As EventArgs)
        REM ** **************************************************************************
        REM ** COMPRA CV
        REM ** **************************************************************************
        Dim Saldo As Int32 = FormatNumber(CreditoLabel.Text)

        If Saldo < 2 Then
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Você não tem saldo suficiente para incluir este candidato na sua lista de contatos."
            ImageAviso.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
            LinkButtonCOMPRACREDITO.Visible = True
        Else
            COMPRACV()
        End If
    End Sub

    Protected Sub FILTRO(sender As Object, e As GridViewCommandEventArgs) Handles GridViewCANDIDATURA.RowCommand
        If e.CommandArgument <> "" Then
            LabelCabec.Text = "Candidaturas para a vaga <b>" & e.CommandArgument & "</b>"
            CommandArgumentLabel.Text = e.CommandName.ToString
            PanelFILTRO.Visible = True
        End If
    End Sub

    Protected Sub LinkButtonLIMPAFILTRO_Click(sender As Object, e As EventArgs) Handles LinkButtonLIMPAFILTRO.Click
        CommandArgumentLabel.Text = "0"
        LabelCabec.Text = "Candidaturas feitas pelo site Jobclick"
        PanelFILTRO.Visible = False
    End Sub

    Sub COMPRACV()

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter


        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_AD_COMPRA_CV", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

        prm = New SqlParameter("@idcurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idcurriculo").Value = idCurriculoLabel.Text

        prm = New SqlParameter("@idUsuario", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idUsuario").Value = Session("idUser")

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idsetup")

        prm = New SqlParameter("@saldo", SqlDbType.Decimal, 9, 2)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@saldo").Value = CreditoLabel.Text

        cn.Open()

        Try

            Dim dr As SqlDataReader = cmd.ExecuteReader

            If dr.HasRows Then
                dr.Read()
                AVISOLABEL.Text = "Curriculo registrado com sucesso!"
                ImageAviso.ImageUrl = "~/_parceiroJobClick/images/ok.jpg"
                PanelAviso.Visible = True
                If dr("SALDO") < 2 Then
                    LinkButtonCOMPRACREDITO.Visible = True
                Else
                    LinkButtonCOMPRACREDITO.Visible = False
                End If
            Else
                AVISOLABEL.Text = "Falha ao regitrar o Curriculo! (Nivel 1)"
                ImageAviso.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
                PanelAviso.Visible = True
            End If

            dr.Close()

        Catch ex As Exception
            AVISOLABEL.Text = "Falha ao regitrar o Curriculo! (Nivel 2)"
            ImageAviso.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
            PanelAviso.Visible = True
        End Try

        cn.Close()

        GridViewCANDIDATURA.DataBind()

    End Sub

    Protected Sub LinkButtonCOMPRACREDITO_Click(sender As Object, e As EventArgs) Handles LinkButtonCOMPRACREDITO.Click
        Response.Redirect("comprar.aspx")
    End Sub

    Protected Sub GridViewCANDIDATURA_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridViewCANDIDATURA.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim idCadastroEmpresaString As String = Session("idCadastroEmpresa")
            Dim flgidCandidatoContato As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "CONTATO"))

            Dim myImageButtonSelect As New ImageButton
            myImageButtonSelect = e.Row.FindControl("ImageButtonContato")

            If flgidCandidatoContato = idCadastroEmpresaString Then
                myImageButtonSelect.Visible = True
                myImageButtonSelect.ToolTip = "Este profissional está com seus dados para contato liberado!"
            Else
                myImageButtonSelect.Visible = False
            End If

        End If

    End Sub
End Class
