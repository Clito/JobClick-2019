<%@ Page Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="experiencia.aspx.vb" Inherits="_candidato_experiencia" title="Jobclick" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript" language="javascript">
        function limitarTexto(campo, contador, numeroLimite) {

            if (campo.value.length > numeroLimite) {
                campo.value = campo.value.substring(0, numeroLimite);

            }
            else {
                contador.innerHTML = numeroLimite - campo.value.length;
            }
        }
    </script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" }, close: function () { window.location.href = "experiencia.aspx" } });
        });
	</script>
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Cabec" runat="server" Text="Experiência Profissional" CssClass="TituloBGText"></asp:Label>
                <asp:Label ID="idexprofissionalLabel" runat="server" Text="0" Visible="False"></asp:Label>
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
            <td width="30px">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="690px" align="left">
                <asp:DataList ID="DataListLISTAEMPRESA" runat="server" 
                    DataKeyField="idexprofissional" DataSourceID="SqlLISTAEMPRESA">
                    <ItemTemplate>
                        <table ID="EMPRESA" cellpadding="2" cellspacing="2" width="750px">
                            <tr>
                                <td align="right" valign="top" width="150px">
                                    <asp:Label ID="dsPorteLabel" runat="server" Text='<%# Eval("dsPorte") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="nomeempresaLabel" runat="server" CssClass="textSite" 
                                        Text='<%# Eval("nomeempresa") %>' />
                                    &nbsp;<asp:Label ID="ATUALLabel" runat="server" CssClass="textSite" 
                                        Text='<%# Eval("ATUAL_EMPRESA") %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="dsAreaAtuacaoLabel" runat="server" Font-Italic="True" 
                                        Text='<%# Eval("dsAreaAtuacao") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="150px">
                                    <asp:Label ID="LabelCargo" runat="server" Text="Cargo:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="dsfuncaoLabel" runat="server" Text='<%# Eval("dsfuncao") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="150px">
                                    <asp:Label ID="Label1" runat="server" Text="Contrato:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="dsRelacaoTrabalhistaLabel" runat="server" 
                                        Text='<%# Eval("dsRelacaoTrabalhista") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="150px">
                                    <asp:Label ID="Label2" runat="server" Text="Sobre a função:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="dsexperienciaLabel" runat="server" 
                                        Text='<%# Eval("dsexperiencia") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="150px">
                                    &nbsp;</td>
                                <td>
                                    <table ID="DATA" cellpadding="2" cellspacing="2" width="400px">
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="LabelINI" runat="server" Text="De:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="data_iniLabel" runat="server" Text='<%# Eval("ano_ini") %>' />
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="LabelATE" runat="server" Text="Até:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="data_fimLabel" runat="server" Text='<%# Eval("ano_fim") %>' />
                                                <asp:Label ID="ATUALLabelDATA" runat="server" Text='<%# Eval("ATUAL_DATA") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="150px">
                                    <asp:Label ID="Label5" runat="server" Text="Nível profissional:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="NivelProfissionalLabel" runat="server" 
                                        Text='<%# Eval("dsNivelProfissional") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="150px">
                                    &nbsp;</td>
                                <td align="right">
                                    <asp:LinkButton ID="LinkButtonSELECT" runat="server" CommandName="Select" 
                                        CssClass="button" ToolTip="Clique aqui para editar este registro">Editar</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Image ID="Imagelinha" runat="server" 
                            ImageUrl="~/images/layoutNew/linha.png" />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <br />
                <asp:Panel ID="PanelNAVEGADOR" runat="server">
                    <table cellpadding="2" cellspacing="2" ID="NEVEGADOR" width="750px">
                        <tr>
                            <td width="150px">
                                &nbsp;</td>
                            <td>
                                <asp:LinkButton ID="LinkButtonINCLUIR" runat="server" CssClass="button" 
                                    PostBackUrl="~/_candidato/experienciaProfissional.aspx" 
                                    ToolTip="Clique aqui para incluir sua experiência profissional">Incluir uma experiência profissional</asp:LinkButton>
                                <asp:LinkButton ID="LinkButtonMP" runat="server" CssClass="button" 
                                    PostBackUrl="~/_candidato/Default.aspx" 
                                    ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />

                        <asp:Panel ID="PanelCARGO_UPDATE" runat="server" Visible="False">
                            <table width="750px" id="InfoCARGO0" cellpadding="2" 
    cellspacing="2">
                                <tr>
                                    <td align="right" width="150px" valign="top">
                                        <asp:Label ID="Label1" runat="server" Text="Empresa:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="nomeempresaTextBox" runat="server" 
                                            CssClass="InputCadFormCandidatoCV" ValidationGroup="CARGO"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="nomeempresaTextBox" ErrorMessage="Informe o nome da empresa" 
                                            ValidationGroup="INCLUIR">•</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" width="150px">
                                        <asp:Label ID="LabelCargo" runat="server" Text="Cargo:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="cargoTextBox" runat="server" 
                                            CssClass="InputCadFormCandidatoCV" Enabled="False" ValidationGroup="CARGO"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" width="150px">
                                        <asp:Label ID="LabelAtuacao" runat="server" Text="Área de atuação:"></asp:Label>
                                        <br/>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownListATUACAO" runat="server" CssClass="DropCadFormCandidatoCV" 
                                            DataSourceID="SqlAREAATUACAO" DataTextField="dsAreaAtuacao" 
                                            DataValueField="idAreaAtuacao" ValidationGroup="INCLUIR">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="DropDownListATUACAO" 
                                            ErrorMessage="Informe a área de atuação da empresa" ValidationGroup="INCLUIR">•</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="150px" valign="top">
                                        <asp:Label ID="LabelPorte" runat="server" Text="Porte:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownListPORTE" runat="server" CssClass="DropCadFormCandidatoCV" 
                                            DataSourceID="SqlPORTE" DataTextField="dsPorte" DataValueField="idPorte" 
                                            ValidationGroup="INCLUIR">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="DropDownListPORTE" 
                                            ErrorMessage="Informe o porte da empresa" ValidationGroup="INCLUIR">•</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" width="150px">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" width="150px" bgcolor="#F8F8F8">
                                        <asp:Label ID="LabeldsFuncao0" runat="server" Text="Funções"></asp:Label>
                                    </td>
                                    <td bgcolor="#F8F8F8">
                                        <asp:Label ID="LabeldsFuncao" runat="server" 
                                            Text="Descreva suas funções nesta empresa:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="dsexperienciaTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                            Height="80px" Text='' TextMode="MultiLine" ValidationGroup="INCLUIR" 
                                            MaxLength="255"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="dsexperienciaTextBox" 
                                            ErrorMessage="Fale sobre as suas funções na empresa" ValidationGroup="INCLUIR">•</asp:RequiredFieldValidator>
                                        <br />
                                        Caracteres restantes: <span ID="contador">5000</span> (Máximo de 5000 toques)</td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" width="150px">
                                        &nbsp;</td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Contratação:"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="DropDownListRelacaoTrabalhista" runat="server" CssClass="DropCadFormCandidatoCV" 
                                            DataSourceID="SqlRELACAOTRABALHISTA" DataTextField="dsRelacaoTrabalhista" 
                                            DataValueField="idRelacaoTrabalhista">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                            ControlToValidate="DropDownListRelacaoTrabalhista" 
                                            ErrorMessage="Selecione o tipo de contratação" ValidationGroup="INCLUIR">•</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="150px">
                                        &nbsp;</td>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text="Nível profissional:"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="DropDownListNivelProfissional" runat="server" 
                                            CssClass="DropCadFormCandidatoCV" DataSourceID="SqlNivelProfissional" 
                                            DataTextField="dsNivelProfissional" DataValueField="idNivelProfissional">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" bgcolor="#F8F8F8" width="150px">
                                        <asp:Label ID="Label3" runat="server" Text="Data de início:"></asp:Label>
                                    </td>
                                    <td bgcolor="#F8F8F8">
                                        <table ID="DATAINI" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="LabelData1" runat="server" Text="mês"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                        ControlToValidate="mesITextBox" ErrorMessage="Mês do início é obrigatório" 
                                                        ValidationGroup="INCLUIR">•</asp:RequiredFieldValidator>
                                                    <br />
                                                    <asp:TextBox ID="mesITextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                        Width="30px"></asp:TextBox>
                                                </td>
                                                <td valign="bottom">
                                                    <asp:Label ID="barraLabel0" runat="server" CssClass="textSite" Text="/"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="LabelData2" runat="server" Text="ano"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                                        ControlToValidate="anoITextBox" ErrorMessage="Ano do início é obrigatório" 
                                                        ValidationGroup="INCLUIR">•</asp:RequiredFieldValidator>
                                                    <br />
                                                    <asp:TextBox ID="anoITextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                        Width="60px"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="150px">
                                        &nbsp;</td>
                                    <td>
                                        <asp:CheckBox ID="CheckBoxATUAL" runat="server" AutoPostBack="True" 
                                            Text="Atualmente estou trabalhando nesta empresa." />
                                    </td>
                                </tr>
                                <tr id="DATAFIM_TR" runat="server">
                                    <td align="right" bgcolor="#F8F8F8" width="150px">
                                        <asp:Label ID="Label4" runat="server" Text="Data do término:"></asp:Label>
                                    </td>
                                    <td bgcolor="#F8F8F8">
                                        <table ID="DATAFIM" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="LabelData4" runat="server" Text="mês"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                                        ControlToValidate="mesFTextBox" ErrorMessage="Mês do término é obrigatório" 
                                                        ValidationGroup="INCLUIR">•</asp:RequiredFieldValidator>
                                                    <br />
                                                    <asp:TextBox ID="mesFTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                        Width="30px"></asp:TextBox>
                                                </td>
                                                <td valign="bottom">
                                                    <asp:Label ID="barraLabel3" runat="server" CssClass="textSite" Text="/"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="LabelData5" runat="server" Text="ano"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                                        ControlToValidate="anoFTextBox" ErrorMessage="Ano do término é obrigatório" 
                                                        ValidationGroup="INCLUIR">•</asp:RequiredFieldValidator>
                                                    <br />
                                                    <asp:TextBox ID="anoFTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                        Width="60px"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" width="150px">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" width="150px">
                                        &nbsp;</td>
                                    <td>
                                        <br/>
                                        <asp:LinkButton ID="LinkButtonSalvar" runat="server" CssClass="button" 
                                            ToolTip="Clique aqui para salvar sua experiência profissional" 
                                            ValidationGroup="INCLUIR">Salvar</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CssClass="button" 
                                            ToolTip="Clique aqui para cancelar a opção de incluir uma experiência profissional">Cancelar</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButtonEXCLUIR" runat="server" CssClass="button" 
                                            onclientclick="return confirm(&quot;Quer excluir este registro?&quot;)" 
                                            ToolTip="Clique aqui para excluir este registro">Excluir</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButtonMP0" runat="server" CausesValidation="False" 
                                            CssClass="button" PostBackUrl="~/_candidato/Default.aspx" 
                                            ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
                                        <asp:ValidationSummary ID="ValidationSummaryINCLUIR" runat="server" 
                                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="INCLUIR" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                <br />
                &nbsp;<asp:SqlDataSource ID="SqlNivelProfissional" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                            
                    
                    SelectCommand="SELECT [idNivelProfissional], [dsNivelProfissional] FROM [tbNivelProfissional] ORDER BY [idNivelProfissional]">
                        </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlAREAATUACAO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
                            SelectCommand="SELECT [idAreaAtuacao], [dsAreaAtuacao] FROM [tbAreaAtuacao] ORDER BY [dsAreaAtuacao]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlPORTE" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idPorte], [dsPorte] FROM [tbPorteEmpresa]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlRELACAOTRABALHISTA" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
                            SelectCommand="SELECT [idRelacaoTrabalhista], [dsRelacaoTrabalhista] FROM [tbRelacaoTrabalhista] ORDER BY [dsRelacaoTrabalhista]">
    </asp:SqlDataSource>
                        </td> 
        </tr>
    </table> 
    <br />
    <asp:SqlDataSource ID="SqlLISTAEMPRESA" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="_USP_EXPERIENCIA_PROFISSIONAL_SELECT_AUTOPREENCHIMENTO" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" SessionField="idcurriculo"
                Type="Int32" />
            <asp:ControlParameter ControlID="idexprofissionalLabel" Name="idexprofissional" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

