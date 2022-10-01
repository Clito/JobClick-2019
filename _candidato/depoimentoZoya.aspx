<%@ Page Language="VB" MasterPageFile="~/_candidato/zoya.master" AutoEventWireup="false" CodeFile="depoimentoZoya.aspx.vb" Inherits="_candidato_depoimentoZoya" title="Jobclick" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:Label ID="lblGeralVideos" runat="server" CssClass="tituloZoyaUser" 
                    Text="Comentários de empresas e profissionais da área"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BorderColor="#CCCCCC" BorderStyle="Dashed" BorderWidth="1px" 
        DataKeyNames="idDepoimentosZoya" DataSourceID="SqlDepoimento" GridLines="None" 
        Width="540px">
        <Columns>
            <asp:BoundField DataField="idDepoimentosZoya" HeaderText="idDepoimentosZoya" 
                InsertVisible="False" ReadOnly="True" SortExpression="idDepoimentosZoya" 
                Visible="False" />
            <asp:BoundField DataField="idCadastroUser" HeaderText="idCadastroUser" 
                SortExpression="idCadastroUser" Visible="False" />
            <asp:BoundField DataField="idCadastroUserD" HeaderText="idCadastroUserD" 
                SortExpression="idCadastroUserD" Visible="False" />
            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                SortExpression="idCadastroEmpresa" Visible="False" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" 
                        CommandName="Select" ImageUrl="~/images/ckPublica_off.gif" Text="Button" />
                </ItemTemplate>
                <ItemStyle VerticalAlign="Top" Width="10px" />
            </asp:TemplateField>
            <asp:BoundField DataField="txdepoimento" HeaderText="Comentário(s) recebido(s)" 
                SortExpression="txdepoimento">
                <ItemStyle VerticalAlign="Top" Width="250px" />
            </asp:BoundField>
            <asp:BoundField DataField="data" DataFormatString="{0:d}" SortExpression="data">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="70px" />
            </asp:BoundField>
            <asp:BoundField DataField="nome" SortExpression="nome">
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="nmempresa" SortExpression="nmempresa">
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="apresentar" SortExpression="apresentar" />
        </Columns>
        <EmptyDataTemplate>
            <asp:Label ID="LabelDpNull" runat="server" CssClass="textBold" 
                Text="Não existe depoimento(s) para este profile."></asp:Label>
        </EmptyDataTemplate>
        <HeaderStyle HorizontalAlign="Left" />
        <AlternatingRowStyle BackColor="#EBEBEB" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDepoimento" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT tbDepoimentosZoya.idDepoimentosZoya, tbDepoimentosZoya.idCadastroUser, tbDepoimentosZoya.idCadastroUserD, tbDepoimentosZoya.idCadastroEmpresa, tbDepoimentosZoya.txdepoimento, tbDepoimentosZoya.apresentar, tbDepoimentosZoya.data, tbCadastroUser.nome, tbCadastroEmpresa.nmempresa FROM tbDepoimentosZoya LEFT OUTER JOIN tbCadastroEmpresa ON tbDepoimentosZoya.idCadastroEmpresa = tbCadastroEmpresa.idCadastroEmpresa LEFT OUTER JOIN tbCadastroUser ON tbDepoimentosZoya.idCadastroUserD = tbCadastroUser.idCadastroUser WHERE (tbDepoimentosZoya.idCadastroUser = @idCadastroUser)" 
        DeleteCommand="DELETE FROM tbDepoimentosZoya WHERE (idDepoimentosZoya = @idDepoimentosZoya)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroUser" SessionField="idCadastroUser" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idDepoimentosZoya" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>

