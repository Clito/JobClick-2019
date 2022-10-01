<%@ Page Title="" Language="VB" MasterPageFile="../_corporativo_departamento/modulo_jobclick/master/MasterPageGESTOR.master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_anonimo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
	<link type="text/css" href="../App_Themes/ui-lightness/jquery-ui-1.8.19.custom.css" rel="Stylesheet" />	
    <script type="text/javascript" src="../js/jquery-ui-1.8.18.custom.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>
                 <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_corporativo/images/buttonOK.png" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABEL" runat="server" 
                                    CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
    <table id="LOGIN" align="center" cellpadding="0" cellspacing="0" width="400px">
    <tr>
        <td>
    <asp:Label ID="LabelCabec" runat="server" Text="Bem-Vindo"></asp:Label>
            <br />
            <asp:Label ID="LabelAviso" runat="server" Text="Informe seus dados de acesso:"></asp:Label>
            <br />
            <br />
            <table id="FORM" cellpadding="2" cellspacing="2" width="100%">
                <tr>
                    <td>
                        <asp:Label ID="LabelEmail" runat="server" Text="Informe seu e-mail:"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBoxemail" runat="server" 
                            CssClass="InputCadFormCandidatoCV" Width="400px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelSenha" runat="server" Text="Senha:"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBoxsenha" runat="server" 
                            CssClass="InputCadFormCandidatoCV" Width="400px" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <br />
                        <asp:LinkButton ID="LOGIN" runat="server" CssClass="button">Login</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</asp:Content>

