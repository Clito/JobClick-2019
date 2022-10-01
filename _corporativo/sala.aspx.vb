Imports WebFurbish.JaxterChat
Imports WebFurbish.JaxterOnStartEventArgs
Imports WebFurbish.JaxterMessageEventArgs

Imports gravaEntrevistaVirtual

Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web


Partial Class _corporativo_relatorio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Application("nomeParticipante" & Request.QueryString("sala")) <> Session("nomeConsultor") Then
            Application("nomeParticipante" & Request.QueryString("sala")) = Session("nomeConsultor")
        End If

        idCurriculoLabel.Text = Request.QueryString("idCV")
        Application(Request.QueryString("sala")) = Request.QueryString("sala")

        JaxterChatENTREVISTA.RoomName = Application(Request.QueryString("sala"))
        JaxterChatENTREVISTA.UserName = Application("nomeParticipante" & Request.QueryString("sala"))
        Session("idEntrevistaVirtual") = Request.QueryString("id")

        PanelCVCandidato.Visible = False
        PanelAviso.Visible = False

    End Sub

    Protected Sub JaxterChatENTREVISTA_MessagePosted(o As Object, e As WebFurbish.JaxterMessageEventArgs) Handles JaxterChatENTREVISTA.MessagePosted
        Dim Gravador As New gravaEntrevistaVirtual
        Gravador.GravaEntrevista_ENTREVISTADOR(e.RoomName, e.Message, e.UserName, e.MessageHTML)
    End Sub

    Protected Sub LinkButtonAVALIACAO_Click(sender As Object, e As System.EventArgs) Handles LinkButtonAVALIACAO.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False
        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_VIRTUAL_GRAVADOR]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idEntrevistaVirtual", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idEntrevistaVirtual").Value = Session("idEntrevistaVirtual")

        prm = New SqlParameter("@parecerAnalista_Consultor", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@parecerAnalista_Consultor").Value = parecerAnalistaTextBox.Text

        prm = New SqlParameter("@RespostaDO", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@RespostaDO").Value = 1 REM (ENTREVISTADOR)

        If CheckBoxFINALIZAR.Checked Then
            prm = New SqlParameter("@encerrar", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@encerrar").Value = 1 REM (ENCERRADO!)
        End If

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            cn.Close()
        Catch ex As Exception

        End Try

        parecerAnalistaTextBox.Text = ""

        If CheckBoxFINALIZAR.Checked Then
            PanelAviso.Visible = True
            AVISOLABEL.Text = "Entrevista virtual finalizada!"
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_corporativo/images/buttonOK.png"

            JaxterChatENTREVISTA.AJAX_writeMessage("<br><b>Entrevista virtual finalizada, obrigado!</b>", JaxterChatENTREVISTA.UserName, JaxterChatENTREVISTA.RoomName)

        End If

    End Sub

    Protected Sub LinkButtonCV_Click(sender As Object, e As System.EventArgs) Handles LinkButtonCV.Click
        PanelCVCandidato.Visible = True
    End Sub
End Class
