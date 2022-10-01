<%@ Control Language="VB" AutoEventWireup="false" CodeFile="loginBanner.ascx.vb" Inherits="App_Include_loginBanner" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<table cellpadding="0" cellspacing="0" width="760px" align="center" 
        style="height: 210px" id="loginBanner" class="bghomepage">
	<tr>
		<td align="center">
            <table id="Interno" cellpadding="10" cellspacing="10" style="height: 200px" 
                width="85%">
                <tr>
                    <td align="left" class="style1" valign="baseline">
                        <br />
                        <br />
                        <br />
                        <table id="Form" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:Label ID="Labelemail" runat="server" Text="Informe seu e-mail:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="InputCad" Width="200px" 
                                        ValidationGroup="LoginBanner"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Labelsenha" runat="server" Text="Informe sua senha:"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="TextBoxSenha" runat="server" CssClass="InputCad" Width="200px" 
                                        TextMode="Password" ValidationGroup="LoginBanner"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:ImageButton ID="ImageButtonLogin" runat="server" 
                                        ImageUrl="~/images/layout/btEntrar.png" ValidationGroup="LoginBanner" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:ImageButton ID="ImageButtonVaga" runat="server" CausesValidation="False" 
                                        ImageUrl="~/images/layout/cadastraVagas.png" />
                                    <asp:HoverMenuExtender ID="ImageButtonVaga_HoverMenuExtender" runat="server" 
                                        DynamicServicePath="" Enabled="True" HoverDelay="5" OffsetX="10" OffsetY="10" 
                                        PopDelay="2" PopupControlID="PanelVagas" PopupPosition="Bottom" 
                                        TargetControlID="ImageButtonVaga">
                                    </asp:HoverMenuExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/layout/linha.png" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ImageButton ID="ImageButtonCV" runat="server" CausesValidation="False" 
                                        ImageUrl="~/images/layout/cadastraCV.png" />
                                    <asp:HoverMenuExtender ID="ImageButtonCV_HoverMenuExtender" runat="server" 
                                        DynamicServicePath="" Enabled="True" HoverDelay="5" OffsetX="10" OffsetY="10" 
                                        PopDelay="2" PopupControlID="PanelCV" PopupPosition="Bottom" 
                                        TargetControlID="ImageButtonCV">
                                    </asp:HoverMenuExtender>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="PanelError" runat="server" BackColor="#FFFF99" Width="350px" 
                            CssClass="AtencaoPosition" Visible="False">
                            <asp:ImageButton ID="ImageButtonClose" runat="server" 
                                ImageUrl="~/images/layout/close.png" CausesValidation="False" />
                            <br />
                            <table border="atencao" cellpadding="0" cellspacing="0" width="100%" ID="At">
                                <tr>
                                    <td align="center">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/layout/atencao.png" />
                                    </td>
                                    <td align="center">
                                        <asp:Label ID="LabelAtencao" runat="server" CssClass="textAtencao" 
                                            Text="Usuário não encontrado!"></asp:Label>
                                        <br />
                                        <asp:Label ID="LabelAviso" runat="server" 
                                            
                                            Text="Esqueceu sua senha?&lt;br&gt;Recupere a sua senha [&lt;a href=&quot;/senha.aspx&quot;&gt;clique aqui&lt;/a&gt;]"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            <table id="msnT" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="center">
                        <asp:Label ID="msnPP" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
	</tr>
</table>
<asp:Panel ID="PanelVagas" runat="server" BackColor="#FFFF99" 
    BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px" Width="200px">
    <table ID="Vagas" cellpadding="5" cellspacing="5" width="100%">
        <tr>
            <td>
                <asp:Label ID="LabelVaga" runat="server" 
                    
                    Text="No JobClick você pode destacar muito seu anúncio. Informe o e-mail que receberá os Currículos para sua vaga, o e-mail poderá ser oculto garantindo resultado e privacidade de sua empresa."></asp:Label>
            </td>
        </tr>
    </table>
</asp:Panel>
<asp:Panel ID="PanelCV" runat="server" BackColor="#FFFF99" 
    BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px" Width="200px">
    <table ID="Vagas0" cellpadding="5" cellspacing="5" width="100%">
        <tr>
            <td>
                <asp:Label ID="LabelCV" runat="server" 
                    Text="Mantenha os seus dados profissionais com o JobClick, aqui você irá encontrar ferramentas para o envio de seu CV para qualquer e-mail fora de nosso portal, além de muitas outras funcionalidades, feitas por profissionais que pensam em você!"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Panel>
