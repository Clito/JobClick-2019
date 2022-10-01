<%@ Page Language="VB" MaintainScrollPositionOnPostback="true" MasterPageFile="~/_anonimo/AderenciaCurriculoPage.master" AutoEventWireup="true" CodeFile="mycurriculoAderencia.aspx.vb" Inherits="_candidato_mycurriculo" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <script type="text/javascript">
            $(function () {
                $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
        });
	</script>
        <table id="AVALIACAO" width="626px">
            <tr>
                <td>
                    <asp:Panel ID="PanelCandidatura" runat="server">
                        <asp:Label ID="idPerfilVagaLabel" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="idcurriculoLabel" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="NivelAprovacaoLabel" runat="server" Visible="False"></asp:Label>
                        <br />
                        <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                            <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                                <tr>
                                    <td align="center">
                                        <asp:Image ID="ImageAVISO" runat="server" ImageUrl="~/_anonimo/images/buttonOK.png" />
                                    </td>
                                    <td align="center">
                                        <asp:Label ID="AVISOLABEL" runat="server" CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />
                        <table id="FormReprovaAprova" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td align="center">
                                    <asp:DataList ID="DataListDETALHE" runat="server" DataSourceID="SqlDETALHEVAGA">
                                        <ItemTemplate>
                                            <table align="left" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td align="left">
                                                        <asp:Label ID="Label46" runat="server" Text="Sistema de Aderência"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="nomeprocessoLabel" runat="server" CssClass="tituloEmpresa" Text='<%# Eval("dsfuncao") %>'></asp:Label>
                                                        <asp:Label ID="HifenLabel" runat="server" CssClass="tituloEmpresa" Text=" -"></asp:Label>
                                                        <asp:Label ID="ProtocoloDBLabel" runat="server" CssClass="tituloEmpresa" Text='<%# Eval("Protocolo") %>'></asp:Label>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" valign="top" width="70px">&nbsp;</td>
                                                                <td width="790px">
                                                                    <table id="RES1" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="right" bgcolor="#EEEEEE" valign="top" width="155">
                                                                                <asp:Label ID="AberturaLabel" runat="server" CssClass="textoBold" Text="Data Abertura:"></asp:Label>
                                                                            </td>
                                                                            <td align="left" bgcolor="#EEEEEE">
                                                                                <asp:Label ID="DataInicialProcessoDBLabel" runat="server" CssClass="textoProcessoSeletivo" Text='<%# Eval("dataIni", "{0:d}") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="right" style="height: 13px" valign="top" width="155">
                                                                                <asp:Label ID="EncerramentoLabel" runat="server" CssClass="textoBold" Text="Data Encerramento:"></asp:Label>
                                                                            </td>
                                                                            <td align="left" style="height: 13px">
                                                                                <asp:Label ID="DataFinalProcessoDBLabel2" runat="server" CssClass="textoProcessoSeletivo" Text='<%# Eval("dataFim", "{0:d}") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="right" bgcolor="#EEEEEE" valign="top" width="155">
                                                                                <asp:Label ID="LabelVISUALIZACAO" runat="server" CssClass="textoBold" Text="Visualizações:"></asp:Label>
                                                                            </td>
                                                                            <td align="left" bgcolor="#EEEEEE">
                                                                                <asp:Label ID="TotalVisualizacaoLabel" runat="server" CssClass="textoProcessoSeletivo" Text='<%# Eval("cntCV") %>' />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="right" valign="top" width="155">&nbsp;</td>
                                                                            <td align="left">&nbsp;</td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="70px">&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <asp:Label ID="Label45" runat="server" CssClass="tituloEmpresa" 
                        Text="Análise de Currículo"></asp:Label>
                        <asp:DataList ID="DataListCV" runat="server" DataSourceID="SqlCV" Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="idCadastroUserLabel" runat="server" Text='<%# Eval("idCadastroUser") %>' Visible="False" />
                                <asp:Label ID="idUserLabel0" runat="server" Text='<%# Eval("idUser") %>' Visible="False" />
                                <asp:Label ID="apresentarLabel" runat="server" Text='<%# Eval("apresentar") %>' Visible="False" />
                                <asp:Label ID="idcurriculoDBLabel" runat="server" Text='<%# Eval("idcurriculo") %>' Visible="False"></asp:Label>
                                <br />
                                <br />
                                <table id="CORPOCV" cellpadding="5" cellspacing="5" width="800px">
                                    <tr>
                                        <td valign="top" width="100px">
                                            <asp:Image ID="ImageCandidato" runat="server" ImageUrl='<%# Eval("foto") %>' ToolTip="Clique aqui para ver o CV deste profissional" Width="100px" />
                                            <br />
                                            <br />
                                            <asp:Button ID="ButtonSalvar" runat="server" CssClass="button" OnClick="ButtonSalvar_Click" Text="Aprovar" ValidationGroup="CANDIDATURA" ToolTip="Clique aqui para aprovar este CV." />
                                        </td>
                                        <td align="left" valign="top" width="600px">
                                            <table id="CV" cellpadding="2" cellspacing="2" width="600px">
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados9" runat="server" CssClass="textoGeral" Text="Nome do Candidato(a):"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="nomeLabel" runat="server" CssClass="textoApresentaNOMECV" Font-Bold="False" Text='<%# Eval("nome") %>' />
                                                        <br />
                                                        <asp:Label ID="cadastroTipoLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("cadastroTipo") %>' />
                                                        <br />
                                                        <asp:Label ID="emailLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("email") %>'></asp:Label>
                                                        <br />
                                                        <asp:DataList ID="DataListTELEFONE" runat="server" DataSourceID="SqlDataSourceTELEFONE">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Column1Label" runat="server" CssClass="textDescritivo" Text='<%# Eval("TELEFONE") %>' />
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados8" runat="server" CssClass="textoGeral" Text="Sexo:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="sexoLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("sexo") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados0" runat="server" CssClass="textoGeral" Text="Área de Atuação:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="areaAtuacaoLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("areaAtuacao") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados1" runat="server" CssClass="textoGeral" Text="Área de interesse (1ª Opção):"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="interesse01Label" runat="server" CssClass="textDescritivo" Text='<%# Eval("interesse01") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados2" runat="server" CssClass="textoGeral" Text="Área de interesse (2ª Opção):"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="interesse02Label" runat="server" CssClass="textDescritivo" Text='<%# Eval("interesse02") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados3" runat="server" CssClass="textoGeral" Text="Área de interesse (3ª Opção):"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="interesse03Label" runat="server" CssClass="textDescritivo" Text='<%# Eval("interesse03") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados4" runat="server" CssClass="textoGeral" Text="CPF:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="cpfLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("cpf") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados5" runat="server" CssClass="textoGeral" Text="Resumo:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="resumoLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("resumo") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados6" runat="server" CssClass="textoGeral" Text="Endereço: (Formas de contato)"></asp:Label>
                                                    </td>
                                                    <td align="left" bgcolor="#F0F0F0" width="400">
                                                        <asp:Label ID="enderecoLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("endereco") %>' />
                                                        <br />
                                                        <asp:Label ID="bairroLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("bairro") %>' />
                                                        <br />
                                                        <asp:Label ID="cepLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("cep") %>' />
                                                        <br />
                                                        <asp:Label ID="cidadeLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("cidade") %>' />
                                                        <asp:Label ID="HIFENlabel1" runat="server" CssClass="textDescritivo" Text=" - "></asp:Label>
                                                        <asp:Label ID="ufLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("uf") %>' />
                                                        <asp:Label ID="HIFENlabel2" runat="server" CssClass="textDescritivo" Text=" - "></asp:Label>
                                                        <asp:Label ID="paisLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("pais") %>' />
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados7" runat="server" CssClass="textoGeral" Text="Data de Nascimento:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="nascimentoLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("nascimento", "{0:d}") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados10" runat="server" CssClass="textoGeral" Text="Estado Civil:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="estadocivilLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("estadocivil") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados11" runat="server" CssClass="textoGeral" Text="Dependentes:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="nrdependenteLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("nrdependente") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados12" runat="server" CssClass="textoGeral" Text="Situação atual:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="trabalhandoLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("trabalhando") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados13" runat="server" CssClass="textoGeral" Text="Salário atual:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="valorRemAtualLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("valorRemAtual", "{0:C}") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados14" runat="server" CssClass="textoGeral" Text="Salário pretendido:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="valorRemPretendidaLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("valorRemPretendida", "{0:C}") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados15" runat="server" CssClass="textoGeral" Text="À combinar:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="acombinarLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("acombinar") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados16" runat="server" CssClass="textoGeral" Text="Preferência de local de trabalho:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="localPreferenciaLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("localPreferencia") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados17" runat="server" CssClass="textoGeral" Text="Disponibilidade:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="disponibilidadeLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("disponibilidade") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados18" runat="server" CssClass="textoGeral" Text="Ficou sabendo pelo:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="origemLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("origem") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados19" runat="server" CssClass="textoGeral" Text="Cadastrado desde:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="dataLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("data") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados20" runat="server" CssClass="textoGeral" Text="Último acesso em:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="dataultimoacessLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("dataultimoacess") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados21" runat="server" CssClass="textoGeral" Text="Visualizações deste CV:"></asp:Label>
                                                    </td>
                                                    <td align="left" bgcolor="#F0F0F0" width="400">
                                                        <asp:Label ID="contadorLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("contador") %>' />
                                                        <asp:Label ID="LabelCVDados22" runat="server" CssClass="textoGeral" Text="  vezes"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados23" runat="server" CssClass="textoGeral" Text="Quanto a privacidade:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="privacidadeLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("privacidade") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados24" runat="server" CssClass="textoGeral" Text="Necessidades especiais:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="portadorDefLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("portadorDef") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados25" runat="server" CssClass="textoGeral" Text="Observações (PNE):"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="dsDefAuditivaLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("dsDefAuditiva") %>' />
                                                        <asp:Label ID="dsDefFalaLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("dsDefFala") %>' />
                                                        <asp:Label ID="dsDefMotoraLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("dsDefMotora") %>' />
                                                        <asp:Label ID="dsDefVisualLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("dsDefVisual") %>' />
                                                        <asp:Label ID="dsDefMentalLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("dsDefMental") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCVDados26" runat="server" CssClass="textoGeral" Text="Referência:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:Label ID="VINCULOLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("VINCULO") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                        <asp:Label ID="Label27" runat="server" CssClass="textoGeral" Text="Formação Acadêmica:"></asp:Label>
                                                    </td>
                                                    <td align="left" bgcolor="#F0F0F0" width="400">
                                                        <asp:DataList ID="DataListFORMACAO" runat="server" DataSourceID="SqlDataSourceFORMACAO">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Column1Label0" runat="server" CssClass="textDescritivo" Text='<%# Eval("Column1") %>' />
                                                                <br />
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="Label28" runat="server" CssClass="textoGeral" Text="Idioma(s):"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:DataList ID="DataListIDIOMA" runat="server" DataSourceID="SqlDataSourceIDIOMA">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Column1Label1" runat="server" CssClass="textDescritivo" Text='<%# Eval("Column1") %>' />
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                        <asp:Label ID="Label29" runat="server" CssClass="textoGeral" Text="Conhecimento(s) em informática:"></asp:Label>
                                                    </td>
                                                    <td align="left" bgcolor="#F0F0F0" width="400">
                                                        <asp:DataList ID="DataListINFORMATICA" runat="server" DataSourceID="SqlDataSourceINFORMATICA">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Column1Label2" runat="server" CssClass="textDescritivo" Text='<%# Eval("Column1") %>' />
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="Label30" runat="server" CssClass="textoGeral" Text="Trajetória profissional:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:DataList ID="DataListTRAJETORIA" runat="server" DataSourceID="SqlDataSourceTRAJETORIA">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Column1Label3" runat="server" CssClass="textDescritivo" Text='<%# Eval("Column1") %>' />
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                        <asp:Label ID="Label32" runat="server" CssClass="textoGeral" Text="Apresentação pessoal:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label31" runat="server" CssClass="textoGeral" Text="Auto-Avaliação Profissional:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label33" runat="server" CssClass="textoGeral" Text="Competência Profissional:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label34" runat="server" CssClass="textoGeral" Text="Realizações:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label35" runat="server" CssClass="textoGeral" Text="Objetivos:"></asp:Label>
                                                    </td>
                                                    <td align="left" bgcolor="#F0F0F0" width="400">
                                                        <asp:DataList ID="DataListAPRESENTA" runat="server" DataSourceID="SqlDataSourceAUTOAVALIACAO">
                                                            <ItemTemplate>
                                                                <asp:Label ID="AUTOAVALIACAOLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("AUTOAVALIACAO") %>' />
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="Label37" runat="server" CssClass="textoGeral" Text="Curso extracurricular:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:DataList ID="DataListEXTRA" runat="server" DataKeyField="ID" DataSourceID="SqlCURSOEXTRACURRICULAR">
                                                            <ItemTemplate>
                                                                <asp:Label ID="InstituicaoLabel" runat="server" CssClass="textDescritivo" Font-Bold="True" Text='<%# Eval("Instituicao") %>' />
                                                                <br />
                                                                <asp:Label ID="dsCursoLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("dsCurso") %>' />
                                                                <br />
                                                                <asp:Label ID="obsCursoLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("obsCurso") %>' />
                                                                <br />
                                                                <asp:Label ID="data_iniLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("data_ini") %>' />
                                                                <br />
                                                                <asp:Label ID="data_fimLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("data_fim") %>' />
                                                                <br />
                                                                <asp:Label ID="concluido_textoLabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("concluido_texto") %>' />
                                                                <br />
                                                                <br />
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="Label36" runat="server" CssClass="textoGeral" Text="Videos:"></asp:Label>
                                                    </td>
                                                    <td align="left" width="400">
                                                        <asp:DataList ID="DataListMULTIMIDIA" runat="server" DataSourceID="SqlDataSourceMULTIMIDIA">
                                                            <ItemTemplate>
                                                                <asp:Label ID="MULTIMIDIALabel" runat="server" CssClass="textDescritivo" Text='<%# Eval("MULTIMIDIA") %>' />
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                &nbsp;<asp:Label ID="idsetupLabel" runat="server" Text='<%# Eval("idsetup") %>' Visible="False" />
                                &nbsp;<asp:Label ID="idcurriculoLabel0" runat="server" Text='<%# Eval("idcurriculo") %>' Visible="False" />
                                <asp:Label ID="nmempresaLabel" runat="server" Text='<%# Eval("nmempresa") %>' Visible="False" />
                                <br />
                                <table id="BODYRESTANTE" cellpadding="5" cellspacing="5" width="800px">
                                    <tr>
                                        <td valign="top" width="130px"></td>
                                        <td align="left" valign="top" width="670px"></td>
                                    </tr>
                                </table>
                                <br />
                                <asp:SqlDataSource ID="SqlDataSourceFORMACAO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_FORMACAO" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idcurriculoDBLabel" Name="idcurriculo" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSourceIDIOMA" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_IDIOMA" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idcurriculoDBLabel" Name="idcurriculo" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSourceINFORMATICA" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_INFORMATICA" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idcurriculoDBLabel" Name="idcurriculo" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSourceTRAJETORIA" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_TRAJETORIA_PROFISSIONAL" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idcurriculoDBLabel" Name="idcurriculo" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSourceTELEFONE" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_TELEFONE" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idcurriculoDBLabel" Name="idcurriculo" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSourceAUTOAVALIACAO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_AUTO_AVALIACAO" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idcurriculoDBLabel" Name="idcurriculo" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSourceMULTIMIDIA" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_MULTIMIDIA" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idcurriculoDBLabel" Name="idcurriculo" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlCURSOEXTRACURRICULAR" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_CURRICULO_CURSO_EXTRACURRICULAR" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idcurriculoDBLabel" Name="idcurriculo" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                        <br />
                        <br />
                        <asp:SqlDataSource ID="SqlCV" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_CURRICULO_ADERENCIA_EMAIL" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="idcurriculoLabel" Name="idCurriculo" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDETALHEVAGA" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_CURRICULO_ADERENCIA_EMAIL_DETALHE" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="idPerfilVagaLabel" Name="idPerfilVaga" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <br />
                    </asp:Panel>
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
        </table>
        </asp:Content>

