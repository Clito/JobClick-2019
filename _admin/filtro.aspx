<%@ Page Title="" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="filtro.aspx.vb" Inherits="_admin_filtro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCabec" runat="server" CssClass="titulo" 
        Text="Administração (Filtros Dinâmicos)"></asp:Label>
    <br />
                <asp:Label ID="idSetupLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idFiltroDinamicoXML_LiberadoLabel" runat="server" 
        Visible="False"></asp:Label>
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
    <asp:FormView ID="FormViewFiltro" runat="server" 
        DataKeyNames="idFiltroDinamicoXML_Liberado" DataSourceID="SqlFiltroFORM" 
        Width="100%">
        <EditItemTemplate>
            <asp:TextBox ID="idSetupTextBox" runat="server" Text='<%# Bind("idSetup") %>' 
                Visible="False" Width="10px" />
            <br />
            dsFiltroDinamico:<br />
            <asp:TextBox ID="dsFiltroDinamicoTextBox" runat="server" 
                Text='<%# Bind("dsFiltroDinamico") %>' CssClass="InputCad" />
            <br />
            refTabela:<br />
            <asp:TextBox ID="refTabelaTextBox" runat="server" 
                Text='<%# Bind("refTabela") %>' CssClass="InputCad" />
            <br />
            refTabelaNivel:<br />
            <asp:TextBox ID="refTabelaNivelTextBox" runat="server" 
                Text='<%# Bind("refTabelaNivel") %>' CssClass="InputCad" />
            <br />
            tabela:<br />
            <asp:TextBox ID="tabelaTextBox" runat="server" Text='<%# Bind("tabela") %>' 
                CssClass="InputCad" />
            <br />
            tabelaNivel:<br />
            <asp:TextBox ID="tabelaNivelTextBox" runat="server" 
                Text='<%# Bind("tabelaNivel") %>' CssClass="InputCad" />
            <br />
            modelo:<br />
            <asp:TextBox ID="modeloTextBox" runat="server" Text='<%# Bind("modelo") %>' 
                CssClass="InputCad" />
            <br />
            panel:<br />
            <asp:TextBox ID="panelTextBox" runat="server" Text='<%# Bind("panel") %>' 
                CssClass="InputCad" />
            <br />
            dataPublicacao:<br />
            <asp:TextBox ID="dataPublicacaoTextBox" runat="server" 
                Text='<%# Bind("dataPublicacao") %>' CssClass="InputCad" />
            <br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Salvar" CssClass="button" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" 
                CssClass="button" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            <asp:LinkButton ID="LinkButtonCARGA" runat="server" CssClass="button" 
                onclick="LinkButtonCARGA_Click" 
                onclientclick="return confirm(&quot;Quer dar a carga?&quot;)" 
                ToolTip="Carga dos filtros dinâmicos">Carga</asp:LinkButton>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <asp:TextBox ID="idSetupTextBox" runat="server" Text='<%# Bind("idSetup") %>' 
                Visible="False" Width="10px" />
            <br />
            dsFiltroDinamico:<br />
            <asp:TextBox ID="dsFiltroDinamicoTextBox" runat="server" 
                Text='<%# Bind("dsFiltroDinamico") %>' CssClass="InputCad" />
            <br />
            refTabela:<br />
            <asp:TextBox ID="refTabelaTextBox" runat="server" 
                Text='<%# Bind("refTabela") %>' CssClass="InputCad" />
            <br />
            refTabelaNivel:<br />
            <asp:TextBox ID="refTabelaNivelTextBox" runat="server" 
                Text='<%# Bind("refTabelaNivel") %>' CssClass="InputCad" />
            <br />
            tabela:<br />
            <asp:TextBox ID="tabelaTextBox" runat="server" 
                Text='<%# Bind("tabela") %>' CssClass="InputCad" />
            <br />
            tabelaNivel:<br />
            <asp:TextBox ID="tabelaNivelTextBox" runat="server" 
                Text='<%# Bind("tabelaNivel") %>' CssClass="InputCad" />
            <br />
            modelo:<br />
            <asp:TextBox ID="modeloTextBox" runat="server" 
                Text='<%# Bind("modelo") %>' CssClass="InputCad" />
            <br />
            panel:<br />
            <asp:TextBox ID="panelTextBox" runat="server" Text='<%# Bind("panel") %>' 
                CssClass="InputCad" />
            <br />
            dataPublicacao:<br />
            <asp:TextBox ID="dataPublicacaoTextBox" runat="server" 
                Text='<%# Bind("dataPublicacao") %>' CssClass="InputCad" />
            <br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Salvar" CssClass="button" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" 
                CssClass="button" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Label ID="dsFiltroDinamicoLabel" runat="server" 
                Text='<%# Bind("dsFiltroDinamico") %>' />
            <br />
            <asp:Label ID="dataPublicacaoLabel" runat="server" 
                Text='<%# Bind("dataPublicacao") %>' />
            <br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Editar" CssClass="button" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Excluir" CssClass="button" 
                onclientclick="return confirm(&quot;Quer excluir este filtro?&quot;)" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Novo Filtro" CssClass="button" />
        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:GridView ID="GridViewFiltro" runat="server" AutoGenerateColumns="False" 
        BorderStyle="None" DataKeyNames="idFiltroDinamicoXML_Liberado" 
        DataSourceID="SqlFiltro" GridLines="Horizontal" Width="100%">
        <AlternatingRowStyle BackColor="#F2F2F2" />
        <Columns>
            <asp:BoundField DataField="idFiltroDinamicoXML_Liberado" 
                HeaderText="idFiltroDinamicoXML_Liberado" InsertVisible="False" ReadOnly="True" 
                SortExpression="idFiltroDinamicoXML_Liberado" Visible="False" />
            <asp:BoundField DataField="idSetup" HeaderText="idSetup" 
                SortExpression="idSetup" Visible="False" />
            <asp:BoundField DataField="dsFiltroDinamico" HeaderText="Filtro Dinâmico" 
                SortExpression="dsFiltroDinamico" />
            <asp:ButtonField CommandName="Select" DataTextField="refTabela" 
                HeaderText="Referente" Text="Button" />
            <asp:BoundField DataField="refTabela" HeaderText="Referente" 
                SortExpression="refTabela" Visible="False" />
            <asp:BoundField DataField="refTabelaNivel" HeaderText="Nivel" 
                SortExpression="refTabelaNivel" />
            <asp:BoundField DataField="tabela" HeaderText="Tabela" 
                SortExpression="tabela" />
            <asp:BoundField DataField="tabelaNivel" HeaderText="Tabela Nivel" 
                SortExpression="tabelaNivel" />
            <asp:BoundField DataField="modelo" HeaderText="Modelo" 
                SortExpression="modelo" />
            <asp:BoundField DataField="panel" HeaderText="Panel" SortExpression="panel" />
            <asp:BoundField DataField="dataPublicacao" HeaderText="dataPublicacao" 
                SortExpression="dataPublicacao" Visible="False" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlEMPRESA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idsetup], [empresa], [idCadastroEmpresa] FROM [tbsetup]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlFiltro" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idFiltroDinamicoXML_Liberado], [idSetup], [dsFiltroDinamico], [refTabela], [refTabelaNivel], [tabela], [tabelaNivel], [modelo], [panel], [dataPublicacao] FROM [tbFiltroDinamicoXML_Liberado] WHERE ([idSetup] = @idSetup)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idSetupLabel" Name="idSetup" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlFiltroFORM" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="DELETE FROM [tbFiltroDinamicoXML_Liberado] WHERE [idFiltroDinamicoXML_Liberado] = @idFiltroDinamicoXML_Liberado" 
        InsertCommand="INSERT INTO [tbFiltroDinamicoXML_Liberado] ([idSetup], [dsFiltroDinamico], [refTabela], [refTabelaNivel], [tabela], [tabelaNivel], [modelo], [panel], [dataPublicacao]) VALUES (@idSetup, @dsFiltroDinamico, @refTabela, @refTabelaNivel, @tabela, @tabelaNivel, @modelo, @panel, @dataPublicacao)" 
        SelectCommand="SELECT [idFiltroDinamicoXML_Liberado], [idSetup], [dsFiltroDinamico], [refTabela], [refTabelaNivel], [tabela], [tabelaNivel], [modelo], [panel], [dataPublicacao] FROM [tbFiltroDinamicoXML_Liberado] WHERE ([idFiltroDinamicoXML_Liberado] = @idFiltroDinamicoXML_Liberado)" 
        UpdateCommand="UPDATE [tbFiltroDinamicoXML_Liberado] SET [idSetup] = @idSetup, [dsFiltroDinamico] = @dsFiltroDinamico, [refTabela] = @refTabela, [refTabelaNivel] = @refTabelaNivel, [tabela] = @tabela, [tabelaNivel] = @tabelaNivel, [modelo] = @modelo, [panel] = @panel, [dataPublicacao] = @dataPublicacao WHERE [idFiltroDinamicoXML_Liberado] = @idFiltroDinamicoXML_Liberado">
        <DeleteParameters>
            <asp:Parameter Name="idFiltroDinamicoXML_Liberado" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="idSetup" Type="Int32" />
            <asp:Parameter Name="dsFiltroDinamico" Type="String" />
            <asp:Parameter Name="refTabela" Type="String" />
            <asp:Parameter Name="refTabelaNivel" Type="String" />
            <asp:Parameter Name="tabela" Type="String" />
            <asp:Parameter Name="tabelaNivel" Type="String" />
            <asp:Parameter Name="modelo" Type="String" />
            <asp:Parameter Name="panel" Type="Int32" />
            <asp:Parameter Name="dataPublicacao" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="idFiltroDinamicoXML_LiberadoLabel" 
                Name="idFiltroDinamicoXML_Liberado" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="idSetup" Type="Int32" />
            <asp:Parameter Name="dsFiltroDinamico" Type="String" />
            <asp:Parameter Name="refTabela" Type="String" />
            <asp:Parameter Name="refTabelaNivel" Type="String" />
            <asp:Parameter Name="tabela" Type="String" />
            <asp:Parameter Name="tabelaNivel" Type="String" />
            <asp:Parameter Name="modelo" Type="String" />
            <asp:Parameter Name="panel" Type="Int32" />
            <asp:Parameter Name="dataPublicacao" Type="DateTime" />
            <asp:Parameter Name="idFiltroDinamicoXML_Liberado" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

