<%@ Page Title="Administrador" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="produtoJobclick.aspx.vb" Inherits="_admin_produtoJobclick" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCabec" runat="server" CssClass="titulo" 
        Text="Administração (Anúcios)"></asp:Label>
    <br />
    <asp:Label ID="idSetupLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idProdutoLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="iddsempresaLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCadastroEmpresaANUNCIOLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCadastroEmpresa_FilhaANUNCIOLabel" runat="server" 
        Visible="False"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="&lt;b&gt;Instruções para a carga de SMS padrão:&lt;/b&gt;&lt;br&gt;Selecione a empresa que irá receber a carga, em seguida clique em (Carga)"></asp:Label>
    <br />
    <asp:Label ID="MSN" runat="server" CssClass="msn"></asp:Label>
    <br />
    <br />
    <asp:LinkButton ID="LinkButtonCARGA" runat="server" CssClass="button" Visible="False">Carga</asp:LinkButton>
    <br />
    <br />
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
    <asp:GridView ID="GridViewProduto" runat="server" AutoGenerateColumns="False" 
        BorderStyle="None" DataKeyNames="idProduto" DataSourceID="SqlDataSourcePRODUTO" 
        GridLines="Horizontal" Width="100%">
        <AlternatingRowStyle BackColor="#F0F0F0" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="Selecionar" />
            <asp:BoundField DataField="idProduto" HeaderText="idProduto" 
                InsertVisible="False" ReadOnly="True" SortExpression="idProduto" 
                Visible="False" />
            <asp:BoundField DataField="Produto" HeaderText="Produto" 
                SortExpression="Produto" />
            <asp:BoundField DataField="codProduto" HeaderText="Código" 
                SortExpression="codProduto" Visible="False" />
            <asp:BoundField DataField="dsProduto" HeaderText="Descrição" 
                SortExpression="dsProduto" Visible="False" />
            <asp:BoundField DataField="preco" HeaderText="Preço mensal" 
                SortExpression="preco" Visible="False" />
            <asp:BoundField DataField="formaPagameno" HeaderText="Formas" 
                SortExpression="formaPagameno" Visible="False" />
            <asp:BoundField DataField="entrega" HeaderText="Entrega" 
                SortExpression="entrega" Visible="False" />
            <asp:BoundField DataField="imagem" HeaderText="Imagem" 
                SortExpression="imagem" Visible="False" />
            <asp:BoundField DataField="publicar" HeaderText="Publicar" 
                SortExpression="publicar" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:FormView ID="FormViewPRODUTO" runat="server" DataKeyNames="idProduto" 
        DataSourceID="SqlDataSourcePRODUTOFORM">
        <EditItemTemplate>
            <asp:Label ID="idProdutoLabel1" runat="server" Text='<%# Eval("idProduto") %>' 
                Visible="False" />
            <asp:Label ID="Label1" runat="server" Text="Informe qual empresa:" />
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DropCad" 
                DataSourceID="SqlEMPRESA" DataTextField="empresa" DataValueField="idsetup" 
                SelectedValue='<%# Bind("idSetup") %>'>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Tipo:"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownListTIPO" runat="server" CssClass="DropCad" DataSourceID="SqlDataSourceTIPO" DataTextField="dsProdutoTipo" DataValueField="idProdutoTipo" SelectedValue='<%# Bind("idProdutoTipo") %>'>
            </asp:DropDownList>
            <br />
            Produto:<br />
            <asp:TextBox ID="ProdutoTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("Produto") %>' />
            <br />
            código Produto:<br />
            <asp:TextBox ID="codProdutoTextBox" runat="server" CssClass="InputCadEmp" 
                Text='<%# Bind("codProduto") %>' />
            <br />
            Descrição Produto:<br />
            <asp:TextBox ID="dsProdutoTextBox" runat="server" CssClass="InputCadEmp" 
                Height="200px" Text='<%# Bind("dsProduto") %>' TextMode="MultiLine" />
            <br />
            Quantidade:<br />
            <asp:TextBox ID="TextBox1" runat="server" CssClass="InputCadEmp" 
                Text='<%# Bind("qtd") %>'></asp:TextBox>
            <br />
            Preço:<br />
            <asp:TextBox ID="precoTextBox" runat="server" CssClass="InputCadEmp" 
                Text='<%# Bind("preco") %>' />
            <br />
            Forma de Pagameno:<br />
            <asp:TextBox ID="formaPagamenoTextBox" runat="server" CssClass="InputCadEmp" 
                Text='<%# Bind("formaPagameno") %>' />
            <br />
            A entrega:<br />
            <asp:TextBox ID="entregaTextBox" runat="server" CssClass="InputCadEmp" 
                Text='<%# Bind("entrega") %>' />
            <br />
            Imagem:<br />
            <asp:TextBox ID="imagemTextBox" runat="server" CssClass="InputCadEmp" 
                Text='<%# Bind("imagem") %>' />
            <br />
            <br />
            publicar:<br />
            <asp:RadioButtonList ID="RadioButtonListPublicar" runat="server" 
                RepeatDirection="Horizontal" SelectedValue='<%# Bind("publicar") %>'>
                <asp:ListItem Value="1">Sim</asp:ListItem>
                <asp:ListItem Value="0">Não</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Este produto é apenas para:"></asp:Label>
            <asp:RadioButtonList ID="RadioButtonListTipoProduto" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>Candidato</asp:ListItem>
                <asp:ListItem>SMS</asp:ListItem>
                <asp:ListItem>Credito</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" CssClass="button" Text="Atualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" CssClass="button" 
                Text="Cancelar" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="New" 
                CssClass="button">Incluir um produto</asp:LinkButton>
            <asp:LinkButton ID="LinkButtonReset" runat="server" CssClass="button" 
                onclick="LinkButtonReset_Click1">Reiniciar</asp:LinkButton>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <asp:Label ID="Label1" runat="server" Text="Informe qual empresa:"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DropCad" 
                DataSourceID="SqlEMPRESA" DataTextField="empresa" DataValueField="idsetup" 
                SelectedValue='<%# Bind("idSetup") %>'>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Tipo:"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownListTIPO" runat="server" CssClass="DropCad" DataSourceID="SqlDataSourceTIPO" DataTextField="dsProdutoTipo" DataValueField="idProdutoTipo" SelectedValue='<%# Bind("idProdutoTipo") %>'>
            </asp:DropDownList>
            Produto:<br />
            <asp:TextBox ID="ProdutoTextBox" runat="server" CssClass="InputCadEmp" 
                Text='<%# Bind("Produto") %>' />
            <br />
            código Produto:<br />
            <asp:TextBox ID="codProdutoTextBox" runat="server" CssClass="InputCadEmp" 
                Text='<%# Bind("codProduto") %>' />
            <br />
            Descrição Produto:<br />
            <asp:TextBox ID="dsProdutoTextBox" runat="server" CssClass="InputCadEmp" 
                Height="200px" Text='<%# Bind("dsProduto") %>' TextMode="MultiLine" />
            <br />
            Quantidade:<br />
            <asp:TextBox ID="TextBox1" runat="server" CssClass="InputCadEmp" 
                Text='<%# Bind("qtd") %>'></asp:TextBox>
            <br />
            Preço:<br />
            <asp:TextBox ID="precoTextBox" runat="server" CssClass="InputCadEmp" 
                Text='<%# Bind("preco") %>' />
            <br />
            Forma de Pagameno:<br />
            <asp:TextBox ID="formaPagamenoTextBox" runat="server" CssClass="InputCadEmp" 
                Text='<%# Bind("formaPagameno") %>' />
            <br />
            A entrega:<br />
            <asp:TextBox ID="entregaTextBox" runat="server" CssClass="InputCadEmp" 
                Text='<%# Bind("entrega") %>' />
            <br />
            Imagem:<br />
            <asp:TextBox ID="imagemTextBox" runat="server" CssClass="InputCadEmp" 
                Text='<%# Bind("imagem") %>' />
            <br />
            publicar:<br />
            <asp:RadioButtonList ID="RadioButtonListPublicar" runat="server" 
                RepeatDirection="Horizontal" SelectedValue='<%# Bind("publicar") %>'>
                <asp:ListItem Value="1">Sim</asp:ListItem>
                <asp:ListItem Value="0">Não</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Este produto é apenas para:"></asp:Label>
            <asp:RadioButtonList ID="RadioButtonListTipoProduto" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>Candidato</asp:ListItem>
                <asp:ListItem>SMS</asp:ListItem>
                <asp:ListItem Selected="True">Credito</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Salvar" CssClass="button" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" 
                CssClass="button" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("imagem") %>' />
            <br />
            <asp:Label ID="ProdutoLabel" runat="server" Text='<%# Bind("Produto") %>' 
                CssClass="titulo" />
            <br />
            <asp:Label ID="codProdutoLabel" runat="server" 
                Text='<%# Bind("codProduto") %>' />
            <br />
            <asp:Label ID="dsProdutoLabel" runat="server" Text='<%# Bind("dsProduto") %>' />
            <br />
            <asp:Label ID="precoLabel" runat="server" 
                Text='<%# Bind("preco", "{0:C}") %>' />
            <br />
            <asp:Label ID="formaPagamenoLabel" runat="server" 
                Text='<%# Bind("formaPagameno") %>' />
            <br />
            <asp:Label ID="entregaLabel" runat="server" Text='<%# Bind("entrega") %>' />
            <br />
            <br />
            <asp:Label ID="publicarLabel" runat="server" Text='<%# Bind("publicar") %>' />
            <br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Editar" CssClass="button" />
&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Excluir" CssClass="button" 
                onclientclick="return confirm(&quot;Você quer excluir este produto?&quot;)" />
            &nbsp;<asp:LinkButton ID="LinkButtonReset" runat="server" CssClass="button" 
                onclick="LinkButtonReset_Click">Reiniciar</asp:LinkButton>
            &nbsp;
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSourcePRODUTO" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT [idProduto], [Produto], [codProduto], [dsProduto], [preco], [formaPagameno], [entrega], [imagem], [publicar], [idSetup] FROM [tbPagSeguroProduto] WHERE ([idSetup] = @idSetup)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idSetupLabel" Name="idSetup" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcePRODUTOFORM" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="DELETE FROM [tbPagSeguroProduto] WHERE [idProduto] = @idProduto" 
        InsertCommand="INSERT INTO tbPagSeguroProduto(Produto, codProduto, dsProduto, preco, formaPagameno, entrega, imagem, publicar, idSetup, qtd, candidato, sms, credito, idProdutoTipo) VALUES (@Produto, @codProduto, @dsProduto, @preco, @formaPagameno, @entrega, @imagem, @publicar, @idSetup, @qtd, @candidato, @sms, @credito, @idProdutoTipo)" 
        SelectCommand="SELECT idProduto, Produto, codProduto, dsProduto, preco, formaPagameno, entrega, imagem, publicar, idSetup, qtd, candidato, sms, credito, idProdutoTipo FROM tbPagSeguroProduto WHERE (idProduto = @idProduto) AND (idSetup = @idSetup)" 
        
        
        UpdateCommand="UPDATE tbPagSeguroProduto SET Produto = @Produto, codProduto = @codProduto, dsProduto = @dsProduto, preco = @preco, formaPagameno = @formaPagameno, entrega = @entrega, imagem = @imagem, publicar = @publicar, idSetup = @idSetup, qtd = @qtd, candidato = @candidato, sms = @sms, credito = @credito, idProdutoTipo = @idProdutoTipo WHERE (idProduto = @idProduto)">
        <DeleteParameters>
            <asp:Parameter Name="idProduto" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Produto" Type="String" />
            <asp:Parameter Name="codProduto" Type="String" />
            <asp:Parameter Name="dsProduto" Type="String" />
            <asp:Parameter Name="preco" Type="Decimal" />
            <asp:Parameter Name="formaPagameno" Type="String" />
            <asp:Parameter Name="entrega" Type="String" />
            <asp:Parameter Name="imagem" Type="String" />
            <asp:Parameter Name="publicar" Type="Int32" />
            <asp:Parameter Name="idSetup" />
            <asp:Parameter Name="qtd" />
            <asp:Parameter Name="candidato" />
            <asp:Parameter Name="sms" />
            <asp:Parameter Name="credito" />
            <asp:Parameter Name="idProdutoTipo" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="idProdutoLabel" Name="idProduto" 
                PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="idSetupLabel" Name="idSetup" 
                PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Produto" Type="String" />
            <asp:Parameter Name="codProduto" Type="String" />
            <asp:Parameter Name="dsProduto" Type="String" />
            <asp:Parameter Name="preco" Type="Decimal" />
            <asp:Parameter Name="formaPagameno" Type="String" />
            <asp:Parameter Name="entrega" Type="String" />
            <asp:Parameter Name="imagem" Type="String" />
            <asp:Parameter Name="publicar" Type="Int32" />
            <asp:Parameter Name="idSetup" />
            <asp:Parameter Name="qtd" />
            <asp:Parameter Name="candidato" />
            <asp:Parameter Name="sms" />
            <asp:Parameter Name="credito" />
            <asp:Parameter Name="idProdutoTipo" />
            <asp:Parameter Name="idProduto" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlEMPRESA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT [idsetup], [empresa], [idCadastroEmpresa] FROM [tbsetup]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceTIPO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="SELECT [idtbPagSeguroProdutoTipo], [idProdutoTipo], [dsProdutoTipo] FROM [tbPagSeguroProdutoTipo]"></asp:SqlDataSource>
    <br />
</asp:Content>

