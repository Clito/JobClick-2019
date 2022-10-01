<%@ Page Title="" Language="VB" MasterPageFile="~/_gestor/GestorMasterPage.master" AutoEventWireup="false" CodeFile="_infoProcessoSeletivo.aspx.vb" Inherits="_gestor_infoProcessoSeletivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
                    <br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px" DataKeyNames="ID" 
                        DataSourceID="SqlPS" GridLines="Vertical" Width="100%">
                        <AlternatingRowStyle BackColor="#EBEBEB" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="ID" Visible="False" />
                            <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                                SortExpression="Protocolo" />
                            <asp:BoundField DataField="dsProcesso" HeaderText="Processo" 
                                SortExpression="dsProcesso" Visible="False" />
                            <asp:BoundField DataField="idTipoFaseProcessoSeletivo" 
                                HeaderText="idTipoFaseProcessoSeletivo" 
                                SortExpression="idTipoFaseProcessoSeletivo" Visible="False" />
                            <asp:BoundField DataField="idFaseProcessoSeletivo" 
                                HeaderText="idFaseProcessoSeletivo" SortExpression="idFaseProcessoSeletivo" 
                                Visible="False" />
                            <asp:BoundField DataField="dataIni" HeaderText="Inicio" 
                                SortExpression="dataIni" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="dataFim" HeaderText="Final" 
                                SortExpression="dataFim" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                SortExpression="idCadastroEmpresa" Visible="False" />
                            <asp:BoundField DataField="idCadastroEmpresa_Filha" 
                                HeaderText="idCadastroEmpresa_Filha" SortExpression="idCadastroEmpresa_Filha" 
                                Visible="False" />
                            <asp:BoundField DataField="dsFase" HeaderText="Fase" SortExpression="dsFase" />
                            <asp:BoundField DataField="CV" HeaderText="CVs" SortExpression="CV" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:SqlDataSource ID="SqlPS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="_USP_EMPRESA_PROCESSO_SELETIVO_CV" 
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idCadastroEmpresa_Filha" 
                                SessionField="idCadastroEmpresaFilha" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
</asp:Content>

