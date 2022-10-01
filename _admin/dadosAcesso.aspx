<%@ Page Title="" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="dadosAcesso.aspx.vb" Inherits="_admin_dadosAcesso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:GridView ID="GridViewACESSO" runat="server" AutoGenerateColumns="False" 
        BorderStyle="None" DataKeyNames="password,email" DataSourceID="SqlAcesso" 
        GridLines="Horizontal" Width="100%">
        <Columns>
            <asp:BoundField DataField="nmempresa" HeaderText="Empresa" 
                SortExpression="nmempresa">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="idTypeUser" HeaderText="Nível" 
                SortExpression="idTypeUser">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="userName" HeaderText="User" 
                SortExpression="userName" Visible="False">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="password" HeaderText="Pass" 
                SortExpression="password">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="frase" HeaderText="frase" SortExpression="frase" 
                Visible="False">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:CheckBoxField DataField="bloquear" HeaderText="bloquear" 
                SortExpression="bloquear" Visible="False">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:CheckBoxField>
            <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" 
                Visible="False">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="cpf" HeaderText="cpf" SortExpression="cpf" 
                Visible="False">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="cnpj" HeaderText="cnpj" SortExpression="cnpj" 
                Visible="False">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="sendMail" HeaderText="sendMail" 
                SortExpression="sendMail" Visible="False">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="ID" 
                SortExpression="idCadastroEmpresa">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="idCadastroEmpresa_baseTalento" 
                HeaderText="idCadastroEmpresa_baseTalento" 
                SortExpression="idCadastroEmpresa_baseTalento" Visible="False">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="idUser" HeaderText="idUser" InsertVisible="False" 
                ReadOnly="True" SortExpression="idUser" Visible="False">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:ButtonField CommandName="Select" Text="Login" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlAcesso" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="SELECT tbuser.idTypeUser, tbuser.userName, tbuser.password, tbuser.email, tbuser.frase, tbuser.bloquear, tbuser.data, tbuser.cpf, tbuser.cnpj, tbuser.sendMail, 
                      tbuser.idCadastroEmpresa, tbuser.idCadastroEmpresa_baseTalento, tbCadastroEmpresa.nmempresa, tbuser.idUser
FROM         tbuser INNER JOIN
                      tbCadastroEmpresa ON tbuser.idCadastroEmpresa = tbCadastroEmpresa.idCadastroEmpresa
WHERE     (tbuser.idTypeUser &lt;&gt; 'Candidato')"></asp:SqlDataSource>
</asp:Content>

