<%@ Page Title="" Language="VB" MasterPageFile="corporativoPage.master" AutoEventWireup="false" CodeFile="acompanhaPS.aspx.vb" Inherits="_gestor_acompanhaPS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

 
.ResultadoPesquisaPanel
{
	padding-left: 10px;
	padding-top: 10px;
	text-align: left;
}

.h1
{
font-size: 26px;
line-height: 34px;
margin-bottom: 11px;
}

.tituloProcessoSeletivo
{
	opacity: 0.9;
	font-size: 12pt;
	text-decoration: none;
	padding-top: 3px;
	padding-right: 1px;
	padding-left: 3px;
	padding-bottom: 1px;
	margin: 0px;
	cursor: auto;
	font-weight: normal;
	z-index: 0;
}

.textoBold
{
	font-family: "Helvetica Neue" , Arial, Helvetica, Geneva, sans-serif;
	font-size: 9pt;
	text-decoration: none;
	color: #666666;
}

.textoProcessoSeletivo
{
	font-size: 9pt;
	text-decoration: none;
	padding-top: 0px;
	padding-right: 0px;
	padding-left: 0px;
	padding-bottom: 0px;
	margin: 0px;
	cursor: auto;
	font-weight: normal;
	z-index: 0;
	color: #666666;
}
.textoProcessoSeletivoNORMAL
{
	font-size: 9pt;
	text-decoration: none;
	padding-top: 3px;
	padding-right: 1px;
	padding-left: 3px;
	padding-bottom: 1px;
	margin: 0px;
	cursor: auto;
	font-weight: bold;
	z-index: 0;
	color: #000000;
}

.tituloMensagemDB
{
	opacity: 0.9;
	font-size: 12pt;
	text-decoration: none;
	margin: 0px;
	cursor: auto;
	font-weight: normal;
	z-index: 0;
}
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="750" align="center">
        <tr>
            <td>
                <asp:Label ID="CargoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="ProtocoloLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False"></asp:Label>
                                    <asp:DataList ID="DataListMensagem" runat="server" 
                                        DataKeyField="idProcessoSeletivo" DataSourceID="SqlDataSourcePesquisa" 
                                        Width="100%">
                                        <ItemTemplate>
                                            <asp:Label ID="MensagemLabel" runat="server" CssClass="tituloMensagemDB" 
                                                Text='<%# Eval("Mensagem") %>' />
                                        </ItemTemplate>
                                    </asp:DataList>
                    <br />

                    <asp:Panel ID="PanelVISAO" runat="server">
                        <asp:GridView ID="GridViewAtr" runat="server" AutoGenerateColumns="False" 
                        BorderStyle="None" 
                    
    DataKeyNames="Protocolo,Cargo,idProcessoSeletivo,idRH_Gestor" DataSourceID="SqlAtribuicao" 
                        GridLines="Horizontal" Width="100%" 
    Font-Overline="False">
                            <AlternatingRowStyle BackColor="#F2F2F2" />
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="ID" Visible="False" />
                                <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" 
                                Visible="False" />
                                <asp:BoundField DataField="idTypeUser" HeaderText="idTypeUser" 
                                SortExpression="idTypeUser" Visible="False" />
                                <asp:BoundField DataField="nome" HeaderText="Consultor" SortExpression="nome" />
                                <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                SortExpression="idCadastroEmpresa" Visible="False" />
                                <asp:TemplateField HeaderText="Protocolo" SortExpression="Protocolo">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Protocolo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select" 
                                        Text='<%# Eval("Protocolo") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Cargo" HeaderText="Cargo" SortExpression="Cargo" />
                                <asp:BoundField DataField="idRH_Gestor" HeaderText="idRH_Gestor" 
                                SortExpression="idRH_Gestor" Visible="False" />
                                <asp:BoundField DataField="VISUALIDO" HeaderText="V" 
                                SortExpression="VISUALIDO" />
                                <asp:TemplateField HeaderText="P" SortExpression="PUBLICADO" Visible="False">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PUBLICADO") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LabelP" runat="server" Text='<%# Bind("PUBLICADO") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CANDIDATURAS" HeaderText="CE" 
                                SortExpression="CANDIDATURAS" />
                                <asp:BoundField DataField="nmempresa" HeaderText="Empresa" 
                                SortExpression="nmempresa" Visible="False" />
                                <asp:TemplateField HeaderText="CORTEXTO" SortExpression="CORTEXTO" 
                                Visible="False">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CORTEXTO") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LabelCORTEXTO" runat="server" Text='<%# Bind("CORTEXTO") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:GridView>
                </asp:Panel>
                                <asp:Panel ID="PanelPS" runat="server" Visible="False">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="LabelPesquisadosProcessosSeletivos0" runat="server" 
                                                    CssClass="tituloPagina" Text="Status do Processo Seletivo"></asp:Label>
                                            </td>
                                            <td align="right">
                                                <asp:LinkButton ID="LinkButtonFECHAR" runat="server" CssClass="button">Fechar</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:DataList ID="DataListProcessoSeletivo" runat="server" 
                                        DataKeyField="idProcessoSeletivo" DataSourceID="SqlDataSourcePesquisa" 
                                        Width="100%">
                                        <ItemTemplate>
                                            <asp:Label ID="idProcessoSeletivoLabel0" runat="server" 
                                                Text='<%# Eval("idProcessoSeletivo") %>' Visible="False" />
                                            <asp:Label ID="idFaseProcessoSeletivoLabel" runat="server" 
                                                Text='<%# Eval("idFaseProcessoSeletivo") %>' Visible="False" />
                                            <br />
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="nomeprocessoLabel" runat="server" 
                                                            CssClass="tituloProcessoSeletivo" Text='<%# Eval("NomeProcessoSeletivo") %>'></asp:Label>
                                                        <br />
                                                        <asp:Label ID="ProtocoloDBLabel" runat="server" 
                                                            CssClass="tituloProcessoSeletivo" Text='<%# Eval("Protocolo") %>'></asp:Label>
                                                        <asp:Label ID="HifenLabel0" runat="server" CssClass="tituloProcessoSeletivo" 
                                                            Text=" -"></asp:Label>
                                                        <asp:Label ID="ResumoLabel1" runat="server" CssClass="tituloProcessoSeletivo" 
                                                            Text="Fase: "></asp:Label>
                                                        <asp:Label ID="NomeFaseDBLabel" runat="server" 
                                                            CssClass="tituloProcessoSeletivo" Font-Bold="True" 
                                                            Text='<%# Eval("NomeFase") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table ID="DETALHEPS" cellpadding="0" cellspacing="0" width="750px">
                                                            <tr>
                                                                <td>
                                                                    <table ID="RES0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td bgcolor="#EEEEEE" width="140">
                                                                                <asp:Label ID="AberturaLabel" runat="server" CssClass="textoBold" 
                                                                                    Text="Data Abertura:"></asp:Label>
                                                                            </td>
                                                                            <td bgcolor="#EEEEEE">
                                                                                <asp:Label ID="DataInicialProcessoDBLabel" runat="server" 
                                                                                    CssClass="textoProcessoSeletivo" 
                                                                                    Text='<%# Eval("DataInicialProcesso", "{0:d}") %>'></asp:Label>
                                                                            </td>
                                                                            <td align="center" bgcolor="#EEEEEE">
                                                                                &nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="140">
                                                                                <asp:Label ID="EncerramentoLabel" runat="server" CssClass="textoBold" 
                                                                                    Text="Data Encerramento:"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="DataFinalProcessoDBLabel" runat="server" 
                                                                                    CssClass="textoProcessoSeletivo" 
                                                                                    Text='<%# Eval("DataFinalProcesso", "{0:d}") %>'></asp:Label>
                                                                            </td>
                                                                            <td align="center">
                                                                                &nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td bgcolor="#EEEEEE" width="140">
                                                                                <asp:Label ID="AnalistaResLabel" runat="server" CssClass="textoBold" 
                                                                                    Text="Analista Responsável:"></asp:Label>
                                                                            </td>
                                                                            <td bgcolor="#EEEEEE">
                                                                                <asp:Label ID="ConsultorResponsavelDBLabel" runat="server" 
                                                                                    CssClass="textoProcessoSeletivo" Text='<%# Eval("ConsultorResponsavel") %>'></asp:Label>
                                                                            </td>
                                                                            <td bgcolor="#EEEEEE">
                                                                                &nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="140">
                                                                                <asp:Label ID="Label12" runat="server" CssClass="textoBold" 
                                                                                    Text="Candidaturas:"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:LinkButton ID="LinkButtonCandidatura" runat="server" 
                                                                                    CommandArgument='<%# Eval("idFaseProcessoSeletivo") %>' 
                                                                                    CommandName="ESPONTANEO" CssClass="textoProcessoSeletivo" Enabled="False" 
                                                                                    Text='<%# Eval("TotalCandidaturasExpontanea") %>' 
                                                                                    ToolTip="Candidaturas espontâneas vindas pelo portal"></asp:LinkButton>
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;</td>
                                                                        </tr>
                                                                    </table>
                                                                    <br />
                                                                    <table bgcolor="#E7EFDE" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td>
                                                                                <table ID="STATUSFASEPROCESSO" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:Label ID="Label10" runat="server" CssClass="textoBold" 
                                                                                                Text="Processo Seletivo:"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="FechadoLabel" runat="server" 
                                                                                                CssClass="textoProcessoSeletivoABERTO" Text='<%# Eval("flgEncerradoPS") %>'></asp:Label>
                                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="Label11" runat="server" CssClass="textoBold" Text="Fase:"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="statusFASE" runat="server" 
                                                                                                CssClass="textoProcessoSeletivoABERTO" Text='<%# Eval("flgEncerradoFPS") %>'></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="DataLabel1" runat="server" CssClass="tituloProcessoSeletivo" 
                                                            Text="Data de início da fase: "></asp:Label>
                                                        <asp:Label ID="DataInicioFaseDBLabel" runat="server" 
                                                            CssClass="tituloProcessoSeletivo" 
                                                            Text='<%# Eval("DataInicialFase", "{0:d}") %>'></asp:Label>
                                                        <asp:Label ID="DataLabel2" runat="server" CssClass="tituloProcessoSeletivo" 
                                                            Text="&nbsp;&nbsp;Data de encerramento da fase: "></asp:Label>
                                                        <asp:Label ID="DataFinalFaseDBLabel" runat="server" 
                                                            CssClass="tituloProcessoSeletivo" Text='<%# Eval("DataFinalFase", "{0:d}") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <br />
                                            <table cellpadding="5" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="TotalLabel1" runat="server" 
                                                            CssClass="textoProcessoSeletivoNORMAL" Text="TOTAL DE PARTICIPANTES"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="TotalLabel2" runat="server" 
                                                            CssClass="textoProcessoSeletivoNORMAL" Text="CVs ANALISADOS"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="TotalLabel3" runat="server" 
                                                            CssClass="textoProcessoSeletivoABERTO" Text="CVs APROVADOS NA FASE"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="TotalLabel4" runat="server" 
                                                            CssClass="textoProcessoSeletivoFECHADO" Text="CVs REPROVADOS"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <asp:LinkButton ID="LinkButtonPARTICIPANTES" runat="server" 
                                                            CommandArgument='<%# Eval("idFaseProcessoSeletivo") %>' CommandName="NAFASE" 
                                                            CssClass="linkProcessoSeletivo" Enabled="False" 
                                                            Text='<%# Eval("TotalCandidaturas") %>' 
                                                            ToolTip="Total dos participantes da fase"></asp:LinkButton>
                                                    </td>
                                                    <td align="center">
                                                        <asp:LinkButton ID="LinkButtonAnalisado" runat="server" 
                                                            CommandArgument='<%# Eval("idFaseProcessoSeletivo") %>' CommandName="ANALISADO" 
                                                            CssClass="linkProcessoSeletivo" Enabled="False" 
                                                            Text='<%# Eval("TotalAnalisados") %>' ToolTip="Currículos analisados"></asp:LinkButton>
                                                    </td>
                                                    <td align="center">
                                                        <asp:LinkButton ID="LinkButtonAprovado" runat="server" 
                                                            CommandArgument='<%# Eval("idFaseProcessoSeletivo") %>' CommandName="APROVADO" 
                                                            CssClass="linkProcessoSeletivo" Enabled="False" 
                                                            Text='<%# Eval("TotalAprovados") %>' ToolTip="Currículos aprovados"></asp:LinkButton>
                                                    </td>
                                                    <td align="center">
                                                        <asp:LinkButton ID="LinkButtonReprovado" runat="server" 
                                                            CommandArgument='<%# Eval("idFaseProcessoSeletivo") %>' CommandName="REPROVADO" 
                                                            CssClass="linkProcessoSeletivo" Enabled="False" 
                                                            Text='<%# Eval("TotalReprovados") %>' ToolTip="Currículos reprovados"></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                        </ItemTemplate>
                                    </asp:DataList>
                </asp:Panel>
                                <asp:Panel ID="PanelResultadoPesquisa" runat="server" 
                    Visible="False">
                                </asp:Panel>
                                              

    <asp:SqlDataSource ID="SqlAtribuicao" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="_USP_ATRIBUICAO_VIEW_GESTORES" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa_Pai" 
                Type="Int32" />
            <asp:SessionParameter Name="idCadastroEmpresa_Filha" 
                SessionField="idCadastroEmpresa_Filha" Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="idRH_Gestor" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSourcePesquisa" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_PROCESSOSELETIVO_PESQUISA" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="CargoLabel" Name="SearchTerm" 
                                            PropertyName="Text" Type="String" />
                                        <asp:SessionParameter DefaultValue="" Name="idCadastroEmpresa" 
                                            SessionField="idCadastroEmpresa_Pai" Type="Int32" />
                                        <asp:Parameter DefaultValue="2" Name="flgFinalizado" Type="Int32" />
                                        <asp:Parameter DefaultValue="0" Name="idTipoFaseProcessoSeletivo" 
                                            Type="Int32" />
                                        <asp:ControlParameter ControlID="idProcessoSeletivoLabel" DefaultValue="0" 
                                            Name="idProcessoSeletivo" PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="idRH_GestorLabel" DefaultValue="0" 
                                            Name="idRH_Gestor" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                <br />
            </td>
        </tr> 
    </table> 
</asp:Content>

