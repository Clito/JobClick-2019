<%@ Page Title="" Language="VB" MaintainScrollPositionOnPostback="True" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="administraCV.aspx.vb" Inherits="_candidato_administraCV" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" language="Javascript">

    function OpenFileUpload() {
        var ctlFileUpload = document.getElementById("ctlFileUpload");
        UploadButton.click();
    }

    //These functions are used to change the image when the user points on the image.
    function FileUploadHighlightOn(element) {
        element.src = "../images/adminCandidato/buttonFotoProcura.png";
    }

    function FileUploadHighlightOff(element) {
        element.src = "../images/adminCandidato/buttonFotoProcura.png";
    }

    function FileUploadClick(element) {
        element.src = "../images/adminCandidato/buttonFotoProcura.png";
    }   
 
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
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" } });
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
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Cabec" runat="server" Text="Dados Pessoais (Atualização rápida de seu Currículo Vitae)" 
                    CssClass="TituloBGText"></asp:Label>
                <asp:Label ID="idTelefoneLabel" runat="server" Visible="False"></asp:Label>
                <br />
                <br />
            </td>
        </tr>
    </table>   
    <table id="ADMINISTRACV" cellpadding="0" cellspacing="0" width="740px" align="center">
    <tr>
        <td><br />
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
            <br />
            
                 <!-- DADOS PESSOAIS -->
                    <asp:FormView ID="FormViewCV" runat="server" DataKeyNames="idCadastroUser" 
                                    DataSourceID="SqlAdministraCVFORM" Width="740px" 
                        DefaultMode="Edit">
                                    <EditItemTemplate>
                                    <div align="left">
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                            ShowMessageBox="True" ShowSummary="False" />
                                        <asp:TextBox ID="cadastroTipoTextBox" runat="server" 
                                            Text='<%# Bind("cadastroTipo") %>' Visible="False" Width="1px" />
                                        <asp:TextBox ID="sexoTextBox" runat="server" Text='<%# Bind("sexo") %>' 
                                            Visible="False" Width="1px" />
                                        <asp:TextBox ID="idUserTextBox" runat="server" Text='<%# Bind("idUser") %>' 
                                            Visible="False" Width="1px" />
                                        <asp:TextBox ID="fotoTextBox" runat="server" Text='<%# Bind("foto") %>' 
                                            Visible="False" Width="1px" />
                                        <asp:TextBox ID="estadocivilTextBox" runat="server" 
                                            Text='<%# Bind("estadocivil") %>' Visible="False" Width="1px" />
                                        <asp:TextBox ID="nrdependenteTextBox" runat="server" 
                                            Text='<%# Bind("nrdependente") %>' Visible="False" Width="1px" />
                                        <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>' 
                                            Visible="False" Width="1px" />
                                        <asp:TextBox ID="disponibilidadeTextBox" runat="server" 
                                            Text='<%# Bind("disponibilidade") %>' Visible="False" Width="1px" />
                                        <asp:TextBox ID="localPreferenciaTextBox" runat="server" 
                                            Text='<%# Bind("localPreferencia") %>' Visible="False" Width="1px" />
                                        <asp:TextBox ID="dataultimoacessTextBox" runat="server" 
                                            Text='<%# Bind("dataultimoacess") %>' Visible="False" Width="1px" />
                                        <asp:TextBox ID="contadorTextBox" runat="server" 
                                            Text='<%# Bind("contador") %>' Visible="False" Width="1px" />
                                        <asp:Label ID="remuneracaoAtual" runat="server" 
                                            Text='<%# Eval("valorRemAtual", "{0:N}") %>' Visible="False"></asp:Label>
                                        <asp:Label ID="remuneracaoPretendida" runat="server" 
                                            Text='<%# Eval("valorRemPretendida", "{0:N}") %>' Visible="False"></asp:Label>
                                        <asp:Label ID="datanascimentoLabel" runat="server" 
                                            Text='<%# Eval("nascimento", "{0:d}") %>' Visible="False"></asp:Label>
                                        <br />
                                        <table cellpadding="2" cellspacing="0" width="740px">
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCVFOTO" runat="server" Text="Sua foto:"></asp:Label>
                                                </td>
                                                <td align="left" valign="top" width="540">
                                                    <table ID="FOTO" cellpadding="0" cellspacing="5">
                                                        <tr>
                                                            <td valign="baseline">
                                                                <asp:Image ID="ImageCVFoto" runat="server" ImageUrl='<%# Eval("foto") %>' />
                                                            </td>
                                                            <td valign="top" align="left">
                                                                <asp:LinkButton ID="LinkButtonFOTO" runat="server" CausesValidation="False" 
                                                                    CssClass="button" onclick="LinkButtonFOTO_Click">Atualizar / Enviar sua foto</asp:LinkButton>
                                                                <asp:LinkButton ID="LinkButtonFECHARENVIOFOTO" runat="server" CssClass="button" 
                                                                    onclick="LinkButtonFECHARENVIOFOTO_Click" Visible="False">Fechar</asp:LinkButton>
                                                                <br />
                                                                <br />
                                                                <asp:Panel ID="PanelFOTO" runat="server" Visible="False">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                                        ControlToValidate="FileUploadFOTO" ErrorMessage="* Informe uma foto." 
                                                                        ValidationGroup="FOTO"></asp:RequiredFieldValidator>
                                                                    <br />
                                                                    <asp:FileUpload ID="FileUploadFOTO" runat="server" CssClass="UploadButton" />
                                                                    <br />
                                                                    <br />
                                                                    <asp:LinkButton ID="LinkButtonENVIAR" runat="server" CssClass="button" 
                                                                        onclick="LinkButtonENVIAR_Click" ValidationGroup="FOTO">Enviar a foto selecionada</asp:LinkButton>
                                                                </asp:Panel>
                                                                <br />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCV4" runat="server" Text="Nome do Candidato:"></asp:Label>
                                                </td>
                                                <td align="left" valign="top" width="540">
                                                    <asp:TextBox ID="nomeTextBox" runat="server" CssClass="TextBox" 
                                                        Text='<%# Bind("nome") %>' Width="500px" />
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCV14" runat="server" Text="Sexo:"></asp:Label>
                                                </td>
                                                <td align="left" valign="top" width="540">
                                                    <asp:RadioButtonList ID="RadioButtonListSexo" runat="server" 
                                                        CssClass="RadioButtonListCV" RepeatDirection="Horizontal" 
                                                        SelectedValue='<%# Bind("sexo") %>' Width="505px">
                                                        <asp:ListItem>Masculino</asp:ListItem>
                                                        <asp:ListItem>Feminino</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCV0" runat="server" Text="Área de Atuação:"></asp:Label>
                                                </td>
                                                <td align="left" valign="top" width="540">
                                                    <asp:DropDownList ID="DropDownListAreaAtuacao" runat="server" 
                                                        CssClass="DropCadFormCandidatoCV" DataSourceID="SqlAreaAtuacao" 
                                                        DataTextField="dsAreaAtuacaoCandidato" DataValueField="dsAreaAtuacaoCandidato" 
                                                        SelectedValue='<%# Bind("areaAtuacao") %>' Width="505px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px" class="style1" bgcolor="#FFFFDF">
                                                    <asp:Label ID="LabelCV1" runat="server" Text="Área de interesse 1ª opção:"></asp:Label>
                                                </td>
                                                <td align="left" valign="top" width="540" bgcolor="#FFFFDF">
                                                    <asp:TextBox ID="interesse01TextBox" runat="server" 
                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("interesse01") %>' 
                                                        Width="500px" />
                                                    <asp:ImageButton ID="ImageButtonFiltro0" runat="server" 
                                                        ImageUrl="~/images/adminCandidato/filtroPesquisa.png" />
                                                    <asp:HoverMenuExtender ID="ImageButtonFiltro0_HoverMenuExtender" runat="server" 
                                                        DynamicServicePath="" Enabled="True" PopupControlID="AVISOPanel" 
                                                        TargetControlID="ImageButtonFiltro0">
                                                    </asp:HoverMenuExtender>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                        ControlToValidate="interesse01TextBox" 
                                                        ErrorMessage="É importante informar uma área de interesse, é aqui que o consultor irá te achar.">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px" bgcolor="#FFFFDF">
                                                    <asp:Label ID="LabelCV2" runat="server" Text="Área de interesse 2ª opção:"></asp:Label>
                                                </td>
                                                <td align="left" valign="top" width="540" bgcolor="#FFFFDF">
                                                    <asp:TextBox ID="interesse02TextBox" runat="server" 
                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("interesse02") %>' 
                                                        Width="500px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px" bgcolor="#FFFFDF">
                                                    <asp:Label ID="LabelCV3" runat="server" Text="Área de interesse 3ª opção:"></asp:Label>
                                                </td>
                                                <td align="left" valign="top" width="540" bgcolor="#FFFFDF">
                                                    <asp:TextBox ID="interesse03TextBox" runat="server" 
                                                        CssClass="InputCadFormCandidatoCV" Text='<%# Bind("interesse03") %>' 
                                                        Width="500px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCV5" runat="server" Text="CPF:"></asp:Label>
                                                </td>
                                                <td align="left" valign="top" width="540">
                                                    <asp:TextBox ID="cpfTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                        Text='<%# Bind("cpf") %>' Enabled="False" Width="500px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCV12" runat="server" Text="Data de nascimento:"></asp:Label>
                                                </td>
                                                <td align="left" valign="top" width="540">
                                                    <asp:TextBox ID="nascimentoTextBox" runat="server" 
                                                        CssClass="InputCadFormCandidatoCV" Width="500px" />
                                                    <asp:MaskedEditExtender ID="nascimentoTextBox_MaskedEditExtender" 
                                                        runat="server" ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                                        CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                                        CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                        CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                        Mask="99/99/9999" MaskType="Date" TargetControlID="nascimentoTextBox" 
                                                        InputDirection="RightToLeft">
                                                    </asp:MaskedEditExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    &nbsp;</td>
                                                <td align="left" valign="top" width="540">
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCV15" runat="server" Text="Estado Civil:"></asp:Label>
                                                </td>
                                                <td align="left" valign="top" width="540">
                                                    <asp:RadioButtonList ID="RadioButtonListEstadoCivil" runat="server" 
                                                        CssClass="RadioButtonListCV" DataSourceID="SqlEstadoCivil" 
                                                        DataTextField="estadocivil" DataValueField="estadocivil" RepeatColumns="2" 
                                                        SelectedValue='<%# Bind("estadocivil") %>' Width="500px">
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCV16" runat="server" Text="Número de dependentes:"></asp:Label>
                                                </td>
                                                <td align="left" valign="top" width="540">
                                                    <asp:DropDownList ID="DropDownListDependentes" runat="server" 
                                                        CssClass="DropCadFormCandidatoCV" 
                                                        SelectedValue='<%# Bind("nrdependente") %>' Width="505px">
                                                        <asp:ListItem Value="0">Não tenho dependentes.</asp:ListItem>
                                                        <asp:ListItem Value="1">1 dependente.</asp:ListItem>
                                                        <asp:ListItem Value="2">2 dependentes.</asp:ListItem>
                                                        <asp:ListItem Value="3">3 dependentes.</asp:ListItem>
                                                        <asp:ListItem Value="4">4 dependentes.</asp:ListItem>
                                                        <asp:ListItem Value="5">5 dependentes.</asp:ListItem>
                                                        <asp:ListItem Value="6">6 dependentes.</asp:ListItem>
                                                        <asp:ListItem Value="7">Acima de 6 dependentes.</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">&nbsp;</td>
                                                <td align="left" valign="top" width="540">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px"></td>
                                                <td align="right" valign="top" width="540"></td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" width="200px">
                                                    <asp:Label ID="LabelCV13" runat="server" Text="Qualificações:"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="AvisoLabel" runat="server" 
                                                        Text="• Máximo de 1200 toques."></asp:Label>
                                                </td>
                                                <td align="left" valign="top" width="540">
                                                    <asp:TextBox ID="resumoTextBox" runat="server" 
                                                        CssClass="InputCadFormCandidatoCV" Height="220px" 
                                                        ondatabinding="resumoTextBox_DataBinding" Text='<%# Bind("resumo") %>' 
                                                        TextMode="MultiLine" Width="500px" /><br />Caracteres restantes: <span id="contador">1200</span> 
                                                    (Máximo de 1200 toques)
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <asp:Panel ID="PanelEndereco" runat="server">
                                            <table ID="ENDERECO" cellpadding="2" cellspacing="0" width="740px" 
                                                bgcolor="#FFFFDF">
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCV6" runat="server" Text="Endereço:"></asp:Label>
                                                    </td>
                                                    <td align="left" valign="top" width="540">
                                                        <asp:TextBox ID="enderecoTextBox" runat="server" 
                                                            CssClass="InputCadFormCandidatoCV" Text='<%# Bind("endereco") %>' 
                                                            Width="500px" />
                                                        <asp:ImageButton ID="ImageButtonFiltro1" runat="server" 
                                                            ImageUrl="~/images/adminCandidato/filtroPesquisa.png" />
                                                        <asp:HoverMenuExtender ID="ImageButtonFiltro1_HoverMenuExtender" runat="server" 
                                                            DynamicServicePath="" Enabled="True" PopupControlID="AVISOPanel0" 
                                                            TargetControlID="ImageButtonFiltro1">
                                                        </asp:HoverMenuExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="Label2" runat="server" Text="Complemento:"></asp:Label>
                                                    </td>
                                                    <td align="left" valign="top" width="540">
                                                        <asp:TextBox ID="complementoTextBox" runat="server" 
                                                            CssClass="InputCadFormCandidatoCV" Text='<%# Bind("complemento") %>' 
                                                            Width="500px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCV7" runat="server" Text="Bairro:"></asp:Label>
                                                    </td>
                                                    <td align="left" valign="top" width="540">
                                                        <asp:TextBox ID="bairroTextBox" runat="server" 
                                                            CssClass="InputCadFormCandidatoCV" Text='<%# Bind("bairro") %>' 
                                                            Width="500px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCV8" runat="server" Text="Cidade:"></asp:Label>
                                                    </td>
                                                    <td align="left" valign="top" width="540">
                                                        <asp:TextBox ID="cidadeTextBox" runat="server" 
                                                            CssClass="InputCadFormCandidatoCV" Text='<%# Bind("cidade") %>' 
                                                            Width="500px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCV9" runat="server" Text="País:"></asp:Label>
                                                    </td>
                                                    <td align="left" valign="top" width="540">
                                                        <asp:TextBox ID="paisTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                            Text='<%# Bind("pais") %>' Width="500px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCV11" runat="server" Text="UF:"></asp:Label>
                                                    </td>
                                                    <td align="left" valign="top" width="540">
                                                        <asp:DropDownList ID="DropDownListUF" runat="server" 
                                                            CssClass="DropCadFormCandidatoCV" DataSourceID="SqlUF" DataTextField="uf" 
                                                            DataValueField="uf" SelectedValue='<%# Eval("uf") %>' Width="505px">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCV10" runat="server" Text="CEP:"></asp:Label>
                                                    </td>
                                                    <td align="left" valign="baseline" width="540">
                                                        <asp:TextBox ID="cepTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                                                            Text='<%# Bind("cep") %>' Width="500px" />
                                                        <asp:MaskedEditExtender ID="cepTextBox_MaskedEditExtender" runat="server" 
                                                            ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                                            CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                                            CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                            Mask="99999-999" MaskType="Number" TargetControlID="cepTextBox">
                                                        </asp:MaskedEditExtender>
                                                        <asp:ImageButton ID="PesquisaCEP" runat="server" 
                                                            ImageUrl="~/images/layout/pesquisa.gif" OnClick="PesquisaCEP_Click" 
                                                            ValidationGroup="CEPSearch" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <br />
                                        <br />
                                        <asp:Panel ID="PanelPublicar" runat="server">
                                            <table ID="Publicar" cellpadding="2" cellspacing="0" width="740px">
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelLb0" runat="server" Text="Publicar seu Currículo:"></asp:Label>
                                                    </td>
                                                    <td align="left" valign="top" width="540px">
                                                        <asp:CheckBox ID="apresentarCheckBox" runat="server" 
                                                            Checked='<%# Bind("apresentar") %>' CssClass="RadioButtonListCV" 
                                                            Text="Currículo publicado." />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelLb1" runat="server" Text="Privacidade:"></asp:Label>
                                                    </td>
                                                    <td align="left" valign="top" width="540px">
                                                        <asp:CheckBox ID="privacidadeCheckBox" runat="server" 
                                                            Checked='<%# Bind("privacidade") %>' CssClass="RadioButtonListCV" 
                                                            Text="Quero privacidade (CPF não aparece)" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelLb2" runat="server" Text="Disponibilidade para viagens:"></asp:Label>
                                                    </td>
                                                    <td align="left" valign="top" width="540px">
                                                        <asp:CheckBox ID="viagensCheckBox" runat="server" 
                                                            Checked='<%# Bind("viagens") %>' CssClass="RadioButtonListCV" 
                                                            Text="Sim, tenho disponibilidade para viagens." />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCV20" runat="server" Text="Local de preferência:"></asp:Label>
                                                    </td>
                                                    <td align="left" valign="top" width="540px">
                                                        <asp:DropDownList ID="DropDownListPreferencia" runat="server" 
                                                            CssClass="DropCadFormCandidatoCV" DataSourceID="SqlUF" DataTextField="dsuf" 
                                                            DataValueField="dsuf" SelectedValue='<%# Eval("localPreferencia") %>' 
                                                            Width="505px">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCV19" runat="server" Text="Disponibilidade:"></asp:Label>
                                                    </td>
                                                    <td align="left" valign="top" width="540px">
                                                        <asp:RadioButtonList ID="RadioButtonListDisponibilidade" runat="server" 
                                                            CssClass="RadioButtonListCV" DataSourceID="SqlDisponibilidade" 
                                                            DataTextField="disponibilidade" DataValueField="disponibilidade" 
                                                            RepeatColumns="2" RepeatDirection="Horizontal" 
                                                            SelectedValue='<%# Bind("disponibilidade") %>' ValidationGroup="Candidato" 
                                                            Width="505px">
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCV18" runat="server" Text="Situação atual:"></asp:Label>
                                                    </td>
                                                    <td align="left" valign="top" width="540px">
                                                        <asp:CheckBox ID="trabalhandoCheckBox" runat="server" 
                                                            Checked='<%# Bind("trabalhando") %>' CssClass="RadioButtonListCV" 
                                                            Text="Sim, atualmente estou trabalhando." />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCV17" runat="server" Text="Portador de deficiência física:"></asp:Label>
                                                    </td>
                                                    <td align="left" valign="top" width="540px">
                                                        <asp:CheckBox ID="portadorDefCheckBox" runat="server" 
                                                            Checked='<%# Bind("portadorDef") %>' CssClass="RadioButtonListCV" 
                                                            Text="Sim, preciso de atenção especial." />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        &nbsp;</td>
                                                    <td align="left" valign="top" width="540px">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="right" bgcolor="#FFFFDF" valign="top" width="200px">
                                                        <asp:Label ID="LabelCV25" runat="server" Text="Salário em Reais (R$):"></asp:Label>
                                                    </td>
                                                    <td align="left" bgcolor="#FFFFDF" valign="top" width="540px">
                                                        <table cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="USLabel" runat="server" Text="Último salário:"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    <asp:Label ID="Label3" runat="server" Text="Salário desejado:"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    <asp:Label ID="Label4" runat="server" Text="Contra proposta:"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox ID="valorRemAtualTextBox" runat="server" 
                                                                        CssClass="InputCadFormCandidatoCV" 
                                                                        Width="150px" />
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    <asp:TextBox ID="valorRemPretendidaTextBox" runat="server" 
                                                                        CssClass="InputCadFormCandidatoCV" Width="150px" />
                                                                </td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    <asp:CheckBox ID="acombinarCheckBox" runat="server" 
                                                                        Checked='<%# Bind("acombinar") %>' Text="Estou aberto a negociações." />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        &nbsp;</td>
                                                    <td align="left" valign="top" width="540px">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCV22" runat="server" Text="Seu cadastro ocorreu em:"></asp:Label>
                                                    </td>
                                                    <td align="left" valign="top" width="540px">
                                                        <asp:Label ID="dataCadastro" runat="server" Text='<%# Eval("data", "{0:D}") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCV23" runat="server" Text="Seu último acesso se deu em:"></asp:Label>
                                                    </td>
                                                    <td align="left" valign="top" width="540px">
                                                        <asp:Label ID="Ultimoacesso" runat="server" 
                                                            Text='<%# Eval("dataultimoacess", "{0:D}") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" width="200px">
                                                        <asp:Label ID="LabelCV24" runat="server" Text="Seus CV foi visualizado:"></asp:Label>
                                                    </td>
                                                    <td align="left" valign="top" width="540px">
                                                        <asp:Label ID="contadorLabel" runat="server" Text='<%# Eval("contador") %>'></asp:Label>
                                                        <asp:Label ID="Label1" runat="server" Text=" vez(es)"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        &nbsp;<br />
                                        <asp:Panel ID="AVISOPanel" runat="server" BackColor="#006699" Width="280px">
                                            <table align="AVISO" cellpadding="5" cellspacing="5">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="LabelAviso" runat="server" ForeColor="White" 
                                                            Text="Este e outros campos são utilizados em pesquisa nos processos seletivos, além disso também são utilizados em um pré-filtro para gerar um relatório de aderência ao perfil da oportunidade e o candidato (você). Não deixe de preenchê-lo. "></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <asp:Panel ID="AVISOPanel0" runat="server" BackColor="#006699" Width="280px">
                                            <table align="AVISO" cellpadding="5" cellspacing="5">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="LabelAviso0" runat="server" ForeColor="White" 
                                                            Text="[&lt;b&gt;Endereço&lt;/b&gt;] - Este campo é utilizado para envio de correspondência do RH, para agendar uma entrevista caso seu e-mail não seja válido ou seu servidor de e-mail esteja fora do ar. Não deixe de preenchê-lo. "></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <br />
                                        <table ID="ControleBt" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="right">
                                                    <asp:LinkButton ID="LinkButtonSALVAR" runat="server" 
                                                        CssClass="button" CommandName="Update" 
                                                        ToolTip="Clique aqui para salvar suas alterações">Salvar</asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CausesValidation="False" 
                                                        CssClass="button" onclick="LinkButtonCANCELAR_Click" 
                                                        ToolTip="Clique aqui para voltar ao menu principal" 
                                                        PostBackUrl="~/_candidato/Default.aspx">Menu Principal</asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButtonVERCV" runat="server" CausesValidation="False" 
                                                        CssClass="button" onclick="LinkButtonVERCV_Click" 
                                                        ToolTip="Clique aqui para ver como está seu CV. OBS.: Este CV, é o que será apresentado ao analista das vagas que você irá participar.">Ver Currículo Vitae</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        idUser:
                                        <asp:TextBox ID="idUserTextBox" runat="server" Text='<%# Bind("idUser") %>' />
                                        <br />
                                        areaAtuacao:
                                        <asp:TextBox ID="areaAtuacaoTextBox" runat="server" 
                                            Text='<%# Bind("areaAtuacao") %>' />
                                        <br />
                                        interesse01:
                                        <asp:TextBox ID="interesse01TextBox" runat="server" 
                                            Text='<%# Bind("interesse01") %>' />
                                        <br />
                                        interesse02:
                                        <asp:TextBox ID="interesse02TextBox" runat="server" 
                                            Text='<%# Bind("interesse02") %>' />
                                        <br />
                                        interesse03:
                                        <asp:TextBox ID="interesse03TextBox" runat="server" 
                                            Text='<%# Bind("interesse03") %>' />
                                        <br />
                                        foto:
                                        <asp:TextBox ID="fotoTextBox" runat="server" Text='<%# Bind("foto") %>' />
                                        <br />
                                        cpf:
                                        <asp:TextBox ID="cpfTextBox" runat="server" Text='<%# Bind("cpf") %>' />
                                        <br />
                                        nome:
                                        <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
                                        <br />
                                        endereco:
                                        <asp:TextBox ID="enderecoTextBox" runat="server" 
                                            Text='<%# Bind("endereco") %>' />
                                        <br />
                                        cep:
                                        <asp:TextBox ID="cepTextBox" runat="server" Text='<%# Bind("cep") %>' />
                                        <br />
                                        bairro:
                                        <asp:TextBox ID="bairroTextBox" runat="server" Text='<%# Bind("bairro") %>' />
                                        <br />
                                        cidade:
                                        <asp:TextBox ID="cidadeTextBox" runat="server" Text='<%# Bind("cidade") %>' />
                                        <br />
                                        uf:
                                        <asp:TextBox ID="ufTextBox" runat="server" Text='<%# Bind("uf") %>' />
                                        <br />
                                        pais:
                                        <asp:TextBox ID="paisTextBox" runat="server" Text='<%# Bind("pais") %>' />
                                        <br />
                                        nascimento:
                                        <asp:TextBox ID="nascimentoTextBox" runat="server" 
                                            Text='<%# Bind("nascimento") %>' />
                                        <br />
                                        sexo:
                                        <asp:TextBox ID="sexoTextBox" runat="server" Text='<%# Bind("sexo") %>' />
                                        <br />
                                        cadastroTipo:
                                        <asp:TextBox ID="cadastroTipoTextBox" runat="server" 
                                            Text='<%# Bind("cadastroTipo") %>' />
                                        <br />
                                        apresentar:
                                        <asp:CheckBox ID="apresentarCheckBox" runat="server" 
                                            Checked='<%# Bind("apresentar") %>' />
                                        <br />
                                        estadocivil:
                                        <asp:TextBox ID="estadocivilTextBox" runat="server" 
                                            Text='<%# Bind("estadocivil") %>' />
                                        <br />
                                        nrdependente:
                                        <asp:TextBox ID="nrdependenteTextBox" runat="server" 
                                            Text='<%# Bind("nrdependente") %>' />
                                        <br />
                                        portadorDef:
                                        <asp:CheckBox ID="portadorDefCheckBox" runat="server" 
                                            Checked='<%# Bind("portadorDef") %>' />
                                        <br />
                                        trabalhando:
                                        <asp:CheckBox ID="trabalhandoCheckBox" runat="server" 
                                            Checked='<%# Bind("trabalhando") %>' />
                                        <br />
                                        resumo:
                                        <asp:TextBox ID="resumoTextBox" runat="server" Text='<%# Bind("resumo") %>' />
                                        <br />
                                        valorRemAtual:
                                        <asp:TextBox ID="valorRemAtualTextBox" runat="server" 
                                            Text='<%# Bind("valorRemAtual") %>' />
                                        <br />
                                        valorRemPretendida:
                                        <asp:TextBox ID="valorRemPretendidaTextBox" runat="server" 
                                            Text='<%# Bind("valorRemPretendida") %>' />
                                        <br />
                                        acombinar:
                                        <asp:CheckBox ID="acombinarCheckBox" runat="server" 
                                            Checked='<%# Bind("acombinar") %>' />
                                        <br />
                                        localPreferencia:
                                        <asp:TextBox ID="localPreferenciaTextBox" runat="server" 
                                            Text='<%# Bind("localPreferencia") %>' />
                                        <br />
                                        disponibilidade:
                                        <asp:TextBox ID="disponibilidadeTextBox" runat="server" 
                                            Text='<%# Bind("disponibilidade") %>' />
                                        <br />
                                        data:
                                        <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>' />
                                        <br />
                                        dataultimoacess:
                                        <asp:TextBox ID="dataultimoacessTextBox" runat="server" 
                                            Text='<%# Bind("dataultimoacess") %>' />
                                        <br />
                                        contador:
                                        <asp:TextBox ID="contadorTextBox" runat="server" 
                                            Text='<%# Bind("contador") %>' />
                                        <br />
                                        privacidade:
                                        <asp:CheckBox ID="privacidadeCheckBox" runat="server" 
                                            Checked='<%# Bind("privacidade") %>' />
                                        <br />
                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                            CommandName="Insert" Text="Insert" />
                                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <table ID="Table1" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="right">
                                                    <asp:LinkButton ID="LinkButtonEditar" runat="server" CausesValidation="False" 
                                                        CommandName="Edit" CssClass="button" onclick="LinkButtonEditar_Click" 
                                                        ToolTip="Clique aqui para alterar seus dados pessoais">Alterar dados de seu Currículo Vitae</asp:LinkButton>
                                                    <asp:LinkButton ID="LinkButtonMP" runat="server" CssClass="button" 
                                                        onclick="LinkButtonMP_Click" 
                                                        ToolTip="Clique aqui para voltar para o menu principal">Menu Principal</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:FormView>
                <!-- DADOS PESSOAIS -->
                                <asp:Label ID="idCurriculoLabel" runat="server" 
        Visible="False"></asp:Label>
            <br />            
            <asp:Panel ID="PanelCVCandidato" runat="server" Visible="False">
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
                                    <table ID="CV0" cellpadding="2" cellspacing="2" width="600px">
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados9" runat="server" CssClass="textoGeral" 
                                                                                                Text="Nome do Candidato(a):"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="nomeLabel" runat="server" CssClass="textoApresentaNOMECV" 
                                                                                                Font-Bold="False" 
                                                    Text='<%# Eval("nome") %>' />
                                                <br />
                                                <asp:Label ID="cadastroTipoLabel" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("cadastroTipo") %>' />
                                                <br />
                                                <asp:Label ID="emailLabel" runat="server" CssClass="textDescritivo" 
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
                                                <asp:Label ID="LabelCVDados8" runat="server" CssClass="textoGeral" 
                                                                                                Text="Sexo:"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="sexoLabel" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("sexo") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados0" runat="server" CssClass="textoGeral" 
                                                                                                Text="Área de Atuação:"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="areaAtuacaoLabel" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("areaAtuacao") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados1" runat="server" CssClass="textoGeral" 
                                                                                                
                                                    Text="Área de interesse (1ª Opção):"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="interesse01Label" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("interesse01") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados2" runat="server" CssClass="textoGeral" 
                                                                                                
                                                    Text="Área de interesse (2ª Opção):"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="interesse02Label" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("interesse02") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados3" runat="server" CssClass="textoGeral" 
                                                                                                
                                                    Text="Área de interesse (3ª Opção):"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="interesse03Label" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("interesse03") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados4" runat="server" CssClass="textoGeral" 
                                                                                                Text="CPF:"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="cpfLabel" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("cpf") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados5" runat="server" CssClass="textoGeral" 
                                                                                                Text="Resumo:"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="resumoLabel" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("resumo") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados6" runat="server" CssClass="textoGeral" 
                                                                                                
                                                    Text="Endereço: (Formas de contato)"></asp:Label>
                                            </td>
                                            <td align="left" bgcolor="#F0F0F0" width="400">
                                                <asp:Label ID="enderecoLabel" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("endereco") %>' />
                                                <br />
                                                <asp:Label ID="bairroLabel" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("bairro") %>' />
                                                <br />
                                                <asp:Label ID="cepLabel" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("cep") %>' />
                                                <br />
                                                <asp:Label ID="cidadeLabel" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("cidade") %>' />
                                                <asp:Label ID="HIFENlabel1" runat="server" CssClass="textDescritivo" 
                                                                                                Text=" - "></asp:Label>
                                                <asp:Label ID="ufLabel" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("uf") %>' />
                                                <asp:Label ID="HIFENlabel2" runat="server" CssClass="textDescritivo" 
                                                                                                Text=" - "></asp:Label>
                                                <asp:Label ID="paisLabel" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("pais") %>' />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados7" runat="server" CssClass="textoGeral" 
                                                                                                Text="Data de Nascimento:"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="nascimentoLabel" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("nascimento", "{0:d}") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados10" runat="server" CssClass="textoGeral" 
                                                                                                Text="Estado Civil:"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="estadocivilLabel" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("estadocivil") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados11" runat="server" CssClass="textoGeral" 
                                                                                                Text="Dependentes:"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="nrdependenteLabel" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("nrdependente") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados12" runat="server" CssClass="textoGeral" 
                                                                                                Text="Situação atual:"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="trabalhandoLabel" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("trabalhando") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados13" runat="server" CssClass="textoGeral" 
                                                                                                Text="Salário atual:"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="valorRemAtualLabel" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("valorRemAtual", "{0:C}") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados14" runat="server" CssClass="textoGeral" 
                                                                                                Text="Salário pretendido:"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="valorRemPretendidaLabel" runat="server" 
                                                                                                CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("valorRemPretendida", "{0:C}") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados15" runat="server" CssClass="textoGeral" 
                                                                                                Text="À combinar:"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="acombinarLabel" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("acombinar") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados16" runat="server" CssClass="textoGeral" 
                                                                                                
                                                    Text="Preferência de local de trabalho:"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="localPreferenciaLabel" runat="server" 
                                                                                                CssClass="textDescritivo" 
                                                    Text='<%# Eval("localPreferencia") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados17" runat="server" CssClass="textoGeral" 
                                                                                                Text="Disponibilidade:"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="disponibilidadeLabel" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("disponibilidade") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados18" runat="server" CssClass="textoGeral" 
                                                                                                Text="Ficou sabendo pelo:"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="origemLabel" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("origem") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados19" runat="server" CssClass="textoGeral" 
                                                                                                Text="Cadastrado desde:"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="dataLabel" runat="server" CssClass="textDescritivo" 
                                                                                                Text='<%# Eval("data") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados20" runat="server" CssClass="textoGeral" 
                                                                                                Text="Último acesso em:"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="dataultimoacessLabel" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("dataultimoacess") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" bgcolor="#F0F0F0" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados21" runat="server" CssClass="textoGeral" 
                                                                                                Text="Visualizações deste CV:"></asp:Label>
                                            </td>
                                            <td align="left" bgcolor="#F0F0F0" width="400">
                                                <asp:Label ID="contadorLabel" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("contador") %>' />
                                                <asp:Label ID="LabelCVDados22" runat="server" CssClass="textoGeral" 
                                                                                                Text="  vezes"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados23" runat="server" CssClass="textoGeral" 
                                                                                                Text="Quanto a privacidade:"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="privacidadeLabel" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("privacidade") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados24" runat="server" CssClass="textoGeral" 
                                                                                                Text="Necessidades especiais:"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="portadorDefLabel" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("portadorDef") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados25" runat="server" CssClass="textoGeral" 
                                                                                                Text="Observações (PNE):"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="dsDefAuditivaLabel" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("dsDefAuditiva") %>' />
                                                <asp:Label ID="dsDefFalaLabel" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("dsDefFala") %>' />
                                                <asp:Label ID="dsDefMotoraLabel" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("dsDefMotora") %>' />
                                                <asp:Label ID="dsDefVisualLabel" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("dsDefVisual") %>' />
                                                <asp:Label ID="dsDefMentalLabel" runat="server" CssClass="textDescritivo" 
                                                                                                
                                                    Text='<%# Eval("dsDefMental") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top" width="200px">
                                                <asp:Label ID="LabelCVDados26" runat="server" CssClass="textoGeral" 
                                                                                                Text="Referência:"></asp:Label>
                                            </td>
                                            <td align="left" width="400">
                                                <asp:Label ID="VINCULOLabel" runat="server" CssClass="textDescritivo" 
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
                                                <asp:Label ID="Label28" runat="server" CssClass="textoGeral" 
                                                                                                Text="Idioma(s):"></asp:Label>
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
                                                <asp:Label ID="Label32" runat="server" CssClass="textoGeral" Text="Apresentação pessoal:"></asp:Label><br />
                                                <asp:Label ID="Label31" runat="server" CssClass="textoGeral" Text="Auto-Avaliação Profissional:"></asp:Label><br />
                                                <asp:Label ID="Label33" runat="server" CssClass="textoGeral" Text="Competência Profissional:"></asp:Label><br />
                                                <asp:Label ID="Label34" runat="server" CssClass="textoGeral" Text="Realizações:"></asp:Label><br />
                                                <asp:Label ID="Label35" runat="server" CssClass="textoGeral" Text="Objetivos:"></asp:Label></td>
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
                                                <asp:Label ID="Label36" runat="server" CssClass="textoGeral" 
                                                                                                Text="Videos:"></asp:Label>
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
                        &nbsp;<asp:Label ID="idsetupLabel" runat="server" Text='<%# Eval("idsetup") %>' 
                            Visible="False" />
                        &nbsp;<asp:Label ID="idcurriculoLabel" runat="server" 
                                                                        
                            Text='<%# Eval("idcurriculo") %>' Visible="False" />
                        <asp:Label ID="nmempresaLabel" runat="server" Text='<%# Eval("nmempresa") %>' 
                                                                        Visible="False" />
                        <br />
                        <table ID="BODYRESTANTE" cellpadding="5" cellspacing="5" width="800px">
                            <tr>
                                <td valign="top" width="130px">
                                </td>
                                <td align="left" valign="top" width="670px">
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSourceFORMACAO" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_FORMACAO" 
                                                                        
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" 
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceIDIOMA" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_IDIOMA" 
                                                                        
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" 
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceINFORMATICA" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_INFORMATICA" 
                                                                        
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" 
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceTRAJETORIA" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_TRAJETORIA_PROFISSIONAL" 
                                                                        
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" 
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceTELEFONE" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_TELEFONE" 
                                                                        
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" 
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceAUTOAVALIACAO" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_AUTO_AVALIACAO" 
                                                                        
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" 
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSourceMULTIMIDIA" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_PROCESSOSELETIVO_LAUDO_MULTIMIDIA" 
                                                                        
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" 
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                    </ItemTemplate>
                </asp:DataList>
            </asp:Panel>
            <br />
                                <asp:SqlDataSource ID="SqlDADOSPESSOAIS" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                    SelectCommand="_USP_CURRICULO_DADOSPESSOAIS" 
                                    SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="idCurriculoLabel" Name="idCurriculo" 
                                            PropertyName="Text" Type="Int32" />
                                        <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlAdministraCV" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="_USP_MONTA_CURRICULO_EDITOR" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idCurriculo" SessionField="idCurriculo" 
                        Type="Int32" />
                    <asp:SessionParameter Name="idCadastroUser" SessionField="idCadastroUser" 
                        Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlAdministraCVFORM" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                DeleteCommand="DELETE FROM [tbCadastroUser] WHERE [idCadastroUser] = @idCadastroUser" 
                InsertCommand="INSERT INTO [tbCadastroUser] ([idUser], [areaAtuacao], [interesse01], [interesse02], [interesse03], [foto], [cpf], [nome], [endereco], [complemento], [cep], [bairro], [cidade], [uf], [pais], [nascimento], [sexo], [cadastroTipo], [apresentar], [estadocivil], [nrdependente], [portadorDef], [trabalhando], [resumo], [valorRemAtual], [valorRemPretendida], [acombinar], [localPreferencia], [disponibilidade], [data], [dataultimoacess], [contador], [privacidade]) VALUES (@idUser, @areaAtuacao, @interesse01, @interesse02, @interesse03, @foto, @cpf, @nome, @endereco, @complemento, @cep, @bairro, @cidade, @uf, @pais, @nascimento, @sexo, @cadastroTipo, @apresentar, @estadocivil, @nrdependente, @portadorDef, @trabalhando, @resumo, @valorRemAtual, @valorRemPretendida, @acombinar, @localPreferencia, @disponibilidade, @data, @dataultimoacess, @contador, @privacidade)" 
                SelectCommand="SELECT idCadastroUser, idUser, areaAtuacao, interesse01, interesse02, interesse03, foto, cpf, nome, endereco, complemento, cep, bairro, cidade, uf, pais, nascimento, sexo, cadastroTipo, apresentar, estadocivil, ISNULL(nrdependente,0) AS nrdependente, portadorDef, trabalhando, resumo, valorRemAtual, valorRemPretendida, acombinar, localPreferencia, disponibilidade, data, dataultimoacess, contador, privacidade, viagens FROM tbCadastroUser WHERE (idCadastroUser = @idCadastroUser)" 
                
                
                UpdateCommand="UPDATE tbCadastroUser SET idUser = @idUser, areaAtuacao = @areaAtuacao, interesse01 = @interesse01, interesse02 = @interesse02, interesse03 = @interesse03, foto = @foto, cpf = @cpf, nome = @nome, endereco = @endereco, complemento = @complemento, cep = @cep, bairro = @bairro, cidade = @cidade, uf = @uf, pais = @pais, nascimento = @nascimento, sexo = @sexo, cadastroTipo = @cadastroTipo, apresentar = @apresentar, estadocivil = @estadocivil, nrdependente = ISNULL(@nrdependente,0), portadorDef = @portadorDef, trabalhando = @trabalhando, resumo = @resumo, valorRemAtual = @valorRemAtual, valorRemPretendida = @valorRemPretendida, acombinar = @acombinar, localPreferencia = @localPreferencia, disponibilidade = @disponibilidade, data = @data, dataultimoacess = @dataultimoacess, contador = @contador, privacidade = @privacidade, viagens = @viagens WHERE (idCadastroUser = @idCadastroUser)">
                <DeleteParameters>
                    <asp:Parameter Name="idCadastroUser" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="idUser" Type="Int32" />
                    <asp:Parameter Name="areaAtuacao" Type="String" />
                    <asp:Parameter Name="interesse01" Type="String" />
                    <asp:Parameter Name="interesse02" Type="String" />
                    <asp:Parameter Name="interesse03" Type="String" />
                    <asp:Parameter Name="foto" Type="String" />
                    <asp:Parameter Name="cpf" Type="String" />
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="endereco" Type="String" />
                    <asp:Parameter Name="complemento" Type="String" />
                    <asp:Parameter Name="cep" Type="String" />
                    <asp:Parameter Name="bairro" Type="String" />
                    <asp:Parameter Name="cidade" Type="String" />
                    <asp:Parameter Name="uf" Type="String" />
                    <asp:Parameter Name="pais" Type="String" />
                    <asp:Parameter Name="nascimento" Type="DateTime" />
                    <asp:Parameter Name="sexo" Type="String" />
                    <asp:Parameter Name="cadastroTipo" Type="String" />
                    <asp:Parameter Name="apresentar" Type="Boolean" />
                    <asp:Parameter Name="estadocivil" Type="String" />
                    <asp:Parameter Name="nrdependente" Type="Int32" />
                    <asp:Parameter Name="portadorDef" Type="Boolean" />
                    <asp:Parameter Name="trabalhando" Type="Boolean" />
                    <asp:Parameter Name="resumo" Type="String" />
                    <asp:Parameter Name="valorRemAtual" Type="Decimal" />
                    <asp:Parameter Name="valorRemPretendida" Type="Decimal" />
                    <asp:Parameter Name="acombinar" Type="Boolean" />
                    <asp:Parameter Name="localPreferencia" Type="String" />
                    <asp:Parameter Name="disponibilidade" Type="String" />
                    <asp:Parameter Name="data" Type="DateTime" />
                    <asp:Parameter Name="dataultimoacess" Type="DateTime" />
                    <asp:Parameter Name="contador" Type="Int32" />
                    <asp:Parameter Name="privacidade" Type="Boolean" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="idCadastroUser" SessionField="idCadastroUser" 
                        Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="idUser" Type="Int32" />
                    <asp:Parameter Name="areaAtuacao" Type="String" />
                    <asp:Parameter Name="interesse01" Type="String" />
                    <asp:Parameter Name="interesse02" Type="String" />
                    <asp:Parameter Name="interesse03" Type="String" />
                    <asp:Parameter Name="foto" Type="String" />
                    <asp:Parameter Name="cpf" Type="String" />
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="endereco" Type="String" />
                    <asp:Parameter Name="complemento" Type="String" />
                    <asp:Parameter Name="cep" Type="String" />
                    <asp:Parameter Name="bairro" Type="String" />
                    <asp:Parameter Name="cidade" Type="String" />
                    <asp:Parameter Name="uf" Type="String" />
                    <asp:Parameter Name="pais" Type="String" />
                    <asp:Parameter Name="nascimento" Type="DateTime" />
                    <asp:Parameter Name="sexo" Type="String" />
                    <asp:Parameter Name="cadastroTipo" Type="String" />
                    <asp:Parameter Name="apresentar" Type="Boolean" />
                    <asp:Parameter Name="estadocivil" Type="String" />
                    <asp:Parameter Name="nrdependente" Type="Int32" />
                    <asp:Parameter Name="portadorDef" Type="Boolean" />
                    <asp:Parameter Name="trabalhando" Type="Boolean" />
                    <asp:Parameter Name="resumo" Type="String" />
                    <asp:Parameter Name="valorRemAtual" Type="Decimal" />
                    <asp:Parameter Name="valorRemPretendida" Type="Decimal" />
                    <asp:Parameter Name="acombinar" Type="Boolean" />
                    <asp:Parameter Name="localPreferencia" Type="String" />
                    <asp:Parameter Name="disponibilidade" Type="String" />
                    <asp:Parameter Name="data" Type="DateTime" />
                    <asp:Parameter Name="dataultimoacess" Type="DateTime" />
                    <asp:Parameter Name="contador" Type="Int32" />
                    <asp:Parameter Name="privacidade" Type="Boolean" />
                    <asp:Parameter Name="viagens" />
                    <asp:Parameter Name="idCadastroUser" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlAreaAtuacao" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                
                SelectCommand="SELECT [idAreaAtuacaoCandidato], [dsAreaAtuacaoCandidato] FROM [tbAreaAtuacaoCandidato] ORDER BY [dsAreaAtuacaoCandidato]">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlUF" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="SELECT [uf], [dsuf] FROM [tbuf]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlEstadoCivil" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [estadocivil] FROM [tbestadocivil]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDisponibilidade" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [disponibilidade] FROM [tbDisponibilidade]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlOrigem" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [origem] FROM [tbOrigem] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa_layout" Type="Int32" />
        </SelectParameters>
            </asp:SqlDataSource>
            <br />
    <asp:SqlDataSource ID="SqlLISTACONTATO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbTelefone] WHERE [idTelefone] = @idTelefone" 
        InsertCommand="INSERT INTO [tbTelefone] ([idTipoTelefone], [idCadastroUser], [ddd], [numero], [ramal]) VALUES (@idTipoTelefone, @idCadastroUser, @ddd, @numero, @ramal)"
        SelectCommand="SELECT idTelefone, idTipoTelefone, idCadastroUser, ddd, numero, ramal, optin FROM tbTelefone WHERE (idCadastroUser = @idCadastroUser)"
        
        
                UpdateCommand="UPDATE [tbTelefone] SET [idTipoTelefone] = @idTipoTelefone, [idCadastroUser] = @idCadastroUser, [ddd] = @ddd, [numero] = @numero, [ramal] = @ramal WHERE [idTelefone] = @idTelefone">
        <DeleteParameters>
            <asp:Parameter Name="idTelefone" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idTipoTelefone" Type="String" />
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
            <asp:Parameter Name="ddd" Type="String" />
            <asp:Parameter Name="numero" Type="String" />
            <asp:Parameter Name="ramal" Type="Int32" />
            <asp:Parameter Name="idTelefone" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroUser" SessionField="idCadastroUser"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idTipoTelefone" Type="String" />
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
            <asp:Parameter Name="ddd" Type="String" />
            <asp:Parameter Name="numero" Type="String" />
            <asp:Parameter Name="ramal" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlTIPOTELEFONE" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idTipoTelefone] FROM [tbTipoTelefone]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlCONTATOFORM" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbTelefone] WHERE [idTelefone] = @idTelefone" 
        InsertCommand="INSERT INTO tbTelefone(idTipoTelefone, idCadastroUser, ddd, numero, ramal, optin) VALUES (@idTipoTelefone, @idCadastroUser, @ddd, @numero, @ramal, @optin)"
        SelectCommand="SELECT idTelefone, idTipoTelefone, idCadastroUser, ddd, numero, ramal, optin FROM tbTelefone WHERE (idTelefone = @idTelefone)"
        
        
                UpdateCommand="UPDATE tbTelefone SET idTipoTelefone = @idTipoTelefone, idCadastroUser = @idCadastroUser, ddd = @ddd, numero = @numero, ramal = @ramal, optin = @optin WHERE (idTelefone = @idTelefone)">
        <DeleteParameters>
            <asp:Parameter Name="idTelefone" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idTipoTelefone" Type="String" />
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
            <asp:Parameter Name="ddd" Type="String" />
            <asp:Parameter Name="numero" Type="String" />
            <asp:Parameter Name="ramal" Type="Int32" />
            <asp:Parameter Name="optin" />
            <asp:Parameter Name="idTelefone" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="idTelefoneLabel" DefaultValue="0" 
                Name="idTelefone" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idTipoTelefone" Type="String" />
            <asp:Parameter Name="idCadastroUser" Type="Int32" />
            <asp:Parameter Name="ddd" Type="String" />
            <asp:Parameter Name="numero" Type="String" />
            <asp:Parameter Name="ramal" Type="Int32" />
            <asp:Parameter Name="optin" />
        </InsertParameters>
    </asp:SqlDataSource>
            <br />
            <br />
        </td>
    </tr>
</table>
<br />
</asp:Content>

