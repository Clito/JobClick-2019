<%@ Page Title="" Language="VB" MasterPageFile="~/_anonimo/modulo_jobclick/master/MasterPageGESTOR.master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_anonimo__gestor_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">

.titulo
{
	font-size: 4mm;
	color: #a0a0a0;
	font-family: Verdana;
	text-decoration: none;
	font-weight: bold;
}
	
.tableFormulario
{
	border-right: #cccccc 0px solid;
	border-top: #cccccc 1px solid;
	border-left: #cccccc 0px solid;
	border-bottom: #cccccc 0px solid;
	padding-top: 10px;
	padding-right: 10px;
	padding-left: 10px;
	padding-bottom: 10px;
}

    </style>
	<script type="text/javascript" src="../../js/jquery-1.7.1.min.js"></script>
	<link type="text/css" href="../../App_Themes/ui-lightness/jquery-ui-1.8.19.custom.css" rel="Stylesheet" />	
    <script type="text/javascript" src="../../js/jquery-ui-1.8.18.custom.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
            $(function () {
                $("#<%=PanelLEVANTAMENTO.ClientID%>").dialog
            ({ closeText: '', width: '820', title: "Perfil do Candidato", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
            });
	</script>

    <table id="APRESENTA" cellpadding="2" cellspacing="2" width="100%">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="LabelBEMVINDO" runat="server" Text="Bem-Vindo "></asp:Label>
                <asp:Label ID="nomeLabel" runat="server"></asp:Label>
                <asp:Label ID="idPerfilVagaLabel" runat="server" Visible="False"></asp:Label>
                <br />
                <asp:Label ID="ProtocoloLabel" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
            <td>
                <asp:GridView ID="GridViewListaVAGA" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlVagasSalvas" Width="100%" 
                    BorderStyle="None" GridLines="Horizontal">
                    <AlternatingRowStyle BackColor="WhiteSmoke" />
                    <Columns>
                        <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                            SortExpression="Protocolo" />
                        <asp:BoundField DataField="Cargo" HeaderText="Cargo" 
                            SortExpression="Cargo" >
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:Panel ID="PanelLEVANTAMENTO" runat="server">
                </asp:Panel>
                <br />
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="right">
                            <asp:LinkButton ID="LinkButtonFECHAR" runat="server" CssClass="button">Encerrar</asp:LinkButton>
                        </td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="SqlVagasSalvas" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="SELECT [Protocolo], [Cargo] FROM [_tbVagaAnuncio_PREVIEW] WHERE (([gravar] = @gravar) AND ([Protocolo] = @Protocolo))">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="gravar" Type="Int32" />
                        <asp:SessionParameter Name="Protocolo" SessionField="jobclickProtocolo" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

