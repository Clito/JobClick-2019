<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="vagaSalva.aspx.vb" Inherits="_parceiroJobClick_vagaSalva" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Modelos prontos para usar"></asp:Label>
                
            <br />
            <asp:Label ID="Label2" runat="server" CssClass="legenda" Text="* Passe o cursor sobre o título do cargo para ver o conteúdo descritivo."></asp:Label>
            <br />
            <br />
        <asp:GridView ID="GridViewMODELOLista" runat="server" AutoGenerateColumns="False" DataKeyNames="idMoleloVagaPublica" DataSourceID="SqlDataSourceMODELO" Width="100%" AllowPaging="True" CssClass="mGrid" PageSize="20">
            <AlternatingRowStyle CssClass="alt" />
            <Columns>
                <asp:BoundField DataField="idMoleloVagaPublica" HeaderText="idMoleloVagaPublica" InsertVisible="False" ReadOnly="True" SortExpression="idMoleloVagaPublica" Visible="False" />
                <asp:BoundField DataField="idSetup" HeaderText="idSetup" SortExpression="idSetup" Visible="False" />
                <asp:TemplateField HeaderText="titulo" SortExpression="titulo" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("titulo") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("titulo") %>' ToolTip='<%# Eval("dsVagaModelo", "[Clique aqui para usar] - {0}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cargo" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text='<%# Eval("titulo") %>' ToolTip='<%# Eval("dsVagaModelo", "[Clique aqui para utilizar] - {0}") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="dsVagaModelo" HeaderText="dsVagaModelo" SortExpression="dsVagaModelo" Visible="False" />
                <asp:BoundField DataField="cnt" HeaderText="Contador" SortExpression="cnt" Visible="False" />
            </Columns>
            <PagerStyle CssClass="pgr" />
        </asp:GridView>
            <br />
        <asp:SqlDataSource ID="SqlDataSourceMODELO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_MODELO_VAGA" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="administrador" Type="Int32" />
                <asp:SessionParameter DefaultValue="0" Name="idSetup" SessionField="idSetup" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
                
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
                
        </div>
    </div>
</asp:Content>

