Imports user
Imports criptografia
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports myValidaCNPJ
Imports email
Imports BodyEmail
Imports ReplaceForm


Partial Class _anonimo_aprPerfilVaga
    Inherits System.Web.UI.Page

    Dim myReplace As New ReplaceForm

    Dim statusEnvio As Boolean = True

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Dim status As String = Request.QueryString("perfil_vaga_aprovado")
        statusLabel.Text = status

        ProtocoloLabel.Text = Request.QueryString("Protocolo")
        GETInfoLPV(ProtocoloLabel.Text, status)

        If (Not IsPostBack) Then
            ViewState("RefUrl") = Request.UrlReferrer.ToString()
        End If

    End Sub

    REM *** *************************************************************************************************************
    REM *** DADOS DO LEVANTAMENTO DO PERFIL DA VAGA
    REM ***

    Sub GETInfoLPV(Protocolo As String, status As String)


        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_APROVACAO_LEVANTAMENTOPERFILVAGA", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@Protocolo", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@Protocolo").Value = ProtocoloLabel.Text


        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader
        dr.Read()


        idCadastroEmpresaFilhaLabel.Text = dr("idCadastroEmpresaFilha")
        idPerfilVagaLabel.Text = dr("idPerfilVaga")
        idCadastroEmpresaLabel.Text = dr("idCadastroEmpresa")
        statusLabel.Text = dr("perfil_vaga_aprovado")
        emailGestorLabel.Text = dr("email")

        dr.Close()
        cn.Close()




        If Not IsPostBack Then
            Try
                If status <> "" Then
                    Select Case statusLabel.Text
                        Case "1" ' Aprovado
                            RadioButtonListAprovado.SelectedValue = "1"
                            RadioButtonListAprovado.Enabled = True
                            FormGestor.Visible = True
                        Case "2" ' Em Análise 
                            RadioButtonListAprovado.SelectedValue = "2"
                            RadioButtonListAprovado.Enabled = True
                            FormGestor.Visible = True
                        Case "0" ' Não Aprovado
                            RadioButtonListAprovado.SelectedValue = "0"
                            RadioButtonListAprovado.Enabled = True
                            FormGestor.Visible = True
                    End Select
                Else
                    FormGestor.Visible = False
                End If
            Catch ex As Exception

            End Try
        End If


    End Sub

    Protected Sub ButtonAprLevantamento_Click(sender As Object, e As System.EventArgs) Handles ButtonAprLevantamento.Click

        If statusEnvio Then

            statusEnvio = False

            Dim DataListResumoRES As New DataList
            DataListResumoRES = DataListResumo

            Dim DataListLevantamentoPVRES As New DataList
            DataListLevantamentoPVRES = CType(DataListLevantamentoPVRES.FindControl("DataListLevantamentoPV"), DataList)

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("spIncPerfilVagaCOMENTARIO_EMPRESA", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@Protocolo", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@Protocolo").Value = ProtocoloLabel.Text

            prm = New SqlParameter("@mensagem", SqlDbType.Text)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@mensagem").Value = "<b>Gestor: </b>" & myReplace.ReplaceIn(mensagemTextBox.Text)

            prm = New SqlParameter("@perfil_vaga_aprovado", SqlDbType.Char, 1)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@perfil_vaga_aprovado").Value = idLabel.Text

            prm = New SqlParameter("@perfil_vaga_aprovadoTxt", SqlDbType.VarChar, 50)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@perfil_vaga_aprovadoTxt").Value = txtAprovado.Text


            cn.Open()

            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Close()
            cn.Close()

        End If



        REM *** *********************************************************************************************
        REM *** ENVIA EMAIL AO GESTOR COM A URL CRYPTOGRAFADA

        Dim myEmail As New EmailSQL
        Dim myBody As New BodyEmail
        Dim Body As String = ""
        Dim sBody As String = ""
        Dim dbBody As String = ""
        Dim Status As Boolean = False

        Dim URL As String = Application("urlapp")


        Dim MODELO As String = "PerfilVaga"

        Body = Body & "<table border='0' width='100%'>" & Chr(10)
        Body = Body & "<tr>" & Chr(10)
        Body = Body & "<td><font face='Verdana' size='2'>Protocolo de referência: " & ProtocoloLabel.Text & "<br>" & "</font></td>" & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "<tr>" & Chr(10)
        Body = Body & "<td><font face='Verdana' size='2'>Mensagem: " & mensagemTextBox.Text & "</font></td>" & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "<tr>" & Chr(10)
        Body = Body & "<td><br><br>" & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "</table>" & Chr(10)

        dbBody = dbBody & myBody.GetBodySetup(MODELO, Application("idsetup")).ToString

        sBody = Replace(Replace(dbBody.ToString, "#", Body.ToString), "*", URL)

        Dim emailConsultor As String = emailGestorLabel.Text

        Status = myEmail.EnviamensagemSQL(sBody, emailConsultor, emailConsultor, "Resposta ao Levantamento do Perfil da Vaga " & ProtocoloLabel.Text)


        If Status Then
            ImageEmail.ImageUrl = "~/images/emailEnviado.png"
            MSNEmail.Text = "Mensagem enviada com sucesso!"
            PanelMensagemEnviada.Visible = True
            FormGestor.Visible = False
            PanelDocumento.Visible = False
        Else
            ImageEmail.ImageUrl = "~/images/emailNaoEnviado.png"
            MSNEmail.Text = "Mensagem não foi enviada avise o administrador!"
            MSNEmail.CssClass = "msn"
            PanelMensagemEnviada.Visible = True
            FormGestor.Visible = False
            PanelDocumento.Visible = False
        End If


        REM *** *********************************************************************************************

    End Sub

    Protected Sub RadioButtonListAprovado_DataBound(sender As Object, e As System.EventArgs) Handles RadioButtonListAprovado.DataBound
        RadioButtonListAprovado.SelectedItem.Text = CType(DataListResumo.FindControl("idstatusvagaLabel0"), Label).Text
    End Sub

    Protected Sub ImageButtonClose_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonClose.Click
        PanelMensagemEnviada.Visible = False
        FormGestor.Visible = False
        PanelDocumento.Visible = False
        Response.Redirect("_atualizaacompanhaLevantamento.aspx?autoTit=Acompanhamento%20dos%20Levantamento%20apresentados")
    End Sub

    Protected Sub RadioButtonListAprovado_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles RadioButtonListAprovado.SelectedIndexChanged
        txtAprovado.Text = RadioButtonListAprovado.SelectedItem.Text
        idLabel.Text = RadioButtonListAprovado.SelectedValue
    End Sub

    Protected Sub Back_Click(sender As Object, e As System.EventArgs) Handles Back.Click
        Response.Redirect("_atualizaacompanhaLevantamento.aspx?autoTit=Acompanhamento%20dos%20Levantamento%20apresentados")
    End Sub

    Protected Sub DataListResumo_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListResumo.ItemDataBound
        If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
            txtAprovado.Text = CType(e.Item.FindControl("idstatusvagaLabel0"), Label).Text
            idLabel.Text = CType(e.Item.FindControl("perfilVagaAprovadoLabel"), Label).Text
        End If
    End Sub

    Protected Sub Back0_Click(sender As Object, e As System.EventArgs) Handles Back0.Click
        Response.Redirect("_atualizaacompanhaLevantamento.aspx?autoTit=Acompanhamento%20dos%20Levantamento%20apresentados")
    End Sub
End Class
