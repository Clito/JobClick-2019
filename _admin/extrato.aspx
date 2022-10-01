<%@ Page Title="" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="extrato.aspx.vb" Inherits="_admin_extrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-size: 100%;
            vertical-align: middle;
            border-style: none;
            border-color: inherit;
            border-width: 100%;
            margin: 0;
            padding: 0;
            background:;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCabec" runat="server" CssClass="titulo" 
        Text="Administração (Extrato)"></asp:Label>
    <br />
    <asp:Label ID="idSetupLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="mes" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="ano" runat="server" Visible="False"></asp:Label>
                <br />
    <asp:Label ID="EmpresaLabel" runat="server" CssClass="titulo"></asp:Label>
    <br />
    <asp:GridView ID="GridViewEmpresa" runat="server" AutoGenerateColumns="False" 
        BorderStyle="None" DataKeyNames="idsetup,idCadastroEmpresa,empresa" 
        DataSourceID="SqlEMPRESA" GridLines="Horizontal" Width="100%" 
        AllowPaging="True">
        <AlternatingRowStyle BackColor="WhiteSmoke" />
        <Columns>
            <asp:BoundField DataField="idsetup" HeaderText="idsetup" InsertVisible="False" 
                ReadOnly="True" SortExpression="idsetup" Visible="False" />
            <asp:ButtonField CommandName="Select" DataTextField="empresa" 
                HeaderText="Empresa" Text="Button" />
            <asp:BoundField DataField="empresa" HeaderText="Empresa" 
                SortExpression="empresa" Visible="False" />
            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                SortExpression="idCadastroEmpresa" Visible="False" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:Panel ID="PanelEXTRATO" runat="server" Visible="False">
        <table id="DataRange" align="left" cellpadding="2" 
    cellspacing="2">
            <tr>
                <td>
                    <asp:Label ID="mesLabel" runat="server" Text="Mês:"></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropDownListMES" runat="server" 
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
                    <asp:DropDownList ID="DropDownListANO" runat="server" 
                                    CssClass="DropCad" Width="80px">
                    </asp:DropDownList>
                </td>
                <td>
                    <br />
                    <asp:LinkButton ID="LinkButtonEXTRATO" runat="server" CssClass="button">Pesquisar</asp:LinkButton>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <br />
        <asp:GridView ID="Extrato" runat="server" AutoGenerateColumns="False" 
            BorderStyle="None" DataKeyNames="idPagSeguro,codeNotificacao,TransacaoID" 
            DataSourceID="SqlExtrato" GridLines="None" Width="100%">
            <AlternatingRowStyle BackColor="#F0F0F0" BorderStyle="None" />
            <Columns>
                <asp:BoundField DataField="codProduto" HeaderText="Produto" SortExpression="codProduto" />
                <asp:BoundField DataField="idPagSeguro" HeaderText="idPagSeguro" 
                    InsertVisible="False" ReadOnly="True" SortExpression="idPagSeguro" 
                    Visible="False" />
                <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                    SortExpression="idCadastroEmpresa" Visible="False" />
                <asp:BoundField DataField="TransacaoID" HeaderText="TransacaoID" 
                    SortExpression="TransacaoID" Visible="False" />
                <asp:BoundField DataField="nome" HeaderText="Responsável" SortExpression="nome" 
                    Visible="False" />
                <asp:BoundField DataField="ClienteEmail" HeaderText="ClienteEmail" 
                    SortExpression="ClienteEmail" Visible="False" />
                <asp:BoundField DataField="idStatus" HeaderText="idStatus" 
                    SortExpression="idStatus" Visible="False" />
                <asp:TemplateField HeaderText="Status" SortExpression="Status">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="DataTransacao" DataFormatString="{0:d}" 
                    HeaderText="Data" SortExpression="DataTransacao" />
                <asp:BoundField DataField="TipoPagamento" HeaderText="Tipo" 
                    SortExpression="TipoPagamento" />
                <asp:BoundField DataField="anotacao" HeaderText="anotacao" 
                    SortExpression="anotacao" Visible="False" />
                <asp:BoundField DataField="Creditos" HeaderText="Créditos" 
                    SortExpression="Creditos" />
                <asp:BoundField DataField="nmempresa" HeaderText="nmempresa" 
                    SortExpression="nmempresa" Visible="False" />
                <asp:BoundField DataField="liberaQtdCad" HeaderText="Saldo Atual" 
                    NullDisplayText="-" SortExpression="liberaQtdCad">
                <ItemStyle BackColor="#EEF9EE" />
                </asp:BoundField>
                <asp:BoundField DataField="ValorTransacoes" DataFormatString="{0:c}" 
                    HeaderText="Valor" SortExpression="ValorTransacoes">
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="codeNotificacao" HeaderText="codeNotificacao" 
                    SortExpression="codeNotificacao" Visible="False" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                            CommandName="Select" ImageUrl="~/images/layoutNew/btAtualizar.png" 
                            Text="Atualizar" Visible='<%# Eval("hidenButton") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="tipoProduto" HeaderText="Para:" SortExpression="tipoProduto" />
            </Columns>
            <EmptyDataTemplate>
                <table cellpadding="0" cellspacing="0">
                    <tbody class="style1" style="outline: 0;">
                        <tr>
                            <td>
                                <asp:Image ID="ImageAviso" runat="server" 
                                    ImageUrl="~/images/empresa/aviso.png" />
                            </td>
                            <td>
                                <asp:Label ID="Label51" runat="server" 
                                    Text="&lt;b&gt;Informação:&lt;/b&gt;&lt;br&gt;Não existe movimentação para este período."></asp:Label>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </EmptyDataTemplate>
        </asp:GridView>
    </asp:Panel>
    <asp:SqlDataSource ID="SqlEMPRESA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idsetup], [empresa], [idCadastroEmpresa] FROM [tbsetup]">
    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlExtrato" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="_USP_EXTRATO_ASSOCIADO" 
        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="idCadastroEmpresaLabel" 
                                Name="idCadastroEmpresa" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="idSetupLabel" Name="idSetup" 
                                PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="mes" Name="MES" PropertyName="Text" 
                                Type="Int32" />
                            <asp:ControlParameter ControlID="ano" Name="ANO" PropertyName="Text" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Content>

