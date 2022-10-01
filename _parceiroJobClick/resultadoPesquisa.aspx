<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="resultadoPesquisa.aspx.vb" Inherits="_parceiroJobClick_resultadoPesquisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script type="text/javascript">
         $(function () {
             $("#<%=PanelCVCandidato.ClientID%>").dialog
            ({ closeText: '', width: '850', title: "Perfil do Candidato", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
         });
	</script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
        });
	</script>
                                                   <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                                                        <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:Image ID="ImageAviso" runat="server" 
                                                                        ImageUrl="~/_parceiroJobClick/images/ok.jpg" />
                                                                </td>
                                                                <td align="center">
                                                                    <asp:Label ID="AVISOLABEL" runat="server" CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    <asp:LinkButton ID="LinkButtonCOMPRACREDITO" runat="server" CssClass="buttonAtivo" ToolTip="Para adicionar em sua lista de contatos este profissional, será necessário ter saldo mínimo de 2 créditos em sua conta." Visible="False">Comprar créditos</asp:LinkButton>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                    <asp:Panel ID="PanelCVCandidato" runat="server" BackColor="White" Visible="False" Width="820px">
                                                            <asp:DataList ID="DataListCV" runat="server" DataSourceID="SqlDADOSPESSOAIS" 
                                                                Width="100%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="idCadastroUserLabel" runat="server" 
                                                                        Text='<%# Eval("idCadastroUser") %>' Visible="False" />
                                                                    <asp:Label ID="idUserLabel" runat="server" Text='<%# Eval("idUser") %>' 
                                                                        Visible="False" />
                                                                    <asp:Label ID="apresentarLabel" runat="server" 
                                                                        Text='<%# Eval("apresentar") %>' Visible="False" />
                                                                    <table ID="CORPOCV" cellpadding="5" cellspacing="5" width="820px">
                                                                        <tr>
                                                                            <td valign="top" width="100px">
                                                                                <asp:Image ID="ImageCandidato" runat="server" ImageUrl='<%# Eval("foto") %>' 
                                                                                    ToolTip='Clique aqui para ver o CV deste profissional' Width="100px" />
                                                                            </td>
                                                                            <td align="left" valign="top" width="600px">
                                                                                <div style="float: right;">
                                                                                    <asp:Label ID="Label37" runat="server" CssClass="legenda" Text="Ao incluir este profissional em sua lista de contatos será debitado de sua conta o valor de R$2,00." Visible='<%# Eval("associadoComprou") %>'></asp:Label><br /><br />
                                                                                    <asp:LinkButton ID="LinkButtonEntrarEmContato" runat="server" CssClass="buttonAtivo" ToolTip="Ao incluir este profissional em sua lista de contatos será debitado de sua conta o valor de R$2,00." OnClick="LinkButtonEntrarEmContato_Click" Visible='<%# Eval("associadoComprou") %>'>Quer incluir este profissional em sua lista de contatos? Clique aqui</asp:LinkButton>
                                                                                </div><br />
                                                                                <table ID="CV" cellpadding="2" cellspacing="2" width="600px">
                                                                                    <tr>
                                                                                        <td valign="top" width="220px">
                                                                                            &nbsp;</td>
                                                                                        <td width="400">
                                                                                            <br />
                                                                                            <asp:LinkButton ID="LinkButton_AssociadoComprou" runat="server" CommandName="Select" CssClass="button" ToolTip="Para incluir este CV em sua base de talentos clique aqui." Visible='False'>Incluir este currículo em sua base de talentos</asp:LinkButton>
                                                                                            <br />
                                                                                            <br />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="220px">
                                                                                            <asp:Label ID="LabelCVDados9" runat="server" CssClass="textoApresentaINFOCV" Text="Nome do Candidato(a):"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="nomeLabel" runat="server" CssClass="textoApresentaNOMECV" Font-Bold="False" Text='<%# Eval("nome") %>' />
                                                                                            <br />
                                                                                            <asp:Label ID="cadastroTipoLabel" runat="server" CssClass="textoApresentaCV" Text='<%# Eval("cadastroTipo") %>' />
                                                                                            <br />
                                                                                            <asp:Label ID="emailLabel" runat="server" CssClass="textoApresentaCV" Text='<%# Eval("email") %>'></asp:Label>
                                                                                            <br />
                                                                                            <asp:DataList ID="DataListTELEFONE" runat="server" DataSourceID="SqlDataSourceTELEFONE">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="Column1Label" runat="server" CssClass="textoApresentaCV" Text='<%# Eval("TELEFONE") %>' />
                                                                                                </ItemTemplate>
                                                                                            </asp:DataList>
                                                                                            <br />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados8" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Sexo:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="sexoLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("sexo") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados0" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Área de Atuação:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="areaAtuacaoLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("areaAtuacao") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados1" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Interesse (1ª Opção):"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="interesse01Label" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("interesse01") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados2" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Interesse (2ª Opção):"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="interesse02Label" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("interesse02") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados3" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Interesse (3ª Opção):"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="interesse03Label" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("interesse03") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados4" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="CPF:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="cpfLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("cpf") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados5" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Resumo:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="resumoLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("resumo") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados6" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Endereço:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" bgcolor="#F0F0F0" width="400">
                                                                                            <asp:Label ID="enderecoLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("endereco") %>' />
                                                                                            <br />
                                                                                            <asp:Label ID="bairroLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("bairro") %>' />
                                                                                            <br />
                                                                                            <asp:Label ID="cepLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("cep") %>' />
                                                                                            <br />
                                                                                            <asp:Label ID="cidadeLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("cidade") %>' />
                                                                                            <asp:Label ID="HIFENlabel1" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text=" - "></asp:Label>
                                                                                            <asp:Label ID="ufLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("uf") %>' />
                                                                                            <asp:Label ID="HIFENlabel2" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text=" - "></asp:Label>
                                                                                            <asp:Label ID="paisLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("pais") %>' />
                                                                                            <br />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados7" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Data de Nascimento:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="nascimentoLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("nascimento", "{0:d}") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados10" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Estado Civil:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="estadocivilLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("estadocivil") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados11" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Dependentes:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="nrdependenteLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("nrdependente") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados12" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Situação atual:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="trabalhandoLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("trabalhando") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados13" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Salário atual:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="valorRemAtualLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("valorRemAtual", "{0:C}") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados14" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Salário pretendido:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="valorRemPretendidaLabel" runat="server" 
                                                                                                CssClass="textoApresentaCV" Text='<%# Eval("valorRemPretendida", "{0:C}") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados15" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="À combinar:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="acombinarLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("acombinar") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados16" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Preferência de local de trabalho:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="localPreferenciaLabel" runat="server" 
                                                                                                CssClass="textoApresentaCV" Text='<%# Eval("localPreferencia") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados17" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Disponibilidade:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="disponibilidadeLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("disponibilidade") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados18" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Ficou sabendo pelo:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="origemLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("origem") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados19" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Cadastrado desde:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="dataLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("data") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados20" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Último acesso em:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="dataultimoacessLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("dataultimoacess") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados21" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Visualizações deste CV:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" bgcolor="#F0F0F0" width="400">
                                                                                            <asp:Label ID="contadorLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("contador") %>' />
                                                                                            <asp:Label ID="LabelCVDados22" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="  vezes"></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados23" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Quanto a privacidade:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="privacidadeLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("privacidade") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados24" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Necessidades especiais:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="portadorDefLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("portadorDef") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados25" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Observações (PNE):"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="dsDefAuditivaLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("dsDefAuditiva") %>' />
                                                                                            <asp:Label ID="dsDefFalaLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("dsDefFala") %>' />
                                                                                            <asp:Label ID="dsDefMotoraLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("dsDefMotora") %>' />
                                                                                            <asp:Label ID="dsDefVisualLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("dsDefVisual") %>' />
                                                                                            <asp:Label ID="dsDefMentalLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("dsDefMental") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados26" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Referência:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="VINCULOLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("VINCULO") %>'></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                                                            <asp:Label ID="Label27" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Formação Acadêmica:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" bgcolor="#F0F0F0" width="400">
                                                                                            <asp:DataList ID="DataListFORMACAO" runat="server" 
                                                                                                DataSourceID="SqlDataSourceFORMACAO">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="Column1Label" runat="server" CssClass="textoApresentaCV" 
                                                                                                        Text='<%# Eval("Column1") %>' />
                                                                                                    <br />
                                                                                                </ItemTemplate>
                                                                                            </asp:DataList>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="Label28" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Idioma(s):"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:DataList ID="DataListIDIOMA" runat="server" 
                                                                                                DataSourceID="SqlDataSourceIDIOMA">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="Column1Label" runat="server" CssClass="textoApresentaCV" 
                                                                                                        Text='<%# Eval("Column1") %>' />
                                                                                                </ItemTemplate>
                                                                                            </asp:DataList>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                                                            <asp:Label ID="Label29" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Conhecimento(s) em informática:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" bgcolor="#F0F0F0" width="400">
                                                                                            <asp:DataList ID="DataListINFORMATICA" runat="server" 
                                                                                                DataSourceID="SqlDataSourceINFORMATICA">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="Column1Label" runat="server" CssClass="textoApresentaCV" 
                                                                                                        Text='<%# Eval("Column1") %>' />
                                                                                                </ItemTemplate>
                                                                                            </asp:DataList>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="Label30" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Trajetória profissional:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:DataList ID="DataListTRAJETORIA" runat="server" 
                                                                                                DataSourceID="SqlDataSourceTRAJETORIA">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="Column1Label" runat="server" CssClass="textoApresentaCV" 
                                                                                                        Text='<%# Eval("Column1") %>' />
                                                                                                </ItemTemplate>
                                                                                            </asp:DataList>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                                                            <asp:Label ID="Label32" runat="server" CssClass="textoApresentaINFOCV" Text="Apresentação pessoal:"></asp:Label><br />
                                                                                            <asp:Label ID="Label31" runat="server" CssClass="textoApresentaINFOCV" Text="Auto-Avaliação Profissional:"></asp:Label><br />
                                                                                            <asp:Label ID="Label33" runat="server" CssClass="textoApresentaINFOCV" Text="Competência Profissional:"></asp:Label><br />
                                                                                            <asp:Label ID="Label34" runat="server" CssClass="textoApresentaINFOCV" Text="Realizações:"></asp:Label><br />
                                                                                            <asp:Label ID="Label35" runat="server" CssClass="textoApresentaINFOCV" Text="Objetivos:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" bgcolor="#F0F0F0" width="400">
                                                                                            <asp:DataList ID="DataListAPRESENTA" runat="server" 
                                                                                                DataSourceID="SqlDataSourceAUTOAVALIACAO">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="AUTOAVALIACAOLabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                        Text='<%# Eval("AUTOAVALIACAO") %>' />
                                                                                                </ItemTemplate>
                                                                                            </asp:DataList>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="Label36" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Videos:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:DataList ID="DataListMULTIMIDIA" runat="server" 
                                                                                                DataSourceID="SqlDataSourceMULTIMIDIA">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="MULTIMIDIALabel" runat="server" CssClass="textoApresentaCV" 
                                                                                                        Text='<%# Eval("MULTIMIDIA") %>' />
                                                                                                </ItemTemplate>
                                                                                            </asp:DataList>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>

                                                                    <asp:Label ID="idsetupLabel" runat="server" Text='<%# Eval("idsetup") %>' Visible="False" />
                                                                    <asp:Label ID="idcurriculoLabel" runat="server" 
                                                                        Text='<%# Eval("idcurriculo") %>' Visible="False" />
                                                                    <asp:Label ID="nmempresaLabel" runat="server" Text='<%# Eval("nmempresa") %>' 
                                                                        Visible="False" />
                                                                    <br />
                                                                    <table ID="BODYRESTANTE" cellpadding="5" cellspacing="5" width="800px">
                                                                        <tr>
                                                                            <td valign="top" width="130px"></td>
                                                                            <td align="left" valign="top" width="670px"></td>
                                                                        </tr>
                                                                    </table>         
                                                                    <br />
                                                                    <asp:SqlDataSource ID="SqlDataSourceFORMACAO" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_FORMACAO" 
                                                                        SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <asp:SqlDataSource ID="SqlDataSourceIDIOMA" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_IDIOMA" 
                                                                        SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <asp:SqlDataSource ID="SqlDataSourceINFORMATICA" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_INFORMATICA" 
                                                                        SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <asp:SqlDataSource ID="SqlDataSourceTRAJETORIA" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_TRAJETORIA_PROFISSIONAL" 
                                                                        SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <asp:SqlDataSource ID="SqlDataSourceTELEFONE" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_CURRICULO_TELEFONE_PARCEIRO_VENDA" 
                                                                        SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                                                            <asp:ControlParameter ControlID="CONTATOLabel" Name="liberaLeituraCompleta" PropertyName="Text" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <asp:SqlDataSource ID="SqlDataSourceAUTOAVALIACAO" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_AUTO_AVALIACAO" 
                                                                        SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <asp:SqlDataSource ID="SqlDataSourceMULTIMIDIA" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_MULTIMIDIA" 
                                                                        SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:SqlDataSource>
                                                                    <br />
                                                                </ItemTemplate>
                                                            </asp:DataList>
                                                        </asp:Panel>
    <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Resultado da pesquisa:"></asp:Label>

        &nbsp;<asp:Label ID="idCurriculoLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="CreditoLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="CONTATOLabel" runat="server" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:Label ID="nroCVsRetornados" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
            <br />
            <br />
            <asp:DataList ID="DataListCriterios" runat="server" BackColor="#FFFFF2" DataSourceID="SqlDataSourceCriterio" Width="100%" CellPadding="2" CellSpacing="2">
                <ItemTemplate>
                    <asp:Label ID="dsFiltroDinamicoJSONLabel" runat="server" Font-Bold="True" Text='<%# Eval("dsFiltroDinamicoJSON") %>' />
                    <asp:Label ID="pesquisaTextoLabel" runat="server" Font-Bold="False" Text='<%# Eval("pesquisaTexto") %>' />
                </ItemTemplate>
            </asp:DataList>
            <br />
            <br />
            <asp:LinkButton ID="LinkButtonBACK_OUT_TOP" runat="server" CssClass="button" Visible="False">Alterar os critérios de pesquisa</asp:LinkButton>
            <br />
            <br />
            <asp:GridView ID="GridViewCVs" runat="server" AutoGenerateColumns="False" BorderStyle="None" DataKeyNames="idcurriculo,CONTATO" DataSourceID="SqlDataSourceRUN" GridLines="None" Width="100%" ShowHeader="False">
                <Columns>
                    <asp:BoundField DataField="idCadastroUser" HeaderText="idCadastroUser" SortExpression="idCadastroUser" Visible="False" />
                    <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" SortExpression="idcurriculo" Visible="False" />
                    <asp:TemplateField HeaderText="CONTATO" SortExpression="CONTATO" Visible="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CONTATO") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CONTATO") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="nome">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("nome") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonCV" runat="server" CommandName="Select" Text='<%# Eval("nome") %>' ToolTip='<%# Eval("nome", "Clique aqui para ver o CV de {0}") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#FF3300" Text="Sua pesquisa não retornou nenhum currículo, clique no botão abaixo para alterar os critérios de pesquisa."></asp:Label>
                    <br />
                    <br />
                    <asp:LinkButton ID="LinkButtonBACK" runat="server" CssClass="buttonAtencao" PostBackUrl="javascript:history.back()">Alterar os critérios de pesquisa</asp:LinkButton>
                </EmptyDataTemplate>
            </asp:GridView>
            <br />
            <asp:LinkButton ID="LinkButtonBACK_OUT" runat="server" CssClass="button" Visible="False">Alterar os critérios de pesquisa</asp:LinkButton>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSourceRUN" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="RUN_PESQUISA_JSON" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
                    <asp:QueryStringParameter Name="idVaga" QueryStringField="idVaga" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCriterio" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="SELECT tbFiltroDinamicoJSON.pesquisaTexto, tbFiltroDinamicoJSON.idVaga, tbFiltroDinamicoJSON_Liberado.dsFiltroDinamicoJSON, tbFiltroDinamicoJSON.idCadastroEmpresa FROM tbFiltroDinamicoJSON INNER JOIN tbFiltroDinamicoJSON_Liberado ON tbFiltroDinamicoJSON.idFiltroDinamicoJSON_Liberado = tbFiltroDinamicoJSON_Liberado.idFiltroDinamicoJSON_Liberado WHERE (tbFiltroDinamicoJSON.idVaga = @idVaga) AND (tbFiltroDinamicoJSON.idCadastroEmpresa = @idCadastroEmpresa)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="idVaga" QueryStringField="idVaga" />
                    <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" />
                </SelectParameters>
            </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDADOSPESSOAIS" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_CURRICULO_DADOSPESSOAIS_PARCEIRO_VENDA" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idCurriculoLabel" Name="idCurriculo" 
                                            PropertyName="Text" Type="Int32" />
                                        <asp:Parameter Name="idCurriculo_CRIPTOGRAFADO" Type="String" DefaultValue=" " />
                                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                        <asp:SessionParameter DefaultValue="" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
                                        <asp:ControlParameter ControlID="CONTATOLabel" Name="liberaLeituraCompleta" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />
            <br />

        </div>
    </div>
</asp:Content>

