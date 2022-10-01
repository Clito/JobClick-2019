<%@ Page Title="" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="cargaFases.aspx.vb" Inherits="_admin_cargaFases" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCabec" runat="server" CssClass="titulo" 
        Text="Administração (Carga Fases)"></asp:Label>
    <br />
    <asp:Label ID="idSetupLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idTipoFaseProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
    <br />
    <asp:Label ID="EmpresaLabel" runat="server" CssClass="titulo"></asp:Label>
    <br />
    <br />
    <asp:Label ID="LabelEmpresa" runat="server" 
        Text="Selecione a empresa que receberá a carga das Fases"></asp:Label>
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
    <asp:FormView ID="FormViewFASE" runat="server" 
        DataKeyNames="idTipoFaseProcessoSeletivo" DataSourceID="SqlFASESFORM" 
        Width="100%">
        <EditItemTemplate>
            <asp:Label ID="Label1" runat="server" 
                Text='Nome da fase:' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="dsFaseTextBox" ErrorMessage="Nome da fase é obrigatória">*</asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="dsFaseTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("dsFase") %>' />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Módulo: (url)"></asp:Label>
            <br />
            <asp:TextBox ID="moduloTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("modulo") %>'></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Sequência para apresentação:"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" CssClass="InputCad" 
                Text='<%# Bind("sequencia") %>' Width="50px"></asp:TextBox>
            <br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Salvar" CssClass="button" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" 
                CssClass="button" />
            <br />
        </EditItemTemplate>
        <EmptyDataTemplate>
            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="New" 
                CssClass="button" 
                ToolTip="Selecione a empresa que você deseja replicar as fases">Incluir uma nova fase</asp:LinkButton>
            <asp:LinkButton ID="LinkButtonRESET" runat="server" CssClass="button" 
                onclick="LinkButtonRESET_Click">Reiniciar</asp:LinkButton>
            <br />
            <br />
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <asp:Label ID="Label1" runat="server" Text="Nome da fase:"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="dsFaseTextBox" ErrorMessage="Nome da fase é obrigatória">*</asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="dsFaseTextBox" runat="server" Text='<%# Bind("dsFase") %>' 
                CssClass="InputCad" />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Módulo: (url)"></asp:Label>
            <br />
            <asp:TextBox ID="moduloTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("modulo") %>'></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Sequência para apresentação:"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" CssClass="InputCad" 
                Text='<%# Bind("sequencia") %>' Width="50px"></asp:TextBox>
            <br />
            <br />

            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Salvar" CssClass="button" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" 
                CssClass="button" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Label ID="dsFaseLabel" runat="server" Text='<%# Bind("dsFase") %>' 
                CssClass="tituloRI" />
            <asp:Label ID="idSetupLabel" runat="server" Text='<%# Bind("idSetup") %>' 
                Visible="False" />
            <br />
            <asp:Label ID="idTipoFaseProcessoSeletivoLabel" runat="server" 
                Text='<%# Eval("idTipoFaseProcessoSeletivo") %>' Visible="False" />
            <br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Editar" CssClass="button" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Excluir fase" CssClass="button" 
                onclientclick="return confirm(&quot;Deseja excluir este fase?&quot;)" />
            &nbsp;<asp:LinkButton ID="LinkButtonRESET" runat="server" CssClass="button" 
                onclick="LinkButtonRESET_Click">Reiniciar</asp:LinkButton>
            <br />
            <br />
        </ItemTemplate>
    </asp:FormView>
    <asp:GridView ID="GridViewFasesCARGA" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="idTipoFaseProcessoSeletivo" DataSourceID="SqlFASES" 
        Width="100%" BorderStyle="None" GridLines="Horizontal" Visible="False">
        <AlternatingRowStyle BackColor="#F4F4F4" />
        <Columns>
            <asp:CommandField EditText="Editar" ShowEditButton="True" 
                UpdateText="Atualizar">
            <ControlStyle CssClass="inputCad" />
            </asp:CommandField>
            <asp:BoundField DataField="idTipoFaseProcessoSeletivo" HeaderText="idTipoFaseProcessoSeletivo" 
                InsertVisible="False" ReadOnly="True" SortExpression="idTipoFaseProcessoSeletivo" 
                Visible="False" />
            <asp:BoundField DataField="idSetup" HeaderText="idSetup" 
                SortExpression="idSetup" Visible="False" />
            <asp:ButtonField CommandName="Select" DataTextField="dsFase" Text="Button" />
            <asp:BoundField DataField="sequencia" HeaderText="Sequência" 
                SortExpression="sequencia">
            <HeaderStyle HorizontalAlign="Left" Width="150px" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlEMPRESA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idsetup], [empresa], [idCadastroEmpresa] FROM [tbsetup]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlFASES" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        
        SelectCommand="SELECT [idTipoFaseProcessoSeletivo], [idSetup], [dsFase], [modulo], [sequencia] FROM [tbTipoFaseProcessoSeletivo] WHERE ([idSetup] = @idSetup) ORDER BY sequencia " 
        UpdateCommand="UPDATE tbTipoFaseProcessoSeletivo SET sequencia = @sequencia WHERE     (idTipoFaseProcessoSeletivo = @idTipoFaseProcessoSeletivo)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idSetupLabel" Name="idSetup" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="sequencia" />
            <asp:Parameter Name="idTipoFaseProcessoSeletivo" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlFASESFORM" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="DELETE FROM [tbTipoFaseProcessoSeletivo] WHERE [idTipoFaseProcessoSeletivo] = @idTipoFaseProcessoSeletivo" 
        InsertCommand="INSERT INTO [tbTipoFaseProcessoSeletivo] ([dsFase], [idSetup], [modulo], [sequencia]) VALUES (@dsFase, @idSetup, @modulo, @sequencia)" 
        SelectCommand="SELECT [dsFase], [idSetup], [idTipoFaseProcessoSeletivo], [modulo], [sequencia] FROM [tbTipoFaseProcessoSeletivo] WHERE ([idTipoFaseProcessoSeletivo] = @idTipoFaseProcessoSeletivo)" 
        
        UpdateCommand="UPDATE [tbTipoFaseProcessoSeletivo] SET [dsFase] = @dsFase, [idSetup] = @idSetup, [modulo] = @modulo, [sequencia] = @sequencia WHERE [idTipoFaseProcessoSeletivo] = @idTipoFaseProcessoSeletivo">
        <DeleteParameters>
            <asp:Parameter Name="idTipoFaseProcessoSeletivo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="dsFase" Type="String" />
            <asp:Parameter Name="idSetup" Type="Int32" />
            <asp:Parameter Name="modulo" Type="String" />
            <asp:Parameter Name="sequencia" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="idTipoFaseProcessoSeletivoLabel" 
                Name="idTipoFaseProcessoSeletivo" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="dsFase" Type="String" />
            <asp:Parameter Name="idSetup" Type="Int32" />
            <asp:Parameter Name="modulo" Type="String" />
            <asp:Parameter Name="sequencia" Type="Int32" />
            <asp:Parameter Name="idTipoFaseProcessoSeletivo" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

