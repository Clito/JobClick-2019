<%@ Page Title="" Language="VB" MasterPageFile="~/_anonimo/retorno.master" AutoEventWireup="false" CodeFile="retorno.aspx.vb" Inherits="_anonimo_retorno" %>

<%@ Register assembly="UOL.PagSeguro" namespace="UOL.PagSeguro" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="PagSeguroTb" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td align="center">
            <asp:Label ID="LabelAviso" runat="server" CssClass="tituloPage" 
                Font-Bold="False" 
                
                Text="&quot;&lt;b&gt;Seu pagamento foi registrado com sucesso!&lt;/b&gt;&quot;"></asp:Label>
            <br />
            <br />
            <asp:Label ID="LabelAvisoParte2" runat="server" CssClass="fontTexto" 
                Text="Uma mensagem com os detalhes desta transação será enviada para o seu e-mail."></asp:Label>
            <br />
            <br />
            <asp:Button ID="ButtonVoltar" runat="server" Text="Voltar" />
            <br />
            <br />
            <asp:Label ID="LabelStatus" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="errorLabel" runat="server"></asp:Label>
            <br />
            <br />
            <br />
        </td>
    </tr>
</table>
    <cc1:RetornoPagSeguro ID="RetornoPagSeguroRetorno" runat="server" UrlNPI="">
    </cc1:RetornoPagSeguro>
</asp:Content>

