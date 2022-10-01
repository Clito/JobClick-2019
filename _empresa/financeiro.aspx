<%@ Page Title="" Language="VB" MasterPageFile="~/_empresa/EmpresaPage.master" AutoEventWireup="false"  CodeFile="financeiro.aspx.vb" Inherits="_empresa_financeiro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="ImageCabec" runat="server" ImageUrl="~/images/empresa/titFinanceiroRH.gif" />
        <table width="640" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" />
            </td>
            <td width="614">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" BorderStyle="None" 
                    BorderWidth="0px" DataKeyNames="idFinanceiro" DataSourceID="SqlFinanceiro" 
                    GridLines="Horizontal" Width="100%">
                    <AlternatingRowStyle BackColor="#EAEAEA" HorizontalAlign="Left" />
                    <Columns>
                        <asp:BoundField DataField="idFinanceiro" HeaderText="idFinanceiro" 
                            InsertVisible="False" ReadOnly="True" SortExpression="idFinanceiro" 
                            Visible="False" />
                        <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                            SortExpression="Protocolo" />
                        <asp:BoundField DataField="idCadastroEmpresaFilha" 
                            HeaderText="idCadastroEmpresaFilha" SortExpression="idCadastroEmpresaFilha" 
                            Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresaPai" 
                            HeaderText="idCadastroEmpresaPai" SortExpression="idCadastroEmpresaPai" 
                            Visible="False" />
                        <asp:BoundField DataField="idTipoCobranca" HeaderText="idTipoCobranca" 
                            SortExpression="idTipoCobranca" Visible="False" />
                        <asp:BoundField DataField="valor_Pagamento" DataFormatString="{0:c}" 
                            HeaderText="Valor" SortExpression="valor_Pagamento" />
                        <asp:BoundField DataField="data_Pagamento" DataFormatString="{0:d}" 
                            HeaderText="Vencimento" SortExpression="data_Pagamento" />
                        <asp:BoundField DataField="obs" HeaderText="Obs.:" SortExpression="obs" />
                        <asp:BoundField DataField="dsTipoCobraca" HeaderText="Tipo" 
                            SortExpression="dsTipoCobraca" />
                    </Columns>
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlFinanceiro" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_LISTACOBRANCA_EMITIDAS" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idCadastroEmpresaPai" 
                            SessionField="idCadastroEmpresa" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        </table> 
</asp:Content>

