<%@ Page Title="" Language="VB" MasterPageFile="~/_corporativo/corporativoPage.master" AutoEventWireup="false" CodeFile="_creditoAssociado.aspx.vb" Inherits="_empresaJC_loja" %>

<%@ Register assembly="UOL.PagSeguro" namespace="UOL.PagSeguro" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '150', position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>
                                <cc1:VendaPagSeguro ID="VendaPagSeguroCredito" runat="server" 
                                    UrlPagSeguro="https://pagseguro.uol.com.br/checkout/checkout.jhtml" 
                                    Comportamento="NovaPagina">
                                </cc1:VendaPagSeguro>
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
    <br />
  
    <table id="BodyInterno" runat="server" border="0" cellpadding="0" cellspacing="0" visible="true" align="center" width="930px">
        <tr>
            <td valign="top" width="30">
                <asp:Image ID="lateral1" runat="server" ImageUrl="~/images/h26.gif" />
            </td>
            <td valign="top" width="900" align="left">
                    <asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
                    <br />
                    <asp:Label ID="idCadastroEmpresa_layoutLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
                    <br />
                    <br />
                    <asp:GridView ID="GridViewPRODUTOS" runat="server" AutoGenerateColumns="False" 
                        BorderStyle="None" DataKeyNames="ID,Produto,codProduto,qtd,preco,idProduto" 
                        DataSourceID="SqlDataSourcePRODUTOS" GridLines="Horizontal" ShowHeader="False" 
                        Width="800px" BorderColor="#CCCCCC">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="ID" Visible="False" />
                            <asp:BoundField DataField="idProduto" HeaderText="idProduto" 
                                SortExpression="idProduto" Visible="False" />
                            <asp:TemplateField HeaderText="Produto" SortExpression="Produto">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Produto") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>

                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="250" valign="top">
                                        <asp:Image ID="ImagePRODUTO" runat="server" ImageUrl='<%# Eval("imagem") %>' 
                                            ToolTip='<%# Eval("Produto") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="ProdutoLabel" runat="server" CssClass="tituloEmpresa" 
                                            Text='<%# Eval("Produto") %>' />
                                        <br />
                                        <br />
                                        <asp:Label ID="Labelcodigo" runat="server" CssClass="cur01st" Text="Código: "></asp:Label>
                                        <asp:Label ID="codProdutoLabel" runat="server" 
                                            Text='<%# Eval("codProduto") %>' CssClass="textoGeral" />
                                        <br />
                                        <br />
                                        <asp:Label ID="dsProdutoLabel" runat="server" Text='<%# Eval("dsProduto") %>' 
                                            CssClass="textoGeral" />
                                        <br />
                                        <br />
                                        <asp:Label ID="Label1" runat="server" Text="Valor unitário: "></asp:Label>
                                        <asp:Label ID="precoLabel" runat="server" CssClass="textBold" 
                                            Text='<%# Eval("preco", "{0:C}") %>' />
                                        <asp:Label ID="Labeldt" runat="server" Text='<%# Eval("byMes") %>' 
                                            CssClass="textoGeral"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="LabelTOTAL" runat="server" CssClass="textoApresentaNOMECV" Text='<%# Eval("precoTOTAL", "{0:C}") %>'></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="entregaLabel" runat="server" Text='<%# Eval("entrega") %>' 
                                            CssClass="textoGeral" />
                                        <br />
                                        <asp:Label ID="qtdLabel" runat="server" Text='<%# Eval("qtd") %>' 
                                            Visible="False" CssClass="textoGeral"></asp:Label>
                                        <br />
                                        <asp:Label ID="formaPagamenoLabel" runat="server" 
                                            Text='<%# Eval("formaPagameno") %>' CssClass="textoGeral" />
                                        <br />
                                        <br />
                                        <asp:LinkButton ID="LinkButtonComprar" runat="server" CommandName="Select" 
                                            CssClass="button" OnClientClick="return confirm(&quot;Você será redirecionado para o nosso parceiro de cobrança na Web, veja se seu navegador está configurado para liberar a abertura de popup antes de proceguir.&quot;)">Comprar</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButtonVoltar" runat="server" CssClass="button" OnClick="LinkButtonVoltar_Click" ToolTip="Clique aqui para voltar para o extrato.">Voltar</asp:LinkButton>
                                        <br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                            </table>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="codProduto" HeaderText="codProduto" 
                                SortExpression="codProduto" Visible="False" />
                            <asp:BoundField DataField="dsProduto" HeaderText="dsProduto" 
                                SortExpression="dsProduto" Visible="False" />
                            <asp:BoundField DataField="qtd" HeaderText="qtd" SortExpression="qtd" 
                                Visible="False" />
                            <asp:BoundField DataField="preco" HeaderText="preco" SortExpression="preco" 
                                Visible="False" />
                            <asp:BoundField DataField="formaPagameno" HeaderText="formaPagameno" 
                                SortExpression="formaPagameno" Visible="False" />
                            <asp:BoundField DataField="entrega" HeaderText="entrega" 
                                SortExpression="entrega" Visible="False" />
                            <asp:BoundField DataField="imagem" HeaderText="imagem" SortExpression="imagem" 
                                Visible="False" />
                            <asp:BoundField DataField="publicar" HeaderText="publicar" 
                                SortExpression="publicar" Visible="False" />
                            <asp:BoundField DataField="byMes" HeaderText="byMes" SortExpression="byMes" 
                                Visible="False" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <br />
                    <table id="bannerPagSeguro" cellpadding="0" cellspacing="0" width="900">
                        <tr>
                            <td align="right">
                                <asp:Image ID="Image2" runat="server" 
                                    ImageUrl="~/_corporativo/images/pagsegurorp.png" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSourcePRODUTOS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="_USP_PRODUTO_JOBCLICK" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idCadastroEmpresa_PAI" 
                                SessionField="idCadastroEmpresa_layout" Type="Int32" />
                            <asp:Parameter Name="SMS" Type="Int32" DefaultValue="0" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table> 
</asp:Content>

