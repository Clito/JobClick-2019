<%@ Page Title="" Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="helpdesk.aspx.vb" Inherits="_candidato_helpdesk" %>
<%@ Register assembly="JaxterChat" namespace="WebFurbish" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Cabec" runat="server" Text="Suporte técnico para Candidatos" 
                    CssClass="TituloBGText"></asp:Label><br />
             <br /><asp:Label ID="LabelCabec" runat="server" 
                    
                    Text="&lt;b&gt;ATENÇÃO&lt;/b&gt;:&lt;br&gt;Nosso atendimento está disponível 24 horas por dia, 7 dias por semana, exceto para assuntos sobre Cobrança, disponíveis de segunda a sexta-feira das 8h as 18h. Atendimento exclusivo para deficientes auditivos através do 11 2459-0286."></asp:Label>
                <br />
                <br />
                <table id="MENU" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="right">
                            <asp:LinkButton ID="LinkButtonMP" runat="server" CssClass="button">Menu Principal</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table class="CandidatoPaginaCorpo" align="center">
        <tr>
            <td align="left">
<table id="Atendimento" class="CandidatoPaginaCorpo" cellpadding="0" cellspacing="0" 
    align="center">
    <tr>
        <td>
            <br />
            <asp:Label ID="LabelObs" runat="server" 
                
                Text="Obs.: Para melhor atende-lo, precisamos de algumas informações antes de iníciar o atendimento." 
                Font-Bold="False"></asp:Label>
            <br />
            <asp:Label ID="statusOcorrenciaLabel" runat="server"></asp:Label>
            <asp:Label ID="ProtocoloLabel" runat="server"></asp:Label>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                ShowMessageBox="True" ShowSummary="False" ValidationGroup="DUVIDA" />
            <asp:Panel ID="PanelMOTIVO" runat="server">
            <table cellpadding="2" cellspacing="2" width="100%">
                <tr>
                    <td width="50%">
                        <asp:Label ID="LabelForm1" runat="server" Text="Sua dúvida é sobre:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="DropDownListOcorrencia" 
                            ErrorMessage="Obrigatório informar sobre sua dúvida." ValidationGroup="DUVIDA">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:DropDownList ID="DropDownListOcorrencia" runat="server" 
                            AutoPostBack="True" CssClass="DropCadFormCandidatoCV" DataSourceID="SqlOcorrencia" 
                            DataTextField="dsocorrenciatipo" DataValueField="idocorrenciatipo" 
                            ValidationGroup="DUVIDA" Width="300px">
                        </asp:DropDownList>
                    </td>
                    <td width="50%">
                        <asp:Label ID="LabelForm2" runat="server" Text="Motivo:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="DropDownListMotivo" 
                            ErrorMessage="Obrigatório informar sobre o motivo do contato." 
                            ValidationGroup="DUVIDA">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:DropDownList ID="DropDownListMotivo" runat="server" AutoPostBack="True" 
                            CssClass="DropCadFormCandidatoCV" DataSourceID="SqlMotivo" 
                            DataTextField="dsocorrenciamotivo" DataValueField="idocorrenciamotivo" 
                            ValidationGroup="DUVIDA" Width="300px">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>                    
                <br />
            </asp:Panel>
            <asp:Panel ID="PanelFORMAATENDIMENTO" runat="server" Visible="False">
            <table cellpadding="2" cellspacing="2" width="100%">
                <tr>
                    <td width="50%">
                        <table cellpadding="2" cellspacing="1">
                            <tr>
                                <td>
                                    <asp:Image ID="Image2" runat="server" 
                                        ImageUrl="~/images/entrevistaonline/help_desk_peq.jpg" />
                                </td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="12pt" 
                                        Text="Help Desk"></asp:Label>
                                    <br />
                                    <asp:LinkButton ID="LinkButtonHD" runat="server">Selecione aqui para Help Desk</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="50%">
                        <table cellpadding="2" cellspacing="1">
                            <tr>
                                <td>
                                    <asp:Image ID="Image3" runat="server" 
                                        ImageUrl="~/images/entrevistaonline/chat_peq.jpg" />
                                </td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Size="12pt" 
                                        Text="Chat"></asp:Label>
                                    <br />
                                    <asp:LinkButton ID="LinkButtonCHAT" runat="server">Selecione aqui para Chat</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>             
            </asp:Panel>
            <asp:Panel ID="PanelDUVIDA" runat="server" Visible="False">
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="100%">
                        <asp:Label ID="Label4" runat="server" 
                            Text="Descreva abaixo sua dúvida ou o motivo que levou a solicitar o contato:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="DuvidaTextBox" 
                            ErrorMessage="É necessário informar o motivo do contato." 
                            SetFocusOnError="True" ValidationGroup="DUVIDA">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="DuvidaTextBox" runat="server" CssClass="DropCadFormCandidatoCV" 
                            Height="138px" TextMode="MultiLine" Width="98%" ValidationGroup="DUVIDA"></asp:TextBox>
                        <br />
                        <br />
                        <asp:LinkButton ID="LinkButtonIniSuporteI" runat="server" CssClass="button" 
                            ValidationGroup="DUVIDA">Solicitar Suporte Técnico</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonCancelar" runat="server" CausesValidation="False" 
                            CssClass="button">Cancelar</asp:LinkButton>
                    </td>
                </tr>
            </table>             
            </asp:Panel>
            <br />
            <asp:Panel ID="PanelRESPOSTA" runat="server">
                <asp:DataList ID="DataListResposta" runat="server" DataKeyField="protocolo" 
                    DataSourceID="SqlHELPDESKRes" Width="100%">
                    <ItemTemplate>
                        <asp:Label ID="LabelProtocolo" runat="server" Text="Protocolo n°"></asp:Label>
                        <br />
                        <asp:Label ID="protocoloLabel" runat="server" CssClass="tituloFormulario" 
                            Text='<%# Eval("protocolo") %>' />
                        &nbsp;<asp:LinkButton ID="LinkButtonSelect" runat="server" CommandName="Select">Responder 
                        ou informar outro dado importante</asp:LinkButton>
                        <br />
                        <br />
                        <asp:Label ID="ChatLabel" runat="server" Text='<%# Eval("Chat") %>'></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="LabelEnviado" runat="server" Text="Enviada em " />
                        <asp:Label ID="dataILabel" runat="server" Text='<%# Eval("dataI") %>' />
                        &nbsp;<asp:Label ID="LabelPor" runat="server" Text="por: "></asp:Label>
                        <asp:Label ID="ParticipanteLabel" runat="server" Font-Bold="True" 
                            Text='<%# Eval("Participante") %>' />
                        <br />
                        <br />
                        <asp:Label ID="AtendenteLabel" runat="server" Text='<%# Eval("Atendente") %>' />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="idHistoricoHelpDesk" 
                    DataSourceID="SqlHELPDESKFORM" DefaultMode="Edit" Height="245px" Width="100%">
                    <EditItemTemplate>
                        &nbsp;<asp:TextBox ID="protocoloTextBox" runat="server" 
                            Text='<%# Bind("protocolo") %>' Visible="False" Width="10px" />
                        <asp:TextBox ID="ChatTextBox" runat="server" Text='<%# Bind("Chat") %>' 
                            Visible="False" Width="10px" />
                        <asp:TextBox ID="encerradoTextBox" runat="server" 
                            Text='<%# Bind("encerrado") %>' Visible="False" Width="10px" />
                        <asp:Label ID="idHistoricoHelpDeskLabel1" runat="server" 
                            Text='<%# Eval("idHistoricoHelpDesk") %>' Visible="False" />
                        <br />
                        <asp:Label ID="LabelForm" runat="server" 
                            Text="Descreva mais alguma informação para o Atendente:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="DuvidaTextBox" ErrorMessage=" * Campo obrigatório."></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="DuvidaTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                            Height="138px" TextMode="MultiLine" Width="98%"></asp:TextBox>
                        <br />
                        <asp:CheckBox ID="CheckBoxFinalizar" runat="server" 
                            Text="Quero responder este e finalizar este chamado (Clique aqui)" />
                        <br />
                        <br />
                        <asp:ImageButton ID="ImageButtonEnviar" runat="server" CommandName="Update" 
                            ImageUrl="~/images/entrevistaonline/responder.gif" />
                        <asp:ImageButton ID="ImageButtonCancelar" runat="server" 
                            ImageUrl="~/images/entrevistaonline/fechar.gif" 
                            onclick="ImageButtonCancelar_Click" CausesValidation="False" />
                        <br />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        protocolo:
                        <asp:TextBox ID="protocoloTextBox" runat="server" 
                            Text='<%# Bind("protocolo") %>' />
                        <br />
                        Chat:
                        <asp:TextBox ID="ChatTextBox" runat="server" Text='<%# Bind("Chat") %>' />
                        <br />
                        encerrado:
                        <asp:TextBox ID="encerradoTextBox" runat="server" 
                            Text='<%# Bind("encerrado") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        protocolo:
                        <asp:Label ID="protocoloLabel" runat="server" Text='<%# Bind("protocolo") %>' />
                        <br />
                        Chat:
                        <asp:Label ID="ChatLabel" runat="server" Text='<%# Bind("Chat") %>' />
                        <br />
                        encerrado:
                        <asp:Label ID="encerradoLabel" runat="server" Text='<%# Bind("encerrado") %>' />
                        <br />
                        idHistoricoHelpDesk:
                        <asp:Label ID="idHistoricoHelpDeskLabel" runat="server" 
                            Text='<%# Eval("idHistoricoHelpDesk") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                            CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
            </asp:Panel>
            <asp:Panel ID="PanelCHATonline" runat="server" CssClass="panelCHAT" 
                Visible="False">
                <table ID="CHAT" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="center">
                            <table ID="CHATBanner" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right">
                                        <asp:ImageButton ID="ImageButtonClose" runat="server" 
                                            ImageUrl="~/images/entrevistaonline/close.png" />
                                    </td>
                                </tr>
                            </table>
                            <cc1:JaxterChat ID="JaxterChatUser" runat="server" 
                                ActiveUsersText="Usuários ativos:" ActiveUsersToolTipText="Usuários:" 
                                BackColor="#9AA1B6" BackImageUrl="JaxterChat/Themes/Googleish/back_strip_4.jpg" 
                                ClearPageButtonImageUrl="JaxterChat/Images/clear_page.gif" 
                                EmoticonsButtonImageUrl="JaxterChat/Images/emoticons.gif" EmoticonsText=" " 
                                EmoticonsToolTipText=" " EnableClearPage="False" EnableSound="False" 
                                EnableTheming="True" EnteredRoomInstructionText=" " EnteredRoomText="Sala:" 
                                FontColor="MidnightBlue" FontFace="Arial, Verdana" FontSizePixels="12" 
                                FooterPanelHeightPixels="0" HeaderPanelHeightPixels="23" Height="356px" 
                                MessageInputBackColor="White" MessageInputBorderColor="DarkGray" 
                                MessageInputBorderWidthPixels="1" MessageInputFontColor="Black" 
                                MessageInputFontFace="Arial, Verdana" MessageInputFontSizePixels="12" 
                                MessageInputHeightPixels="38" MessageInputPaddingBottomPixels="1" 
                                MessageInputPaddingLeftPixels="1" MessageInputPaddingRightPixels="1" 
                                MessageInputPaddingTopPixels="1" MessageOutputBackColor="White" 
                                MessageOutputBorderColor="DarkGray" MessageOutputBorderWidthPixels="1" 
                                MessageOutputFontColor="Black" MessageOutputFontFace="Arial, Verdana" 
                                MessageOutputFontSizePixels="12" MessageOutputLinkColor="90, 128, 198" 
                                MessageOutputPaddingBottomPixels="1" MessageOutputPaddingLeftPixels="8" 
                                MessageOutputPaddingRightPixels="1" MessageOutputPaddingTopPixels="2" 
                                MessageOutputPostIconUrl="JaxterChat/Themes/Googleish/icon.gif" 
                                MessageOutputUserNameFontColor="Black" PaddingBottomPixels="5" 
                                PaddingLeftPixels="4" PaddingRightPixels="4" PaddingTopPixels="3" 
                                PopupCloseButtonImageUrl="JaxterChat/Images/popup_close.gif" 
                                PopupWindowBackColor="Gainsboro" PopupWindowContentFontColor="Black" 
                                PopupWindowContentFontFace="Arial, Verdana" 
                                PopupWindowContentFontSizePixels="10" 
                                PopupWindowPrivateMessageText="Para enviar mensagem privada selecione o usuário&lt;br&gt;&lt;br&gt;" 
                                PopupWindowTitleFontColor="Black" PopupWindowTitleFontFace="Arial, Verdana" 
                                PopupWindowTitleFontSizePixels="12" 
                                PrivateMessageReceivedText="Messagem Privada" 
                                PrivateMessageSentText="Messagem Privada para:" ScrollBarIE3DLightColor="White" 
                                ScrollBarIEArrowColor="LightGray" ScrollBarIEBaseColor="Silver" 
                                ScrollBarIEDarkShadowColor="Silver" ScrollBarIEFaceColor="White" 
                                ScrollBarIEHighlightColor="AliceBlue" ScrollBarIEShadowColor="Silver" 
                                ScrollBarIETrackColor="Gainsboro" 
                                SendButtonImageUrl="JaxterChat/Images/send_button.gif" ShowSendButton="True" 
                                ToggleSoundOffButtonImageUrl="JaxterChat/Images/sound_off.gif" 
                                ToggleSoundOnButtonImageUrl="JaxterChat/Images/sound_on.gif" 
                                ToolbarPanelHeightPixels="21" UrlPathPrefix="/" 
                                UserEnteredNotifyMessage="entrou." UserExitNotifyMessage="saiu." 
                                UserListButtonImageUrl="JaxterChat/Images/users.gif" UserNameMaxLength="30" 
                                Visible="False" Width="740px" UserPingAutoLogoutTimeoutSeconds="30">
                            </cc1:JaxterChat>
                        </td>
                    </tr>
                </table>
                <br />
            </asp:Panel>
            <br />
            <asp:SqlDataSource ID="SqlOcorrencia" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="SELECT [idocorrenciatipo], [dsocorrenciatipo] FROM [tbCCOcorrenciatipo]">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlMotivo" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="SELECT [idocorrenciamotivo], [dsocorrenciamotivo] FROM [tbCCOcorrenciaMotivo] WHERE ([idocorrenciatipo] = @idocorrenciatipo)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListOcorrencia" 
                        Name="idocorrenciatipo" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlHELPDESKRes" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="USP_CC_HISTORICO_HELPDESK_USUARIO" 
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idUsuario" SessionField="idUser" Type="Int32" />
                    <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                    <asp:ControlParameter ControlID="ProtocoloLabel" Name="protocolo" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlHELPDESKFORM" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                DeleteCommand="DELETE FROM [tbCCHistoricoHelpDesk] WHERE [idHistoricoHelpDesk] = @idHistoricoHelpDesk" 
                InsertCommand="INSERT INTO [tbCCHistoricoHelpDesk] ([protocolo], [Chat], [encerrado]) VALUES (@protocolo, @Chat, @encerrado)" 
                SelectCommand="SELECT [protocolo], [Chat], [encerrado], [idHistoricoHelpDesk] FROM [tbCCHistoricoHelpDesk] WHERE ([protocolo] = @protocolo)" 
                UpdateCommand="UPDATE [tbCCHistoricoHelpDesk] SET [protocolo] = @protocolo, [Chat] = @Chat, [encerrado] = @encerrado WHERE [idHistoricoHelpDesk] = @idHistoricoHelpDesk">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ProtocoloLabel" Name="protocolo" 
                        PropertyName="Text" Type="String" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="idHistoricoHelpDesk" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="protocolo" Type="String" />
                    <asp:Parameter Name="Chat" Type="String" />
                    <asp:Parameter Name="encerrado" Type="Int32" />
                    <asp:Parameter Name="idHistoricoHelpDesk" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="protocolo" Type="String" />
                    <asp:Parameter Name="Chat" Type="String" />
                    <asp:Parameter Name="encerrado" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
            </td>
        </tr>
    </table>
</asp:Content>

