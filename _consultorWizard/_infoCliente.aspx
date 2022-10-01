<%@ Page Title="" Language="VB" MasterPageFile="~/_consultorWizard/ConsultorMasterPage.master" AutoEventWireup="false" CodeFile="_infoCliente.aspx.vb" Inherits="_empresa_infoCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26"></td>
                <td width="614"><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label></td>
            </tr>
        </table>
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26">
                    <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" />
                </td>
                <td width="614">
                    <br />
                    <asp:GridView ID="GridViewCliente" runat="server" AutoGenerateColumns="False" 
                        BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px" 
                        DataKeyNames="idCadastroEmpresa" DataSourceID="SqlDataCliente" 
                        GridLines="Horizontal" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                InsertVisible="False" ReadOnly="True" SortExpression="idCadastroEmpresa" 
                                Visible="False" />
                            <asp:BoundField DataField="nmempresa" HeaderText="Cliente" 
                                SortExpression="nmempresa" />
                            <asp:BoundField DataField="cnpj" HeaderText="CNPJ" SortExpression="cnpj" />
                            <asp:BoundField DataField="emailRes" HeaderText="E-mail" 
                                SortExpression="emailRes" />
                            <asp:BoundField DataField="nomeRes" HeaderText="Nome" SortExpression="nomeRes" 
                                Visible="False" />
                            <asp:BoundField DataField="idCadastroEmpresa_Pai" 
                                HeaderText="idCadastroEmpresa_Pai" SortExpression="idCadastroEmpresa_Pai" 
                                Visible="False" />
                            <asp:BoundField DataField="site" HeaderText="Site" SortExpression="site" 
                                Visible="False" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataCliente" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [idCadastroEmpresa], [nmempresa], [cnpj], [emailRes], [nomeRes], [idCadastroEmpresa_Pai], [site] FROM [tbCadastroEmpresa] WHERE ([idCadastroEmpresa_Pai] = @idCadastroEmpresa_Pai)">
                        <SelectParameters>
                            <asp:SessionParameter Name="idCadastroEmpresa_Pai" 
                                SessionField="idCadastroEmpresa" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table> 
</asp:Content>

