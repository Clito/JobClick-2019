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

        Dim status As String = ""
        FormGestor.Visible = True

        Try
            status = criptografia.Descriptografar(Request.QueryString("CammaleonstatusCryp"), "#!$a36?@")
        Catch ex As Exception
            statusLabel.Text = ""
        End Try

        idPerfilVagaLabel.Text = criptografia.Descriptografar(Request.QueryString("CammaleonPerfilCryp"), "#!$a36?@")
        idCadastroEmpresaLabel.Text = criptografia.Descriptografar(Request.QueryString("CammaleonEmpresaCryp"), "#!$a36?@")
        idCadastroEmpresaFilhaLabel.Text = criptografia.Descriptografar(Request.QueryString("CammaleonFilhaCryp"), "#!$a36?@")

        If Request.QueryString("CammaleonProtocoloCryp") <> "" Then
            ProtocoloLabel.Text = criptografia.Descriptografar(Request.QueryString("CammaleonProtocoloCryp"), "#!$a36?@")
        Else
            Response.Redirect("/")
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
            cmd.Parameters("@mensagem").Value = myReplace.ReplaceIn(mensagemTextBox.Text)

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
    End Sub

    Protected Sub RadioButtonListAprovado_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles RadioButtonListAprovado.SelectedIndexChanged
        txtAprovado.Text = RadioButtonListAprovado.SelectedItem.Text
        idLabel.Text = RadioButtonListAprovado.SelectedValue
    End Sub

End Class
