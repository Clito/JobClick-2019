<%@ Page Title="" Language="VB" MasterPageFile="~/_empresaJC/layout_Page001.master" AutoEventWireup="false" CodeFile="loja.aspx.vb" Inherits="_empresaJC_loja" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '150', position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>
                <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_empresaJC/images/buttonOK.png" />
                            </td>
                            <td align="center" valign="top">
                                <asp:Label ID="AVISOLABEL" runat="server" 
                                    CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
    <br /><h1><asp:Label ID="LabelCabec" runat="server" 
        Text="Produtos JobClick (Contratação online)"></asp:Label></h1>
    <section class="content col_16 col">   
        <table id="Master" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                    <asp:Label ID="LabelCabecProd" runat="server" 
                        Text="Lista de produtos e serviços para contratação online."></asp:Label>
                    <br />
                    <br />
                    <asp:DataList ID="DataListPRODUTO" runat="server" 
                        DataSourceID="SqlDataSourcePRODUTOS" RepeatColumns="1" Width="100%">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" class="col_14">
                                <tr>
                                    <td width="250">
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imagem") %>' />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                    <td>
                                        <asp:Label ID="ProdutoLabel" runat="server" CssClass="tituloEmpresa" 
                                            Text='<%# Eval("Produto") %>' />
                                        <br />
                                        <br />
                                        <asp:Label ID="Labelcodigo" runat="server" CssClass="cur01st" Text="Código: "></asp:Label>
                                        <asp:Label ID="codProdutoLabel" runat="server" 
                                            Text='<%# Eval("codProduto") %>' />
                                        <br />
                                        <br />
                                        <asp:Label ID="dsProdutoLabel" runat="server" Text='<%# Eval("dsProduto") %>' />
                                        <br />
                                        <asp:Label ID="precoLabel" runat="server" CssClass="textBold" 
                                            Text='<%# Eval("preco", "{0:C}") %>' />
                                        <asp:Label ID="Labeldt" runat="server" Text=" por mês."></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="entregaLabel" runat="server" Text='<%# Eval("entrega") %>' />
                                        <br />
                                        <br />
                                        <asp:Label ID="formaPagamenoLabel" runat="server" 
                                            Text='<%# Eval("formaPagameno") %>' />
                                        <br />
                                        <br />
                                        <asp:LinkButton ID="LinkButtonComprar" runat="server" CommandName="Select" 
                                            CssClass="button">Comprar</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                    <br />
                    <asp:Image ID="ImagePagSeguro" runat="server" 
                        ImageUrl="~/_empresaJC/images/pagseguro.png" />
                    <br />
                    <br />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSourcePRODUTOS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [idProduto], [Produto], [codProduto], [dsProduto], [preco], [entrega], [formaPagameno], [imagem], [publicar] FROM [tbPagSeguroProduto] WHERE ([publicar] = @publicar)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="publicar" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table> 
    </section> 
</asp:Content>

