<%@ Page Title="" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="false" CodeFile="mailingEmpresa.aspx.vb" Inherits="_admin_mailingEmpresa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table id="mailing" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td><asp:Label ID="lblCabec" runat="server" CssClass="titulo" Text="Mailing Empresas cadastradas no Jobclick"></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownListACESSO" runat="server" AutoPostBack="True" CssClass="DropCad" DataSourceID="SqlDataSourceACESSO" DataTextField="idTypeUser" DataValueField="idTypeUser">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="ATENÇÃO: Informe qual campanha será enviado para a base!"></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownListCAMPANHA" runat="server" CssClass="DropCad" DataSourceID="SqlDataSourceCAMPANHA" DataTextField="Nome_Campanha" DataValueField="idCampanha">
                </asp:DropDownList>
                <br />
                <br />
                <table cellpadding="10" cellspacing="10">
                    <tr>
                        <td>
                <asp:RadioButtonList ID="RadioButtonListMARCAR" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">Marcar todos</asp:ListItem>
                    <asp:ListItem Value="0">Desmarcar todos</asp:ListItem>
                </asp:RadioButtonList>
                        </td>
                        <td><asp:LinkButton ID="LinkButtonMARCAR" runat="server" CssClass="button">Ok</asp:LinkButton>
                            </td>
                        <td>
                            <asp:LinkButton ID="LinkButtonENVIAR" runat="server" CssClass="button">Enviar para os selecionados</asp:LinkButton>
                            </td>
                    </tr>
                </table>
                <asp:Label ID="TotalEmailsEnviadosLabel" runat="server"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridViewLISTAENVIO" runat="server" AutoGenerateColumns="False" DataKeyNames="idUser,idTypeUser,idCadastroEmpresa" DataSourceID="SqlDataSourceLISTAEMPRESAS" Width="100%">
                    <AlternatingRowStyle BackColor="#F3F3F3" />
                    <Columns>
                        <asp:BoundField DataField="emailRes" HeaderText="Email" SortExpression="emailRes" />
                        <asp:BoundField DataField="url" HeaderText="url" SortExpression="url" Visible="False" />
                        <asp:BoundField DataField="idTypeUser" HeaderText="idTypeUser" ReadOnly="True" SortExpression="idTypeUser" Visible="False" />
                        <asp:BoundField DataField="nomeRes" HeaderText="Nome" SortExpression="nomeRes" />
                        <asp:TemplateField HeaderText="Enviar" SortExpression="sendMail">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("sendMail") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("sendMail") %>' Enabled="False" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:ButtonField CommandName="Select" HeaderText="Alterar" Text="Alterar">
                        <ItemStyle Width="50px" />
                        </asp:ButtonField>
                        <asp:BoundField DataField="idsetup" HeaderText="S" InsertVisible="False" SortExpression="idsetup" />
                        <asp:BoundField DataField="idCadastroUser" HeaderText="C" InsertVisible="False" SortExpression="idCadastroUser" />
                        <asp:BoundField DataField="idUser" HeaderText="U" InsertVisible="False" ReadOnly="True" SortExpression="idUser" />
                        <asp:BoundField DataField="idCadastroEmpresa" HeaderText="E" InsertVisible="False" ReadOnly="True" SortExpression="idCadastroEmpresa" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceLISTAEMPRESAS" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB_Mailing %>" SelectCommand="USP_LISTA_MAIL_BASE_EMPRESA" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListACESSO" Name="idTypeUser" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceACESSO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="SELECT [idTypeUser] FROM [tbuserType]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCAMPANHA" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB_Mailing %>" SelectCommand="SELECT [idCampanha], [Nome_Campanha] FROM [Campanha]"></asp:SqlDataSource>
                <br />
            </td>
        </tr>
    </table>

</asp:Content>

