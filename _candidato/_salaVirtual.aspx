<%@ Page Title="" Language="VB" MasterPageFile="~/_candidato/MasterPageVazia.master" AutoEventWireup="false" CodeFile="_salaVirtual.aspx.vb" Inherits="_candidato_salaVirtual" %>

<%@ Register assembly="JaxterChat" namespace="WebFurbish" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">


.h1
{
font-size: 26px;
line-height: 34px;
margin-bottom: 11px;
}

.textoApresentaINFOCV
{
	text-align: right;
	font-size: 8pt;
	text-decoration: none;
	cursor: auto;
	font-weight: normal;
	z-index: 0;
	color: #666666;
}

.textoApresentaNOMECV
{
	font-size: 12pt;
	text-decoration: none;
	cursor: auto;
	font-weight: normal;
	z-index: 0;
	color: #777777;
}

.textoApresentaCV
{
	font-size: 10pt;
	text-decoration: none;
	cursor: auto;
	font-weight: normal;
	z-index: 0;
	color: #666666;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up"} });
        });
	</script>
    <script type="text/javascript">
    $(function () {
        $("#<%=PanelCVCandidato.ClientID%>").dialog
            ({ closeText: '', width: '820', title: "Perfil do Candidato", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
    });
	</script>
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Cabec" runat="server" Text="Sala " 
                    CssClass="TituloBGText"></asp:Label>
            </td>
        </tr>
    </table>
                <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_candidato/images/buttonOK.png" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABEL" runat="server" CssClass="msnOK"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
    <table width="720px" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td width="30px"><asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="690px" align="left">
                                <br />
                                <table id="CHAT" cellpadding="2" cellspacing="2" width="800px">
                                    <tr>
                                        <td width="350px">
                                <cc1:JaxterChat ID="JaxterChatENTREVISTA" runat="server" BackColor="White" 
                                    UrlPathPrefix="/" Width="400px" ActiveUsersText="Participantes:" 
                                    ActiveUsersToolTipText="Participantes na sala" ClearPageToolTipText="Limpar" 
                                    EmoticonsToolTipText="Não utilizar em uma entrevista" 
                                    EnteredRoomInstructionText="&lt;BR&gt;Sala preparada para o início da entrevista virtual...&lt;BR&gt;&lt;BR&gt;" 
                                    EnteredRoomText="Sala:" FontFace="Verdana" 
                                    MessageInputBackColor="249, 249, 249" MessageInputBorderColor="White" 
                                    MessageInputFontFace="Verdana" MessageOutputBackColor="249, 249, 249" 
                                    MessageOutputBorderColor="White" 
                                    PopupWindowPrivateMessageText="(Sala para dois participantes)&lt;br&gt;&lt;br&gt;" 
                                    PrivateMessageReceivedText="Sala para dois participantes" 
                                    PrivateMessageSentText="Não utilizar!" 
                                    ToggleSoundToolTipText="Som não está habilitado para esta sala" 
                                    UserEnteredNotifyMessage="Candidato presente." 
                                    UserExitNotifyMessage="Entrevistador ausente." 
                    MessageCacheSize="255" UserNameMaxLength="50" 
                    UserPingAutoLogoutTimeoutSeconds="10" ShowSendButton="False">
                                </cc1:JaxterChat>
                                        </td>
                                        <td valign="top">
                                            <asp:Label ID="LabelAviso" runat="server" 
                                                Text="Os links abaixo podem ajudá-lo no momento da entrevista:"></asp:Label>
                                            <br />
                                            <br />
                                            <asp:LinkButton ID="LinkButtonDadosPessoais" runat="server" 
                                                ToolTip="Para ver seus dados no currículo clique aqui">Dados do seu currículo</asp:LinkButton>
                                            <br />
                                            <br />
                                <asp:LinkButton ID="LinkButtonMP" runat="server" 
                                    PostBackUrl="~/_candidato/Default.aspx" 
                                                ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="350px">
                                            &nbsp;</td>
                                        <td align="right">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                                <br />
                                <asp:Label ID="idCurriculoLabel" runat="server" Visible="False"></asp:Label>
                                <br />
                                <br />
                                                        <asp:Panel ID="PanelCVCandidato" runat="server" BackColor="White" 
                                                            Visible="False" Width="800px">
                                                            <asp:DataList ID="DataListCV0" runat="server" DataSourceID="SqlDADOSPESSOAIS" 
                                                                Width="100%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="idCadastroUserLabel0" runat="server" 
                                                                        Text='<%# Eval("idCadastroUser") %>' Visible="False" />
                                                                    <asp:Label ID="idUserLabel0" runat="server" Text='<%# Eval("idUser") %>' 
                                                                        Visible="False" />
                                                                    <asp:Label ID="apresentarLabel0" runat="server" 
                                                                        Text='<%# Eval("apresentar") %>' Visible="False" />
                                                                    <br />
                                                                    <br />
                                                                    <table ID="CORPOCV0" cellpadding="5" cellspacing="5" width="800px">
                                                                        <tr>
                                                                            <td valign="top" width="100px">
                                                                                <asp:Image ID="ImageCandidato0" runat="server" ImageUrl='<%# Eval("foto") %>' 
                                                                                    ToolTip="Clique aqui para ver o CV deste profissional" Width="100px" />
                                                                            </td>
                                                                            <td align="left" valign="top" width="600px">
                                                                                <table ID="CV0" cellpadding="2" cellspacing="2" width="600px">
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados27" runat="server" CssClass="textoGeral" 
                                                                                                Text="Nome do Candidato(a):"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="nomeLabel0" runat="server" CssClass="textoApresentaNOMECV" 
                                                                                                Font-Bold="False" Text='<%# Eval("nome") %>' />
                                                                                            <br />
                                                                                            <asp:Label ID="cadastroTipoLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("cadastroTipo") %>' />
                                                                                            <br />
                                                                                            <asp:Label ID="emailLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("email") %>'></asp:Label>
                                                                                            <br />
                                                                                            <asp:DataList ID="DataListTELEFONE" runat="server" 
                                                                                                DataSourceID="SqlDataSourceTELEFONE">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="Column1Label" runat="server" CssClass="textDescritivo" 
                                                                                                        Text='<%# Eval("TELEFONE") %>' />
                                                                                                </ItemTemplate>
                                                                                            </asp:DataList>
                                                                                            <br />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados28" runat="server" CssClass="textoGeral" 
                                                                                                Text="Sexo:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="sexoLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("sexo") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados29" runat="server" CssClass="textoGeral" 
                                                                                                Text="Área de Atuação:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="areaAtuacaoLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("areaAtuacao") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados30" runat="server" CssClass="textoGeral" 
                                                                                                Text="Área de interesse (1ª Opção):"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="interesse01Label0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("interesse01") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados31" runat="server" CssClass="textoGeral" 
                                                                                                Text="Área de interesse (2ª Opção):"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="interesse02Label0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("interesse02") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados32" runat="server" CssClass="textoGeral" 
                                                                                                Text="Área de interesse (3ª Opção):"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="interesse03Label0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("interesse03") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados33" runat="server" CssClass="textoGeral" Text="CPF:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="cpfLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("cpf") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados34" runat="server" CssClass="textoGeral" 
                                                                                                Text="Resumo:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="resumoLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("resumo") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados35" runat="server" CssClass="textoGeral" 
                                                                                                Text="Endereço: (Formas de contato)"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" bgcolor="#F0F0F0" width="400">
                                                                                            <asp:Label ID="enderecoLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("endereco") %>' />
                                                                                            <br />
                                                                                            <asp:Label ID="bairroLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("bairro") %>' />
                                                                                            <br />
                                                                                            <asp:Label ID="cepLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("cep") %>' />
                                                                                            <br />
                                                                                            <asp:Label ID="cidadeLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("cidade") %>' />
                                                                                            <asp:Label ID="HIFENlabel3" runat="server" CssClass="textDescritivo" Text=" - "></asp:Label>
                                                                                            <asp:Label ID="ufLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("uf") %>' />
                                                                                            <asp:Label ID="HIFENlabel4" runat="server" CssClass="textDescritivo" Text=" - "></asp:Label>
                                                                                            <asp:Label ID="paisLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("pais") %>' />
                                                                                            <br />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados36" runat="server" CssClass="textoGeral" 
                                                                                                Text="Data de Nascimento:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="nascimentoLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("nascimento", "{0:d}") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados37" runat="server" CssClass="textoGeral" 
                                                                                                Text="Estado Civil:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="estadocivilLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("estadocivil") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados38" runat="server" CssClass="textoGeral" 
                                                                                                Text="Dependentes:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="nrdependenteLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("nrdependente") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados39" runat="server" CssClass="textoGeral" 
                                                                                                Text="Situação atual:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="trabalhandoLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("trabalhando") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados40" runat="server" CssClass="textoGeral" 
                                                                                                Text="Salário atual:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="valorRemAtualLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("valorRemAtual", "{0:C}") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados41" runat="server" CssClass="textoGeral" 
                                                                                                Text="Salário pretendido:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="valorRemPretendidaLabel0" runat="server" 
                                                                                                CssClass="textDescritivo" Text='<%# Eval("valorRemPretendida", "{0:C}") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados42" runat="server" CssClass="textoGeral" 
                                                                                                Text="À combinar:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="acombinarLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("acombinar") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados43" runat="server" CssClass="textoGeral" 
                                                                                                Text="Preferência de local de trabalho:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="localPreferenciaLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("localPreferencia") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados44" runat="server" CssClass="textoGeral" 
                                                                                                Text="Disponibilidade:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="disponibilidadeLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("disponibilidade") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados45" runat="server" CssClass="textoGeral" 
                                                                                                Text="Ficou sabendo pelo:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="origemLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("origem") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados46" runat="server" CssClass="textoGeral" 
                                                                                                Text="Cadastrado desde:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="dataLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("data") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados47" runat="server" CssClass="textoGeral" 
                                                                                                Text="Último acesso em:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="dataultimoacessLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("dataultimoacess") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados48" runat="server" CssClass="textoGeral" 
                                                                                                Text="Visualizações deste CV:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" bgcolor="#F0F0F0" width="400">
                                                                                            <asp:Label ID="contadorLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("contador") %>' />
                                                                                            <asp:Label ID="LabelCVDados49" runat="server" CssClass="textoGeral" 
                                                                                                Text="  vezes"></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados50" runat="server" CssClass="textoGeral" 
                                                                                                Text="Quanto a privacidade:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="privacidadeLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("privacidade") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados51" runat="server" CssClass="textoGeral" 
                                                                                                Text="Necessidades especiais:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="portadorDefLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("portadorDef") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados52" runat="server" CssClass="textoGeral" 
                                                                                                Text="Observações (PNE):"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="dsDefAuditivaLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("dsDefAuditiva") %>' />
                                                                                            <asp:Label ID="dsDefFalaLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("dsDefFala") %>' />
                                                                                            <asp:Label ID="dsDefMotoraLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("dsDefMotora") %>' />
                                                                                            <asp:Label ID="dsDefVisualLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("dsDefVisual") %>' />
                                                                                            <asp:Label ID="dsDefMentalLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("dsDefMental") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados53" runat="server" CssClass="textoGeral" 
                                                                                                Text="Referência:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="VINCULOLabel0" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("VINCULO") %>'></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                                                            <asp:Label ID="Label27" runat="server" CssClass="textoGeral" 
                                                                                                Text="Formação Acadêmica:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" bgcolor="#F0F0F0" width="400">
                                                                                            <asp:DataList ID="DataListFORMACAO" runat="server" 
                                                                                                DataSourceID="SqlDataSourceFORMACAO">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="Column1Label0" runat="server" CssClass="textDescritivo" 
                                                                                                        Text='<%# Eval("Column1") %>' />
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
                                                                                            <asp:DataList ID="DataListIDIOMA" runat="server" 
                                                                                                DataSourceID="SqlDataSourceIDIOMA">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="Column1Label1" runat="server" CssClass="textDescritivo" 
                                                                                                        Text='<%# Eval("Column1") %>' />
                                                                                                </ItemTemplate>
                                                                                            </asp:DataList>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                                                            <asp:Label ID="Label29" runat="server" CssClass="textoGeral" 
                                                                                                Text="Conhecimento(s) em informática:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" bgcolor="#F0F0F0" width="400">
                                                                                            <asp:DataList ID="DataListINFORMATICA" runat="server" 
                                                                                                DataSourceID="SqlDataSourceINFORMATICA">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="Column1Label2" runat="server" CssClass="textDescritivo" 
                                                                                                        Text='<%# Eval("Column1") %>' />
                                                                                                </ItemTemplate>
                                                                                            </asp:DataList>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="Label30" runat="server" CssClass="textoGeral" 
                                                                                                Text="Trajetória profissional:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:DataList ID="DataListTRAJETORIA" runat="server" 
                                                                                                DataSourceID="SqlDataSourceTRAJETORIA">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="Column1Label3" runat="server" CssClass="textDescritivo" 
                                                                                                        Text='<%# Eval("Column1") %>' />
                                                                                                </ItemTemplate>
                                                                                            </asp:DataList>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                                                            <asp:Label ID="Label32" runat="server" CssClass="textoGeral" 
                                                                                                Text="Apresentação pessoal:"></asp:Label>
                                                                                            <br />
                                                                                            <asp:Label ID="Label31" runat="server" CssClass="textoGeral" 
                                                                                                Text="Auto-Avaliação Profissional:"></asp:Label>
                                                                                            <br />
                                                                                            <asp:Label ID="Label33" runat="server" CssClass="textoGeral" 
                                                                                                Text="Competência Profissional:"></asp:Label>
                                                                                            <br />
                                                                                            <asp:Label ID="Label34" runat="server" CssClass="textoGeral" 
                                                                                                Text="Realizações:"></asp:Label>
                                                                                            <br />
                                                                                            <asp:Label ID="Label35" runat="server" CssClass="textoGeral" Text="Objetivos:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" bgcolor="#F0F0F0" width="400">
                                                                                            <asp:DataList ID="DataListAPRESENTA" runat="server" 
                                                                                                DataSourceID="SqlDataSourceAUTOAVALIACAO">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="AUTOAVALIACAOLabel" runat="server" CssClass="textDescritivo" 
                                                                                                        Text='<%# Eval("AUTOAVALIACAO") %>' />
                                                                                                </ItemTemplate>
                                                                                            </asp:DataList>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="Label36" runat="server" CssClass="textoGeral" Text="Videos:"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:DataList ID="DataListMULTIMIDIA" runat="server" 
                                                                                                DataSourceID="SqlDataSourceMULTIMIDIA">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="MULTIMIDIALabel" runat="server" CssClass="textDescritivo" 
                                                                                                        Text='<%# Eval("MULTIMIDIA") %>' />
                                                                                                </ItemTemplate>
                                                                                            </asp:DataList>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
&nbsp;<asp:Label ID="idsetupLabel0" runat="server" Text='<%# Eval("idsetup") %>' Visible="False" />
                                                                    &nbsp;<asp:Label ID="idcurriculoLabel0" runat="server" 
                                                                        Text='<%# Eval("idcurriculo") %>' Visible="False" />
                                                                    <asp:Label ID="nmempresaLabel0" runat="server" Text='<%# Eval("nmempresa") %>' 
                                                                        Visible="False" />
                                                                    <br />
                                                                    <table ID="BODYRESTANTE0" cellpadding="5" cellspacing="5" width="800px">
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
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_TELEFONE" 
                                                                        SelectCommandType="StoredProcedure">
                                                                        <SelectParameters>
                                                                            <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
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
                                <asp:SqlDataSource ID="SqlDADOSPESSOAIS" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_CURRICULO_DADOSPESSOAIS" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idCurriculo" SessionField="idcurriculo" 
                                            Type="Int32" />
                                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            <br /></td>
        </tr>
    </table>

</asp:Content>

