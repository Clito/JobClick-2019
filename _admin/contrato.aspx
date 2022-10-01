<%@ Page Title="Administrador" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="contrato.aspx.vb" Inherits="_admin_contrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="Contrato" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
    <asp:Label ID="lblCabec" runat="server" CssClass="titulo" 
        Text="Administração (Termos e condições de uso)"></asp:Label>
    <br />
                <asp:Label ID="idSetupLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idQuizLabel" runat="server" Visible="False"></asp:Label>
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
                <br />
                <asp:GridView ID="Contrato" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="idContratoOnline" DataSourceID="SqlContrato" Width="100%" 
                    GridLines="None" Visible="False">
                    <AlternatingRowStyle BackColor="#F2F2F2" />
                    <Columns>
                        <asp:ButtonField CommandName="Select" DataTextField="Modelo" 
                            HeaderText="Termos e Condições Gerais" Text="Button" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:ButtonField>
                        <asp:BoundField DataField="idContratoOnline" HeaderText="idContratoOnline" 
                            InsertVisible="False" ReadOnly="True" SortExpression="idContratoOnline" 
                            Visible="False" />
                        <asp:BoundField DataField="idSetup" HeaderText="idSetup" 
                            SortExpression="idSetup" Visible="False" />
                        <asp:BoundField DataField="ContratoOnLine" HeaderText="ContratoOnLine" 
                            SortExpression="ContratoOnLine" Visible="False" />
                        <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" 
                            Visible="False" />
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:LinkButton ID="LinkButtonCargaTermo" runat="server" CommandName="New" 
                            CssClass="button" onclick="LinkButtonCargaTermo_Click">Carga Termo e Condições</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonRESET" runat="server" CssClass="button" 
                            onclick="LinkButtonRESET_Click">Reiniciar</asp:LinkButton>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:FormView ID="FormViewTermo" runat="server" DataKeyNames="idContratoOnline" 
                    DataSourceID="SqlContratoFORM" Width="100%">
                    <EditItemTemplate>
                        <asp:Label ID="idContratoOnlineLabel1" runat="server" 
                            Text='<%# Eval("idContratoOnline") %>' Visible="False" />
                        <br />
                        Empresa:<br />
                        <asp:TextBox ID="idSetupTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("idSetup") %>' Width="100%" />
                        <br />
                        ContratoOnLine:<br />
                        <asp:TextBox ID="ContratoOnLineTextBox" runat="server" CssClass="InputCad" 
                            Height="350px" Text='<%# Bind("ContratoOnLine") %>' TextMode="MultiLine" 
                            Width="100%" />
                        <br />
                        Modelo:<br />
                        <asp:TextBox ID="ModeloTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("Modelo") %>' Width="100%" />
                        <br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Atualizar" CssClass="button" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancelar" 
                            CssClass="button" />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="New" 
                            CssClass="button">Incluir &quot;Termo e Condições&quot;</asp:LinkButton>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        &nbsp;Empresa:<br />&nbsp;<asp:TextBox ID="idSetupTextBox" runat="server" 
                            CssClass="InputCad" Text='<%# Bind("idSetup") %>' Width="100%" />
                        <br />
                        ContratoOnLine:<br />
                        <asp:TextBox ID="ContratoOnLineTextBox" runat="server" CssClass="InputCad" 
                            Height="350px" Text='<%# Bind("ContratoOnLine") %>' TextMode="MultiLine" 
                            Width="100%" />
                        <br />
                        Modelo:<br />
                        <asp:TextBox ID="ModeloTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("Modelo") %>' Width="100%" />
                        <br />
                        &nbsp;<br />&nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Salvar" CssClass="button" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancelar" 
                            CssClass="button" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="idSetupLabel" runat="server" Text='<%# Bind("idSetup") %>' 
                            Visible="False" />
                        <br />
                        <br />
                        <asp:Label ID="ContratoOnLineLabel" runat="server" 
                            Text='<%# Bind("ContratoOnLine") %>' />
                        <br />
                        <br />
                        <asp:Label ID="ModeloLabel" runat="server" Text='<%# Bind("Modelo") %>' />
                        <br />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Editar" CssClass="button" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Excluir" CssClass="button" 
                            onclientclick="return confirm(&quot;Deseja excluir este Termo e Condição?&quot;)" />
                        &nbsp;<asp:LinkButton ID="LinkButtonFechar" runat="server" CssClass="button" 
                            onclick="LinkButtonFechar_Click">Fechar</asp:LinkButton>
                        &nbsp;
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlContrato" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    DeleteCommand="DELETE FROM [tbContratoOnLine] WHERE [idContratoOnline] = @idContratoOnline" 
                    InsertCommand="INSERT INTO [tbContratoOnLine] ([idSetup], [ContratoOnLine], [Modelo]) VALUES (@idSetup, @ContratoOnLine, @Modelo)" 
                    SelectCommand="SELECT [idContratoOnline], [idSetup], [ContratoOnLine], [Modelo] FROM [tbContratoOnLine] WHERE ([idSetup] = @idSetup)" 
                    UpdateCommand="UPDATE [tbContratoOnLine] SET [idSetup] = @idSetup, [ContratoOnLine] = @ContratoOnLine, [Modelo] = @Modelo WHERE [idContratoOnline] = @idContratoOnline">
                    <DeleteParameters>
                        <asp:Parameter Name="idContratoOnline" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idSetup" Type="Int32" />
                        <asp:Parameter Name="ContratoOnLine" Type="String" />
                        <asp:Parameter Name="Modelo" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="idSetupLabel" Name="idSetup" 
                            PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idSetup" Type="Int32" />
                        <asp:Parameter Name="ContratoOnLine" Type="String" />
                        <asp:Parameter Name="Modelo" Type="String" />
                        <asp:Parameter Name="idContratoOnline" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlContratoFORM" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    DeleteCommand="DELETE FROM [tbContratoOnLine] WHERE [idContratoOnline] = @idContratoOnline" 
                    InsertCommand="INSERT INTO [tbContratoOnLine] ([idSetup], [ContratoOnLine], [Modelo]) VALUES (@idSetup, @ContratoOnLine, @Modelo)" 
                    SelectCommand="SELECT [idContratoOnline], [idSetup], [ContratoOnLine], [Modelo] FROM [tbContratoOnLine] WHERE ([idContratoOnline] = @idContratoOnline)" 
                    UpdateCommand="UPDATE [tbContratoOnLine] SET [idSetup] = @idSetup, [ContratoOnLine] = @ContratoOnLine, [Modelo] = @Modelo WHERE [idContratoOnline] = @idContratoOnline">
                    <DeleteParameters>
                        <asp:Parameter Name="idContratoOnline" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idSetup" Type="Int32" />
                        <asp:Parameter Name="ContratoOnLine" Type="String" />
                        <asp:Parameter Name="Modelo" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Contrato" Name="idContratoOnline" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idSetup" Type="Int32" />
                        <asp:Parameter Name="ContratoOnLine" Type="String" />
                        <asp:Parameter Name="Modelo" Type="String" />
                        <asp:Parameter Name="idContratoOnline" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlEMPRESA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idsetup], [empresa], [idCadastroEmpresa] FROM [tbsetup]">
    </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>

