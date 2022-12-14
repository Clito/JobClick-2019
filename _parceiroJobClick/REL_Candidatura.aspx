<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="REL_Candidatura.aspx.vb" Inherits="_parceiro_REL_Candidato" %>

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
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
    <asp:Label ID="Label2" runat="server" Text="Relatório de Candidaturas" CssClass="titulo"></asp:Label>
    <asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
                    <br />
            <br />
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Empresa Selecionada:"></asp:Label>
                        <br />
    <asp:DropDownList ID="DropDown_Empresa" runat="server" 
        AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="Empresas" 
        DataTextField="nmempresa" DataValueField="idCadastroEmpresa" CssClass="simple">
    </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Texto para pesquisa:"></asp:Label>
                        <br />
    <asp:TextBox ID="TextBox_Pesquisa" runat="server" Width="290px" CssClass="simple"></asp:TextBox>
    <asp:LinkButton ID="LinkButton_Pesquisa" runat="server" CssClass="button">Pesquisar</asp:LinkButton>
                    </td>
                </tr>
            </table>
    <asp:SqlDataSource ID="Empresas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT * FROM [tbCadastroEmpresa] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa) order by nmempresa">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" />
        </SelectParameters>
    </asp:SqlDataSource>
    &nbsp;<br />
    <br />
            <asp:Label ID="Label5" runat="server" Text="Candidaturas:"></asp:Label>
            <br />
                    <asp:GridView ID="GridView_Candidatura" runat="server" AutoGenerateColumns="False" 
                        BorderColor="#CCCCCC" BorderStyle="Dotted" 
        BorderWidth="1px" DataSourceID="REL_CandidatoCandidatura" 
                        GridLines="Horizontal" AllowPaging="True" 
        EnableViewState="False" CssClass="mGrid">
                        <AlternatingRowStyle CssClass="alt" />
                        <Columns>
                            <asp:BoundField DataField="Vaga" HeaderText="Vaga" SortExpression="Vaga" 
                                ReadOnly="True" >
                            </asp:BoundField>
                            <asp:BoundField DataField="Candidaturas" HeaderText="Total de Candidaturas" 
                                SortExpression="Candidaturas" ReadOnly="True" >
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Label ID="Label6" runat="server" Text="Não existem vagas publicadas"></asp:Label>
                        </EmptyDataTemplate>
                        <PagerStyle CssClass="pgr" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="REL_CandidatoCandidatura" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="USP_Relatorio_CandidatoCandidatura_Parceiro" 
        SelectCommandType="StoredProcedure" EnableViewState="False">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDown_Empresa" DefaultValue="" 
                                Name="idCadastroEmpresa" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="TextBox_Pesquisa" 
                                ConvertEmptyStringToNull="False" DefaultValue="" Name="SearchTerm" 
                                PropertyName="Text" Type="String" />
                        </SelectParameters>
    </asp:SqlDataSource>
            </div>
        </div>
</asp:Content>

