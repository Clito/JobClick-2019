<%@ Page Title="" Language="VB" MasterPageFile="~/_corporativo/corporativoPage.master" AutoEventWireup="false" CodeFile="setup.aspx.vb" Inherits="_corporativo_setup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
            $("#SETUPPRINCIPAL").accordion({ autoHeight: false, fillSpace: false, active: <%=ActiveAccordeon.Value%> });
        });

        function f(varAccordeon)
        {
            $("input[id*='ActiveAccordeon']").val(varAccordeon)
        };
	</script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up"} });
        });
	</script>
        <div>
        <input id="ActiveAccordeon" type="hidden" runat="server"  value="0" />
        <table cellpadding="0" cellspacing="0" align="center" width="880px">
            <tr>
                <td>
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
                    <br />
                    <br />
                    <asp:Label ID="LabelPesquisadosProcessosSeletivos" runat="server" CssClass="h1" 
                                    Text="Aderência, triagem e ranqueamento de Currículos"></asp:Label>
                    <table cellpadding="0" cellspacing="0" id="BodyInterno" width="880px" align="center">
                        <tr>
                            <td align="left">
                                <div id="SETUPPRINCIPAL">
                                    <h3><a href="#" onclick="javascript: f(0);">Triagem e Ranqueamento de Currículos</a></h3>
                                    <div>
                                        <asp:Label ID="Label58" runat="server" Text="Nesta área você utilizará o &lt;b&gt;filtro de aderência&lt;/b&gt; para ranquear os candidatos de sua base de talentos, os resultados serão enviados em bloco configurados por você para seu e-mail. Defina também qual a periodicidade e o horário que você deseja recebe-lo."></asp:Label>
                                        <asp:Label ID="idPerfilVagaLabel" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="TEXTOPESQUISALabel" runat="server" Visible="False"></asp:Label>
                                        <br />
                                        <br />
                                        <table cellpadding="2" cellspacing="2">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="LabelPESQUISA" runat="server" Text="Para iniciar, informe o nome da vaga ou parte dela:"></asp:Label>
                                                    <br />
                                <asp:TextBox ID="TextBoxPesquisaPS" runat="server" 
                                    CssClass="InputCadFormCandidatoCV" ValidationGroup="PESQUISA" 
                                    ToolTip="Informe o nome ou o número do Processo Seletivo" Width="450px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:LinkButton ID="LinkButtonENVIAR" runat="server" CssClass="button" ToolTip="Clique aqui para pesquisar">Enviar</asp:LinkButton>
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:LinkButton ID="LinkButtonLIMPAR" runat="server" CssClass="button">Limpar</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <asp:FormView ID="FormViewADERENCIA" runat="server" DataSourceID="SqlDataSourceADERENCIA" DefaultMode="Edit" Width="100%">
                                            <EditItemTemplate>
                                                <table id="ADERENCIA" cellpadding="5" cellspacing="5" width="870px">
                                                    <tr>
                                                        <td width="400px" align="right">
                                                            <asp:Label ID="Label16" runat="server" CssClass="textoApresentaNOMECV" Text="Critérios utilizados para a aderência"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label17" runat="server" CssClass="textoApresentaNOMECV" Text="Peso dos critérios"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right" bgcolor="#F9F9F9">
                                                            <asp:Label ID="Label18" runat="server" Text="Idade:"></asp:Label>
                                                        </td>
                                                        <td bgcolor="#F9F9F9">
                                                            <table id="CRITERIO01" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label41" runat="server" Text="Peso:"></asp:Label>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="DropDownListPeso001" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Peso_Aderencia_Idade") %>' Width="50px">
                                                                            <asp:ListItem>1</asp:ListItem>
                                                                            <asp:ListItem>2</asp:ListItem>
                                                                            <asp:ListItem>3</asp:ListItem>
                                                                            <asp:ListItem>4</asp:ListItem>
                                                                            <asp:ListItem>5</asp:ListItem>
                                                                            <asp:ListItem>6</asp:ListItem>
                                                                            <asp:ListItem>7</asp:ListItem>
                                                                            <asp:ListItem>8</asp:ListItem>
                                                                            <asp:ListItem>9</asp:ListItem>
                                                                            <asp:ListItem>10</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Classificatorio_Aderencia_Idade") %>'>
                                                                            <asp:ListItem Value="True">Classificatório</asp:ListItem>
                                                                            <asp:ListItem Value="False">Eliminatório</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right">
                                                            <asp:Label ID="Label19" runat="server" Text="Sexo:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <table id="CRITERIO2" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label42" runat="server" Text="Peso:"></asp:Label>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="DropDownListPeso2" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Peso_Aderencia_Sexo") %>' Width="50px">
                                                                            <asp:ListItem>1</asp:ListItem>
                                                                            <asp:ListItem>2</asp:ListItem>
                                                                            <asp:ListItem>3</asp:ListItem>
                                                                            <asp:ListItem>4</asp:ListItem>
                                                                            <asp:ListItem>5</asp:ListItem>
                                                                            <asp:ListItem>6</asp:ListItem>
                                                                            <asp:ListItem>7</asp:ListItem>
                                                                            <asp:ListItem>8</asp:ListItem>
                                                                            <asp:ListItem>9</asp:ListItem>
                                                                            <asp:ListItem>10</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Classificatorio_Aderencia_Sexo") %>'>
                                                                            <asp:ListItem Value="True">Classificatório</asp:ListItem>
                                                                            <asp:ListItem Value="False">Eliminatório</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right" bgcolor="#F9F9F9">
                                                            <asp:Label ID="Label20" runat="server" Text="Pretensão Salarial:"></asp:Label>
                                                        </td>
                                                        <td bgcolor="#F9F9F9">
                                                            <table id="CRITERIO3" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label43" runat="server" Text="Peso:"></asp:Label>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="DropDownListPeso3" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Peso_Aderencia_PretencaoSalarial") %>' Width="50px">
                                                                            <asp:ListItem>1</asp:ListItem>
                                                                            <asp:ListItem>2</asp:ListItem>
                                                                            <asp:ListItem>3</asp:ListItem>
                                                                            <asp:ListItem>4</asp:ListItem>
                                                                            <asp:ListItem>5</asp:ListItem>
                                                                            <asp:ListItem>6</asp:ListItem>
                                                                            <asp:ListItem>7</asp:ListItem>
                                                                            <asp:ListItem>8</asp:ListItem>
                                                                            <asp:ListItem>9</asp:ListItem>
                                                                            <asp:ListItem>10</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList5" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Classificatorio_Aderencia_PretencaoSalarial") %>'>
                                                                            <asp:ListItem Value="True">Classificatório</asp:ListItem>
                                                                            <asp:ListItem Value="False">Eliminatório</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right">
                                                            <asp:Label ID="Label21" runat="server" Text="Formação Acadêmica:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <table id="CRITERIO4" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label44" runat="server" Text="Peso:"></asp:Label>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="DropDownListPeso4" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Peso_Aderencia_FormacaoAcademica") %>' Width="50px">
                                                                            <asp:ListItem>1</asp:ListItem>
                                                                            <asp:ListItem>2</asp:ListItem>
                                                                            <asp:ListItem>3</asp:ListItem>
                                                                            <asp:ListItem>4</asp:ListItem>
                                                                            <asp:ListItem>5</asp:ListItem>
                                                                            <asp:ListItem>6</asp:ListItem>
                                                                            <asp:ListItem>7</asp:ListItem>
                                                                            <asp:ListItem>8</asp:ListItem>
                                                                            <asp:ListItem>9</asp:ListItem>
                                                                            <asp:ListItem>10</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList6" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Classificatorio_Aderencia_FormacaoAcademica") %>'>
                                                                            <asp:ListItem Value="True">Classificatório</asp:ListItem>
                                                                            <asp:ListItem Value="False">Eliminatório</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right" bgcolor="#F9F9F9">
                                                            <asp:Label ID="Label22" runat="server" Text="Instituição Acadêmica:"></asp:Label>
                                                        </td>
                                                        <td bgcolor="#F9F9F9">
                                                            <table id="CRITERIO5" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label45" runat="server" Text="Peso:"></asp:Label>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="DropDownListPeso5" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Peso_Aderencia_FormacaoAcademica_Instituicao") %>' Width="50px">
                                                                            <asp:ListItem>1</asp:ListItem>
                                                                            <asp:ListItem>2</asp:ListItem>
                                                                            <asp:ListItem>3</asp:ListItem>
                                                                            <asp:ListItem>4</asp:ListItem>
                                                                            <asp:ListItem>5</asp:ListItem>
                                                                            <asp:ListItem>6</asp:ListItem>
                                                                            <asp:ListItem>7</asp:ListItem>
                                                                            <asp:ListItem>8</asp:ListItem>
                                                                            <asp:ListItem>9</asp:ListItem>
                                                                            <asp:ListItem>10</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList7" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Classificatorio_Aderencia_FormacaoAcademica_Instituicao") %>'>
                                                                            <asp:ListItem Value="True">Classificatório</asp:ListItem>
                                                                            <asp:ListItem Value="False">Eliminatório</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right">
                                                            <asp:Label ID="Label23" runat="server" Text="Estado (UF):"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <table id="CRITERIO6" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label46" runat="server" Text="Peso:"></asp:Label>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="DropDownListPeso6" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Peso_Aderencia_UF") %>' Width="50px">
                                                                            <asp:ListItem>1</asp:ListItem>
                                                                            <asp:ListItem>2</asp:ListItem>
                                                                            <asp:ListItem>3</asp:ListItem>
                                                                            <asp:ListItem>4</asp:ListItem>
                                                                            <asp:ListItem>5</asp:ListItem>
                                                                            <asp:ListItem>6</asp:ListItem>
                                                                            <asp:ListItem>7</asp:ListItem>
                                                                            <asp:ListItem>8</asp:ListItem>
                                                                            <asp:ListItem>9</asp:ListItem>
                                                                            <asp:ListItem>10</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList8" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Classificatorio_Aderencia_UF") %>'>
                                                                            <asp:ListItem Value="True">Classificatório</asp:ListItem>
                                                                            <asp:ListItem Value="False">Eliminatório</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right" bgcolor="#F9F9F9">
                                                            <asp:Label ID="Label24" runat="server" Text="Local de Trabalho:"></asp:Label>
                                                        </td>
                                                        <td bgcolor="#F9F9F9">
                                                            <table id="CRITERIO7" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label47" runat="server" Text="Peso:"></asp:Label>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="DropDownListPeso7" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Peso_Aderencia_LocalTrabalho") %>' Width="50px">
                                                                            <asp:ListItem>1</asp:ListItem>
                                                                            <asp:ListItem>2</asp:ListItem>
                                                                            <asp:ListItem>3</asp:ListItem>
                                                                            <asp:ListItem>4</asp:ListItem>
                                                                            <asp:ListItem>5</asp:ListItem>
                                                                            <asp:ListItem>6</asp:ListItem>
                                                                            <asp:ListItem>7</asp:ListItem>
                                                                            <asp:ListItem>8</asp:ListItem>
                                                                            <asp:ListItem>9</asp:ListItem>
                                                                            <asp:ListItem>10</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList9" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Classificatorio_Aderencia_LocalTrabalho") %>'>
                                                                            <asp:ListItem Value="True">Classificatório</asp:ListItem>
                                                                            <asp:ListItem Value="False">Eliminatório</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right">
                                                            <asp:Label ID="Label25" runat="server" Text="Área de Interesse:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <table id="CRITERIO8" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label48" runat="server" Text="Peso:"></asp:Label>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="DropDownListPeso8" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Peso_Aderencia_AreaInteresse") %>' Width="50px">
                                                                            <asp:ListItem>1</asp:ListItem>
                                                                            <asp:ListItem>2</asp:ListItem>
                                                                            <asp:ListItem>3</asp:ListItem>
                                                                            <asp:ListItem>4</asp:ListItem>
                                                                            <asp:ListItem>5</asp:ListItem>
                                                                            <asp:ListItem>6</asp:ListItem>
                                                                            <asp:ListItem>7</asp:ListItem>
                                                                            <asp:ListItem>8</asp:ListItem>
                                                                            <asp:ListItem>9</asp:ListItem>
                                                                            <asp:ListItem>10</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList10" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Classificatorio_Aderencia_AreaInteresse") %>'>
                                                                            <asp:ListItem Value="True">Classificatório</asp:ListItem>
                                                                            <asp:ListItem Value="False">Eliminatório</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right" bgcolor="#F9F9F9">
                                                            <asp:Label ID="Label26" runat="server" Text="Experiência:"></asp:Label>
                                                        </td>
                                                        <td bgcolor="#F9F9F9">
                                                            <table id="CRITERIO9" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label49" runat="server" Text="Peso:"></asp:Label>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="DropDownListPeso9" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Peso_Aderencia_ExperienciaCBO") %>' Width="50px">
                                                                            <asp:ListItem>1</asp:ListItem>
                                                                            <asp:ListItem>2</asp:ListItem>
                                                                            <asp:ListItem>3</asp:ListItem>
                                                                            <asp:ListItem>4</asp:ListItem>
                                                                            <asp:ListItem>5</asp:ListItem>
                                                                            <asp:ListItem>6</asp:ListItem>
                                                                            <asp:ListItem>7</asp:ListItem>
                                                                            <asp:ListItem>8</asp:ListItem>
                                                                            <asp:ListItem>9</asp:ListItem>
                                                                            <asp:ListItem>10</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList11" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Classificatorio_Aderencia_ExperienciaCBO") %>'>
                                                                            <asp:ListItem Value="True">Classificatório</asp:ListItem>
                                                                            <asp:ListItem Value="False">Eliminatório</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right">
                                                            <asp:Label ID="Label27" runat="server" Text="Experiência na Área:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <table id="CRITERIO10" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label50" runat="server" Text="Peso:"></asp:Label>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="DropDownListPeso10" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Peso_Aderencia_ExperienciaArea") %>' Width="50px">
                                                                            <asp:ListItem>1</asp:ListItem>
                                                                            <asp:ListItem>2</asp:ListItem>
                                                                            <asp:ListItem>3</asp:ListItem>
                                                                            <asp:ListItem>4</asp:ListItem>
                                                                            <asp:ListItem>5</asp:ListItem>
                                                                            <asp:ListItem>6</asp:ListItem>
                                                                            <asp:ListItem>7</asp:ListItem>
                                                                            <asp:ListItem>8</asp:ListItem>
                                                                            <asp:ListItem>9</asp:ListItem>
                                                                            <asp:ListItem>10</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList12" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Classificatorio_Aderencia_ExperienciaArea") %>'>
                                                                            <asp:ListItem Value="True">Classificatório</asp:ListItem>
                                                                            <asp:ListItem Value="False">Eliminatório</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right" bgcolor="#F9F9F9">
                                                            <asp:Label ID="Label28" runat="server" Text="Experiência (Anos):"></asp:Label>
                                                        </td>
                                                        <td bgcolor="#F9F9F9">
                                                            <table id="CRITERIO11" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label51" runat="server" Text="Peso:"></asp:Label>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="DropDownListPeso11" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Peso_Aderencia_ExperienciaAnos") %>' Width="50px">
                                                                            <asp:ListItem>1</asp:ListItem>
                                                                            <asp:ListItem>2</asp:ListItem>
                                                                            <asp:ListItem>3</asp:ListItem>
                                                                            <asp:ListItem>4</asp:ListItem>
                                                                            <asp:ListItem>5</asp:ListItem>
                                                                            <asp:ListItem>6</asp:ListItem>
                                                                            <asp:ListItem>7</asp:ListItem>
                                                                            <asp:ListItem>8</asp:ListItem>
                                                                            <asp:ListItem>9</asp:ListItem>
                                                                            <asp:ListItem>10</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList13" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Classificatorio_Aderencia_ExperienciaAnos") %>'>
                                                                            <asp:ListItem Value="True">Classificatório</asp:ListItem>
                                                                            <asp:ListItem Value="False">Eliminatório</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right">
                                                            <asp:Label ID="Label29" runat="server" Text="Conhecimento em Informática:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <table id="CRITERIO12" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label52" runat="server" Text="Peso:"></asp:Label>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="DropDownListPeso12" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Peso_Aderencia_ConhecimentoInformatica") %>' Width="50px">
                                                                            <asp:ListItem>1</asp:ListItem>
                                                                            <asp:ListItem>2</asp:ListItem>
                                                                            <asp:ListItem>3</asp:ListItem>
                                                                            <asp:ListItem>4</asp:ListItem>
                                                                            <asp:ListItem>5</asp:ListItem>
                                                                            <asp:ListItem>6</asp:ListItem>
                                                                            <asp:ListItem>7</asp:ListItem>
                                                                            <asp:ListItem>8</asp:ListItem>
                                                                            <asp:ListItem>9</asp:ListItem>
                                                                            <asp:ListItem>10</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList14" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Classificatorio_Aderencia_ConhecimentoInformatica") %>'>
                                                                            <asp:ListItem Value="True">Classificatório</asp:ListItem>
                                                                            <asp:ListItem Value="False">Eliminatório</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right" bgcolor="#F9F9F9">
                                                            <asp:Label ID="Label30" runat="server" Text="Conhecimento em Software:"></asp:Label>
                                                        </td>
                                                        <td bgcolor="#F9F9F9">
                                                            <table id="CRITERIO13" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label53" runat="server" Text="Peso:"></asp:Label>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="DropDownListPeso13" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Peso_Aderencia_ConhecimentoInformatica_Software") %>' Width="50px">
                                                                            <asp:ListItem>1</asp:ListItem>
                                                                            <asp:ListItem>2</asp:ListItem>
                                                                            <asp:ListItem>3</asp:ListItem>
                                                                            <asp:ListItem>4</asp:ListItem>
                                                                            <asp:ListItem>5</asp:ListItem>
                                                                            <asp:ListItem>6</asp:ListItem>
                                                                            <asp:ListItem>7</asp:ListItem>
                                                                            <asp:ListItem>8</asp:ListItem>
                                                                            <asp:ListItem>9</asp:ListItem>
                                                                            <asp:ListItem>10</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList15" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Classificatorio_Aderencia_ConhecimentoInformatica_Software") %>'>
                                                                            <asp:ListItem Value="True">Classificatório</asp:ListItem>
                                                                            <asp:ListItem Value="False">Eliminatório</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right">
                                                            <asp:Label ID="Label31" runat="server" Text=" Nível de Conhecimento em Software:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <table id="CRITERIO14" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label54" runat="server" Text="Peso:"></asp:Label>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="DropDownListPeso14" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Peso_Aderencia_ConhecimentoInformatica_Grau") %>' Width="50px">
                                                                            <asp:ListItem>1</asp:ListItem>
                                                                            <asp:ListItem>2</asp:ListItem>
                                                                            <asp:ListItem>3</asp:ListItem>
                                                                            <asp:ListItem>4</asp:ListItem>
                                                                            <asp:ListItem>5</asp:ListItem>
                                                                            <asp:ListItem>6</asp:ListItem>
                                                                            <asp:ListItem>7</asp:ListItem>
                                                                            <asp:ListItem>8</asp:ListItem>
                                                                            <asp:ListItem>9</asp:ListItem>
                                                                            <asp:ListItem>10</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList16" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Classificatorio_Aderencia_ConhecimentoInformatica_Grau") %>'>
                                                                            <asp:ListItem Value="True">Classificatório</asp:ListItem>
                                                                            <asp:ListItem Value="False">Eliminatório</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right" bgcolor="#F9F9F9">
                                                            <asp:Label ID="Label32" runat="server" Text="Idioma:"></asp:Label>
                                                        </td>
                                                        <td bgcolor="#F9F9F9">
                                                            <table id="CRITERIO15" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label55" runat="server" Text="Peso:"></asp:Label>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="DropDownListPeso15" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Peso_Aderencia_Idioma") %>' Width="50px">
                                                                            <asp:ListItem>1</asp:ListItem>
                                                                            <asp:ListItem>2</asp:ListItem>
                                                                            <asp:ListItem>3</asp:ListItem>
                                                                            <asp:ListItem>4</asp:ListItem>
                                                                            <asp:ListItem>5</asp:ListItem>
                                                                            <asp:ListItem>6</asp:ListItem>
                                                                            <asp:ListItem>7</asp:ListItem>
                                                                            <asp:ListItem>8</asp:ListItem>
                                                                            <asp:ListItem>9</asp:ListItem>
                                                                            <asp:ListItem>10</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList17" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Classificatorio_Aderencia_Idioma") %>'>
                                                                            <asp:ListItem Value="True">Classificatório</asp:ListItem>
                                                                            <asp:ListItem Value="False">Eliminatório</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right">
                                                            <asp:Label ID="Label33" runat="server" Text="Idioma Proficiência:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <table id="CRITERIO16" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label56" runat="server" Text="Peso:"></asp:Label>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="DropDownListPeso16" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Peso_Aderencia_Idioma_Proficiencia") %>' Width="50px">
                                                                            <asp:ListItem>1</asp:ListItem>
                                                                            <asp:ListItem>2</asp:ListItem>
                                                                            <asp:ListItem>3</asp:ListItem>
                                                                            <asp:ListItem>4</asp:ListItem>
                                                                            <asp:ListItem>5</asp:ListItem>
                                                                            <asp:ListItem>6</asp:ListItem>
                                                                            <asp:ListItem>7</asp:ListItem>
                                                                            <asp:ListItem>8</asp:ListItem>
                                                                            <asp:ListItem>9</asp:ListItem>
                                                                            <asp:ListItem>10</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList18" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Classificatorio_Aderencia_Idioma_Proficiencia") %>'>
                                                                            <asp:ListItem Value="True">Classificatório</asp:ListItem>
                                                                            <asp:ListItem Value="False">Eliminatório</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right" bgcolor="#F9F9F9">
                                                            <asp:Label ID="Label34" runat="server" Text="Idioma Nível:"></asp:Label>
                                                        </td>
                                                        <td align="#F9F9F9">
                                                            <table id="CRITERIO17" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label57" runat="server" Text="Peso:"></asp:Label>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="DropDownListPeso18" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Peso_Aderencia_Nivel_Profissional") %>' Width="50px">
                                                                            <asp:ListItem>1</asp:ListItem>
                                                                            <asp:ListItem>2</asp:ListItem>
                                                                            <asp:ListItem>3</asp:ListItem>
                                                                            <asp:ListItem>4</asp:ListItem>
                                                                            <asp:ListItem>5</asp:ListItem>
                                                                            <asp:ListItem>6</asp:ListItem>
                                                                            <asp:ListItem>7</asp:ListItem>
                                                                            <asp:ListItem>8</asp:ListItem>
                                                                            <asp:ListItem>9</asp:ListItem>
                                                                            <asp:ListItem>10</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RadioButtonList19" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("Classificatorio_Aderencia_Nivel_Profissional") %>'>
                                                                            <asp:ListItem Value="True">Classificatório</asp:ListItem>
                                                                            <asp:ListItem Value="False">Eliminatório</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right">
                                                            <asp:Label ID="Label35" runat="server" Text="Aderência Mínima na Pesquisa:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="DropDownListPeso17" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Aderencia_Minima_Porcentagem") %>' Width="80px">
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
                                                                <asp:ListItem Value="100">100%</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right" bgcolor="#F9F9F9">
                                                            <asp:Label ID="Label36" runat="server" Text="Quantos CVs por e-mail:"></asp:Label>
                                                        </td>
                                                        <td bgcolor="#F9F9F9">
                                                            <asp:TextBox ID="Email_Aderencia_QuantidadeTextBox" runat="server" CssClass="InputCadFormCandidatoCV" Text='<%# Bind("Email_Aderencia_Quantidade") %>' Width="75px" MaxLength="2" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right">
                                                            <asp:Label ID="Label37" runat="server" Text="de quantos em quantos dias deseja receber o e-mail:"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="DropDownListPeso19" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Email_Delay_Dias") %>' Width="150px">
                                                                <asp:ListItem Value="1">De 1 em 1 dia</asp:ListItem>
                                                                <asp:ListItem Value="2">De 2 em 2 dias</asp:ListItem>
                                                                <asp:ListItem Value="3">De 3 em 3 dias</asp:ListItem>
                                                                <asp:ListItem Value="4">De 4 em 4 dias</asp:ListItem>
                                                                <asp:ListItem Value="5">De 5 em 5 dias</asp:ListItem>
                                                                <asp:ListItem Value="6">De 6 em 6 dias</asp:ListItem>
                                                                <asp:ListItem Value="7">De 7 em 7 dias</asp:ListItem>
                                                                <asp:ListItem Value="8">De 8 em 8 dias</asp:ListItem>
                                                                <asp:ListItem Value="9">De 9 em 9 dias</asp:ListItem>
                                                                <asp:ListItem Value="10">De 10 em 10 dias</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right" bgcolor="#F9F9F9">
                                                            <asp:Label ID="Label38" runat="server" Text="Horário:"></asp:Label>
                                                        </td>
                                                        <td bgcolor="#F9F9F9">
                                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Email_Horario") %>' Width="150px">
                                                                <asp:ListItem>00:00:00</asp:ListItem>
                                                                <asp:ListItem>01:00:00</asp:ListItem>
                                                                <asp:ListItem>02:00:00</asp:ListItem>
                                                                <asp:ListItem>03:00:00</asp:ListItem>
                                                                <asp:ListItem>04:00:00</asp:ListItem>
                                                                <asp:ListItem>05:00:00</asp:ListItem>
                                                                <asp:ListItem>06:00:00</asp:ListItem>
                                                                <asp:ListItem>07:00:00</asp:ListItem>
                                                                <asp:ListItem>08:00:00</asp:ListItem>
                                                                <asp:ListItem>09:00:00</asp:ListItem>
                                                                <asp:ListItem>10:00:00</asp:ListItem>
                                                                <asp:ListItem>11:00:00</asp:ListItem>
                                                                <asp:ListItem>12:00:00</asp:ListItem>
                                                                <asp:ListItem>13:00:00</asp:ListItem>
                                                                <asp:ListItem>14:00:00</asp:ListItem>
                                                                <asp:ListItem>15:00:00</asp:ListItem>
                                                                <asp:ListItem>16:00:00</asp:ListItem>
                                                                <asp:ListItem>17:00:00</asp:ListItem>
                                                                <asp:ListItem>18:00:00</asp:ListItem>
                                                                <asp:ListItem>19:00:00</asp:ListItem>
                                                                <asp:ListItem>20:00:00</asp:ListItem>
                                                                <asp:ListItem>21:00:00</asp:ListItem>
                                                                <asp:ListItem>22:00:00</asp:ListItem>
                                                                <asp:ListItem>23:00:00</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right">
                                                            <asp:Label ID="Label39" runat="server" Text="Aderência Mínima (e-mail):"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="DropDownListPeso20" runat="server" CssClass="DropCadFormCandidatoCV" SelectedValue='<%# Bind("Email_Porcentagem_Minima")%>' Width="80px">
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
                                                                <asp:ListItem Value="100">100%</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right" bgcolor="#F9F9F9">
                                                            <asp:Label ID="Label40" runat="server" Text="Ativar:"></asp:Label>
                                                        </td>
                                                        <td bgcolor="#F9F9F9">
                                                            <asp:CheckBox ID="Email_flg_EnviarCheckBox" runat="server" Checked='<%# Bind("Email_flg_Enviar") %>' Text="Ativar o envio de e-mails" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="400px" align="right">&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                </table>
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="right">
                                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" CssClass="button" Text="Salvar Configurações" ToolTip="Clique aqui para salvar as configurações" />
                                                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CssClass="button" OnClick="UpdateCancelButton_Click" Text="Cancelar" ToolTip="Cancelar" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <br />
                                                &nbsp;
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                Peso_Aderencia_Idade:
                                                <asp:TextBox ID="Peso_Aderencia_IdadeTextBox" runat="server" Text='<%# Bind("Peso_Aderencia_Idade") %>' />
                                                <br />
                                                Classificatorio_Aderencia_Idade:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_IdadeCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_Idade") %>' />
                                                <br />
                                                Peso_Aderencia_Sexo:
                                                <asp:TextBox ID="Peso_Aderencia_SexoTextBox" runat="server" Text='<%# Bind("Peso_Aderencia_Sexo") %>' />
                                                <br />
                                                Classificatorio_Aderencia_Sexo:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_SexoCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_Sexo") %>' />
                                                <br />
                                                Peso_Aderencia_PretencaoSalarial:
                                                <asp:TextBox ID="Peso_Aderencia_PretencaoSalarialTextBox" runat="server" Text='<%# Bind("Peso_Aderencia_PretencaoSalarial") %>' />
                                                <br />
                                                Classificatorio_Aderencia_PretencaoSalarial:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_PretencaoSalarialCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_PretencaoSalarial") %>' />
                                                <br />
                                                Peso_Aderencia_FormacaoAcademica:
                                                <asp:TextBox ID="Peso_Aderencia_FormacaoAcademicaTextBox" runat="server" Text='<%# Bind("Peso_Aderencia_FormacaoAcademica") %>' />
                                                <br />
                                                Classificatorio_Aderencia_FormacaoAcademica:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_FormacaoAcademicaCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_FormacaoAcademica") %>' />
                                                <br />
                                                Peso_Aderencia_FormacaoAcademica_Instituicao:
                                                <asp:TextBox ID="Peso_Aderencia_FormacaoAcademica_InstituicaoTextBox" runat="server" Text='<%# Bind("Peso_Aderencia_FormacaoAcademica_Instituicao") %>' />
                                                <br />
                                                Classificatorio_Aderencia_FormacaoAcademica_Instituicao:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_FormacaoAcademica_InstituicaoCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_FormacaoAcademica_Instituicao") %>' />
                                                <br />
                                                Peso_Aderencia_UF:
                                                <asp:TextBox ID="Peso_Aderencia_UFTextBox" runat="server" Text='<%# Bind("Peso_Aderencia_UF") %>' />
                                                <br />
                                                Classificatorio_Aderencia_UF:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_UFCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_UF") %>' />
                                                <br />
                                                Peso_Aderencia_LocalTrabalho:
                                                <asp:TextBox ID="Peso_Aderencia_LocalTrabalhoTextBox" runat="server" Text='<%# Bind("Peso_Aderencia_LocalTrabalho") %>' />
                                                <br />
                                                Classificatorio_Aderencia_LocalTrabalho:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_LocalTrabalhoCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_LocalTrabalho") %>' />
                                                <br />
                                                Peso_Aderencia_AreaInteresse:
                                                <asp:TextBox ID="Peso_Aderencia_AreaInteresseTextBox" runat="server" Text='<%# Bind("Peso_Aderencia_AreaInteresse") %>' />
                                                <br />
                                                Classificatorio_Aderencia_AreaInteresse:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_AreaInteresseCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_AreaInteresse") %>' />
                                                <br />
                                                Peso_Aderencia_ExperienciaCBO:
                                                <asp:TextBox ID="Peso_Aderencia_ExperienciaCBOTextBox" runat="server" Text='<%# Bind("Peso_Aderencia_ExperienciaCBO") %>' />
                                                <br />
                                                Classificatorio_Aderencia_ExperienciaCBO:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_ExperienciaCBOCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_ExperienciaCBO") %>' />
                                                <br />
                                                Peso_Aderencia_ExperienciaArea:
                                                <asp:TextBox ID="Peso_Aderencia_ExperienciaAreaTextBox" runat="server" Text='<%# Bind("Peso_Aderencia_ExperienciaArea") %>' />
                                                <br />
                                                Classificatorio_Aderencia_ExperienciaArea:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_ExperienciaAreaCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_ExperienciaArea") %>' />
                                                <br />
                                                Peso_Aderencia_ExperienciaAnos:
                                                <asp:TextBox ID="Peso_Aderencia_ExperienciaAnosTextBox" runat="server" Text='<%# Bind("Peso_Aderencia_ExperienciaAnos") %>' />
                                                <br />
                                                Classificatorio_Aderencia_ExperienciaAnos:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_ExperienciaAnosCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_ExperienciaAnos") %>' />
                                                <br />
                                                Peso_Aderencia_ConhecimentoInformatica:
                                                <asp:TextBox ID="Peso_Aderencia_ConhecimentoInformaticaTextBox" runat="server" Text='<%# Bind("Peso_Aderencia_ConhecimentoInformatica") %>' />
                                                <br />
                                                Classificatorio_Aderencia_ConhecimentoInformatica:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_ConhecimentoInformaticaCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_ConhecimentoInformatica") %>' />
                                                <br />
                                                Peso_Aderencia_ConhecimentoInformatica_Software:
                                                <asp:TextBox ID="Peso_Aderencia_ConhecimentoInformatica_SoftwareTextBox" runat="server" Text='<%# Bind("Peso_Aderencia_ConhecimentoInformatica_Software") %>' />
                                                <br />
                                                Classificatorio_Aderencia_ConhecimentoInformatica_Software:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_ConhecimentoInformatica_SoftwareCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_ConhecimentoInformatica_Software") %>' />
                                                <br />
                                                Peso_Aderencia_ConhecimentoInformatica_Grau:
                                                <asp:TextBox ID="Peso_Aderencia_ConhecimentoInformatica_GrauTextBox" runat="server" Text='<%# Bind("Peso_Aderencia_ConhecimentoInformatica_Grau") %>' />
                                                <br />
                                                Classificatorio_Aderencia_ConhecimentoInformatica_Grau:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_ConhecimentoInformatica_GrauCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_ConhecimentoInformatica_Grau") %>' />
                                                <br />
                                                Peso_Aderencia_Idioma:
                                                <asp:TextBox ID="Peso_Aderencia_IdiomaTextBox" runat="server" Text='<%# Bind("Peso_Aderencia_Idioma") %>' />
                                                <br />
                                                Classificatorio_Aderencia_Idioma:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_IdiomaCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_Idioma") %>' />
                                                <br />
                                                Peso_Aderencia_Idioma_Proficiencia:
                                                <asp:TextBox ID="Peso_Aderencia_Idioma_ProficienciaTextBox" runat="server" Text='<%# Bind("Peso_Aderencia_Idioma_Proficiencia") %>' />
                                                <br />
                                                Classificatorio_Aderencia_Idioma_Proficiencia:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_Idioma_ProficienciaCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_Idioma_Proficiencia") %>' />
                                                <br />
                                                Peso_Aderencia_Nivel_Profissional:
                                                <asp:TextBox ID="Peso_Aderencia_Nivel_ProfissionalTextBox" runat="server" Text='<%# Bind("Peso_Aderencia_Nivel_Profissional") %>' />
                                                <br />
                                                Classificatorio_Aderencia_Nivel_Profissional:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_Nivel_ProfissionalCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_Nivel_Profissional") %>' />
                                                <br />
                                                Aderencia_Minima_Porcentagem:
                                                <asp:TextBox ID="Aderencia_Minima_PorcentagemTextBox" runat="server" Text='<%# Bind("Aderencia_Minima_Porcentagem") %>' />
                                                <br />
                                                Email_Aderencia_Quantidade:
                                                <asp:TextBox ID="Email_Aderencia_QuantidadeTextBox" runat="server" Text='<%# Bind("Email_Aderencia_Quantidade") %>' />
                                                <br />
                                                Email_Delay_Dias:
                                                <asp:TextBox ID="Email_Delay_DiasTextBox" runat="server" Text='<%# Bind("Email_Delay_Dias") %>' />
                                                <br />
                                                Email_Horario:
                                                <asp:TextBox ID="Email_HorarioTextBox" runat="server" Text='<%# Bind("Email_Horario") %>' />
                                                <br />
                                                Email_Porcentagem_Minima:
                                                <asp:TextBox ID="Email_Porcentagem_MinimaTextBox" runat="server" Text='<%# Bind("Email_Porcentagem_Minima") %>' />
                                                <br />
                                                Email_flg_Enviar:
                                                <asp:CheckBox ID="Email_flg_EnviarCheckBox" runat="server" Checked='<%# Bind("Email_flg_Enviar") %>' />
                                                <br />
                                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                Peso_Aderencia_Idade:
                                                <asp:Label ID="Peso_Aderencia_IdadeLabel" runat="server" Text='<%# Bind("Peso_Aderencia_Idade") %>' />
                                                <br />
                                                Classificatorio_Aderencia_Idade:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_IdadeCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_Idade") %>' Enabled="false" />
                                                <br />
                                                Peso_Aderencia_Sexo:
                                                <asp:Label ID="Peso_Aderencia_SexoLabel" runat="server" Text='<%# Bind("Peso_Aderencia_Sexo") %>' />
                                                <br />
                                                Classificatorio_Aderencia_Sexo:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_SexoCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_Sexo") %>' Enabled="false" />
                                                <br />
                                                Peso_Aderencia_PretencaoSalarial:
                                                <asp:Label ID="Peso_Aderencia_PretencaoSalarialLabel" runat="server" Text='<%# Bind("Peso_Aderencia_PretencaoSalarial") %>' />
                                                <br />
                                                Classificatorio_Aderencia_PretencaoSalarial:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_PretencaoSalarialCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_PretencaoSalarial") %>' Enabled="false" />
                                                <br />
                                                Peso_Aderencia_FormacaoAcademica:
                                                <asp:Label ID="Peso_Aderencia_FormacaoAcademicaLabel" runat="server" Text='<%# Bind("Peso_Aderencia_FormacaoAcademica") %>' />
                                                <br />
                                                Classificatorio_Aderencia_FormacaoAcademica:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_FormacaoAcademicaCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_FormacaoAcademica") %>' Enabled="false" />
                                                <br />
                                                Peso_Aderencia_FormacaoAcademica_Instituicao:
                                                <asp:Label ID="Peso_Aderencia_FormacaoAcademica_InstituicaoLabel" runat="server" Text='<%# Bind("Peso_Aderencia_FormacaoAcademica_Instituicao") %>' />
                                                <br />
                                                Classificatorio_Aderencia_FormacaoAcademica_Instituicao:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_FormacaoAcademica_InstituicaoCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_FormacaoAcademica_Instituicao") %>' Enabled="false" />
                                                <br />
                                                Peso_Aderencia_UF:
                                                <asp:Label ID="Peso_Aderencia_UFLabel" runat="server" Text='<%# Bind("Peso_Aderencia_UF") %>' />
                                                <br />
                                                Classificatorio_Aderencia_UF:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_UFCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_UF") %>' Enabled="false" />
                                                <br />
                                                Peso_Aderencia_LocalTrabalho:
                                                <asp:Label ID="Peso_Aderencia_LocalTrabalhoLabel" runat="server" Text='<%# Bind("Peso_Aderencia_LocalTrabalho") %>' />
                                                <br />
                                                Classificatorio_Aderencia_LocalTrabalho:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_LocalTrabalhoCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_LocalTrabalho") %>' Enabled="false" />
                                                <br />
                                                Peso_Aderencia_AreaInteresse:
                                                <asp:Label ID="Peso_Aderencia_AreaInteresseLabel" runat="server" Text='<%# Bind("Peso_Aderencia_AreaInteresse") %>' />
                                                <br />
                                                Classificatorio_Aderencia_AreaInteresse:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_AreaInteresseCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_AreaInteresse") %>' Enabled="false" />
                                                <br />
                                                Peso_Aderencia_ExperienciaCBO:
                                                <asp:Label ID="Peso_Aderencia_ExperienciaCBOLabel" runat="server" Text='<%# Bind("Peso_Aderencia_ExperienciaCBO") %>' />
                                                <br />
                                                Classificatorio_Aderencia_ExperienciaCBO:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_ExperienciaCBOCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_ExperienciaCBO") %>' Enabled="false" />
                                                <br />
                                                Peso_Aderencia_ExperienciaArea:
                                                <asp:Label ID="Peso_Aderencia_ExperienciaAreaLabel" runat="server" Text='<%# Bind("Peso_Aderencia_ExperienciaArea") %>' />
                                                <br />
                                                Classificatorio_Aderencia_ExperienciaArea:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_ExperienciaAreaCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_ExperienciaArea") %>' Enabled="false" />
                                                <br />
                                                Peso_Aderencia_ExperienciaAnos:
                                                <asp:Label ID="Peso_Aderencia_ExperienciaAnosLabel" runat="server" Text='<%# Bind("Peso_Aderencia_ExperienciaAnos") %>' />
                                                <br />
                                                Classificatorio_Aderencia_ExperienciaAnos:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_ExperienciaAnosCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_ExperienciaAnos") %>' Enabled="false" />
                                                <br />
                                                Peso_Aderencia_ConhecimentoInformatica:
                                                <asp:Label ID="Peso_Aderencia_ConhecimentoInformaticaLabel" runat="server" Text='<%# Bind("Peso_Aderencia_ConhecimentoInformatica") %>' />
                                                <br />
                                                Classificatorio_Aderencia_ConhecimentoInformatica:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_ConhecimentoInformaticaCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_ConhecimentoInformatica") %>' Enabled="false" />
                                                <br />
                                                Peso_Aderencia_ConhecimentoInformatica_Software:
                                                <asp:Label ID="Peso_Aderencia_ConhecimentoInformatica_SoftwareLabel" runat="server" Text='<%# Bind("Peso_Aderencia_ConhecimentoInformatica_Software") %>' />
                                                <br />
                                                Classificatorio_Aderencia_ConhecimentoInformatica_Software:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_ConhecimentoInformatica_SoftwareCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_ConhecimentoInformatica_Software") %>' Enabled="false" />
                                                <br />
                                                Peso_Aderencia_ConhecimentoInformatica_Grau:
                                                <asp:Label ID="Peso_Aderencia_ConhecimentoInformatica_GrauLabel" runat="server" Text='<%# Bind("Peso_Aderencia_ConhecimentoInformatica_Grau") %>' />
                                                <br />
                                                Classificatorio_Aderencia_ConhecimentoInformatica_Grau:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_ConhecimentoInformatica_GrauCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_ConhecimentoInformatica_Grau") %>' Enabled="false" />
                                                <br />
                                                Peso_Aderencia_Idioma:
                                                <asp:Label ID="Peso_Aderencia_IdiomaLabel" runat="server" Text='<%# Bind("Peso_Aderencia_Idioma") %>' />
                                                <br />
                                                Classificatorio_Aderencia_Idioma:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_IdiomaCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_Idioma") %>' Enabled="false" />
                                                <br />
                                                Peso_Aderencia_Idioma_Proficiencia:
                                                <asp:Label ID="Peso_Aderencia_Idioma_ProficienciaLabel" runat="server" Text='<%# Bind("Peso_Aderencia_Idioma_Proficiencia") %>' />
                                                <br />
                                                Classificatorio_Aderencia_Idioma_Proficiencia:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_Idioma_ProficienciaCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_Idioma_Proficiencia") %>' Enabled="false" />
                                                <br />
                                                Peso_Aderencia_Nivel_Profissional:
                                                <asp:Label ID="Peso_Aderencia_Nivel_ProfissionalLabel" runat="server" Text='<%# Bind("Peso_Aderencia_Nivel_Profissional") %>' />
                                                <br />
                                                Classificatorio_Aderencia_Nivel_Profissional:
                                                <asp:CheckBox ID="Classificatorio_Aderencia_Nivel_ProfissionalCheckBox" runat="server" Checked='<%# Bind("Classificatorio_Aderencia_Nivel_Profissional") %>' Enabled="false" />
                                                <br />
                                                Aderencia_Minima_Porcentagem:
                                                <asp:Label ID="Aderencia_Minima_PorcentagemLabel" runat="server" Text='<%# Bind("Aderencia_Minima_Porcentagem") %>' />
                                                <br />
                                                Email_Aderencia_Quantidade:
                                                <asp:Label ID="Email_Aderencia_QuantidadeLabel" runat="server" Text='<%# Bind("Email_Aderencia_Quantidade") %>' />
                                                <br />
                                                Email_Delay_Dias:
                                                <asp:Label ID="Email_Delay_DiasLabel" runat="server" Text='<%# Bind("Email_Delay_Dias") %>' />
                                                <br />
                                                Email_Horario:
                                                <asp:Label ID="Email_HorarioLabel" runat="server" Text='<%# Bind("Email_Horario") %>' />
                                                <br />
                                                Email_Porcentagem_Minima:
                                                <asp:Label ID="Email_Porcentagem_MinimaLabel" runat="server" Text='<%# Bind("Email_Porcentagem_Minima") %>' />
                                                <br />
                                                Email_flg_Enviar:
                                                <asp:CheckBox ID="Email_flg_EnviarCheckBox" runat="server" Checked='<%# Bind("Email_flg_Enviar") %>' Enabled="false" />
                                                <br />

                                            </ItemTemplate>
                                        </asp:FormView>
                                        <br />
                                        <asp:SqlDataSource ID="SqlDataSourceATRIBUICAO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_ATRIBUICAO_ADERENCIA" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" Type="Int32" />
                                                <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="SqlDataSourceADERENCIA" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="USP_Aderencia_Configuracao_SELECT" SelectCommandType="StoredProcedure" UpdateCommand="USP_Aderencia_Configuracao_UPDATE" UpdateCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="TEXTOPESQUISALabel" Name="Protocolo" PropertyName="Text" Type="String" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="Protocolo" Type="String" />
                                                <asp:Parameter Name="Peso_Aderencia_Idade" Type="Int32" />
                                                <asp:Parameter Name="Classificatorio_Aderencia_Idade" Type="Boolean" />
                                                <asp:Parameter Name="Peso_Aderencia_Sexo" Type="Int32" />
                                                <asp:Parameter Name="Classificatorio_Aderencia_Sexo" Type="Boolean" />
                                                <asp:Parameter Name="Peso_Aderencia_PretencaoSalarial" Type="Int32" />
                                                <asp:Parameter Name="Classificatorio_Aderencia_PretencaoSalarial" Type="Boolean" />
                                                <asp:Parameter Name="Peso_Aderencia_FormacaoAcademica" Type="Int32" />
                                                <asp:Parameter Name="Classificatorio_Aderencia_FormacaoAcademica" Type="Boolean" />
                                                <asp:Parameter Name="Peso_Aderencia_FormacaoAcademica_Instituicao" Type="Int32" />
                                                <asp:Parameter Name="Classificatorio_Aderencia_FormacaoAcademica_Instituicao" Type="Boolean" />
                                                <asp:Parameter Name="Peso_Aderencia_UF" Type="Int32" />
                                                <asp:Parameter Name="Classificatorio_Aderencia_UF" Type="Boolean" />
                                                <asp:Parameter Name="Peso_Aderencia_LocalTrabalho" Type="Int32" />
                                                <asp:Parameter Name="Classificatorio_Aderencia_LocalTrabalho" Type="Boolean" />
                                                <asp:Parameter Name="Peso_Aderencia_AreaInteresse" Type="Int32" />
                                                <asp:Parameter Name="Classificatorio_Aderencia_AreaInteresse" Type="Boolean" />
                                                <asp:Parameter Name="Peso_Aderencia_ExperienciaCBO" Type="Int32" />
                                                <asp:Parameter Name="Classificatorio_Aderencia_ExperienciaCBO" Type="Boolean" />
                                                <asp:Parameter Name="Peso_Aderencia_ExperienciaArea" Type="Int32" />
                                                <asp:Parameter Name="Classificatorio_Aderencia_ExperienciaArea" Type="Boolean" />
                                                <asp:Parameter Name="Peso_Aderencia_ExperienciaAnos" Type="Int32" />
                                                <asp:Parameter Name="Classificatorio_Aderencia_ExperienciaAnos" Type="Boolean" />
                                                <asp:Parameter Name="Peso_Aderencia_ConhecimentoInformatica" Type="Int32" />
                                                <asp:Parameter Name="Classificatorio_Aderencia_ConhecimentoInformatica" Type="Boolean" />
                                                <asp:Parameter Name="Peso_Aderencia_ConhecimentoInformatica_Software" Type="Int32" />
                                                <asp:Parameter Name="Classificatorio_Aderencia_ConhecimentoInformatica_Software" Type="Boolean" />
                                                <asp:Parameter Name="Peso_Aderencia_ConhecimentoInformatica_Grau" Type="Int32" />
                                                <asp:Parameter Name="Classificatorio_Aderencia_ConhecimentoInformatica_Grau" Type="Boolean" />
                                                <asp:Parameter Name="Peso_Aderencia_Idioma" Type="Int32" />
                                                <asp:Parameter Name="Classificatorio_Aderencia_Idioma" Type="Boolean" />
                                                <asp:Parameter Name="Peso_Aderencia_Idioma_Proficiencia" Type="Int32" />
                                                <asp:Parameter Name="Classificatorio_Aderencia_Idioma_Proficiencia" Type="Boolean" />
                                                <asp:Parameter Name="Peso_Aderencia_Nivel_Profissional" Type="Int32" />
                                                <asp:Parameter Name="Classificatorio_Aderencia_Nivel_Profissional" Type="Boolean" />
                                                <asp:Parameter Name="Aderencia_Minima_Porcentagem" Type="Int32" />
                                                <asp:Parameter Name="Email_Aderencia_Quantidade" Type="Int32" />
                                                <asp:Parameter Name="Email_Delay_Dias" Type="Int32" />
                                                <asp:Parameter DbType="Time" Name="Email_Horario" />
                                                <asp:Parameter Name="Email_Porcentagem_Minima" Type="Int32" />
                                                <asp:Parameter Name="Email_flg_Enviar" Type="Boolean" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </div> 
                                    <!-- FINALIZA O QUIZ -->
                                </div>
                            </td>
                        </tr>
                    </table> 
                </td>
            </tr>
        </table>
        </div>
</asp:Content>

