<%@ Page Title="" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="cargaTipoVaga.aspx.vb" Inherits="_admin_cargaTipoVaga" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCabec" runat="server" CssClass="titulo" 
        Text="Administração (Tipo contratação) para as vagas"></asp:Label>
    <br />
    <asp:Label ID="idSetupLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idTipoVagaLabel" runat="server" Visible="False"></asp:Label>
    <br />
    <asp:Label ID="EmpresaLabel" runat="server" CssClass="titulo"></asp:Label>
    <br />
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
    <asp:Panel ID="PanelCARGARESET" runat="server" Visible="False">
        <br />
        <asp:LinkButton ID="LinkButtonCARGATIPO" runat="server" CommandName="New" 
                CssClass="button" 
            onclientclick="return confirm(&quot;Este procedimento irá substituir todos os registros gravados para esta empresa, está certo disso?&quot;)">Carga completa Tipo da Vaga</asp:LinkButton>
        <asp:LinkButton ID="LinkButtonRESET" runat="server" CssClass="button" 
                onclick="LinkButtonRESET_Click">Reiniciar</asp:LinkButton>
        <br />
        <br />
    </asp:Panel>
    <br />
    <asp:FormView ID="FormViewTIPO" runat="server" DataKeyNames="idTipoVaga" 
        DataSourceID="SqlTIPOVAGAFORM">
        <EditItemTemplate>
            <asp:Label ID="idTipoVagaLabel1" runat="server" 
                Text='<%# Eval("idTipoVaga") %>' Visible="False" />
            <asp:TextBox ID="idSetupTextBox" runat="server" Text='<%# Bind("idSetup") %>' 
                Visible="False" Width="10px" />
            <br />
            <br />
            Tipo de contratação:<br />
            <asp:TextBox ID="dsTipoVAgaTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("dsTipoVAga") %>' />
            <br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" CssClass="button" Text="Atualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" CssClass="button" 
                Text="Cancelar" />
            <br />
            <br />
        </EditItemTemplate>
        <InsertItemTemplate>
            <asp:Label ID="idTipoVagaLabel1" runat="server" 
                Text='<%# Eval("idTipoVaga") %>' Visible="False" />
            <asp:TextBox ID="idSetupTextBox" runat="server" Text='<%# Bind("idSetup") %>' 
                Visible="False" Width="10px" />
            <br />
            <br />
            Tipo de contratação:<br />
            <asp:TextBox ID="dsTipoVAgaTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("dsTipoVAga") %>' />
            <br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" CssClass="button" Text="Salvar" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                CommandName="Cancel" CssClass="button" Text="Cancelar" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Label ID="idTipoVagaLabel" runat="server" Text='<%# Eval("idTipoVaga") %>' 
                Visible="False" />
            <asp:Label ID="idSetupLabel" runat="server" Text='<%# Bind("idSetup") %>' 
                Visible="False" />
            <br />
            <asp:Label ID="dsTipoVAgaLabel" runat="server" CssClass="titulo" 
                Text='<%# Bind("dsTipoVAga") %>' />
            <br />
            <br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" CssClass="button" Text="Editar" />
&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" CssClass="button" 
                onclientclick="return confirm(&quot;Deseja excluir este tipo de contratação?&quot;)" 
                Text="Excluir" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" CssClass="button" Text="Novo tipo de tipo de contratação" />
            <br />
            <br />
        </ItemTemplate>
    </asp:FormView>
    <asp:GridView ID="GridViewTipoVaga" runat="server" AutoGenerateColumns="False" 
        BorderStyle="None" DataKeyNames="idTipoVaga" DataSourceID="SqlTIPOVAGA" 
        GridLines="Horizontal" Width="100%">
        <AlternatingRowStyle BackColor="WhiteSmoke" />
        <Columns>
            <asp:BoundField DataField="idTipoVaga" HeaderText="idTipoVaga" 
                InsertVisible="False" ReadOnly="True" SortExpression="idTipoVaga" 
                Visible="False" />
            <asp:BoundField DataField="idSetup" HeaderText="idSetup" 
                SortExpression="idSetup" Visible="False" />
            <asp:BoundField DataField="dsTipoVAga" HeaderText="Tipo da Vaga" 
                SortExpression="dsTipoVAga" Visible="False" />
            <asp:ButtonField CommandName="Select" DataTextField="dsTipoVAga" 
                HeaderText="Tipo de Vaga" Text="Button" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlEMPRESA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idsetup], [empresa], [idCadastroEmpresa] FROM [tbsetup]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlTIPOVAGA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idTipoVaga], [idSetup], [dsTipoVAga] FROM [tbTipoVaga] WHERE ([idSetup] = @idSetup)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idSetupLabel" Name="idSetup" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlTIPOVAGAFORM" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="DELETE FROM [tbTipoVaga] WHERE [idTipoVaga] = @idTipoVaga" 
        InsertCommand="INSERT INTO [tbTipoVaga] ([idSetup], [dsTipoVAga]) VALUES (@idSetup, @dsTipoVAga)" 
        SelectCommand="SELECT [idTipoVaga], [idSetup], [dsTipoVAga] FROM [tbTipoVaga] WHERE ([idTipoVaga] = @idTipoVaga)" 
        UpdateCommand="UPDATE [tbTipoVaga] SET [idSetup] = @idSetup, [dsTipoVAga] = @dsTipoVAga WHERE [idTipoVaga] = @idTipoVaga">
        <DeleteParameters>
            <asp:Parameter Name="idTipoVaga" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="idSetup" Type="Int32" />
            <asp:Parameter Name="dsTipoVAga" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="idTipoVagaLabel" Name="idTipoVaga" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="idSetup" Type="Int32" />
            <asp:Parameter Name="dsTipoVAga" Type="String" />
            <asp:Parameter Name="idTipoVaga" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

