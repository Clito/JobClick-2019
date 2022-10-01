<%@ Page Title="" Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="_extrato.aspx.vb" Inherits="_candidato_extrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
<table cellpadding="0" cellspacing="0" id="BodyInterno" width="900px" align="center">
            <tr>
                <td width="26"></td>
                <td width="874">
                    <br />
                    <asp:Label ID="mes" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="ano" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="TransacaoIDLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="emailAdminLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="tokenLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="URLLabel" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <table cellpadding="0" cellspacing="0" id="Table1" width="930px" align="center">
            <tr>
                <td width="26"></td>
                <td width="874">
                    <table id="DataRange" align="left" cellpadding="2" cellspacing="2">
                        <tr>
                            <td>
                                <asp:Label ID="mesLabel" runat="server" Text="Mês:"></asp:Label>
                                <br />
                                <asp:DropDownList ID="DropDownListMES" runat="server" AutoPostBack="True" 
                                    CssClass="DropCad" Width="150px">
                                    <asp:ListItem Value="1">Janeiro</asp:ListItem>
                                    <asp:ListItem Value="2">Fevereiro</asp:ListItem>
                                    <asp:ListItem Value="3">Março</asp:ListItem>
                                    <asp:ListItem Value="4">Abril</asp:ListItem>
                                    <asp:ListItem Value="5">Maio</asp:ListItem>
                                    <asp:ListItem Value="6">Junho</asp:ListItem>
                                    <asp:ListItem Value="7">Julho</asp:ListItem>
                                    <asp:ListItem Value="8">Agosto</asp:ListItem>
                                    <asp:ListItem Value="9">Setembro</asp:ListItem>
                                    <asp:ListItem Value="10">Outubro</asp:ListItem>
                                    <asp:ListItem Value="11">Novembro</asp:ListItem>
                                    <asp:ListItem Value="12">Dezembro</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Label ID="anoLabel" runat="server" Text="Ano:"></asp:Label>
                                <br />
                                <asp:DropDownList ID="DropDownListANO" runat="server" AutoPostBack="True" 
                                    CssClass="DropCad" Width="80px">
                                    <asp:ListItem>2011</asp:ListItem>
                                    <asp:ListItem>2012</asp:ListItem>
                                    <asp:ListItem>2013</asp:ListItem>
                                    <asp:ListItem>2014</asp:ListItem>
                                    <asp:ListItem>2015</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <br />
                    <asp:LinkButton ID="LinkButtonAssinatura" runat="server" CssClass="button" ToolTip="Clique aqui comprar uma assinatura ou fazer sua renovação.">Assinatura / Renovação</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
                    <asp:GridView ID="Extrato" runat="server" AutoGenerateColumns="False" 
                        BorderStyle="None" DataKeyNames="idPagSeguro,codeNotificacao,TransacaoID" DataSourceID="SqlExtrato" 
                        GridLines="None" Width="100%">
                        <AlternatingRowStyle BackColor="#F0F0F0" BorderStyle="None" />
                        <Columns>
                            <asp:BoundField DataField="idPagSeguro" HeaderText="idPagSeguro" 
                                InsertVisible="False" ReadOnly="True" SortExpression="idPagSeguro" 
                                Visible="False" />
                            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                SortExpression="idCadastroEmpresa" Visible="False" />
                            <asp:BoundField DataField="idCadastroUser" HeaderText="idCadastroUser" SortExpression="idCadastroUser" Visible="False" />
                            <asp:BoundField DataField="TransacaoID" HeaderText="TransacaoID" 
                                SortExpression="TransacaoID" Visible="False" />
                            <asp:BoundField DataField="nome" HeaderText="Responsável" SortExpression="nome" 
                                Visible="False" />
                            <asp:BoundField DataField="ClienteEmail" HeaderText="ClienteEmail" 
                                SortExpression="ClienteEmail" Visible="False" />
                            <asp:BoundField DataField="idStatus" HeaderText="idStatus" 
                                SortExpression="idStatus" Visible="False" />
                            <asp:TemplateField HeaderText="Produto" SortExpression="codProduto">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("codProduto") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("codProduto") %>' ToolTip='<%# Eval("dsProduto") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="DataTransacao" HeaderText="Data" SortExpression="DataTransacao" DataFormatString="{0:d}" >
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TipoPagamento" HeaderText="Tipo" 
                                SortExpression="TipoPagamento" >
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="anotacao" HeaderText="anotacao" 
                                SortExpression="anotacao" Visible="False" />
                            <asp:BoundField DataField="Creditos" HeaderText="Crédito (em dias)" 
                                SortExpression="Creditos" >
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="nmempresa" HeaderText="nmempresa" 
                                SortExpression="nmempresa" Visible="False" />
                            <asp:BoundField DataField="liberaQtdCad" HeaderText="Saldo Atual (em dias)" 
                                SortExpression="liberaQtdCad" NullDisplayText="-" >
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle BackColor="#EEF9EE" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ValorTransacoes" DataFormatString="{0:c}" 
                                HeaderText="Valor" SortExpression="ValorTransacoes" >
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="codeNotificacao" HeaderText="codeNotificacao" 
                                SortExpression="codeNotificacao" Visible="False" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                        CommandName="Select" ImageUrl="~/images/layoutNew/btAtualizar.png" 
                                        Text="Atualizar" Visible='False' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <br />
                    <table id="SMSSaldo" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="left">
                                &nbsp;</td>
                            <td align="right">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                    <asp:Label ID="xmlLabel" runat="server"></asp:Label>
                    <br />
                </td>
            </tr>
        </table>
    <br />
    <asp:SqlDataSource ID="SqlExtrato" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="_USP_EXTRATO_CANDIDATO_ASSOCIADO" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa_layout" 
                                Type="Int32" />
            <asp:SessionParameter Name="idCadastroUser" SessionField="idCadastroUser" Type="Int32" />
            <asp:ControlParameter ControlID="mes" Name="MES" PropertyName="Text" 
                                Type="Int32" />
            <asp:ControlParameter ControlID="ano" Name="ANO" PropertyName="Text" 
                                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

