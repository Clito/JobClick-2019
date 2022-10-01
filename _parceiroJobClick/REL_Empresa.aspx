<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="REL_Empresa.aspx.vb" Inherits="_parceiro_REL_Candidato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="conteudo">
        <div id="corpoformulario">
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
                                                            ImageUrl="~/_parceiroJobClick/images/navegadorIndicador.png" />
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
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
    <asp:Label ID="Label2" runat="server" Text="Relatório de Empresas" CssClass="titulo"></asp:Label>
    <asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
                    <br />
    <br />
    <asp:ListView ID="ListView1" runat="server" 
        DataSourceID="REL_EmpresaVagaDetalhe2" GroupItemCount="3">
        <AlternatingItemTemplate>
            <td runat="server" style="">
                ORDERID:
                <asp:Label ID="ORDERIDLabel" runat="server" Text='<%# Eval("ORDERID") %>' />
                <br />strProtocolo:
                <asp:Label ID="strProtocoloLabel" runat="server" 
                    Text='<%# Eval("strProtocolo") %>' />
                <br />strVaga:
                <asp:Label ID="strVagaLabel" runat="server" Text='<%# Eval("strVaga") %>' />
                <br />strDsVaga:
                <asp:Label ID="strDsVagaLabel" runat="server" Text='<%# Eval("strDsVaga") %>' />
                <br />numQtdVaga:
                <asp:Label ID="numQtdVagaLabel" runat="server" 
                    Text='<%# Eval("numQtdVaga") %>' />
                <br />strLocalTrabalho:
                <asp:Label ID="strLocalTrabalhoLabel" runat="server" 
                    Text='<%# Eval("strLocalTrabalho") %>' />
                <br />strUF:
                <asp:Label ID="strUFLabel" runat="server" Text='<%# Eval("strUF") %>' />
                <br />strValidade:
                <asp:Label ID="strValidadeLabel" runat="server" 
                    Text='<%# Eval("strValidade") %>' />
                <br />Visualizacoes:
                <asp:Label ID="VisualizacoesLabel" runat="server" 
                    Text='<%# Eval("Visualizacoes") %>' />
                <br />Candidaturas:
                <asp:Label ID="CandidaturasLabel" runat="server" 
                    Text='<%# Eval("Candidaturas") %>' />
                <br />
            </td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="">
                ORDERID:
                <asp:TextBox ID="ORDERIDTextBox" runat="server" Text='<%# Bind("ORDERID") %>' />
                <br />strProtocolo:
                <asp:TextBox ID="strProtocoloTextBox" runat="server" 
                    Text='<%# Bind("strProtocolo") %>' />
                <br />strVaga:
                <asp:TextBox ID="strVagaTextBox" runat="server" Text='<%# Bind("strVaga") %>' />
                <br />strDsVaga:
                <asp:TextBox ID="strDsVagaTextBox" runat="server" 
                    Text='<%# Bind("strDsVaga") %>' />
                <br />numQtdVaga:
                <asp:TextBox ID="numQtdVagaTextBox" runat="server" 
                    Text='<%# Bind("numQtdVaga") %>' />
                <br />strLocalTrabalho:
                <asp:TextBox ID="strLocalTrabalhoTextBox" runat="server" 
                    Text='<%# Bind("strLocalTrabalho") %>' />
                <br />strUF:
                <asp:TextBox ID="strUFTextBox" runat="server" Text='<%# Bind("strUF") %>' />
                <br />strValidade:
                <asp:TextBox ID="strValidadeTextBox" runat="server" 
                    Text='<%# Bind("strValidade") %>' />
                <br />Visualizacoes:
                <asp:TextBox ID="VisualizacoesTextBox" runat="server" 
                    Text='<%# Bind("Visualizacoes") %>' />
                <br />Candidaturas:
                <asp:TextBox ID="CandidaturasTextBox" runat="server" 
                    Text='<%# Bind("Candidaturas") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                    Text="Update" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Cancel" />
                <br />
            </td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr runat="server">
                    <td runat="server">
                        &nbsp;</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
<td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr ID="itemPlaceholderContainer" runat="server">
                <td ID="itemPlaceholder" runat="server">
                </td>
            </tr>
        </GroupTemplate>
        <InsertItemTemplate>
            <td runat="server" style="">
                ORDERID:
                <asp:TextBox ID="ORDERIDTextBox" runat="server" Text='<%# Bind("ORDERID") %>' />
                <br />strProtocolo:
                <asp:TextBox ID="strProtocoloTextBox" runat="server" 
                    Text='<%# Bind("strProtocolo") %>' />
                <br />strVaga:
                <asp:TextBox ID="strVagaTextBox" runat="server" Text='<%# Bind("strVaga") %>' />
                <br />strDsVaga:
                <asp:TextBox ID="strDsVagaTextBox" runat="server" 
                    Text='<%# Bind("strDsVaga") %>' />
                <br />numQtdVaga:
                <asp:TextBox ID="numQtdVagaTextBox" runat="server" 
                    Text='<%# Bind("numQtdVaga") %>' />
                <br />strLocalTrabalho:
                <asp:TextBox ID="strLocalTrabalhoTextBox" runat="server" 
                    Text='<%# Bind("strLocalTrabalho") %>' />
                <br />strUF:
                <asp:TextBox ID="strUFTextBox" runat="server" Text='<%# Bind("strUF") %>' />
                <br />strValidade:
                <asp:TextBox ID="strValidadeTextBox" runat="server" 
                    Text='<%# Bind("strValidade") %>' />
                <br />Visualizacoes:
                <asp:TextBox ID="VisualizacoesTextBox" runat="server" 
                    Text='<%# Bind("Visualizacoes") %>' />
                <br />Candidaturas:
                <asp:TextBox ID="CandidaturasTextBox" runat="server" 
                    Text='<%# Bind("Candidaturas") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                    Text="Insert" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Clear" />
                <br />
            </td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" style="">
                <strong>Protocolo:</strong>
                <asp:Label ID="strProtocoloLabel" runat="server" style="font-style: italic" 
                    Text='<%# Eval("strProtocolo") %>'></asp:Label>
                <br />
                <strong>Vaga:</strong>
                <asp:Label ID="strVagaLabel" runat="server" Text='<%# Eval("strVaga") %>' />
                <br />
                <br /><strong>Descrição:</strong>
                <br />
                <asp:Label ID="strDsVagaLabel" runat="server" Text='<%# Eval("strDsVaga") %>' />
                <br />
                <br /><strong>Qauntidade de Vagas:</strong>
                <asp:Label ID="numQtdVagaLabel" runat="server" 
                    Text='<%# Eval("numQtdVaga") %>' />
                <br /><strong>Local de Trabalho:</strong>
                <asp:Label ID="strLocalTrabalhoLabel" runat="server" 
                    Text='<%# Eval("strLocalTrabalho") %>' />
                <br /><strong>UF:</strong>
                <asp:Label ID="strUFLabel" runat="server" Text='<%# Eval("strUF") %>' />
                <br /><strong>Validade:</strong>
                <asp:Label ID="strValidadeLabel" runat="server" 
                    Text='<%# Eval("strValidade") %>' />
                <br />
                <br /><strong>Visualizacoes: </strong>
                <asp:Label ID="VisualizacoesLabel" runat="server" 
                    Text='<%# Eval("Visualizacoes") %>' />
                <br /><strong>Candidaturas: </strong>
                <asp:Label ID="CandidaturasLabel" runat="server" 
                    Text='<%# Eval("Candidaturas") %>' />
                <br />
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr ID="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" style="">
                <strong>Protocolo:</strong>
                <asp:Label ID="strProtocoloLabel" runat="server" style="font-style: italic" 
                    Text='<%# Eval("strProtocolo") %>'></asp:Label>
                <br /><strong>Vaga:</strong>
                <asp:Label ID="strVagaLabel" runat="server" Text='<%# Eval("strVaga") %>'></asp:Label>
                <br />
                <br />
                <strong>Descrição:</strong>
                <br />
                <asp:Label ID="strDsVagaLabel" runat="server" Text='<%# Eval("strDsVaga") %>'></asp:Label>
                <br />
                <br />
                <strong>Qauntidade de Vagas:</strong>
                <asp:Label ID="numQtdVagaLabel" runat="server" Text='<%# Eval("numQtdVaga") %>'></asp:Label>
                <br />
                <strong>Local de Trabalho:</strong>
                <asp:Label ID="strLocalTrabalhoLabel" runat="server" 
                    Text='<%# Eval("strLocalTrabalho") %>'></asp:Label>
                <br />
                <strong>UF:</strong>
                <asp:Label ID="strUFLabel" runat="server" Text='<%# Eval("strUF") %>'></asp:Label>
                <br />
                <strong>Validade:</strong>
                <asp:Label ID="strValidadeLabel" runat="server" 
                    Text='<%# Eval("strValidade") %>'></asp:Label>
                <br />
                <br />
                <strong>Visualizacoes: </strong>
                <asp:Label ID="VisualizacoesLabel" runat="server" 
                    Text='<%# Eval("Visualizacoes") %>'></asp:Label>
                <br />
                <strong>Candidaturas: </strong>
                <asp:Label ID="CandidaturasLabel" runat="server" 
                    Text='<%# Eval("Candidaturas") %>'></asp:Label>
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="REL_EmpresaVagaDetalhe2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="USP_Relatorio_EmpresaVagaDetalhe_Parceiro" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView_Vaga" Name="Protocolo" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="GridView_Empresas" Name="idEmpresa" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
<div style="vertical-align: middle; text-align: center">
                    <asp:GridView ID="GridView_Vaga" runat="server" AutoGenerateColumns="False" 
                        BorderColor="#CCCCCC" BorderStyle="Dotted" 
        BorderWidth="1px" DataSourceID="REL_EmpresaVagaDetalhe1" 
                        GridLines="Horizontal" 
        DataKeyNames="strProtocolo" CssClass="mGrid">
                        <AlternatingRowStyle BackColor="#DDDDDD" />
                        <Columns>
                            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
                            <asp:BoundField DataField="strProtocolo" HeaderText="Protocolo" 
                                SortExpression="strProtocolo" />
                            <asp:BoundField DataField="strVaga" HeaderText="Vaga" 
                                SortExpression="strVaga" />
                            <asp:BoundField DataField="numQtdVaga" HeaderText="Quantidade de Vagas" 
                                SortExpression="numQtdVaga" />
                            <asp:BoundField DataField="Visualizacoes" HeaderText="Visualizacoes" 
                                SortExpression="Visualizacoes" />
                            <asp:BoundField DataField="Candidaturas" HeaderText="Candidaturas" 
                                ReadOnly="True" SortExpression="Candidaturas" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="REL_EmpresaVagaDetalhe1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="USP_Relatorio_EmpresaVagaDetalhe_Parceiro" 
        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="''" Name="Protocolo" Type="String" />
                            <asp:ControlParameter ControlID="GridView_Empresas" Name="idEmpresa" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
    </asp:SqlDataSource>
                    <br />
                    <br />
                    <asp:GridView ID="GridView_Empresas" runat="server" AutoGenerateColumns="False" 
                        BorderColor="#CCCCCC" BorderStyle="Dotted" 
        BorderWidth="1px" DataSourceID="REL_EmpresaVaga" 
                        GridLines="Horizontal" 
        DataKeyNames="idEmpresa" CssClass="mGrid">
                        <AlternatingRowStyle BackColor="#DDDDDD" />
                        <Columns>
                            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
                            <asp:BoundField DataField="nomeEmpresa" HeaderText="Empresa" 
                                SortExpression="nomeEmpresa" />
                            <asp:BoundField DataField="TotalVagasPublicadas" 
                                HeaderText="Total de Vagas Publicadas" ReadOnly="True" 
                                SortExpression="TotalVagasPublicadas" />
                            <asp:BoundField DataField="TotalVisualizacoes" 
                                HeaderText="Total de Visualizacoes" ReadOnly="True" 
                                SortExpression="TotalVisualizacoes" />
                            <asp:BoundField DataField="TotalCandidaturas" 
                                HeaderText="Total de Candidaturas" ReadOnly="True" 
                                SortExpression="TotalCandidaturas" />
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Label ID="Label3" runat="server" Text="Não existe(m) empresa(s) pagante(s) utilizando o sistema vinculada(s) à sua região.&lt;br&gt;Não há comissionamento de 10% para a sua empresa."></asp:Label>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:SqlDataSource ID="REL_EmpresaVaga" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="USP_Relatorio_EmpresaVaga_Parceiro" 
        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idParceiro" SessionField="idCadastroEmpresa" 
                                Type="Int32" />
                        </SelectParameters>
    </asp:SqlDataSource>
    </div>
            </div>
        </div>
    </asp:Content>

