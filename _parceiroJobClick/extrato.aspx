<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="extrato.aspx.vb" Inherits="_parceiroJobClick_extrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Extrato"></asp:Label>
<asp:Panel ID="EXTRATO" runat="server">
        <div id="EXTRATORes">        
            <div id="APRESENTAEXTRATO">
                <br />
                <asp:Label ID="LabelCabecExtrato" runat="server" CssClass="titulo"></asp:Label>
                <asp:Label ID="mes" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="ano" runat="server" Visible="False"></asp:Label>
                <br />
                <asp:Label ID="Label" runat="server" CssClass="legenda" Text="Período:"></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownListMES" runat="server" AutoPostBack="True" CssClass="DropCad" Width="150px">
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
                <asp:DropDownList ID="DropDownListANO" runat="server" AutoPostBack="True" CssClass="DropCad" Width="80px">
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2015</asp:ListItem>
                </asp:DropDownList>

                            <asp:GridView ID="ExtratoEmpresa" runat="server" AutoGenerateColumns="False" BorderStyle="None" CssClass="mGrid" DataSourceID="SqlExtrato" GridLines="None" Width="100%">
                                <AlternatingRowStyle BackColor="#F0F0F0" BorderStyle="None" CssClass="alt" />
                                <Columns>
                                    <asp:BoundField DataField="idUsuario" HeaderText="idUsuario" SortExpression="idUsuario" Visible="False" />
                                    <asp:BoundField DataField="REF_COD" HeaderText="Código" SortExpression="REF_COD" ReadOnly="True" Visible="False" />
                                    <asp:BoundField DataField="Nome" HeaderText="Responsável" SortExpression="Nome" ReadOnly="True" />
                                    <asp:BoundField DataField="dataMovimentacao" HeaderText="Data" SortExpression="dataMovimentacao" ReadOnly="True" />
                                    <asp:TemplateField HeaderText="Descrição" SortExpression="dsMovimentacao">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dsMovimentacao") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("dsMovimentacao") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="tipoMovimentacao" HeaderText="Tipo" SortExpression="tipoMovimentacao" />
                                    <asp:BoundField DataField="valor" HeaderText="Valor" SortExpression="valor" DataFormatString="{0:N}" >
                                    <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <asp:Label ID="Label25" runat="server" Text="Não existe movimentação neste período."></asp:Label>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:Label ID="LabelLeganda0" runat="server" CssClass="legenda" Text="Legenda:"></asp:Label>
                            <br />
                            <asp:Label ID="LabelLegenda" runat="server" CssClass="legenda" Text="&lt;b&gt;A&lt;/b&gt; = Aguardando confirmação de pagamento | &lt;b&gt;C&lt;/b&gt; = Crédito Liberado | &lt;b&gt;S&lt;/b&gt; = Saldo | &lt;b&gt;D&lt;/b&gt; = Débito | &lt;b&gt;E&lt;/b&gt; = Estorno | &lt;b&gt;B&lt;/b&gt; = Bônus"></asp:Label>

                <br />
                <br />
                <asp:SqlDataSource ID="SqlExtrato" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="USP_RELATORIO_GERAL_MENSAL" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="mes" Name="MES" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="ano" Name="ANO" PropertyName="Text" Type="Int32" />
                        <asp:SessionParameter Name="REF_COD" SessionField="idUser" Type="String" />
                        <asp:SessionParameter Name="idUsuario" SessionField="idUser" Type="Int32" />
                        <asp:SessionParameter Name="idsetup" SessionField="idSetup" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
        </div>
     </asp:Panel>
        </div>
    </div>
</asp:Content>

