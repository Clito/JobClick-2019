<%@ Page Title="" Language="VB" MasterPageFile="~/_corporativo/corporativoPage.master" MaintainScrollPositionOnPostback="false" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_corporativo_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function Atribuicao() {
            $("input[id$='<%=TextAtribuicao.ClientID%>']").val($("#<%=DropDownListATRIBUIR.ClientID%>").val());
        }
    </script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelATRIBUICAO.ClientID%>").dialog({ closeText: '', width: '800', title: "Troca de atribuição", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAvisoCADASTROEMPRESA.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" }, close: function () { window.location.href = "Default.aspx" } });
        });
	</script>
    <script type="text/javascript">
        $(function () {
            $("#MENUPRINCIPAL").accordion({ autoHeight: false, fillSpace: false, active: <%=ActiveAccordeon.Value%> });
        });

        function f(varAccordeon)
        {
            $("input[id*='ActiveAccordeon']").val(varAccordeon)
        };
	</script>
                 <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_corporativo/images/buttonOK.png" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABEL" runat="server" 
                                    CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                 <asp:Panel ID="PanelAvisoCADASTROEMPRESA" runat="server" Visible="False">
                    <table id="AVISOCADASTROEMPRESA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISOCADASTROEMPRESA" runat="server" 
                                    ImageUrl="~/_corporativo/images/buttonOK.png" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABELCADASTROEMPRESA" runat="server" 
                                    CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                 <asp:Panel ID="PanelATRIBUICAO" runat="server" Visible="False">
                    <table id="Table2" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center" valign="top">
                                <asp:Image ID="ImageATRIBUICAO" runat="server" 
                                    ImageUrl="~/_corporativo/images/buttonOK.png" />
                            </td>
                            <td align="left">
                                <asp:Label ID="ATRIBUICAOLabel" runat="server" 
                                    CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                                &nbsp;<br />
                                <br />
                                <asp:DropDownList ID="DropDownListATRIBUIR" runat="server" 
                                    CssClass="DropCadFormCandidatoCV" DataSourceID="SqlATRIBUICAO_LISTA" 
                                    DataTextField="nome" DataValueField="idRH_Gestor" Width="450px">
                                </asp:DropDownList>
                                <br />
                                <br />
                                <br />
                                <asp:LinkButton ID="LinkButtonATRIBUIR" runat="server" onclientclick="Atribuicao();" CssClass="button" 
                                    ToolTip="Escolha para quem você irá atribuir esta vaga e processo seletivo, clique aqui para enviar a atribuição">Atribuir</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
    <div>
        <table cellpadding="0" cellspacing="0" align="center" 
            width="100%">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" id="BodyInterno" width="900px" 
                        align="center">
                        <tr>
                            <td align="left">
                                            <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="idVagaLabel" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="idSetupLabel" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="nmresponsavelLabel" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="idUserLabel" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="emailGESTORLabel" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="salaLabel" runat="server" Visible="False"></asp:Label>
                                            <input id="ActiveAccordeon" type="hidden" runat="server"  value="0" />
                                            <asp:Label ID="iddepartamentoLabel" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="protocoloLabel" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="nomeGestorLabel" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="emailGESTORMSNLabel" runat="server" Visible="False"></asp:Label>
                                            <input id="TextAtribuicao" runat="server" type="hidden"/>
                                            <asp:Label ID="idVagaAnuncio_PREVIEW_HistoricoLabel" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="emailConsultorLabel" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="nomeConsultorLabel" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="idRH_GestorAtribuidoLabel" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="idRH_GestorACESSOLabel" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="idCadastroEmpresaLayoutLabel" runat="server" Visible="False"></asp:Label>
                                            <br />
                    
                    <table id="CONSULTOR" runat="server" border="0" cellpadding="0" cellspacing="0" visible="true" align="left" width="900px">
                        <tr>
                            <td valign="top" width="30">
                                <asp:Image ID="lateral1" runat="server" ImageUrl="~/images/h26.gif" />
                            </td>
                            <td valign="top" width="870" align="left">
                            <div id="MENUPRINCIPAL">
                                <h3><a href="#" onclick="javascript: f(0);">Vagas Salvas</a></h3>
                                <div>
                                    <asp:DataList ID="DataListVAGA" runat="server" 
                                        DataKeyField="idVagaAnuncioPREVIEW" DataSourceID="SqlVAGASALVA" 
                                        Width="100%">
                                        <FooterTemplate></FooterTemplate>
                                        <ItemTemplate>
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="nomeprocessoLabel" runat="server" 
                                                            CssClass="tituloProcessoSeletivo" Text='<%# Eval("NomeVaga") %>' ToolTip="Nome do Processo"></asp:Label>
                                                        <asp:Label ID="HifenLabel" runat="server" CssClass="tituloProcessoSeletivo" 
                                                            Text=" -"></asp:Label>
                                                        <asp:Label ID="ProtocoloDBLabel" runat="server" 
                                                            CssClass="tituloProcessoSeletivo" Text='<%# Eval("ProtocoloVaga") %>' ToolTip="Protocolo"></asp:Label>
                                                        <asp:Label ID="HifenLabel0" runat="server" CssClass="tituloProcessoSeletivo" Text=" -"></asp:Label>
                                                        <asp:Label ID="LabelREPLICAR" runat="server" CssClass="tituloProcessoSeletivo" Text='<%# Eval("replicarTEXTO") %>' ToolTip="Modelo"></asp:Label>
                                                        <asp:Label ID="TipoVAGACadastroLabel" runat="server" CssClass="tituloProcessoSeletivo" ForeColor="#006600" Text='<%# Eval("MODELO", "({0})") %>' ToolTip="Qual a origem da vaga"></asp:Label>
                                                        <asp:Label ID="idDepartamentoLabel" runat="server" Text='<%# Eval("idDepartamento") %>' Visible="False"></asp:Label>
                                                        <asp:Label ID="idVagaAnuncioPREVIEWLabel" runat="server" 
                                                            Text='<%# Eval("idVagaAnuncioPREVIEW") %>' Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table cellpadding="0" cellspacing="0" width="800px">
                                                            <tr>
                                                                <td valign="top" width="70px" align="center">
                                                                    <asp:ImageButton ID="ImageButtonVaga" runat="server" 
                                                                        ImageUrl="~/_corporativo/images/holomatica/EDITAR.png" 
                                                                        ToolTip="Clique aqui para visualizar e editar esta vaga" 
                                                                        CommandName="Select" />
                                                                    <asp:Image ID="Image_pne" runat="server" 
                                                                        ImageUrl="~/_corporativo/images/pne_pequeno.png" 
                                                                        Visible='<%# Eval("pne") %>' ToolTip="Vaga PNE" />
                                                                </td>
                                                                <td width="790px">
                                                                    <table ID="RES1" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td bgcolor="#EEEEEE" width="140" valign="top">
                                                                                <asp:Label ID="AberturaLabel" runat="server" CssClass="textoBold" 
                                                                                    Text="Data Abertura:"></asp:Label>
                                                                            </td>
                                                                            <td bgcolor="#EEEEEE">
                                                                                <asp:Label ID="DataInicialProcessoDBLabel" runat="server" 
                                                                                    CssClass="textoProcessoSeletivo" Text='<%# Eval("dataIni", "{0:d}") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="140" valign="top">
                                                                                <asp:Label ID="EncerramentoLabel" runat="server" CssClass="textoBold" 
                                                                                    Text="Data Encerramento:"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="DataFinalProcessoDBLabel2" runat="server" 
                                                                                    CssClass="textoProcessoSeletivo" Text='<%# Eval("dataFim", "{0:d}") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td bgcolor="#EEEEEE" width="140" valign="top">
                                                                                <asp:Label ID="AnalistaResLabel" runat="server" CssClass="textoBold" 
                                                                                    Text="Analista Responsável:"></asp:Label>
                                                                            </td>
                                                                            <td bgcolor="#EEEEEE">
                                                                                <asp:Label ID="ConsultorResponsavelDBLabel" runat="server" 
                                                                                    CssClass="textoProcessoSeletivo" 
                                                                                    Text='<%# Eval("NomeConsultorResponsavel") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="140" valign="top">
                                                                                <asp:Label ID="StatusLabel" runat="server" CssClass="textoBold" Text="Status:"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="FechadoLabel" runat="server" 
                                                                                    CssClass="textoProcessoSeletivoABERTO" Text='<%# Eval("idstatusvaga") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="140" valign="top">
                                                                                &nbsp;</td>
                                                                            <td>
                                                                                <table cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:Label ID="LabelVISUALIZACAO" runat="server" CssClass="textoBold" 
                                                                                                Text="Visualizações:"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="TotalVisualizacaoLabel" runat="server" 
                                                                                                CssClass="textoProcessoSeletivo" Text='<%# Eval("TotalVisualizacao") %>' />
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                                                                        <td>
                                                                                            <asp:Label ID="LabelCANDIDATURA" runat="server" CssClass="textoBold" 
                                                                                                Text="Candidaturas:"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="TotalCandidaturasLabel" runat="server" 
                                                                                                CssClass="textoProcessoSeletivo" Text='<%# Eval("TotalCandidaturas") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="140" valign="top">
                                                                                <asp:Label ID="LabelQUALIFICACAO" runat="server" CssClass="textoBold" 
                                                                                    Text="Qualificações:"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="QualificacaoHabilidadesEspecificasLabel" runat="server" 
                                                                                    CssClass="textoProcessoSeletivo" 
                                                                                    Text='<%# Eval("QualificacaoHabilidadesEspecificas") %>' />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="140" valign="top">
                                                                                <asp:Label ID="LabelCODIGO" runat="server" CssClass="textoBold" 
                                                                                    Text="Código desta publicação:"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="CodigoVagaLabel" runat="server" CssClass="textoBold" 
                                                                                    Text='<%# Eval("CodigoVaga") %>' />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="70px" valign="top">
                                                                    <asp:ImageButton ID="ImageButtonEXCLUIR" runat="server" 
                                                                        CommandArgument='<%# Eval("idVagaAnuncioPREVIEW", "{0}") %>' 
                                                                        CommandName="EXCLUIR" ImageUrl="~/_corporativo/images/holomatica/LIXO.png" 
                                                                        onclientclick="return confirm(&quot;Você quer excluir esta vaga salva?&quot;)" 
                                                                        ToolTip="Clique aqui para excluir esta vaga salva" />
                                                                </td>
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
                                    <div>
                                        <table ID="AVISO_VAGA_SALVA" runat="server" align="left" cellpadding="0" 
                                            cellspacing="0" width="800" visible="true">
                                            <tr>
                                                <td align="center" width="70px" valign="top">
                                                    <asp:Image ID="Image2" runat="server" 
                                                        ImageUrl="~/_corporativo/images/_bottonVAGASALVA.png" 
                                                        ToolTip="Seus arquivos salvo" />
                                                </td>
                                                <td align="left">
                                                    <asp:Label ID="AvisoVaga" runat="server" CssClass="textoProcessoSeletivo"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:LinkButton ID="LinkButtonASSOCIADO" runat="server" CssClass="button" 
                                                        Visible="False">Compra de créditos para abertura de novas vagas</asp:LinkButton>
                                                    <asp:HyperLink ID="HyperLinkSMS" runat="server" CssClass="button" 
                                                        NavigateUrl="~/_corporativo/_credito.aspx" 
                                                        ToolTip="Compra de créditos para SMS">Compra de créditos para SMS</asp:HyperLink>
                                                    <asp:LinkButton ID="LinkButtonEXTRATO" runat="server" CssClass="button" 
                                                        PostBackUrl="~/_corporativo/_extrato.aspx" 
                                                        ToolTip="Clique aqui para ver o extrato">Seu extrato</asp:LinkButton>
                                                    <br />
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <h3><a href="#" onclick="javascript: f(1);">Sua conta de acesso</a></h3> 
                                <div>
                                <table id="FORMACESSO" cellpadding="2" cellspacing="2" width="800">
                                    <tr>
                                        <td align="right" width="300">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ControlToValidate="nomeTextBox" Display="Dynamic" 
                                                ErrorMessage="Informe seu nome" ValidationGroup="FORMACESSO">•</asp:RequiredFieldValidator>
                                            <asp:Label ID="nomeLabel" runat="server" CssClass="textoNone" Text="Nome:"></asp:Label>
                                        </td>
                                        <td width="500">
                                            <asp:TextBox ID="nomeTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                ValidationGroup="FORMACESSO" Width="500px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="300">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ControlToValidate="passwordTextBox" ErrorMessage="Informe sua senha de acesso" 
                                                ValidationGroup="ATIVA">•</asp:RequiredFieldValidator>
                                            <asp:Label ID="passwordATUALLabel" runat="server" CssClass="textoNone" 
                                                Text="Password (Atual):"></asp:Label>
                                        </td>
                                        <td width="500">
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                            <asp:TextBox ID="passwordTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                ValidationGroup="ATIVA" Width="290px" TextMode="Password"></asp:TextBox>
                                                    </td>
                                                    <td><asp:LinkButton ID="LinkButtonATIVA" runat="server" CssClass="button" ValidationGroup="ATIVA">Ativar alteração da conta</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="300">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ControlToValidate="passwordNOVOTextBox" 
                                                ErrorMessage="Informe seu novo password" ValidationGroup="FORMACESSO">•</asp:RequiredFieldValidator>
                                            <asp:Label ID="passwordATUALLabel0" runat="server" CssClass="textoNone" 
                                                Text="Password (Novo):"></asp:Label>
                                        </td>
                                        <td width="500">
                                            <asp:TextBox ID="passwordNOVOTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                ValidationGroup="FORMACESSO" Width="500px" TextMode="Password"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="300">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                ControlToValidate="passwordREPITATextBox" 
                                                ErrorMessage="Informe novamente o seu password" ValidationGroup="FORMACESSO">•</asp:RequiredFieldValidator>
                                            <asp:Label ID="passwordATUALLabel1" runat="server" CssClass="textoNone" 
                                                Text="Password (Repita seu novo password):"></asp:Label>
                                        </td>
                                        <td width="500">
                                            <asp:TextBox ID="passwordREPITATextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                ValidationGroup="FORMACESSO" Width="500px" TextMode="Password"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="300">
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                ControlToValidate="emailTextBox" ErrorMessage="Informe um e-mail válido" 
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                ValidationGroup="FORMACESSO">•</asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                ControlToValidate="emailTextBox" ErrorMessage="Informe seu e-mail" 
                                                ValidationGroup="FORMACESSO">•</asp:RequiredFieldValidator>
                                            <asp:Label ID="EmailLabel" runat="server" CssClass="textoNone" Text="E-mail:"></asp:Label>
                                        </td>
                                        <td width="500">
                                            <asp:TextBox ID="emailTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                ValidationGroup="FORMACESSO" Width="500px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="300">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                                ControlToValidate="NumeroTextBox" ErrorMessage="Informe o número do telefone" 
                                                ValidationGroup="FORMACESSO">•</asp:RequiredFieldValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                ControlToValidate="DDDTextBox" ErrorMessage="Informe o DDD" 
                                                ValidationGroup="FORMACESSO">•</asp:RequiredFieldValidator>
                                            <asp:Label ID="contatoLabel" runat="server" CssClass="textoNone" 
                                                Text="Telefone DDD + Número:"></asp:Label>
                                        </td>
                                        <td width="500">
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                            <asp:TextBox ID="DDDTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                ValidationGroup="FORMACESSO" Width="50px"></asp:TextBox>
                                                        <asp:MaskedEditExtender ID="DDDTextBox_MaskedEditExtender" runat="server" 
                                                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                            Mask="99" MaskType="Number" TargetControlID="DDDTextBox">
                                                        </asp:MaskedEditExtender>
                                                    </td>
                                                    <td><asp:TextBox ID="NumeroTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                ValidationGroup="FORMACESSO" Width="444px"></asp:TextBox>
                                                        <asp:MaskedEditExtender ID="NumeroTextBox_MaskedEditExtender" runat="server" 
                                                            ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                                            CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                                            CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                            Mask="9999\-9999" MaskType="Number" TargetControlID="NumeroTextBox">
                                                        </asp:MaskedEditExtender>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="300">
                                            &nbsp;</td>
                                        <td align="right" width="500">
                                            <asp:ValidationSummary ID="ValidationSummaryACESSO" runat="server" 
                                                ValidationGroup="FORMACESSO" ShowMessageBox="True" ShowSummary="False" />
                                            <br />
                                            <asp:LinkButton ID="LinkButtonSalvarContaAcesso" runat="server" 
                                                ValidationGroup="FORMACESSO" CssClass="button" 
                                                ToolTip="Clique aqui para salvar as alterações" Visible="False">Salvar</asp:LinkButton>
                                        </td>
                                    </tr>
                                    </table>
                                </div>
                                <h3><a href="#" onclick="javascript: f(2);">Requisitantes de Vagas</a></h3>
                                <div>&nbsp;<br />
                                    <asp:GridView ID="GridViewDEPARTAMENTO" runat="server" 
                                        AutoGenerateColumns="False" BorderStyle="None" DataKeyNames="idRH_Gestor" 
                                        DataSourceID="SqlDEPARTAMENTOLISTA" GridLines="Horizontal" Width="100%">
                                        <AlternatingRowStyle BackColor="#F2F2F2" />
                                        <Columns>
                                            <asp:BoundField DataField="idRH_Gestor" HeaderText="idRH_Gestor" 
                                                InsertVisible="False" ReadOnly="True" SortExpression="idRH_Gestor" 
                                                Visible="False" />
                                            <asp:BoundField DataField="idUser" HeaderText="idUser" 
                                                SortExpression="idUser" Visible="False" />
                                            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                                SortExpression="idCadastroEmpresa" Visible="False" />
                                            <asp:BoundField DataField="idRH" HeaderText="idRH" 
                                                SortExpression="idRH" Visible="False" />
                                            <asp:BoundField DataField="nome" HeaderText="Usuário" 
                                                SortExpression="nome" Visible="False" />
                                            <asp:ButtonField CommandName="Select" DataTextField="nome" HeaderText="Usuário" Text="Button" />
                                            <asp:BoundField DataField="password" HeaderText="Senha" 
                                                SortExpression="password" Visible="False" />
                                            <asp:BoundField DataField="email" HeaderText="E-mail" 
                                                SortExpression="email" />
                                            <asp:CheckBoxField DataField="bloquear" HeaderText="Bloqueio" SortExpression="bloquear" />
                                            <asp:BoundField DataField="data" HeaderText="data" 
                                                SortExpression="data" Visible="False" />
                                            <asp:BoundField DataField="userName" HeaderText="userName" 
                                                SortExpression="userName" Visible="False" />
                                            <asp:BoundField DataField="cpf" HeaderText="cpf" SortExpression="cpf" 
                                                Visible="False" />
                                            <asp:BoundField DataField="frase" 
                                                HeaderText="frase" SortExpression="frase" 
                                                Visible="False" />
                                            <asp:BoundField DataField="idTypeUser" HeaderText="idTypeUser" SortExpression="idTypeUser" Visible="False" />
                                        </Columns>
                                    </asp:GridView>
                                    <br />
                                    <asp:FormView ID="FormViewAREA" runat="server" AllowPaging="True" BackColor="#FFFFE8" DataKeyNames="idRH" DataSourceID="SqlDataSourcetbuserTypeFORM" Width="100%">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label37" runat="server" Text="Nome da Área:" />
                                            <br />
                                            <asp:TextBox ID="dsRH_vinculoTextBox" runat="server" CssClass="InputCadFormCandidatoCV_OK" Text='<%# Bind("dsRH_vinculo") %>' />
                                            <br />
                                            <br />
                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" CssClass="button" Text="Salvar" />
&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="button" Text="Cancelar" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:Label ID="Label37" runat="server" Text="Nome da Área:"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="dsRH_vinculoTextBox" runat="server" CssClass="InputCadFormCandidatoCV_OK" Text='<%# Bind("dsRH_vinculo") %>' />
                                            <br />
                                            <br />
                                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="button" Text="Salvar" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="button" Text="Cancelar" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="dsRH_vinculoLabel" runat="server" CssClass="tituloProcessoSeletivo" Text='<%# Bind("dsRH_vinculo") %>' />
                                            <br />
                                            <br />
                                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" CssClass="button" Text="Editar" />
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete" CssClass="button" OnClientClick="return confirm(&quot;Deseja excluir este registro?\n\nTenha certeza de não ter usuário utilizando esta área.&quot;)">Excluir</asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="button" Text="Nova área" />
                                        </ItemTemplate>
                                    </asp:FormView>
                                    <br />
                                    <table id="FORM" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="LabelFORM" runat="server" CssClass="tituloProcessoSeletivo" Text="Formulário utilizado apenas para incluir novas contas"></asp:Label>
                                                <br />
                                                <br />
                                                <asp:DropDownList ID="DropDownListNivel" runat="server" CssClass="DropCadFormCandidatoCV" DataSourceID="SqlDataSourceRELACIONAMENTO_IDRH" DataTextField="dsRH_vinculo" DataValueField="idRH">
                                                </asp:DropDownList>
                                                <br />
                                                <br />
                                                <asp:Label ID="Label38" runat="server" Text="Nome do requisitante:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="nomeTextBoxDEPARTAMENTO" runat="server" CssClass="InputCadFormCandidatoCV" Text=""></asp:TextBox>
                                                <br />
                                                <asp:Label ID="Label39" runat="server" Text="Senha:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="passwordTextBoxDEPARTAMENTO" runat="server" CssClass="InputCadFormCandidatoCV" MaxLength="16" Text="" TextMode="Password"></asp:TextBox>
                                                <br />
                                                <asp:Label ID="Label40" runat="server" Text="E-mail:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="emailTextBoxDEPARTAMENTO" runat="server" CssClass="InputCadFormCandidatoCV" Text=""></asp:TextBox>
                                                <br />
                                                <asp:Label ID="Label41" runat="server" Text="DDD:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="dddTextBoxDEPARTAMENTO" runat="server" CssClass="InputCadFormCandidatoCV" Text="" Width="80px" MaxLength="2"></asp:TextBox>
                                                <br />
                                                <asp:Label ID="Label42" runat="server" Text="Telefone:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="telefoneTextBoxDEPARTAMENTO" runat="server" CssClass="InputCadFormCandidatoCV" Text=""></asp:TextBox>
                                                <asp:MaskedEditExtender ID="telefoneTextBoxDEPARTAMENTO_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" InputDirection="RightToLeft" Mask="9999\-9999" MaskType="Number" TargetControlID="telefoneTextBoxDEPARTAMENTO">
                                                </asp:MaskedEditExtender>
                                                <br />
                                                <br />
                                                <asp:Label ID="Label43" runat="server" Text="Níveis de permissões:"></asp:Label>
                                                <br />
                                                <asp:RadioButtonList ID="RadionivelAprovacao" runat="server" Width="100%">
                                                    <asp:ListItem Selected="True" Value="1">Requisição de Vaga. (Solicitar e Aprovar)</asp:ListItem>
                                                    <asp:ListItem Value="0">Requisição de Vaga. (Solicitar)</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <br />
                                                <br />
                                                <br />
                                                <asp:LinkButton ID="LinkButtonSALVAR" runat="server" CssClass="button">Salvar</asp:LinkButton>
                                                <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CssClass="button">Cancelar</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />
    <asp:SqlDataSource ID="SqlDataSourceRELACIONAMENTO_IDRH" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT idCadastroEmpresa, dsvinculo, idRH, dsRH_vinculo FROM tbRH_vinculo WHERE (idCadastroEmpresa = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDEPARTAMENTO_EMPRESA" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="uspCorporativoDepartamentoDelete"
        InsertCommand="uspCorporativoDepartamentoInsert"
        SelectCommand="uspCorporativoDepartamentoSelect"
        UpdateCommand="uspCorporativoDepartamentoUpdate" InsertCommandType="StoredProcedure" 
        SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure" 
        DeleteCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:ControlParameter ControlID="idUserLabel" Name="idUser" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idUser" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idUser" Type="Int32" />
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="idTypeUser" Type="String" />
            <asp:Parameter Name="userName" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="frase" Type="String" />
            <asp:Parameter Name="cpf" Type="String" />
            <asp:Parameter Name="bloquear" Type="Boolean" />
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter Name="ddd" Type="String" />
            <asp:Parameter Name="telefone" Type="String" />
            <asp:Parameter Name="idRH" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idUser" Type="Int32" />
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="idRH" Type="Int32" />
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="frase" Type="String" />
            <asp:Parameter Name="ddd" Type="String" />
            <asp:Parameter Name="telefone" Type="String" />
            <asp:Parameter Name="bloquear" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcetbuserType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
            SelectCommand="SELECT [idRH], [dsRH_vinculo], [idCadastroEmpresa], [dsvinculo] FROM [tbRH_vinculo] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)" DeleteCommand="DELETE FROM [tbRH_vinculo] WHERE [idRH] = @idRH" InsertCommand="INSERT INTO [tbRH_vinculo] ([dsRH_vinculo], [idCadastroEmpresa], [dsvinculo]) VALUES (@dsRH_vinculo, @idCadastroEmpresa, @dsvinculo)" UpdateCommand="UPDATE [tbRH_vinculo] SET [dsRH_vinculo] = @dsRH_vinculo, [idCadastroEmpresa] = @idCadastroEmpresa, [dsvinculo] = @dsvinculo WHERE [idRH] = @idRH">
        <DeleteParameters>
            <asp:Parameter Name="idRH" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="dsRH_vinculo" Type="String" />
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="dsvinculo" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="dsRH_vinculo" Type="String" />
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="dsvinculo" Type="String" />
            <asp:Parameter Name="idRH" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcetbuserTypeFORM" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
            SelectCommand="SELECT [idRH], [dsRH_vinculo], [idCadastroEmpresa], [dsvinculo] FROM [tbRH_vinculo] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)" DeleteCommand="DELETE FROM [tbRH_vinculo] WHERE [idRH] = @idRH" InsertCommand="INSERT INTO [tbRH_vinculo] ([dsRH_vinculo], [idCadastroEmpresa], [dsvinculo]) VALUES (@dsRH_vinculo, @idCadastroEmpresa, @dsvinculo)" UpdateCommand="UPDATE [tbRH_vinculo] SET [dsRH_vinculo] = @dsRH_vinculo, [idCadastroEmpresa] = @idCadastroEmpresa, [dsvinculo] = @dsvinculo WHERE [idRH] = @idRH">
        <DeleteParameters>
            <asp:Parameter Name="idRH" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="dsRH_vinculo" Type="String" />
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="dsvinculo" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="dsRH_vinculo" Type="String" />
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="dsvinculo" Type="String" />
            <asp:Parameter Name="idRH" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
                                    <br />
                                </div>
                                <h3><a href="#" onclick="javascript: f(3);">Acesso as salas virtuais</a></h3>
                                <div>
                                    <asp:GridView ID="GridViewSALA" runat="server" AutoGenerateColumns="False" 
                                        BorderStyle="None" CssClass="textoNone" DataKeyNames="sala,idEntrevistaVirtual,idcurriculo" 
                                        DataSourceID="SqlSALASVIRTUAISATIVAS" GridLines="Horizontal" Width="100%" 
                                        BorderColor="#F2F2F2">
                                        <AlternatingRowStyle BackColor="#F3F3F3" />
                                        <Columns>
                                            <asp:BoundField DataField="idEntrevistaVirtual" 
                                                HeaderText="idEntrevistaVirtual" InsertVisible="False" ReadOnly="True" 
                                                SortExpression="idEntrevistaVirtual" Visible="False" />
                                            <asp:TemplateField HeaderText="Sala virtual" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButtonSALA" runat="server" CausesValidation="false" 
                                                        CommandName="Select" CssClass="textoBold" Text='<%# Eval("sala") %>' 
                                                        ToolTip="Clique aqui para entrar na sala virtual"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="sala" HeaderText="Sala virtual" 
                                                SortExpression="sala" Visible="False" />
                                            <asp:BoundField DataField="ProtocoloDoAgendamento" 
                                                HeaderText="ProtocoloDoAgendamento" SortExpression="ProtocoloDoAgendamento" 
                                                Visible="False" />
                                            <asp:BoundField DataField="DataStartField" HeaderText="Início" 
                                                SortExpression="DataStartField" />
                                            <asp:BoundField DataField="DataEndField" HeaderText="DataEndField" 
                                                SortExpression="DataEndField" Visible="False" />
                                            <asp:BoundField DataField="aceito" HeaderText="aceito" SortExpression="aceito" 
                                                Visible="False" />
                                            <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                                                SortExpression="Protocolo" Visible="False" />
                                            <asp:BoundField DataField="dsProcesso" HeaderText="Vaga" 
                                                SortExpression="dsProcesso" />
                                            <asp:BoundField DataField="nome" HeaderText="Candidato" SortExpression="nome" />
                                            <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" 
                                                SortExpression="idcurriculo" Visible="False" />
                                        </Columns>
                                        <EmptyDataTemplate>
                                            <table ID="COMUNICADORNULL0" cellpadding="2" cellspacing="2" width="800">
                                                <tr>
                                                    <td align="right" valign="top" width="300">
                                                        <asp:Image ID="ImageAvisoNULL" runat="server" 
                                                            ImageUrl="~/_corporativo/images/_bottonAvisoSISTEMA.png" />
                                                    </td>
                                                    <td width="500">
                                                        <asp:Label ID="LabelCHATAVISO" runat="server" 
                                                            
                                                            Text="Não existe agendamento para uso das salas virtuais.&lt;br&gt;Utilize o &quot;&lt;b&gt;Processo Seletivo&lt;/b&gt;&quot; para agendar uma entrevista virtual com um candidato." 
                                                            CssClass="textoGeral"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                    <br />
                                    <br />
                                    <table id="JAVA" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <asp:ImageButton ID="ImageButtonJAVA" runat="server" 
                                                    ImageUrl="~/images/java.png" 
                                                    PostBackUrl="http://www.java.com/pt_BR/download/" />
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelAVISO" runat="server" 
                                                    Text="Para utilizar o Chat será necessário ter instalado em sua máquina a última versão do Java.&lt;br&gt;Para instalar ou atualizar a versão de seu Java &lt;a href=&quot;http://www.java.com/pt_BR/download/&quot;&gt;clique aqui.&lt;/a&gt;"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                </div>  
                                <h3><a href="#" onclick="javascript: f(4);">Outlook - Interno</a></h3>
                                <div>
                                <asp:GridView ID="GridViewOUTLOOK" runat="server" AutoGenerateColumns="False" BorderColor="#F2F2F2" BorderStyle="None" BorderWidth="1px" 
                                        DataKeyNames="idVagaAnuncio_PREVIEW_Historico,protocolo,nomeGESTOR,emailGESTOR" DataSourceID="SqlOUTLOOK" 
                                        GridLines="Horizontal" Width="100%">
                                        <AlternatingRowStyle BackColor="#F0F0F0" BorderStyle="None" />
                                        <Columns>
                                            <asp:BoundField DataField="idVagaAnuncio_PREVIEW_Historico" 
                                                HeaderText="idVagaAnuncio_PREVIEW_Historico" InsertVisible="False" 
                                                ReadOnly="True" SortExpression="idVagaAnuncio_PREVIEW_Historico" 
                                                Visible="False" />
                                            <asp:BoundField DataField="idRH_Gestor" HeaderText="idRH_Gestor" 
                                                SortExpression="idRH_Gestor" Visible="False" />
                                            <asp:ButtonField CommandName="Select" DataTextField="protocolo" 
                                                HeaderText="Protocolo" Text="Button">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            </asp:ButtonField>
                                            <asp:BoundField DataField="protocolo" HeaderText="Protocolo" 
                                                SortExpression="protocolo" Visible="False" >
                                            <HeaderStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="protocoloVaga" HeaderText="protocoloVaga" 
                                                SortExpression="protocoloVaga" Visible="False" />
                                            <asp:BoundField DataField="historico" HeaderText="historico" 
                                                SortExpression="historico" Visible="False" />
                                            <asp:BoundField DataField="parecerAnalista_Consultor" 
                                                HeaderText="parecerAnalista_Consultor" 
                                                SortExpression="parecerAnalista_Consultor" Visible="False" />
                                            <asp:BoundField DataField="dataCriacao" HeaderText="Criada em:" 
                                                SortExpression="dataCriacao" >
                                            <HeaderStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                             <table ID="COMUNICADORNULL" cellpadding="2" cellspacing="2" width="800">
                                                <tr>
                                                    <td align="right" valign="top" width="300">
                                                        <asp:Image ID="ImageAvisoNULL2" runat="server" 
                                                            ImageUrl="~/_corporativo/images/_bottonAvisoSISTEMA.png" />
                                                    </td>
                                                    <td width="500">
                                                        <asp:Label ID="LabelOUTLOOKAVISO" runat="server" 
                                                            
                                                            Text="Não existe registro de mensagens enviadas.&lt;br&gt;Utilize o sistema de &quot;&lt;b&gt;vagas salvas&lt;/b&gt;&quot; para enviar mensagens aos gestores." 
                                                            CssClass="textoGeral"></asp:Label>
                                                    </td>
                                                </tr>
                                             </table>                    
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                    <br />
                                    <asp:FormView ID="FormViewMENSAGEM" runat="server" 
                                        DataKeyNames="idVagaAnuncio_PREVIEW_Historico" 
                                        DataSourceID="SqlOUTLOOK_FORM" DefaultMode="Edit">
                                        <EditItemTemplate>
                                            <table ID="COMUNICADOR0" cellpadding="2" cellspacing="2" width="800">
                                                <tr>
                                                    <td align="right" valign="top" width="300">
                                                        <asp:Label ID="Label5" runat="server" Text="Protocolo da vaga salva:"></asp:Label>
                                                    </td>
                                                    <td width="500">
                                                        <asp:Label ID="protocoloLabel" runat="server" Text='<%# Bind("protocolo") %>' />
                                                        <asp:Label ID="idVagaAnuncio_PREVIEW_HistoricoLabel1" runat="server" 
                                                            Text='<%# Eval("idVagaAnuncio_PREVIEW_Historico") %>' Visible="False" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="300">
                                                        <asp:Label ID="Label6" runat="server" Text="Protocolo da vaga:"></asp:Label>
                                                    </td>
                                                    <td width="500">
                                                        <asp:Label ID="protocoloVagaLabel" runat="server" 
                                                            Text='<%# Bind("protocoloVaga") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" bgcolor="#FFFFEC" valign="top" width="300">
                                                        <asp:Label ID="Label7" runat="server" Text="Histórico das mensagens:"></asp:Label>
                                                    </td>
                                                    <td bgcolor="#FFFFEC" width="500">
                                                        <asp:Label ID="historicoLabel" runat="server" Text='<%# Bind("historico") %>' 
                                                            CssClass="textoNone" />
                                                        <br />
                                                        <asp:Label ID="Label12" runat="server" Text="Sua mensagem:"></asp:Label>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                                            ControlToValidate="TextBoxMensagem" 
                                                            ErrorMessage="• Escreva a mensagem a ser enviada." ValidationGroup="MENSAGEM"></asp:RequiredFieldValidator>
                                                        <br />
                                                        <asp:TextBox ID="TextBoxMensagem" runat="server" 
                                                            CssClass="InputCadFormCandidatoCV" Height="80px" TextMode="MultiLine" 
                                                            ValidationGroup="MENSAGEM" Width="500px"></asp:TextBox>
                                                        <br />
                                                        <asp:Label ID="Label14" runat="server" 
                                                            Text="Comentário (Será apresentado no histórico):"></asp:Label>
                                                        <br />
                                                        <asp:TextBox ID="parecerAnalista_ConsultorMTextBox" runat="server" 
                                                            CssClass="InputCadFormCandidatoCV" Height="80px" TextMode="MultiLine" 
                                                            ValidationGroup="MENSAGEM" Width="500px"></asp:TextBox>
                                                        <br />
                                                        <asp:RadioButtonList ID="RadioButtonListSMS" runat="server" 
                                                            RepeatDirection="Horizontal">
                                                            <asp:ListItem Value="1">Enviar SMS e e-mail</asp:ListItem>
                                                            <asp:ListItem Selected="True" Value="0">Enviar apenas e-mail</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="300">
                                                        <asp:Label ID="Label8" runat="server" Text="Observações:"></asp:Label>
                                                    </td>
                                                    <td width="500">
                                                        <asp:Label ID="parecerAnalista_ConsultorLabel" runat="server" 
                                                            Text='<%# Bind("parecerAnalista_Consultor") %>' CssClass="textoNone" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="300">
                                                        <asp:Label ID="Label9" runat="server" Text="Gestor:"></asp:Label>
                                                    </td>
                                                    <td width="500">
                                                        <asp:Label ID="nomeGESTORLabel" runat="server" 
                                                            Text='<%# Bind("nomeGESTOR") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="300">
                                                        <asp:Label ID="Label10" runat="server" Text="e-mail:"></asp:Label>
                                                    </td>
                                                    <td width="500">
                                                        <asp:Label ID="emailGESTORLabel" runat="server" 
                                                            Text='<%# Bind("emailGESTOR") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="300">
                                                        <asp:Label ID="Label11" runat="server" Text="Criação da vaga em:"></asp:Label>
                                                    </td>
                                                    <td width="500">
                                                        <asp:Label ID="dataCriacaoLabel" runat="server" 
                                                            Text='<%# Bind("dataCriacao") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="300">
                                                        &nbsp;</td>
                                                    <td align="right" width="500">
                                                        <br />
                                                        <asp:LinkButton ID="EditButton" runat="server" CommandName="Update" 
                                                            CssClass="button" Text="Enviar uma nova mensagem" 
                                                            ToolTip="Clique aqui para enviar mensagem" ValidationGroup="MENSAGEM" />
                                                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                                            CssClass="button" onclick="UpdateCancelButton_Click" Text="Cancelar" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <asp:TextBox ID="idRH_GestorTextBox" runat="server" 
                                                Text='<%# Bind("idRH_Gestor") %>' Visible="False" Width="10px" />
                                            <asp:TextBox ID="protocoloTextBox" runat="server" 
                                                Text='<%# Bind("protocolo") %>' Visible="False" Width="10px" />
                                            <asp:TextBox ID="protocoloVagaTextBox" runat="server" 
                                                Text='<%# Bind("protocoloVaga") %>' Visible="False" Width="10px" />
                                            <asp:TextBox ID="historicoTextBox" runat="server" 
                                                Text='<%# Bind("historico") %>' Visible="False" Width="10px" />
                                            <asp:TextBox ID="parecerAnalista_ConsultorTextBox" runat="server" 
                                                Text='<%# Bind("parecerAnalista_Consultor") %>' Visible="False" 
                                                Width="10px" />
                                            <asp:TextBox ID="nomeGESTORTextBox" runat="server" 
                                                Text='<%# Bind("nomeGESTOR") %>' Visible="False" Width="10px" />
                                            <asp:TextBox ID="emailGESTORTextBox" runat="server" 
                                                Text='<%# Bind("emailGESTOR") %>' Visible="False" Width="10px" />
                                            <asp:TextBox ID="dataCriacaoTextBox" runat="server" 
                                                Text='<%# Bind("dataCriacao") %>' Visible="False" Width="10px" />
                                            <br />
                                            &nbsp;
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            idRH_Gestor:
                                            <asp:TextBox ID="idRH_GestorTextBox" runat="server" 
                                                Text='<%# Bind("idRH_Gestor") %>' />
                                            <br />
                                            protocolo:
                                            <asp:TextBox ID="protocoloTextBox" runat="server" 
                                                Text='<%# Bind("protocolo") %>' />
                                            <br />
                                            protocoloVaga:
                                            <asp:TextBox ID="protocoloVagaTextBox" runat="server" 
                                                Text='<%# Bind("protocoloVaga") %>' />
                                            <br />
                                            historico:
                                            <asp:TextBox ID="historicoTextBox" runat="server" 
                                                Text='<%# Bind("historico") %>' />
                                            <br />
                                            parecerAnalista_Consultor:
                                            <asp:TextBox ID="parecerAnalista_ConsultorTextBox" runat="server" 
                                                Text='<%# Bind("parecerAnalista_Consultor") %>' />
                                            <br />
                                            nomeGESTOR:
                                            <asp:TextBox ID="nomeGESTORTextBox" runat="server" 
                                                Text='<%# Bind("nomeGESTOR") %>' />
                                            <br />
                                            emailGESTOR:
                                            <asp:TextBox ID="emailGESTORTextBox" runat="server" 
                                                Text='<%# Bind("emailGESTOR") %>' />
                                            <br />
                                            dataCriacao:
                                            <asp:TextBox ID="dataCriacaoTextBox" runat="server" 
                                                Text='<%# Bind("dataCriacao") %>' />
                                            <br />
                                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                                CommandName="Insert" Text="Insert" />
                                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="idVagaAnuncio_PREVIEW_HistoricoLabel" runat="server" 
                                                Text='<%# Eval("idVagaAnuncio_PREVIEW_Historico") %>' Visible="False" />
                                            <asp:Label ID="idRH_GestorLabel" runat="server" 
                                                Text='<%# Bind("idRH_Gestor") %>' Visible="False" />
                                            <br />
                                                <table id="COMUNICADOR" cellpadding="2" cellspacing="2" width="800">
                                                    <tr>
                                                        <td align="right" width="300" valign="top">
                                                            <asp:Label ID="Label5" runat="server" Text="Protocolo da vaga salva:"></asp:Label>
                                                        </td>
                                                        <td width="500">
                                                            <asp:Label ID="protocoloLabel" runat="server" Text='<%# Bind("protocolo") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top" width="300">
                                                            <asp:Label ID="Label6" runat="server" Text="Protocolo da vaga:"></asp:Label>
                                                        </td>
                                                        <td width="500">
                                                            <asp:Label ID="protocoloVagaLabel" runat="server" 
                                                                Text='<%# Bind("protocoloVaga") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top" width="300">
                                                            <asp:Label ID="Label7" runat="server" Text="Histórico das mensagens:"></asp:Label>
                                                        </td>
                                                        <td width="500">
                                                            <asp:Label ID="historicoLabel" runat="server" Text='<%# Bind("historico") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top" width="300">
                                                            <asp:Label ID="Label8" runat="server" Text="Observações:"></asp:Label>
                                                        </td>
                                                        <td width="500">
                                                            <asp:Label ID="parecerAnalista_ConsultorLabel" runat="server" 
                                                                Text='<%# Bind("parecerAnalista_Consultor") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top" width="300">
                                                            <asp:Label ID="Label9" runat="server" Text="Gestor:"></asp:Label>
                                                        </td>
                                                        <td width="500">
                                                            <asp:Label ID="nomeGESTORLabel" runat="server" 
                                                                Text='<%# Bind("nomeGESTOR") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top" width="300">
                                                            <asp:Label ID="Label10" runat="server" Text="e-mail:"></asp:Label>
                                                        </td>
                                                        <td width="500">
                                                            <asp:Label ID="emailGESTORLabel" runat="server" 
                                                                Text='<%# Bind("emailGESTOR") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top" width="300">
                                                            <asp:Label ID="Label11" runat="server" Text="Criação da vaga em:"></asp:Label>
                                                        </td>
                                                        <td width="500">
                                                            <asp:Label ID="dataCriacaoLabel" runat="server" 
                                                                Text='<%# Bind("dataCriacao") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top" width="300">
                                                            &nbsp;</td>
                                                        <td align="right" width="500">
                                                            <br />
                                                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                                                CommandName="Edit" CssClass="button" Text="Enviar uma nova mensagem" 
                                                                ToolTip="Clique aqui para enviar mensagem" />
                                                        </td>
                                                    </tr>
                                                </table> 
                                            <br />
                                        </ItemTemplate>
                                    </asp:FormView>
                                </div>
                                <h3><a href="#" onclick="javascript: f(5);">Formulário para novas empresas</a></h3>
                                <div>
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26"></td>
                <td width="614"><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
                <asp:Label ID="Label15" runat="server" Visible="False">0</asp:Label>
                <asp:Label ID="Label16" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idPerfilVagaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idCadastroEmpresaPaiLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="Label17" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="URLLabel" runat="server"></asp:Label>
                <asp:Label ID="idUserEmpresaLabel" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td width="100%">
                    <br />

                    <table cellpadding="0" cellspacing="0" runat="server" width="100%" 
                        id="FormEmpresa" visible="true">
                        <tr>
                            <td width="60">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style="text-align: left" width="100%">                                

                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="LabelCabec1" runat="server" 
                                                        Text="Nome da empresa (Razão Social):"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                                        ControlToValidate="nmempresaTextBox" Display="Dynamic" 
                                                        ErrorMessage="Razão Social ou Nome Fantasia é obrigatório." 
                                                        SetFocusOnError="True" ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    <asp:Label ID="LabelCabec2" runat="server" Text="Nome do responsável:"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCLIENTE" runat="server" 
                                                        ControlToValidate="nomeResTextBox" Display="Dynamic" 
                                                        ErrorMessage="Nome completo do responsável é obrigatório." 
                                                        SetFocusOnError="True" ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="nmempresaTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                        Width="327px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image9" runat="server" ImageUrl="~/images/15px.gif" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="nomeResTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                        Width="327px"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="LabelCabec3" runat="server" Text="CNPJ:"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                                        ControlToValidate="TextBoxCNPJ" Display="Dynamic" 
                                                        ErrorMessage="CNPJ é obrigatório." SetFocusOnError="True" 
                                                        ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                    <asp:Label ID="lblmsnOK" runat="server" CssClass="msnOK"></asp:Label>
                                                    <asp:Label ID="lblmsn" runat="server" CssClass="msn" Visible="False"></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    <asp:Label ID="LabelCabec4" runat="server" Text="Ramo de atividade da empresa:"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="TextBoxCNPJ" runat="server" 
                                                        CssClass="InputCadFormCandidatoCV" ValidationGroup="CNPJ" Width="327px"></asp:TextBox>
                                                    <asp:MaskedEditExtender ID="TextBoxCNPJ_MaskedEditExtender" runat="server" 
                                                        ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                                        CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                                        CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                        Mask="99\.999\.999\/9999-99" MaskType="Number" 
                                                        TargetControlID="TextBoxCNPJ" InputDirection="RightToLeft">
                                                    </asp:MaskedEditExtender>
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image10" runat="server" ImageUrl="~/images/15px.gif" />
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="idAreaAtuacaoDropDownList" runat="server" 
                                                        CssClass="DropCadFormCandidatoCV" DataSourceID="SqlAtividade" DataTextField="dsAreaAtuacao" 
                                                        DataValueField="idAreaAtuacao" Width="334px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="LabelIE" runat="server" Text="I.E:"></asp:Label>
                                                    <br />
                                                    <asp:TextBox ID="TextBoxIE" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                        Width="327px">Isento</asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    <asp:Label ID="LabelCabec5" runat="server" Text="Porte da empresa:"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                                        ControlToValidate="idPorteRadioButtonList" Display="Dynamic" 
                                                        ErrorMessage="Porte da empresa é obrigatório." SetFocusOnError="True" 
                                                        ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                    <br />
                                                    <asp:DropDownList ID="idPorteRadioButtonList" runat="server" CssClass="DropCadFormCandidatoCV" 
                                                        DataSourceID="SqlPorte" DataTextField="dsPorte" DataValueField="idPorte" 
                                                        Width="334px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />

                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="LabelCabec6" runat="server" Text="CEP:"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                                        ControlToValidate="cepTextBox" Display="Dynamic" 
                                                        ErrorMessage="CEP é obrigatório." SetFocusOnError="True" 
                                                        ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                                        ControlToValidate="cepTextBox" Display="Dynamic" ErrorMessage="*" 
                                                        SetFocusOnError="True" ValidationGroup="CEP"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorCLIENTE" runat="server" 
                                                        ControlToValidate="cepTextBox" ErrorMessage="* CEP 99999-999" 
                                                        ValidationExpression="\d{5}(-\d{3})?" ValidationGroup="CEP"></asp:RegularExpressionValidator>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="cepTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                                    Text='<%# Bind("cep") %>' ValidationGroup="CEP" Width="307px"></asp:TextBox>
                                                                <cc1:MaskedEditExtender ID="cepTextBox_MaskedEditExtender0" runat="server" 
                                                                    ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                                                    CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                                                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                    Mask="99999\-999" MaskType="Number" TargetControlID="cepTextBox" 
                                                                    InputDirection="RightToLeft">
                                                                </cc1:MaskedEditExtender>
                                                            </td>
                                                            <td>
                                                                <asp:ImageButton ID="PesquisaCEP" runat="server" 
                                                                    ImageUrl="~/images/layout/pesquisa.gif" OnClick="PesquisaCEP_Click1" 
                                                                    ValidationGroup="CEP" />
                                                                </td>
                                                        </tr>
                                                    </table>
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                    <asp:Label ID="LabelCabec7" runat="server" Text="Endereço:"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                                                        ControlToValidate="enderecoTextBox" Display="Dynamic" 
                                                        ErrorMessage="Endereço é obrigatório." SetFocusOnError="True" 
                                                        ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                                <br />
                                                    <asp:TextBox ID="enderecoTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                        Text='<%# Bind("endereco") %>' Width="263px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label26" runat="server" Text="Nº:"></asp:Label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" 
                                                                    ControlToValidate="numeroTextBox1" ErrorMessage="Informe o número." 
                                                                    ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                                <br />
                                                                <asp:TextBox ID="numeroTextBox1" runat="server" 
                                                                    CssClass="InputCadFormCandidatoCV" ValidationGroup="cadEmpresa" Width="60px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                    <asp:Label ID="LabelCabec8" runat="server" Text="Bairro:"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                                        ControlToValidate="bairroTextBox" Display="Dynamic" 
                                                        ErrorMessage="Bairro é obrigatório." SetFocusOnError="True" 
                                                        ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                    <br />
                                                    <asp:TextBox ID="bairroTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                        Text='<%# Bind("bairro") %>' Width="327px"></asp:TextBox>
                                                    <br />
                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="LabelCabec9" runat="server" Text="Cidade:"></asp:Label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                                                    ControlToValidate="cidadeTextBox" Display="Dynamic" 
                                                                    ErrorMessage="Cidade é obrigatório." SetFocusOnError="True" 
                                                                    ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                <asp:Image ID="Image16" runat="server" ImageUrl="../images/5px.gif" />
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label22" runat="server" Text="UF:"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="cidadeTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                                    Text='<%# Bind("cidade") %>' Width="263px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Image ID="Image1" runat="server" ImageUrl="../images/5px.gif" />
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="DDUf" runat="server" CssClass="DropCadFormCandidatoCV" 
                                                                    DataSourceID="SqlUF" DataTextField="uf" DataValueField="uf" Width="60px">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:Label ID="LabelCabec10" runat="server" Text="Pais:"></asp:Label>
                                                    <br />
                                                    <asp:DropDownList ID="paisDropDownList" runat="server" CssClass="DropCadFormCandidatoCV" 
                                                        DataSourceID="SqlPais" DataTextField="pais" DataValueField="pais" 
                                                        Width="335px">
                                                    </asp:DropDownList>
                                                    <br />
                                                    <br />
                                                    Telefone para contato: [99] [9999-9999]<table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                DDD<asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                                                                    ControlToValidate="ddd" Display="Dynamic" ErrorMessage="Informe o DDD." 
                                                                    SetFocusOnError="True" ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                                                    ControlToValidate="ddd" Display="Dynamic" ErrorMessage="Deve ser numérico." 
                                                                    SetFocusOnError="True" ValidationExpression="\d{2}" 
                                                                    ValidationGroup="cadEmpresa">*</asp:RegularExpressionValidator>
                                                            </td>
                                                            <td>
                                                                Número<asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                                                                    ControlToValidate="telefone" Display="Dynamic" 
                                                                    ErrorMessage="Telefone é obrigatório." SetFocusOnError="True" 
                                                                    ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                                                    ControlToValidate="telefone" Display="Dynamic" 
                                                                    ErrorMessage="Informe o número do telefone." SetFocusOnError="True" 
                                                                    ValidationExpression="\d{4}(-\d{4})?" ValidationGroup="cadEmpresa">*</asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="ddd" runat="server" CssClass="InputCadFormCandidatoCV" Width="50px" 
                                                                    ValidationGroup="cadEmpresa"></asp:TextBox>
                                                                <cc1:MaskedEditExtender ID="ddd_MaskedEditExtender0" runat="server" 
                                                                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                    TargetControlID="ddd" ClearMaskOnLostFocus="False" 
                                                                    ClearTextOnInvalid="True" InputDirection="RightToLeft" Mask="99" 
                                                                    MaskType="Number">
                                                                </cc1:MaskedEditExtender>
                                                                <asp:Image ID="Image15" runat="server" ImageUrl="~/images/5px.gif" />
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="telefone" runat="server" CssClass="InputCadFormCandidatoCV" Width="262px" 
                                                                    ValidationGroup="cadEmpresa"></asp:TextBox>
                                                                <cc1:MaskedEditExtender ID="telefone_MaskedEditExtender0" runat="server" 
                                                                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                    Mask="9999\-9999" MaskType="Number" TargetControlID="telefone" 
                                                                    ClearMaskOnLostFocus="False" InputDirection="RightToLeft">
                                                                </cc1:MaskedEditExtender>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image11" runat="server" ImageUrl="~/images/15px.gif" />
                                                </td>
                                                <td valign="middle">
                                                    <asp:Label ID="LabelPrv" runat="server" Text="Privacidade:"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                                                        ControlToValidate="PrivacidadeRadioButtonList" Display="Dynamic" 
                                                        ErrorMessage="Informe sobre a privacidade." SetFocusOnError="True" 
                                                        ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                    <asp:RadioButtonList ID="PrivacidadeRadioButtonList" runat="server" 
                                                        CellPadding="0" CellSpacing="0">
                                                        <asp:ListItem Value="1" Selected="True">Nome da empresa não aparece nos anúncios</asp:ListItem>
                                                        <asp:ListItem Value="0">Nome da empresa aparece nos anúncios</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <br />
                                                    <asp:Label ID="Label1" runat="server" 
                                                        Text="Anos de existência da empresa: [Apenas números]"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" 
                                                        ControlToValidate="tempoexistenciaLabel" 
                                                        ErrorMessage="Tempo de atividade da empresa" ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                    &nbsp;<br />
                                                    <asp:TextBox ID="tempoexistenciaLabel" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                        Width="327px"></asp:TextBox>
                                                    <asp:MaskedEditExtender ID="tempoexistenciaLabel_MaskedEditExtender" 
                                                        runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                        CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                        InputDirection="RightToLeft" Mask="9999" MaskType="Number" 
                                                        TargetControlID="tempoexistenciaLabel">
                                                    </asp:MaskedEditExtender>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td align="left" valign="bottom">
                                                    <asp:Label ID="Label20" runat="server" Text="Site da empresa:"></asp:Label>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                                        ControlToValidate="siteTextBox" ErrorMessage="Informe uma URL válida." 
                                                        ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                                                        ValidationGroup="cadEmpresa">*</asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" 
                                                        ControlToValidate="siteTextBox" ErrorMessage="URL é obrigatório." 
                                                        ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                                    <br />
                                                    <asp:TextBox ID="siteTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                        Width="327px">http://</asp:TextBox>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                                <td align="left" valign="bottom">
                                <asp:Label ID="lblText" runat="server" CssClass="msn"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:Panel ID="PanelCobranca" runat="server">
                                                        <table ID="COBRANCA" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="LabelCabecCobranca" runat="server" CssClass="tituloEmpresa">Endereço de cobrança</asp:Label>
                                                                    <br />
                                                                    <asp:LinkButton ID="LinkButtonMesmo" runat="server" CausesValidation="False">O mesmo (Clique aqui)</asp:LinkButton>
                                                                    <br />
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="LabelCabec16" runat="server" 
                                                                        Text="Nome do responsável (Cobrança)"></asp:Label>
                                                                    <br />
                                                                    <asp:TextBox ID="nomeResTextBox0" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                                        Width="327px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left">
                                                                    <table cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td>
                                                                                DDD</td>
                                                                            <td>
                                                                                Número</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:TextBox ID="ddd0" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                                                    ValidationGroup="cadEmpresa" Width="50px"></asp:TextBox>
                                                                                <cc1:MaskedEditExtender ID="ddd0_MaskedEditExtender" runat="server" 
                                                                                    ClearMaskOnLostFocus="False" ClearTextOnInvalid="True" 
                                                                                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                                                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                                    InputDirection="RightToLeft" Mask="99" MaskType="Number" TargetControlID="ddd0">
                                                                                </cc1:MaskedEditExtender>
                                                                                <asp:Image ID="Image17" runat="server" ImageUrl="~/images/5px.gif" />
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="telefone0" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                                                    ValidationGroup="cadEmpresa" Width="264px"></asp:TextBox>
                                                                                <cc1:MaskedEditExtender ID="telefone0_MaskedEditExtender" runat="server" 
                                                                                    ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                                                                    CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                                                                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                                    InputDirection="RightToLeft" Mask="9999\-9999" MaskType="Number" 
                                                                                    TargetControlID="telefone0">
                                                                                </cc1:MaskedEditExtender>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label24" runat="server" Text="E-mail (Cobrança)"></asp:Label>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                                                                        ControlToValidate="emailTextBox0" ErrorMessage="Informe e-mail válido." 
                                                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                                        ValidationGroup="cadEmpresa">*</asp:RegularExpressionValidator>
                                                                    <br />
                                                                    <asp:TextBox ID="emailTextBox0" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                                        ValidationGroup="cadEmpresa" Width="327px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="LabelCabec11" runat="server" Text="CEP:"></asp:Label>
                                                                    <br />
                                                                    <asp:TextBox ID="cepTextBox0" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                                        Text='<%# Bind("cep") %>' ValidationGroup="CEP" Width="327px"></asp:TextBox>
                                                                    <cc1:MaskedEditExtender ID="cepTextBox0_MaskedEditExtender" runat="server" 
                                                                        ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                                                        CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                                                        CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                        InputDirection="RightToLeft" Mask="99999\-999" MaskType="Number" 
                                                                        TargetControlID="cepTextBox0">
                                                                    </cc1:MaskedEditExtender>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <br />
                                                                    <table cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="LabelCabec12" runat="server" Text="Endereço:"></asp:Label>
                                                                                <br />
                                                                                <asp:TextBox ID="enderecoTextBox0" runat="server" 
                                                                                    CssClass="InputCadFormCandidatoCV" Text='<%# Bind("endereco") %>' Width="263px"></asp:TextBox>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="Label25" runat="server" Text="Nº:"></asp:Label>
                                                                                <br />
                                                                                <asp:TextBox ID="numeroTextBox0" runat="server" 
                                                                                    CssClass="InputCadFormCandidatoCV" Width="60px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="LabelCabec13" runat="server" Text="Bairro:"></asp:Label>
                                                                    <br />
                                                                    <asp:TextBox ID="bairroTextBox0" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                                        Text='<%# Bind("bairro") %>' Width="327px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left">
                                                                    <table cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="LabelCabec14" runat="server" Text="Cidade:"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;</td>
                                                                            <td>
                                                                                <asp:Label ID="Label23" runat="server" Text="UF:"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:TextBox ID="cidadeTextBox0" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                                                    Text='<%# Bind("cidade") %>' Width="263px"></asp:TextBox>
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;</td>
                                                                            <td>
                                                                                <asp:DropDownList ID="DDUf0" runat="server" CssClass="DropCadFormCandidatoCV" 
                                                                                    DataSourceID="SqlUF" DataTextField="uf" DataValueField="uf" Width="60px">
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="LabelCabec15" runat="server" Text="Pais:"></asp:Label>
                                                                    <br />
                                                                    <asp:DropDownList ID="paisDropDownList0" runat="server" CssClass="DropCadFormCandidatoCV" 
                                                                        DataSourceID="SqlPais" DataTextField="pais" DataValueField="pais" 
                                                                        Width="335px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                                <td align="right" valign="bottom">
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                                <td align="right" valign="bottom">
                                                    &nbsp;</td>
                                            </tr>
                                        </table>

                            </td>
                        </tr>
                        <tr>
                            <td width="60">&nbsp;</td>
                            <td style="text-align: left" width="100%" bgcolor="#FFFFF4">                                

                                        <br />

                                 <table cellpadding="0" cellspacing="0" width="800">
                                    <tr>
                                        <td>
                                            Usuário (Master):):<asp:RequiredFieldValidator ID="RequiredFieldValidator13" 
                                                runat="server" ControlToValidate="userNameTextBox" Display="Dynamic" 
                                                ErrorMessage="Nome de usuário é obrigatório." SetFocusOnError="True" 
                                                ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            Senha:<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                                ControlToValidate="passwordTextBoxCADASTROEMPRESA" Display="Dynamic" 
                                                ErrorMessage="Senha é obrigatória." SetFocusOnError="True" 
                                                ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            E-mail:<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                                ControlToValidate="emailTextBoxCADASTROEMPRESA" Display="Dynamic" 
                                                ErrorMessage="E-mail é obrigatório." SetFocusOnError="True" 
                                                ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                ControlToValidate="emailTextBoxCADASTROEMPRESA" Display="Dynamic" 
                                                ErrorMessage="Informe e-mail válido." SetFocusOnError="True" 
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                ValidationGroup="cadEmpresa">*</asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="userNameTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                Width="248px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image6" runat="server" ImageUrl="~/images/15px.gif" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="passwordTextBoxCADASTROEMPRESA" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                Width="248px" TextMode="Password"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image8" runat="server" ImageUrl="~/images/15px.gif" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="emailTextBoxCADASTROEMPRESA" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                Width="248px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table cellpadding="0" cellspacing="0" width="790">
                                    <tr>
                                        <td>
                                            Lembrete:<asp:RequiredFieldValidator ID="RequiredFieldValidator10" 
                                                runat="server" ControlToValidate="fraseTextBox" Display="Dynamic" 
                                                ErrorMessage="Lembrete é obrigatório." SetFocusOnError="True" 
                                                ValidationGroup="cadEmpresa">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="fraseTextBox" runat="server" 
                                                CssClass="InputCadFormCandidatoCV" Width="100%"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="CONTAMSN" runat="server" CssClass="msn"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                        <br />
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="cadEmpresa" />
                                        <table id="BOTONS" cellpadding="0" cellspacing="0" width="790">
                                            <tr>
                                                <td align="right">
                                                    <asp:LinkButton ID="LinkButtonCadastrarCliente" runat="server" 
                                                        CssClass="button" ToolTip="Clique aqui para cadastrar este cliente" 
                                                        ValidationGroup="cadEmpresa">Cadastrar Cliente</asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButtonCancelarCliente" runat="server" CssClass="button" 
                                                        ToolTip="Clique aqui para cancelar o cadastro deste cliente">Cancelar</asp:LinkButton>
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
        <br />
                                </div>                                        
     
                                <h3><a href="#" onclick="javascript: f(6);">Dados de sua empresa</a></h3>
                                <div>

                                    <table cellpadding="0" cellspacing="0" runat="server" width="100%" 
                                        id="Table1" visible="true">
                                        <tr>
                                            <td width="60">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                            <td style="text-align: left" width="100%">
                                                <asp:DataList ID="DataListEMPRESA" runat="server" 
                                                    DataKeyField="idCadastroEmpresa" DataSourceID="SqlDadosdaEMPRESA" 
                                                    Width="800px">
                                                    <ItemTemplate>
                                                        <table ID="DADOS" cellpadding="2" cellspacing="2" width="750">
                                                            <tr>
                                                                <td valign="top" width="400">
                                                                    <asp:Label ID="nmempresaLabel" runat="server" CssClass="tituloProcessoSeletivo" 
                                                                        Text='<%# Eval("nmempresa") %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label27" runat="server" Text="CNPJ:"></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="cnpjLabel" runat="server" CssClass="textoNone" 
                                                                        Text='<%# Eval("cnpj") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td bgcolor="#F4F4F4" width="400">
                                                                    <asp:Label ID="Label32" runat="server" Text="Porte:"></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="dsPorteLabel" runat="server" CssClass="textoNone" 
                                                                        Text='<%# Eval("dsPorte") %>' />
                                                                </td>
                                                                <td bgcolor="#F4F4F4">
                                                                    <asp:Label ID="Label28" runat="server" Text="I.E.:"></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="ieLabel" runat="server" CssClass="textoNone" 
                                                                        Text='<%# Eval("ie") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="400">
                                                                    <asp:Label ID="Label33" runat="server" Text="Tempo de existência:"></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="tempoexistenciaLabel" runat="server" CssClass="textoNone" 
                                                                        Text='<%# Eval("tempoexistencia") %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label29" runat="server" Text="Área de atuação:"></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="dsAreaAtuacaoLabel" runat="server" CssClass="textoNone" 
                                                                        Text='<%# Eval("dsAreaAtuacao") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td bgcolor="#F4F4F4" width="400">
                                                                    <asp:Label ID="Label31" runat="server" 
                                                                        Text="Nome do responsável pelo cadastramento:"></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="nomeResLabel" runat="server" CssClass="textoNone" 
                                                                        Text='<%# Eval("nomeRes") %>' />
                                                                    <br />
                                                                    <asp:Label ID="emailResLabel" runat="server" CssClass="textoNone" 
                                                                        Text='<%# Eval("emailRes") %>' />
                                                                    <br />
                                                                    <asp:Label ID="siteLabel" runat="server" CssClass="textoNone" 
                                                                        Text='<%# Eval("site") %>' />
                                                                </td>
                                                                <td bgcolor="#F4F4F4">
                                                                    <asp:Label ID="Label30" runat="server" Text="Endereço:"></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="enderecoLabel" runat="server" CssClass="textoNone" 
                                                                        Text='<%# Eval("endereco") %>' />
                                                                    <br />
                                                                    <asp:Label ID="bairroLabel" runat="server" CssClass="textoNone" 
                                                                        Text='<%# Eval("bairro") %>' />
                                                                    &nbsp;<asp:Label ID="cidadeLabel" runat="server" CssClass="textoNone" 
                                                                        Text='<%# Eval("cidade") %>' />
                                                                    &nbsp;/
                                                                    <asp:Label ID="ufLabel" runat="server" CssClass="textoNone" 
                                                                        Text='<%# Eval("uf") %>' />
                                                                    &nbsp;-
                                                                    <asp:Label ID="cepLabel" runat="server" CssClass="textoNone" 
                                                                        Text='<%# Eval("cep") %>' />
                                                                    <br />
                                                                    <asp:Label ID="paisLabel" runat="server" CssClass="textoNone" 
                                                                        Text='<%# Eval("pais") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="400">
                                                                    &nbsp;</td>
                                                                <td>
                                                                    <asp:Label ID="Label34" runat="server" Text="Telefone:"></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="dddLabel" runat="server" CssClass="textoNone" 
                                                                        Text='<%# Eval("ddd") %>' />
                                                                    <asp:Label ID="telefoneLabel" runat="server" CssClass="textoNone" 
                                                                        Text='<%# Eval("telefone") %>' />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                        <br />
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </td>
                                        </tr>
                                    </table> 
                                
                                </div>
                                <h3><a href="#" onclick="javascript: f(7);">Suas Atribuições</a></h3>
                                <div>
                                    <asp:DataList ID="DataListATRIBUICAO" runat="server" DataKeyField="idVaga" 
                                        DataSourceID="SqlATRIBUICAO" Width="100%">
                                        <ItemTemplate>
                                            &nbsp;<asp:Label ID="idVagaLabel" runat="server" Text='<%# Eval("idVaga") %>' 
                                                Visible="False" />
                                            <asp:Label ID="idCadastroEmpresaLabel" runat="server" 
                                                Text='<%# Eval("idCadastroEmpresa") %>' Visible="False" />
                                            <asp:Label ID="idCadastroEmpresa_FilhaLabel" runat="server" 
                                                Text='<%# Eval("idCadastroEmpresa_Filha") %>' Visible="False" />
                                            <asp:Label ID="idRH_GestorLabel" runat="server" 
                                                Text='<%# Eval("idRH_Gestor") %>' Visible="False" />
                                            <asp:Label ID="flgFinalizadoLabel" runat="server" 
                                                Text='<%# Eval("flgFinalizado") %>' Visible="False" />
                                            <asp:Label ID="idSetupLabel" runat="server" Text='<%# Eval("idSetup") %>' 
                                                Visible="False" />
                                            <br />
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="nomeprocessoLabel" runat="server" 
                                                            CssClass="tituloProcessoSeletivo" Text='<%# Eval("dsfuncao") %>'></asp:Label>
                                                        <asp:Label ID="HifenLabel" runat="server" CssClass="tituloProcessoSeletivo" 
                                                            Text=" -"></asp:Label>
                                                        <asp:Label ID="ProtocoloDBLabel" runat="server" 
                                                            CssClass="tituloProcessoSeletivo" Text='<%# Eval("Protocolo") %>'></asp:Label>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table cellpadding="0" cellspacing="0" width="800px">
                                                            <tr>
                                                                <td align="center" valign="top" width="70px">
                                                                    <asp:ImageButton ID="ImageButtonVagaATRIBUICAO" runat="server" 
                                                                        CommandName="Select" ImageUrl="~/_corporativo/images/holomatica/EDITAR.png" 
                                                                        ToolTip="Clique aqui para atribuir esta vaga e processo seletivo para um outro Analista/Consultor" />
                                                                </td>
                                                                <td width="790px">
                                                                    <table ID="RES2" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td bgcolor="#EEEEEE" valign="top" width="140">
                                                                                <asp:Label ID="AberturaLabel" runat="server" CssClass="textoBold" 
                                                                                    Text="Data Abertura:"></asp:Label>
                                                                            </td>
                                                                            <td bgcolor="#EEEEEE">
                                                                                <asp:Label ID="data_iniLabel" runat="server" CssClass="textoProcessoSeletivo" 
                                                                                    Text='<%# Eval("data_ini", "{0:d}") %>' />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td valign="top" width="140">
                                                                                <asp:Label ID="EncerramentoLabel" runat="server" CssClass="textoBold" 
                                                                                    Text="Data Encerramento:"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="data_fimLabel" runat="server" CssClass="textoProcessoSeletivo" 
                                                                                    Text='<%# Eval("data_fim", "{0:d}") %>' />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td bgcolor="#EEEEEE" valign="top" width="140">
                                                                                <asp:Label ID="AnalistaResLabel" runat="server" CssClass="textoBold" 
                                                                                    Text="Analista Responsável:"></asp:Label>
                                                                            </td>
                                                                            <td bgcolor="#EEEEEE">
                                                                                <asp:Label ID="nomeResLabel" runat="server" CssClass="textoProcessoSeletivo" 
                                                                                    Text='<%# Eval("nome") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td valign="top" width="140">
                                                                                <asp:Label ID="Label35" runat="server" CssClass="textoBold" Text="Vaga:"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="ProtocoloLabel" runat="server" CssClass="textoProcessoSeletivo" 
                                                                                    Text='<%# Eval("Protocolo") %>' />
                                                                                &nbsp;<asp:Label ID="dsfuncaoLabel" runat="server" CssClass="textoProcessoSeletivo" 
                                                                                    Text='<%# Eval("dsfuncao") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td valign="top" width="140">
                                                                                &nbsp;</td>
                                                                            <td>
                                                                                <table cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                        <td>
                                                                                            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td valign="top" width="140">
                                                                                <asp:Label ID="Label36" runat="server" CssClass="textoBold" 
                                                                                    Text="Histórico da vaga:"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="HistoricoLabel" runat="server" Font-Names="Tahoma" 
                                                                                    Font-Size="9px" Text='<%# Eval("historico") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td valign="top" width="140">
                                                                                &nbsp;</td>
                                                                            <td>
                                                                                &nbsp;</td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" valign="top">
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div> 
        </div> 
                                <br />
                                <asp:SqlDataSource ID="SqlATRIBUICAO_LISTA" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_DISTRIBUICAO_ATRIBUICAO_CONSULTOR_ANALISTA_LISTA" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlATRIBUICAO" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_DISTRIBUICAO_ATRIBUICAO_CONSULTOR_ANALISTA" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                        <asp:SessionParameter DefaultValue="0" Name="idRH_Gestor" 
                                            SessionField="idRH_Gestor" Type="Int32" />
                                        <asp:Parameter DefaultValue="0" Name="idVaga" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlVAGASALVA" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_VAGA_SALVA" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                            Type="Int32" />
                                        <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" 
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlSALASVIRTUAISATIVAS" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_VIRTUAL_SALA_ATIVA_CHAT" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                            Type="Int32" />
                                        <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" 
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDEPARTAMENTO" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    DeleteCommand="_USP_LISTA_DEPARTAMENTO_CORPORATIVO" 
                                    InsertCommand="_USP_LISTA_DEPARTAMENTO_CORPORATIVO" 
                                    SelectCommand="_USP_LISTA_DEPARTAMENTO_CORPORATIVO" 
                                    
                                    UpdateCommand="_USP_LISTA_DEPARTAMENTO_CORPORATIVO" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
                                    <DeleteParameters>
                                        <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                            Type="Int32" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDEPARTAMENTOLISTA" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    DeleteCommand="_USP_LISTA_DEPARTAMENTO_CORPORATIVO" 
                                    InsertCommand="_USP_LISTA_DEPARTAMENTO_CORPORATIVO" 
                                    SelectCommand="_USP_LISTA_DEPARTAMENTO_CORPORATIVO" 
                                    
                                    UpdateCommand="_USP_LISTA_DEPARTAMENTO_CORPORATIVO" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
                                    <DeleteParameters>
                                        <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                            Type="Int32" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlOUTLOOK" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    
                                    SelectCommand="_USP_OUTLOOK_VAGA_SALVA_HISTORICO" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" 
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlOUTLOOK_FORM" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_OUTLOOK_VAGA_SALVA_HISTORICO_SELECT" 
                                    SelectCommandType="StoredProcedure" 
                                    UpdateCommand="_USP_OUTLOOK_VAGA_SALVA_HISTORICO_ENVIA" 
                                    UpdateCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idVagaAnuncio_PREVIEW_HistoricoLabel" Name="idVagaAnuncio_PREVIEW_Historico" PropertyName="Text" Type="Int32" />
                                        <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" Type="Int32" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="idVagaAnuncio_PREVIEW_Historico" Type="Int32" />
                                        <asp:Parameter Name="Protocolo" Type="String" />
                                        <asp:Parameter Name="idRH_Gestor" Type="Int32" />
                                        <asp:Parameter Name="enviaEmail" Type="Int32" />
                                        <asp:Parameter Name="nomeGESTOR" Type="String" />
                                        <asp:Parameter Name="emailGESTOR" Type="String" />
                                        <asp:Parameter Name="nomeANALISTA_CONSULTOR" Type="String" />
                                        <asp:Parameter Name="emailANALISTA_CONSULTOR" Type="String" />
                                        <asp:Parameter Name="SMS" Type="Int32" />
                                        <asp:Parameter Name="mensagemHistorico" Type="String" />
                                        <asp:Parameter Name="historico" Type="String" />
                                        <asp:Parameter Name="parecerAnalista_Consultor" Type="String" />
                                        <asp:Parameter Name="dataCriacao" Type="DateTime" />
                                        <asp:Parameter Name="protocoloVaga" Type="String" />
                                        <asp:Parameter Name="URL" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <br />
                    <asp:SqlDataSource ID="SqlPorte" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [idPorte], [dsPorte] FROM [tbPorteEmpresa]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlUF" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [uf], [dsuf] FROM [tbuf]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlPais" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [pais] FROM [tbpais]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlEmpresa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT idCadastroEmpresa, nmempresa, idCadastroEmpresa_Pai FROM tbCadastroEmpresa WHERE (idCadastroEmpresa_Pai = @idCadastroEmpresa_Pai) OR (idCadastroEmpresa = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa_Pai" 
                SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:SessionParameter Name="idCadastroEmpresa" 
                SessionField="idCadastroEmpresaFilha" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataTipoFormacao" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idTipoFormacao], [dsTipoFormacao] FROM [tbTipoFormacao]">
    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlAtividade" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
    SelectCommand="SELECT [idAreaAtuacao], [dsAreaAtuacao] FROM [tbAreaAtuacao]">
                    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlTipoVaga" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idTipoVaga], [idSetup], [dsTipoVAga] FROM [tbTipoVaga] WHERE ([idSetup] = @idSetup)">
        <SelectParameters>
            <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlListaPerfil" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="spPerfilVagaSelect_DataGrid" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
            <asp:ControlParameter ControlID="idCadastroEmpresaFilhaLabel" 
                Name="idCadastroEmpresa_Filha" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="idRH_GestorLabel" Name="idRH_Gestor" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlConsultor" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="uspGestorSelectDropDownList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="idRH_Gestor" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlConsultoresTodos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="uspGestorSelectDropDownList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
            <asp:Parameter DefaultValue="0" Name="idRH_Gestor" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDadosdaEMPRESA" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_PROCESSOSELETIVO_DADOSDAEMPRESA_PAI" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                            </td>
                        </tr>
                     </table>
                                <br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>


