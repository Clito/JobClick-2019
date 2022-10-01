<%@ Page Title="" Language="VB" MasterPageFile="~/_corporativo/corporativoPage.master" AutoEventWireup="false" CodeFile="processoseletivo.aspx.vb" Inherits="_corporativo_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .styleInterno
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <table cellpadding="0" cellspacing="0" align="center" 
            width="100%">
            <tr>
                <td>
                    <br />
                    <br />
                    <table cellpadding="0" cellspacing="0" id="BodyInterno" width="900px" 
                        align="center">
                        <tr>
                            <td align="left">
                                <asp:Label ID="ApresentaCabec" runat="server" Text="Processo Seletivo<br>" 
                                    CssClass="h1"></asp:Label>
                                <asp:Label ID="TipoPesquisaLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="minAderenciaLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False"></asp:Label>
                                <br />
                                <table id="NAVEGADOR" align="center" bgcolor="#F3F3F3" cellpadding="0" 
                                    cellspacing="0" width="930px">
                                    <tr>
                                        <td>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="PPLabelNomeEmpresa" runat="server" 
                                                            CssClass="bannerNavegadorInternoNomeEmpresa" Text="Holomática&nbsp;"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Image ID="Image1" runat="server" 
                                                            ImageUrl="~/_corporativo/images/holomatica/navegadorIndicador.png" />
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButtonHOME" runat="server" 
                                                            PostBackUrl="~/_corporativo/Default.aspx" ToolTip="Volta para a página inicial">Home</asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="separadorLabel2" runat="server" Text="&nbsp;&nbsp;|&nbsp;&nbsp;"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButtonFase" runat="server">&nbsp;Gestão das Fases</asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="separadorLabel0" runat="server" Text="&nbsp;&nbsp;|&nbsp;&nbsp;"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButtonFiltro" runat="server">Gestão dos Filtros para Pesquisa</asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="separadorLabel1" runat="server" Text="&nbsp;&nbsp;|&nbsp;&nbsp;"></asp:Label>
                                                        <asp:LinkButton ID="LinkButtonAdesão" runat="server">Peso da Adesão</asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:Image ID="ImageLinha0" runat="server" 
                                    ImageUrl="~/_corporativo/images/holomatica/linha.png" />
                                <br />
                                <asp:Label ID="LabelPesquisadosProcessosSeletivos" runat="server" CssClass="h1" 
                                    Text="Lista de aderência x currículos"></asp:Label>
                                <br />
                                <asp:Label ID="Label5" runat="server" CssClass="tituloProcessoSeletivo" 
                                    Text="Execução do Processo Seletivo"></asp:Label>
                                <br />
                                <br />
                                <asp:Panel ID="PanelResultadoPesquisa" runat="server" 
                                    CssClass="ResultadoPesquisaPanel" Visible="False">
                                    <asp:Label ID="LabelPesquisadosProcessosSeletivos0" runat="server" CssClass="h1" 
                                    Text="Resultado da Pesquisa"></asp:Label>
                                    <br />
                                    <asp:DataList ID="DataListProcessoSeletivo" runat="server" 
                                        DataKeyField="idProcessoSeletivo" DataSourceID="SqlDataSourcePesquisa" 
                                        Width="100%">
                                        <ItemTemplate>
                                            <asp:Label ID="idProcessoSeletivoLabel" runat="server" 
                                                Text='<%# Eval("idProcessoSeletivo") %>' Visible="False" />
                                            <asp:Label ID="idFaseProcessoSeletivoLabel" runat="server" 
                                                Text='<%# Eval("idFaseProcessoSeletivo") %>' Visible="False" />
                                            <br />
                                            <table cellpadding="0" cellspacing="0" class="styleInterno">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="nomeprocessoLabel" runat="server" 
                                                            CssClass="tituloProcessoSeletivo" Text='<%# Eval("NomeProcessoSeletivo") %>'></asp:Label>
                                                        <asp:Label ID="HifenLabel" runat="server" CssClass="tituloProcessoSeletivo" 
                                                            Text=" -"></asp:Label>
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
                                                        <table cellpadding="0" cellspacing="0" width="930px">
                                                            <tr>
                                                                <td width="70px">
                                                                    <asp:ImageButton ID="ImageButton1" runat="server" 
                                                                        ImageUrl="~/_corporativo/images/holomatica/CHART.png" 
                                                                        ToolTip="Veja os Gráficos deste Processo Seletivo" />
                                                                </td>
                                                                <td width="790px">
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
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="140">
                                                                                <asp:Label ID="EncerramentoLabel" runat="server" CssClass="textoBold" 
                                                                                    Text="Data Encerramento:"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="DataFinalProcessoDBLabel2" runat="server" 
                                                                                    CssClass="textoProcessoSeletivo" 
                                                                                    Text='<%# Eval("DataFinalProcesso", "{0:d}") %>'></asp:Label>
                                                                            </td>
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
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="140">
                                                                                <asp:Label ID="StatusLabel" runat="server" CssClass="textoBold" Text="Status:"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="FechadoLabel" runat="server" 
                                                                                    CssClass="textoProcessoSeletivoABERTO" Text='<%# Eval("flgEncerrado") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="70px">
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="DataLabel1" runat="server" CssClass="tituloProcessoSeletivo" 
                                                            Text="Início desta fase: "></asp:Label>
                                                        <asp:Label ID="DataInicioFaseDBLabel" runat="server" 
                                                            CssClass="tituloProcessoSeletivo" 
                                                            Text='<%# Eval("DataInicialFase", "{0:d}") %>'></asp:Label>
                                                        <asp:Label ID="DataLabel2" runat="server" CssClass="tituloProcessoSeletivo" 
                                                            Text=" - encerramento desta fase: "></asp:Label>
                                                        <asp:Label ID="DataFinalFaseDBLabel" runat="server" 
                                                            CssClass="tituloProcessoSeletivo" Text='<%# Eval("DataFinalFase", "{0:d}") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <asp:Image ID="ImageLinha1" runat="server" 
                                                ImageUrl="~/_corporativo/images/holomatica/linha.png" />
                                            <br />
                                            <table cellpadding="5" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="TotalLabel1" runat="server" 
                                                            CssClass="textoProcessoSeletivoNORMAL" 
                                                            Text="TOTAL DE CVs CANDIDATURA EXPONTÂNEA"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="TotalLabel2" runat="server" 
                                                            CssClass="textoProcessoSeletivoNORMAL" Text="TOTAL DE CVs ANALIZADOS"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="TotalLabel3" runat="server" 
                                                            CssClass="textoProcessoSeletivoABERTO" Text="TOTAL CVs APROVADOS NA FASE"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="TotalLabel4" runat="server" 
                                                            CssClass="textoProcessoSeletivoFECHADO" Text="TOTAL DE CVs REPROVADOS"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <asp:LinkButton ID="LinkButtonCandidatura" runat="server" 
                                                            CssClass="tituloProcessoSeletivo" Text='<%# Eval("TotalCandidaturas") %>' 
                                                            CommandName="Select"></asp:LinkButton>
                                                    </td>
                                                    <td align="center">
                                                        <asp:LinkButton ID="LinkButtonAnalisado" runat="server" 
                                                            CssClass="tituloProcessoSeletivo" Text='<%# Eval("TotalAnalisados") %>' 
                                                            CommandName="Select"></asp:LinkButton>
                                                    </td>
                                                    <td align="center">
                                                        <asp:LinkButton ID="LinkButtonAprovado" runat="server" 
                                                            CssClass="tituloProcessoSeletivo" Text='<%# Eval("TotalAprovados") %>' 
                                                            CommandName="Select"></asp:LinkButton>
                                                    </td>
                                                    <td align="center">
                                                        <asp:LinkButton ID="LinkButtonReprovado" runat="server" 
                                                            CssClass="tituloProcessoSeletivo" Text='<%# Eval("TotalReprovados") %>' 
                                                            CommandName="Select"></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:Image ID="ImageLinha2" runat="server" 
                                                ImageUrl="~/_corporativo/images/holomatica/linha.png" />
                                            <br />
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList ID="DataListMensagem" runat="server" 
                                        DataKeyField="idProcessoSeletivo" DataSourceID="SqlDataSourcePesquisa" 
                                        Width="100%">
                                        <ItemTemplate>
                                            <asp:Label ID="MensagemLabel" runat="server" CssClass="tituloMensagemDB" 
                                                Text='<%# Eval("Mensagem") %>' />
                                            <br />
                                            <br />
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <br />
                                    <br />
                                </asp:Panel>
                                <asp:Panel ID="PanelListaCandidato" runat="server" 
                                    CssClass="ResultadoPesquisaPanel" Visible="False">
                                    <asp:Image ID="ImageLinha2" runat="server" 
                                        ImageUrl="~/_corporativo/images/holomatica/linha.png" />
                                    <br />
                                    <asp:DataList ID="DataListResultado" runat="server" 
                                        DataSourceID="SqlDataSourceCandidato" Width="100%">
                                        <ItemTemplate>
                                            <asp:Label ID="idProcessoSeletivoLabel" runat="server" 
                                                Text='<%# Eval("idProcessoSeletivo") %>' Visible="False" />
                                            <asp:Label ID="idcurriculoLabel" runat="server" 
                                                Text='<%# Eval("idcurriculo") %>' Visible="False" />
                                            <asp:Label ID="idUserLabel" runat="server" Text='<%# Eval("idUser") %>' 
                                                Visible="False" />
                                            <br />
                                            <table ID="CANDIDATO0" cellpadding="0" cellspacing="0" class="styleInterno">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="ListaLabel" runat="server" CssClass="tituloProcessoSeletivo" 
                                                            Text="Lista dos aprovados na fase (Análise de Currículos)"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table cellpadding="0" cellspacing="0" class="styleInterno">
                                                            <tr>
                                                                <td valign="top" width="60px">
                                                                    <asp:ImageButton ID="ImageButtonCadidato" runat="server" 
                                                                        ImageUrl='<%# Eval("foto") %>' Width="60px" />
                                                                </td>
                                                                <td width="350px">
                                                                    <table cellpadding="10" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="NomeLabel0" runat="server" CssClass="textoResumoCV" 
                                                                                    Font-Bold="True" Text='<%# Eval("nome") %>'></asp:Label>
                                                                                <br />
                                                                                <asp:Label ID="ResumoLabelCV" runat="server" CssClass="textoResumoCV" 
                                                                                    Text='<%# Eval("resumo") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <br />
                                                                </td>
                                                                <td>
                                                                    <table ID="ADERENCIA0" align="center" cellpadding="0" cellspacing="0" 
                                                                        width="100%">
                                                                        <tr>
                                                                            <td align="center">
                                                                                <asp:Label ID="CabecLabelAderencia" runat="server" CssClass="textoBold" 
                                                                                    Text="ADERÊNCIA" ToolTip="Nível de aderência do Candidato com a Vaga"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="center">
                                                                                <asp:Label ID="Label4" runat="server" CssClass="ADERENCIA" 
                                                                                    Text='<%# Eval("aderencia") & "%" %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="center" width="80px">
                                                                    <asp:ImageButton ID="ImageButtonCHAT" runat="server" 
                                                                        ImageUrl="~/_corporativo/images/holomatica/CHAT.png" 
                                                                        ToolTip="Agenda Entrevista Virtual" />
                                                                </td>
                                                                <td align="center" width="80px">
                                                                    <asp:ImageButton ID="ImageButtonAGENDA" runat="server" 
                                                                        ImageUrl="~/_corporativo/images/holomatica/AGENDA.png" 
                                                                        ToolTip="Agenda Entrevista Presencial" />
                                                                </td>
                                                                <td align="center" width="80px">
                                                                    <asp:ImageButton ID="ImageButtonEMAIL" runat="server" 
                                                                        ImageUrl="~/_corporativo/images/holomatica/EMAIL.png" 
                                                                        ToolTip="Comunicação com o Candidato" />
                                                                </td>
                                                                <td align="center" width="80px">
                                                                    <asp:ImageButton ID="ImageButtonAPROVADO" runat="server" 
                                                                        ImageUrl="~/_corporativo/images/holomatica/CVAPROVADO.png" />
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td align="center" width="80px">
                                                                    <asp:ImageButton ID="ImageButtonREPROVADO" runat="server" 
                                                                        ImageUrl="~/_corporativo/images/holomatica/CVREPROVADO.png" />
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <br />
                                </asp:Panel>
                                <br />
                                <br />
                                <br />
                                <asp:SqlDataSource ID="SqlDataSourcePesquisa" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_PROCESSOSELETIVO_PESQUISA" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter Name="SearchTerm" Type="String" />
                                        <asp:Parameter DefaultValue="17" Name="idCadastroEmpresa" Type="Int32" />
                                        <asp:Parameter DefaultValue="" Name="flgFinalizado" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSourceCandidato" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_PROCESSOSELETIVO_PESQUISA_CV" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idRH_GestorLabel" DefaultValue="0" 
                                            Name="idRH_Gestor" PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="idProcessoSeletivoLabel" DefaultValue="" 
                                            Name="idProcessoSeletivo" PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="minAderenciaLabel" DefaultValue="50" 
                                            Name="minAderencia" PropertyName="Text" Type="Int32" />
                                        <asp:Parameter DefaultValue="0" Name="Peso_Aderencia_Idade" Type="Int32" />
                                        <asp:Parameter Name="Peso_Aderencia_Sexo" Type="Int32" DefaultValue="0" />
                                        <asp:Parameter Name="Peso_Aderencia_PretencaoSalarial" Type="Int32" 
                                            DefaultValue="0" />
                                        <asp:Parameter Name="Peso_Aderencia_FormacaoAcademica" Type="Int32" 
                                            DefaultValue="0" />
                                        <asp:Parameter Name="Peso_Aderencia_FormacaoAcademica_Instituicao" 
                                            Type="Int32" DefaultValue="0" />
                                        <asp:Parameter Name="Peso_Aderencia_UF" Type="Int32" DefaultValue="0" />
                                        <asp:Parameter Name="Peso_Aderencia_LocalTrabalho" Type="Int32" 
                                            DefaultValue="0" />
                                        <asp:Parameter Name="Peso_Aderencia_AreaInteresse" Type="Int32" 
                                            DefaultValue="0" />
                                        <asp:Parameter Name="Peso_Aderencia_ExperienciaCargo" Type="Int32" 
                                            DefaultValue="0" />
                                        <asp:Parameter Name="Peso_Aderencia_ExperienciaArea" Type="Int32" 
                                            DefaultValue="0" />
                                        <asp:Parameter Name="Peso_Aderencia_ExperienciaAnos" Type="Int32" 
                                            DefaultValue="0" />
                                        <asp:Parameter Name="Peso_Aderencia_ConhecimentoInformatica" Type="Int32" 
                                            DefaultValue="0" />
                                        <asp:Parameter Name="Peso_Aderencia_ConhecimentoInformatica_Software" 
                                            Type="Int32" DefaultValue="0" />
                                        <asp:Parameter Name="Peso_Aderencia_ConhecimentoInformatica_Grau" 
                                            Type="Int32" DefaultValue="0" />
                                        <asp:Parameter Name="Peso_Aderencia_Idioma" Type="Int32" DefaultValue="0" />
                                        <asp:Parameter Name="Peso_Aderencia_Idioma_Proficiencia" Type="Int32" 
                                            DefaultValue="0" />
                                        <asp:ControlParameter ControlID="TipoPesquisaLabel" DefaultValue="Expontanea" 
                                            Name="tipoPesquisa" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                                <br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>


