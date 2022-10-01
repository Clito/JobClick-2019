<%@ Page Language="VB" MaintainScrollPositionOnPostback="true" MasterPageFile="~/_user/user_MasterPage.master" AutoEventWireup="false" CodeFile="Novo.aspx.vb" Inherits="_modulo_Novo" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%" id="Dados">
    <tr>
        <td>
            <asp:Label ID="LabelDs" runat="server" 
                CssClass="textoPadraoAzul"></asp:Label>
            <br />
            <asp:Label ID="MSN" runat="server" CssClass="errorMSN"></asp:Label>
            <br />
        <asp:Label ID="LabelCabec1" runat="server"></asp:Label>
            <asp:Label ID="GroupLabel" runat="server" Visible="False"></asp:Label>
            <br />
            <table id="UVez" cellpadding="0" cellspacing="0" width="80%">
                <tr>
                    <td>
                        <table cellpadding="2" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:Label ID="Label5" runat="server" 
                                        Text="Informe os números avulsos para envio: Separados com [;] 9999999999" Font-Bold="True"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="strPhoneOddsTextBox" runat="server" CssClass="textbox" 
                                        TextMode="MultiLine" Width="480px"></asp:TextBox>
                                </td>
                                <td valign="top">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <br />
                                    <asp:Label ID="GrupoLabel" runat="server" Text="Selecione os Grupos:" 
                                        Font-Bold="True"></asp:Label>
                                    <asp:CheckBoxList ID="CheckBoxListGroups" runat="server" DataSourceID="SqlSMSAssist" 
                                        DataTextField="strNameGroup" DataValueField="idGroup" AutoPostBack="True" 
                                        RepeatColumns="5" RepeatDirection="Horizontal">
                                    </asp:CheckBoxList>
                                    <br />
                                </td>
                                <td valign="top">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Labelmenssage" runat="server" Text="Mensagem:" Font-Bold="True"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="menssageTextBox" 
                                        ErrorMessage="O campo mensagem deve ser preenchido.">*</asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="menssageTextBox" runat="server" CssClass="textbox" 
                                        Height="64px" TextMode="MultiLine" Width="480px"></asp:TextBox>
                                </td>
                                <td valign="top">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <asp:Button ID="ButtonEnvioSMS" runat="server" CssClass="textoPadrao" 
                            Text="Enviar" />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
            </table>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                ShowMessageBox="True" ShowSummary="False" />
            <br />
            <br />
        </td>
    </tr>
    <tr>
        <td>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlSMSAssist" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SMSCenterConnectionStringMaster %>" 
                SelectCommand="SMSAssist.spGroup_Select" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idClient" SessionField="idClient" Type="Int32" />
                    <asp:SessionParameter Name="idProject" SessionField="idProject" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
    <br />
    <br />
        </td>
    </tr>
</table>

</asp:Content>

