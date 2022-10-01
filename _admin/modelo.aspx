<%@ Page Title="" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="modelo.aspx.vb" Inherits="_admin_modelo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:FormView ID="FormViewMODELO" runat="server" DataKeyNames="idMoleloVagaPublica" DataSourceID="SqlDataSourceFORM">
            <EditItemTemplate>
                idMoleloVagaPublica:
                <asp:Label ID="idMoleloVagaPublicaLabel1" runat="server" Text='<%# Eval("idMoleloVagaPublica") %>' />
                <br />
                Empresa:<br />
                <asp:TextBox ID="idSetupTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("idSetup") %>' />
                <br />
                Cargo:<br />
                <asp:TextBox ID="tituloTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("titulo") %>' />
                <br />
                Descrição:<br />
                <asp:TextBox ID="dsVagaModeloTextBox" runat="server" CssClass="InputCad" Height="200px" OnDataBinding="dsVagaModeloTextBox_DataBinding" Text='<%# Bind("dsVagaModelo") %>' TextMode="MultiLine" />
                <br />
                Contador:<br />
                <asp:TextBox ID="cntTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("cnt") %>' />
                <br />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" CssClass="button" Text="Salvar" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="button" Text="Cancelar" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Empresa:<br />
                <asp:TextBox ID="idSetupTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("idSetup") %>' />
                <br />
                Cargo:<br />
                <asp:TextBox ID="tituloTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("titulo") %>' />
                <br />
                Descrição:<br />
                <asp:TextBox ID="dsVagaModeloTextBox" runat="server" CssClass="InputCad" Height="200px" OnDataBinding="dsVagaModeloTextBox_DataBinding" Text='<%# Bind("dsVagaModelo") %>' TextMode="MultiLine" />
                <br />
                Contador:<br />
                <asp:TextBox ID="cntTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("cnt") %>' />
                <br />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="button" Text="Salvar" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="button" Text="Cancelar" />
                <asp:LinkButton ID="LinkButtonTEXT" runat="server" CssClass="button" OnClick="LinkButtonTEXT_Click">Corrigir</asp:LinkButton>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="tituloLabel" runat="server" Text='<%# Bind("titulo") %>' />
                <br />
                <asp:Label ID="dsVagaModeloLabel" runat="server" Text='<%# Bind("dsVagaModelo") %>' />
                <br />
                <br />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" CssClass="button" Text="Editar" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" CssClass="button" OnClientClick="return confirm(&quot;Opss... deseja excluir mesmo?&quot;)" Text="Deletar" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="button" Text="Novo" />
            </ItemTemplate>
        </asp:FormView>
        <br />
        <asp:GridView ID="GridViewMODELOLista" runat="server" AutoGenerateColumns="False" DataKeyNames="idMoleloVagaPublica" DataSourceID="SqlDataSourceMODELO" Width="100%" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="idMoleloVagaPublica" HeaderText="idMoleloVagaPublica" InsertVisible="False" ReadOnly="True" SortExpression="idMoleloVagaPublica" Visible="False" />
                <asp:BoundField DataField="idSetup" HeaderText="idSetup" SortExpression="idSetup" Visible="False" />
                <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" Visible="False" />
                <asp:ButtonField CommandName="Select" DataTextField="titulo" HeaderText="Cargo" Text="Button" />
                <asp:BoundField DataField="dsVagaModelo" HeaderText="dsVagaModelo" SortExpression="dsVagaModelo" Visible="False" />
                <asp:BoundField DataField="cnt" HeaderText="Contador" SortExpression="cnt" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSourceMODELO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_MODELO_VAGA" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="administrador" Type="Int32" />
                <asp:Parameter DefaultValue="0" Name="idSetup" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceFORM" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" DeleteCommand="DELETE FROM [tbVagaPublica_Modelo] WHERE [idMoleloVagaPublica] = @idMoleloVagaPublica" InsertCommand="INSERT INTO [tbVagaPublica_Modelo] ([idSetup], [titulo], [dsVagaModelo], [cnt]) VALUES (@idSetup, @titulo, @dsVagaModelo, @cnt)" SelectCommand="SELECT [idMoleloVagaPublica], [idSetup], [titulo], [dsVagaModelo], [cnt] FROM [tbVagaPublica_Modelo] WHERE ([idMoleloVagaPublica] = @idMoleloVagaPublica)" UpdateCommand="UPDATE [tbVagaPublica_Modelo] SET [idSetup] = @idSetup, [titulo] = @titulo, [dsVagaModelo] = @dsVagaModelo, [cnt] = @cnt WHERE [idMoleloVagaPublica] = @idMoleloVagaPublica">
            <DeleteParameters>
                <asp:Parameter Name="idMoleloVagaPublica" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="idSetup" Type="Int32" />
                <asp:Parameter Name="titulo" Type="String" />
                <asp:Parameter Name="dsVagaModelo" Type="String" />
                <asp:Parameter Name="cnt" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridViewMODELOLista" Name="idMoleloVagaPublica" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="idSetup" Type="Int32" />
                <asp:Parameter Name="titulo" Type="String" />
                <asp:Parameter Name="dsVagaModelo" Type="String" />
                <asp:Parameter Name="cnt" Type="Int32" />
                <asp:Parameter Name="idMoleloVagaPublica" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

