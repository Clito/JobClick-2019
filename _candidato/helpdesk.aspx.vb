Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.IO
Imports geraProtocolo
Imports CharHistoricoCC
Imports System.DBNull

Partial Class _candidato_helpdesk
    Inherits System.Web.UI.Page
    Dim ModeloAtendimento As Int32

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Application("idUsuarioCustomerCare_" & Session("SETLayout")) > 0 Then
            LinkButtonCHAT.Enabled = True
        Else
            LinkButtonCHAT.Enabled = False
            LinkButtonCHAT.Text = "Chat offline"
        End If
        ProtocoloLabel.Visible = False
    End Sub

    Protected Sub JaxterChatUser_MessagePosted(ByVal o As Object, ByVal e As WebFurbish.JaxterMessageEventArgs) Handles JaxterChatUser.MessagePosted
        Dim myGravaChat As New CharHistoricoCC
        myGravaChat.GravaHistoricoChat(e.RoomName, e.Message, e.UserName, e.MessageHTML)
    End Sub

    Protected Sub DropDownListOcorrencia_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListOcorrencia.DataBound
        DropDownListOcorrencia.Items.Insert(0, New ListItem("Informe a sua dúvida.", ""))
    End Sub

    Protected Sub DropDownListMotivo_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListMotivo.DataBound
        DropDownListMotivo.Items.Insert(0, New ListItem("Informe o motivo do contato.", ""))
    End Sub

    Protected Sub DropDownListMotivo_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownListMotivo.SelectedIndexChanged
        PanelFORMAATENDIMENTO.Visible = True
    End Sub

    Protected Sub LinkButtonCHAT_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButtonCHAT.Click

        Dim protocolo As String = ""
        Dim myProtocolo As New geraProtocolo
        protocolo = myProtocolo.getNrProtocolo(Session("idSetup"))
        Session("protocolo") = protocolo

        System.Web.HttpContext.Current.Session("protocoloRES") = protocolo
        System.Web.HttpContext.Current.Session("idUsuarioRES") = Session("idUser")
        System.Web.HttpContext.Current.Session("idSetupRES") = Session("idSetup")
        System.Web.HttpContext.Current.Session("idocorrenciamotivoRES") = DropDownListMotivo.SelectedValue
        System.Web.HttpContext.Current.Session("idocorrenciatipoRES") = DropDownListOcorrencia.SelectedValue

        JaxterChatUser.RoomName = protocolo
        JaxterChatUser.UserName = Session("nome")

        JaxterChatUser.EnteredRoomInstructionText = "<br>Olá, em que podemos te ajudar?"
        JaxterChatUser.EnteredRoomText = ""

        PanelDUVIDA.Visible = False
        ModeloAtendimento = 1
        PanelCHATonline.Visible = True
        JaxterChatUser.Visible = True
        Application("idUsuarioCHAT_" & Session("SETLayout")) = Application("idUsuarioCHAT_" & Session("SETLayout")) + 1

    End Sub

    Protected Sub LinkButtonHD_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButtonHD.Click
        PanelDUVIDA.Visible = True
        ModeloAtendimento = 2
    End Sub


    Protected Sub ImageButtonClose_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonClose.Click

        JaxterChatUser.RoomName = ""
        JaxterChatUser.UserName = ""
        JaxterChatUser.EnteredRoomInstructionText = ""
        JaxterChatUser.EnteredRoomText = ""
        JaxterChatUser.ClearChat()
        PanelCHATonline.Visible = False

        Dim myGravaChat As New CharHistoricoCC
        myGravaChat.EncerraHistoricoChat(Session("protocolo"), "Encerrado pelo usuário", Session("nome"), Now())

        Application("idUsuarioCHAT_" & Session("SETLayout")) = Application("idUsuarioCHAT_" & Session("SETLayout")) - 1

        Application.Clear()

    End Sub

    Protected Sub JaxterChatUser_ChatStarted(ByVal o As Object, ByVal e As WebFurbish.JaxterOnStartEventArgs) Handles JaxterChatUser.ChatStarted
        Dim myGravaChat As New CharHistoricoCC
        myGravaChat.GravaHistoricoChat(e.RoomName, "Inicio", e.UserName, Now())
    End Sub

    Protected Sub DataListResposta_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataListResposta.SelectedIndexChanged
        ProtocoloLabel.Text = DataListResposta.SelectedValue
        DataListResposta.DataBind()
    End Sub

    Protected Sub SqlHELPDESKRes_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlHELPDESKRes.Selecting
        If ProtocoloLabel.Text = "" Then
            e.Command.Parameters("@protocolo").Value = DBNull.Value
        End If
    End Sub

    Protected Sub ImageButtonCancelar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        ProtocoloLabel.Text = ""
    End Sub

    Protected Sub SqlHELPDESKFORM_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlHELPDESKFORM.Updating
        Dim myDuvida As String = CType(FormView1.FindControl("ChatTextBox"), TextBox).Text & "<br>"
        myDuvida = myDuvida & Chr(10) & "• " & Session("nome") & " - " & Now() & " : " & CType(FormView1.FindControl("DuvidaTextBox"), TextBox).Text
        e.Command.Parameters("@Chat").Value = myDuvida
        If CType(FormView1.FindControl("CheckBoxFinalizar"), CheckBox).Checked Then
            e.Command.Parameters("@encerrado").Value = 1
        Else
            e.Command.Parameters("@encerrado").Value = 0
        End If
    End Sub

    Protected Sub SqlHELPDESKFORM_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlHELPDESKFORM.Updated
        DataListResposta.DataBind()
        ProtocoloLabel.Text = ""
    End Sub

    Protected Sub LinkButtonMP_Click(sender As Object, e As System.EventArgs) Handles LinkButtonMP.Click
        Response.Redirect("Default.aspx")
    End Sub


    Protected Sub LinkButtonIniSuporteI_Click(sender As Object, e As System.EventArgs) Handles LinkButtonIniSuporteI.Click
        Dim protocolo As String = ""
        Dim myProtocolo As New geraProtocolo
        protocolo = myProtocolo.getNrProtocolo(Session("idSetup"))
        Session("protocolo") = protocolo

        System.Web.HttpContext.Current.Session("protocoloRES") = protocolo
        System.Web.HttpContext.Current.Session("idUsuarioRES") = Session("idUser")
        System.Web.HttpContext.Current.Session("idSetupRES") = Session("idSetup")
        System.Web.HttpContext.Current.Session("idocorrenciamotivoRES") = DropDownListMotivo.SelectedValue
        System.Web.HttpContext.Current.Session("idocorrenciatipoRES") = DropDownListOcorrencia.SelectedValue

        Dim myGravaChat As New CharHistoricoCC
        myGravaChat.UsuarioHelpDesk(Session("nome"), DuvidaTextBox.Text)

        PanelDUVIDA.Visible = False

        DataListResposta.DataBind()

        Dim myConnection As SqlConnection
        Dim myCommand As SqlCommand
        Dim dr As SqlDataReader

        myConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Try
            myConnection.Open()
            myCommand = New SqlCommand("USP_sendMailHelpDesk @idSetup = " & Session("idSetup") & ", @idUser = " & Session("idUser") & ", @idOcorrenciaTipo = " & DropDownListMotivo.SelectedValue & ", @idOcorrenciaMotivo = " & DropDownListOcorrencia.SelectedValue & ", @OcorrenciaTexto = '" & DuvidaTextBox.Text & "'", myConnection)
            myCommand.ExecuteReader()
        Catch ex As Exception
        Finally
            myConnection.Close()
        End Try

    End Sub

    Protected Sub LinkButtonCancelar_Click(sender As Object, e As System.EventArgs) Handles LinkButtonCancelar.Click
        Response.Redirect("helpdesk.aspx")
    End Sub
End Class
