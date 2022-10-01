<%@ Page Language="VB" MasterPageFile="~/PagSeguroMasterPage.master" AutoEventWireup="false" CodeFile="pagseguro_MAC.aspx.vb" Inherits="pagseguro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="PagSeguro" align="center">
    <tr>
        <td align="center">
    <asp:Label ID="notificationCodeLabel" runat="server"></asp:Label>
    <asp:Label ID="notificationTypeLabel" runat="server"></asp:Label>
    <asp:Label ID="URLLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="emailRes" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="nomeRes" runat="server"></asp:Label>
    <asp:Label ID="paymentMethodType" runat="server"></asp:Label>
            <asp:Label ID="paymentMethodTypeDesc" runat="server"></asp:Label>
    <asp:Label ID="paymentMethodCode" runat="server"></asp:Label>
    <br />
    <asp:Label ID="nmempresa" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="Utilizado" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="id" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="description" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="amount" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="dateLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="code" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="reference" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="type" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="status" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="creditos" runat="server"></asp:Label>
    <asp:Label ID="sms" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="StatusTransacaoDescricao" runat="server"></asp:Label>
    <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="LabelAviso" runat="server" CssClass="tituloPage" 
        Font-Bold="False" 
        Text="&quot;&lt;b&gt;Sua aquisição foi registrada com sucesso!&lt;/b&gt;&quot;"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="LabelAvisoParte2" runat="server" CssClass="fontTexto" 
                Text="Uma mensagem com os detalhes desta transação foi enviada para o seu e-mail."></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="LabelStatus" runat="server"></asp:Label>
    <br />
            <asp:Label ID="ResultadoLabel" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="ButtonVoltar" runat="server" Text="Voltar" />
            <br />
            <br />
</td></tr></table>    
</asp:Content>
