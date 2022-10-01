<%@ Page Title="" Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="experienciaProfissional.aspx.vb" Inherits="_candidato_experienciaProfissional" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../App_Themes/jobclick.css" rel="stylesheet" type="text/css" />
    <link href="../scripts/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../scripts/jquery.autocomplete.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=cargoTextBox.ClientID%>").autocomplete("AutocompleteCargoData.ashx");
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" }, close: function () { window.location.href = "experiencia.aspx" } });
        });
	</script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAvisoErr.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up"} });
        });
	</script>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Cabec" runat="server" Text="Experiência Profissional" 
                    CssClass="TituloBGText"></asp:Label>
                <asp:Label ID="idfuncaoLabel" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
                <asp:Panel ID="PanelAvisoErr" runat="server" Visible="False">
                    <table id="AVISOTABELAErr" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISOErr" runat="server" 
                                    ImageUrl="~/_candidato/images/buttonOK.png" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABELErr" runat="server" CssClass="msnOK"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
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
                        <asp:Panel ID="PanelPESQUISA" runat="server" Visible="False">
                            <br />
                            <table align="left" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right">
                                        <asp:LinkButton ID="FecharPSQ" runat="server">Fechar</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                            <asp:GridView ID="GridViewCARGO" runat="server" 
    AutoGenerateColumns="False" DataSourceID="SqlPESQUISA" 
                                DataKeyNames="idCBOOcupacao,dsCBOSinonimo,dsCBOOcupacao" GridLines="Horizontal" 
                                Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="idCBOOcupacao" HeaderText="idCBOOcupacao" 
            SortExpression="idCBOOcupacao" Visible="False" />
                                    <asp:TemplateField HeaderText="Ocupação" SortExpression="Cargo">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dsCBOOcupacao") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("dsCBOOcupacao") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sinônimos" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                                CommandName="Select" 
                                                onclientclick="return confirm(&quot;Você confirma o cargo selecionado?\nO cargo deve ser o mais próximo do foi informado em sua carteira profissional.&quot;)" 
                                                Text='<%# Eval("dsCBOSinonimo") %>' 
                                                ToolTip="Clique aqui para selecionar este cargo"></asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="dsCBOSinonimo" HeaderText="Sinônimos" 
            SortExpression="dsCBOSinonimo" Visible="False" />
                                    <asp:BoundField DataField="CBOCombo" HeaderText="CBOCombo" ReadOnly="True" 
            SortExpression="CBOCombo" Visible="False" />
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                        <br />
                            <table width="100%" id="InfoCARGO" cellpadding="2" cellspacing="2">
                                <tr>
                                    <td align="right" width="100px" valign="top">
                                        &nbsp;</td>
                                    <td>
                        <asp:Label ID="LabelObs" runat="server" Font-Size="8pt" ForeColor="#CC3300" 
                            Text="Obs.: Todos os campos são obrigatórios"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="100px" valign="top">
                                        <asp:Label ID="Label1" runat="server" Text="Empresa:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="nomeempresaTextBox" runat="server" 
                                            CssClass="InputCadFormCandidatoCV" ValidationGroup="CARGO"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="nomeempresaTextBox" 
                                            ErrorMessage="Informe o nome da empresa" ValidationGroup="INCLUIR">•</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="100px" valign="top">
                        <asp:Label ID="LabelCargo" runat="server" Text="Cargo (CBO):"></asp:Label>
                                        <br/>
                                    </td>
                                    <td>
                        <asp:textbox ID="cargoTextBox" runat="server" 
                            CssClass="InputCadFormCandidatoCV" ValidationGroup="CARGO"></asp:textbox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorProximo" runat="server" 
                                            ControlToValidate="cargoTextBox" Display="Dynamic" 
                                            ErrorMessage="Informe o cargo ocupado nesta empresa" 
                                            ValidationGroup="INCLUIR">•</asp:RequiredFieldValidator>
                                        <br />
                                        <asp:Label ID="Label5" runat="server" 
                                            Text="IMPORTANTE!&lt;br&gt;Este campo deve informar o cargo que está descrito em sua carteira profissional.&lt;br&gt;O termo (CBO) quer dizer: Classificação Brasileira de Ocupações, instituída por portaria ministerial nº. 397, de 9 de outubro de 2002."></asp:Label>
                                    </td>
                                </tr>
                                </table>
                        <asp:Panel ID="PanelCARGO_INSERT" runat="server">
                            <table width="100%" id="InfoCARGO0" cellpadding="2" 
    cellspacing="2">
                                <tr>
                                    <td align="right" width="100px" valign="top">
                                        <asp:Label ID="LabelAtuacao" runat="server" Text="Área de atuação:"></asp:Label>
                                        <br/>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownListATUACAO" runat="server" 
                                            AppendDataBoundItems="True" CssClass="DropCadFormCandidatoCV" 
                                            DataSourceID="SqlAREAATUACAO" DataTextField="dsAreaAtuacao" 
                                            DataValueField="idAreaAtuacao" ValidationGroup="INCLUIR">
                                            <asp:ListItem Value=" ">-- Selecione --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="DropDownListATUACAO" 
                                            ErrorMessage="Informe a área de atuação da empresa" 
                                            ValidationGroup="INCLUIR">•</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="100px" valign="top">
                                        <asp:Label ID="LabelPorte" runat="server" Text="Porte:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownListPORTE" runat="server" 
                                            AppendDataBoundItems="True" CssClass="DropCadFormCandidatoCV" 
                                            DataSourceID="SqlPORTE" DataTextField="dsPorte" DataValueField="idPorte" 
                                            ValidationGroup="INCLUIR">
                                            <asp:ListItem Value=" ">-- Selecione --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="DropDownListPORTE" 
                                            ErrorMessage="Informe o porte da empresa" ValidationGroup="INCLUIR">•</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" width="100px">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" width="100px" bgcolor="#F8F8F8">
                                        <asp:Label ID="LabeldsFuncao0" runat="server" Text="Funções"></asp:Label>
                                    </td>
                                    <td bgcolor="#F8F8F8">
                                        <asp:Label ID="LabeldsFuncao" runat="server" 
                                            Text="Descreva suas funções nesta empresa:"></asp:Label>
                                        &nbsp;<br />
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
                                    <td align="right" valign="top" width="100px">
                                        &nbsp;</td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Contratação:"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="DropDownListRelacaoTrabalhista" runat="server" 
                                            AppendDataBoundItems="True" CssClass="DropCadFormCandidatoCV" 
                                            DataSourceID="SqlRELACAOTRABALHISTA" DataTextField="dsRelacaoTrabalhista" 
                                            DataValueField="idRelacaoTrabalhista">
                                            <asp:ListItem Value="">-- Selecione --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                            ControlToValidate="DropDownListRelacaoTrabalhista" 
                                            ErrorMessage="Selecione o tipo de contratação" ValidationGroup="INCLUIR">•</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="100px">
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
                                    <td align="right" bgcolor="#F8F8F8" width="100px">
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
                                                        Width="30px" MaxLength="2"></asp:TextBox>
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
                                                        Width="60px" MaxLength="4"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="100px">
                                        &nbsp;</td>
                                    <td>
                                        <asp:CheckBox ID="CheckBoxATUAL" runat="server" 
                                            Text="Atualmente estou trabalhando nesta empresa." AutoPostBack="True" />
                                    </td>
                                </tr>
                                <tr id="DATAFIM_TR" runat="server">
                                    <td align="right" bgcolor="#F8F8F8" width="100px">
                                        <asp:Label ID="LabelDATAFIM" runat="server" Text="Data do término:"></asp:Label>
                                    </td>
                                    <td bgcolor="#F8F8F8">
                                        <table ID="DATAFIM" runat="server" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="LabelData4" runat="server" Text="mês"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                                        ControlToValidate="mesFTextBox" ErrorMessage="Mês do término é obrigatório" 
                                                        ValidationGroup="INCLUIR">•</asp:RequiredFieldValidator>
                                                    <br />
                                                    <asp:TextBox ID="mesFTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                        MaxLength="2" Width="30px"></asp:TextBox>
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
                                                        MaxLength="4" Width="60px"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" width="100px">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" width="100px">
                                        &nbsp;</td>
                                    <td>
                                        <br/>
                                        <asp:LinkButton ID="LinkButtonSalvar" runat="server" CssClass="button" 
                                            ToolTip="Clique aqui para salvar sua experiência profissional" 
                                            ValidationGroup="INCLUIR">Salvar</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CssClass="button" 
                                            PostBackUrl="~/_candidato/experiencia.aspx" 
                                            ToolTip="Clique aqui para cancelar a opção de incluir uma experiência profissional">Cancelar</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButtonMP" runat="server" CausesValidation="False" 
                                            CssClass="button" PostBackUrl="~/_candidato/Default.aspx" 
                                            ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
                                        <asp:ValidationSummary ID="ValidationSummaryINCLUIR" runat="server" 
                                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="INCLUIR" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />
                        <asp:SqlDataSource ID="SqlNivelProfissional" runat="server" 
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
                        <asp:SqlDataSource ID="SqlPESQUISA" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                            SelectCommand="_spCBO_SELECT" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cargoTextBox" Name="SearchTerm" 
                                    PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                    </td> 
                </tr> 
             </table> 
</asp:Content>

