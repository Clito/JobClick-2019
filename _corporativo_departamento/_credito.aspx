<%@ Page Title="" Language="VB" MasterPageFile="~/_corporativo_departamento/corporativoPage.master" AutoEventWireup="false" CodeFile="_credito.aspx.vb" Inherits="_empresaJC_credito" %>

<%@ Register assembly="UOL.PagSeguro" namespace="UOL.PagSeguro" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table cellpadding="0" cellspacing="0" align="center" width="100%">
            <tr>
                <td width="26">
                    <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" />
                </td>
                <td>
                   <table cellpadding="0" cellspacing="0" id="BodyInterno" width="900px" align="center">
                        <tr>
                            <td valign="top">
                                &nbsp;</td>
                            <td>
                                <br />
                                <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
                                <br />
                                <cc1:VendaPagSeguro ID="VendaPagSeguroCredito" runat="server" 
                                    UrlPagSeguro="http://localhost:9090/security/webpagamentos/webpagto.aspx" 
                                    Comportamento="NovaPagina">
                                </cc1:VendaPagSeguro>
                                <br />
                    <asp:GridView ID="GridViewPRODUTOS" runat="server" AutoGenerateColumns="False" 
                        BorderStyle="None" DataKeyNames="ID,Produto,codProduto,qtd,preco" 
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
                                        <asp:Label ID="precoLabel" runat="server" CssClass="textBold" 
                                            Text='<%# Eval("preco", "{0:C}") %>' />
                                        <asp:Label ID="Labeldt" runat="server" Text='<%# Eval("byMes") %>' 
                                            CssClass="textoGeral"></asp:Label>
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
                                            CssClass="button">Comprar</asp:LinkButton>
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
                                <asp:SqlDataSource ID="SqlDataSourcePRODUTOS" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_PRODUTO_JOBCLICK" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="" Name="idCadastroEmpresa_PAI" 
                                            SessionField="idCadastroEmpresa_layout" Type="Int32" />
                                        <asp:Parameter DefaultValue="1" Name="SMS" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:Image ID="Image2" runat="server" 
                        ImageUrl="~/_corporativo/images/pagsegurorp.png" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
</asp:Content>

