<%@ Page Title="" Language="VB" MasterPageFile="~/_corporativo/corporativoPage.master" AutoEventWireup="true" CodeFile="pesquisaVaga.aspx.vb" Inherits="_corporativo_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../scripts/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../scripts/jquery.autocomplete.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var idSetup = '<%=Session("idSetup")%>';
            $("#<%=TextBoxPesquisaVAGA.ClientID%>").autocomplete("AutocompleteVagas.ashx?idSetup=" + idSetup, { autoFill: false });
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up"} });
        });
	</script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAvisoVAGA.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '160', position: "top", show: { effect: 'drop', direction: "up"} });
        });
	</script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelVAGA.ClientID%>").dialog({ closeText: '', width: '850', title: "Veja o anúncio da vaga", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
            if ($("#<%=PanelVAGA.ClientID%>").length > 0) {
                    $("body").height($("#<%=PanelVAGA.ClientID%>").height() + 50);
            }
            if ($("#<%=PanelEDITORANUNCIO.ClientID%>").length > 0) {
                $("body").height($("#<%=PanelEDITORANUNCIO.ClientID%>").height() + 100);
            }
        });
	</script>
    
<style type="text/css">
   
.InputCad
{
	background-color: #f0f0f0;
	font-size: 8pt;
	color: #000000;
	font-family: Verdana;
	text-decoration: none;
	border-right: #cccccc 1px solid;
	border-top: #cccccc 1px solid;
	border-left: #cccccc 1px solid;
	border-bottom: #cccccc 1px solid;
	padding-top: 3px;
	padding-right: 1px;
	padding-left: 3px;
	padding-bottom: 1px;
	margin: 0px;
	font-weight: normal;
	width: 350px;
	height: 16px;
}

.InputCad
{
	background-color: #f0f0f0;
	font-size: 8pt;
	color: #000000;
	font-family: Verdana;
	text-decoration: none;
	border-right: #cccccc 1px solid;
	border-top: #cccccc 1px solid;
	border-left: #cccccc 1px solid;
	border-bottom: #cccccc 1px solid;
	padding-top: 3px;
	padding-right: 1px;
	padding-left: 3px;
	padding-bottom: 1px;
	margin: 0px;
	font-weight: normal;
	width: 350px;
	height: 16px;
}
    .auto-style1 {
        width: 132px;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
                <asp:Panel ID="PanelAvisoVAGA" runat="server" Visible="False">
                    <table id="Table1" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center" valign="top">
                                <asp:Image ID="imagemAVISOVAGALABEL" runat="server" 
                                    ImageUrl="~/_corporativo/images/buttonOK.png" />
                            </td>
                            <td align="center" class="auto-style1">
                                <asp:Label ID="AVISOVAGALABEL" runat="server" CssClass="msnOK"></asp:Label>
                                <br />
                                <br />
                                <asp:LinkButton ID="LinkButtonContinuar" runat="server" CssClass="button" 
                                    ToolTip="Desejo continuar com a manutenção deste anúncio.">Continuar</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_corporativo/images/buttonOK.png" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABEL" runat="server" CssClass="msnOK"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>



   <table cellpadding="0" cellspacing="0" align="center" width="100%">
            <tr>
                <td>
                    <br />
                    <table cellpadding="0" cellspacing="0" id="BodyInterno" width="900px" align="center">
                        <tr>
                            <td align="left">
                                <asp:Panel ID="PanelEDITORANUNCIO" runat="server" CssClass="EditorVAGAxxx" 
                                    Visible="False">
                                    <table cellpadding="0" cellspacing="0" ID="EDITORANUNCIO" width="100%" 
                                        align="center">
                                        <tr>
                                            <td>
                                                <table ID="CORPOEDITOR" cellpadding="10" cellspacing="10" width="850px" 
                                                    align="center">
                                                    <tr>
                                                        <td align="center">
                                                            <table ID="FECHAREDITOR" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="left">
                                                                        <asp:Label ID="LabelEDITOR" runat="server" CssClass="h1" 
                                                                            Text="Editor de Anúncios"></asp:Label>
                                                                        <br />
                                                                    </td>
                                                                    <td align="right">
                                                                        &nbsp;</td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                            <table ID="EDITOR" cellpadding="0" cellspacing="0" width="800px">
                                                                <tr>
                                                                    <td align="left">
                                                                        <asp:FormView ID="FormViewEDITAVAGA" runat="server" DataSourceID="SqlEDITAVAGA" 
                                                                            DefaultMode="Edit" Width="100%">
                                                                            <EditItemTemplate>
                                                                                <table ID="EDITORVAGAPRIMEIRA" align="center" cellpadding="0" cellspacing="0" 
                                                                                    width="700">
                                                                                    <tr>
                                                                                        <td align="left">
                                                                                            &nbsp;<br />
                                                                                            <table ID="NAVEGADOR" cellpadding="0" cellspacing="0" width="100%">
                                                                                                <tr>
                                                                                                    <td align="right">
                                                                                                        <asp:LinkButton ID="UpdateButton0" runat="server" CausesValidation="True" 
                                                                                                            CommandName="Update" CssClass="button" Text="Salvar" 
                                                                                                            ToolTip="Clique aqui para salvar as alterações feitas" />
                                                                                                        <asp:LinkButton ID="UpdateCancelButton0" runat="server" 
                                                                                                            CausesValidation="False" CssClass="button" onclick="UpdateCancelButton_Click" 
                                                                                                            Text="Fechar Editor" 
                                                                                                            
                                                                                                            ToolTip="Clique aqui para cancelar as alterações feitas e fechar o editor de vagas" />
                                                                                                    </td> 
                                                                                                </tr>
                                                                                            </table>
                                                                                            <br />
                                                                                            <br />
                                                                                            <table ID="EDITOR" cellpadding="2" cellspacing="2" width="100%">
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <asp:TextBox ID="ProtocoloTextBox" runat="server" 
                                                                                                            CssClass="InputCadFormCandidatoCV" Enabled="False" 
                                                                                                            Text='<%# Bind("Protocolo") %>' Width="520px" />
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("pne") %>' 
                                                                                                            CssClass="InputCadFormCandidatoCV" Text="Vaga para PNE" Width="520px" />
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS0" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes0" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes1" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes2" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="FormacaoAcademica_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" 
                                                                                                                        Text='<%# Bind("FormacaoAcademica_Label") %>' Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:DropDownList ID="DropDownListFORMACAO" runat="server" 
                                                                                                                        CssClass="DropCadFormCandidatoCV" DataSourceID="sqlFORMACAO" 
                                                                                                                        DataTextField="dsTipoFormacao" DataValueField="dsTipoFormacao" 
                                                                                                                        SelectedValue='<%# Bind("FormacaoAcademica") %>' Width="250px">
                                                                                                                    </asp:DropDownList>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("FormacaoAcademica_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS1" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes3" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes4" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes5" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="dsPerfilVaga_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("dsPerfilVaga_Label") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="dsPerfilVagaTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("dsPerfilVaga") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("dsPerfilVaga_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS2" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes6" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes7" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes8" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="Cargo_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("Cargo_Label") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="CargoTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("Cargo") %>' Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList3" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("Cargo_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS3" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes9" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes10" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes11" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="nrovaga_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("nrovaga_Label") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="nrovagaTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("nrovaga") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList4" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("nrovaga_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS4" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes12" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes13" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes14" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="nmresponsavel_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("nmresponsavel_Label") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="nmresponsavelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("nmresponsavel") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList5" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("nmresponsavel_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS5" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes15" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes16" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes17" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="TipoOportunidade_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("TipoOportunidade_Label") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:DropDownList ID="DropDownListTipoVaga" runat="server" 
                                                                                                                        AppendDataBoundItems="True" CssClass="DropCadFormCandidatoCV" 
                                                                                                                        DataSourceID="SqlTipoVaga" DataTextField="dsTipoVAga" 
                                                                                                                        DataValueField="dsTipoVAga" SelectedValue='<%# Bind("TipoOportunidade") %>' 
                                                                                                                        Width="250px">
                                                                                                                        <asp:ListItem Value=" ">-- Selecione --</asp:ListItem>
                                                                                                                    </asp:DropDownList>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList6" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("TipoOportunidade_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS6" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes18" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes19" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes20" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    <asp:TextBox ID="QualificacaoHabilidadesEspecificas_LabelTextBox" 
                                                                                                                        runat="server" CssClass="InputCadFormCandidatoCV" 
                                                                                                                        Text='<%# Bind("QualificacaoHabilidadesEspecificas_Label") %>' Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="QualificacaoHabilidadesEspecificasTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                                                                        Text='<%# Bind("QualificacaoHabilidadesEspecificas") %>' TextMode="MultiLine" 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList7" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("QualificacaoHabilidadesEspecificas_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS7" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes21" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes22" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes23" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="Remuneracao_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("Remuneracao_Label") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="RemuneracaoTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("Remuneracao", "{0:N2}") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList8" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("Remuneracao_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td class="style1">
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS8" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes24" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes25" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes26" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="RemuneracaoVariavel_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" 
                                                                                                                        Text='<%# Bind("RemuneracaoVariavel_Label") %>' Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="RemuneracaoVariavelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("RemuneracaoVariavel", "{0:N2}") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList9" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("RemuneracaoVariavel_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td class="style1">
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS9" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes27" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes28" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes29" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="Honorario_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("Honorario_Label") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="HonorarioTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("Honorario", "{0:N2}") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList10" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("Honorario_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS10" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes30" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes31" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes32" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="LocalTrabalho_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("LocalTrabalho_Label") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="LocalTrabalhoTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("LocalTrabalho") %>' 
                                                                                                                        Width="200px" />
                                                                                                                    <asp:DropDownList ID="DropDownListUF" runat="server" 
                                                                                                                        CssClass="DropCadFormCandidatoCV" DataSourceID="SqlUF" DataTextField="uf" 
                                                                                                                        DataValueField="uf" SelectedValue='<%# Bind("UF") %>' Width="50px">
                                                                                                                    </asp:DropDownList>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList11" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("LocalTrabalho_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS11" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes33" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes34" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes35" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    <asp:TextBox ID="ObsComplementares_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" 
                                                                                                                        Text='<%# Bind("ObsComplementares_Label") %>' Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="ObsComplementaresTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                                                                        Text='<%# Bind("ObsComplementares") %>' TextMode="MultiLine" Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList12" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("ObsComplementares_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS12" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes36" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes37" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes38" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    <asp:TextBox ID="Beneficios_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("Beneficios_Label") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="BeneficiosTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                                                                        Text='<%# Bind("Beneficios") %>' TextMode="MultiLine" Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList13" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("Beneficios_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS13" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes39" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes40" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes41" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    <asp:TextBox ID="Perspectiva_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("Perspectiva_Label") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="PerspectivaTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                                                                        Text='<%# Bind("Perspectiva") %>' TextMode="MultiLine" Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList14" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("Perspectiva_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS14" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes42" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes43" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes44" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="FaixaEtariaInicio_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" 
                                                                                                                        Text='<%# Bind("FaixaEtariaInicio_Label") %>' Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="FaixaEtariaInicioTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("FaixaEtariaInicio") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList15" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("FaixaEtariaInicio_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS15" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes45" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes46" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes47" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="FaixaEtariaFim_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("FaixaEtariaFim_Label") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="FaixaEtariaFimTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("FaixaEtariaFim") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList16" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("FaixaEtariaFim_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS16" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes48" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes49" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes50" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="Sexo_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("Sexo_Label") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:DropDownList ID="DropDownListSEXO" runat="server" 
                                                                                                                        CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Sexo") %>' 
                                                                                                                        Width="250px">
                                                                                                                        <asp:ListItem>Masculino</asp:ListItem>
                                                                                                                        <asp:ListItem>Feminino</asp:ListItem>
                                                                                                                        <asp:ListItem>Indiferente</asp:ListItem>
                                                                                                                    </asp:DropDownList>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList17" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("Sexo_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS17" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes51" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes52" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes53" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    <asp:TextBox ID="ConhecimentoIdioma_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" 
                                                                                                                        Text='<%# Bind("ConhecimentoIdioma_Label") %>' Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="ConhecimentoIdiomaTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                                                                        Text='<%# Bind("ConhecimentoIdioma") %>' TextMode="MultiLine" Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList18" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("ConhecimentoIdioma_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS18" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes54" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes55" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes56" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    <asp:TextBox ID="PerfilComposicaoEquipe_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" 
                                                                                                                        Text='<%# Bind("PerfilComposicaoEquipe_Label") %>' Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="PerfilComposicaoEquipeTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                                                                        Text='<%# Bind("PerfilComposicaoEquipe") %>' TextMode="MultiLine" 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList19" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("PerfilComposicaoEquipe_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS19" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes57" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes58" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes59" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    <asp:TextBox ID="PerfilGestor_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("PerfilGestor_Label") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="PerfilGestorTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                                                                        Text='<%# Bind("PerfilGestor") %>' TextMode="MultiLine" Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList20" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("PerfilGestor_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS20" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes60" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes61" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes62" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    <asp:TextBox ID="CursoEspecifico_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("CursoEspecifico_Label") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="CursoEspecificoTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                                                                        Text='<%# Bind("CursoEspecifico") %>' TextMode="MultiLine" Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList21" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("CursoEspecifico_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS21" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes63" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes64" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes65" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    <asp:TextBox ID="Conhecimento_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("Conhecimento_Label") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="ConhecimentoTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                                                                        Text='<%# Bind("Conhecimento") %>' TextMode="MultiLine" Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList22" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("Conhecimento_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS22" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes66" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes67" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes68" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    <asp:TextBox ID="ConhecimentoInformatica_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" 
                                                                                                                        Text='<%# Bind("ConhecimentoInformatica_Label") %>' Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="ConhecimentoInformaticaTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                                                                        Text='<%# Bind("ConhecimentoInformatica") %>' TextMode="MultiLine" 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList23" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("ConhecimentoInformatica_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS23" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes69" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes70" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes71" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    <asp:TextBox ID="CompetenciaComportamental_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" 
                                                                                                                        Text='<%# Bind("CompetenciaComportamental_Label") %>' Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="CompetenciaComportamentalTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                                                                        Text='<%# Bind("CompetenciaComportamental") %>' TextMode="MultiLine" 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList24" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("CompetenciaComportamental_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS24" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes72" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes73" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes74" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    <asp:TextBox ID="CompetenciaProfissional_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" 
                                                                                                                        Text='<%# Bind("CompetenciaProfissional_Label") %>' Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="CompetenciaProfissionalTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                                                                        Text='<%# Bind("CompetenciaProfissional") %>' TextMode="MultiLine" 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList25" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("CompetenciaProfissional_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS25" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes75" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes76" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes77" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    <asp:TextBox ID="AspectoCritico_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("AspectoCritico_Label") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="AspectoCriticoTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                                                                        Text='<%# Bind("AspectoCritico") %>' TextMode="MultiLine" Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList26" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("AspectoCritico_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS26" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes78" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes79" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes80" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    <asp:TextBox ID="PrincipalDesafio_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("PrincipalDesafio_Label") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="PrincipalDesafioTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                                                                        Text='<%# Bind("PrincipalDesafio") %>' TextMode="MultiLine" Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList27" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("PrincipalDesafio_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS27" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes81" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes82" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes83" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    <asp:TextBox ID="RelacionamentoInterno_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" 
                                                                                                                        Text='<%# Bind("RelacionamentoInterno_Label") %>' Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="RelacionamentoInternoTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                                                                        Text='<%# Bind("RelacionamentoInterno") %>' TextMode="MultiLine" 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList28" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("RelacionamentoInterno_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS28" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes84" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes85" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes86" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    <asp:TextBox ID="RelacionamentoExterno_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" 
                                                                                                                        Text='<%# Bind("RelacionamentoExterno_Label") %>' Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="RelacionamentoExternoTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                                                                        Text='<%# Bind("RelacionamentoExterno") %>' TextMode="MultiLine" 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList29" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("RelacionamentoExterno_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS29" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes87" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes88" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes89" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                                                                                        Text='<%# Bind("viagens_Label") %>' Width="250px"></asp:TextBox>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:DropDownList ID="VIAGENS" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" SelectedValue='<%# Bind("viagens") %>' 
                                                                                                                        Width="250px">
                                                                                                                        <asp:ListItem Value="1">Disponível para viagens</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Indiferente</asp:ListItem>
                                                                                                                    </asp:DropDownList>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList30" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("viagens_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS30" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes90" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes91" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes92" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                    <asp:TextBox ID="infoSobre_viagens_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" 
                                                                                                                        Text='<%# Bind("infoSobre_viagens_Label") %>' Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="infoSobre_viagensTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Height="80px" 
                                                                                                                        Text='<%# Bind("infoSobre_viagens") %>' TextMode="MultiLine" Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList31" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("infoSobre_viagens_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <table ID="ITENS31" cellpadding="2" cellspacing="2" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes93" runat="server" Text="Apresentação:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="LabelRes94" runat="server" Text="Conteúdo:"></asp:Label>
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:Label ID="LabelRes95" runat="server" Text="Publicação:"></asp:Label>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="confidencial_LabelTextBox" runat="server" 
                                                                                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("confidencial_Label") %>' 
                                                                                                                        Width="250px" />
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:CheckBox ID="confidencialCheckBox" runat="server" 
                                                                                                                        Checked='<%# Bind("confidencial") %>' CssClass="InputCadFormCandidatoCV" 
                                                                                                                        Text="Confidencial" Width="250px" />
                                                                                                                </td>
                                                                                                                <td bgcolor="Ivory">
                                                                                                                    <asp:RadioButtonList ID="RadioButtonList32" runat="server" 
                                                                                                                        SelectedValue='<%# Bind("confidencial_Apresenta") %>'>
                                                                                                                        <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                                                                                                        <asp:ListItem Value="0">Não apresentar</asp:ListItem>
                                                                                                                    </asp:RadioButtonList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                    <td>
                                                                                                        <asp:Label ID="nomeLabel" runat="server" Text="Nome do contato:"></asp:Label>
                                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" 
                                                                                                            ControlToValidate="nomeTextBox" ErrorMessage="Informe o nome do contato." 
                                                                                                            ValidationGroup="PerfilVagaFormMSN">•</asp:RequiredFieldValidator>
                                                                                                        <br />
                                                                                                        <asp:TextBox ID="nomeTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                                                                            Width="100%"></asp:TextBox>
                                                                                                        <br />
                                                                                                        <asp:Label ID="emailLabel" runat="server" Text="Email:"></asp:Label>
                                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" 
                                                                                                            ControlToValidate="emailTextBox" 
                                                                                                            ErrorMessage="Informe o e-mail que irá receber os dados da atualização." 
                                                                                                            ValidationGroup="PerfilVagaFormMSN">•</asp:RequiredFieldValidator>
                                                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                                                                            ControlToValidate="emailTextBox" ErrorMessage="Informe um e-mail válido." 
                                                                                                            ValidationGroup="PerfilVagaFormMSN" 
                                                                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">•</asp:RegularExpressionValidator>
                                                                                                        <br />
                                                                                                        <asp:TextBox ID="emailTextBox" runat="server" 
                                                                                                            CssClass="InputCadFormCandidatoCV" ValidationGroup="PerfilVagaFormMSN" 
                                                                                                            Width="100%"></asp:TextBox>
                                                                                                        <br />
                                                                                                        <asp:Label ID="InfoEmailMensagemLabel" runat="server" 
                                                                                                            Text="Mensagem para envio de e-mail:"></asp:Label>
                                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" 
                                                                                                            ControlToValidate="msnTextBox" 
                                                                                                            ErrorMessage="Se deseja salvar e enviar e-mail sobre esta atualização informe a mensagem." 
                                                                                                            ValidationGroup="PerfilVagaFormMSN">•</asp:RequiredFieldValidator>
                                                                                                        <br />
                                                                                                        <asp:TextBox ID="msnTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                                                                            Height="150px" TextMode="MultiLine" ValidationGroup="PerfilVagaFormMSN" 
                                                                                                            Width="100%"></asp:TextBox>
                                                                                                        <asp:ValidationSummary ID="ValidationSummary3" runat="server" 
                                                                                                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="PerfilVagaFormMSN" />
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                <asp:Label ID="idVagaAnuncioLabel1" runat="server" 
                                                                                    Text='<%# Eval("idVagaAnuncio") %>' Visible="False" />
                                                                                <asp:Label ID="idVagaLabel1" runat="server" Text='<%# Eval("idVaga") %>' 
                                                                                    Visible="False" />
                                                                                <asp:Label ID="idPerfilVagaLabel" runat="server" 
                                                                                    Text='<%# Eval("idPerfilVaga") %>' Visible="False"></asp:Label>
                                                                                <br />
                                                                                <br />
                                                                                <table ID="OutLookPerfil" runat="server" cellpadding="0" cellspacing="0" 
                                                                                    visible="false" width="100%">
                                                                                    <tr>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                    </tr>
                                                                                </table>
                                                                                <br />
                                                                                <br />
                                                                                <table ID="NAVEGADOR1" cellpadding="0" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            <asp:LinkButton ID="UpdateButton1" runat="server" CausesValidation="True" 
                                                                                                CommandName="Update" CssClass="button" Text="Salvar" 
                                                                                                ToolTip="Clique aqui para salvar as alterações feitas" />
                                                                                            <asp:LinkButton ID="SalvaEnviarEmail" runat="server" CommandName="Update" 
                                                                                                CssClass="button" onclick="SalvaEnviarEmail_Click" 
                                                                                                ToolTip="Clique aqui para salvar e enviar mensagem sobre as alterações feitas" 
                                                                                                ValidationGroup="PerfilVagaFormMSN">Salvar e enviar e-mail sobre as alterações</asp:LinkButton>
                                                                                            <asp:LinkButton ID="UpdateCancelButton1" runat="server" 
                                                                                                CausesValidation="False" CssClass="button" onclick="UpdateCancelButton_Click" 
                                                                                                Text="Fechar Editor" 
                                                                                                
                                                                                                ToolTip="Clique aqui para cancelar as alterações feitas e fechar o editor de vagas" />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                &nbsp;
                                                                            </EditItemTemplate>
                                                                            <InsertItemTemplate>
                                                                                Protocolo:
                                                                                <asp:TextBox ID="ProtocoloTextBox" runat="server" 
                                                                                    Text='<%# Bind("Protocolo") %>' />
                                                                                <br />
                                                                                pne:
                                                                                <asp:TextBox ID="pneTextBox" runat="server" Text='<%# Bind("pne") %>' />
                                                                                <br />
                                                                                FormacaoAcademica_Label:
                                                                                <asp:TextBox ID="FormacaoAcademica_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("FormacaoAcademica_Label") %>' />
                                                                                <br />
                                                                                FormacaoAcademica:
                                                                                <asp:TextBox ID="FormacaoAcademicaTextBox" runat="server" 
                                                                                    Text='<%# Bind("FormacaoAcademica") %>' />
                                                                                <br />
                                                                                FormacaoAcademica_Apresenta:
                                                                                <asp:TextBox ID="FormacaoAcademica_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("FormacaoAcademica_Apresenta") %>' />
                                                                                <br />
                                                                                dsPerfilVaga_Label:
                                                                                <asp:TextBox ID="dsPerfilVaga_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("dsPerfilVaga_Label") %>' />
                                                                                <br />
                                                                                dsPerfilVaga:
                                                                                <asp:TextBox ID="dsPerfilVagaTextBox" runat="server" 
                                                                                    Text='<%# Bind("dsPerfilVaga") %>' />
                                                                                <br />
                                                                                dsPerfilVaga_Apresenta:
                                                                                <asp:TextBox ID="dsPerfilVaga_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("dsPerfilVaga_Apresenta") %>' />
                                                                                <br />
                                                                                Cargo_Label:
                                                                                <asp:TextBox ID="Cargo_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("Cargo_Label") %>' />
                                                                                <br />
                                                                                Cargo:
                                                                                <asp:TextBox ID="CargoTextBox" runat="server" Text='<%# Bind("Cargo") %>' />
                                                                                <br />
                                                                                Cargo_Apresenta:
                                                                                <asp:TextBox ID="Cargo_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("Cargo_Apresenta") %>' />
                                                                                <br />
                                                                                nrovaga_Label:
                                                                                <asp:TextBox ID="nrovaga_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("nrovaga_Label") %>' />
                                                                                <br />
                                                                                nrovaga:
                                                                                <asp:TextBox ID="nrovagaTextBox" runat="server" Text='<%# Bind("nrovaga") %>' />
                                                                                <br />
                                                                                nrovaga_Apresenta:
                                                                                <asp:TextBox ID="nrovaga_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("nrovaga_Apresenta") %>' />
                                                                                <br />
                                                                                nmresponsavel_Label:
                                                                                <asp:TextBox ID="nmresponsavel_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("nmresponsavel_Label") %>' />
                                                                                <br />
                                                                                nmresponsavel:
                                                                                <asp:TextBox ID="nmresponsavelTextBox" runat="server" 
                                                                                    Text='<%# Bind("nmresponsavel") %>' />
                                                                                <br />
                                                                                nmresponsavel_Apresenta:
                                                                                <asp:TextBox ID="nmresponsavel_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("nmresponsavel_Apresenta") %>' />
                                                                                <br />
                                                                                TipoOportunidade_Label:
                                                                                <asp:TextBox ID="TipoOportunidade_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("TipoOportunidade_Label") %>' />
                                                                                <br />
                                                                                TipoOportunidade:
                                                                                <asp:TextBox ID="TipoOportunidadeTextBox" runat="server" 
                                                                                    Text='<%# Bind("TipoOportunidade") %>' />
                                                                                <br />
                                                                                TipoOportunidade_Apresenta:
                                                                                <asp:TextBox ID="TipoOportunidade_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("TipoOportunidade_Apresenta") %>' />
                                                                                <br />
                                                                                QualificacaoHabilidadesEspecificas_Label:
                                                                                <asp:TextBox ID="QualificacaoHabilidadesEspecificas_LabelTextBox" 
                                                                                    runat="server" Text='<%# Bind("QualificacaoHabilidadesEspecificas_Label") %>' />
                                                                                <br />
                                                                                QualificacaoHabilidadesEspecificas:
                                                                                <asp:TextBox ID="QualificacaoHabilidadesEspecificasTextBox" runat="server" 
                                                                                    Text='<%# Bind("QualificacaoHabilidadesEspecificas") %>' />
                                                                                <br />
                                                                                QualificacaoHabilidadesEspecificas_Apresenta:
                                                                                <asp:TextBox ID="QualificacaoHabilidadesEspecificas_ApresentaTextBox" 
                                                                                    runat="server" 
                                                                                    Text='<%# Bind("QualificacaoHabilidadesEspecificas_Apresenta") %>' />
                                                                                <br />
                                                                                Remuneracao_Label:
                                                                                <asp:TextBox ID="Remuneracao_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("Remuneracao_Label") %>' />
                                                                                <br />
                                                                                Remuneracao:
                                                                                <asp:TextBox ID="RemuneracaoTextBox" runat="server" 
                                                                                    Text='<%# Bind("Remuneracao") %>' />
                                                                                <br />
                                                                                Remuneracao_Apresenta:
                                                                                <asp:TextBox ID="Remuneracao_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("Remuneracao_Apresenta") %>' />
                                                                                <br />
                                                                                RemuneracaoVariavel_Label:
                                                                                <asp:TextBox ID="RemuneracaoVariavel_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("RemuneracaoVariavel_Label") %>' />
                                                                                <br />
                                                                                RemuneracaoVariavel:
                                                                                <asp:TextBox ID="RemuneracaoVariavelTextBox" runat="server" 
                                                                                    Text='<%# Bind("RemuneracaoVariavel") %>' />
                                                                                <br />
                                                                                RemuneracaoVariavel_Apresenta:
                                                                                <asp:TextBox ID="RemuneracaoVariavel_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("RemuneracaoVariavel_Apresenta") %>' />
                                                                                <br />
                                                                                Honorario_Label:
                                                                                <asp:TextBox ID="Honorario_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("Honorario_Label") %>' />
                                                                                <br />
                                                                                Honorario:
                                                                                <asp:TextBox ID="HonorarioTextBox" runat="server" 
                                                                                    Text='<%# Bind("Honorario") %>' />
                                                                                <br />
                                                                                Honorario_Apresenta:
                                                                                <asp:TextBox ID="Honorario_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("Honorario_Apresenta") %>' />
                                                                                <br />
                                                                                LocalTrabalho_Label:
                                                                                <asp:TextBox ID="LocalTrabalho_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("LocalTrabalho_Label") %>' />
                                                                                <br />
                                                                                LocalTrabalho:
                                                                                <asp:TextBox ID="LocalTrabalhoTextBox" runat="server" 
                                                                                    Text='<%# Bind("LocalTrabalho") %>' />
                                                                                <br />
                                                                                LocalTrabalho_Apresenta:
                                                                                <asp:TextBox ID="LocalTrabalho_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("LocalTrabalho_Apresenta") %>' />
                                                                                <br />
                                                                                ObsComplementares_Label:
                                                                                <asp:TextBox ID="ObsComplementares_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("ObsComplementares_Label") %>' />
                                                                                <br />
                                                                                ObsComplementares:
                                                                                <asp:TextBox ID="ObsComplementaresTextBox" runat="server" 
                                                                                    Text='<%# Bind("ObsComplementares") %>' />
                                                                                <br />
                                                                                ObsComplementares_Apresenta:
                                                                                <asp:TextBox ID="ObsComplementares_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("ObsComplementares_Apresenta") %>' />
                                                                                <br />
                                                                                Beneficios_Label:
                                                                                <asp:TextBox ID="Beneficios_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("Beneficios_Label") %>' />
                                                                                <br />
                                                                                Beneficios:
                                                                                <asp:TextBox ID="BeneficiosTextBox" runat="server" 
                                                                                    Text='<%# Bind("Beneficios") %>' />
                                                                                <br />
                                                                                Beneficios_Apresenta:
                                                                                <asp:TextBox ID="Beneficios_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("Beneficios_Apresenta") %>' />
                                                                                <br />
                                                                                Perspectiva_Label:
                                                                                <asp:TextBox ID="Perspectiva_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("Perspectiva_Label") %>' />
                                                                                <br />
                                                                                Perspectiva:
                                                                                <asp:TextBox ID="PerspectivaTextBox" runat="server" 
                                                                                    Text='<%# Bind("Perspectiva") %>' />
                                                                                <br />
                                                                                Perspectiva_Apresenta:
                                                                                <asp:TextBox ID="Perspectiva_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("Perspectiva_Apresenta") %>' />
                                                                                <br />
                                                                                FaixaEtariaInicio_Label:
                                                                                <asp:TextBox ID="FaixaEtariaInicio_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("FaixaEtariaInicio_Label") %>' />
                                                                                <br />
                                                                                FaixaEtariaInicio:
                                                                                <asp:TextBox ID="FaixaEtariaInicioTextBox" runat="server" 
                                                                                    Text='<%# Bind("FaixaEtariaInicio") %>' />
                                                                                <br />
                                                                                FaixaEtariaInicio_Apresenta:
                                                                                <asp:TextBox ID="FaixaEtariaInicio_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("FaixaEtariaInicio_Apresenta") %>' />
                                                                                <br />
                                                                                FaixaEtariaFim_Label:
                                                                                <asp:TextBox ID="FaixaEtariaFim_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("FaixaEtariaFim_Label") %>' />
                                                                                <br />
                                                                                FaixaEtariaFim:
                                                                                <asp:TextBox ID="FaixaEtariaFimTextBox" runat="server" 
                                                                                    Text='<%# Bind("FaixaEtariaFim") %>' />
                                                                                <br />
                                                                                FaixaEtariaFim_Apresenta:
                                                                                <asp:TextBox ID="FaixaEtariaFim_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("FaixaEtariaFim_Apresenta") %>' />
                                                                                <br />
                                                                                Sexo_Label:
                                                                                <asp:TextBox ID="Sexo_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("Sexo_Label") %>' />
                                                                                <br />
                                                                                Sexo:
                                                                                <asp:TextBox ID="SexoTextBox" runat="server" Text='<%# Bind("Sexo") %>' />
                                                                                <br />
                                                                                Sexo_Apresenta:
                                                                                <asp:TextBox ID="Sexo_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("Sexo_Apresenta") %>' />
                                                                                <br />
                                                                                ConhecimentoIdioma_Label:
                                                                                <asp:TextBox ID="ConhecimentoIdioma_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("ConhecimentoIdioma_Label") %>' />
                                                                                <br />
                                                                                ConhecimentoIdioma:
                                                                                <asp:TextBox ID="ConhecimentoIdiomaTextBox" runat="server" 
                                                                                    Text='<%# Bind("ConhecimentoIdioma") %>' />
                                                                                <br />
                                                                                ConhecimentoIdioma_Apresenta:
                                                                                <asp:TextBox ID="ConhecimentoIdioma_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("ConhecimentoIdioma_Apresenta") %>' />
                                                                                <br />
                                                                                PerfilComposicaoEquipe_Label:
                                                                                <asp:TextBox ID="PerfilComposicaoEquipe_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("PerfilComposicaoEquipe_Label") %>' />
                                                                                <br />
                                                                                PerfilComposicaoEquipe:
                                                                                <asp:TextBox ID="PerfilComposicaoEquipeTextBox" runat="server" 
                                                                                    Text='<%# Bind("PerfilComposicaoEquipe") %>' />
                                                                                <br />
                                                                                PerfilComposicaoEquipe_Apresenta:
                                                                                <asp:TextBox ID="PerfilComposicaoEquipe_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("PerfilComposicaoEquipe_Apresenta") %>' />
                                                                                <br />
                                                                                PerfilGestor_Label:
                                                                                <asp:TextBox ID="PerfilGestor_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("PerfilGestor_Label") %>' />
                                                                                <br />
                                                                                PerfilGestor:
                                                                                <asp:TextBox ID="PerfilGestorTextBox" runat="server" 
                                                                                    Text='<%# Bind("PerfilGestor") %>' />
                                                                                <br />
                                                                                PerfilGestor_Apresenta:
                                                                                <asp:TextBox ID="PerfilGestor_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("PerfilGestor_Apresenta") %>' />
                                                                                <br />
                                                                                CursoEspecifico_Label:
                                                                                <asp:TextBox ID="CursoEspecifico_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("CursoEspecifico_Label") %>' />
                                                                                <br />
                                                                                CursoEspecifico:
                                                                                <asp:TextBox ID="CursoEspecificoTextBox" runat="server" 
                                                                                    Text='<%# Bind("CursoEspecifico") %>' />
                                                                                <br />
                                                                                CursoEspecifico_Apresenta:
                                                                                <asp:TextBox ID="CursoEspecifico_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("CursoEspecifico_Apresenta") %>' />
                                                                                <br />
                                                                                Conhecimento_Label:
                                                                                <asp:TextBox ID="Conhecimento_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("Conhecimento_Label") %>' />
                                                                                <br />
                                                                                Conhecimento:
                                                                                <asp:TextBox ID="ConhecimentoTextBox" runat="server" 
                                                                                    Text='<%# Bind("Conhecimento") %>' />
                                                                                <br />
                                                                                Conhecimento_Apresenta:
                                                                                <asp:TextBox ID="Conhecimento_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("Conhecimento_Apresenta") %>' />
                                                                                <br />
                                                                                ConhecimentoInformatica_Label:
                                                                                <asp:TextBox ID="ConhecimentoInformatica_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("ConhecimentoInformatica_Label") %>' />
                                                                                <br />
                                                                                ConhecimentoInformatica:
                                                                                <asp:TextBox ID="ConhecimentoInformaticaTextBox" runat="server" 
                                                                                    Text='<%# Bind("ConhecimentoInformatica") %>' />
                                                                                <br />
                                                                                ConhecimentoInformatica_Apresenta:
                                                                                <asp:TextBox ID="ConhecimentoInformatica_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("ConhecimentoInformatica_Apresenta") %>' />
                                                                                <br />
                                                                                CompetenciaComportamental_Label:
                                                                                <asp:TextBox ID="CompetenciaComportamental_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("CompetenciaComportamental_Label") %>' />
                                                                                <br />
                                                                                CompetenciaComportamental:
                                                                                <asp:TextBox ID="CompetenciaComportamentalTextBox" runat="server" 
                                                                                    Text='<%# Bind("CompetenciaComportamental") %>' />
                                                                                <br />
                                                                                CompetenciaComportamental_Apresenta:
                                                                                <asp:TextBox ID="CompetenciaComportamental_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("CompetenciaComportamental_Apresenta") %>' />
                                                                                <br />
                                                                                CompetenciaProfissional_Label:
                                                                                <asp:TextBox ID="CompetenciaProfissional_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("CompetenciaProfissional_Label") %>' />
                                                                                <br />
                                                                                CompetenciaProfissional:
                                                                                <asp:TextBox ID="CompetenciaProfissionalTextBox" runat="server" 
                                                                                    Text='<%# Bind("CompetenciaProfissional") %>' />
                                                                                <br />
                                                                                CompetenciaProfissional_Apresenta:
                                                                                <asp:TextBox ID="CompetenciaProfissional_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("CompetenciaProfissional_Apresenta") %>' />
                                                                                <br />
                                                                                AspectoCritico_Label:
                                                                                <asp:TextBox ID="AspectoCritico_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("AspectoCritico_Label") %>' />
                                                                                <br />
                                                                                AspectoCritico:
                                                                                <asp:TextBox ID="AspectoCriticoTextBox" runat="server" 
                                                                                    Text='<%# Bind("AspectoCritico") %>' />
                                                                                <br />
                                                                                AspectoCritico_Apresenta:
                                                                                <asp:TextBox ID="AspectoCritico_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("AspectoCritico_Apresenta") %>' />
                                                                                <br />
                                                                                PrincipalDesafio_Label:
                                                                                <asp:TextBox ID="PrincipalDesafio_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("PrincipalDesafio_Label") %>' />
                                                                                <br />
                                                                                PrincipalDesafio:
                                                                                <asp:TextBox ID="PrincipalDesafioTextBox" runat="server" 
                                                                                    Text='<%# Bind("PrincipalDesafio") %>' />
                                                                                <br />
                                                                                PrincipalDesafio_Apresenta:
                                                                                <asp:TextBox ID="PrincipalDesafio_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("PrincipalDesafio_Apresenta") %>' />
                                                                                <br />
                                                                                RelacionamentoInterno_Label:
                                                                                <asp:TextBox ID="RelacionamentoInterno_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("RelacionamentoInterno_Label") %>' />
                                                                                <br />
                                                                                RelacionamentoInterno:
                                                                                <asp:TextBox ID="RelacionamentoInternoTextBox" runat="server" 
                                                                                    Text='<%# Bind("RelacionamentoInterno") %>' />
                                                                                <br />
                                                                                RelacionamentoInterno_Apresenta:
                                                                                <asp:TextBox ID="RelacionamentoInterno_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("RelacionamentoInterno_Apresenta") %>' />
                                                                                <br />
                                                                                RelacionamentoExterno_Label:
                                                                                <asp:TextBox ID="RelacionamentoExterno_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("RelacionamentoExterno_Label") %>' />
                                                                                <br />
                                                                                RelacionamentoExterno:
                                                                                <asp:TextBox ID="RelacionamentoExternoTextBox" runat="server" 
                                                                                    Text='<%# Bind("RelacionamentoExterno") %>' />
                                                                                <br />
                                                                                RelacionamentoExterno_Apresenta:
                                                                                <asp:TextBox ID="RelacionamentoExterno_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("RelacionamentoExterno_Apresenta") %>' />
                                                                                <br />
                                                                                infoSobre_viagens_Label:
                                                                                <asp:TextBox ID="infoSobre_viagens_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("infoSobre_viagens_Label") %>' />
                                                                                <br />
                                                                                infoSobre_viagens:
                                                                                <asp:TextBox ID="infoSobre_viagensTextBox" runat="server" 
                                                                                    Text='<%# Bind("infoSobre_viagens") %>' />
                                                                                <br />
                                                                                infoSobre_viagens_Apresenta:
                                                                                <asp:TextBox ID="infoSobre_viagens_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("infoSobre_viagens_Apresenta") %>' />
                                                                                <br />
                                                                                confidencial_Label:
                                                                                <asp:TextBox ID="confidencial_LabelTextBox" runat="server" 
                                                                                    Text='<%# Bind("confidencial_Label") %>' />
                                                                                <br />
                                                                                confidencial:
                                                                                <asp:CheckBox ID="confidencialCheckBox" runat="server" 
                                                                                    Checked='<%# Bind("confidencial") %>' />
                                                                                <br />
                                                                                confidencial_Apresenta:
                                                                                <asp:TextBox ID="confidencial_ApresentaTextBox" runat="server" 
                                                                                    Text='<%# Bind("confidencial_Apresenta") %>' />
                                                                                <br />
                                                                                dsempresaVaga:
                                                                                <asp:TextBox ID="dsempresaVagaTextBox" runat="server" 
                                                                                    Text='<%# Bind("dsempresaVaga") %>' />
                                                                                <br />
                                                                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                                                                    CommandName="Insert" Text="Insert" />
                                                                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                                                                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                                                            </InsertItemTemplate>
                                                                            <ItemTemplate>
                                                                                idVagaAnuncio:
                                                                                <asp:Label ID="idVagaAnuncioLabel" runat="server" 
                                                                                    Text='<%# Eval("idVagaAnuncio") %>' />
                                                                                <br />
                                                                                Protocolo:
                                                                                <asp:Label ID="ProtocoloLabel" runat="server" Text='<%# Bind("Protocolo") %>' />
                                                                                <br />
                                                                                pne:
                                                                                <asp:Label ID="pneLabel" runat="server" Text='<%# Bind("pne") %>' />
                                                                                <br />
                                                                                FormacaoAcademica_Label:
                                                                                <asp:Label ID="FormacaoAcademica_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("FormacaoAcademica_Label") %>' />
                                                                                <br />
                                                                                FormacaoAcademica:
                                                                                <asp:Label ID="FormacaoAcademicaLabel" runat="server" 
                                                                                    Text='<%# Bind("FormacaoAcademica") %>' />
                                                                                <br />
                                                                                FormacaoAcademica_Apresenta:
                                                                                <asp:Label ID="FormacaoAcademica_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("FormacaoAcademica_Apresenta") %>' />
                                                                                <br />
                                                                                dsPerfilVaga_Label:
                                                                                <asp:Label ID="dsPerfilVaga_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("dsPerfilVaga_Label") %>' />
                                                                                <br />
                                                                                dsPerfilVaga:
                                                                                <asp:Label ID="dsPerfilVagaLabel" runat="server" 
                                                                                    Text='<%# Bind("dsPerfilVaga") %>' />
                                                                                <br />
                                                                                dsPerfilVaga_Apresenta:
                                                                                <asp:Label ID="dsPerfilVaga_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("dsPerfilVaga_Apresenta") %>' />
                                                                                <br />
                                                                                Cargo_Label:
                                                                                <asp:Label ID="Cargo_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("Cargo_Label") %>' />
                                                                                <br />
                                                                                Cargo:
                                                                                <asp:Label ID="CargoLabel" runat="server" Text='<%# Bind("Cargo") %>' />
                                                                                <br />
                                                                                Cargo_Apresenta:
                                                                                <asp:Label ID="Cargo_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("Cargo_Apresenta") %>' />
                                                                                <br />
                                                                                nrovaga_Label:
                                                                                <asp:Label ID="nrovaga_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("nrovaga_Label") %>' />
                                                                                <br />
                                                                                nrovaga:
                                                                                <asp:Label ID="nrovagaLabel" runat="server" Text='<%# Bind("nrovaga") %>' />
                                                                                <br />
                                                                                nrovaga_Apresenta:
                                                                                <asp:Label ID="nrovaga_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("nrovaga_Apresenta") %>' />
                                                                                <br />
                                                                                nmresponsavel_Label:
                                                                                <asp:Label ID="nmresponsavel_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("nmresponsavel_Label") %>' />
                                                                                <br />
                                                                                nmresponsavel:
                                                                                <asp:Label ID="nmresponsavelLabel" runat="server" 
                                                                                    Text='<%# Bind("nmresponsavel") %>' />
                                                                                <br />
                                                                                nmresponsavel_Apresenta:
                                                                                <asp:Label ID="nmresponsavel_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("nmresponsavel_Apresenta") %>' />
                                                                                <br />
                                                                                TipoOportunidade_Label:
                                                                                <asp:Label ID="TipoOportunidade_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("TipoOportunidade_Label") %>' />
                                                                                <br />
                                                                                TipoOportunidade:
                                                                                <asp:Label ID="TipoOportunidadeLabel" runat="server" 
                                                                                    Text='<%# Bind("TipoOportunidade") %>' />
                                                                                <br />
                                                                                TipoOportunidade_Apresenta:
                                                                                <asp:Label ID="TipoOportunidade_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("TipoOportunidade_Apresenta") %>' />
                                                                                <br />
                                                                                QualificacaoHabilidadesEspecificas_Label:
                                                                                <asp:Label ID="QualificacaoHabilidadesEspecificas_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("QualificacaoHabilidadesEspecificas_Label") %>' />
                                                                                <br />
                                                                                QualificacaoHabilidadesEspecificas:
                                                                                <asp:Label ID="QualificacaoHabilidadesEspecificasLabel" runat="server" 
                                                                                    Text='<%# Bind("QualificacaoHabilidadesEspecificas") %>' />
                                                                                <br />
                                                                                QualificacaoHabilidadesEspecificas_Apresenta:
                                                                                <asp:Label ID="QualificacaoHabilidadesEspecificas_ApresentaLabel" 
                                                                                    runat="server" 
                                                                                    Text='<%# Bind("QualificacaoHabilidadesEspecificas_Apresenta") %>' />
                                                                                <br />
                                                                                Remuneracao_Label:
                                                                                <asp:Label ID="Remuneracao_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("Remuneracao_Label") %>' />
                                                                                <br />
                                                                                Remuneracao:
                                                                                <asp:Label ID="RemuneracaoLabel" runat="server" 
                                                                                    Text='<%# Bind("Remuneracao") %>' />
                                                                                <br />
                                                                                Remuneracao_Apresenta:
                                                                                <asp:Label ID="Remuneracao_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("Remuneracao_Apresenta") %>' />
                                                                                <br />
                                                                                RemuneracaoVariavel_Label:
                                                                                <asp:Label ID="RemuneracaoVariavel_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("RemuneracaoVariavel_Label") %>' />
                                                                                <br />
                                                                                RemuneracaoVariavel:
                                                                                <asp:Label ID="RemuneracaoVariavelLabel" runat="server" 
                                                                                    Text='<%# Bind("RemuneracaoVariavel") %>' />
                                                                                <br />
                                                                                RemuneracaoVariavel_Apresenta:
                                                                                <asp:Label ID="RemuneracaoVariavel_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("RemuneracaoVariavel_Apresenta") %>' />
                                                                                <br />
                                                                                Honorario_Label:
                                                                                <asp:Label ID="Honorario_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("Honorario_Label") %>' />
                                                                                <br />
                                                                                Honorario:
                                                                                <asp:Label ID="HonorarioLabel" runat="server" Text='<%# Bind("Honorario") %>' />
                                                                                <br />
                                                                                Honorario_Apresenta:
                                                                                <asp:Label ID="Honorario_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("Honorario_Apresenta") %>' />
                                                                                <br />
                                                                                LocalTrabalho_Label:
                                                                                <asp:Label ID="LocalTrabalho_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("LocalTrabalho_Label") %>' />
                                                                                <br />
                                                                                LocalTrabalho:
                                                                                <asp:Label ID="LocalTrabalhoLabel" runat="server" 
                                                                                    Text='<%# Bind("LocalTrabalho") %>' />
                                                                                <br />
                                                                                LocalTrabalho_Apresenta:
                                                                                <asp:Label ID="LocalTrabalho_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("LocalTrabalho_Apresenta") %>' />
                                                                                <br />
                                                                                ObsComplementares_Label:
                                                                                <asp:Label ID="ObsComplementares_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("ObsComplementares_Label") %>' />
                                                                                <br />
                                                                                ObsComplementares:
                                                                                <asp:Label ID="ObsComplementaresLabel" runat="server" 
                                                                                    Text='<%# Bind("ObsComplementares") %>' />
                                                                                <br />
                                                                                ObsComplementares_Apresenta:
                                                                                <asp:Label ID="ObsComplementares_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("ObsComplementares_Apresenta") %>' />
                                                                                <br />
                                                                                Beneficios_Label:
                                                                                <asp:Label ID="Beneficios_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("Beneficios_Label") %>' />
                                                                                <br />
                                                                                Beneficios:
                                                                                <asp:Label ID="BeneficiosLabel" runat="server" 
                                                                                    Text='<%# Bind("Beneficios") %>' />
                                                                                <br />
                                                                                Beneficios_Apresenta:
                                                                                <asp:Label ID="Beneficios_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("Beneficios_Apresenta") %>' />
                                                                                <br />
                                                                                Perspectiva_Label:
                                                                                <asp:Label ID="Perspectiva_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("Perspectiva_Label") %>' />
                                                                                <br />
                                                                                Perspectiva:
                                                                                <asp:Label ID="PerspectivaLabel" runat="server" 
                                                                                    Text='<%# Bind("Perspectiva") %>' />
                                                                                <br />
                                                                                Perspectiva_Apresenta:
                                                                                <asp:Label ID="Perspectiva_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("Perspectiva_Apresenta") %>' />
                                                                                <br />
                                                                                FaixaEtariaInicio_Label:
                                                                                <asp:Label ID="FaixaEtariaInicio_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("FaixaEtariaInicio_Label") %>' />
                                                                                <br />
                                                                                FaixaEtariaInicio:
                                                                                <asp:Label ID="FaixaEtariaInicioLabel" runat="server" 
                                                                                    Text='<%# Bind("FaixaEtariaInicio") %>' />
                                                                                <br />
                                                                                FaixaEtariaInicio_Apresenta:
                                                                                <asp:Label ID="FaixaEtariaInicio_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("FaixaEtariaInicio_Apresenta") %>' />
                                                                                <br />
                                                                                FaixaEtariaFim_Label:
                                                                                <asp:Label ID="FaixaEtariaFim_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("FaixaEtariaFim_Label") %>' />
                                                                                <br />
                                                                                FaixaEtariaFim:
                                                                                <asp:Label ID="FaixaEtariaFimLabel" runat="server" 
                                                                                    Text='<%# Bind("FaixaEtariaFim") %>' />
                                                                                <br />
                                                                                FaixaEtariaFim_Apresenta:
                                                                                <asp:Label ID="FaixaEtariaFim_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("FaixaEtariaFim_Apresenta") %>' />
                                                                                <br />
                                                                                Sexo_Label:
                                                                                <asp:Label ID="Sexo_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("Sexo_Label") %>' />
                                                                                <br />
                                                                                Sexo:
                                                                                <asp:Label ID="SexoLabel" runat="server" Text='<%# Bind("Sexo") %>' />
                                                                                <br />
                                                                                Sexo_Apresenta:
                                                                                <asp:Label ID="Sexo_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("Sexo_Apresenta") %>' />
                                                                                <br />
                                                                                ConhecimentoIdioma_Label:
                                                                                <asp:Label ID="ConhecimentoIdioma_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("ConhecimentoIdioma_Label") %>' />
                                                                                <br />
                                                                                ConhecimentoIdioma:
                                                                                <asp:Label ID="ConhecimentoIdiomaLabel" runat="server" 
                                                                                    Text='<%# Bind("ConhecimentoIdioma") %>' />
                                                                                <br />
                                                                                ConhecimentoIdioma_Apresenta:
                                                                                <asp:Label ID="ConhecimentoIdioma_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("ConhecimentoIdioma_Apresenta") %>' />
                                                                                <br />
                                                                                PerfilComposicaoEquipe_Label:
                                                                                <asp:Label ID="PerfilComposicaoEquipe_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("PerfilComposicaoEquipe_Label") %>' />
                                                                                <br />
                                                                                PerfilComposicaoEquipe:
                                                                                <asp:Label ID="PerfilComposicaoEquipeLabel" runat="server" 
                                                                                    Text='<%# Bind("PerfilComposicaoEquipe") %>' />
                                                                                <br />
                                                                                PerfilComposicaoEquipe_Apresenta:
                                                                                <asp:Label ID="PerfilComposicaoEquipe_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("PerfilComposicaoEquipe_Apresenta") %>' />
                                                                                <br />
                                                                                PerfilGestor_Label:
                                                                                <asp:Label ID="PerfilGestor_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("PerfilGestor_Label") %>' />
                                                                                <br />
                                                                                PerfilGestor:
                                                                                <asp:Label ID="PerfilGestorLabel" runat="server" 
                                                                                    Text='<%# Bind("PerfilGestor") %>' />
                                                                                <br />
                                                                                PerfilGestor_Apresenta:
                                                                                <asp:Label ID="PerfilGestor_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("PerfilGestor_Apresenta") %>' />
                                                                                <br />
                                                                                CursoEspecifico_Label:
                                                                                <asp:Label ID="CursoEspecifico_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("CursoEspecifico_Label") %>' />
                                                                                <br />
                                                                                CursoEspecifico:
                                                                                <asp:Label ID="CursoEspecificoLabel" runat="server" 
                                                                                    Text='<%# Bind("CursoEspecifico") %>' />
                                                                                <br />
                                                                                CursoEspecifico_Apresenta:
                                                                                <asp:Label ID="CursoEspecifico_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("CursoEspecifico_Apresenta") %>' />
                                                                                <br />
                                                                                Conhecimento_Label:
                                                                                <asp:Label ID="Conhecimento_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("Conhecimento_Label") %>' />
                                                                                <br />
                                                                                Conhecimento:
                                                                                <asp:Label ID="ConhecimentoLabel" runat="server" 
                                                                                    Text='<%# Bind("Conhecimento") %>' />
                                                                                <br />
                                                                                Conhecimento_Apresenta:
                                                                                <asp:Label ID="Conhecimento_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("Conhecimento_Apresenta") %>' />
                                                                                <br />
                                                                                ConhecimentoInformatica_Label:
                                                                                <asp:Label ID="ConhecimentoInformatica_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("ConhecimentoInformatica_Label") %>' />
                                                                                <br />
                                                                                ConhecimentoInformatica:
                                                                                <asp:Label ID="ConhecimentoInformaticaLabel" runat="server" 
                                                                                    Text='<%# Bind("ConhecimentoInformatica") %>' />
                                                                                <br />
                                                                                ConhecimentoInformatica_Apresenta:
                                                                                <asp:Label ID="ConhecimentoInformatica_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("ConhecimentoInformatica_Apresenta") %>' />
                                                                                <br />
                                                                                CompetenciaComportamental_Label:
                                                                                <asp:Label ID="CompetenciaComportamental_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("CompetenciaComportamental_Label") %>' />
                                                                                <br />
                                                                                CompetenciaComportamental:
                                                                                <asp:Label ID="CompetenciaComportamentalLabel" runat="server" 
                                                                                    Text='<%# Bind("CompetenciaComportamental") %>' />
                                                                                <br />
                                                                                CompetenciaComportamental_Apresenta:
                                                                                <asp:Label ID="CompetenciaComportamental_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("CompetenciaComportamental_Apresenta") %>' />
                                                                                <br />
                                                                                CompetenciaProfissional_Label:
                                                                                <asp:Label ID="CompetenciaProfissional_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("CompetenciaProfissional_Label") %>' />
                                                                                <br />
                                                                                CompetenciaProfissional:
                                                                                <asp:Label ID="CompetenciaProfissionalLabel" runat="server" 
                                                                                    Text='<%# Bind("CompetenciaProfissional") %>' />
                                                                                <br />
                                                                                CompetenciaProfissional_Apresenta:
                                                                                <asp:Label ID="CompetenciaProfissional_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("CompetenciaProfissional_Apresenta") %>' />
                                                                                <br />
                                                                                AspectoCritico_Label:
                                                                                <asp:Label ID="AspectoCritico_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("AspectoCritico_Label") %>' />
                                                                                <br />
                                                                                AspectoCritico:
                                                                                <asp:Label ID="AspectoCriticoLabel" runat="server" 
                                                                                    Text='<%# Bind("AspectoCritico") %>' />
                                                                                <br />
                                                                                AspectoCritico_Apresenta:
                                                                                <asp:Label ID="AspectoCritico_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("AspectoCritico_Apresenta") %>' />
                                                                                <br />
                                                                                PrincipalDesafio_Label:
                                                                                <asp:Label ID="PrincipalDesafio_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("PrincipalDesafio_Label") %>' />
                                                                                <br />
                                                                                PrincipalDesafio:
                                                                                <asp:Label ID="PrincipalDesafioLabel" runat="server" 
                                                                                    Text='<%# Bind("PrincipalDesafio") %>' />
                                                                                <br />
                                                                                PrincipalDesafio_Apresenta:
                                                                                <asp:Label ID="PrincipalDesafio_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("PrincipalDesafio_Apresenta") %>' />
                                                                                <br />
                                                                                RelacionamentoInterno_Label:
                                                                                <asp:Label ID="RelacionamentoInterno_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("RelacionamentoInterno_Label") %>' />
                                                                                <br />
                                                                                RelacionamentoInterno:
                                                                                <asp:Label ID="RelacionamentoInternoLabel" runat="server" 
                                                                                    Text='<%# Bind("RelacionamentoInterno") %>' />
                                                                                <br />
                                                                                RelacionamentoInterno_Apresenta:
                                                                                <asp:Label ID="RelacionamentoInterno_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("RelacionamentoInterno_Apresenta") %>' />
                                                                                <br />
                                                                                RelacionamentoExterno_Label:
                                                                                <asp:Label ID="RelacionamentoExterno_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("RelacionamentoExterno_Label") %>' />
                                                                                <br />
                                                                                RelacionamentoExterno:
                                                                                <asp:Label ID="RelacionamentoExternoLabel" runat="server" 
                                                                                    Text='<%# Bind("RelacionamentoExterno") %>' />
                                                                                <br />
                                                                                RelacionamentoExterno_Apresenta:
                                                                                <asp:Label ID="RelacionamentoExterno_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("RelacionamentoExterno_Apresenta") %>' />
                                                                                <br />
                                                                                infoSobre_viagens_Label:
                                                                                <asp:Label ID="infoSobre_viagens_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("infoSobre_viagens_Label") %>' />
                                                                                <br />
                                                                                infoSobre_viagens:
                                                                                <asp:Label ID="infoSobre_viagensLabel" runat="server" 
                                                                                    Text='<%# Bind("infoSobre_viagens") %>' />
                                                                                <br />
                                                                                infoSobre_viagens_Apresenta:
                                                                                <asp:Label ID="infoSobre_viagens_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("infoSobre_viagens_Apresenta") %>' />
                                                                                <br />
                                                                                confidencial_Label:
                                                                                <asp:Label ID="confidencial_LabelLabel" runat="server" 
                                                                                    Text='<%# Bind("confidencial_Label") %>' />
                                                                                <br />
                                                                                confidencial:
                                                                                <asp:CheckBox ID="confidencialCheckBox" runat="server" 
                                                                                    Checked='<%# Bind("confidencial") %>' Enabled="false" />
                                                                                <br />
                                                                                confidencial_Apresenta:
                                                                                <asp:Label ID="confidencial_ApresentaLabel" runat="server" 
                                                                                    Text='<%# Bind("confidencial_Apresenta") %>' />
                                                                                <br />
                                                                                idVaga:
                                                                                <asp:Label ID="idVagaLabel" runat="server" Text='<%# Eval("idVaga") %>' />
                                                                                <br />
                                                                                dsempresaVaga:
                                                                                <asp:Label ID="dsempresaVagaLabel" runat="server" 
                                                                                    Text='<%# Bind("dsempresaVaga") %>' />
                                                                                <br />
                                                                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                                                                    CommandName="Edit" Text="Edit" />
                                                                            </ItemTemplate>
                                                                        </asp:FormView>
                                                                        <br />
                                                                        <asp:SqlDataSource ID="SqlEDITAVAGA" runat="server" 
                                                                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                            SelectCommand="_USP_EDITOR_PESQUISA_VAGA" SelectCommandType="StoredProcedure" 
                                                                            UpdateCommand="_USP_EDITOR_PESQUISA_VAGA_UPDATE" 
                                                                            UpdateCommandType="StoredProcedure">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="idVagaLabel" Name="idVaga" PropertyName="Text" 
                                                                                    Type="Int32" />
                                                                            </SelectParameters>
                                                                            <UpdateParameters>
                                                                                <asp:Parameter Name="idVaga" Type="Int32" />
                                                                                <asp:Parameter Name="idSetup" Type="Int32" />
                                                                                <asp:Parameter Name="Protocolo" Type="String" />
                                                                                <asp:Parameter Name="pne" Type="Int32" />
                                                                                <asp:Parameter Name="FormacaoAcademica_Label" Type="String" />
                                                                                <asp:Parameter Name="FormacaoAcademica" Type="String" />
                                                                                <asp:Parameter Name="FormacaoAcademica_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="dsPerfilVaga_Label" Type="String" />
                                                                                <asp:Parameter Name="dsPerfilVaga" Type="String" />
                                                                                <asp:Parameter Name="dsPerfilVaga_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="Cargo_Label" Type="String" />
                                                                                <asp:Parameter Name="Cargo" Type="String" />
                                                                                <asp:Parameter Name="Cargo_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="nrovaga_Label" Type="String" />
                                                                                <asp:Parameter Name="nrovaga" Type="Int32" />
                                                                                <asp:Parameter Name="nrovaga_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="nmresponsavel_Label" Type="String" />
                                                                                <asp:Parameter Name="nmresponsavel" Type="String" />
                                                                                <asp:Parameter Name="nmresponsavel_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="TipoOportunidade_Label" Type="String" />
                                                                                <asp:Parameter Name="TipoOportunidade" Type="String" />
                                                                                <asp:Parameter Name="TipoOportunidade_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="QualificacaoHabilidadesEspecificas_Label" Type="String" />
                                                                                <asp:Parameter Name="QualificacaoHabilidadesEspecificas" Type="String" />
                                                                                <asp:Parameter Name="QualificacaoHabilidadesEspecificas_Apresenta" 
                                                                                    Type="Int32" />
                                                                                <asp:Parameter Name="Remuneracao_Label" Type="String" />
                                                                                <asp:Parameter Name="Remuneracao" Type="Decimal" />
                                                                                <asp:Parameter Name="Remuneracao_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="RemuneracaoVariavel_Label" Type="String" />
                                                                                <asp:Parameter Name="RemuneracaoVariavel" Type="Decimal" />
                                                                                <asp:Parameter Name="RemuneracaoVariavel_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="Honorario_Label" Type="String" />
                                                                                <asp:Parameter Name="Honorario" Type="Decimal" />
                                                                                <asp:Parameter Name="Honorario_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="LocalTrabalho_Label" Type="String" />
                                                                                <asp:Parameter Name="LocalTrabalho" Type="String" />
                                                                                <asp:Parameter Name="LocalTrabalho_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="ObsComplementares_Label" Type="String" />
                                                                                <asp:Parameter Name="ObsComplementares" Type="String" />
                                                                                <asp:Parameter Name="ObsComplementares_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="Beneficios_Label" Type="String" />
                                                                                <asp:Parameter Name="Beneficios" Type="String" />
                                                                                <asp:Parameter Name="Beneficios_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="Perspectiva_Label" Type="String" />
                                                                                <asp:Parameter Name="Perspectiva" Type="String" />
                                                                                <asp:Parameter Name="Perspectiva_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="FaixaEtariaInicio_Label" Type="String" />
                                                                                <asp:Parameter Name="FaixaEtariaInicio" Type="Int32" />
                                                                                <asp:Parameter Name="FaixaEtariaInicio_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="FaixaEtariaFim_Label" Type="String" />
                                                                                <asp:Parameter Name="FaixaEtariaFim" Type="Int32" />
                                                                                <asp:Parameter Name="FaixaEtariaFim_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="Sexo_Label" Type="String" />
                                                                                <asp:Parameter Name="Sexo" Type="String" />
                                                                                <asp:Parameter Name="Sexo_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="ConhecimentoIdioma_Label" Type="String" />
                                                                                <asp:Parameter Name="ConhecimentoIdioma" Type="String" />
                                                                                <asp:Parameter Name="ConhecimentoIdioma_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="PerfilComposicaoEquipe_Label" Type="String" />
                                                                                <asp:Parameter Name="PerfilComposicaoEquipe" Type="String" />
                                                                                <asp:Parameter Name="PerfilComposicaoEquipe_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="PerfilGestor_Label" Type="String" />
                                                                                <asp:Parameter Name="PerfilGestor" Type="String" />
                                                                                <asp:Parameter Name="PerfilGestor_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="CursoEspecifico_Label" Type="String" />
                                                                                <asp:Parameter Name="CursoEspecifico" Type="String" />
                                                                                <asp:Parameter Name="CursoEspecifico_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="Conhecimento_Label" Type="String" />
                                                                                <asp:Parameter Name="Conhecimento" Type="String" />
                                                                                <asp:Parameter Name="Conhecimento_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="ConhecimentoInformatica_Label" Type="String" />
                                                                                <asp:Parameter Name="ConhecimentoInformatica" Type="String" />
                                                                                <asp:Parameter Name="ConhecimentoInformatica_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="CompetenciaComportamental_Label" Type="String" />
                                                                                <asp:Parameter Name="CompetenciaComportamental" Type="String" />
                                                                                <asp:Parameter Name="CompetenciaComportamental_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="CompetenciaProfissional_Label" Type="String" />
                                                                                <asp:Parameter Name="CompetenciaProfissional" Type="String" />
                                                                                <asp:Parameter Name="CompetenciaProfissional_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="AspectoCritico_Label" Type="String" />
                                                                                <asp:Parameter Name="AspectoCritico" Type="String" />
                                                                                <asp:Parameter Name="AspectoCritico_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="PrincipalDesafio_Label" Type="String" />
                                                                                <asp:Parameter Name="PrincipalDesafio" Type="String" />
                                                                                <asp:Parameter Name="PrincipalDesafio_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="RelacionamentoInterno_Label" Type="String" />
                                                                                <asp:Parameter Name="RelacionamentoInterno" Type="String" />
                                                                                <asp:Parameter Name="RelacionamentoInterno_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="RelacionamentoExterno_Label" Type="String" />
                                                                                <asp:Parameter Name="RelacionamentoExterno" Type="String" />
                                                                                <asp:Parameter Name="RelacionamentoExterno_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="viagens_Label" Type="String" />
                                                                                <asp:Parameter Name="viagens" Type="String" />
                                                                                <asp:Parameter Name="viagens_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="infoSobre_viagens_Label" Type="String" />
                                                                                <asp:Parameter Name="infoSobre_viagens" Type="String" />
                                                                                <asp:Parameter Name="infoSobre_viagens_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="confidencial_Label" Type="String" />
                                                                                <asp:Parameter Name="confidencial" Type="Boolean" />
                                                                                <asp:Parameter Name="confidencial_Apresenta" Type="Int32" />
                                                                                <asp:Parameter Name="dsempresaVaga" Type="String" />
                                                                                <asp:Parameter Name="UF" Type="String" />
                                                                                <asp:Parameter Name="idRH_Gestor" Type="Int32" />
                                                                            </UpdateParameters>
                                                                        </asp:SqlDataSource>
                                                                        <asp:SqlDataSource ID="sqlFORMACAO" runat="server" 
                                                                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                            SelectCommand="SELECT [idTipoFormacao], [dsTipoFormacao] FROM [tbTipoFormacao]">
                                                                        </asp:SqlDataSource>
                                                                        <asp:SqlDataSource ID="SqlUF" runat="server" 
                                                                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                            SelectCommand="SELECT [uf] FROM [tbuf]"></asp:SqlDataSource>
                                                                        <asp:SqlDataSource ID="SqlTipoVaga" runat="server" 
                                                                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                            SelectCommand="SELECT idTipoVaga, idSetup, dsTipoVAga FROM tbTipoVaga WHERE (idSetup = @idSetup) ORDER BY dsTipoVAga">
                                                                            <SelectParameters>
                                                                                <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <br />
                                                <br />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Label ID="TipoPesquisaLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="minAderenciaLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="TEXTOPESQUISALabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idVagaLabel" runat="server" Visible="False"></asp:Label>
                                <br />

                                <br />
                                <asp:Image ID="ImageLinha0" runat="server" 
                                    ImageUrl="~/_corporativo/images/holomatica/linha.png" />
                                <br />
                                <asp:Panel ID="PanelPESQUISA" runat="server" DefaultButton="LinkButtonPSQ">
                                    <asp:Label ID="LabelPesquisadosProcessosSeletivos" runat="server" CssClass="h1" 
                                    Text="Pesquisa das Vagas"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBoxPesquisaVAGA" runat="server" 
                                        CssClass="InputCadFormCandidatoCV" 
                                        ToolTip="Informe o nome ou parte do nome da Vaga" ValidationGroup="PESQUISA"></asp:TextBox>
                                    <asp:TextBoxWatermarkExtender ID="TextBoxPesquisaVAGA_TextBoxWatermarkExtender" 
                                        runat="server" Enabled="True" TargetControlID="TextBoxPesquisaVAGA" 
                                        WatermarkText="Informe parte do nome da Vaga">
                                    </asp:TextBoxWatermarkExtender>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="RadioButtonListatusVAGA" CssClass="msnERROR" 
                                        ErrorMessage="Informe parte do nome ou o número do Processo Seletivo" 
                                        SetFocusOnError="True" ValidationGroup="PESQUISA">•</asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RadioButtonList ID="RadioButtonListatusVAGA" runat="server" 
                                        CellPadding="0" CellSpacing="0" CssClass="RadioButtonListPS" 
                                        RepeatDirection="Horizontal" Width="300px">
                                        <asp:ListItem Value="Aprovado">Aprovadas</asp:ListItem>
                                        <asp:ListItem Value="Reprovado">Reprovadas</asp:ListItem>
                                        <asp:ListItem Selected="True" Value="Todos">Ambas</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <br />
                                    <asp:LinkButton ID="LinkButtonPSQ" runat="server" CssClass="button" 
                                        ToolTip="Clique para iniciar a pesquisa" ValidationGroup="PESQUISA">Pesquisa das vagas abertas e fechadas</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonLIMPAR" runat="server" CssClass="button" 
                                        ToolTip="Clique aqui para limpar pesquisa">Limpar</asp:LinkButton>
                                    <asp:ValidationSummary ID="ValidationSummaryPPS" runat="server" 
                                        ShowMessageBox="True" ShowSummary="False" ValidationGroup="PESQUISA" />
                                </asp:Panel>
                                <br />
                                <asp:Image ID="ImageLinha1" runat="server" 
                                    ImageUrl="~/_corporativo/images/holomatica/linha.png" />
                                <asp:Panel ID="PanelResultadoPesquisa" runat="server" 
                                    CssClass="ResultadoPesquisaPanel" Visible="False">
                                    <asp:Label ID="LabelPesquisadosProcessosSeletivos0" runat="server" CssClass="h1" 
                                    Text="Resultado da Pesquisa"></asp:Label>
                                    <asp:Label ID="ConsultorLabelATUAL" runat="server" 
                                        Text='<%# Eval("idRH_Consultor") %>' Visible="False"></asp:Label>
                                    <asp:Label ID="ConsultorLabelVAGA" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="idVagaVALIDADELabel" runat="server" Visible="False"></asp:Label>
                                    <br />
                                    <asp:DataList ID="DataListVAGA" runat="server" 
                                        DataKeyField="idVaga" DataSourceID="SqlPESQUISAVAGA" 
                                        Width="100%">
                                        <ItemTemplate>
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="nomeprocessoLabel" runat="server" 
                                                            CssClass="tituloProcessoSeletivo" Text='<%# Eval("NomeVaga") %>'></asp:Label>
                                                        <asp:Label ID="HifenLabel" runat="server" CssClass="tituloProcessoSeletivo" 
                                                            Text=" -"></asp:Label>
                                                        <asp:Label ID="ProtocoloDBLabel" runat="server" 
                                                            CssClass="tituloProcessoSeletivo" Text='<%# Eval("ProtocoloVaga") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table cellpadding="0" cellspacing="0" width="830px">
                                                            <tr>
                                                                <td valign="top" width="70px" align="center">
                                                                    <asp:ImageButton ID="ImageButtonVaga" runat="server" 
                                                                        ImageUrl="~/_corporativo/images/holomatica/EDITAR.png" 
                                                                        ToolTip="Clique aqui para visualizar e editar esta vaga" 
                                                                        CommandName="Select" CommandArgument='<%# Eval("idRH_Gestor") %>' />
                                                                    <asp:Image ID="Image_pne" runat="server" 
                                                                        ImageUrl="~/_corporativo/images/pne_pequeno.png" Visible='<%# Eval("pne") %>' />
                                                                </td>
                                                                <td width="790px">
                                                                    <table ID="RES1" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td bgcolor="#EEEEEE" valign="top"  width="155">
                                                                                <asp:Label ID="AberturaLabel" runat="server" CssClass="textoBold" 
                                                                                    Text="Data Abertura:"></asp:Label>
                                                                            </td>
                                                                            <td bgcolor="#EEEEEE">
                                                                                <asp:Label ID="DataInicialProcessoDBLabel" runat="server" 
                                                                                    CssClass="textoProcessoSeletivo" Text='<%# Eval("dataIni", "{0:d}") %>'></asp:Label>
                                                                                <asp:Label ID="ConsultorLabel" runat="server" 
                                                                                    Text='<%# Eval("idRH_Consultor") %>' Visible="False"></asp:Label>
                                                                                <asp:Label ID="GestorLabel" runat="server" Text='<%# Eval("idRH_Gestor") %>' 
                                                                                    Visible="False"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td valign="top"  width="155">
                                                                                <asp:Label ID="EncerramentoLabel" runat="server" CssClass="textoBold" 
                                                                                    Text="Data Encerramento:"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="DataFinalProcessoDBLabel2" runat="server" 
                                                                                    CssClass="textoProcessoSeletivo" Text='<%# Eval("dataFim", "{0:d}") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td bgcolor="#EEEEEE" valign="top"  width="155">
                                                                                <asp:Label ID="AnalistaResLabel" runat="server" CssClass="textoBold" 
                                                                                    Text="Responsável pelo anúncio:"></asp:Label>
                                                                            </td>
                                                                            <td bgcolor="#EEEEEE">
                                                                                <asp:Label ID="ConsultorResponsavelDBLabel" runat="server" 
                                                                                    CssClass="textoProcessoSeletivo" Text='<%# Eval("NomeConsultorResponsavel") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td valign="top"  width="155">
                                                                                <asp:Label ID="StatusLabel" runat="server" CssClass="textoBold" Text="Status:"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="FechadoLabel" runat="server" 
                                                                                    CssClass="textoProcessoSeletivoABERTO" Text='<%# Eval("idstatusvaga") %>'></asp:Label>
                                                                                <asp:Label ID="publicarLabel" runat="server" 
                                                                                    CssClass="textoProcessoSeletivoABERTO" Text='<%# Eval("publicar") %>' Visible="False"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td valign="top"  width="155">
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
                                                                            <td valign="top"  width="155">
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
                                                                            <td valign="top"  width="155">
                                                                                <asp:Label ID="LabelCODIGO" runat="server" CssClass="textoBold" 
                                                                                    Text="Código publicações:"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="CodigoVagaLabel" runat="server" CssClass="textoProcessoSeletivo" 
                                                                                    Text='<%# Eval("CodigoVaga") %>' />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td valign="top" width="155">
                                                                                <asp:Label ID="AnalistaLabel" runat="server" CssClass="textoBold" 
                                                                                    Text="Analista/Consultor:"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="AnalistaConsultorLabel" runat="server" 
                                                                                    CssClass="textoProcessoSeletivo" Text='<%# Eval("nomeCONSULTOR") %>' />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="70px" valign="top">
                                                                    <asp:ImageButton ID="ImageButtonVALIDADE" runat="server" CommandArgument='<%# Eval("idVaga") %>' CommandName="VALIDADE" ImageUrl="~/_corporativo/images/holomatica/CALENDARIO_VAGA.png" ToolTip="Para trocar a data da validade, publicar ou despublicar esta vaga clique aqui." />
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
                                    <br />
                                    <br />
                                </asp:Panel>
                                <asp:Panel ID="PanelVAGA" runat="server" Width="100%">
                                    <br />
                                        <table ID="NAVEGADORPREVIEWVAGA" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="right">
                                                    <asp:LinkButton ID="LinkButtonALTERACAO" runat="server" CssClass="button" 
                                                        onclick="LinkButtonALTERACAO_Click" 
                                                        ToolTip="Clique aqui para abrir o editor de vagas">Quero fazer alterações neste anúncio</asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButtonFecharEditor" runat="server" 
                                                        CausesValidation="False" CssClass="button" Visible="False" 
                                                        ToolTip="Clique aqui para fechar o editor de vagas">Fechar Editor de anúncio</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    <asp:DataList ID="DataListPREVIEWVAGA" runat="server" 
                                        DataKeyField="idVagaAnuncio" DataSourceID="SqlDataSourcePreviewVaga" 
                                        Width="100%">
                                        <ItemTemplate>
                                            <table ID="PreViewVaga0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="ProtocoloLabel" runat="server" CssClass="tituloProcessoSeletivo" 
                                                            Text='<%# Bind("Protocolo") %>' />
                                                        <br />
                                                        <table ID="CABECANUNCIOTABLE" cellpadding="10" cellspacing="10" width="100%">
                                                            <tr>
                                                                <td align="left">
                                                                    <table cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td valign="top">
                                                                                <asp:Image ID="ImagePNE" runat="server" 
                                                                                    ImageUrl="~/_corporativo/images/pne.png" Visible='<%# Eval("pne") %>' />
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
                                                        <table ID="PREVIEW" align="center" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td ID="FormacaoTD3" runat="server" align="right" class="tableFormulario" 
                                                                    valign="top" visible='<%# Eval("FormacaoAcademica_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="FormacaoAcademica_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("FormacaoAcademica_Label") %>' 
                                                                        Visible='<%# Eval("FormacaoAcademica_Apresenta") %>' />
                                                                </td>
                                                                <td ID="FormacaoTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("FormacaoAcademica_Apresenta") %>'>
                                                                    <asp:Label ID="FormacaoAcademicaLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" Text='<%# Bind("FormacaoAcademica") %>' 
                                                                        Visible='<%# Eval("FormacaoAcademica_Apresenta") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="PerfilVagaTD3" runat="server" align="right" class="tableFormulario" 
                                                                    valign="top" visible='<%# Eval("dsPerfilVaga_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="dsPerfilVaga_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("dsPerfilVaga_Label") %>' 
                                                                        Visible='<%# Eval("dsPerfilVaga_Apresenta") %>' />
                                                                </td>
                                                                <td ID="PerfilVagaTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("dsPerfilVaga_Apresenta") %>'>
                                                                    <asp:Label ID="dsPerfilVagaLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" Text='<%# Bind("dsPerfilVaga") %>' 
                                                                        Visible='<%# Eval("dsPerfilVaga_Apresenta") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="CargoTD3" runat="server" align="right" class="tableFormulario" 
                                                                    valign="top" visible='<%# Eval("Cargo_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="Cargo_LabelLabel" runat="server" CssClass="textoResumoVAGA" 
                                                                        Text='<%# Bind("Cargo_Label") %>' Visible='<%# Eval("Cargo_Apresenta") %>' />
                                                                </td>
                                                                <td ID="CargoTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("Cargo_Apresenta") %>'>
                                                                    <asp:Label ID="CargoLabel" runat="server" CssClass="textoResumoConteudoCV" 
                                                                        Text='<%# Bind("Cargo") %>' Visible='<%# Eval("Cargo_Apresenta") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="nrovagaTD3" runat="server" align="right" class="tableFormulario" 
                                                                    valign="top" visible='<%# Eval("nrovaga_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="nrovaga_LabelLabel" runat="server" CssClass="textoResumoVAGA" 
                                                                        Text='<%# Bind("nrovaga_Label") %>' />
                                                                </td>
                                                                <td ID="nrovagaTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("nrovaga_Apresenta") %>'>
                                                                    <asp:Label ID="nrovagaLabel" runat="server" CssClass="textoResumoConteudoCV" 
                                                                        Text='<%# Bind("nrovaga") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="nmresponsavelTD3" runat="server" align="right" class="tableFormulario" 
                                                                    valign="top" visible='<%# Eval("nmresponsavel_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="nmresponsavel_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("nmresponsavel_Label") %>' />
                                                                </td>
                                                                <td ID="nmresponsavelTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("nmresponsavel_Apresenta") %>'>
                                                                    <asp:Label ID="nmresponsavelLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" Text='<%# Bind("nmresponsavel") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="TipoOportunidadeTD3" runat="server" align="right" 
                                                                    class="tableFormulario" valign="top" 
                                                                    visible='<%# Eval("TipoOportunidade_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="TipoOportunidade_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("TipoOportunidade_Label") %>' />
                                                                </td>
                                                                <td ID="TipoOportunidadeTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("TipoOportunidade_Apresenta") %>'>
                                                                    <asp:Label ID="TipoOportunidadeLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" Text='<%# Bind("TipoOportunidade") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="QualificacaoHabilidadesEspecificasTD3" runat="server" align="right" 
                                                                    class="tableFormulario" valign="top" 
                                                                    visible='<%# Eval("QualificacaoHabilidadesEspecificas_Apresenta") %>' 
                                                                    width="40%">
                                                                    <asp:Label ID="QualificacaoHabilidadesEspecificas_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" 
                                                                        Text='<%# Bind("QualificacaoHabilidadesEspecificas_Label") %>' />
                                                                </td>
                                                                <td ID="QualificacaoHabilidadesEspecificasTD4" runat="server" 
                                                                    class="tableFormulario" 
                                                                    visible='<%# Eval("QualificacaoHabilidadesEspecificas_Apresenta") %>'>
                                                                    <asp:Label ID="QualificacaoHabilidadesEspecificasLabel0" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" 
                                                                        Text='<%# Bind("QualificacaoHabilidadesEspecificas") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="Remuneracao_LabelTD3" runat="server" align="right" 
                                                                    class="tableFormulario" valign="top" 
                                                                    visible='<%# Eval("Remuneracao_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="Remuneracao_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("Remuneracao_Label") %>' />
                                                                </td>
                                                                <td ID="Remuneracao_LabelTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("Remuneracao_Apresenta") %>'>
                                                                    <asp:Label ID="RemuneracaoLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" Text='<%# Bind("Remuneracao", "{0:C}") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="RemuneracaoVariavelTD3" runat="server" align="right" 
                                                                    class="tableFormulario" valign="top" 
                                                                    visible='<%# Eval("RemuneracaoVariavel_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="RemuneracaoVariavel_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("RemuneracaoVariavel_Label") %>' />
                                                                </td>
                                                                <td ID="RemuneracaoVariavelTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("RemuneracaoVariavel_Apresenta") %>'>
                                                                    <asp:Label ID="RemuneracaoVariavelLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" 
                                                                        Text='<%# Bind("RemuneracaoVariavel", "{0:C}") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="HonorarioTD3" runat="server" align="right" class="tableFormulario" 
                                                                    valign="top" visible='<%# Eval("Honorario_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="Honorario_LabelLabel" runat="server" CssClass="textoResumoVAGA" 
                                                                        Text='<%# Bind("Honorario_Label") %>' />
                                                                </td>
                                                                <td ID="HonorarioTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("Honorario_Apresenta") %>'>
                                                                    <asp:Label ID="HonorarioLabel" runat="server" CssClass="textoResumoConteudoCV" 
                                                                        Text='<%# Bind("Honorario", "{0:C}") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="LocalTrabalhoTD3" runat="server" align="right" class="tableFormulario" 
                                                                    valign="top" visible='<%# Eval("LocalTrabalho_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="LocalTrabalho_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("LocalTrabalho_Label") %>' />
                                                                </td>
                                                                <td ID="LocalTrabalhoTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("LocalTrabalho_Apresenta") %>'>
                                                                    <asp:Label ID="LocalTrabalhoLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" Text='<%# Bind("LocalTrabalho") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="ObsComplementaresTD3" runat="server" align="right" 
                                                                    class="tableFormulario" valign="top" 
                                                                    visible='<%# Eval("ObsComplementares_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="ObsComplementares_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("ObsComplementares_Label") %>' />
                                                                </td>
                                                                <td ID="ObsComplementaresTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("ObsComplementares_Apresenta") %>'>
                                                                    <asp:Label ID="ObsComplementaresLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" Text='<%# Bind("ObsComplementares") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="BeneficiosTD3" runat="server" align="right" class="tableFormulario" 
                                                                    valign="top" visible='<%# Eval("Beneficios_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="Beneficios_LabelLabel" runat="server" CssClass="textoResumoVAGA" 
                                                                        Text='<%# Bind("Beneficios_Label") %>' />
                                                                </td>
                                                                <td ID="BeneficiosTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("Beneficios_Apresenta") %>'>
                                                                    <asp:Label ID="BeneficiosLabel" runat="server" CssClass="textoResumoConteudoCV" 
                                                                        Text='<%# Bind("Beneficios") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="PerspectivaTD3" runat="server" align="right" class="tableFormulario" 
                                                                    valign="top" visible='<%# Eval("Perspectiva_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="Perspectiva_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("Perspectiva_Label") %>' />
                                                                </td>
                                                                <td ID="PerspectivaTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("Perspectiva_Apresenta") %>'>
                                                                    <asp:Label ID="PerspectivaLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" Text='<%# Bind("Perspectiva") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="FaixaEtariaInicioTD3" runat="server" align="right" 
                                                                    class="tableFormulario" valign="top" 
                                                                    visible='<%# Eval("FaixaEtariaInicio_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="FaixaEtariaInicio_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("FaixaEtariaInicio_Label") %>' />
                                                                </td>
                                                                <td ID="FaixaEtariaInicioTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("FaixaEtariaInicio_Apresenta") %>'>
                                                                    <asp:Label ID="FaixaEtariaInicioLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" 
                                                                        Text='<%# Bind("FaixaEtariaInicio", "{0} anos") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="FaixaEtariaFimTD3" runat="server" align="right" class="tableFormulario" 
                                                                    valign="top" visible='<%# Eval("FaixaEtariaFim_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="FaixaEtariaFim_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("FaixaEtariaFim_Label") %>' />
                                                                </td>
                                                                <td ID="FaixaEtariaFimTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("FaixaEtariaFim_Apresenta") %>'>
                                                                    <asp:Label ID="FaixaEtariaFimLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" 
                                                                        Text='<%# Bind("FaixaEtariaFim", "{0} anos") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="SexoTD3" runat="server" align="right" class="tableFormulario" 
                                                                    valign="top" visible='<%# Eval("Sexo_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="Sexo_LabelLabel" runat="server" CssClass="textoResumoVAGA" 
                                                                        Text='<%# Bind("Sexo_Label") %>' />
                                                                </td>
                                                                <td ID="SexoTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("Sexo_Apresenta") %>'>
                                                                    <asp:Label ID="SexoLabel" runat="server" CssClass="textoResumoConteudoCV" 
                                                                        Text='<%# Bind("Sexo") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="ConhecimentoIdiomaTD3" runat="server" align="right" 
                                                                    class="tableFormulario" valign="top" 
                                                                    visible='<%# Eval("ConhecimentoIdioma_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="ConhecimentoIdioma_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("ConhecimentoIdioma_Label") %>' />
                                                                </td>
                                                                <td ID="ConhecimentoIdiomaTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("ConhecimentoIdioma_Apresenta") %>'>
                                                                    <asp:Label ID="ConhecimentoIdiomaLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" Text='<%# Bind("ConhecimentoIdioma") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="PerfilComposicaoEquipeTD3" runat="server" align="right" 
                                                                    class="tableFormulario" valign="top" 
                                                                    visible='<%# Eval("PerfilComposicaoEquipe_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="PerfilComposicaoEquipe_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("PerfilComposicaoEquipe_Label") %>' />
                                                                </td>
                                                                <td ID="PerfilComposicaoEquipeTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("PerfilComposicaoEquipe_Apresenta") %>'>
                                                                    <asp:Label ID="PerfilComposicaoEquipeLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" Text='<%# Bind("PerfilComposicaoEquipe") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="PerfilGestorTD3" runat="server" align="right" class="tableFormulario" 
                                                                    valign="top" visible='<%# Eval("PerfilGestor_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="PerfilGestor_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("PerfilGestor_Label") %>' />
                                                                </td>
                                                                <td ID="PerfilGestorTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("PerfilGestor_Apresenta") %>'>
                                                                    <asp:Label ID="PerfilGestorLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" Text='<%# Bind("PerfilGestor") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="CursoEspecificoTD3" runat="server" align="right" 
                                                                    class="tableFormulario" valign="top" 
                                                                    visible='<%# Eval("CursoEspecifico_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="CursoEspecifico_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("CursoEspecifico_Label") %>' />
                                                                </td>
                                                                <td ID="CursoEspecificoTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("CursoEspecifico_Apresenta") %>'>
                                                                    <asp:Label ID="CursoEspecificoLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" Text='<%# Bind("CursoEspecifico") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="ConhecimentoTD3" runat="server" align="right" class="tableFormulario" 
                                                                    valign="top" visible='<%# Eval("Conhecimento_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="Conhecimento_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("Conhecimento_Label") %>' />
                                                                </td>
                                                                <td ID="ConhecimentoTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("Conhecimento_Apresenta") %>'>
                                                                    <asp:Label ID="ConhecimentoLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" Text='<%# Bind("Conhecimento") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="ConhecimentoInformaticaTD3" runat="server" align="right" 
                                                                    class="tableFormulario" valign="top" 
                                                                    visible='<%# Eval("ConhecimentoInformatica_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="ConhecimentoInformatica_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" 
                                                                        Text='<%# Bind("ConhecimentoInformatica_Label") %>' />
                                                                </td>
                                                                <td ID="ConhecimentoInformaticaTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("ConhecimentoInformatica_Apresenta") %>'>
                                                                    <asp:Label ID="ConhecimentoInformaticaLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" 
                                                                        Text='<%# Bind("ConhecimentoInformatica") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="CompetenciaComportamentalTD3" runat="server" align="right" 
                                                                    class="tableFormulario" valign="top" 
                                                                    visible='<%# Eval("CompetenciaComportamental_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="CompetenciaComportamental_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" 
                                                                        Text='<%# Bind("CompetenciaComportamental_Label") %>' />
                                                                </td>
                                                                <td ID="CompetenciaComportamentalTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("CompetenciaComportamental_Apresenta") %>'>
                                                                    <asp:Label ID="CompetenciaComportamentalLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" 
                                                                        Text='<%# Bind("CompetenciaComportamental") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="CompetenciaProfissionalTD3" runat="server" align="right" 
                                                                    class="tableFormulario" valign="top" 
                                                                    visible='<%# Eval("CompetenciaProfissional_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="CompetenciaProfissional_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" 
                                                                        Text='<%# Bind("CompetenciaProfissional_Label") %>' />
                                                                </td>
                                                                <td ID="CompetenciaProfissionalTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("CompetenciaProfissional_Apresenta") %>'>
                                                                    <asp:Label ID="CompetenciaProfissionalLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" 
                                                                        Text='<%# Bind("CompetenciaProfissional") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="AspectoCriticoTD3" runat="server" align="right" class="tableFormulario" 
                                                                    valign="top" visible='<%# Eval("AspectoCritico_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="AspectoCritico_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("AspectoCritico_Label") %>' />
                                                                </td>
                                                                <td ID="AspectoCriticoTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("AspectoCritico_Apresenta") %>'>
                                                                    <asp:Label ID="AspectoCriticoLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" Text='<%# Bind("AspectoCritico") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="PrincipalDesafioTD3" runat="server" align="right" 
                                                                    class="tableFormulario" valign="top" 
                                                                    visible='<%# Eval("PrincipalDesafio_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="PrincipalDesafio_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("PrincipalDesafio_Label") %>' />
                                                                </td>
                                                                <td ID="PrincipalDesafioTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("PrincipalDesafio_Apresenta") %>'>
                                                                    <asp:Label ID="PrincipalDesafioLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" Text='<%# Bind("PrincipalDesafio") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="RelacionamentoInternoTD3" runat="server" align="right" 
                                                                    class="tableFormulario" valign="top" 
                                                                    visible='<%# Eval("RelacionamentoInterno_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="RelacionamentoInterno_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("RelacionamentoInterno_Label") %>' />
                                                                </td>
                                                                <td ID="RelacionamentoInternoTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("RelacionamentoInterno_Apresenta") %>'>
                                                                    <asp:Label ID="RelacionamentoInternoLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" Text='<%# Bind("RelacionamentoInterno") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="RelacionamentoExternoTD3" runat="server" align="right" 
                                                                    class="tableFormulario" valign="top" 
                                                                    visible='<%# Eval("RelacionamentoExterno_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="RelacionamentoExterno_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("RelacionamentoExterno_Label") %>' />
                                                                </td>
                                                                <td ID="RelacionamentoExternoTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("RelacionamentoExterno_Apresenta") %>'>
                                                                    <asp:Label ID="RelacionamentoExternoLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" Text='<%# Bind("RelacionamentoExterno") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td ID="infoSobre_viagensTD3" runat="server" align="right" 
                                                                    class="tableFormulario" valign="top" 
                                                                    visible='<%# Eval("infoSobre_viagens_Apresenta") %>' width="40%">
                                                                    <asp:Label ID="infoSobre_viagens_LabelLabel" runat="server" 
                                                                        CssClass="textoResumoVAGA" Text='<%# Bind("infoSobre_viagens_Label") %>' />
                                                                </td>
                                                                <td ID="infoSobre_viagensTD4" runat="server" class="tableFormulario" 
                                                                    visible='<%# Eval("infoSobre_viagens_Apresenta") %>'>
                                                                    <asp:Label ID="infoSobre_viagensLabel" runat="server" 
                                                                        CssClass="textoResumoConteudoCV" Text='<%# Bind("infoSobre_viagens") %>' />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <br />
                                    <br />
                                </asp:Panel>
                                    <br />
                                    <asp:Panel ID="PanelVALIDADE" runat="server" Visible="False" CssClass="VALIDADE_VAGAPosition">
                                        <asp:FormView ID="FormViewVALIDADE" runat="server" DataKeyNames="idVaga" DataSourceID="SqlDataSourceVALIDADE" DefaultMode="Edit" Width="100%">
                                            <EditItemTemplate>
                                                &nbsp;<asp:TextBox ID="cntTextBox" runat="server" Text='<%# Bind("cnt") %>' Visible="False" Width="10px" />
                                                <asp:TextBox ID="ProtocoloTextBox" runat="server" Text='<%# Bind("Protocolo") %>' Visible="False" Width="10px" />
                                                <asp:TextBox ID="dsfuncaoTextBox" runat="server" Text='<%# Bind("dsfuncao") %>' Visible="False" Width="10px" />
                                                <asp:TextBox ID="data_iniTextBox" runat="server" Text='<%# Bind("data_ini") %>' Visible="False" Width="10px" />
                                                <asp:TextBox ID="data_fimTextBox" runat="server" Text='<%# Bind("data_fim") %>' Visible="False" Width="10px" />
                                                <asp:CheckBox ID="liberarEmailCheckBox" runat="server" Checked='<%# Bind("liberarEmail") %>' Visible="False" />
                                                <br />
                                                <table id="VALIDADE" cellpadding="5" cellspacing="5">
                                                    <tr>
                                                        <td>
                                                            <asp:Calendar ID="CalendarVALIDADE" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" SelectedDate='<%# Bind("data_fim") %>' TitleFormat="Month" ToolTip="Validade da publicação." Width="200px">
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
                                                        <td>
                                                            <asp:Label ID="Label1" runat="server" Text="Validade da publicação:"></asp:Label>
                                                            <br />
                                                            <asp:Label ID="LabeldataFIM" runat="server" CssClass="textQUIZ" Text='<%# Eval("data_fim", "{0:d}") %>'></asp:Label>
                                                            <br />
                                                            <br />
                                                            <asp:CheckBox ID="publicarCheckBox" runat="server" Checked='<%# Bind("publicar") %>' Text="Vaga publicada" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>
                                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" CssClass="button" Text="Salvar" />
                                                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CssClass="button" OnClick="UpdateCancelButton_Click1" Text="Fechar" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                Protocolo:
                                                <asp:TextBox ID="ProtocoloTextBox" runat="server" Text='<%# Bind("Protocolo") %>' />
                                                <br />
                                                dsfuncao:
                                                <asp:TextBox ID="dsfuncaoTextBox" runat="server" Text='<%# Bind("dsfuncao") %>' />
                                                <br />
                                                data_ini:
                                                <asp:TextBox ID="data_iniTextBox" runat="server" Text='<%# Bind("data_ini") %>' />
                                                <br />
                                                data_fim:
                                                <asp:TextBox ID="data_fimTextBox" runat="server" Text='<%# Bind("data_fim") %>' />
                                                <br />
                                                liberarEmail:
                                                <asp:CheckBox ID="liberarEmailCheckBox" runat="server" Checked='<%# Bind("liberarEmail") %>' />
                                                <br />
                                                publicar:
                                                <asp:CheckBox ID="publicarCheckBox" runat="server" Checked='<%# Bind("publicar") %>' />
                                                <br />
                                                cnt:
                                                <asp:TextBox ID="cntTextBox" runat="server" Text='<%# Bind("cnt") %>' />
                                                <br />
                                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                idVaga:
                                                <asp:Label ID="idVagaLabel" runat="server" Text='<%# Eval("idVaga") %>' />
                                                <br />
                                                Protocolo:
                                                <asp:Label ID="ProtocoloLabel" runat="server" Text='<%# Bind("Protocolo") %>' />
                                                <br />
                                                dsfuncao:
                                                <asp:Label ID="dsfuncaoLabel" runat="server" Text='<%# Bind("dsfuncao") %>' />
                                                <br />
                                                data_ini:
                                                <asp:Label ID="data_iniLabel" runat="server" Text='<%# Bind("data_ini") %>' />
                                                <br />
                                                data_fim:
                                                <asp:Label ID="data_fimLabel" runat="server" Text='<%# Bind("data_fim") %>' />
                                                <br />
                                                liberarEmail:
                                                <asp:CheckBox ID="liberarEmailCheckBox" runat="server" Checked='<%# Bind("liberarEmail") %>' Enabled="false" />
                                                <br />
                                                publicar:
                                                <asp:CheckBox ID="publicarCheckBox" runat="server" Checked='<%# Bind("publicar") %>' Enabled="false" />
                                                <br />
                                                cnt:
                                                <asp:Label ID="cntLabel" runat="server" Text='<%# Bind("cnt") %>' />
                                                <br />
                                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                                                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                                            </ItemTemplate>
                                        </asp:FormView>
                                </asp:Panel>
                                    <br />
                                <br />
                                <asp:SqlDataSource ID="SqlPESQUISAVAGA" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_VAGA_PESQUISA" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                                            Type="Int32" />
                                        <asp:ControlParameter ControlID="TEXTOPESQUISALabel" Name="SearchTerm" 
                                            PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="RadioButtonListatusVAGA" Name="StatusVaga" 
                                            PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourcePreviewVaga" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    DeleteCommand="DELETE FROM [_tbVagaAnuncio] WHERE [idVagaAnuncio] = @idVagaAnuncio" 
                    InsertCommand="INSERT INTO [_tbVagaAnuncio] ([Protocolo], [FormacaoAcademica_Label], [FormacaoAcademica], [FormacaoAcademica_Apresenta], [dsPerfilVaga_Label], [dsPerfilVaga], [dsPerfilVaga_Apresenta], [Cargo_Label], [Cargo], [Cargo_Apresenta], [nrovaga_Label], [nrovaga], [nrovaga_Apresenta], [nmresponsavel_Label], [nmresponsavel], [nmresponsavel_Apresenta], [TipoOportunidade_Label], [TipoOportunidade], [TipoOportunidade_Apresenta], [QualificacaoHabilidadesEspecificas_Label], [QualificacaoHabilidadesEspecificas], [QualificacaoHabilidadesEspecificas_Apresenta], [Remuneracao_Label], [Remuneracao], [Remuneracao_Apresenta], [RemuneracaoVariavel_Label], [RemuneracaoVariavel], [RemuneracaoVariavel_Apresenta], [Honorario_Label], [Honorario], [Honorario_Apresenta], [LocalTrabalho_Label], [LocalTrabalho], [LocalTrabalho_Apresenta], [ObsComplementares_Label], [ObsComplementares], [ObsComplementares_Apresenta], [Beneficios_Label], [Beneficios], [Beneficios_Apresenta], [Perspectiva_Label], [Perspectiva], [Perspectiva_Apresenta], [FaixaEtariaInicio_Label], [FaixaEtariaInicio], [FaixaEtariaInicio_Apresenta], [FaixaEtariaFim_Label], [FaixaEtariaFim], [FaixaEtariaFim_Apresenta], [Sexo_Label], [Sexo], [Sexo_Apresenta], [ConhecimentoIdioma_Label], [ConhecimentoIdioma], [ConhecimentoIdioma_Apresenta], [PerfilComposicaoEquipe_Label], [PerfilComposicaoEquipe], [PerfilComposicaoEquipe_Apresenta], [PerfilGestor_Label], [PerfilGestor], [PerfilGestor_Apresenta], [CursoEspecifico_Label], [CursoEspecifico], [CursoEspecifico_Apresenta], [Conhecimento_Label], [Conhecimento], [Conhecimento_Apresenta], [ConhecimentoInformatica_Label], [ConhecimentoInformatica], [ConhecimentoInformatica_Apresenta], [CompetenciaComportamental_Label], [CompetenciaComportamental], [CompetenciaComportamental_Apresenta], [CompetenciaProfissional_Label], [CompetenciaProfissional], [CompetenciaProfissional_Apresenta], [AspectoCritico_Label], [AspectoCritico], [AspectoCritico_Apresenta], [PrincipalDesafio_Label], [PrincipalDesafio], [PrincipalDesafio_Apresenta], [RelacionamentoInterno_Label], [RelacionamentoInterno], [RelacionamentoInterno_Apresenta], [RelacionamentoExterno_Label], [RelacionamentoExterno], [RelacionamentoExterno_Apresenta], [infoSobre_viagens_Label], [infoSobre_viagens], [infoSobre_viagens_Apresenta], [confidencial_Label], [confidencial], [confidencial_Apresenta]) VALUES (@Protocolo, @FormacaoAcademica_Label, @FormacaoAcademica, @FormacaoAcademica_Apresenta, @dsPerfilVaga_Label, @dsPerfilVaga, @dsPerfilVaga_Apresenta, @Cargo_Label, @Cargo, @Cargo_Apresenta, @nrovaga_Label, @nrovaga, @nrovaga_Apresenta, @nmresponsavel_Label, @nmresponsavel, @nmresponsavel_Apresenta, @TipoOportunidade_Label, @TipoOportunidade, @TipoOportunidade_Apresenta, @QualificacaoHabilidadesEspecificas_Label, @QualificacaoHabilidadesEspecificas, @QualificacaoHabilidadesEspecificas_Apresenta, @Remuneracao_Label, @Remuneracao, @Remuneracao_Apresenta, @RemuneracaoVariavel_Label, @RemuneracaoVariavel, @RemuneracaoVariavel_Apresenta, @Honorario_Label, @Honorario, @Honorario_Apresenta, @LocalTrabalho_Label, @LocalTrabalho, @LocalTrabalho_Apresenta, @ObsComplementares_Label, @ObsComplementares, @ObsComplementares_Apresenta, @Beneficios_Label, @Beneficios, @Beneficios_Apresenta, @Perspectiva_Label, @Perspectiva, @Perspectiva_Apresenta, @FaixaEtariaInicio_Label, @FaixaEtariaInicio, @FaixaEtariaInicio_Apresenta, @FaixaEtariaFim_Label, @FaixaEtariaFim, @FaixaEtariaFim_Apresenta, @Sexo_Label, @Sexo, @Sexo_Apresenta, @ConhecimentoIdioma_Label, @ConhecimentoIdioma, @ConhecimentoIdioma_Apresenta, @PerfilComposicaoEquipe_Label, @PerfilComposicaoEquipe, @PerfilComposicaoEquipe_Apresenta, @PerfilGestor_Label, @PerfilGestor, @PerfilGestor_Apresenta, @CursoEspecifico_Label, @CursoEspecifico, @CursoEspecifico_Apresenta, @Conhecimento_Label, @Conhecimento, @Conhecimento_Apresenta, @ConhecimentoInformatica_Label, @ConhecimentoInformatica, @ConhecimentoInformatica_Apresenta, @CompetenciaComportamental_Label, @CompetenciaComportamental, @CompetenciaComportamental_Apresenta, @CompetenciaProfissional_Label, @CompetenciaProfissional, @CompetenciaProfissional_Apresenta, @AspectoCritico_Label, @AspectoCritico, @AspectoCritico_Apresenta, @PrincipalDesafio_Label, @PrincipalDesafio, @PrincipalDesafio_Apresenta, @RelacionamentoInterno_Label, @RelacionamentoInterno, @RelacionamentoInterno_Apresenta, @RelacionamentoExterno_Label, @RelacionamentoExterno, @RelacionamentoExterno_Apresenta, @infoSobre_viagens_Label, @infoSobre_viagens, @infoSobre_viagens_Apresenta, @confidencial_Label, @confidencial, @confidencial_Apresenta)" 
                    SelectCommand="_USP_EDITOR_PESQUISA_VAGA" 
                    
                                    UpdateCommand="UPDATE [_tbVagaAnuncio] SET [Protocolo] = @Protocolo, [FormacaoAcademica_Label] = @FormacaoAcademica_Label, [FormacaoAcademica] = @FormacaoAcademica, [FormacaoAcademica_Apresenta] = @FormacaoAcademica_Apresenta, [dsPerfilVaga_Label] = @dsPerfilVaga_Label, [dsPerfilVaga] = @dsPerfilVaga, [dsPerfilVaga_Apresenta] = @dsPerfilVaga_Apresenta, [Cargo_Label] = @Cargo_Label, [Cargo] = @Cargo, [Cargo_Apresenta] = @Cargo_Apresenta, [nrovaga_Label] = @nrovaga_Label, [nrovaga] = @nrovaga, [nrovaga_Apresenta] = @nrovaga_Apresenta, [nmresponsavel_Label] = @nmresponsavel_Label, [nmresponsavel] = @nmresponsavel, [nmresponsavel_Apresenta] = @nmresponsavel_Apresenta, [TipoOportunidade_Label] = @TipoOportunidade_Label, [TipoOportunidade] = @TipoOportunidade, [TipoOportunidade_Apresenta] = @TipoOportunidade_Apresenta, [QualificacaoHabilidadesEspecificas_Label] = @QualificacaoHabilidadesEspecificas_Label, [QualificacaoHabilidadesEspecificas] = @QualificacaoHabilidadesEspecificas, [QualificacaoHabilidadesEspecificas_Apresenta] = @QualificacaoHabilidadesEspecificas_Apresenta, [Remuneracao_Label] = @Remuneracao_Label, [Remuneracao] = @Remuneracao, [Remuneracao_Apresenta] = @Remuneracao_Apresenta, [RemuneracaoVariavel_Label] = @RemuneracaoVariavel_Label, [RemuneracaoVariavel] = @RemuneracaoVariavel, [RemuneracaoVariavel_Apresenta] = @RemuneracaoVariavel_Apresenta, [Honorario_Label] = @Honorario_Label, [Honorario] = @Honorario, [Honorario_Apresenta] = @Honorario_Apresenta, [LocalTrabalho_Label] = @LocalTrabalho_Label, [LocalTrabalho] = @LocalTrabalho, [LocalTrabalho_Apresenta] = @LocalTrabalho_Apresenta, [ObsComplementares_Label] = @ObsComplementares_Label, [ObsComplementares] = @ObsComplementares, [ObsComplementares_Apresenta] = @ObsComplementares_Apresenta, [Beneficios_Label] = @Beneficios_Label, [Beneficios] = @Beneficios, [Beneficios_Apresenta] = @Beneficios_Apresenta, [Perspectiva_Label] = @Perspectiva_Label, [Perspectiva] = @Perspectiva, [Perspectiva_Apresenta] = @Perspectiva_Apresenta, [FaixaEtariaInicio_Label] = @FaixaEtariaInicio_Label, [FaixaEtariaInicio] = @FaixaEtariaInicio, [FaixaEtariaInicio_Apresenta] = @FaixaEtariaInicio_Apresenta, [FaixaEtariaFim_Label] = @FaixaEtariaFim_Label, [FaixaEtariaFim] = @FaixaEtariaFim, [FaixaEtariaFim_Apresenta] = @FaixaEtariaFim_Apresenta, [Sexo_Label] = @Sexo_Label, [Sexo] = @Sexo, [Sexo_Apresenta] = @Sexo_Apresenta, [ConhecimentoIdioma_Label] = @ConhecimentoIdioma_Label, [ConhecimentoIdioma] = @ConhecimentoIdioma, [ConhecimentoIdioma_Apresenta] = @ConhecimentoIdioma_Apresenta, [PerfilComposicaoEquipe_Label] = @PerfilComposicaoEquipe_Label, [PerfilComposicaoEquipe] = @PerfilComposicaoEquipe, [PerfilComposicaoEquipe_Apresenta] = @PerfilComposicaoEquipe_Apresenta, [PerfilGestor_Label] = @PerfilGestor_Label, [PerfilGestor] = @PerfilGestor, [PerfilGestor_Apresenta] = @PerfilGestor_Apresenta, [CursoEspecifico_Label] = @CursoEspecifico_Label, [CursoEspecifico] = @CursoEspecifico, [CursoEspecifico_Apresenta] = @CursoEspecifico_Apresenta, [Conhecimento_Label] = @Conhecimento_Label, [Conhecimento] = @Conhecimento, [Conhecimento_Apresenta] = @Conhecimento_Apresenta, [ConhecimentoInformatica_Label] = @ConhecimentoInformatica_Label, [ConhecimentoInformatica] = @ConhecimentoInformatica, [ConhecimentoInformatica_Apresenta] = @ConhecimentoInformatica_Apresenta, [CompetenciaComportamental_Label] = @CompetenciaComportamental_Label, [CompetenciaComportamental] = @CompetenciaComportamental, [CompetenciaComportamental_Apresenta] = @CompetenciaComportamental_Apresenta, [CompetenciaProfissional_Label] = @CompetenciaProfissional_Label, [CompetenciaProfissional] = @CompetenciaProfissional, [CompetenciaProfissional_Apresenta] = @CompetenciaProfissional_Apresenta, [AspectoCritico_Label] = @AspectoCritico_Label, [AspectoCritico] = @AspectoCritico, [AspectoCritico_Apresenta] = @AspectoCritico_Apresenta, [PrincipalDesafio_Label] = @PrincipalDesafio_Label, [PrincipalDesafio] = @PrincipalDesafio, [PrincipalDesafio_Apresenta] = @PrincipalDesafio_Apresenta, [RelacionamentoInterno_Label] = @RelacionamentoInterno_Label, [RelacionamentoInterno] = @RelacionamentoInterno, [RelacionamentoInterno_Apresenta] = @RelacionamentoInterno_Apresenta, [RelacionamentoExterno_Label] = @RelacionamentoExterno_Label, [RelacionamentoExterno] = @RelacionamentoExterno, [RelacionamentoExterno_Apresenta] = @RelacionamentoExterno_Apresenta, [infoSobre_viagens_Label] = @infoSobre_viagens_Label, [infoSobre_viagens] = @infoSobre_viagens, [infoSobre_viagens_Apresenta] = @infoSobre_viagens_Apresenta, [confidencial_Label] = @confidencial_Label, [confidencial] = @confidencial, [confidencial_Apresenta] = @confidencial_Apresenta WHERE [idVagaAnuncio] = @idVagaAnuncio" 
                                    SelectCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="idVagaAnuncio" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Protocolo" Type="String" />
                        <asp:Parameter Name="FormacaoAcademica_Label" Type="String" />
                        <asp:Parameter Name="FormacaoAcademica" Type="String" />
                        <asp:Parameter Name="FormacaoAcademica_Apresenta" Type="Int32" />
                        <asp:Parameter Name="dsPerfilVaga_Label" Type="String" />
                        <asp:Parameter Name="dsPerfilVaga" Type="String" />
                        <asp:Parameter Name="dsPerfilVaga_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Cargo_Label" Type="String" />
                        <asp:Parameter Name="Cargo" Type="String" />
                        <asp:Parameter Name="Cargo_Apresenta" Type="Int32" />
                        <asp:Parameter Name="nrovaga_Label" Type="String" />
                        <asp:Parameter Name="nrovaga" Type="Int32" />
                        <asp:Parameter Name="nrovaga_Apresenta" Type="Int32" />
                        <asp:Parameter Name="nmresponsavel_Label" Type="String" />
                        <asp:Parameter Name="nmresponsavel" Type="String" />
                        <asp:Parameter Name="nmresponsavel_Apresenta" Type="Int32" />
                        <asp:Parameter Name="TipoOportunidade_Label" Type="String" />
                        <asp:Parameter Name="TipoOportunidade" Type="String" />
                        <asp:Parameter Name="TipoOportunidade_Apresenta" Type="Int32" />
                        <asp:Parameter Name="QualificacaoHabilidadesEspecificas_Label" Type="String" />
                        <asp:Parameter Name="QualificacaoHabilidadesEspecificas" Type="String" />
                        <asp:Parameter Name="QualificacaoHabilidadesEspecificas_Apresenta" 
                            Type="Int32" />
                        <asp:Parameter Name="Remuneracao_Label" Type="String" />
                        <asp:Parameter Name="Remuneracao" Type="Decimal" />
                        <asp:Parameter Name="Remuneracao_Apresenta" Type="Int32" />
                        <asp:Parameter Name="RemuneracaoVariavel_Label" Type="String" />
                        <asp:Parameter Name="RemuneracaoVariavel" Type="Decimal" />
                        <asp:Parameter Name="RemuneracaoVariavel_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Honorario_Label" Type="String" />
                        <asp:Parameter Name="Honorario" Type="Decimal" />
                        <asp:Parameter Name="Honorario_Apresenta" Type="Int32" />
                        <asp:Parameter Name="LocalTrabalho_Label" Type="String" />
                        <asp:Parameter Name="LocalTrabalho" Type="String" />
                        <asp:Parameter Name="LocalTrabalho_Apresenta" Type="Int32" />
                        <asp:Parameter Name="ObsComplementares_Label" Type="String" />
                        <asp:Parameter Name="ObsComplementares" Type="String" />
                        <asp:Parameter Name="ObsComplementares_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Beneficios_Label" Type="String" />
                        <asp:Parameter Name="Beneficios" Type="String" />
                        <asp:Parameter Name="Beneficios_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Perspectiva_Label" Type="String" />
                        <asp:Parameter Name="Perspectiva" Type="String" />
                        <asp:Parameter Name="Perspectiva_Apresenta" Type="Int32" />
                        <asp:Parameter Name="FaixaEtariaInicio_Label" Type="String" />
                        <asp:Parameter Name="FaixaEtariaInicio" Type="Int32" />
                        <asp:Parameter Name="FaixaEtariaInicio_Apresenta" Type="Int32" />
                        <asp:Parameter Name="FaixaEtariaFim_Label" Type="String" />
                        <asp:Parameter Name="FaixaEtariaFim" Type="Int32" />
                        <asp:Parameter Name="FaixaEtariaFim_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Sexo_Label" Type="String" />
                        <asp:Parameter Name="Sexo" Type="String" />
                        <asp:Parameter Name="Sexo_Apresenta" Type="Int32" />
                        <asp:Parameter Name="ConhecimentoIdioma_Label" Type="String" />
                        <asp:Parameter Name="ConhecimentoIdioma" Type="String" />
                        <asp:Parameter Name="ConhecimentoIdioma_Apresenta" Type="Int32" />
                        <asp:Parameter Name="PerfilComposicaoEquipe_Label" Type="String" />
                        <asp:Parameter Name="PerfilComposicaoEquipe" Type="String" />
                        <asp:Parameter Name="PerfilComposicaoEquipe_Apresenta" Type="Int32" />
                        <asp:Parameter Name="PerfilGestor_Label" Type="String" />
                        <asp:Parameter Name="PerfilGestor" Type="String" />
                        <asp:Parameter Name="PerfilGestor_Apresenta" Type="Int32" />
                        <asp:Parameter Name="CursoEspecifico_Label" Type="String" />
                        <asp:Parameter Name="CursoEspecifico" Type="String" />
                        <asp:Parameter Name="CursoEspecifico_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Conhecimento_Label" Type="String" />
                        <asp:Parameter Name="Conhecimento" Type="String" />
                        <asp:Parameter Name="Conhecimento_Apresenta" Type="Int32" />
                        <asp:Parameter Name="ConhecimentoInformatica_Label" Type="String" />
                        <asp:Parameter Name="ConhecimentoInformatica" Type="String" />
                        <asp:Parameter Name="ConhecimentoInformatica_Apresenta" Type="Int32" />
                        <asp:Parameter Name="CompetenciaComportamental_Label" Type="String" />
                        <asp:Parameter Name="CompetenciaComportamental" Type="String" />
                        <asp:Parameter Name="CompetenciaComportamental_Apresenta" Type="Int32" />
                        <asp:Parameter Name="CompetenciaProfissional_Label" Type="String" />
                        <asp:Parameter Name="CompetenciaProfissional" Type="String" />
                        <asp:Parameter Name="CompetenciaProfissional_Apresenta" Type="Int32" />
                        <asp:Parameter Name="AspectoCritico_Label" Type="String" />
                        <asp:Parameter Name="AspectoCritico" Type="String" />
                        <asp:Parameter Name="AspectoCritico_Apresenta" Type="Int32" />
                        <asp:Parameter Name="PrincipalDesafio_Label" Type="String" />
                        <asp:Parameter Name="PrincipalDesafio" Type="String" />
                        <asp:Parameter Name="PrincipalDesafio_Apresenta" Type="Int32" />
                        <asp:Parameter Name="RelacionamentoInterno_Label" Type="String" />
                        <asp:Parameter Name="RelacionamentoInterno" Type="String" />
                        <asp:Parameter Name="RelacionamentoInterno_Apresenta" Type="Int32" />
                        <asp:Parameter Name="RelacionamentoExterno_Label" Type="String" />
                        <asp:Parameter Name="RelacionamentoExterno" Type="String" />
                        <asp:Parameter Name="RelacionamentoExterno_Apresenta" Type="Int32" />
                        <asp:Parameter Name="infoSobre_viagens_Label" Type="String" />
                        <asp:Parameter Name="infoSobre_viagens" Type="String" />
                        <asp:Parameter Name="infoSobre_viagens_Apresenta" Type="Int32" />
                        <asp:Parameter Name="confidencial_Label" Type="String" />
                        <asp:Parameter Name="confidencial" Type="Boolean" />
                        <asp:Parameter Name="confidencial_Apresenta" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="idVagaLabel" Name="idVaga" 
                            PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Protocolo" Type="String" />
                        <asp:Parameter Name="FormacaoAcademica_Label" Type="String" />
                        <asp:Parameter Name="FormacaoAcademica" Type="String" />
                        <asp:Parameter Name="FormacaoAcademica_Apresenta" Type="Int32" />
                        <asp:Parameter Name="dsPerfilVaga_Label" Type="String" />
                        <asp:Parameter Name="dsPerfilVaga" Type="String" />
                        <asp:Parameter Name="dsPerfilVaga_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Cargo_Label" Type="String" />
                        <asp:Parameter Name="Cargo" Type="String" />
                        <asp:Parameter Name="Cargo_Apresenta" Type="Int32" />
                        <asp:Parameter Name="nrovaga_Label" Type="String" />
                        <asp:Parameter Name="nrovaga" Type="Int32" />
                        <asp:Parameter Name="nrovaga_Apresenta" Type="Int32" />
                        <asp:Parameter Name="nmresponsavel_Label" Type="String" />
                        <asp:Parameter Name="nmresponsavel" Type="String" />
                        <asp:Parameter Name="nmresponsavel_Apresenta" Type="Int32" />
                        <asp:Parameter Name="TipoOportunidade_Label" Type="String" />
                        <asp:Parameter Name="TipoOportunidade" Type="String" />
                        <asp:Parameter Name="TipoOportunidade_Apresenta" Type="Int32" />
                        <asp:Parameter Name="QualificacaoHabilidadesEspecificas_Label" Type="String" />
                        <asp:Parameter Name="QualificacaoHabilidadesEspecificas" Type="String" />
                        <asp:Parameter Name="QualificacaoHabilidadesEspecificas_Apresenta" 
                            Type="Int32" />
                        <asp:Parameter Name="Remuneracao_Label" Type="String" />
                        <asp:Parameter Name="Remuneracao" Type="Decimal" />
                        <asp:Parameter Name="Remuneracao_Apresenta" Type="Int32" />
                        <asp:Parameter Name="RemuneracaoVariavel_Label" Type="String" />
                        <asp:Parameter Name="RemuneracaoVariavel" Type="Decimal" />
                        <asp:Parameter Name="RemuneracaoVariavel_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Honorario_Label" Type="String" />
                        <asp:Parameter Name="Honorario" Type="Decimal" />
                        <asp:Parameter Name="Honorario_Apresenta" Type="Int32" />
                        <asp:Parameter Name="LocalTrabalho_Label" Type="String" />
                        <asp:Parameter Name="LocalTrabalho" Type="String" />
                        <asp:Parameter Name="LocalTrabalho_Apresenta" Type="Int32" />
                        <asp:Parameter Name="ObsComplementares_Label" Type="String" />
                        <asp:Parameter Name="ObsComplementares" Type="String" />
                        <asp:Parameter Name="ObsComplementares_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Beneficios_Label" Type="String" />
                        <asp:Parameter Name="Beneficios" Type="String" />
                        <asp:Parameter Name="Beneficios_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Perspectiva_Label" Type="String" />
                        <asp:Parameter Name="Perspectiva" Type="String" />
                        <asp:Parameter Name="Perspectiva_Apresenta" Type="Int32" />
                        <asp:Parameter Name="FaixaEtariaInicio_Label" Type="String" />
                        <asp:Parameter Name="FaixaEtariaInicio" Type="Int32" />
                        <asp:Parameter Name="FaixaEtariaInicio_Apresenta" Type="Int32" />
                        <asp:Parameter Name="FaixaEtariaFim_Label" Type="String" />
                        <asp:Parameter Name="FaixaEtariaFim" Type="Int32" />
                        <asp:Parameter Name="FaixaEtariaFim_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Sexo_Label" Type="String" />
                        <asp:Parameter Name="Sexo" Type="String" />
                        <asp:Parameter Name="Sexo_Apresenta" Type="Int32" />
                        <asp:Parameter Name="ConhecimentoIdioma_Label" Type="String" />
                        <asp:Parameter Name="ConhecimentoIdioma" Type="String" />
                        <asp:Parameter Name="ConhecimentoIdioma_Apresenta" Type="Int32" />
                        <asp:Parameter Name="PerfilComposicaoEquipe_Label" Type="String" />
                        <asp:Parameter Name="PerfilComposicaoEquipe" Type="String" />
                        <asp:Parameter Name="PerfilComposicaoEquipe_Apresenta" Type="Int32" />
                        <asp:Parameter Name="PerfilGestor_Label" Type="String" />
                        <asp:Parameter Name="PerfilGestor" Type="String" />
                        <asp:Parameter Name="PerfilGestor_Apresenta" Type="Int32" />
                        <asp:Parameter Name="CursoEspecifico_Label" Type="String" />
                        <asp:Parameter Name="CursoEspecifico" Type="String" />
                        <asp:Parameter Name="CursoEspecifico_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Conhecimento_Label" Type="String" />
                        <asp:Parameter Name="Conhecimento" Type="String" />
                        <asp:Parameter Name="Conhecimento_Apresenta" Type="Int32" />
                        <asp:Parameter Name="ConhecimentoInformatica_Label" Type="String" />
                        <asp:Parameter Name="ConhecimentoInformatica" Type="String" />
                        <asp:Parameter Name="ConhecimentoInformatica_Apresenta" Type="Int32" />
                        <asp:Parameter Name="CompetenciaComportamental_Label" Type="String" />
                        <asp:Parameter Name="CompetenciaComportamental" Type="String" />
                        <asp:Parameter Name="CompetenciaComportamental_Apresenta" Type="Int32" />
                        <asp:Parameter Name="CompetenciaProfissional_Label" Type="String" />
                        <asp:Parameter Name="CompetenciaProfissional" Type="String" />
                        <asp:Parameter Name="CompetenciaProfissional_Apresenta" Type="Int32" />
                        <asp:Parameter Name="AspectoCritico_Label" Type="String" />
                        <asp:Parameter Name="AspectoCritico" Type="String" />
                        <asp:Parameter Name="AspectoCritico_Apresenta" Type="Int32" />
                        <asp:Parameter Name="PrincipalDesafio_Label" Type="String" />
                        <asp:Parameter Name="PrincipalDesafio" Type="String" />
                        <asp:Parameter Name="PrincipalDesafio_Apresenta" Type="Int32" />
                        <asp:Parameter Name="RelacionamentoInterno_Label" Type="String" />
                        <asp:Parameter Name="RelacionamentoInterno" Type="String" />
                        <asp:Parameter Name="RelacionamentoInterno_Apresenta" Type="Int32" />
                        <asp:Parameter Name="RelacionamentoExterno_Label" Type="String" />
                        <asp:Parameter Name="RelacionamentoExterno" Type="String" />
                        <asp:Parameter Name="RelacionamentoExterno_Apresenta" Type="Int32" />
                        <asp:Parameter Name="infoSobre_viagens_Label" Type="String" />
                        <asp:Parameter Name="infoSobre_viagens" Type="String" />
                        <asp:Parameter Name="infoSobre_viagens_Apresenta" Type="Int32" />
                        <asp:Parameter Name="confidencial_Label" Type="String" />
                        <asp:Parameter Name="confidencial" Type="Boolean" />
                        <asp:Parameter Name="confidencial_Apresenta" Type="Int32" />
                        <asp:Parameter Name="idVagaAnuncio" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSourceVALIDADE" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" DeleteCommand="DELETE FROM [_tbVaga] WHERE [idVaga] = @idVaga" InsertCommand="INSERT INTO [_tbVaga] ([Protocolo], [dsfuncao], [data_ini], [data_fim], [liberarEmail], [publicar], [cnt]) VALUES (@Protocolo, @dsfuncao, @data_ini, @data_fim, @liberarEmail, @publicar, @cnt)" SelectCommand="SELECT [idVaga], [Protocolo], [dsfuncao], [data_ini], [data_fim], [liberarEmail], [publicar], [cnt] FROM [_tbVaga] WHERE ([idVaga] = @idVaga)" UpdateCommand="UPDATE [_tbVaga] SET [Protocolo] = @Protocolo, [dsfuncao] = @dsfuncao, [data_ini] = @data_ini, [data_fim] = @data_fim, [liberarEmail] = @liberarEmail, [publicar] = @publicar, [cnt] = @cnt WHERE [idVaga] = @idVaga">
                                    <DeleteParameters>
                                        <asp:Parameter Name="idVaga" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Protocolo" Type="String" />
                                        <asp:Parameter Name="dsfuncao" Type="String" />
                                        <asp:Parameter Name="data_ini" Type="DateTime" />
                                        <asp:Parameter Name="data_fim" Type="DateTime" />
                                        <asp:Parameter Name="liberarEmail" Type="Boolean" />
                                        <asp:Parameter Name="publicar" Type="Boolean" />
                                        <asp:Parameter Name="cnt" Type="Int32" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idVagaVALIDADELabel" Name="idVaga" PropertyName="Text" Type="Int32" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Protocolo" Type="String" />
                                        <asp:Parameter Name="dsfuncao" Type="String" />
                                        <asp:Parameter Name="data_ini" Type="DateTime" />
                                        <asp:Parameter Name="data_fim" Type="DateTime" />
                                        <asp:Parameter Name="liberarEmail" Type="Boolean" />
                                        <asp:Parameter Name="publicar" Type="Boolean" />
                                        <asp:Parameter Name="cnt" Type="Int32" />
                                        <asp:Parameter Name="idVaga" Type="Int32" />
                                    </UpdateParameters>
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


