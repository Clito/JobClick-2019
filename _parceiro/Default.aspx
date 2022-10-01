<%@ Page Language="VB" MaintainScrollPositionOnPostback="true" MasterPageFile="~/_parceiro/parceiroPage.master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_parceiro_Default" title=".: Jobclick :." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '150', position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
        });
	</script>
                 <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_parceiro/images/buttonOK.png" />
                            </td>
                            <td align="center" valign="top">
                                <asp:Label ID="AVISOLABEL" runat="server" 
                                    CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
    <br /><h1><asp:Label ID="LabelCabec" runat="server" Text="Menu principal"></asp:Label></h1>
                <asp:Label ID="emailRes" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="nomeLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="emailLabel" runat="server" Visible="False"></asp:Label>
    <br />
    <section class="content col_16 col">   
        <table id="Master" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                            <asp:Label ID="InstruLabel" runat="server"></asp:Label>
                    <br />
                <table id="GET_PROMO" runat="server" visible="false" align="left" cellpadding="0" cellspacing="0" class="col_7">
                    <tr>
                        <td align="left">
                            <asp:Label ID="LabelRegulamento" runat="server"></asp:Label>
                            <br />
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                </table><br /><br />
                <blockquote class="right"><asp:DataList ID="DataListLogin" runat="server" 
                        DataKeyField="contador" DataSourceID="SqlDataSourceACESSO"
                    Width="100%">
                    <ItemTemplate>
                        Login em:
                        <asp:Label ID="dataultimoacessLabel" runat="server" Text='<%# Eval("dataultimoacess") %>'></asp:Label>
                        | nº acesso(s):
                        <asp:Label ID="contadorLabel" runat="server" Text='<%# Eval("contador") %>'></asp:Label><br />
                    </ItemTemplate>
                </asp:DataList>
                            <br />
                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSourceCURRICULO" 
                        Width="100%">
                    <ItemTemplate>
                        Currículos publicados em
                        <asp:Label ID="dsidiomaLabel" runat="server" Text='<%# Eval("dsidioma") %>'></asp:Label>:
                        <asp:Label ID="cntLabel" runat="server" Text='<%# Eval("cnt") %>'></asp:Label>
                    </ItemTemplate>
                </asp:DataList></blockquote>
                            <br />
                </td>
            </tr>
        </table>
    </section>
    <br />
    <asp:Label ID="lblStatus" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idRH_gestorLabel" runat="server" Visible="False"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSourceACESSO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="_USP_LOGIN_DADOS" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idUser" SessionField="idUser"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCURRICULO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="_USP_CURRICULOS_PUBLICADOS" 
        SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>

