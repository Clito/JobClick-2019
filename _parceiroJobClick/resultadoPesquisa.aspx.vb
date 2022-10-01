Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _parceiroJobClick_resultadoPesquisa
    Inherits System.Web.UI.Page

    Protected Sub GridViewCVs_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridViewCVs.RowDataBound

        If GridViewCVs.Rows.Count > 1 Then
            nroCVsRetornados.Text = "Sua pesquisa retornou " & GridViewCVs.Rows.Count & " Candidatos, com os seguintes critérios listados abaixo:"
            LinkButtonBACK_OUT.Visible = True
            LinkButtonBACK_OUT_TOP.Visible = True
        Else
            nroCVsRetornados.Text = "Sua pesquisa retornou apenas " & GridViewCVs.Rows.Count & " Candidato, com os seguintes critérios listados abaixo:"
            LinkButtonBACK_OUT.Visible = True
            LinkButtonBACK_OUT_TOP.Visible = True
        End If

        If GridViewCVs.Rows.Count = 0 Then
            nroCVsRetornados.Text = "Sua pesquisa não retornou resultados com os seguintes critérios listados abaixo:"
            LinkButtonBACK_OUT.Visible = False
            LinkButtonBACK_OUT_TOP.Visible = False
        End If

        Dim idCadastroEmpresaString As String = Session("idCadastroEmpresa")
        Dim flgidCandidatoContato As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "CONTATO"))


        If flgidCandidatoContato = idCadastroEmpresaString Then
            e.Row.Font.Bold = True
            e.Row.BackColor = System.Drawing.Color.FromName("#77bc84")
        Else
            e.Row.BackColor = System.Drawing.Color.FromName("#ffffe3")
        End If


    End Sub

    Protected Sub GridViewCVs_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewCVs.SelectedIndexChanged
        idCurriculoLabel.Text = GridViewCVs.SelectedDataKey("idcurriculo")
        If GridViewCVs.SelectedDataKey("CONTATO") <> Session("idCadastroEmpresa") Then
            CONTATOLabel.Text = "0"
        Else
            CONTATOLabel.Text = GridViewCVs.SelectedDataKey("CONTATO")
        End If
        PanelCVCandidato.Visible = True
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        PanelCVCandidato.Visible = False
        PanelAviso.Visible = False
        Dim CreditoRes As New Credito
        CreditoLabel.Text = CreditoRes.RestaCreditoAD(Session("idSetup"), Session("idCadastroEmpresa"), Session("idUser"))
        GridViewCVs.DataBind()
    End Sub

    Protected Sub LinkButtonBACK_OUT_Click(sender As Object, e As EventArgs) Handles LinkButtonBACK_OUT.Click, LinkButtonBACK_OUT_TOP.Click
        Response.Redirect("~/_parceiroJobClick/pesquisaBase.aspx?idVaga=" & Request.QueryString("idVaga"))
    End Sub

    Protected Sub LinkButtonEntrarEmContato_Click(sender As Object, e As EventArgs)

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

        GridViewCVs.DataBind()

    End Sub

    Protected Sub LinkButtonCOMPRACREDITO_Click(sender As Object, e As EventArgs) Handles LinkButtonCOMPRACREDITO.Click
        Response.Redirect("comprar.aspx?TipoProduto=Compra de créditos")
    End Sub

End Class
