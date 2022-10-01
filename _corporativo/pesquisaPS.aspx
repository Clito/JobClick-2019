<%@ Page Title="" Language="VB" MasterPageFile="~/_corporativo/corporativoPage.master" MaintainScrollPositionOnPostback="false" AutoEventWireup="false" CodeFile="pesquisaPS.aspx.vb" Inherits="_corporativo_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register assembly="DayPilot" namespace="DayPilot.Web.Ui" tagprefix="DayPilot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../scripts/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../scripts/jquery.autocomplete.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var idSetup = '<%=Session("idSetup")%>';
            var idRH_Gestor = '<%=Session("idRH_Gestor")%>';
            $("#<%=TextBoxPesquisaPS.ClientID%>").autocomplete("AutocompleteProcessoSeletivo.ashx?idSetup=" + idSetup + "&idRH_Gestor=" + idRH_Gestor, { autoFill: false });
        });
    </script>

    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>
    
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelCOMPRACV.ClientID%>").dialog
            ({ autoOpen: true, modal: true, closeText: '', width: '700', title: "Aviso", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
        });
	</script>

    <script type="text/javascript">
        $(function () {
            $("#<%=PanelENTREVISTAVIRTUAL.ClientID%>").dialog({ closeText: '', width: '700', title: "Entrevista Virtual", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelEXCLUICANDIDATURA.ClientID%>").dialog({ closeText: '', width: '700', title: "Candidatura não aprovada", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAVALIACAOENTREVISTAPRESENCIAL.ClientID%>").dialog({ closeText: '', width: '700', title: "Análise Entrevista Presencial", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
        });
	</script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelANALISE.ClientID%>").dialog({ closeText: '', width: '700', title: "Candidatura aprovada nesta fase", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>    
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAPROVACANDIDATURA.ClientID%>").dialog({ closeText: '', width: '700', title: "Candidatura aprovada", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelENTREVISTAPRESENCIAL.ClientID%>").dialog({ closeText: '', width: '700', title: "Entrevista Presencial", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelEMAIL.ClientID%>").dialog
            (
            {
                closeText: '', width: '700', title: "Fale com o candidato", position: "top", show:
                { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } 
            }
            );
        });
	</script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelCVCandidato.ClientID%>").dialog
            ({ closeText: '', width: '820', title: "Perfil do Candidato", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>
    
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelENCERRAFASE.ClientID%>").dialog
            ({ autoOpen: true, modal: true, closeText: '', width: '820', title: "Próxima fase", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>

    <script type="text/javascript">
        $(function () {
            $("#<%=PanelTESTE.ClientID%>").dialog
            ({ autoOpen: true, modal: true, closeText: '', width: '700', title: "Avaliação online", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>

    <script type="text/javascript">
        $(function () {
            $("#<%=PanelFILTRO.ClientID%>").dialog
            ({ autoOpen: true, modal: true, closeText: '', width: '820', title: "Filtro dinâmico", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>

    <script type="text/javascript">
        $(function () {
            $("#<%=PanelLAUDO.ClientID%>").dialog
            ({ autoOpen: true, modal: true, closeText: '', width: '820', title: "Laudo do Candidato", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
       
        });
	</script>
    <script type="text/javascript">
        $(function () {
            if ($("#<%=PanelCVCandidato.ClientID%>").length > 0) {
                $("body").css('min-height',($("#<%=PanelCVCandidato.ClientID%>").height() + 100));
            }
            if ($("#<%=PanelLAUDO.ClientID%>").length > 0) {
                $("body").css('min-height',($("#<%=PanelLAUDO.ClientID%>").height() + 100));
            }
            if ($("#<%=PanelAVALIACAOENTREVISTAPRESENCIAL.ClientID()%>").length > 0) {
                $("body").css('min-height', ($("#<%=PanelAVALIACAOENTREVISTAPRESENCIAL.ClientID%>").height() + 100));
            }
        });
	</script>
    <style type="text/css">
	    #demo-frame > div.demo { padding: 10px !important; }
	</style>
	<script type="text/javascript">
	    $(function () {
	        $("#slider-range-max").slider({
	            range: "max",
	            min: 1,
	            max: 10,
	            value: 6,
	            slide: function (event, ui) {
	                $("input[id*='inpHide']").val(ui.value);
	                $("#dentroPAINEL").val(ui.value); 
	            }
	        });
	        $("input[id*='inpHide']").val($("#slider-range-max").slider("value"));
	        $("#dentroPAINEL").val($("#slider-range-max").slider("value"));
	    });
	</script>

     <script type="text/javascript">
         function GetMensagem() {
             $("input[id$='inpHideTextArea']").val($("#<%=mensagemTextBox.ClientID%>").val()); 
         }
    </script>
        
	    <style type="text/css">
	    #TEMPOENTREVISTA-frame > div.TEMPOENTREVISTA { padding: 10px !important; };
	    </style>
	    <script type="text/javascript">
	        $(function () {
	            $("#ENTREVISTAslider").slider({                    
	                value: 30,
	                min: 15,
	                max: 55,
	                step: 5,                    
	                slide: function (event, ui) {
	                    $("#entrevista").val(ui.value + " minutos");
	                    $("input[id*='HorafimLabel']").val(ui.value);
	                }
	            });
	            $("#entrevista").val($("#ENTREVISTAslider").slider("value") + " minutos");
	            $("input[id*='HorafimLabel']").val($("#slider-range-max").slider("value"));
	        });
	    </script>


	    <style type="text/css">
	        #TEMPOENTREVISTA0-frame div.TEMPOENTREVISTA0 { padding: 10px !important; }
	    </style>
	    <script type="text/javascript">
	        $(function () {
	            $("#ENTREVISTAslider0").slider({
	                value: 30,
	                min: 15,
	                max: 55,
	                step: 5,
	                slide: function (event, ui) {
	                    $("#entrevista0").val(ui.value + " minutos");
	                    $("input[id*='HorafimLabel']").val(ui.value);
	                }
	            });
	            $("#entrevista0").val($("#ENTREVISTAslider0").slider("value") + " minutos");
	            $("input[id*='HorafimLabel']").val($("#slider-range-max").slider("value"));
	        });
	    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
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
                <asp:Panel ID="PanelCOMPRACV" runat="server" Visible="False">
                    <table id="TableCOMPRACV" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center" valign="top">
                                <asp:Image ID="ImageCOMPRACV" runat="server" 
                                    ImageUrl="~/_corporativo/images/buttonOK.png" />
                            </td>
                            <td align="center">
                                <asp:Label ID="LabelCOMPRACV" runat="server" 
                                    CssClass="textoApresentaINFOCV"></asp:Label>
                                <br />
                                <br />
                                <br />
                                <asp:LinkButton ID="LinkButtonCOMPRACV" runat="server" CssClass="button">Quero utilizar 1 (um) crédito</asp:LinkButton>
                                <br />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
        <table cellpadding="0" cellspacing="0" align="center" width="100%">
            <tr>
                <td>
                    <br />
                                <asp:ValidationSummary ID="ValidationSummaryPPS" runat="server" 
                                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="PESQUISA" />
                    <br />
                    <table cellpadding="0" cellspacing="0" id="BodyInterno" width="900px" 
                        align="center">
                        <tr>
                            <td align="left">
                                <input id="inpHide" type="hidden" runat="server" style="border:0; color:#f6931f; font-weight:bold;" />
                                <asp:Label ID="RESULTADO" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="TipoPesquisaLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="PANELLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idFaseProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="minAderenciaLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="nomeCandidatoLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="dataLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="TEXTOPESQUISALabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="AderenciaLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idCurriculoLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="NivelAprovacaoLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idEntrevistaPresencialLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="HorainiLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="textareaMENSAGEMLabel" runat="server" Visible="False"></asp:Label>
                                <input id="inpHideTextArea" type="hidden" runat="server" />
                                <asp:Label ID="idEntrevistavirtualLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idFiltroDinamicoXML_LiberadoLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="refTabelaNivelLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="refTabelaLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="flgEncerradoPSLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="habilitaLaudoLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idLaudoLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="moduloLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idTipoFaseProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="StatusFaseLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="nomeConsultorLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="CVliberado" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="candidatoPagaLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="liberaQtdCadLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idsetupLabel" runat="server" Visible="False"></asp:Label>
                                <br />
                                <asp:Image ID="ImageLinha0" runat="server" 
                                    ImageUrl="~/_corporativo/images/holomatica/linha.png" />
                                <br />
                                <asp:Label ID="LabelPesquisadosProcessosSeletivos" runat="server" CssClass="h1" 
                                    Text="Pesquisa dos Processos Seletivos"></asp:Label>
                                <br />
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                <asp:TextBox ID="TextBoxPesquisaPS" runat="server" 
                                    CssClass="InputCadFormCandidatoCV" ValidationGroup="PESQUISA" 
                                    ToolTip="Informe o nome ou o número do Processo Seletivo" Width="450px"></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="TextBoxPesquisaPS_TextBoxWatermarkExtender" 
                                                runat="server" Enabled="True" TargetControlID="TextBoxPesquisaPS" 
                                                WatermarkText="Nome ou protocolo do Processo Seletivo">
                                            </asp:TextBoxWatermarkExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TextBoxPesquisaPS" CssClass="msnERROR" 
                                    ErrorMessage="Informe parte do nome ou o número do Processo Seletivo" 
                                    SetFocusOnError="True" ValidationGroup="PESQUISA">•</asp:RequiredFieldValidator>
                                        </td>
                                        <td>&nbsp;&nbsp;
                                            <asp:DropDownList ID="DropDownListFase" runat="server" 
                                                CssClass="DropCadFormCandidatoCV" DataSourceID="SqlFase" DataTextField="dsFase" 
                                                DataValueField="idTipoFaseProcessoSeletivo" Width="380px" 
                                                AppendDataBoundItems="True">
                                                <asp:ListItem Value="0">Todas fases</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                                <asp:RadioButtonList ID="RadioButtonListatus" runat="server" CellPadding="0" 
                                    CellSpacing="0" CssClass="RadioButtonListPS" RepeatDirection="Horizontal" 
                                    Width="300px">
                                    <asp:ListItem Value="0">Abertos</asp:ListItem>
                                    <asp:ListItem Value="1">Fechados</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="2">Ambos</asp:ListItem>
                                </asp:RadioButtonList>
                                <br />
                                <asp:LinkButton ID="LinkButtonPS" runat="server" CssClass="button" 
                                    ToolTip="Clique para iniciar a pesquisa por aderência" ValidationGroup="PESQUISA" 
                                    CausesValidation="False">Pesquisar nos Processos Seletivos</asp:LinkButton>
                                <asp:LinkButton ID="LinkButtonLIMPAR" runat="server" CssClass="button" 
                                    ToolTip="Clique aqui para limpar pesquisa">Limpar</asp:LinkButton>
                                <br />
                                <br />
                                <br />
                                <asp:Panel ID="PanelTesteFORM" runat="server" Visible="false">
                                <table id="FORMAVALIACAOT" cellpadding="2" cellspacing="2" width="100%" 
                                        bgcolor="#FFFFF2">
                                    <tr>
                                        <td>
                                        
                                            <asp:Label ID="LabelAVALIACOES" runat="server" CssClass="h1" 
                                                Text="Avaliações disponíveis"></asp:Label>
                                            <br />
                                            <asp:Label ID="LabelAVALIACAOFORM" runat="server" CssClass="textoApresentaCV"></asp:Label>
                                            <br />
                                            <asp:GridView ID="GridViewAVALIACAO" runat="server" AutoGenerateColumns="False" 
                                                BorderStyle="None" 
                                                DataKeyNames="idQuiz,idCadastroEmpresa,idSetup,nomeQuiz" DataSourceID="SqlAVALIACAODISPONIVEL" 
                                                GridLines="Horizontal" Width="100%">
                                                <AlternatingRowStyle BackColor="#F0F0F0" />
                                                <Columns>
                                                    <asp:BoundField DataField="idQuiz" HeaderText="idQuiz" InsertVisible="False" 
                                                        ReadOnly="True" SortExpression="idQuiz" Visible="False" />
                                                    <asp:BoundField DataField="idSetup" HeaderText="idSetup" 
                                                        SortExpression="idSetup" Visible="False" />
                                                    <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                                        SortExpression="idCadastroEmpresa" Visible="False" />
                                                    <asp:TemplateField HeaderText="Escolha abaixo uma avaliação" ShowHeader="False">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                                CommandName="Select" Text='<%# Eval("nomeQuiz") %>' 
                                                                ToolTip='<%# Eval("nomeQuiz") %>'></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="nomeQuiz" HeaderText="Avaliação" 
                                                        SortExpression="nomeQuiz" Visible="False">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="publicar" HeaderText="publicar" 
                                                        SortExpression="publicar" Visible="False" />
                                                    <asp:BoundField DataField="nivel" HeaderText="Nível" SortExpression="nivel">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="pontos" HeaderText="Meta" SortExpression="pontos" 
                                                        Visible="False" />
                                                </Columns>
                                            </asp:GridView>
                                        
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <br />
                                            <asp:LinkButton ID="LinkButtonTESTE" runat="server" CssClass="button" 
                                                ToolTip="Clique aqui para cancelar a convocação de avaliação">Cancelar convocação</asp:LinkButton>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                                    <br />
                                </asp:Panel>
                                <asp:Panel ID="PanelLAUDOFORM" runat="server" BackColor="WhiteSmoke" 
                                    Visible="False">
                                    <br />
                                    <table ID="TableLAUDO" align="center" bgcolor="#FFFFF9" cellpadding="5" cellspacing="5" width="700">
                                        <tr>
                                            <td align="left">
                                                <table ID="FORMLAUDO" cellpadding="2" cellspacing="2">
                                                    <tr>
                                                        <td align="right" valign="top">
                                                            &nbsp;</td>
                                                        <td align="right">
                                                            <asp:LinkButton ID="UpdateButton0" runat="server" CausesValidation="True" 
                                                                CssClass="button" Text="Salvar" 
                                                                ToolTip="Clique aqui para salvar as alterações" />
                                                            <asp:LinkButton ID="LinkButtonLaudo0" runat="server" CausesValidation="False" 
                                                                CssClass="button" ToolTip="Clique aqui para ver o laudo">Laudo</asp:LinkButton>
                                                            <asp:LinkButton ID="LinkButtonFECHARFORMLAUDO0" runat="server" 
                                                                CausesValidation="False" CssClass="button" 
                                                                onclick="LinkButtonFECHARFORMLAUDO_Click">Fechar</asp:LinkButton>
                                                            <asp:LinkButton ID="DOWNLOAD" runat="server" CssClass="button" 
                                                                ToolTip="Clique aqui para gerar arquivo Word">Word</asp:LinkButton>
                                                            <asp:LinkButton ID="PDF" runat="server" CausesValidation="False" 
                                                                CssClass="button" ToolTip="Clique aqui para gerar arquivo PDF">PDF</asp:LinkButton>
                                                            <br />
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top">
                                                            <asp:Label ID="Label16" runat="server" Text="Trajetória Profissional:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="trajetoriaProfissionalTextBox0" runat="server" 
                                                                CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                Text='<%# Bind("trajetoriaProfissional") %>' TextMode="MultiLine" 
                                                                Width="500px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top">
                                                            <asp:Label ID="Label17" runat="server" Text="Conhecimentos:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="conhecimentoTextBox0" runat="server" 
                                                                CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                Text='<%# Bind("conhecimento") %>' TextMode="MultiLine" Width="500px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top">
                                                            <asp:Label ID="Label18" runat="server" Text="Último Salário:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="ultimoSalarioTextBox0" runat="server" 
                                                                CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                Text='<%# Bind("ultimoSalario") %>' TextMode="MultiLine" Width="500px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top">
                                                            <br />
                                                            <asp:Label ID="Label19" runat="server" Font-Bold="True" Text="Características"></asp:Label>
                                                        </td>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top">
                                                            <br />
                                                            <asp:Label ID="Label20" runat="server" Text="Familiar:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="caracteristicaPessoal_FamiliarTextBox0" runat="server" 
                                                                CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                Text='<%# Bind("caracteristicaPessoal_Familiar") %>' TextMode="MultiLine" 
                                                                Width="500px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top">
                                                            <asp:Label ID="Label21" runat="server" Text="Social:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="caracteristicaPessoal_SocialTextBox0" runat="server" 
                                                                CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                Text='<%# Bind("caracteristicaPessoal_Social") %>' TextMode="MultiLine" 
                                                                Width="500px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top">
                                                            <asp:Label ID="Label22" runat="server" Text="Atitudinais:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="caracteristicaPessoal_AtitudinaisTextBox0" runat="server" 
                                                                CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                Text='<%# Bind("caracteristicaPessoal_Atitudinais") %>' TextMode="MultiLine" 
                                                                Width="500px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top">
                                                            <asp:Label ID="Label23" runat="server" Text="Habilidade:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="caracteristicaPessoal_HabilidadeTextBox0" runat="server" 
                                                                CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                Text='<%# Bind("caracteristicaPessoal_Habilidade") %>' TextMode="MultiLine" 
                                                                Width="500px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top">
                                                            <asp:Label ID="Label24" runat="server" Text="Motivação:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="caracteristicaPessoal_MotivacaoTextBox0" runat="server" 
                                                                CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                Text='<%# Bind("caracteristicaPessoal_Motivacao") %>' TextMode="MultiLine" 
                                                                Width="500px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top">
                                                            <asp:Label ID="Label25" runat="server" Text="Pontos fortes:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="pontoforteTextBox0" runat="server" 
                                                                CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                Text='<%# Bind("pontoforte") %>' TextMode="MultiLine" Width="500px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top">
                                                            <asp:Label ID="Label26" runat="server" Text="Observar e desenvolver:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="pontoaObservarDesenvolverTextBox0" runat="server" 
                                                                CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                Text='<%# Bind("pontoaObservarDesenvolver") %>' TextMode="MultiLine" 
                                                                Width="500px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top">
                                                            &nbsp;</td>
                                                        <td align="right">
                                                            <br />
                                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                                CssClass="button" Text="Salvar" 
                                                                ToolTip="Clique aqui para salvar as alterações" />
                                                            <asp:LinkButton ID="LinkButtonLaudo" runat="server" CausesValidation="False" 
                                                                CssClass="button" ToolTip="Clique aqui para ver o laudo">Laudo</asp:LinkButton>
                                                            <asp:LinkButton ID="LinkButtonFECHARFORMLAUDO" runat="server" 
                                                                CausesValidation="False" CssClass="button" 
                                                                onclick="LinkButtonFECHARFORMLAUDO_Click">Fechar</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table> 
                                    <br />
                                </asp:Panel>
                                <asp:Panel ID="PanelFILTRODINAMICO" runat="server" BackColor="WhiteSmoke" 
                                    Visible="False">
                                    <br />
                                    <table ID="FILTRODINAMICO" align="center" bgcolor="#FFFFF9" cellpadding="5" 
                                        cellspacing="5" width="700">
                                        <tr>
                                            <td>
                                                <asp:GridView ID="GridViewFILTRO" runat="server" AutoGenerateColumns="False" 
                                                    DataKeyNames="idFiltroDinamicoXML_Liberado,idFiltroDinamicoMontador_Consultor_Analista" 
                                                    DataSourceID="SqlFiltrosAplicadosNaFase" BorderStyle="None" 
                                                    GridLines="Horizontal" Width="100%" CssClass="textoNone">
                                                    <AlternatingRowStyle BackColor="#F3F3F3" />
                                                    <Columns>
                                                        <asp:BoundField DataField="idFiltroDinamicoXML_Liberado" 
                                                            HeaderText="idFiltroDinamicoXML_Liberado" InsertVisible="False" ReadOnly="True" 
                                                            SortExpression="idFiltroDinamicoXML_Liberado" Visible="False" />
                                                        <asp:BoundField DataField="idSetup" HeaderText="idSetup" 
                                                            SortExpression="idSetup" Visible="False" />
                                                        <asp:BoundField DataField="dsFiltroDinamico" HeaderText="Filtro" 
                                                            SortExpression="dsFiltroDinamico" />
                                                        <asp:BoundField DataField="refTabela" HeaderText="refTabela" 
                                                            SortExpression="refTabela" Visible="False" />
                                                        <asp:BoundField DataField="dataPublicacao" HeaderText="dataPublicacao" 
                                                            SortExpression="dataPublicacao" Visible="False" />
                                                        <asp:BoundField DataField="idFiltroDinamicoMontador_Consultor_Analista" 
                                                            HeaderText="idFiltroDinamicoMontador_Consultor_Analista" ReadOnly="True" 
                                                            SortExpression="idFiltroDinamicoMontador_Consultor_Analista" 
                                                            Visible="False" />
                                                        <asp:BoundField DataField="idProcessoSeletivo" HeaderText="idProcessoSeletivo" 
                                                            SortExpression="idProcessoSeletivo" Visible="False" />
                                                        <asp:BoundField DataField="field" HeaderText="field" SortExpression="field" 
                                                            Visible="False" />
                                                        <asp:BoundField DataField="value" HeaderText="O que pesquisar?" 
                                                            SortExpression="value" />
                                                        <asp:BoundField DataField="nivel" HeaderText="Qual nível? (Se necessário)" 
                                                            SortExpression="nivel" NullDisplayText="-" />
                                                        <asp:ButtonField CommandName="Select" Text="Excluir" />
                                                    </Columns>
                                                </asp:GridView>
                                                <br />
                                                <br />
                                                <asp:Label ID="Label13" runat="server" Text="Selecione o filtro:"></asp:Label>
                                                <br />
                                                <asp:GridView ID="FILTROS" runat="server" AllowPaging="True" 
                                                    AutoGenerateColumns="False" BorderStyle="None" 
                                                    
                                                    DataKeyNames="idFiltroDinamicoXML_Liberado,tabela,modelo,panel,refTabela,tabelaNivel,refTabelaNivel" DataSourceID="SqlFiltrosLiberados" 
                                                    GridLines="Horizontal" Width="100%" CssClass="textoNone">
                                                    <AlternatingRowStyle BackColor="#F8F8F8" />
                                                    <Columns>
                                                        <asp:BoundField DataField="idFiltroDinamicoXML_Liberado" 
                                                            HeaderText="idFiltroDinamicoXML_Liberado" InsertVisible="False" ReadOnly="True" 
                                                            SortExpression="idFiltroDinamicoXML_Liberado" Visible="False" />
                                                        <asp:BoundField DataField="idSetup" HeaderText="idSetup" 
                                                            SortExpression="idSetup" Visible="False" />
                                                        <asp:ButtonField CommandName="Select" DataTextField="dsFiltroDinamico" 
                                                            HeaderText="Filtros" Text="Button" />
                                                        <asp:BoundField DataField="dsFiltroDinamico" HeaderText="Filtros" 
                                                            SortExpression="dsFiltroDinamico" Visible="False" />
                                                        <asp:BoundField DataField="refTabela" HeaderText="refTabela" 
                                                            SortExpression="refTabela" Visible="False" />
                                                        <asp:BoundField DataField="dataPublicacao" HeaderText="dataPublicacao" 
                                                            SortExpression="dataPublicacao" Visible="False" />
                                                        <asp:BoundField DataField="tabela" HeaderText="tabela" SortExpression="tabela" 
                                                            Visible="False" />
                                                    </Columns>
                                                </asp:GridView>
                                                <br />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Panel ID="PanelCDB_SN" runat="server" Visible="False">
                                    <table id="CDB_SN" align="center" bgcolor="#FFFFF9" cellpadding="5" cellspacing="5" width="700">      
                                        <tr>
                                            <td width="350">
                                                <asp:Label ID="Labelini1" runat="server" Text="Informe o que pesquisar:"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="DropDownList_CDB_SN" runat="server" 
                                                    CssClass="DropCadFormCandidatoCV" Width="325px">
                                                </asp:DropDownList>
                                            </td>
                                            <td width="350"></td>
                                        </tr>
                                    </table>                                    
                                    </asp:Panel>
                                    <asp:Panel ID="PanelCDB_CN" runat="server" Visible="False">
                                    <table id="CDB_CN" align="center" bgcolor="#FFFFF9" cellpadding="5" cellspacing="5" width="700">      
                                        <tr>
                                            <td width="350">
                                                <asp:Label ID="Labelini2" runat="server" Text="Informe o que pesquisar:"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="DropDownList_CDB_CN" runat="server" 
                                                    CssClass="DropCadFormCandidatoCV" Width="325px">
                                                </asp:DropDownList>
                                            </td>
                                            <td width="350">
                                                <asp:Label ID="Label15" runat="server" Text="Informe o nível se aplicado:"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="DropDownList_CN" runat="server" 
                                                    CssClass="DropCadFormCandidatoCV" Width="325px">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>                                                                        
                                    </asp:Panel>
                                    <asp:Panel ID="PanelSDB_SN" runat="server" Visible="False">
                                    <table id="SDB_SN" align="center" bgcolor="#FFFFF9" cellpadding="5" cellspacing="5" width="700">      
                                        <tr>
                                            <td width="350">
                                                <asp:Label ID="Labelini3" runat="server" 
                                                    Text="Informe o que pesquisar: (Texto livre)"></asp:Label>
                                                &nbsp;<br />
                                                <asp:TextBox ID="TextBoxValue" runat="server" 
                                                    CssClass="InputCadFormCandidatoCV" Width="320px"></asp:TextBox>
                                            </td>
                                            <td width="350"></td>
                                        </tr>
                                    </table>                                     
                                    </asp:Panel>
                                    <table id="TableBUTTONS" align="center" bgcolor="#FFFFF9" cellpadding="5" cellspacing="5" width="700">      
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="LinkButtonFILTRO" runat="server" CssClass="button" 
                                                    onclientclick="GetMensagem();" ValidationGroup="MENSAGEMCANDIDATO">Enviar filtro dinâmico</asp:LinkButton>
                                                <asp:LinkButton ID="LinkButtonFILTROCANCELAR" runat="server" 
                                                    CausesValidation="False" CssClass="button">Fechar</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                </asp:Panel>
                                <asp:Panel ID="PanelENCERRAFASEFORM" runat="server" BackColor="WhiteSmoke" 
                                    Visible="False">
                                    <br />
                                    <table ID="PROXIMAFASE" bgcolor="#FFFFF9" cellpadding="5" cellspacing="5" 
                                                    width="700" align="center">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label5" runat="server" Text="Selecione a próxima fase:"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="DropDownListPROXIMAFASE" runat="server" 
                                                                CssClass="DropCadFormCandidatoCV" DataSourceID="SqlFaseENCERRAMENTO" 
                                                                DataTextField="dsFase" DataValueField="idTipoFaseProcessoSeletivo" 
                                                                Width="100%">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td width="50%">
                                                            <asp:Label ID="Labelini" runat="server" Text="Data do início desta fase:"></asp:Label>
                                                        </td>
                                                        <td width="50%">
                                                            <asp:Label ID="Label7" runat="server" 
                                                                Text="Data prevista para encerramento desta fase:"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="50%">
                                                            <asp:TextBox ID="iniFASETextBox" runat="server" 
                                                                            CssClass="InputCadFormCandidatoCV" Width="98%"></asp:TextBox>
                                                            <asp:CalendarExtender ID="iniFASETextBox_CalendarExtender" runat="server" 
                                                                Enabled="True" TargetControlID="iniFASETextBox">
                                                            </asp:CalendarExtender>
                                                        </td>
                                                        <td width="50%">
                                                            <asp:TextBox ID="fimFASETextBox" runat="server" 
                                                                            CssClass="InputCadFormCandidatoCV" Width="98%"></asp:TextBox>
                                                            <asp:CalendarExtender ID="fimFASETextBox_CalendarExtender" runat="server" 
                                                                Enabled="True" TargetControlID="fimFASETextBox">
                                                            </asp:CalendarExtender>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label9" runat="server" 
                                                                
                                                                
                                                    
                                                    Text="Apenas para os casos de encerramento do processo seletivo, escreva a mensagem para todos os aprovados no processo:"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="strMessageAprovadoEncerradoTextBox" runat="server" 
                                                                CssClass="InputCadFormCandidatoCV" Height="80px" TextMode="MultiLine" 
                                                                Width="100%"></asp:TextBox>
                                                <br />
                                                <br />
                                                <asp:LinkButton ID="LinkButtonENCERRAFASE" runat="server" CssClass="button" 
                                                                ValidationGroup="MENSAGEMCANDIDATO" 
                                                    onclientclick="GetMensagem();">Salvar nova fase</asp:LinkButton>
                                                <asp:LinkButton ID="LinkButtonCANCELAR2" runat="server" CssClass="button" 
                                                                CausesValidation="False">Cancelar</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                </asp:Panel>
                                <asp:Panel ID="PanelENTREVISTAPRESENCIALFORM" runat="server" 
                                    BackColor="WhiteSmoke" Visible="False">
                                    <br />
                                    <br />
                                    <br />
                                    <table ID="ENTREVISTA_FORM" align="center" cellpadding="0" cellspacing="0" width="700px">
                                        <tr>
                                            <td>
                                                <asp:Panel ID="PanelENTREVISTA_FORM" runat="server" Visible="False">
                                                    <table ID="FORM_ENTREVISTAPRESENCIAL" cellpadding="0" cellspacing="0" width="700px">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="DescricaoEntrevistaLabel" runat="server" CssClass="textoProcessoSeletivo"></asp:Label>
                                                                <input type="text" id="entrevista" style="background:#F5F5F5; border:0; color:#f6931f; font-weight:bold;" />
                                                                <br />
                                                                <asp:Label ID="mensagemEntrevistaEmailLabel" runat="server" Visible="False"></asp:Label>
                                                                <asp:Label ID="HistoricoLabel" runat="server" CssClass="textoProcessoSeletivo"></asp:Label>
                                                                <br />
                                                                <asp:Label ID="LabelSobreaEntrevista" runat="server" 
                                                                    Text="Informe ao candidato detalhes sobre a entrevista:"></asp:Label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                                    ControlToValidate="HistoricoDasMensagensTextBox" 
                                                                    ErrorMessage="Informe ao candidato detalhe a respeito da entrevista" 
                                                                    ValidationGroup="ENTREVISTA">•</asp:RequiredFieldValidator>
                                                                <input id="HorafimLabel" type="hidden" runat="server" style="background:#F5F5F5; border: 0px;" value="30" size="3" class="textoProcessoSeletivo" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="HistoricoDasMensagensTextBox" runat="server" 
                                                                    CssClass="InputCadFormCandidatoCV" Height="90px" TextMode="MultiLine" 
                                                                    ValidationGroup="ENTREVISTA" Width="100%"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:ValidationSummary ID="ValidationSummaryENTREVISTA" runat="server" 
                                                                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="ENTREVISTA" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>

                                                                    <div class="TEMPOENTREVISTA">

                                                                    <p>
	                                                                    <label for="entrevista"><b>Duração da entrevista (Incrementos de 5 minutos)</b>:</label>
	                                                                    &nbsp;
                                                                    </p>

                                                                    <div id="ENTREVISTAslider"></div>

                                                                    </div>                                                            
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <br />
                                                                <asp:LinkButton ID="LinkButtonAgendar" runat="server" CssClass="button" 
                                                                    ToolTip="Lembre-se que o candidato deverá aceitar este agendamento." 
                                                                    ValidationGroup="ENTREVISTA">Agendar</asp:LinkButton>
                                                                <asp:LinkButton ID="FecharFORM" runat="server" CausesValidation="False" 
                                                                    CssClass="button" ToolTip="Clique aqui para fechar a agenda">Fechar</asp:LinkButton>
                                                                <asp:LinkButton ID="LinkButtonLimparFORM" runat="server" CssClass="button" 
                                                                    ToolTip="Clique aqui para limpar a auto resposta">Limpar</asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <br />
                                            </td>
                                        </tr>
                                    </table> 
                                    <br />
                                    <br />
                                    <table ID="ENTREVISTA" align="center" cellpadding="0" cellspacing="0" width="700px">
                                        <tr>
                                            <td valign="top" align="left">
                                                &nbsp;</td>
                                            <td valign="top" width="20">
                                                &nbsp;</td>
                                            <td valign="top" align="left">
                                                <asp:GridView ID="GridViewCANDIDATO" runat="server" AutoGenerateColumns="False" 
                                                    BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px" 
                                                    DataKeyNames="DataStartField,idcurriculo,idProcessoSeletivo,idFaseProcessoSeletivo" 
                                                    DataSourceID="SqlCANDIDATOSAGENDA" GridLines="Horizontal" Width="100%">
                                                    <Columns>
                                                        <asp:ButtonField CommandName="Select" DataTextField="nome" 
                                                            HeaderText="Candidatos selecionados para entrevista" Text="Button">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        </asp:ButtonField>
                                                        <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" 
                                                            Visible="False" />
                                                        <asp:BoundField DataField="DataStartField" HeaderText="Data e hora" 
                                                            SortExpression="DataStartField">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="idProcessoSeletivo" HeaderText="idProcessoSeletivo" 
                                                            SortExpression="idProcessoSeletivo" Visible="False" />
                                                        <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" 
                                                            InsertVisible="False" ReadOnly="True" SortExpression="idcurriculo" 
                                                            Visible="False" />
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <asp:Calendar ID="CalendarSET" runat="server" BackColor="White" 
                                                    BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                                                    Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" 
                                                    Width="200px">
                                                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                                    <NextPrevStyle VerticalAlign="Bottom" />
                                                    <OtherMonthDayStyle ForeColor="#808080" />
                                                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                                    <SelectorStyle BackColor="#CCCCCC" />
                                                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                                </asp:Calendar>
                                            </td>
                                            <td valign="top" width="20">
                                                &nbsp;</td>
                                            <td align="left" valign="top">
                                                <DayPilot:DayPilotCalendar ID="DayPilotCalendarENTREVISTAPRESENCIAL" 
                                                    runat="server" BackColor="#FFFFD5" BorderColor="#000000" ColumnMarginRight="1" 
                                                    DataEndField="DataEndField" DataSourceID="SqlViewAGENDA" 
                                                    DataStartField="DataStartField" DataTextField="TEXTOAPRESENTA" 
                                                    DataValueField="idEntrevistaPresencial" DayFontFamily="Tahoma" 
                                                    DayFontSize="10pt" DurationBarColor="Blue" EventBackColor="#FFFFFF" 
                                                    EventBorderColor="#000000" 
                                                    EventClickJavaScript="alert('Para agendar uma nova entrevista selecione uma data em aberto.\nPara utilizar o formulário de entrevista presencial ou fazer alterações de datas e horários clique no link [Agenda] em seguida selecione [Compromissos Presenciais]');" 
                                                    EventFontFamily="Tahoma" EventFontSize="8pt" EventHoverColor="#DCDCDC" 
                                                    FreetimeClickHandling="PostBack" HeaderHeight="30" HourBorderColor="#EAD098" 
                                                    HourFontFamily="Tahoma" HourFontSize="16pt" HourHalfBorderColor="#F3E4B1" 
                                                    HourNameBackColor="#ECE9D8" HourNameBorderColor="#ACA899" HoverColor="#FFED95" 
                                                    NonBusinessBackColor="#FFF4BC" StartDate="" TimeFormat="Clock24Hours" 
                                                    BusinessBeginsHour="7" BusinessEndsHour="23" />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                &nbsp;</td>
                                            <td valign="top" width="20">
                                                &nbsp;</td>
                                            <td align="right" valign="top">
                                                <asp:LinkButton ID="LinkButtonCancelarEntrevista" runat="server" 
                                                    CssClass="button" ToolTip="Clique aqui para cancelar" 
                                                    CausesValidation="False">Fechar</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />
                                </asp:Panel>
                                <asp:Panel ID="PanelENTREVISTAVIRTUALFORM" runat="server" 
                                    BackColor="WhiteSmoke" Visible="False">
                                    <br />
                                    <br />
                                    <br />
                                    <table ID="ENTREVISTA_FORM0" align="center" cellpadding="0" cellspacing="0" 
                                        width="700px">
                                        <tr>
                                            <td>
                                                <asp:Panel ID="PanelENTREVISTA_FORM0" runat="server" Visible="False">
                                                    <table ID="FORM_ENTREVISTAPRESENCIAL0" cellpadding="0" cellspacing="0" 
                                                        width="700px">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="DescricaoEntrevistaLabel0" runat="server" 
                                                                    CssClass="textoProcessoSeletivo"></asp:Label>
                                                                <input type="text" id="entrevista0" style="background:#F5F5F5; border:0; color:#f6931f; font-weight:bold;" />
                                                                <br />
                                                                <asp:Label ID="mensagemEntrevistaEmailLabel0" runat="server" Visible="False"></asp:Label>
                                                                <asp:Label ID="HistoricoLabel0" runat="server" CssClass="textoProcessoSeletivo"></asp:Label>
                                                                <br />
                                                                <asp:Label ID="LabelSobreaEntrevista0" runat="server" 
                                                                    Text="Informe ao candidato detalhes sobre a entrevista:"></asp:Label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                                    ControlToValidate="HistoricoDasMensagensTextBox" 
                                                                    ErrorMessage="Informe ao candidato detalhe a respeito da entrevista" 
                                                                    ValidationGroup="ENTREVISTA">•</asp:RequiredFieldValidator>
                                                                <input id="HorafimLabel0" type="hidden" runat="server" style="background:#F5F5F5; border: 0px;" value="30" size="3" class="textoProcessoSeletivo" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="HistoricoDasMensagensTextBox0" runat="server" 
                                                                    CssClass="InputCadFormCandidatoCV" Height="90px" TextMode="MultiLine" 
                                                                    ValidationGroup="ENTREVISTA" Width="100%"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:ValidationSummary ID="ValidationSummaryENTREVISTA0" runat="server" 
                                                                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="ENTREVISTA" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>

                                                                    <div class="TEMPOENTREVISTA0">

                                                                    <p>
	                                                                    <label for="entrevista0"><b>Duração da entrevista virtual (Incrementos de 5 
                                                                        minutos)</b>:</label>
	                                                                    &nbsp;
                                                                    </p>

                                                                    <div id="ENTREVISTAslider0"></div>

                                                                    </div>                                                            
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <br />
                                                                <asp:LinkButton ID="LinkButtonAgendar0" runat="server" CssClass="button" 
                                                                    ToolTip="Lembre-se que o candidato deverá aceitar este agendamento." 
                                                                    ValidationGroup="ENTREVISTA">Agendar</asp:LinkButton>
                                                                <asp:LinkButton ID="FecharFORM0" runat="server" CausesValidation="False" 
                                                                    CssClass="button" ToolTip="Clique aqui para fechar a agenda">Fechar</asp:LinkButton>
                                                                <asp:LinkButton ID="LinkButtonLimparFORM0" runat="server" CssClass="button" 
                                                                    ToolTip="Clique aqui para limpar a auto resposta">Limpar</asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <br />
                                            </td>
                                        </tr>
                                    </table> 
                                    <br />
                                    <br />
                                    <table ID="ENTREVISTAVIRTUAL" align="center" cellpadding="0" cellspacing="0" 
                                        width="700px">
                                        <tr>
                                            <td valign="top" align="left">
                                                &nbsp;</td>
                                            <td valign="top" width="20">
                                                &nbsp;</td>
                                            <td valign="top" align="left">
                                                <asp:GridView ID="GridViewCANDIDATOVIRTUAL" runat="server" AutoGenerateColumns="False" 
                                                    BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px" 
                                                    DataKeyNames="DataStartField,idcurriculo,idProcessoSeletivo,idFaseProcessoSeletivo" 
                                                    DataSourceID="SqlCANDIDATOSAGENDAVIRTUAL" GridLines="Horizontal" 
                                                    Width="100%">
                                                    <Columns>
                                                        <asp:ButtonField CommandName="Select" DataTextField="nome" 
                                                            HeaderText="Candidatos selecionados para entrevista virtual" Text="Button">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        </asp:ButtonField>
                                                        <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" 
                                                            Visible="False" />
                                                        <asp:BoundField DataField="DataStartField" HeaderText="Data e hora" 
                                                            SortExpression="DataStartField">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="idProcessoSeletivo" HeaderText="idProcessoSeletivo" 
                                                            SortExpression="idProcessoSeletivo" Visible="False" />
                                                        <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" 
                                                            InsertVisible="False" ReadOnly="True" SortExpression="idcurriculo" 
                                                            Visible="False" />
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <asp:Calendar ID="CalendarVirtualSET" runat="server" BackColor="White" 
                                                    BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                                                    Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" 
                                                    Width="200px">
                                                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                                    <NextPrevStyle VerticalAlign="Bottom" />
                                                    <OtherMonthDayStyle ForeColor="#808080" />
                                                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                                    <SelectorStyle BackColor="#CCCCCC" />
                                                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                                </asp:Calendar>
                                            </td>
                                            <td valign="top" width="20">
                                                &nbsp;</td>
                                            <td align="left" valign="top">
                                                <DayPilot:DayPilotCalendar ID="DayPilotCalendarENTREVISTAVIRTUAL" 
                                                    runat="server" BackColor="#FFFFD5" BorderColor="Black" ColumnMarginRight="1" 
                                                    DataEndField="DataEndField" DataSourceID="SqlViewAGENDAVIRTUAL" 
                                                    DataStartField="DataStartField" DataTextField="TEXTOAPRESENTA" 
                                                    DataValueField="idEntrevistaVirtual" DayFontFamily="Tahoma" 
                                                    DayFontSize="10pt" DurationBarColor="Blue" EventBackColor="White" 
                                                    EventBorderColor="Black" 
                                                    EventClickJavaScript="alert('Para agendar uma nova entrevista selecione uma data em aberto.');" 
                                                    EventFontFamily="Tahoma" EventFontSize="8pt" EventHoverColor="Gainsboro" 
                                                    FreetimeClickHandling="PostBack" HeaderHeight="30" HourBorderColor="#EAD098" 
                                                    HourFontFamily="Tahoma" HourFontSize="16pt" HourHalfBorderColor="#F3E4B1" 
                                                    HourNameBackColor="#ECE9D8" HourNameBorderColor="#ACA899" HoverColor="#FFED95" 
                                                    NonBusinessBackColor="#FFF4BC" StartDate="" TimeFormat="Clock24Hours" 
                                                    BusinessBeginsHour="7" BusinessEndsHour="23" />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                &nbsp;</td>
                                            <td valign="top" width="20">
                                                &nbsp;</td>
                                            <td align="right" valign="top">
                                                <asp:LinkButton ID="LinkButtonCancelarEntrevista0" runat="server" 
                                                    CssClass="button" ToolTip="Clique aqui para cancelar" 
                                                    CausesValidation="False">Fechar</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />
                                </asp:Panel>
                                <asp:Image ID="ImageLinhaS1" runat="server" ImageUrl="~/_corporativo/images/holomatica/linha.png" />
                                <asp:Panel ID="PanelResultadoPesquisa" runat="server" CssClass="ResultadoPesquisaPanel" Visible="False">
                                    <asp:Label ID="LabelPesquisadosProcessosSeletivos0" runat="server" 
                                        CssClass="h1" Text="Resultado da Pesquisa"></asp:Label>
                                    <asp:DataList ID="DataListProcessoSeletivo" runat="server" 
                                        DataKeyField="idProcessoSeletivo" DataSourceID="SqlDataSourcePesquisa" 
                                        Width="100%">
                                        <ItemTemplate>
                                            <asp:Label ID="idProcessoSeletivoLabel" runat="server" 
                                                Text='<%# Eval("idProcessoSeletivo") %>' Visible="False" />
                                            <asp:Label ID="idFaseProcessoSeletivoLabel" runat="server" 
                                                Text='<%# Eval("idFaseProcessoSeletivo") %>' Visible="False" />
                                            <asp:Label ID="idTipoFaseProcessoSeletivoLabel" runat="server" 
                                                Text='<%# Eval("idTipoFaseProcessoSeletivo") %>' Visible="False"></asp:Label>
                                            <asp:Label ID="moduloLabel" runat="server" Text='<%# Eval("modulo") %>' Visible="False"></asp:Label>
                                            <br />
                                            <table cellpadding="0" cellspacing="0">
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
                                                        <asp:LinkButton ID="btNomeFaseDBLabel" runat="server" 
                                                            CommandArgument='<%# Eval("idTipoFaseProcessoSeletivo") %>' 
                                                            CommandName="SELECT_MODULO" CssClass="tituloProcessoSeletivo" Font-Bold="True" 
                                                            Text='<%# Eval("NomeFase") %>'></asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table ID="DETALHEPS" cellpadding="0" cellspacing="0" width="900px">
                                                            <tr>
                                                                <td width="70px" valign="top">
                                                                    <asp:ImageButton ID="ImageButtonPESQUISA" runat="server" 
                                                                        CommandArgument='<%# Eval("idFaseProcessoSeletivo") %>' CommandName="Select" 
                                                                        ImageUrl="~/_corporativo/images/holomatica/PESQUISACANDIDATO.png" 
                                                                        ToolTip="Clique aqui para pesquisa na base de talentos" />
                                                                </td>
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
                                                                                    CommandName="ESPONTANEO" CssClass="textoProcessoSeletivo" 
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
                                                                <td valign="top" width="142">
                                                                    <asp:ImageButton ID="ImageButtonFILTRO" runat="server" 
                                                                        CommandArgument='<%# Eval("idFaseProcessoSeletivo") %>' CommandName="FILTRO" 
                                                                        ImageUrl="~/_corporativo/images/holomatica/FILTRO.png" />
                                                                    <asp:ImageButton ID="ImageButtonENCERRAR" runat="server" 
                                                                        CommandArgument='<%# Eval("idFaseProcessoSeletivo") %>' CommandName="ENCERRADO" 
                                                                        ImageUrl="~/_corporativo/images/holomatica/ENCERRAFASE.png" 
                                                                        onclientclick="return confirm(&quot;Quer abrir uma nova fase para este processo seletivo?&quot;)" 
                                                                        ToolTip="Clique aqui para encerrar esta fase" 
                                                                        Visible='<%# Eval("buttonVisiblePS") %>' />
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
                                            <asp:Image ID="ImageLinha1" runat="server" 
                                                ImageUrl="~/_corporativo/images/holomatica/linha.png" />
                                            <br />
                                            <table cellpadding="5" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButtonNAFASE" runat="server" 
                                                            CommandArgument='<%# Eval("idFaseProcessoSeletivo") %>' CommandName="NAFASE" 
                                                            CssClass="textoProcessoSeletivoNORMAL" 
                                                            ToolTip="Total de participantes nesta fase (Aprovados e Reprovados)">TOTAL DE PARTICIPANTES DA FASE</asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButtonTOTALCVANALISADO" runat="server" 
                                                            CommandArgument='<%# Eval("idFaseProcessoSeletivo") %>' CommandName="ANALISADO" 
                                                            CssClass="textoProcessoSeletivoNORMAL" 
                                                            ToolTip="Total de Currículo analisados pelo analista">TOTAL DE CVs ANALISADOS</asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButtonAPROVADOS" runat="server" 
                                                            CommandArgument='<%# Eval("idFaseProcessoSeletivo") %>' CommandName="APROVADO" 
                                                            CssClass="textoProcessoSeletivoABERTO" ForeColor="#006600" 
                                                            ToolTip="Total de candidatos aprovados na fase">TOTAL CVs APROVADOS NA FASE</asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButton2" runat="server" 
                                                            CommandArgument='<%# Eval("idFaseProcessoSeletivo") %>' CommandName="REPROVADO" 
                                                            CssClass="textoProcessoSeletivoFECHADO" ForeColor="Red" 
                                                            ToolTip="Total de candidatos reprovados na fase">TOTAL DE CVs REPROVADOS</asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <asp:LinkButton ID="LinkButtonPARTICIPANTES" runat="server" 
                                                            CssClass="linkProcessoSeletivo" Text='<%# Eval("TotalCandidaturas") %>' 
                                                            CommandArgument='<%# Eval("idFaseProcessoSeletivo") %>' CommandName="NAFASE"></asp:LinkButton>
                                                    </td>
                                                    <td align="center">
                                                        <asp:LinkButton ID="LinkButtonAnalisado" runat="server" CommandName="ANALISADO" 
                                                            CssClass="linkProcessoSeletivo" 
                                                            Text='<%# Eval("TotalAnalisados") %>' 
                                                            CommandArgument='<%# Eval("idFaseProcessoSeletivo") %>' 
                                                            ToolTip="Currículos analisados"></asp:LinkButton>
                                                    </td>
                                                    <td align="center">
                                                        <asp:LinkButton ID="LinkButtonAprovado" runat="server" CommandName="APROVADO" 
                                                            CssClass="linkProcessoSeletivo" 
                                                            Text='<%# Eval("TotalAprovados") %>' 
                                                            CommandArgument='<%# Eval("idFaseProcessoSeletivo") %>' 
                                                            ToolTip="Currículos aprovados"></asp:LinkButton>
                                                    </td>
                                                    <td align="center">
                                                        <asp:LinkButton ID="LinkButtonReprovado" runat="server" CommandName="REPROVADO" 
                                                            CssClass="linkProcessoSeletivo" 
                                                            Text='<%# Eval("TotalReprovados") %>' 
                                                            CommandArgument='<%# Eval("idFaseProcessoSeletivo") %>' 
                                                            ToolTip="Currículos reprovados"></asp:LinkButton>
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
                                        </ItemTemplate>
                                    </asp:DataList>
                                </asp:Panel>
                                              

                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:Panel ID="PanelListaCandidato" runat="server" 
                                                        CssClass="ResultadoPesquisaPanel">
                                                        <asp:Panel ID="PanelCVCandidato" runat="server" BackColor="White" Visible="False" Width="800px">
                                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="left">
                                                                        <asp:Label ID="faseSelecionadaLabel0" runat="server" CssClass="h1">Perfil do Candidato</asp:Label>
                                                                    </td>
                                                                    <td align="right">
                                                                        &nbsp;</td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataList ID="DataListCV" runat="server" DataSourceID="SqlDADOSPESSOAIS" 
                                                                Width="100%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="idCadastroUserLabel" runat="server" 
                                                                        Text='<%# Eval("idCadastroUser") %>' Visible="False" />
                                                                    <asp:Label ID="idUserLabel" runat="server" Text='<%# Eval("idUser") %>' 
                                                                        Visible="False" />
                                                                    <asp:Label ID="apresentarLabel" runat="server" 
                                                                        Text='<%# Eval("apresentar") %>' Visible="False" />
                                                                    <br />
                                                                    <br />
                                                                    <table ID="CORPOCV" cellpadding="5" cellspacing="5" width="800px">
                                                                        <tr>
                                                                            <td valign="top" width="100px">
                                                                                <asp:Image ID="ImageCandidato" runat="server" ImageUrl='<%# Eval("foto") %>' 
                                                                                    ToolTip='Clique aqui para ver o CV deste profissional' Width="100px" />
                                                                            </td>
                                                                            <td align="left" valign="top" width="600px">
                                                                                <table ID="CV" cellpadding="2" cellspacing="2" width="600px">
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            &nbsp;</td>
                                                                                        <td align="right" width="400">
                                                                                            <asp:LinkButton ID="LinkButton_AssociadoComprou" runat="server" CommandName="Select" CssClass="button" ToolTip="Para incluir este CV em sua base de talentos clique aqui." Visible='False'>Incluir este currículo em sua base de talentos</asp:LinkButton>
                                                                                            <br />
                                                                                            <br />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
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
                                                                                                Text="Área de interesse (1ª Opção):"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="interesse01Label" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("interesse01") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados2" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Área de interesse (2ª Opção):"></asp:Label>
                                                                                        </td>
                                                                                        <td align="left" width="400">
                                                                                            <asp:Label ID="interesse02Label" runat="server" CssClass="textoApresentaCV" 
                                                                                                Text='<%# Eval("interesse02") %>' />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="top" width="200px">
                                                                                            <asp:Label ID="LabelCVDados3" runat="server" CssClass="textoApresentaINFOCV" 
                                                                                                Text="Área de interesse (3ª Opção):"></asp:Label>
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
                                                                                                Text="Endereço: (Formas de contato)"></asp:Label>
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
&nbsp;<asp:Label ID="idsetupLabel" runat="server" Text='<%# Eval("idsetup") %>' Visible="False" />
                                                                    &nbsp;<asp:Label ID="idcurriculoLabel" runat="server" 
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
                                                        <br />
                                                        <asp:Label ID="faseSelecionadaLabel" runat="server" CssClass="h1"></asp:Label>
                                                        <br />
                                                        <table ID="REFINAMENTOPESQUISA" runat="server" visible="false" cellpadding="2" cellspacing="2">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="LabelAderencia0" runat="server" 
                                                                        Text="Apresentar apenas currículos acima de:"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="DropDownListADERENCIA" runat="server" AutoPostBack="True" 
                                                                        CssClass="DropCadFormADERENCIA">
                                                                        <asp:ListItem Value="0">0%</asp:ListItem>
                                                                        <asp:ListItem Value="10">10%</asp:ListItem>
                                                                        <asp:ListItem Value="20">20%</asp:ListItem>
                                                                        <asp:ListItem Value="30">30%</asp:ListItem>
                                                                        <asp:ListItem Value="40">40%</asp:ListItem>
                                                                        <asp:ListItem Value="50">50%</asp:ListItem>
                                                                        <asp:ListItem Value="60">60%</asp:ListItem>
                                                                        <asp:ListItem Value="70">70%</asp:ListItem>
                                                                        <asp:ListItem Value="80">80%</asp:ListItem>
                                                                        <asp:ListItem Value="90">90%</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LabelAderencia1" runat="server" Text="de aderência a vaga."></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                        <asp:DataList ID="DataListResultado" runat="server" DataKeyField="idcurriculo" 
                                                            DataSourceID="SqlDataSourceCandidato" Width="100%">
                                                            <FooterTemplate>
                                                                <asp:Label ID="AvisoCandidatoLabel" runat="server" CssClass="msnERROR" 
                                                                    Text="Não existem registros nesta categoria." Visible="False"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="idProcessoSeletivoLabel" runat="server" 
                                                                    Text='<%# Eval("idProcessoSeletivo") %>' Visible="False" />
                                                                <asp:Label ID="idcurriculoLabel" runat="server" 
                                                                    Text='<%# Eval("idcurriculo") %>' Visible="False" />
                                                                <asp:Label ID="idUserLabel" runat="server" Text='<%# Eval("idUser") %>' 
                                                                    Visible="False" />
                                                                <table ID="CANDIDATO0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td>
                                                                            <table cellpadding="0" cellspacing="0">
                                                                                <tr>
                                                                                    <td valign="top" width="60px">
                                                                                        <asp:ImageButton ID="ImageButtonCadidato" runat="server" 
                                                                                            CausesValidation="False" CommandName="Select" ImageUrl='~/_corporativo/images/holomatica/VER_CV.png' 
                                                                                            onclick="ImageButtonCadidato_Click" CommandArgument="CV" 
                                                                                            ToolTip="Clique aqui para visualizar o CV do candidato" />
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
                                                                                    </td>
                                                                                    <td valign="top" width="120px">
                                                                                        <table ID="ADERENCIA0" align="center" cellpadding="0" cellspacing="0" 
                                                                                            width="100%">
                                                                                            <tr>
                                                                                                <td align="center">
                                                                                                    <br />
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
                                                                                    <td align="center" valign="top">
                                                                                        <asp:ImageButton ID="ImageButtonHISTORICO_ENTREVISTA_PRESENCIAL" runat="server" CommandArgument='<%# Eval("idcurriculo") %>' CommandName="HistoricoEntrevistaPresencial" ImageUrl="~/_corporativo/images/holomatica/ENTREVISTA_PRESENCIAL.png" ToolTip="Análise referente a Entrevista Presencial" />
                                                                                    </td>
                                                                                    <td align="center" valign="top">
                                                                                        <asp:ImageButton ID="ImageButtonENTREVISTAVIRTUAL" runat="server" CausesValidation="False" CommandArgument='<%# Eval("idcurriculo") %>' CommandName="EntrevistaVirtual" ImageUrl="~/_corporativo/images/holomatica/CHAT.png" ToolTip="Agenda Entrevista Virtual" />
                                                                                    </td>
                                                                                    <td align="center" valign="top">
                                                                                        <asp:ImageButton ID="ImageButtonAGENDA" runat="server" CausesValidation="False" 
                                                                                            CommandName="EntrevistaPresencial" ImageUrl="~/_corporativo/images/holomatica/AGENDA.png" 
                                                                                            ToolTip="Agenda Entrevista Presencial" 
                                                                                            CommandArgument='<%# Eval("idcurriculo") %>' />
                                                                                    </td>
                                                                                    <td align="center" valign="top">
                                                                                        <asp:ImageButton ID="ImageButtonEMAIL" runat="server" CausesValidation="False" 
                                                                                            CommandName="Email" ImageUrl="~/_corporativo/images/holomatica/EMAIL.png" 
                                                                                            ToolTip="Comunicação com o Candidato" 
                                                                                            CommandArgument='<%# Eval("idcurriculo") %>' />
                                                                                    </td>
                                                                                    <td align="center" valign="top">
                                                                                        <asp:ImageButton ID="ImageButtonTESTE" runat="server" 
                                                                                            CommandArgument='<%# Eval("idcurriculo") %>' CommandName="Teste" 
                                                                                            ImageUrl="~/_corporativo/images/holomatica/TESTE.png" 
                                                                                            ToolTip="Avaliação online com o Candidato" />
                                                                                    </td>
                                                                                    <td valign="top" align="center">
                                                                                        <asp:ImageButton ID="ImageButtonAPROVAR" runat="server" 
                                                                                            ImageUrl="~/_corporativo/images/holomatica/CVAPROVADO.png" 
                                                                                            ToolTip="Clique aqui para aprovar este candidato nesta fase." 
                                                                                            CommandArgument='<%# Eval("idcurriculo") %>' CommandName="Aprova" />
                                                                                    </td>
                                                                                    <td valign="top" align="center">
                                                                                        <asp:ImageButton ID="ImageButtonAPROVAR_FASE" runat="server" 
                                                                                            CommandArgument='<%# Eval("idcurriculo") %>' CommandName="Analise" 
                                                                                            ImageUrl="~/_corporativo/images/holomatica/CVAPROVADO.png" 
                                                                                            ToolTip="Clique aqui para incluir este candidato nesta fase." 
                                                                                            Visible="False" />
                                                                                    </td>
                                                                                    <td valign="top">
                                                                                        <asp:ImageButton ID="ImageButtonREPROVAR" runat="server" 
                                                                                            CommandArgument='<%# Eval("idcurriculo") %>' CommandName="Reprova" 
                                                                                            ImageUrl="~/_corporativo/images/holomatica/CVREPROVADO.png" 
                                                                                            ToolTip="Clique aqui para reprovar este candidato." Visible="False" />
                                                                                    </td>
                                                                                    <td valign="top">
                                                                                        <asp:ImageButton ID="ImageButtonLAUDO" runat="server" 
                                                                                            CommandArgument='<%# Eval("idcurriculo") %>' CommandName="Laudo" 
                                                                                            ImageUrl="~/_corporativo/images/holomatica/LAUDO.png" 
                                                                                            ToolTip="Clique aqui para imprimir, editar ou montar o laudo para este candidato" 
                                                                                            Visible="False" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Image ID="ImageLinhaS" runat="server" 
                                                                                ImageUrl="~/_corporativo/images/holomatica/linha.png" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                        <br />
                                                    </asp:Panel>
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>

                                <asp:Panel ID="PanelAPROVACANDIDATURA" runat="server">
                                    <table cellpadding="5" cellspacing="5" ID="APROVA" width="100%">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Image ID="ImageAVISOREPROVACAO0" runat="server" 
                                                                ImageUrl="~/_corporativo/images/_bottonAvisoSISTEMA.png" />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="LabelAPROVADO" runat="server" CssClass="textoApresentaCV"></asp:Label>
                                                            <br />
                                                            <div class="demo">
                                                            <p>
	                                                            <label for="dentroPAINEL">Qual classificação você dará ao candidato: <input id="dentroPAINEL" type="text" style="border:0; color:#f6931f; font-weight:bold;" /><br />1: Abaixo da média e 10: Muito acima da média</label>                                                           
                                                            </p>
                                                            <div id="slider-range-max"></div>

                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:LinkButton ID="LinkButtonAPROVAR" runat="server" CssClass="button">Confirmar</asp:LinkButton>
                                                <asp:LinkButton ID="LinkButtonCANCELAR0" runat="server" CssClass="button" 
                                                    CausesValidation="False">Cancelar</asp:LinkButton>
                                                                            
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>

                                <br />

                                <asp:Panel ID="PanelANALISE" runat="server">
                                    <table cellpadding="5" cellspacing="5" ID="APROVA0" width="100%">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Image ID="ImageAVISOREPROVACAO7" runat="server" 
                                                                ImageUrl="~/_corporativo/images/_bottonAvisoSISTEMA.png" />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="LabelAPROVADO0" runat="server" CssClass="textoApresentaCV"></asp:Label>
                                                            <br />
                                                            <div class="demo">
                                                            <p>
	                                                            <label for="dentroPAINEL">Qual classificação você dará ao candidato: 
                                                                <input id="dentroPAINEL" type="text" style="border:0; color:#f6931f; font-weight:bold;" /><br />1: Abaixo da média e 10: Muito acima da média</label>                                                           
                                                            </p>
                                                            <div id="slider-range-max"></div>

                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:LinkButton ID="LinkButtonAPROVARFASE" runat="server" CssClass="button">Confirmar</asp:LinkButton>
                                                <asp:LinkButton ID="LinkButtonCANCELAR3" runat="server" CssClass="button" 
                                                    CausesValidation="False">Cancelar</asp:LinkButton>
                                                                            
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>

                                <br />
                                <asp:Panel ID="PanelEXCLUICANDIDATURA" runat="server">
                                    <table cellpadding="5" cellspacing="5" ID="REAPROVA" width="100%">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Image ID="ImageAVISOREPROVACAO" runat="server" 
                                                                ImageUrl="~/_corporativo/images/_bottonAvisoSISTEMA.png" />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="LabelREPROVADO" runat="server" CssClass="textoApresentaCV"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="LinkButtonREPROVAR" runat="server" CssClass="button">Confirmar</asp:LinkButton>
                                                <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CssClass="button" 
                                                    CausesValidation="False">Cancelar</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="PanelENTREVISTAVIRTUAL" runat="server">
                                    <table id="ENTREVISTAVIRTUALTB" cellpadding="5" cellspacing="5" width="100%">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Image ID="ImageAVISOREPROVACAO3" runat="server" 
                                                                ImageUrl="~/_corporativo/images/_bottonAvisoSISTEMA.png" />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="LabelENTREVISTAVIRTUAL" runat="server" 
                                                                CssClass="textoApresentaCV"></asp:Label>
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
                                </asp:Panel>
                                <asp:Panel ID="PanelENTREVISTAPRESENCIAL" runat="server">
                                    <table id="ENTREVISTAPRESENCIAL" cellpadding="5" cellspacing="5" width="100%">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Image ID="ImageAVISOREPROVACAO2" runat="server" 
                                                                ImageUrl="~/_corporativo/images/_bottonAvisoSISTEMA.png" />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="LabelENTREVISTA" runat="server" CssClass="textoApresentaCV"></asp:Label>
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
                                </asp:Panel>
                                <asp:Panel ID="PanelEMAIL" runat="server">
                                    <table id="EMAIL" cellpadding="5" cellspacing="5" width="100%">
                                        <tr>
                                            <td>
                                                <table ID="CONTATO" cellpadding="5" cellspacing="5" width="100%">
                                                    <tr>
                                                        <td>
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Image ID="ImageAVISOREPROVACAO1" runat="server" 
                                                                            ImageUrl="~/_corporativo/images/_bottonAvisoSISTEMA.png" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="LabelEMAIL" runat="server" CssClass="textoApresentaCV"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="textoMensagemLabel" runat="server" 
                                                                Text="Escreva sua mensagem ao candidato:"></asp:Label>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                                ControlToValidate="mensagemTextBox" Display="Dynamic" 
                                                                ErrorMessage="• Informe o motivo do contato!" 
                                                                ValidationGroup="MENSAGEMCANDIDATO"></asp:RequiredFieldValidator>
                                                            <br />
                                                            <asp:TextBox ID="mensagemTextBox" runat="server" 
                                                                CssClass="InputCadFormCandidatoCV" Height="80px" TextMode="MultiLine" 
                                                                ValidationGroup="MENSAGEMCANDIDATO" Width="100%"></asp:TextBox>
                                                            <br />
                                                            <br />
                                                            <asp:LinkButton ID="LinkButtonENVIAR" runat="server" CssClass="button" 
                                                                ValidationGroup="MENSAGEMCANDIDATO" onclientclick="GetMensagem();">Enviar</asp:LinkButton>
                                                            <asp:LinkButton ID="LinkButtonCANCELAR1" runat="server" CssClass="button" 
                                                                CausesValidation="False">Cancelar</asp:LinkButton>
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
                                </asp:Panel>
                                <asp:Panel ID="PanelTESTE" runat="server">
                                    <table cellpadding="5" cellspacing="5">
                                        <tr>
                                            <td>
                                                <asp:Image ID="ImageAVISOREPROVACAO6" runat="server" 
                                                                            
                                                    ImageUrl="~/_corporativo/images/_bottonAvisoSISTEMA.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelTESTE" runat="server" CssClass="textoApresentaCV"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="PanelENCERRAFASE" runat="server" Visible="False">
                                    <table ID="CONTATO0" cellpadding="5" cellspacing="5" width="100%">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Image ID="ImageAVISOREPROVACAO4" runat="server" 
                                                                            ImageUrl="~/_corporativo/images/_bottonAvisoSISTEMA.png" />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="LabelENCERRAFASE" runat="server" CssClass="textoApresentaCV"></asp:Label>
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
                                </asp:Panel>
                                <asp:Panel ID="PanelFILTRO" runat="server" Visible="False">
                                    <table ID="CONTATO1" 
    cellpadding="5" cellspacing="5" width="100%">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Image ID="ImageAVISOREPROVACAO5" runat="server" 
                                                                            ImageUrl="~/_corporativo/images/_bottonAvisoSISTEMA.png" />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="LabelFILTRO" runat="server" CssClass="textoApresentaCV"></asp:Label>
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
                                </asp:Panel>
                                <asp:Panel ID="PanelLAUDO" runat="server" Visible="False">
                                    <table ID="CONTATO2" 
    cellpadding="5" cellspacing="5" width="100%">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td width="100">
                                                            &nbsp;</td>
                                                        <td align="right">
                                                            <asp:LinkButton ID="LinkButtonEDITAR_LAUDO" runat="server" CssClass="button">Editar ou Imprimir este laudo</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:DataList ID="DataListLaudo" runat="server" DataKeyField="idLaudo" 
                                                    DataSourceID="SqlLAUDOAPRESENTA" Width="100%">
                                                    <ItemTemplate>
                                                        <br />
                                                        <asp:Label ID="LabelLAUDO" runat="server" CssClass="textoNone" 
                                                            Text='<%# Eval("Laudo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="PanelAVALIACAOENTREVISTAPRESENCIAL" runat="server" Visible="False">
                                    <br />
                                    <asp:GridView ID="GridViewAVALIACAOENTREVISTAPRESENCIAL" runat="server" AutoGenerateColumns="False" DataSourceID="SqlAVALIACAO_ENTREVISTA_PRESENCIAL" GridLines="None" Width="100%">
                                        <AlternatingRowStyle BackColor="#F4F4F4" />
                                        <Columns>
                                            <asp:BoundField DataField="idProcessoSeletivo" HeaderText="idProcessoSeletivo" SortExpression="idProcessoSeletivo" Visible="False" />
                                            <asp:BoundField DataField="idFaseProcessoSeletivo" HeaderText="idFaseProcessoSeletivo" SortExpression="idFaseProcessoSeletivo" Visible="False" />
                                            <asp:BoundField DataField="idQuiz" HeaderText="idQuiz" InsertVisible="False" ReadOnly="True" SortExpression="idQuiz" Visible="False" />
                                            <asp:BoundField DataField="respostaQuiz" HeaderText="Nível" SortExpression="respostaQuiz" />
                                            <asp:BoundField DataField="idPerguntaQuiz" HeaderText="idPerguntaQuiz" InsertVisible="False" ReadOnly="True" SortExpression="idPerguntaQuiz" Visible="False" />
                                            <asp:TemplateField HeaderText="Sobre" SortExpression="perguntaQuiz">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("perguntaQuiz") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("perguntaQuiz") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="300px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" InsertVisible="False" ReadOnly="True" SortExpression="idcurriculo" Visible="False" />
                                            <asp:TemplateField HeaderText="Avaliação" SortExpression="avaliacao">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("avaliacao") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("avaliacao") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:Image ID="ImageAVISOREPROVACAO5" runat="server" ImageUrl="~/_corporativo/images/_bottonAvisoSISTEMA.png" />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="LabelAVISOENTREVISTA" runat="server" CssClass="textoApresentaCV">Não existe registro de entrevista presencial para este candidato.</asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </asp:Panel>
                                <br />
                                <br />
                    <asp:SqlDataSource ID="SqlFiltrosLiberados" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        
                        
                                    
                                    
                                    SelectCommand="_USP_FILTROS" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                                 <asp:SqlDataSource ID="SqlFiltrosAplicadosNaFase" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_PROCESSOSELETIVO_FILTROS_MONTADOS_CONSULTOR_ANALISTA" 
                                    SelectCommandType="StoredProcedure">
                                     <SelectParameters>
                                         <asp:ControlParameter ControlID="idProcessoSeletivoLabel" 
                                             Name="idProcessoSeletivo" PropertyName="Text" Type="Int32" />
                                         <asp:ControlParameter ControlID="idFaseProcessoSeletivoLabel" 
                                             Name="idFaseProcessoSeletivo" PropertyName="Text" Type="Int32" />
                                         <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" 
                                             Type="Int32" />
                                         <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                         <asp:Parameter DefaultValue="0" Name="salvar" Type="Int32" />
                                         <asp:Parameter DefaultValue="0" Name="remover" Type="Int32" />
                                         <asp:Parameter DefaultValue="0" Name="atualizar" Type="Int32" />
                                         <asp:Parameter DefaultValue="0" 
                                             Name="idFiltroDinamicoMontador_Consultor_Analista" Type="Int32" />
                                         <asp:Parameter Name="field" Type="String" DefaultValue="0" />
                                         <asp:Parameter Name="value" Type="String" DefaultValue="0" />
                                         <asp:Parameter Name="nivel" Type="String" DefaultValue="0" />
                                     </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSourcePesquisa" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_PROCESSOSELETIVO_PESQUISA" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="TEXTOPESQUISALabel" Name="SearchTerm" 
                                            PropertyName="Text" Type="String" />
                                        <asp:SessionParameter DefaultValue="17" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
                                        <asp:ControlParameter ControlID="RadioButtonListatus" DefaultValue="" Name="flgFinalizado" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="DropDownListFase" 
                                            Name="idTipoFaseProcessoSeletivo" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="idProcessoSeletivoLabel" DefaultValue="0" 
                                            Name="idProcessoSeletivo" PropertyName="Text" Type="Int32" />
                                        <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" 
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSourceCandidato" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_PROCESSOSELETIVO_PESQUISA_CV" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="0" Name="idRH_Gestor" 
                                            SessionField="idRH_Gestor" Type="Int32" />
                                        <asp:ControlParameter ControlID="idProcessoSeletivoLabel" DefaultValue="" 
                                            Name="idProcessoSeletivo" PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="idFaseProcessoSeletivoLabel" DefaultValue="" 
                                            Name="idFaseProcessoSeletivo" PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="DropDownListADERENCIA" DefaultValue="80" 
                                            Name="minAderencia" PropertyName="SelectedValue" Type="Int32" />
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
                                        <asp:Parameter DefaultValue="0" Name="Peso_Aderencia_Nivel_Profissional" 
                                            Type="Int32" />
                                        <asp:ControlParameter ControlID="TipoPesquisaLabel" DefaultValue="Expontanea" 
                                            Name="tipoPesquisa" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDADOSPESSOAIS" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_CURRICULO_DADOSPESSOAIS" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idCurriculoLabel" Name="idCurriculo" 
                                            PropertyName="Text" Type="Int32" />
                                        <asp:Parameter Name="idCurriculo_CRIPTOGRAFADO" Type="String" DefaultValue=" " />
                                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                        <asp:SessionParameter DefaultValue="" Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlFase" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    
                                    
                                    
                                    SelectCommand="SELECT idTipoFaseProcessoSeletivo, idSetup, dsFase, modulo FROM tbTipoFaseProcessoSeletivo WHERE (idSetup = @idSetup)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlFaseENCERRAMENTO" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_PROCESSOSELETIVO_PROXIMA_FASE" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                        <asp:ControlParameter ControlID="idProcessoSeletivoLabel" 
                                            Name="idProcessoSeletivo" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlViewAGENDA" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_PRESENCIAL_AGENDA_EMPRESA" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="0" Name="idCurriculo" Type="Int32" />
                                        <asp:ControlParameter ControlID="idFaseProcessoSeletivoLabel" 
                                            Name="idFaseProcessoSeletivo" PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="idProcessoSeletivoLabel" 
                                            Name="idProcessoSeletivo" PropertyName="Text" Type="Int32" />
                                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                            Type="Int32" />
                                        <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" 
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlViewAGENDAVIRTUAL" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_PROCESSOSELETIVO_CANDIDATURA_ENTREVISTA_VIRTUAL_AGENDA_EMPRESA" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="0" Name="idCurriculo" Type="Int32" />
                                        <asp:ControlParameter ControlID="idFaseProcessoSeletivoLabel" 
                                            Name="idFaseProcessoSeletivo" PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="idProcessoSeletivoLabel" 
                                            Name="idProcessoSeletivo" PropertyName="Text" Type="Int32" />
                                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                            Type="Int32" />
                                        <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" 
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlAGENDA_FORM" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    DeleteCommand="DELETE FROM [_tbEntrevistaPresencial] WHERE [idEntrevistaPresencial] = @idEntrevistaPresencial" 
                                    InsertCommand="INSERT INTO [_tbEntrevistaPresencial] ([idCadastroEmpresa], [idRH_Gestor], [idVaga], [idCurriculo], [dsEventoAgenda], [ProtocoloDoAgendamento], [DataStartField], [DataEndField], [DataTextField], [DataValueField], [Evento], [HistoricoDasMensagens], [aceito]) VALUES (@idCadastroEmpresa, @idRH_Gestor, @idVaga, @idCurriculo, @dsEventoAgenda, @ProtocoloDoAgendamento, @DataStartField, @DataEndField, @DataTextField, @DataValueField, @Evento, @HistoricoDasMensagens, @aceito)" 
                                    SelectCommand="SELECT [idEntrevistaPresencial], [idCadastroEmpresa], [idRH_Gestor], [idVaga], [idCurriculo], [dsEventoAgenda], [ProtocoloDoAgendamento], [DataStartField], [DataEndField], [DataTextField], [DataValueField], [Evento], [HistoricoDasMensagens], [aceito] FROM [_tbEntrevistaPresencial]" 
                                    UpdateCommand="UPDATE [_tbEntrevistaPresencial] SET [idCadastroEmpresa] = @idCadastroEmpresa, [idRH_Gestor] = @idRH_Gestor, [idVaga] = @idVaga, [idCurriculo] = @idCurriculo, [dsEventoAgenda] = @dsEventoAgenda, [ProtocoloDoAgendamento] = @ProtocoloDoAgendamento, [DataStartField] = @DataStartField, [DataEndField] = @DataEndField, [DataTextField] = @DataTextField, [DataValueField] = @DataValueField, [Evento] = @Evento, [HistoricoDasMensagens] = @HistoricoDasMensagens, [aceito] = @aceito WHERE [idEntrevistaPresencial] = @idEntrevistaPresencial">
                                    <DeleteParameters>
                                        <asp:Parameter Name="idEntrevistaPresencial" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                                        <asp:Parameter Name="idRH_Gestor" Type="Int32" />
                                        <asp:Parameter Name="idVaga" Type="Int32" />
                                        <asp:Parameter Name="idCurriculo" Type="Int32" />
                                        <asp:Parameter Name="dsEventoAgenda" Type="String" />
                                        <asp:Parameter Name="ProtocoloDoAgendamento" Type="String" />
                                        <asp:Parameter Name="DataStartField" Type="DateTime" />
                                        <asp:Parameter Name="DataEndField" Type="DateTime" />
                                        <asp:Parameter Name="DataTextField" Type="String" />
                                        <asp:Parameter Name="DataValueField" Type="String" />
                                        <asp:Parameter Name="Evento" Type="String" />
                                        <asp:Parameter Name="HistoricoDasMensagens" Type="String" />
                                        <asp:Parameter Name="aceito" Type="Int32" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                                        <asp:Parameter Name="idRH_Gestor" Type="Int32" />
                                        <asp:Parameter Name="idVaga" Type="Int32" />
                                        <asp:Parameter Name="idCurriculo" Type="Int32" />
                                        <asp:Parameter Name="dsEventoAgenda" Type="String" />
                                        <asp:Parameter Name="ProtocoloDoAgendamento" Type="String" />
                                        <asp:Parameter Name="DataStartField" Type="DateTime" />
                                        <asp:Parameter Name="DataEndField" Type="DateTime" />
                                        <asp:Parameter Name="DataTextField" Type="String" />
                                        <asp:Parameter Name="DataValueField" Type="String" />
                                        <asp:Parameter Name="Evento" Type="String" />
                                        <asp:Parameter Name="HistoricoDasMensagens" Type="String" />
                                        <asp:Parameter Name="aceito" Type="Int32" />
                                        <asp:Parameter Name="idEntrevistaPresencial" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlCANDIDATOSAGENDA" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    
                                    SelectCommand="SELECT tbCadastroUser.nome, _tbEntrevistaPresencial.DataStartField, _tbEntrevistaPresencial.idProcessoSeletivo, _tbEntrevistaPresencial.idFaseProcessoSeletivo, _tbEntrevistaPresencial.idCurriculo, _tbEntrevistaPresencial.statusEntrevista FROM _tbEntrevistaPresencial INNER JOIN tbCurriculo ON _tbEntrevistaPresencial.idCurriculo = tbCurriculo.idcurriculo INNER JOIN tbCadastroUser ON tbCurriculo.idCadastroUser = tbCadastroUser.idCadastroUser WHERE (_tbEntrevistaPresencial.idProcessoSeletivo = @idProcessoSeletivo)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idProcessoSeletivoLabel" 
                                            Name="idProcessoSeletivo" PropertyName="Text" DefaultValue="" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlCANDIDATOSAGENDAVIRTUAL" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    
                                    
                                    SelectCommand="SELECT tbCadastroUser.nome, _tbEntrevistaVirtual.idCurriculo, _tbEntrevistaVirtual.idProcessoSeletivo, _tbEntrevistaVirtual.idFaseProcessoSeletivo, _tbEntrevistaVirtual.DataStartField FROM tbCurriculo INNER JOIN tbCadastroUser ON tbCurriculo.idCadastroUser = tbCadastroUser.idCadastroUser INNER JOIN _tbEntrevistaVirtual ON tbCurriculo.idcurriculo = _tbEntrevistaVirtual.idCurriculo WHERE (_tbEntrevistaVirtual.idProcessoSeletivo = @idProcessoSeletivo)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idProcessoSeletivoLabel" 
                                            Name="idProcessoSeletivo" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlLAUDOAPRESENTA" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    
                                    
                                    
                                    SelectCommand="SELECT idLaudo, Laudo, idSetup FROM _tbLaudo WHERE (idProcessoSeletivo = @idProcessoSeletivo) AND (idCurriculo = @idCurriculo) AND (idRH_Gestor = @idRH_Gestor) AND (idSetup = @idSetup)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idProcessoSeletivoLabel" 
                                            Name="idProcessoSeletivo" PropertyName="Text" Type="Int32" />
                                        <asp:ControlParameter ControlID="idCurriculoLabel" Name="idCurriculo" 
                                            PropertyName="Text" Type="Int32" />
                                        <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" 
                                            Type="Int32" />
                                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlAVALIACAODISPONIVEL" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    
                                    SelectCommand="_USP_AVALIACAO_DISPONIVEL_PARA_EMPRESA" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlAVALIACAO_ENTREVISTA_PRESENCIAL" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_ANALISE_ENTREVISTA_PRESENCIAL" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idProcessoSeletivoLabel" Name="idProcessoSeletivo" PropertyName="Text" Type="Int32" />
                                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                        <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>


