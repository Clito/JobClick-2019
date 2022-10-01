Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Web.Security
Imports System.Web.HttpCookie
Imports System.DBNull

Partial Class _empresa_Default
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        REM ** *******************************************************************************************************
        REM ** VERIFICA SE EXISTE CRÉDITOS
        REM ** *******************************************************************************************************
        Dim CREDITO As Int32 = Session("liberaQtdCad")

        If Request.QueryString("C") = "0" Then
            PanelAvisoCredito.Visible = True
        Else
            PanelAvisoCredito.Visible = False
        End If

        SetupLabel.Text = Session("idSetup")
        idCadastroEmpresaLabel.Text = Session("idCadastroEmpresa")

        If Request.QueryString("autoTit") <> "" Then
            LabelCabec.Text = Request.QueryString("autoTit")
        Else
            LabelCabec.Text = "Página Principal"
        End If

        lblStatus.Text = ""
        idRH_gestorLabel.Text = "Session Gestor: " & Session("idRH_Gestor")

        Dim idCadastroEmpresaFilha As String = Session("nomeEmpresaFilha")

        If idCadastroEmpresaFilha = "" Then

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim HtmlBanner As String = ""
            Dim HtmlLateral As String = ""

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("_USP_EMPRESA_CLIENTE_HOMEPAGE", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

            cn.Open()

            Try
                Dim dr As SqlDataReader = cmd.ExecuteReader
                dr.Read()
                Session("idCadastroEmpresaFilha") = dr("idCadastroEmpresa")
                dr.Close()
            Catch ex As Exception

            End Try

            cn.Close()

        End If

    End Sub

    Protected Sub RadioButtonListEmpresaFilha_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles RadioButtonListEmpresaFilha.SelectedIndexChanged
        Session("idCadastroEmpresaFilha") = RadioButtonListEmpresaFilha.SelectedValue
        Response.Redirect("_runProcessoSeletivo.aspx?autoTit=Pesquisa%20de%20Candidatos")
    End Sub

    Protected Sub RadioButtonListEmpresaFilha_DataBound(sender As Object, e As System.EventArgs) Handles RadioButtonListEmpresaFilha.DataBound

        Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")
        If idCadastroEmpresaFilha = "" Then
            msnLabel.CssClass = "msn"
            msnLabel.Text = "Informe uma empresa antes de iniciar os trabalhos"
        Else
            msnLabel.CssClass = "msnOK"
            msnLabel.Text = ""
            RadioButtonListEmpresaFilha.SelectedValue = idCadastroEmpresaFilha
        End If

    End Sub

    Protected Sub DataListEmpresaFilha_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListEmpresaFilha.ItemDataBound

        If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
            Dim mynomeEmpresa As Label = CType(e.Item.FindControl("nmempresaLabel"), Label)
            Session("nomeEmpresaFilha") = "<b>Você está trabalhando com a empresa:</b> " & mynomeEmpresa.Text
        Else
            Session("nomeEmpresaFilha") = "Escolha uma empresa para trabalhar"
        End If

    End Sub

    Protected Sub ImageButtonAgenda_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAgenda.Click
        Response.Redirect("_agendaCandidato.aspx?autoTit=Agenda do Consultor com o Candidato")
    End Sub

    Protected Sub GridViewAtr_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewAtr.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim flgAprovado As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "CORTEXTO"))
            Select Case flgAprovado
                Case "#e30000"
                    e.Row.BackColor = Drawing.Color.Yellow ' NÃO ESTÁ PUBLICADO.
                Case "#277b19"
                    e.Row.BackColor = Drawing.Color.YellowGreen ' PUBLICADO SEM OCORRENCIA
                Case "#f0c604"
                    e.Row.BackColor = Drawing.Color.Red  ' PRECISA CADASTRAR A VAGA.
                Case Else
                    e.Row.BackColor = Drawing.Color.White ' NORMAL

            End Select
        End If
    End Sub

    Protected Sub ImageButtonClose_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonClose.Click
        PanelAvisoCredito.Visible = False
    End Sub

End Class
