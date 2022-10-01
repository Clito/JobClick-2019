<%@ Page Title="" Language="VB" MasterPageFile="corporativoPage.master" AutoEventWireup="false" CodeFile="outlookvaga.aspx.vb" Inherits="_gestor_outlookvaga" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">


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

.textoResumoVAGA
{
	font-size: 10pt;
	text-decoration: none;
	cursor: auto;
	font-weight: normal;
	z-index: 0;
	color: #666666;
}

.tableFormulario
{
	border-right: #cccccc 0px solid;
	border-top: #cccccc 1px solid;
	border-left: #cccccc 0px solid;
	border-bottom: #cccccc 0px solid;
	padding-top: 10px;
	padding-right: 10px;
	padding-left: 10px;
	padding-bottom: 10px;
}

.tableFormulario
{
	border-right: #cccccc 0px solid;
	border-top: #cccccc 1px solid;
	border-left: #cccccc 0px solid;
	border-bottom: #cccccc 0px solid;
	padding-top: 10px;
	padding-right: 10px;
	padding-left: 10px;
	padding-bottom: 10px;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
        $(function () {
            $("#<%=PanelPreviewVaga.ClientID%>").dialog({ closeText: '', width: '850', title: "Veja o anúncio da vaga", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>

    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>
                 <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_gestor/images/buttonOK.png" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABEL" runat="server" 
                                    CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
    <table width="750" align="center">
    <tr>
        <td>
            <asp:Label ID="idVagaAnuncioPREVIEWLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="ProtocoloLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="idVagaAnuncio_PREVIEW_HistoricoLabel" runat="server" 
                Visible="False"></asp:Label>
            <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="emailResLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="nomeResLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="nomeGESTORLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="emailGESTORLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="nomeANALISTA_CONSULTORLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="emailANALISTA_CONSULTORLabel" runat="server" Visible="False"></asp:Label>
            <br />
            <asp:GridView ID="GridViewVAGA" runat="server" AutoGenerateColumns="False" 
                
                DataKeyNames="idVagaAnuncioPREVIEW,Protocolo,idCadastroEmpresa,idVagaAnuncio_PREVIEW_Historico,idRH_Gestor,emailRes,nomeRes,nomeGESTOR,emailGESTOR,nomeANALISTA_CONSULTOR,emailANALISTA_CONSULTOR" DataSourceID="SqlOutLookView" 
                GridLines="Horizontal" Width="100%" BorderColor="#CCCCCC" 
                BorderStyle="Dotted" BorderWidth="1px">
                <AlternatingRowStyle BackColor="#F3F3F3" />
                <Columns>
                    <asp:BoundField DataField="idVagaAnuncioPREVIEW" 
                        HeaderText="idVagaAnuncioPREVIEW" InsertVisible="False" ReadOnly="True" 
                        SortExpression="idVagaAnuncioPREVIEW" Visible="False" />
                    <asp:BoundField DataField="idVagaAnuncio_PREVIEW_Historico" 
                        HeaderText="idVagaAnuncio_PREVIEW_Historico" InsertVisible="False" 
                        SortExpression="idVagaAnuncio_PREVIEW_Historico" Visible="False" />
                    <asp:ButtonField CommandName="Select" DataTextField="Protocolo" 
                        HeaderText="Protocolo (Código da vaga)" Text="Button">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:ButtonField>
                    <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                        SortExpression="Protocolo" Visible="False" />
                    <asp:BoundField DataField="Cargo" HeaderText="Cargo" SortExpression="Cargo" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="idSetup" HeaderText="idSetup" 
                        SortExpression="idSetup" Visible="False" />
                    <asp:BoundField DataField="gravar" HeaderText="gravar" SortExpression="gravar" 
                        Visible="False" />
                    <asp:BoundField DataField="idstatusvaga" HeaderText="idstatusvaga" 
                        SortExpression="idstatusvaga" Visible="False" />
                    <asp:BoundField DataField="historico" HeaderText="historico" 
                        SortExpression="historico" Visible="False" />
                    <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                        SortExpression="idCadastroEmpresa" Visible="False" />
                    <asp:BoundField DataField="idCadastroEmpresa_Filha" 
                        HeaderText="idCadastroEmpresa_Filha" SortExpression="idCadastroEmpresa_Filha" 
                        Visible="False" />
                    <asp:BoundField DataField="nomeANALISTA_CONSULTOR" 
                        HeaderText="nomeANALISTA_CONSULTOR" SortExpression="nomeANALISTA_CONSULTOR" 
                        Visible="False" />
                    <asp:BoundField DataField="emailANALISTA_CONSULTOR" 
                        HeaderText="emailANALISTA_CONSULTOR" SortExpression="emailANALISTA_CONSULTOR" 
                        Visible="False" />
                    <asp:BoundField DataField="nomeGESTOR" HeaderText="nomeGESTOR" 
                        SortExpression="nomeGESTOR" Visible="False" />
                    <asp:BoundField DataField="emailGESTOR" HeaderText="emailGESTOR" 
                        SortExpression="emailGESTOR" Visible="False" />
                    <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" 
                        Visible="False" />
                    <asp:BoundField DataField="nmempresa" HeaderText="nmempresa" 
                        SortExpression="nmempresa" Visible="False" />
                    <asp:BoundField DataField="emailRes" HeaderText="emailRes" 
                        SortExpression="emailRes" Visible="False" />
                    <asp:BoundField DataField="nomeRes" HeaderText="nomeRes" 
                        SortExpression="nomeRes" Visible="False" />
                </Columns>
                <EmptyDataTemplate>
<table ID="Aviso" cellpadding="10" cellspacing="10">
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <asp:Image ID="ImageAviso" runat="server" 
                                                    ImageUrl="~/images/empresa/aviso.png" />
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelAVISO" runat="server" 
                                                    
                                                    
                                                    
                                                    
                                                    Text="&lt;b&gt;Aviso:&lt;/b&gt;&lt;br&gt;Não existem mensagens cadastradas."></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>                    
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:DataList ID="DataListOutLookView" runat="server" 
                DataKeyField="idVagaAnuncioPREVIEW" DataSourceID="SqlOutLookViewMensagem" 
                Width="100%">
                <ItemTemplate>
                    <table cellpadding="1" cellspacing="1" width="740">
                        <tr>
                            <td align="right" width="250">
                                <asp:Label ID="LabelEmpresa" runat="server" Text="Empresa:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="nmempresaLabel" runat="server" CssClass="titulo" 
                                    Text='<%# Eval("nmempresa") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="250">
                                <asp:Label ID="LabelProtocolo" runat="server" Text="Protocolo:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="ProtocoloLabel" runat="server" Text='<%# Eval("Protocolo") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="250">
                                <asp:Label ID="CargoLabelDs" runat="server" Text="Cargo:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="CargoLabel" runat="server" Text='<%# Eval("Cargo") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="250">
                                <asp:Label ID="LabelStatus" runat="server" Text="Situação da vaga:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="idstatusvagaLabel" runat="server" 
                                    Text='<%# Eval("idstatusvaga") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" width="250">
                                <asp:Label ID="Label1" runat="server" Text="Mensagens (Histórico):"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="historicoLabel" runat="server" Text='<%# Eval("historico") %>' 
                                    CssClass="textItalic" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="250">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" width="250">
                                <asp:Label ID="LabelEnvolvidos" runat="server" Text="Envolvidos com a vaga:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="nomeANALISTA_CONSULTORLabel" runat="server" 
                                    Text='<%# Eval("nomeANALISTA_CONSULTOR") %>' />
                                &nbsp;[<asp:Label ID="emailANALISTA_CONSULTORLabel" runat="server" 
                                    Text='<%# Eval("emailANALISTA_CONSULTOR") %>' />
                                ]<br />
                                <asp:Label ID="nomeGESTORLabel" runat="server" 
                                    Text='<%# Eval("nomeGESTOR") %>' />
                                &nbsp;[<asp:Label ID="emailGESTORLabel" runat="server" 
                                    Text='<%# Eval("emailGESTOR") %>' />
                                ]</td>
                        </tr>
                        <tr>
                            <td align="right" width="250">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right" width="250">
                                <asp:Label ID="Label2" runat="server" Text="Mensagem copiada para:"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="nomeResLabel" runat="server" Text='<%# Eval("nomeRes") %>' />
                                &nbsp;[<asp:Label ID="emailResLabel" runat="server" Text='<%# Eval("emailRes") %>' />
                                ]</td>
                        </tr>
                        <tr>
                            <td align="right" width="250">
                                &nbsp;</td>
                            <td align="right" valign="top">
                                <asp:Label ID="idCadastroEmpresa_FilhaLabel" runat="server" 
                                    Text='<%# Eval("idCadastroEmpresa_Filha") %>' Visible="False" />
                                <asp:Label ID="idCadastroEmpresaLabel" runat="server" 
                                    Text='<%# Eval("idCadastroEmpresa") %>' Visible="False" />
                                <asp:Label ID="idUserLabel" runat="server" Text='<%# Eval("idUser") %>' 
                                    Visible="False" />
                                <asp:Label ID="idVagaAnuncioPREVIEWLabel" runat="server" 
                                    Text='<%# Eval("idVagaAnuncioPREVIEW") %>' Visible="False" />
                                <asp:Label ID="idSetupLabel" runat="server" Text='<%# Eval("idSetup") %>' 
                                    Visible="False" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
                    <table id="FORMMENSAGEM" runat="server" visible="false" cellpadding="1" cellspacing="1" width="740">
                        <tr>
                            <td align="right" width="250">&nbsp;</td>
                            <td>
                                <asp:Label ID="Label3" runat="server" 
                                    Text="Escreva aqui seus comentários ao Consultor:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TextBoxMensagem" 
                                    ErrorMessage="Informe o conteúdo da mensagem">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="250">
                                &nbsp;</td>
                            <td>
                                <asp:TextBox ID="TextBoxMensagem" runat="server" CssClass="InputCad" 
                                    Height="100px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="250">
                                &nbsp;</td>
                            <td>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                    ShowMessageBox="True" ShowSummary="False" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="250">
                            </td>
                            <td align="right">
                                <asp:LinkButton ID="LinkButtonEnviar" runat="server" CssClass="button">Enviar mensagem</asp:LinkButton>
                                <asp:LinkButton ID="LinkButtonFechar" runat="server" CausesValidation="False" 
                                    CssClass="button" onclick="LinkButtonFechar_Click">Fechar</asp:LinkButton>
                                <asp:LinkButton ID="LinkButtonANUNCIO" runat="server" CausesValidation="False" 
                                    CssClass="button" onclick="LinkButtonANUNCIO_Click">Anúncio</asp:LinkButton>
                            </td>
                        </tr>
                    </table> 
    <asp:Panel ID="PanelPreviewVaga" runat="server" 
        Visible="False">
        <table align="center" cellpadding="0" cellspacing="0" width="800px">
            <tr>
                <td>
                    <asp:DataList ID="DataListPreviewVaga" runat="server" 
                        DataSourceID="SqlDataSourcePreviewVaga" Width="100%" BackColor="#FFFFE8">
                        <ItemTemplate>
                            &nbsp;<table ID="TITULO" align="center" cellpadding="5" cellspacing="5" 
                                width="100%">
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="ProtocoloLabel0" runat="server" CssClass="tituloProcessoSeletivo" 
                                            Text='<%# Eval("Protocolo") %>' />
                                    </td>
                                    <td align="right">
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <table ID="CABECANUNCIOTABLE" cellpadding="10" cellspacing="10" width="100%">
                                <tr>
                                    <td align="left">
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td valign="top">
                                                    <asp:Image ID="ImagePNE" runat="server" 
                                                        ImageUrl="~/_gestor/images/pne.png" Visible='<%# Eval("pne") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="LabelANUNCIO" runat="server" CssClass="textoResumoVAGA" 
                                                        Text='<%# Eval("dsempresaVaga") %>'></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table ID="Form" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td ID="FormacaoTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("FormacaoAcademica_Apresenta") %>' width="40%">
                                        <asp:Label ID="FormacaoAcademica_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("FormacaoAcademica_Label") %>' 
                                            Visible='<%# Eval("FormacaoAcademica_Apresenta") %>' />
                                    </td>
                                    <td ID="FormacaoTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("FormacaoAcademica_Apresenta") %>' align="left">
                                        <asp:Label ID="FormacaoAcademicaLabel" runat="server" 
                                            Text='<%# Bind("FormacaoAcademica") %>' 
                                            Visible='<%# Eval("FormacaoAcademica_Apresenta") %>' 
                                            CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="PerfilVagaTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("dsPerfilVaga_Apresenta") %>' width="40%">
                                        <asp:Label ID="dsPerfilVaga_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("dsPerfilVaga_Label") %>' 
                                            Visible='<%# Eval("dsPerfilVaga_Apresenta") %>' />
                                    </td>
                                    <td ID="PerfilVagaTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("dsPerfilVaga_Apresenta") %>' align="left">
                                        <asp:Label ID="dsPerfilVagaLabel" runat="server" 
                                            Text='<%# Bind("dsPerfilVaga") %>' 
                                            Visible='<%# Eval("dsPerfilVaga_Apresenta") %>' 
                                            CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="CargoTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("Cargo_Apresenta") %>' width="40%">
                                        <asp:Label ID="Cargo_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("Cargo_Label") %>' Visible='<%# Eval("Cargo_Apresenta") %>' />
                                    </td>
                                    <td ID="CargoTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("Cargo_Apresenta") %>' align="left">
                                        <asp:Label ID="CargoLabel" runat="server" Text='<%# Bind("Cargo") %>' 
                                            Visible='<%# Eval("Cargo_Apresenta") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="nrovagaTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("nrovaga_Apresenta") %>' width="40%">
                                        <asp:Label ID="nrovaga_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("nrovaga_Label") %>' />
                                    </td>
                                    <td ID="nrovagaTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("nrovaga_Apresenta") %>' align="left">
                                        <asp:Label ID="nrovagaLabel" runat="server" Text='<%# Bind("nrovaga") %>' 
                                            CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="nmresponsavelTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("nmresponsavel_Apresenta") %>' width="40%">
                                        <asp:Label ID="nmresponsavel_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("nmresponsavel_Label") %>' />
                                    </td>
                                    <td ID="nmresponsavelTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("nmresponsavel_Apresenta") %>' align="left">
                                        <asp:Label ID="nmresponsavelLabel" runat="server" 
                                            Text='<%# Bind("nmresponsavel") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="TipoOportunidadeTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("TipoOportunidade_Apresenta") %>' width="40%">
                                        <asp:Label ID="TipoOportunidade_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("TipoOportunidade_Label") %>' />
                                    </td>
                                    <td ID="TipoOportunidadeTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("TipoOportunidade_Apresenta") %>' align="left">
                                        <asp:Label ID="TipoOportunidadeLabel" runat="server" 
                                            Text='<%# Bind("TipoOportunidade") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="QualificacaoHabilidadesEspecificasTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("QualificacaoHabilidadesEspecificas_Apresenta") %>' 
                                        width="40%">
                                        <asp:Label ID="QualificacaoHabilidadesEspecificas_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" 
                                            Text='<%# Bind("QualificacaoHabilidadesEspecificas_Label") %>' />
                                    </td>
                                    <td ID="QualificacaoHabilidadesEspecificasTD2" runat="server" 
                                        class="tableFormulario" 
                                        visible='<%# Eval("QualificacaoHabilidadesEspecificas_Apresenta") %>' 
                                        align="left">
                                        <asp:Label ID="QualificacaoHabilidadesEspecificasLabel" runat="server" 
                                            Text='<%# Bind("QualificacaoHabilidadesEspecificas") %>' 
                                            CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="Remuneracao_LabelTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("Remuneracao_Apresenta") %>' width="40%">
                                        <asp:Label ID="Remuneracao_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("Remuneracao_Label") %>' />
                                    </td>
                                    <td ID="Remuneracao_LabelTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("Remuneracao_Apresenta") %>' align="left">
                                        <asp:Label ID="RemuneracaoLabel" runat="server" 
                                            Text='<%# Bind("Remuneracao", "{0:C}") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="RemuneracaoVariavelTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("RemuneracaoVariavel_Apresenta") %>' width="40%">
                                        <asp:Label ID="RemuneracaoVariavel_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("RemuneracaoVariavel_Label") %>' />
                                    </td>
                                    <td ID="RemuneracaoVariavelTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("RemuneracaoVariavel_Apresenta") %>' align="left">
                                        <asp:Label ID="RemuneracaoVariavelLabel" runat="server" 
                                            Text='<%# Bind("RemuneracaoVariavel", "{0:C}") %>' 
                                            CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="HonorarioTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("Honorario_Apresenta") %>' width="40%">
                                        <asp:Label ID="Honorario_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("Honorario_Label") %>' />
                                    </td>
                                    <td ID="HonorarioTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("Honorario_Apresenta") %>' align="left">
                                        <asp:Label ID="HonorarioLabel" runat="server" 
                                            Text='<%# Bind("Honorario", "{0:C}") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="LocalTrabalhoTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("LocalTrabalho_Apresenta") %>' width="40%">
                                        <asp:Label ID="LocalTrabalho_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("LocalTrabalho_Label") %>' />
                                    </td>
                                    <td ID="LocalTrabalhoTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("LocalTrabalho_Apresenta") %>' align="left">
                                        <asp:Label ID="LocalTrabalhoLabel" runat="server" 
                                            Text='<%# Bind("LocalTrabalho") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="ObsComplementaresTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("ObsComplementares_Apresenta") %>' width="40%">
                                        <asp:Label ID="ObsComplementares_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("ObsComplementares_Label") %>' />
                                    </td>
                                    <td ID="ObsComplementaresTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("ObsComplementares_Apresenta") %>' align="left">
                                        <asp:Label ID="ObsComplementaresLabel" runat="server" 
                                            Text='<%# Bind("ObsComplementares") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="BeneficiosTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("Beneficios_Apresenta") %>' width="40%">
                                        <asp:Label ID="Beneficios_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("Beneficios_Label") %>' />
                                    </td>
                                    <td ID="BeneficiosTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("Beneficios_Apresenta") %>' align="left">
                                        <asp:Label ID="BeneficiosLabel" runat="server" 
                                            Text='<%# Bind("Beneficios") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="PerspectivaTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("Perspectiva_Apresenta") %>' width="40%">
                                        <asp:Label ID="Perspectiva_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("Perspectiva_Label") %>' />
                                    </td>
                                    <td ID="PerspectivaTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("Perspectiva_Apresenta") %>' align="left">
                                        <asp:Label ID="PerspectivaLabel" runat="server" 
                                            Text='<%# Bind("Perspectiva") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="FaixaEtariaInicioTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("FaixaEtariaInicio_Apresenta") %>' width="40%">
                                        <asp:Label ID="FaixaEtariaInicio_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("FaixaEtariaInicio_Label") %>' />
                                    </td>
                                    <td ID="FaixaEtariaInicioTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("FaixaEtariaInicio_Apresenta") %>' align="left">
                                        <asp:Label ID="FaixaEtariaInicioLabel" runat="server" 
                                            Text='<%# Bind("FaixaEtariaInicio", "{0} anos") %>' 
                                            CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="FaixaEtariaFimTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("FaixaEtariaFim_Apresenta") %>' width="40%">
                                        <asp:Label ID="FaixaEtariaFim_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("FaixaEtariaFim_Label") %>' />
                                    </td>
                                    <td ID="FaixaEtariaFimTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("FaixaEtariaFim_Apresenta") %>' align="left">
                                        <asp:Label ID="FaixaEtariaFimLabel" runat="server" 
                                            Text='<%# Bind("FaixaEtariaFim", "{0} anos") %>' 
                                            CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="SexoTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("Sexo_Apresenta") %>' width="40%">
                                        <asp:Label ID="Sexo_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("Sexo_Label") %>' />
                                    </td>
                                    <td ID="SexoTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("Sexo_Apresenta") %>' align="left">
                                        <asp:Label ID="SexoLabel" runat="server" Text='<%# Bind("Sexo") %>' 
                                            CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="ConhecimentoIdiomaTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("ConhecimentoIdioma_Apresenta") %>' width="40%">
                                        <asp:Label ID="ConhecimentoIdioma_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("ConhecimentoIdioma_Label") %>' />
                                    </td>
                                    <td ID="ConhecimentoIdiomaTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("ConhecimentoIdioma_Apresenta") %>' align="left">
                                        <asp:Label ID="ConhecimentoIdiomaLabel" runat="server" 
                                            Text='<%# Bind("ConhecimentoIdioma") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="PerfilComposicaoEquipeTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("PerfilComposicaoEquipe_Apresenta") %>' width="40%">
                                        <asp:Label ID="PerfilComposicaoEquipe_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("PerfilComposicaoEquipe_Label") %>' />
                                    </td>
                                    <td ID="PerfilComposicaoEquipeTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("PerfilComposicaoEquipe_Apresenta") %>' align="left">
                                        <asp:Label ID="PerfilComposicaoEquipeLabel" runat="server" 
                                            Text='<%# Bind("PerfilComposicaoEquipe") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="PerfilGestorTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("PerfilGestor_Apresenta") %>' width="40%">
                                        <asp:Label ID="PerfilGestor_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("PerfilGestor_Label") %>' />
                                    </td>
                                    <td ID="PerfilGestorTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("PerfilGestor_Apresenta") %>' align="left">
                                        <asp:Label ID="PerfilGestorLabel" runat="server" 
                                            Text='<%# Bind("PerfilGestor") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="CursoEspecificoTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("CursoEspecifico_Apresenta") %>' width="40%">
                                        <asp:Label ID="CursoEspecifico_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("CursoEspecifico_Label") %>' />
                                    </td>
                                    <td ID="CursoEspecificoTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("CursoEspecifico_Apresenta") %>' align="left">
                                        <asp:Label ID="CursoEspecificoLabel" runat="server" 
                                            Text='<%# Bind("CursoEspecifico") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="ConhecimentoTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("Conhecimento_Apresenta") %>' width="40%">
                                        <asp:Label ID="Conhecimento_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("Conhecimento_Label") %>' />
                                    </td>
                                    <td ID="ConhecimentoTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("Conhecimento_Apresenta") %>' align="left">
                                        <asp:Label ID="ConhecimentoLabel" runat="server" 
                                            Text='<%# Bind("Conhecimento") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="ConhecimentoInformaticaTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("ConhecimentoInformatica_Apresenta") %>' width="40%">
                                        <asp:Label ID="ConhecimentoInformatica_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("ConhecimentoInformatica_Label") %>' />
                                    </td>
                                    <td ID="ConhecimentoInformaticaTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("ConhecimentoInformatica_Apresenta") %>' align="left">
                                        <asp:Label ID="ConhecimentoInformaticaLabel" runat="server" 
                                            Text='<%# Bind("ConhecimentoInformatica") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="CompetenciaComportamentalTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("CompetenciaComportamental_Apresenta") %>' width="40%">
                                        <asp:Label ID="CompetenciaComportamental_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("CompetenciaComportamental_Label") %>' />
                                    </td>
                                    <td ID="CompetenciaComportamentalTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("CompetenciaComportamental_Apresenta") %>' align="left">
                                        <asp:Label ID="CompetenciaComportamentalLabel" runat="server" 
                                            Text='<%# Bind("CompetenciaComportamental") %>' 
                                            CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="CompetenciaProfissionalTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("CompetenciaProfissional_Apresenta") %>' width="40%">
                                        <asp:Label ID="CompetenciaProfissional_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("CompetenciaProfissional_Label") %>' />
                                    </td>
                                    <td ID="CompetenciaProfissionalTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("CompetenciaProfissional_Apresenta") %>' align="left">
                                        <asp:Label ID="CompetenciaProfissionalLabel" runat="server" 
                                            Text='<%# Bind("CompetenciaProfissional") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="AspectoCriticoTD1" runat="server" align="right" class="tableFormulario" 
                                        valign="top" visible='<%# Eval("AspectoCritico_Apresenta") %>' width="40%">
                                        <asp:Label ID="AspectoCritico_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("AspectoCritico_Label") %>' />
                                    </td>
                                    <td ID="AspectoCriticoTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("AspectoCritico_Apresenta") %>' align="left">
                                        <asp:Label ID="AspectoCriticoLabel" runat="server" 
                                            Text='<%# Bind("AspectoCritico") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="PrincipalDesafioTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("PrincipalDesafio_Apresenta") %>' width="40%">
                                        <asp:Label ID="PrincipalDesafio_LabelLabel" runat="server" CssClass="tituloEmp" 
                                            Text='<%# Bind("PrincipalDesafio_Label") %>' />
                                    </td>
                                    <td ID="PrincipalDesafioTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("PrincipalDesafio_Apresenta") %>' align="left">
                                        <asp:Label ID="PrincipalDesafioLabel" runat="server" 
                                            Text='<%# Bind("PrincipalDesafio") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="RelacionamentoInternoTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("RelacionamentoInterno_Apresenta") %>' width="40%">
                                        <asp:Label ID="RelacionamentoInterno_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("RelacionamentoInterno_Label") %>' />
                                    </td>
                                    <td ID="RelacionamentoInternoTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("RelacionamentoInterno_Apresenta") %>' align="left">
                                        <asp:Label ID="RelacionamentoInternoLabel" runat="server" 
                                            Text='<%# Bind("RelacionamentoInterno") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="RelacionamentoExternoTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("RelacionamentoExterno_Apresenta") %>' width="40%">
                                        <asp:Label ID="RelacionamentoExterno_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("RelacionamentoExterno_Label") %>' />
                                    </td>
                                    <td ID="RelacionamentoExternoTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("RelacionamentoExterno_Apresenta") %>' align="left">
                                        <asp:Label ID="RelacionamentoExternoLabel" runat="server" 
                                            Text='<%# Bind("RelacionamentoExterno") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                                <tr>
                                    <td ID="infoSobre_viagensTD1" runat="server" align="right" 
                                        class="tableFormulario" valign="top" 
                                        visible='<%# Eval("infoSobre_viagens_Apresenta") %>' width="40%">
                                        <asp:Label ID="infoSobre_viagens_LabelLabel" runat="server" 
                                            CssClass="tituloEmp" Text='<%# Bind("infoSobre_viagens_Label") %>' />
                                    </td>
                                    <td ID="infoSobre_viagensTD2" runat="server" class="tableFormulario" 
                                        visible='<%# Eval("infoSobre_viagens_Apresenta") %>' align="left">
                                        <asp:Label ID="infoSobre_viagensLabel" runat="server" 
                                            Text='<%# Bind("infoSobre_viagens") %>' CssClass="textoResumoVAGA" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>
    </asp:Panel>
                    
            <br />
            <asp:SqlDataSource ID="SqlOutLookView" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="_USP_OUTLOOK_VAGA_GESTOR" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idCadastroEmpresa" 
                        SessionField="idCadastroEmpresa_Pai" Type="Int32" />
                    <asp:SessionParameter Name="idCadastroEmpresa_Filha" 
                        SessionField="idCadastroEmpresa_Filha" Type="Int32" />
                    <asp:Parameter DefaultValue="0" Name="idVagaAnuncioPREVIEW" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlOutLookViewMensagem" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="_USP_OUTLOOK_VAGA_GESTOR" 
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idCadastroEmpresa" 
                        SessionField="idCadastroEmpresa_Pai" Type="Int32" />
                    <asp:SessionParameter Name="idCadastroEmpresa_Filha" 
                        SessionField="idCadastroEmpresa_Filha" Type="Int32" />
                    <asp:ControlParameter ControlID="idVagaAnuncioPREVIEWLabel" 
                        Name="idVagaAnuncioPREVIEW" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourcePreviewVaga" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_PREVIEW_DO_ANUNCIO_VAGA_SELECT" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ProtocoloLabel" Name="Protocolo" 
                    PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        </td>
    </tr>
</table>
</asp:Content>

