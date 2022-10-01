<%@ Control Language="VB" AutoEventWireup="false" CodeFile="pesquisaFormaca.ascx.vb" Inherits="App_Include_pesquisaFormaca" %>

<table id="psq" runat="server" border="0" cellpadding="0" cellspacing="0" style="width: 100%"
    visible="true">
    <tr>
        <td style="padding-right: 0px; padding-left: 0px; padding-bottom: 0px; margin: 0px;
            width: 100%; padding-top: 0px; background-color: #fdfdfd">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/pesquisa.gif" /></td>
                    <td>
                        Encontre aqui sua instituição educacional:</td>
                </tr>
            </table>
            <table runat="server" id="mypsq" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:TextBox ID="psqTextBox" runat="server" AutoPostBack="True" CausesValidation="True"
                            CssClass="InputCad" Width="248px" ValidationGroup="psqFormacao"></asp:TextBox><asp:Image ID="Image2" runat="server"
                                ImageUrl="~/images/5px.gif" /></td>
                    <td>
                        <asp:ImageButton ID="psqBT" runat="server" ImageUrl="~/images/candidato/btpesquisar.gif" ValidationGroup="psqFormacao" /></td>
                </tr>
            </table>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="psqTextBox"
                Display="Dynamic" ErrorMessage="* Inicie sua pesquisa com no mínimo 5 caracteres"
                SetFocusOnError="True" ValidationExpression="^[a-zA-Z0-9!¡$%&/\()=?¿*+-_{};:,áéíóú'.\s][^>][^<]{3,50}$" ValidationGroup="psqFormacao"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator7" runat="server" ControlToValidate="psqTextBox" Display="Dynamic"
                    ErrorMessage="* Inicie sua pesquisa com no mínimo 5 caracteres" ValidationGroup="psqFormacao"></asp:RequiredFieldValidator><br />
            <asp:GridView ID="GridViewPsq" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" CellPadding="2"
                CellSpacing="2" DataKeyNames="idInstituicao" DataSourceID="SQLpsqInst" GridLines="Horizontal"
                PageSize="4" Width="350px">
                <PagerSettings Position="Top" />
                <Columns>
                    <asp:BoundField DataField="idInstituicao" HeaderText="idInstituicao" InsertVisible="False"
                        ReadOnly="True" SortExpression="idInstituicao" Visible="False" />
                    <asp:BoundField DataField="identidadeTipo" HeaderText="identidadeTipo" SortExpression="identidadeTipo"
                        Visible="False" />
                    <asp:BoundField DataField="dsTipo" HeaderText="Grau" SortExpression="dsTipo">
                        <ItemStyle Width="80px" />
                    </asp:BoundField>
                    <asp:HyperLinkField DataNavigateUrlFields="idInstituicao" DataNavigateUrlFormatString="formacao.aspx?idInstituicao={0}"
                        DataTextField="dsinstituicao" HeaderText="Institui&#231;&#227;o" Visible="False">
                        <ItemStyle Width="200px" />
                    </asp:HyperLinkField>
                    <asp:BoundField DataField="dsinstituicao" HeaderText="Institui&#231;&#227;o" SortExpression="dsinstituicao">
                        <ItemStyle BackColor="MistyRose" BorderColor="Gainsboro" Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="estado" HeaderText="Cidade" SortExpression="estado">
                        <ItemStyle Width="80px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="uf" HeaderText="UF" SortExpression="uf">
                        <ItemStyle Width="20px" />
                    </asp:BoundField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Select"
                                ImageUrl="~/images/selectRow.gif" Text="Select" />
                        </ItemTemplate>
                        <ItemStyle Width="20px" />
                    </asp:TemplateField>
                </Columns>
                <RowStyle VerticalAlign="Top" />
                <EmptyDataTemplate>
                    Se você não encontrar a sua instituição educacional em sua pesquisa, tente utilizar
                    partes do nome da entidade separado por espaço.<br />
                    <br />
                    <b>Obs.:</b><br />
                    Use no mínimo 5 (cinco) caracteres para sua pesquisa.
                    <br />
                    <br />
                    Se mesmo assim você ainda não localizar, [<a href='faq.aspx'>clique aqui</a>] e
                    envie-nos seus dados para que possamos inclui-la em nosso banco de dados.<br />
                    <br />
                    <b>Obrigado.</b><br />
                    Administração
                </EmptyDataTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <AlternatingRowStyle BackColor="WhiteSmoke" />
            </asp:GridView>
            <asp:Label ID="resPsq" runat="server"></asp:Label>
            <asp:Label ID="msn" runat="server" CssClass="msn"></asp:Label><br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="DropCad">
            </asp:DropDownList><br />
            <br />
            <asp:SqlDataSource ID="SQLpsqInst" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                SelectCommand="spGetEntidadeEnsino" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="psqTextBox" Name="buscador"
                        PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
