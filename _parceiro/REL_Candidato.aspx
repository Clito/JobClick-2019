<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiro/ParceiroPage.master" AutoEventWireup="false" CodeFile="REL_Candidato.aspx.vb" Inherits="_parceiro_REL_Candidato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <br />
    <table id="NAVEGADOR1" align="center" bgcolor="#F3F3F3" cellpadding="0" 
                                    cellspacing="0" width="930px">
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" id="NAVEGADOR2">
                                    <tr>
                                        <td>
                                            <asp:Label ID="PPLabelNomeEmpresa" runat="server" 
                                                            CssClass="bannerNavegadorInternoNomeEmpresa" 
                                                Text="Menu:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image2" runat="server" 
                                                            ImageUrl="~/_corporativo/images/holomatica/navegadorIndicador.png" />
                                        </td>
                                        <td>
                                       <a href="REL_Empresa.aspx?menu=5">Relatório de Empresas</a>
                                        </td>
                                        <td>
                                            <asp:Label ID="separadorLabel5" runat="server" Text="&nbsp;&nbsp;|&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td>
                                            <a href="REL_Candidato.aspx?menu=5">Relatório de Candidato</a>
                                        </td>
                                        <td>
                                            <asp:Label ID="separadorLabel6" runat="server" Text="&nbsp;&nbsp;|&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td>
                                            <a href="REL_Candidatura.aspx?menu=5">Relatório de Candidaturas</a>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
    <h1><asp:Label ID="Label2" runat="server" Text="Relatório de Candidatos"></asp:Label></h1>
    <asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
                    <br />
    <br />
    Região Selecionada
    <asp:DropDownList ID="DropDown_Regiao" runat="server" 
        AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="UF" 
        DataTextField="dsuf" DataValueField="uf">
    </asp:DropDownList>
    <asp:SqlDataSource ID="UF" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="SELECT '' as [uf], 'Todos os Estados' as [dsuf] 
UNION ALL
SELECT [uf], [uf] + ' - ' + [dsuf] as [dsuf] FROM [tbuf]
"></asp:SqlDataSource>
    <br />
    <br />
    <br />
    Candidatos por Área de Atuação<br />
                    <asp:GridView ID="GridView_Area" runat="server" AutoGenerateColumns="False" 
                        BorderColor="#CCCCCC" BorderStyle="Dotted" 
        BorderWidth="1px" DataSourceID="REL_CandidatoAreaAtuação" 
                        GridLines="Horizontal" Width="100%">
                        <AlternatingRowStyle BackColor="#DDDDDD" />
                        <Columns>
                            <asp:BoundField DataField="AreaAtuacao" HeaderText="Area de Atuação" 
                                SortExpression="AreaAtuacao" />
                            <asp:BoundField DataField="TotalCadastrados" HeaderText="Total Cadastrados" 
                                SortExpression="TotalCadastrados" ReadOnly="True" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TotalDisponiveis" 
                                HeaderText="Total Disponiveis para Consulta" ReadOnly="True" 
                                SortExpression="TotalDisponiveis">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="REL_CandidatoAreaAtuação" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="USP_Relatorio_CandidatoAreaAtuacao_Parceiro" 
        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDown_Regiao" Name="UF" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    Candidatos por Região<br />
                    <asp:GridView ID="GridView_Regiao" runat="server" AutoGenerateColumns="False" 
                        BorderColor="#CCCCCC" BorderStyle="Dotted" 
        BorderWidth="1px" DataSourceID="REL_CandidatoRegiao" 
                        GridLines="Horizontal" Width="100%">
                        <AlternatingRowStyle BackColor="#DDDDDD" />
                        <Columns>
                            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
                            <asp:BoundField DataField="UF" HeaderText="Estado (UF)" SortExpression="UF" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Total" HeaderText="Total Cadastrado" 
                                SortExpression="Total" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TotalPublicado" HeaderText="Disponivel para Consulta" 
                                SortExpression="TotalPublicado" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TotalHoje" HeaderText="Cadastrados Hoje" 
                                SortExpression="TotalHoje">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TotalOntem" 
                                HeaderText="Cadastrados Ontem" SortExpression="TotalOntem">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TotalAnteOntem" HeaderText="Cadastrados Anteontem" 
                                SortExpression="TotalAnteOntem">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="REL_CandidatoRegiao" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="USP_Relatorio_CandidatoRegiao_Parceiro" 
        SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>

