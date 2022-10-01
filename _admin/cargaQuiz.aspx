<%@ Page Title="Administrador" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="cargaQuiz.aspx.vb" Inherits="_admin_cargaQuiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCabec" runat="server" CssClass="titulo" 
        Text="Administração (Carga Quiz)"></asp:Label>
    <br />
    <asp:Label ID="idSetupLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idQuizLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idQuizCOPYLabel" runat="server" Visible="False"></asp:Label>
    <br />
    <asp:Label ID="EmpresaLabel" runat="server" CssClass="titulo"></asp:Label>
    <br />
    <br />
    <asp:Label ID="LabelEmpresa" runat="server" 
        Text="Selecione a empresa que receberá a carga do Quiz"></asp:Label>
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
    <asp:GridView ID="GridViewRes" runat="server" AutoGenerateColumns="False" 
        BorderStyle="None" DataKeyNames="idQuiz" DataSourceID="SqlQUIZLIBERADO" 
        GridLines="None" Width="100%">
        <AlternatingRowStyle BackColor="#F4F4F4" />
        <Columns>
            <asp:BoundField DataField="idQuiz" HeaderText="idQuiz" InsertVisible="False" 
                ReadOnly="True" SortExpression="idQuiz" Visible="False" />
            <asp:BoundField DataField="nomeQuiz" HeaderText="Avaliação" 
                SortExpression="nomeQuiz" />
            <asp:TemplateField HeaderText="Descrição" SortExpression="apresentacaoQuiz">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("apresentacaoQuiz") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("apresentacaoQuiz") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField CommandName="Select" Text="Atualizar" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:Label ID="LabelEmpresa0" runat="server" 
        Text="Selecione qual o Quiz que será copiado:"></asp:Label>
    <br />
    <asp:DropDownList ID="DropDownListQUIZ" runat="server" 
        AppendDataBoundItems="True" AutoPostBack="True" CssClass="DropCadEmp" 
        DataSourceID="SqlQUIZ" DataTextField="nomeQuiz" DataValueField="idQuiz">
        <asp:ListItem>Selecione</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:LinkButton ID="LinkButtonAtualizar" runat="server" CssClass="button" OnClientClick="return confirm(&quot;Deseja atualizar os campos de perguntas e respostas?)" Visible="False">Atualizar</asp:LinkButton>
    <asp:LinkButton ID="LinkButtonCARGA" runat="server" CssClass="button" 
        onclientclick="return confirm(&quot;Quer dar a carga?&quot;)" Visible="False">Carga</asp:LinkButton>
    <asp:LinkButton ID="LinkButtonCancelar" runat="server" CssClass="button">Cancelar</asp:LinkButton>
    <br />
    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlEMPRESA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idsetup], [empresa], [idCadastroEmpresa] FROM [tbsetup]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlQUIZ" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT [idQuiz], [nomeQuiz], [idSetup] FROM [tbQuiz] WHERE ([idSetup] = @idSetup)">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="idSetup" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlQUIZLIBERADO" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idQuiz], [nomeQuiz], [apresentacaoQuiz] FROM [tbQuiz] WHERE (([idCadastroEmpresa] = @idCadastroEmpresa) AND ([idSetup] = @idSetup))">
        <SelectParameters>
            <asp:ControlParameter ControlID="idCadastroEmpresaLabel" 
                Name="idCadastroEmpresa" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="idSetupLabel" Name="idSetup" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

