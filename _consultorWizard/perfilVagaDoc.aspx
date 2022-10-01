<%@ Page Title="" Language="VB" MasterPageFile="~/_consultorWizard/EmpresaPageDoc.master" AutoEventWireup="false" CodeFile="perfilVagaDoc.aspx.vb" Inherits="_empresa_perfilVagaDoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="PanelDocumento" runat="server" BackColor="White">
        <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="idPerfilVagaLabel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="ProtocoloLabel" runat="server" Visible="False"></asp:Label>
        <br />
        <br />
        <table ID="RelatorioPerfilVaga" cellpadding="5" cellspacing="5" width="100%">
            <tr>
                <td>
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="idPerfilVaga" 
                                        DataSourceID="SqlDocumento" Width="100%">
                        <ItemTemplate>
                            <asp:Label ID="ProtocoloLabelDoc" runat="server" Text="Protocolo:"></asp:Label>
                            <br />
                            <asp:Label ID="ProtocoloLabel" runat="server" CssClass="titulo" 
                                                Text='<%# Eval("Protocolo") %>'></asp:Label>
                            <br />
                            <asp:Label ID="idstatusvagaLabel" runat="server" Font-Italic="True" 
                                                Text='<%# Eval("idstatusvaga") %>' />
                            <br />
                            <br />
                            <asp:Label ID="nmempresaLabel" runat="server" Font-Bold="True" Font-Size="12pt" 
                                                Text='<%# Eval("nmempresa") %>' />
                            <br />
                            <asp:Label ID="cnpjLabel" runat="server" Text='<%# Eval("cnpj") %>' />
                            <br />
                            <br />
                            <asp:Label ID="nomeResLabel" runat="server" Text='<%# Eval("nomeRes") %>' />
                            <br />
                            <asp:Label ID="emailResLabel" runat="server" Text='<%# Eval("emailRes") %>' />
                            <br />
                            <br />
                            <asp:Label ID="enderecoLabel" runat="server" Text='<%# Eval("endereco") %>' />
                                            &nbsp;-
                                            <asp:Label ID="cepLabel" runat="server" Text='<%# Eval("cep") %>' />
                            <br />
                            <asp:Label ID="bairroLabel" runat="server" Text='<%# Eval("bairro") %>' />
                                            &nbsp;-
                                            <asp:Label ID="cidadeLabel" runat="server" Text='<%# Eval("cidade") %>' />
                                            &nbsp;/
                                            <asp:Label ID="ufLabel" runat="server" Text='<%# Eval("uf") %>' />
                                            &nbsp;-
                                            <asp:Label ID="paisLabel" runat="server" Text='<%# Eval("pais") %>' />
                            <br />
                            <br />
                                            [
                                            <asp:Label ID="dddLabel" runat="server" Text='<%# Eval("ddd") %>' />
                                            ] -
                                            <asp:Label ID="telefoneLabel" runat="server" Text='<%# Eval("telefone") %>' />
                            <br />
                            <br />
                            <asp:Label ID="FinanceiroCabecLabel" runat="server" CssClass="titulo" 
                                                Text="Financeiro"></asp:Label>
                            <table ID="Financeiro0" runat="server" cellpadding="0" cellspacing="0" 
                                                class="tableFormulario" visible="true" width="100%">
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%" valign="top">
                                        <asp:Label ID="CestaLabel" runat="server" Text="Cesta:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                                        <asp:Label ID="nomeConsultorCestaLabel" runat="server" 
                                                            Text='<%# Eval("nomeConsultorCesta") %>'></asp:Label>
                                                        <br />
                                                        <asp:Label ID="emailConsultorCestaLabel" runat="server" 
                                                            Text='<%# Eval("emailConsultorCesta") %>'></asp:Label>
                                                        <br />
                                                        <asp:Label ID="dddConsultorCestaLabel" runat="server" 
                                                            Text='<%# Eval("dddConsultorCesta") %>'></asp:Label>
                                                        &nbsp;<asp:Label ID="telefoneConsultorCestaLabel" runat="server" 
                                                            Text='<%# Eval("telefoneConsultorCesta") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="ValordaVagaLabel" runat="server" Text="Valor da Vaga:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="valorVagaLabel" runat="server" 
                                                            Text='<%# Eval("valorVaga", "{0:C}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="valorAceiteLabel0" runat="server" Text="Valor pago no aceite:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="valorAceiteLabel" runat="server" 
                                                            Text='<%# Eval("valorAceite", "{0:C}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%" style="height: 13px">
                                        <asp:Label ID="valorAprovadoLabel0" runat="server" 
                                                            Text="Valor pago na aprovação:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%" style="height: 13px">
                                        <asp:Label ID="valorAprovadoLabel" runat="server" 
                                                            Text='<%# Eval("valorAprovado", "{0:C}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="nroParcelaLabel0" runat="server" Text="Número de parcelas:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="nroParcelaLabel" runat="server" 
                                                            Text='<%# Eval("nroParcela") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="vencimentoLabel0" runat="server" 
                                                            Text="Vencimento da primeira parcela:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="vencimentoLabel" runat="server" 
                                                            Text='<%# Eval("vencimento", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="ValorparcelasLabel" runat="server" Text="Valor das parcelas:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="valorParcelaLabel" runat="server" 
                                                            Text='<%# Eval("valorParcela", "{0:C}") %>' />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:Label ID="ConsultorCabecLabel0" runat="server" CssClass="titulo" 
                                                Text="Consultor"></asp:Label>
                            <table ID="CabecG1" cellpadding="0" cellspacing="0" class="tableFormulario" 
                                                width="100%">
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="LabelDataLev0" runat="server" Text="Data do levantamento:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="data_criacaoLabel" runat="server" 
                                                            Text='<%# Eval("data_criacao", "{0:d}") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="ConsultorLabel2" runat="server" Text="Consultor Responsável:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="nomeLabel" runat="server" Text='<%# Eval("nome") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="ConsultorLabel3" runat="server" Text="e-mail:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="emailLabel0" runat="server" Text='<%# Eval("emailConsultor") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" width="35%">
                                        <asp:Label ID="ConsultorLabel4" runat="server" Text="Telefone:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="dddConsultorLabel0" runat="server" 
                                            Text='<%# Eval("dddConsultor") %>'></asp:Label>
                                        &nbsp;<asp:Label ID="telefoneConsultorLabel0" runat="server" 
                                            Text='<%# Eval("telefoneConsultor") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:Label ID="LabelGeral1" runat="server" CssClass="titulo" 
                                                Text="Dados da Empresa"></asp:Label>
                            <table ID="FormGeral1" cellpadding="0" cellspacing="0" class="tableFormulario" 
                                                width="100%">
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral29" runat="server" Text="Nome:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="nomeEmpresaLabel1" runat="server" CssClass="msnOK" 
                                                            Font-Bold="True" Text='<%# Eval("nmempresa_Filha") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral30" runat="server" Text="Endereço:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="enderecoEmpresaLabel0" runat="server" 
                                                            Text='<%# Eval("endereco_Filha") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral31" runat="server" Text="Contato:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="nomeResLabel0" runat="server" 
                                                            Text='<%# Eval("nomeRes_Filha") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral32" runat="server" Text="Telefone:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="dddFilha" runat="server" Text='<%# Eval("ddd_Filha") %>'></asp:Label>
                                        <asp:Label ID="telefoneEmpresaLabel0" runat="server" 
                                                            Text='<%# Eval("telefone_Filha") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral33" runat="server" Text="e-mail:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="emailEmpresaLabel0" runat="server" 
                                                            Text='<%# Eval("emailRes_Filha") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral34" runat="server" Text="Site http://:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="siteLabel0" runat="server" Text='<%# Eval("site") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral35" runat="server" Text="Segmento de Atuação:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="dsAreaAtuacaoLabel" runat="server" 
                                                            Text='<%# Eval("dsAreaAtuacao") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="PorteLabel" runat="server" Text="Porte:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="dsPorteLabel" runat="server" Text='<%# Eval("dsPorte") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral36" runat="server" Text="Tempo de Existência:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="existenciaLabel0" runat="server" 
                                                            Text='<%# Eval("tempoexistencia") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:Label ID="LabelTituloVagas" runat="server" CssClass="titulo" 
                                                Text="Dados da Vaga"></asp:Label>
                            <br />
                            <asp:Label ID="LegendaLabel" runat="server" 
                                                Text="Legenda:&lt;br&gt;&lt;b&gt;PJ:&lt;/b&gt; Pessoa Jurídica | &lt;b&gt;CLT:&lt;/b&gt; Consolidação das Leis do Trabalho&lt;br&gt;&lt;b&gt;AQ:&lt;/b&gt; Aumento de Quadro | &lt;b&gt;S:&lt;/b&gt; Substituição "></asp:Label>
                            <table ID="RelVaga1" cellpadding="0" cellspacing="0" class="tableFormulario" 
                                                width="100%">
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="Label22" runat="server" Text="Título:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="dsPerfilVagaLabel" runat="server" 
                                                            Text='<%# Eval("dsPerfilVaga") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral10" runat="server" Text="Cargo:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="CargoLabel" runat="server" Text='<%# Eval("Cargo") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral11" runat="server" Text="Número de vagas:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="nrovagaLabel" runat="server" Text='<%# Eval("nrovaga") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral12" runat="server" Text="Confidencial:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="confidencialLabel" runat="server" 
                                                            Text='<%# Eval("confidencial") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral13" runat="server" Text="Tipo de Vaga:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="TipoOportunidadeLabel" runat="server" 
                                                            Text='<%# Eval("TipoOportunidade") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral14" runat="server" Text="Salário Base:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="RemuneracaoLabel" runat="server" 
                                                            Text='<%# Eval("Remuneracao", "{0:C}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral15" runat="server" Text="Honorários: "></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="HonorarioLabel" runat="server" 
                                                            Text='<%# Eval("Honorario", "{0:C}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral16" runat="server" 
                                                            Text="Remuneração Variável/Bônus/PLR:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="RemuneracaoVariavelLabel" runat="server" 
                                                            Text='<%# Eval("RemuneracaoVariavel", "{0:C}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral17" runat="server" Text="Benefícios:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="BeneficiosLabel" runat="server" 
                                                            Text='<%# Eval("Beneficios") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral18" runat="server" Text="Local de Trabalho: "></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="LocalTrabalhoLabel" runat="server" 
                                                            Text='<%# Eval("LocalTrabalho") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral19" runat="server" Text="Perspectiva de Carreira:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="PerspectivaLabel" runat="server" 
                                                            Text='<%# Eval("Perspectiva") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral20" runat="server" Text="Faixa Etária:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <table ID="Faixa1" cellpadding="1" cellspacing="1">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label19" runat="server" Text="De:"></asp:Label>
                                                    <asp:Label ID="FaixaEtariaInicioLabel" runat="server" 
                                                                        Text='<%# Eval("FaixaEtariaInicio") %>' />
                                                                    &nbsp;
                                                                </td>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Text="Até:"></asp:Label>
                                                    <asp:Label ID="FaixaEtariaFimLabel" runat="server" 
                                                                        Text='<%# Eval("FaixaEtariaFim") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label4" runat="server" Text="anos"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral21" runat="server" Text="Sexo:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="SexoLabel" runat="server" Text='<%# Eval("Sexo") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral22" runat="server" 
                                                            Text="Atribuições e Principais Responsabilidades: "></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="Label5" runat="server" 
                                                            Text="(Competências e habilidades específicas)"></asp:Label>
                                        <br />
                                        <asp:Label ID="QualificacaoHabilidadesEspecificasLabel" runat="server" 
                                                            Text='<%# Eval("QualificacaoHabilidadesEspecificas") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral23" runat="server" 
                                                            Text="Perfil e Composição da equipe:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="PerfilComposicaoEquipeLabel" runat="server" 
                                                            Text='<%# Eval("PerfilComposicaoEquipe") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral24" runat="server" Text="Perfil do Gestor:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="PerfilGestorLabel" runat="server" 
                                                            Text='<%# Eval("PerfilGestor") %>' />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:Label ID="LabelTituloVagas0" runat="server" CssClass="titulo" 
                                                Text="Perfil do Candidato"></asp:Label>
                            <table ID="PerfilCandidato1" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral25" runat="server" Text="Formação Acadêmica:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="FormacaoAcademicaLabel" runat="server" Font-Bold="True" 
                                                            Text='<%# Eval("FormacaoAcademica") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral26" runat="server" Text="Idiomas:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="ConhecimentoIdiomaLabel" runat="server" 
                                                            Text='<%# Eval("ConhecimentoIdioma") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral27" runat="server" Text="Informática:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="ConhecimentoInformaticaLabel" runat="server" 
                                                            Text='<%# Eval("ConhecimentoInformatica") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="LabelGeral28" runat="server" Text="Cursos Específicos:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="CursoEspecificoLabel" runat="server" 
                                                            Text='<%# Eval("CursoEspecifico") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="Label6" runat="server" Text="Conhecimentos:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="ConhecimentoLabel" runat="server" 
                                                            Text='<%# Eval("Conhecimento") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="Label7" runat="server" Text="Competências Comportamentais:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="CompetenciaComportamentalLabel" runat="server" 
                                                            Text='<%# Eval("CompetenciaComportamental") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="Label8" runat="server" Text="Competências Profissionais:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="CompetenciaProfissionalLabel" runat="server" 
                                                            Text='<%# Eval("CompetenciaProfissional") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="Label9" runat="server" Text="Aspectos Críticos da Função:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="AspectoCriticoLabel" runat="server" 
                                                            Text='<%# Eval("AspectoCritico") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="Label11" runat="server" 
                                                            Text="Principais Desafios que o Profissional irá enfrentar:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="PrincipalDesafioLabel" runat="server" 
                                                            Text='<%# Eval("PrincipalDesafio") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="Label12" runat="server" Text="Relacionamentos Internos:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="RelacionamentoInternoLabel" runat="server" 
                                                            Text='<%# Eval("RelacionamentoInterno") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="Label13" runat="server" Text="Relacionamentos Externos:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="RelacionamentoExternoLabel" runat="server" 
                                                            Text='<%# Eval("RelacionamentoExterno") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="Label14" runat="server" Text="Viagens:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="viagensLabel" runat="server" Text='<%# Eval("viagens") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="Label21" runat="server" Text="Comentários sobre viagens:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="infoSobre_viagensLabel" runat="server" 
                                                            Text='<%# Eval("infoSobre_viagens") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="Label15" runat="server" Text="Observações:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="ObsComplementaresLabel" runat="server" 
                                                            Text='<%# Eval("ObsComplementares") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="Label16" runat="server" Text="Estrutura Organizacional:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="EstruturaOrganizacionalLabel" runat="server" 
                                                            Text='<%# Eval("EstruturaOrganizacional") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="Label17" runat="server" Text="Levantamento de Perfil de Vaga:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="idstatusvagaLabel0" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" Text='<%# Eval("idstatusvaga") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="Label18" runat="server" 
                                                            Text="Descreva o motivo pela não aprovação do levantamento:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="perfil_vaga_aprovado_comentarioLabel" runat="server" 
                                                            Text='<%# Eval("perfil_vaga_aprovado_comentario") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="tableFormulario" valign="top" width="35%">
                                        <asp:Label ID="aprovacaoLabel" runat="server" Text="Data da Aprovação:"></asp:Label>
                                    </td>
                                    <td class="tableFormulario" width="65%">
                                        <asp:Label ID="data_aprovacaoLabel" runat="server" 
                                                            Text='<%# Eval("data_aprovacao") %>' />
                                                        &nbsp;</td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDocumento" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                            SelectCommand="spPerfilVagaSelect_DOCUMENTO" 
                            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="idCadastroEmpresaLabel" 
                    Name="idCadastroEmpresa" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="idCadastroEmpresaFilhaLabel" 
                                    Name="idCadastroEmpresa_Filha" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="idPerfilVagaLabel" Name="idPerfilVaga" 
                                    PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

