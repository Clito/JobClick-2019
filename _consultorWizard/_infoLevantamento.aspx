<%@ Page Title="" Language="VB" MasterPageFile="~/_consultorWizard/ConsultorMasterPage.master" AutoEventWireup="false" CodeFile="_infoLevantamento.aspx.vb" Inherits="_empresa_infoLevantamento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="690" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26"></td>
                <td width="664"><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label></td>
            </tr>
        </table>
        <table width="690" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26">
                    <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" />
                </td>
                <td width="664">
                <asp:GridView ID="GridViewListaPerfil" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" 
                    DataKeyNames="idPerfilVaga,idRH_Gestor,data_criacao,Protocolo" 
                    DataSourceID="SqlListaPerfil" 
                    Width="100%">
                    <AlternatingRowStyle BackColor="#DDDDDD" />
                    <Columns>
                        <asp:BoundField DataField="nmempresa" HeaderText="Cliente" 
                            SortExpression="nmempresa" Visible="False" />
                        <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                            SortExpression="Protocolo" />
                        <asp:ButtonField CommandName="Select" DataTextField="dsPerfilVaga" 
                            HeaderText="Perfil (Título)" Text="Button" />
                        <asp:BoundField DataField="idPerfilVaga" HeaderText="idPerfilVaga" 
                            InsertVisible="False" ReadOnly="True" SortExpression="idPerfilVaga" 
                            Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                            SortExpression="idCadastroEmpresa" Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresa_Filha" 
                            HeaderText="idCadastroEmpresa_Filha" SortExpression="idCadastroEmpresa_Filha" 
                            Visible="False" />
                        <asp:BoundField DataField="idstatusvaga" HeaderText="Status Atual" 
                            SortExpression="idstatusvaga" />
                        <asp:BoundField DataField="dsPerfilVaga" HeaderText="Perfil (Título)" 
                            SortExpression="dsPerfilVaga" Visible="False" />
                        <asp:BoundField DataField="Cargo" HeaderText="Cargo" SortExpression="Cargo" 
                            Visible="False" />
                        <asp:BoundField DataField="nrovaga" HeaderText="nrovaga" 
                            SortExpression="nrovaga" Visible="False" />
                        <asp:BoundField DataField="data_aprovacao" HeaderText="Data Aprovacao" 
                            SortExpression="data_aprovacao" Visible="False" />
                        <asp:BoundField DataField="data_criacao" HeaderText="Criada em" 
                            SortExpression="data_criacao" DataFormatString="{0:d}" Visible="False" />
                    </Columns>
                </asp:GridView>
                </td>
            </tr>
        </table>
        <br />
    <asp:SqlDataSource ID="SqlListaPerfil" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="spPerfilVagaSelect_DataGrid_TODOS" 
            SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>

