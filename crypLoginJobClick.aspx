<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageJobClick.master" AutoEventWireup="false" CodeFile="crypLoginJobClick.aspx.vb" Inherits="crypLoginJobClick" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table cellpadding="20" cellspacing="20" class="style1">
        <tr>
            <td>
            <asp:Label ID="URL" runat="server" style="font-weight: 700"></asp:Label>
            
                <br />
                <asp:Label ID="DescryLabel" runat="server"></asp:Label>
            
                <br />
                <asp:Label ID="CaminhoFisicoLabel" runat="server"></asp:Label>
            
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" />
                <br />
                <br />
                <br />
                <asp:Label ID="decryptoLabel" runat="server" 
                    Text="Aqui virá o valor descriptografado"></asp:Label>
                <br />
                <br />
                <br />
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0" Selected="True">Enviar a URL para o sistema</asp:ListItem>
                    <asp:ListItem Value="1">Ver a URL criptografada</asp:ListItem>
                    <asp:ListItem Value="2">Ver a URL descriptografada</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <br />
                Código Cliente:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="CartaoTextBox" Display="Dynamic" 
                    ErrorMessage="Obrigatório campo Cartão" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <br />
    <asp:TextBox ID="CartaoTextBox" runat="server" Width="350px"></asp:TextBox>
                <br />
                URL Mergulho: (Não obrigatório)<br />
                <asp:TextBox ID="MergulhoTextBox" runat="server" Width="350px"></asp:TextBox>
    <br />
    URL Retorno:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="URLTextBoxCartao" Display="Dynamic" 
                    ErrorMessage="Obrigatório campo URL retorno." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <br />
    <asp:TextBox ID="URLTextBoxCartao" runat="server" Width="350px"></asp:TextBox>
    &nbsp;<br />
                <br />
    <asp:TextBox ID="campoDes" runat="server" Width="350px"></asp:TextBox>
                <br />
                <asp:Label ID="Label2" runat="server" Text="Valor Criptografado:"></asp:Label>
                <br />
                <asp:TextBox ID="TextBoxCrypt" runat="server"></asp:TextBox>
                <br />
    <br />
    <asp:Button ID="ButtonRecPWD" runat="server" Text="Enviar" />
    <br />
    <br />
    <br />
                <br />
                <br />
            </td>
        </tr>
    </table>

</asp:Content>

