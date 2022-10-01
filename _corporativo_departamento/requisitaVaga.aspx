<%@ Page Title="" Language="VB" MasterPageFile="~/_corporativo_departamento/corporativoPage.master" AutoEventWireup="false" CodeFile="requisitaVaga.aspx.vb" Inherits="_corporativo_departamento_requisitaVaga" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    $(function () {
        $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
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
                    <asp:Label ID="AVISOLABEL" runat="server" CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <table runat="server" visible="true" cellpadding="0" cellspacing="0" 
            id="BodyInternoAGENDA" width="930px" align="center">
        <tr>
            <td align="left">
                <asp:Label ID="LabelSubPastas" runat="server" CssClass="h1"></asp:Label>
                <br /></td>
        </tr>
    </table>
</asp:Content>

