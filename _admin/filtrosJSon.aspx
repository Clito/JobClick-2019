<%@ Page Title="" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="filtrosJSon.aspx.vb" Inherits="_admin_filtrosJSon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <br />
        <asp:GridView ID="GridViewFiltroJSon" runat="server" AutoGenerateColumns="False" DataKeyNames="idFiltroDinamicoJSON_Liberado" DataSourceID="SqlDataSourceFILTROJSON" Width="100%">
            <AlternatingRowStyle BackColor="#EBEBEB" />
            <Columns>
                <asp:CommandField SelectText="Editar" ShowSelectButton="True" />
                <asp:BoundField DataField="idFiltroDinamicoJSON_Liberado" HeaderText="idFiltroDinamicoJSON_Liberado" InsertVisible="False" ReadOnly="True" SortExpression="idFiltroDinamicoJSON_Liberado" Visible="False" />
                <asp:BoundField DataField="dsFiltroDinamicoJSON" HeaderText="dsFiltroDinamicoJSON" SortExpression="dsFiltroDinamicoJSON" />
                <asp:BoundField DataField="colunaFiltroDinamicoJSON" HeaderText="colunaFiltroDinamicoJSON" SortExpression="colunaFiltroDinamicoJSON" />
                <asp:BoundField DataField="estruturaFiltroJSON" HeaderText="estruturaFiltroJSON" SortExpression="estruturaFiltroJSON" />
                <asp:BoundField DataField="dataPublicacao" HeaderText="dataPublicacao" SortExpression="dataPublicacao" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:FormView ID="FormViewFiltroJSon" runat="server" DataKeyNames="idFiltroDinamicoJSON_Liberado" DataSourceID="SqlDataSourceFILTROJSONFORM">
            <EditItemTemplate>
                idFiltroDinamicoJSON_Liberado:
                <asp:Label ID="idFiltroDinamicoJSON_LiberadoLabel1" runat="server" Text='<%# Eval("idFiltroDinamicoJSON_Liberado") %>' />
                <br />
                dsFiltroDinamicoJSON:<br />&nbsp;
                <asp:TextBox ID="dsFiltroDinamicoJSONTextBox" runat="server" CssClass="DropCadEmp" Text='<%# Bind("dsFiltroDinamicoJSON") %>' />
                <br />
                <br />
                colunaFiltroDinamicoJSON:<br />&nbsp;
                <asp:TextBox ID="colunaFiltroDinamicoJSONTextBox" runat="server" CssClass="DropCadEmp" Text='<%# Bind("colunaFiltroDinamicoJSON") %>' />
                <br />
                <br />
                estruturaFiltroJSON:<br /> &nbsp;<asp:TextBox ID="estruturaFiltroJSONTextBox" runat="server" CssClass="DropCadEmp" Text='<%# Bind("estruturaFiltroJSON") %>' />
                <br />
                <br />
                Sobre o Filtro:<br />
                <br />
                <asp:TextBox ID="TextBoxInfo" runat="server" CssClass="DropCadEmp" Height="100px" Text='<%# Bind("informacaoSobreFiltro") %>' TextMode="MultiLine"></asp:TextBox>
                <br />
                <br />
                dataPublicacao:<br />
                &nbsp;<asp:TextBox ID="dataPublicacaoTextBox" runat="server" CssClass="DropCadEmp" Text='<%# Bind("dataPublicacao") %>' />
                <br />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                dsFiltroDinamicoJSON:<br />&nbsp;
                <asp:TextBox ID="dsFiltroDinamicoJSONTextBox" runat="server" CssClass="DropCadEmp" Text='<%# Bind("dsFiltroDinamicoJSON") %>' />
                <br />
                <br />
                colunaFiltroDinamicoJSON:<br /> &nbsp;<asp:TextBox ID="colunaFiltroDinamicoJSONTextBox" runat="server" CssClass="DropCadEmp" Text='<%# Bind("colunaFiltroDinamicoJSON") %>' />
                <br />
                <br />
                estruturaFiltroJSON:<br />&nbsp;
                <asp:TextBox ID="estruturaFiltroJSONTextBox" runat="server" CssClass="DropCadEmp" Text='<%# Bind("estruturaFiltroJSON") %>' />
                <br />
                <br />
                Sobre o Filtro:<br />
                <br />
                <asp:TextBox ID="TextBoxInfo" runat="server" CssClass="DropCadEmp" Height="100px" Text='<%# Bind("informacaoSobreFiltro") %>' TextMode="MultiLine"></asp:TextBox>
                <br />
                <br />
                dataPublicacao:<br />
&nbsp;<asp:TextBox ID="dataPublicacaoTextBox" runat="server" CssClass="DropCadEmp" Text='<%# Bind("dataPublicacao") %>' />
                <br />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                idFiltroDinamicoJSON_Liberado:
                <asp:Label ID="idFiltroDinamicoJSON_LiberadoLabel" runat="server" Text='<%# Eval("idFiltroDinamicoJSON_Liberado") %>' />
                <br />
                dsFiltroDinamicoJSON:
                <asp:Label ID="dsFiltroDinamicoJSONLabel" runat="server" Text='<%# Bind("dsFiltroDinamicoJSON") %>' />
                <br />
                colunaFiltroDinamicoJSON:
                <asp:Label ID="colunaFiltroDinamicoJSONLabel" runat="server" Text='<%# Bind("colunaFiltroDinamicoJSON") %>' />
                <br />
                estruturaFiltroJSON:
                <asp:Label ID="estruturaFiltroJSONLabel" runat="server" Text='<%# Bind("estruturaFiltroJSON") %>' />
                <br />
                dataPublicacao:
                <asp:Label ID="dataPublicacaoLabel" runat="server" Text='<%# Bind("dataPublicacao") %>' />
                <br />
                <br />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" CssClass="button" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="button" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Incluir" CssClass="button" />
            </ItemTemplate>
        </asp:FormView>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSourceFILTROJSON" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" DeleteCommand="DELETE FROM [tbFiltroDinamicoJSON_Liberado] WHERE [idFiltroDinamicoJSON_Liberado] = @idFiltroDinamicoJSON_Liberado" InsertCommand="INSERT INTO [tbFiltroDinamicoJSON_Liberado] ([dsFiltroDinamicoJSON], [colunaFiltroDinamicoJSON], [estruturaFiltroJSON], [dataPublicacao]) VALUES (@dsFiltroDinamicoJSON, @colunaFiltroDinamicoJSON, @estruturaFiltroJSON, @dataPublicacao)" SelectCommand="SELECT [idFiltroDinamicoJSON_Liberado], [dsFiltroDinamicoJSON], [colunaFiltroDinamicoJSON], [estruturaFiltroJSON], [dataPublicacao] FROM [tbFiltroDinamicoJSON_Liberado]" UpdateCommand="UPDATE [tbFiltroDinamicoJSON_Liberado] SET [dsFiltroDinamicoJSON] = @dsFiltroDinamicoJSON, [colunaFiltroDinamicoJSON] = @colunaFiltroDinamicoJSON, [estruturaFiltroJSON] = @estruturaFiltroJSON, [dataPublicacao] = @dataPublicacao WHERE [idFiltroDinamicoJSON_Liberado] = @idFiltroDinamicoJSON_Liberado">
            <DeleteParameters>
                <asp:Parameter Name="idFiltroDinamicoJSON_Liberado" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="dsFiltroDinamicoJSON" Type="String" />
                <asp:Parameter Name="colunaFiltroDinamicoJSON" Type="String" />
                <asp:Parameter Name="estruturaFiltroJSON" Type="String" />
                <asp:Parameter Name="dataPublicacao" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="dsFiltroDinamicoJSON" Type="String" />
                <asp:Parameter Name="colunaFiltroDinamicoJSON" Type="String" />
                <asp:Parameter Name="estruturaFiltroJSON" Type="String" />
                <asp:Parameter Name="dataPublicacao" Type="DateTime" />
                <asp:Parameter Name="idFiltroDinamicoJSON_Liberado" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceFILTROJSONFORM" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" DeleteCommand="DELETE FROM [tbFiltroDinamicoJSON_Liberado] WHERE [idFiltroDinamicoJSON_Liberado] = @idFiltroDinamicoJSON_Liberado" InsertCommand="INSERT INTO [tbFiltroDinamicoJSON_Liberado] ([dsFiltroDinamicoJSON], [colunaFiltroDinamicoJSON], [estruturaFiltroJSON], [dataPublicacao], [informacaoSobreFiltro]) VALUES (@dsFiltroDinamicoJSON, @colunaFiltroDinamicoJSON, @estruturaFiltroJSON, @dataPublicacao, @informacaoSobreFiltro)" SelectCommand="SELECT [idFiltroDinamicoJSON_Liberado], [dsFiltroDinamicoJSON], [colunaFiltroDinamicoJSON], [estruturaFiltroJSON], [dataPublicacao], [informacaoSobreFiltro] FROM [tbFiltroDinamicoJSON_Liberado] WHERE ([idFiltroDinamicoJSON_Liberado] = @idFiltroDinamicoJSON_Liberado)" UpdateCommand="UPDATE [tbFiltroDinamicoJSON_Liberado] SET [dsFiltroDinamicoJSON] = @dsFiltroDinamicoJSON, [colunaFiltroDinamicoJSON] = @colunaFiltroDinamicoJSON, [estruturaFiltroJSON] = @estruturaFiltroJSON, [dataPublicacao] = @dataPublicacao, [informacaoSobreFiltro] = @informacaoSobreFiltro WHERE [idFiltroDinamicoJSON_Liberado] = @idFiltroDinamicoJSON_Liberado">
            <DeleteParameters>
                <asp:Parameter Name="idFiltroDinamicoJSON_Liberado" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="dsFiltroDinamicoJSON" Type="String" />
                <asp:Parameter Name="colunaFiltroDinamicoJSON" Type="String" />
                <asp:Parameter Name="estruturaFiltroJSON" Type="String" />
                <asp:Parameter Name="dataPublicacao" Type="DateTime" />
                <asp:Parameter Name="informacaoSobreFiltro" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridViewFiltroJSon" Name="idFiltroDinamicoJSON_Liberado" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="dsFiltroDinamicoJSON" Type="String" />
                <asp:Parameter Name="colunaFiltroDinamicoJSON" Type="String" />
                <asp:Parameter Name="estruturaFiltroJSON" Type="String" />
                <asp:Parameter Name="dataPublicacao" Type="DateTime" />
                <asp:Parameter Name="informacaoSobreFiltro" Type="String" />
                <asp:Parameter Name="idFiltroDinamicoJSON_Liberado" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

