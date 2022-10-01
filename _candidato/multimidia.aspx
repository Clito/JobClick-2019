<%@ Page Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="multimidia.aspx.vb" Inherits="_candidato_multimidia" title="Jobclick" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up"} });
        });
	</script>
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Cabec" runat="server" Text="Sua foto e seus vídeos" CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>
                <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_candidato/images/buttonOK.png" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABEL" runat="server" CssClass="msnOK"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
    <table width="720px" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td style="width: 30px">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="690px" align="left">
                <table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                        <td valign="top">
                            <asp:Image ID="ImageCandidato" runat="server" 
                                ImageUrl="~/images/candidato/padraoC.gif" Width="120px" />
                        </td>
                        <td valign="top">
                            <asp:Label ID="ExtencaoLabel" runat="server"></asp:Label>
                            <asp:Label ID="InfoFotoCand" runat="server" 
                                Text="&lt;b&gt;Algumas informações:&lt;/b&gt;&lt;br&gt;Selecione a foto (Imagem) que está em seu computador, clique em [&lt;b&gt;Enviar&lt;/b&gt;].&lt;br&gt;Lembre-se que a foto poderá ser substituída apenas reenviando outra foto, repetindo as instruções.&lt;br&gt;&lt;br&gt;&lt;b&gt;Dica:&lt;/b&gt;&lt;br&gt;Procure enviar foto no formato (JPG), apresentando apenas seu rosto.&lt;br&gt;&lt;b&gt;Obs.:&lt;/b&gt; Caso após o envio a foto enviada não aparecer, atualize a página (Ctrl+F5)."></asp:Label>
                            <br />
                            <br />
                            <br />
                            <asp:Label ID="LabelUpload" runat="server" Text="Selecione a foto para enviar:"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="FileUpload1" Display="Dynamic" ErrorMessage="* Informe uma imagem válida"
                    SetFocusOnError="True" ValidationGroup="SendFoto">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="login" Width="100%" />
                            <br />
                            <br />
                <asp:Label ID="msn" runat="server" CssClass="msn"></asp:Label>
                            <br />
                            <asp:LinkButton ID="LinkButtonENVIARFOTO" runat="server" CssClass="button" 
                                ToolTip="Clique aqui para enviar sua foto" ValidationGroup="SendFoto">Enviar</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonMP" runat="server" CssClass="button" 
                                PostBackUrl="~/_candidato/Default.aspx" 
                                ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" ValidationGroup="SendFoto" />
                        </td>
                    </tr>
                </table>
                <br />
            </td> 
        </tr>
    </table> 
    <br />
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Videos publicados no YouTube" CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>
    <table width="720px" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td style="width: 30px">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="690px" align="left">
                <asp:Label ID="CabecMultimidia" runat="server" Text=""></asp:Label><br />
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="idMultimidia" DataSourceID="SqlDataSource1" CellPadding="0" DefaultMode="Edit" Width="350px">
                    <EditItemTemplate>
                        URL: (YouTube válida)<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="urlTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="idCadastroUserTextBox" runat="server" DataSourceID="SqlDataSource2"
                            DataTextField="idCadastroUser" DataValueField="idCadastroUser" SelectedValue='<%# Bind("idCadastroUser") %>'
                            Visible="False">
                        </asp:DropDownList>
                        <br />
                        <asp:TextBox ID="urlTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("url") %>'></asp:TextBox><br />
                        Descrição da apresentação:<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            runat="server" ControlToValidate="dsMultimídiaTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="dsMultimídiaTextBox" runat="server" 
                            Text='<%# Bind("dsMultimídia") %>' CssClass="InputCad" Height="100px" 
                            TextMode="MultiLine" ondatabinding="dsMultimídiaTextBox_DataBinding"></asp:TextBox><br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Atualizar apresentação"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            OnClientClick='return confirm("Você quer excluir este vídeo do seu portifólio?")'
                            Text="Excluir video"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar" OnClick="VaPara"></asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        URL: (YouTube válida)<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="urlTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="idCadastroUserTextBox" runat="server" DataSourceID="SqlDataSource2"
                            DataTextField="idCadastroUser" DataValueField="idCadastroUser" SelectedValue='<%# Bind("idCadastroUser") %>'
                            Visible="False">
                        </asp:DropDownList>
                        <br />
                        <asp:TextBox ID="urlTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("url") %>'></asp:TextBox><br />
                        Descrição da apresentação:<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            runat="server" ControlToValidate="dsMultimídiaTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="dsMultimídiaTextBox" runat="server" CssClass="InputCad" Height="100px"
                            Text='<%# Bind("dsMultimídia") %>' TextMode="MultiLine"></asp:TextBox><br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Incluir este vídeo para apresentação"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar"></asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        idMultimidia:
                        <asp:Label ID="idMultimidiaLabel" runat="server" Text='<%# Eval("idMultimidia") %>'>
                        </asp:Label><br />
                        idCadastroUser:
                        <asp:Label ID="idCadastroUserLabel" runat="server" Text='<%# Bind("idCadastroUser") %>'>
                        </asp:Label><br />
                        url:
                        <asp:Label ID="urlLabel" runat="server" Text='<%# Bind("url") %>'></asp:Label><br />
                        dsMultimídia:
                        <asp:Label ID="dsMultimídiaLabel" runat="server" Text='<%# Bind("dsMultimídia") %>'>
                        </asp:Label><br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit">
                        </asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete">
                        </asp:LinkButton>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New">
                        </asp:LinkButton>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="Incluir vídeo para apresentação em seu currículo"></asp:LinkButton>
                    </EmptyDataTemplate>
                </asp:FormView>
                <br />
                <div style="text-align: left">
                    <table runat="server" id="PanelMultimidia" border="0" cellpadding="0" cellspacing="0" style="width: 350px">
                        <tr>
                            <td style="width: 350px">
                <asp:Label ID="ConteudoMultimidia" runat="server" Text=""></asp:Label></td>
                        </tr>
                    </table>
                </div>
                &nbsp;<br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                    DeleteCommand="DELETE FROM [tbMultimidia] WHERE [idMultimidia] = @idMultimidia"
                    InsertCommand="INSERT INTO [tbMultimidia] ([idCadastroUser], [url], [dsMultimídia]) VALUES (@idCadastroUser, @url, @dsMultimídia)"
                    SelectCommand="SELECT [idMultimidia], [idCadastroUser], [url], [dsMultimídia] FROM [tbMultimidia] WHERE ([idMultimidia] = @idMultimidia)"
                    UpdateCommand="UPDATE [tbMultimidia] SET [idCadastroUser] = @idCadastroUser, [url] = @url, [dsMultimídia] = @dsMultimídia WHERE [idMultimidia] = @idMultimidia">
                    <DeleteParameters>
                        <asp:Parameter Name="idMultimidia" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idCadastroUser" Type="Int32" />
                        <asp:Parameter Name="url" Type="String" />
                        <asp:Parameter Name="dsMultim&#237;dia" Type="String" />
                        <asp:Parameter Name="idMultimidia" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="idMultimidia" QueryStringField="idMultimidia"
                            Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idCadastroUser" Type="Int32" />
                        <asp:Parameter Name="url" Type="String" />
                        <asp:Parameter Name="dsMultim&#237;dia" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                    SelectCommand="SELECT [idCadastroUser], [idUser] FROM [tbCadastroUser] WHERE ([idCadastroUser] = @idCadastroUser)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="0" Name="idCadastroUser" SessionField="idCadastroUser"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                    SelectCommand="SELECT [idCadastroUser] FROM [tbCadastroUser]"></asp:SqlDataSource>
            </td> 
        </tr>
    </table> 
</asp:Content>

