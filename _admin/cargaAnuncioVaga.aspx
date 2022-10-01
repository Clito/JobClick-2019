<%@ Page Title="" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="cargaAnuncioVaga.aspx.vb" Inherits="_admin_cargaAnuncioVaga" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCabec" runat="server" CssClass="titulo" 
        Text="Administração (Anúcios)"></asp:Label>
    <br />
    <asp:Label ID="idSetupLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="iddsempresaLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCadastroEmpresaANUNCIOLabel" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="idCadastroEmpresa_FilhaANUNCIOLabel" runat="server" 
        Visible="False"></asp:Label>
    <br />
    <asp:Label ID="EmpresaLabel" runat="server" CssClass="titulo"></asp:Label>
    <br />
    <asp:Label ID="LabelEmpresa" runat="server" 
        Text="Selecione a empresa que receberá o texto do anúncio"></asp:Label>
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
    <asp:GridView ID="GridViewRELACIONAMENTO" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="iddsempresa" DataSourceID="SqlDataSourceEMPRESA" 
    BorderStyle="None" GridLines="Horizontal" Width="100%">
        <AlternatingRowStyle BackColor="#F3F3F3" />
        <Columns>
            <asp:BoundField DataField="iddsempresa" HeaderText="iddsempresa" 
                InsertVisible="False" ReadOnly="True" SortExpression="iddsempresa" 
                Visible="False" />
            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                SortExpression="idCadastroEmpresa" Visible="False" />
            <asp:BoundField DataField="idCadastroEmpresaFilha" 
                HeaderText="idCadastroEmpresaFilha" 
                SortExpression="idCadastroEmpresaFilha" Visible="False" />
            <asp:BoundField DataField="tituloDesEmpresa" HeaderText="Anúncio" 
                SortExpression="tituloDesEmpresa" />
            <asp:BoundField DataField="dsempresaVaga" HeaderText="dsempresaVaga" 
                SortExpression="dsempresaVaga" Visible="False" />
            <asp:BoundField DataField="msnCandidato" HeaderText="msnCandidato" 
                SortExpression="msnCandidato" Visible="False" />
            <asp:BoundField DataField="msnCandidatoFim" HeaderText="msnCandidatoFim" 
                SortExpression="msnCandidatoFim" Visible="False" />
            <asp:BoundField DataField="nmempresa_PAI" HeaderText="Empresa" 
                SortExpression="nmempresa_PAI" />
            <asp:BoundField DataField="nmempresa_FILHA" HeaderText="Empresa Filha" 
                SortExpression="nmempresa_FILHA" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:GridView ID="GridViewRELACIONAMENTOANUNCIO" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="idCadastroEmpresa" 
    DataSourceID="SqlDataSourceEMPRESA_FILHA" BorderStyle="None" 
    GridLines="Horizontal" Width="100%">
        <AlternatingRowStyle BackColor="#F3F3F3" />
        <Columns>
            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="ID Empresa Filha" 
                InsertVisible="False" ReadOnly="True" SortExpression="idCadastroEmpresa" />
            <asp:BoundField DataField="nmempresa" HeaderText="Empresa" 
                SortExpression="nmempresa" />
            <asp:BoundField DataField="idCadastroEmpresa_Pai" 
                HeaderText="ID Empresa Pai" SortExpression="idCadastroEmpresa_Pai" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:FormView ID="FormViewANUNCIO" runat="server" DataKeyNames="iddsempresa" 
        DataSourceID="SqlANUNCIOFORM" Width="100%">
        <EditItemTemplate>
            <asp:Label ID="Label9" runat="server" 
                Text='Empresa Titular (Responsável pelos anúncios):' />
            <br />
            <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" 
                Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="10px" />
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DropCad" 
                DataSourceID="SqlEMPRESAFORM" DataTextField="nmempresa" 
                DataValueField="idCadastroEmpresa" 
                SelectedValue='<%# Bind("idCadastroEmpresa") %>'>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label10" runat="server" 
                Text="Empresa Cliente ou Filha (Caso Consultoria):"></asp:Label>
            <br />
            <asp:TextBox ID="idCadastroEmpresaFilhaTextBox" runat="server" 
                Text='<%# Bind("idCadastroEmpresaFilha") %>' Visible="False" 
                Width="10px" />
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="DropCad" 
                DataSourceID="SqlDataSourceEMPRESA_FILHA" DataTextField="nmempresa" 
                DataValueField="idCadastroEmpresa" 
                SelectedValue='<%# Bind("idCadastroEmpresaFilha") %>'>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" 
                Text="Apenas uma referência para localização:"></asp:Label>
            <br />
            <asp:TextBox ID="tituloDesEmpresaTextBox" runat="server" 
                Text='<%# Bind("tituloDesEmpresa") %>' CssClass="InputCad" />
            <br />
            <asp:Label ID="Label7" runat="server" 
                Text="Texto que será apresentado no topo do anúncio:"></asp:Label>
            <br />
            <asp:TextBox ID="dsempresaVagaTextBox" runat="server" 
                Text='<%# Bind("dsempresaVaga") %>' CssClass="InputCad" Height="150px" 
                TextMode="MultiLine" />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Mensagem Aprovado PS:"></asp:Label>
            <br />
            <asp:TextBox ID="msnCandidatoTextBox" runat="server" 
                Text='<%# Bind("msnCandidato") %>' CssClass="InputCad" Height="150px" 
                TextMode="MultiLine" />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Mensagem Reprovado PS:"></asp:Label>
            <br />
            <asp:TextBox ID="msnCandidatoFimTextBox" runat="server" 
                Text='<%# Bind("msnCandidatoFim") %>' CssClass="InputCad" Height="150px" 
                TextMode="MultiLine" />
            <br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Salvar" CssClass="button" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" 
                CssClass="button" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            <br />
            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="New" 
                CssClass="button">Cadastrar um anúncio</asp:LinkButton>
            <asp:LinkButton ID="LinkButtonRESET" runat="server" CssClass="button" 
                onclick="LinkButtonRESET_Click">Reiniciar</asp:LinkButton>
            <br />
            <br />
            <br />
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <asp:Label ID="Label9" runat="server" 
                Text="Empresa Titular (Responsável pelos anúncios):"></asp:Label>
            <br />
            <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" 
                Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="10px" />
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DropCad" 
                DataSourceID="SqlEMPRESAFORM" DataTextField="nmempresa" 
                DataValueField="idCadastroEmpresa" 
                SelectedValue='<%# Bind("idCadastroEmpresa") %>'>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label10" runat="server" 
                Text="Empresa Cliente ou Filha (Caso Consultoria):"></asp:Label>
            <br />
            <asp:TextBox ID="idCadastroEmpresaFilhaTextBox" runat="server" 
                Text='<%# Bind("idCadastroEmpresaFilha") %>' Visible="False" 
                Width="10px" />
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="DropCad" 
                DataSourceID="SqlDataSourceEMPRESA" DataTextField="nmempresa_FILHA" 
                DataValueField="idCadastroEmpresaFilha" 
                SelectedValue='<%# Bind("idCadastroEmpresaFilha") %>'>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" 
                Text="Apenas uma referência para localização:"></asp:Label>
            <br />
            <asp:TextBox ID="tituloDesEmpresaTextBox" runat="server" 
                Text='<%# Bind("tituloDesEmpresa") %>' CssClass="InputCad" />
            <br />
            <asp:Label ID="Label7" runat="server" 
                Text="Texto que será apresentado no topo do anúncio:"></asp:Label>
            <br />
            <asp:TextBox ID="dsempresaVagaTextBox" runat="server" 
                Text='<%# Bind("dsempresaVaga") %>' CssClass="InputCad" Height="150px" 
                TextMode="MultiLine" />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Mensagem Aprovado PS:"></asp:Label>
            <br />
            <asp:TextBox ID="msnCandidatoTextBox" runat="server" 
                Text='<%# Bind("msnCandidato") %>' CssClass="InputCad" Height="150px" 
                TextMode="MultiLine" />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Mensagem Reprovado PS:"></asp:Label>
            <br />
            <asp:TextBox ID="msnCandidatoFimTextBox" runat="server" 
                Text='<%# Bind("msnCandidatoFim") %>' CssClass="InputCad" Height="150px" 
                TextMode="MultiLine" />
            <br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Salvar" CssClass="button" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" 
                CssClass="button" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Label ID="tituloDesEmpresaLabel" runat="server" 
                Text='<%# Bind("tituloDesEmpresa") %>' CssClass="tituloRI" />
            <br />
            <asp:Label ID="dsempresaVagaLabel" runat="server" 
                Text='<%# Bind("dsempresaVaga") %>' />
            <br />
            <asp:Label ID="msnCandidatoLabel" runat="server" 
                Text='<%# Bind("msnCandidato") %>' />
            <br />
            <asp:Label ID="msnCandidatoFimLabel" runat="server" 
                Text='<%# Bind("msnCandidatoFim") %>' />
            <br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" CssClass="button" Text="Editar anúncio" />
            <asp:LinkButton ID="LinkButtonCancelar" runat="server" CssClass="button" 
                onclick="LinkButtonCancelar_Click">Cancelar</asp:LinkButton>
            <asp:LinkButton ID="LinkButtonExcluir" runat="server" CausesValidation="False" 
                CommandName="Delete" CssClass="button" 
                onclientclick="return confirm(&quot;Quer excluir este anúncio?&quot;)">Excluir Anúncio</asp:LinkButton>
            <br />
            <br />
        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:GridView ID="GridViewANUNCIO" runat="server" AutoGenerateColumns="False" 
        BorderStyle="None" 
        DataKeyNames="iddsempresa,idCadastroEmpresa,idCadastroEmpresaFilha" 
        DataSourceID="SqlANUNCIO" GridLines="Horizontal" Width="100%">
        <AlternatingRowStyle BackColor="#EBEBEB" />
        <Columns>
            <asp:BoundField DataField="iddsempresa" HeaderText="iddsempresa" 
                InsertVisible="False" ReadOnly="True" SortExpression="iddsempresa" 
                Visible="False" />
            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                SortExpression="idCadastroEmpresa" Visible="False" />
            <asp:BoundField DataField="idCadastroEmpresaFilha" 
                HeaderText="idCadastroEmpresaFilha" SortExpression="idCadastroEmpresaFilha" 
                Visible="False" />
            <asp:TemplateField HeaderText="Título (Apenas para referência)" 
                SortExpression="tituloDesEmpresa">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("tituloDesEmpresa") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("tituloDesEmpresa") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Descrição (Anúncio)" 
                SortExpression="dsempresaVaga">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("dsempresaVaga") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select" 
                        Text='<%# Eval("dsempresaVaga") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mensagem Candidato Aprovado" 
                SortExpression="msnCandidato">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("msnCandidato") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("msnCandidato") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Reprovado" SortExpression="msnCandidatoFim">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("msnCandidatoFim") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("msnCandidatoFim") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlEMPRESA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idsetup], [empresa], [idCadastroEmpresa] FROM [tbsetup]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlANUNCIO" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [iddsempresa], [idCadastroEmpresa], ISNULL([idCadastroEmpresaFilha],0) AS idCadastroEmpresaFilha, [tituloDesEmpresa], [dsempresaVaga], [msnCandidato], [msnCandidatoFim] FROM [tbDescEmpresa_Vaga] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idCadastroEmpresaLabel" 
                Name="idCadastroEmpresa" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlANUNCIOFORM" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="DELETE FROM [tbDescEmpresa_Vaga] WHERE [iddsempresa] = @iddsempresa" 
        InsertCommand="INSERT INTO [tbDescEmpresa_Vaga] ([idCadastroEmpresa], [idCadastroEmpresaFilha], [tituloDesEmpresa], [dsempresaVaga], [msnCandidato], [msnCandidatoFim]) VALUES (@idCadastroEmpresa, @idCadastroEmpresaFilha, @tituloDesEmpresa, @dsempresaVaga, @msnCandidato, @msnCandidatoFim)" 
        SelectCommand="SELECT [iddsempresa], [idCadastroEmpresa], [idCadastroEmpresaFilha], [tituloDesEmpresa], [dsempresaVaga], [msnCandidato], [msnCandidatoFim] FROM [tbDescEmpresa_Vaga] WHERE ([iddsempresa] = @iddsempresa)" 
        UpdateCommand="UPDATE [tbDescEmpresa_Vaga] SET [idCadastroEmpresa] = @idCadastroEmpresa, [idCadastroEmpresaFilha] = @idCadastroEmpresaFilha, [tituloDesEmpresa] = @tituloDesEmpresa, [dsempresaVaga] = @dsempresaVaga, [msnCandidato] = @msnCandidato, [msnCandidatoFim] = @msnCandidatoFim WHERE [iddsempresa] = @iddsempresa">
        <DeleteParameters>
            <asp:Parameter Name="iddsempresa" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="idCadastroEmpresaFilha" Type="Int32" />
            <asp:Parameter Name="tituloDesEmpresa" Type="String" />
            <asp:Parameter Name="dsempresaVaga" Type="String" />
            <asp:Parameter Name="msnCandidato" Type="String" />
            <asp:Parameter Name="msnCandidatoFim" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="iddsempresaLabel" Name="iddsempresa" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="idCadastroEmpresaFilha" Type="Int32" />
            <asp:Parameter Name="tituloDesEmpresa" Type="String" />
            <asp:Parameter Name="dsempresaVaga" Type="String" />
            <asp:Parameter Name="msnCandidato" Type="String" />
            <asp:Parameter Name="msnCandidatoFim" Type="String" />
            <asp:Parameter Name="iddsempresa" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceEMPRESA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT ANUNCIO.iddsempresa, ANUNCIO.idCadastroEmpresa, ANUNCIO.idCadastroEmpresaFilha, ANUNCIO.tituloDesEmpresa, ANUNCIO.dsempresaVaga, 
                      ANUNCIO.msnCandidato, ANUNCIO.msnCandidatoFim, PAI.nmempresa AS nmempresa_PAI, FILHA.nmempresa AS nmempresa_FILHA
FROM         tbDescEmpresa_Vaga AS ANUNCIO INNER JOIN
                      tbCadastroEmpresa AS PAI ON ANUNCIO.idCadastroEmpresa = PAI.idCadastroEmpresa INNER JOIN
                      tbCadastroEmpresa AS FILHA ON ANUNCIO.idCadastroEmpresaFilha = FILHA.idCadastroEmpresa
WHERE     (ANUNCIO.idCadastroEmpresa = @idCadastroEmpresa_PAI)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idCadastroEmpresaLabel" 
                Name="idCadastroEmpresa_Pai" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceEMPRESA_FILHA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idCadastroEmpresa], [nmempresa], [idCadastroEmpresa_Pai] FROM [tbCadastroEmpresa] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:ControlParameter ControlID="idCadastroEmpresa_FilhaANUNCIOLabel" 
                Name="idCadastroEmpresa" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
<asp:SqlDataSource ID="SqlEMPRESAFORM" runat="server" 
    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
    SelectCommand="SELECT [idCadastroEmpresa], [nmempresa] FROM [tbCadastroEmpresa] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
    <SelectParameters>
        <asp:ControlParameter ControlID="idCadastroEmpresaLabel" 
            Name="idCadastroEmpresa" PropertyName="Text" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

