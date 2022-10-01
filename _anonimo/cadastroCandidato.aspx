<%@ Page Language="VB" MasterPageFile="~/MasterPageJobClick.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="cadastroCandidato.aspx.vb" Inherits="_anonimo_cadastroCandidato" title="Cadastrar Currículo" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        
        #menu .linkcandidato
            {
                color: #fff !important;
            }        
        .style3
        {
            height: 87px;
        }
    </style>
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
    <script src="../js/mascara.js" type=text/javascript></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAvisoVANTAGENS.ClientID%>").dialog({
                closeText: ''
                , width: '900'
                , title: "(+) sobre o JobClick"
                , minHeight: '100'
                , position: ['center', 42]
                , zIndex: 50
                , show: {
                    effect: 'drop'
                    , direction: "up"
                }
            });
        });
	</script>
    <script type="text/javascript">
        $(function () {
            $("#<%=AvisoPanel.ClientID%>").dialog({
                closeText: ''
                , width: '900'
                , title: "Aviso"
                , minHeight: '100'
                , position: ['center', 42]
                , zIndex: 50
                , show: {
                    effect: 'drop'
                    , direction: "up"
                }
            });
        });
	</script>
                <asp:Panel ID="PanelAvisoVANTAGENS" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                            <td align="center">
                                <asp:Label ID="HTML" runat="server" CssClass="textoGeral"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="AvisoPanel" runat="server" Visible="False">
                    <table id="Table1" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                            <td align="center">
                                <asp:Label ID="AVISOLABELTop" runat="server" CssClass="msn"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Cabec" runat="server" Text="Cadastro de Currículo Gratuito" CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>
    <br />
    <table align="center" id="AvisoCabec" width="740">
        <tr>
            <td width="40">&nbsp;</td> 
            <td align="left" width="700"><asp:Label ID="LabelAviso" runat="server"></asp:Label>
                <br />
                <br />
                <asp:LinkButton ID="LinkButtonConhecer" runat="server" CausesValidation="False" 
                    CssClass="textQUIZ">Clique aqui para conhecer todas as funcionalidades</asp:LinkButton>
                <br />
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td valign="top">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                     <table runat="server" id="mensagemEmail" visible="False" align="center" 
                        cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/images/mensagem.gif" /></td>
                        </tr>
                    </table>    
  
                 <table runat="server" id="sendEmail" visible="true" width="730px" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="center" width="300">
                            &nbsp;</td>
                        <td align="center">
                            <br />
                <asp:ImageButton ID="IBenviarEmail" runat="server" 
                    ImageUrl="~/images/layoutNew/btCadastroCandidato.png" CommandName="Insert" 
                                Visible="False" />
                        </td>
                    </tr>
                </table>  
    
            <table id="TableAviso" align="center" cellpadding="0" cellspacing="0" width="740px">
                <tr>
                    <td width="40">&nbsp;</td> 
                    <td align="left" width="700">
                        <asp:Panel ID="PanelAviso" runat="server" Width="700px">
                        <table id="AVISOCPF" align="center" cellpadding="5" cellspacing="5" width="100%" bgcolor="#EEEEEE">
                            <tr>
                                <td align="left">
                                    <asp:Label ID="AVISOLABEL0" runat="server" CssClass="msnOK"></asp:Label>
                                </td>
                                <td align="right" valign="top" width="100px">
                                    <asp:LinkButton ID="LinkButtonFechar0" runat="server" CausesValidation="False">Fechar</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>          
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Cabec0" runat="server" Text="Dados Básicos" 
                    CssClass="TituloBGText"></asp:Label>
                <asp:Label ID="candidatoPagaLabel" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    
                  
        <table runat="server" visible="True" id="dadospessoais" width="740" cellpadding="0" 
                    cellspacing="0">
            <tr>
                <td width="40"></td> 
                <td align="left">
                    <table cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td>
                                <table cellpadding="1" cellspacing="1" style="width: 100%" align="left">
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="nomeLabel" runat="server" Font-Bold="True" Text="Seu nome:"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" 
                                                ControlToValidate="nomeTextBox" Display="Dynamic" ErrorMessage="* Seu nome é obrigatório." 
                                                SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                            <br />
                                                <asp:TextBox ID="nomeTextBox" runat="server" Text='' 
                CssClass="InputCad" Width="320px" ToolTip="Informe seu nome"></asp:TextBox>
                                                                    </td>
                                        <td align="left">  
                        
                                                <asp:Label ID="CPFLabel" runat="server" Font-Bold="True" Text="CPF:"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="TextBoxCPF"
                Display="Dynamic" ErrorMessage="* CPF é obrigatório.">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="TextBoxCPF" runat="server" onkeyup="formataCPF(this,event);" style="text-align:left" 
                                                    CssClass="InputCad" OnTextChanged="PesquisaCPF"
                Text='' AutoPostBack="True" Width="320px" MaxLength="14" ToolTip="O sistema não permite dois CPFs idênticos, garantindo assim a autenticidade do candidato e a integridade dos dados."></asp:TextBox>
                
                                                                    </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" align="left">
                 <asp:UpdatePanel ID="UpdatePanelCEP" runat="server" EnableViewState="False">
                    <ContentTemplate>                                                                                        
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                   <td>
                                       <asp:Label ID="CEPLabel" runat="server" Font-Bold="True" Text="CEP:"></asp:Label>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                           ControlToValidate="cepTextBox" Display="Dynamic" 
                                           ErrorMessage="* CEP é obrigatório." SetFocusOnError="True" 
                                           ValidationGroup="psqCEP">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="cepTextBox" ErrorMessage="* CEP 99999-999" ValidationExpression="\d{5}(-\d{3})?" ValidationGroup="psqCEP" Display="Dynamic"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" 
                                           ControlToValidate="cepTextBox" Display="Dynamic" 
                                           ErrorMessage="* CEP é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>                                                       
                                       <br />
                                    <asp:TextBox ID="cepTextBox" runat="server" onkeyup="formataCEP(this,event);" style="text-align:left" CssClass="InputCad" Text='' ValidationGroup="psqCEP" Width="320px" MaxLength="9" ToolTip="Informe seu CEP, em seguida clique na (Lupa) para pesquisar seu CEP."></asp:TextBox>
                                    </td>
                                    <td><br /><asp:ImageButton ID="PesquisaCEP" runat="server" 
                                            ImageUrl="~/images/layout/pesquisa.png" OnClick="PesquisaCEP_Click" 
                                            ValidationGroup="psqCEP" 
                                            ToolTip="Informe o CEP e clique aqui para preenchimento automático."  />
                                </td>
                             </tr>
                          </table> 
                 
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label ID="EndereçoLabel" runat="server" Font-Bold="True" Text="Endereço:"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="enderecoTextBox" Display="Dynamic" 
                                            ErrorMessage="* Endereço é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="enderecoTextBox" runat="server" CssClass="InputCad" Text="" 
                                            Width="276px" ToolTip="Informe seu logradouro."></asp:TextBox>
                                        &nbsp;</td>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Nº"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" 
                                            ControlToValidate="NrTextBox" ErrorMessage="* Endereço número é obrigatório">*</asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="NrTextBox" runat="server" CssClass="InputCad" Width="30px" ToolTip="Informe o número de sua residência."></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:Label ID="ComplementoLabel" runat="server" Font-Bold="True" Text="Complemento:"></asp:Label>
                            <br />
                            <asp:TextBox ID="complementoTextBox" runat="server" CssClass="InputCad" Text="" 
                                Width="320px" ToolTip="Se houver algum complemento de endereço, informe aqui."></asp:TextBox>
                            <br />
                            <asp:Label ID="BairroLabel" runat="server" Font-Bold="True" Text="Bairro:"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="bairroTextBox" Display="Dynamic" ErrorMessage="* Bairro é obrigatório." 
                                SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="bairroTextBox" runat="server" CssClass="InputCad" Text="" 
                                Width="320px" ToolTip="Informe o bairro."></asp:TextBox>
                            <br />
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label ID="CidadeLabel" runat="server" Font-Bold="True" Text="Cidade:"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="cidadeTextBox" Display="Dynamic" 
                                            ErrorMessage="* Cidade é campo obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:Image ID="Image1" runat="server" ImageUrl="../images/5px.gif" />
                                    </td>
                                    <td>
                                        UF:</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="cidadeTextBox" runat="server" CssClass="InputCad" Text="" 
                                            Width="267px" ToolTip="Informe a cidade."></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Image ID="Image2" runat="server" ImageUrl="../images/5px.gif" />
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DDUf" runat="server" CssClass="DropUF" 
                                            DataSourceID="SqlUF" DataTextField="uf" DataValueField="uf" ToolTip="Informe a Unidade Federativa (UF).">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                    </ContentTemplate>
                 </asp:UpdatePanel>                                        
                 
                                        </td>
                                        <td valign="top" align="left">
                                            <br />
                                            <asp:Label ID="TipodecadastroLabel" runat="server" Font-Bold="True" 
                                                Text="Tipo de cadastro:"></asp:Label>
                                            <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator21" runat="server"
                ControlToValidate="tipo" Display="Dynamic" ErrorMessage="* Tipo de cadastro é obrigatório." 
                SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                            <asp:RadioButtonList ID="tipo" runat="server" DataSourceID="SqlTipo" 
                                                DataTextField="cadastroTipo" DataValueField="cadastroTipo" Width="327px" 
                                                RepeatColumns="3" ToolTip="Em quais destes níveis você se enquadra?">
                                            </asp:RadioButtonList>
                                            <br />
                                            <asp:Label ID="EstadoCivilLabel" runat="server" Font-Bold="True" 
                                                Text="Estado Civil:"></asp:Label>
                                            <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator22" runat="server"
                ControlToValidate="estadocivil" Display="Dynamic" ErrorMessage="* Estado Civil é obrigatório." 
                SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                            <asp:RadioButtonList ID="estadocivil" runat="server" 
                                                DataSourceID="SqlEstadoCivil" DataTextField="estadocivil" 
                                                DataValueField="estadocivil" RepeatColumns="3" Width="323px" ToolTip="Informe seu estado civíl.">
                                            </asp:RadioButtonList>
                                                                    </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <br />
                                                                    </td>
                                        <td align="left">
                                            
                                            &nbsp;</td>
                                    </tr>
                                    <tr> 
                                        <td align="left" bgcolor="#F4F4F4">
                                            <asp:Label ID="TelefoneLabel" runat="server" Font-Bold="True" 
                                                Text="Telefone para contato:"></asp:Label>
                                            <br />
                                            <asp:Label ID="Label17" runat="server" CssClass="cur01" 
                                                Text="Se necessário o sistema irá incluir 9 para você."></asp:Label>
                                            <br />
                                            <table cellpadding="1" cellspacing="2">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="tipoLabel" runat="server" Text="Tipo:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="numeroLabel" runat="server" Text="Número:"></asp:Label>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" 
                                                    ControlToValidate="numeroTextBox" Display="Dynamic" ErrorMessage="* Número para contato é obrigatório." 
                                                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="DropDownListTIPO" runat="server" CssClass="DropCad" 
                                                            DataSourceID="SqlTipoTelefone" DataTextField="idTipoTelefone" 
                                                            DataValueField="idTipoTelefone" Width="100px" ToolTip="Informe o tipo de linha.">
                                                        </asp:DropDownList>
                                                        <br />
                                                        <asp:Label ID="Label20" runat="server" CssClass="cur01" Text="Residencial ..."></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="numeroTextBox" runat="server" 
                                                            onkeyup="formataTelefone(this,event);" style="text-align:left" CssClass="InputCad" 
                                                            MaxLength="14" Width="150px" ToolTip="Informe seu número."></asp:TextBox>
                                                        <br />
                                                        <asp:Label ID="Label19" runat="server" CssClass="cur01" 
                                                            Text="Formato: (99) 9999-9999"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                                                    </td>
                                        <td align="left" bgcolor="#F4F4F4">
                                            
                                            <asp:Label ID="indicacaoLabel" runat="server" Font-Bold="True" 
                                                Text="Indicação:"></asp:Label>
                                            <br />
                                            <asp:Label ID="Label18" runat="server" CssClass="cur01" 
                                                Text="Caso você tenha uma indicação pessoal informe agora."></asp:Label>
                                            <br />
                                            <table cellpadding="1" cellspacing="2">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="tipoLabel0" runat="server" Text="Nome:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="numeroLabel0" runat="server" Text="E-mail:"></asp:Label>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                                            ControlToValidate="EmailIndicacaoTextBox" 
                                                            ErrorMessage="* Informe o e-mail da indicação válido." 
                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="nomeIndicacaoTextBox" runat="server" CssClass="InputCad" 
                                                            Width="150px" ToolTip="Você recebeu uma indicação para alguma vaga aberta em nosso portal? Informe o nome da pessoa que te indicou."></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="EmailIndicacaoTextBox" runat="server" CssClass="InputCad" 
                                                            Width="160px" ToolTip="Informe o e-mail da pessoa que te indicou."></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            &nbsp;</td>
                                        <td align="left">
                                            
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="PaisLabel" runat="server" Font-Bold="True" Text="Pais:"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="pais" runat="server" CssClass="DropCad" Width="327px" 
                                                DataSourceID="SqlPais" DataTextField="pais" DataValueField="pais" ToolTip="Informe o pais de origem.">
                                            </asp:DropDownList>
                                                                    </td>
                                        <td align="left">
                                            
                                            <asp:Label ID="DataLabel" runat="server" Font-Bold="True" 
                                                Text="Data de nascimento:"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" 
                                                ControlToValidate="DIATextBox" 
                                                ErrorMessage="* Dia do nascimento é obrigatório.">*</asp:RequiredFieldValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" 
                                                ControlToValidate="MESTextBox" 
                                                ErrorMessage="* Mês do nascimento é obrigatório.">*</asp:RequiredFieldValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" 
                                                ControlToValidate="ANOTextBox" 
                                                ErrorMessage="* Ano do nascimento é obrigatório.">*</asp:RequiredFieldValidator>
                                            <br />
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label10" runat="server" Text="Dia:"></asp:Label>
                                                        <br />
                                                        <asp:TextBox ID="DIATextBox" runat="server" CssClass="InputCad" MaxLength="2" 
                                                            Width="30px" ToolTip="Dia."></asp:TextBox>
                                                        <cc1:MaskedEditExtender ID="MaskedEditExtenderDIA" 
                                                            runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                            InputDirection="RightToLeft" Mask="99" MaskType="Number" 
                                                            TargetControlID="DIATextBox">
                                                        </cc1:MaskedEditExtender>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label13" runat="server" Text="&lt;br&gt; "></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label11" runat="server" Text="Mês:"></asp:Label>
                                                        <br />
                                                        <asp:TextBox ID="MESTextBox" runat="server" CssClass="InputCad" MaxLength="2" 
                                                            Width="30px" ToolTip="Mês."></asp:TextBox>
                                                        <cc1:MaskedEditExtender ID="MaskedEditExtenderMES" 
                                                            runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                            InputDirection="RightToLeft" Mask="99" MaskType="Number" 
                                                            TargetControlID="MESTextBox">
                                                        </cc1:MaskedEditExtender>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label14" runat="server" Text="&lt;br&gt;"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label12" runat="server" Text="Ano:"></asp:Label>
                                                        <br />
                                                        <asp:TextBox ID="ANOTextBox" runat="server" CssClass="InputCad" MaxLength="4" 
                                                            Width="50px" ToolTip="Ano."></asp:TextBox>
                                                        <cc1:MaskedEditExtender ID="MaskedEditExtenderANO" 
                                                            runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                            InputDirection="RightToLeft" Mask="9999" MaskType="Number" 
                                                            TargetControlID="ANOTextBox">
                                                        </cc1:MaskedEditExtender>
                                                    </td>
                                                </tr>
                                            </table>
                                                                    </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" align="left">
                                            <br />
                                            <asp:Label ID="SexoLabel" runat="server" Font-Bold="True" Text="Sexo:"></asp:Label>
                                            <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator20" runat="server" ControlToValidate="sexo"
                Display="Dynamic" ErrorMessage="* Sexo é campo obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                            <asp:RadioButtonList ID="sexo" runat="server" RepeatDirection="Horizontal" ToolTip="Sexo.">
                                                <asp:ListItem Value="Masculino">Masculino</asp:ListItem>
                                                <asp:ListItem>Feminino</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <br />
                                        </td>
                                        <td align="left">
                                            <br />
                                            <asp:Label ID="DisponibilidadeLabel" runat="server" Font-Bold="True" 
                                                Text="Disponibilidade:"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator27" 
                                                runat="server" ControlToValidate="Disponibilidade" Display="Dynamic" 
                                                ErrorMessage="* Disponibilidade é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                            <asp:RadioButtonList ID="Disponibilidade" runat="server" 
                                                DataSourceID="SqlDisponibilidade" DataTextField="disponibilidade" 
                                                DataValueField="disponibilidade" RepeatColumns="3" Width="330px" ToolTip="Disponibilidade de horário de trabalho.">
                                            </asp:RadioButtonList>
                                                                    <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="style3">
                                            <asp:Label ID="dependentesLabel" runat="server" Font-Bold="True" 
                                                Text="Número de dependentes:"></asp:Label>
                    <br />
                                            <asp:DropDownList ID="DropDownListDependentes" runat="server" 
                                                        CssClass="DropCad" 
                                                        SelectedValue='<%# Bind("nrdependente") %>' Width="323px" ToolTip="Informe o número de pessoas que dependem diretamente de você.">
                                                <asp:ListItem Value="0">Não tenho dependentes.</asp:ListItem>
                                                <asp:ListItem Value="1">1 dependente.</asp:ListItem>
                                                <asp:ListItem Value="2">2 dependentes.</asp:ListItem>
                                                <asp:ListItem Value="3">3 dependentes.</asp:ListItem>
                                                <asp:ListItem Value="4">4 dependentes.</asp:ListItem>
                                                <asp:ListItem Value="5">5 dependentes.</asp:ListItem>
                                                <asp:ListItem Value="6">6 dependentes.</asp:ListItem>
                                                <asp:ListItem Value="7">Acima de 6 dependentes.</asp:ListItem>
                                            </asp:DropDownList>
                                            <br />
                                            <br />
                                        </td>
                                        <td align="left" class="style3">
                                            <asp:Label ID="SituacaoLabel" runat="server" Font-Bold="True" 
                                                Text="Atualmente você está trabalhando?"></asp:Label>
                                            <br />
                                            <asp:RadioButtonList ID="RadioButtonListSituacao" runat="server" 
                                                RepeatDirection="Horizontal" ToolTip="Atualmente você está trabalhando?">
                                                <asp:ListItem Value="1">Sim</asp:ListItem>
                                                <asp:ListItem Selected="True" Value="0">Não</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" bgcolor="#F4F4F4">
                                            <br />
                                            <asp:CheckBox ID="CheckBoxPrimeiroEmprego" runat="server" AutoPostBack="True" 
                                                Text="Meu primeiro emprego." ToolTip="Clique aqui se este for seu primeiro emprego." />
                                            <br />
                                            <asp:Panel ID="PanelRemuneraAtual" runat="server">
                                                <asp:Label ID="RemuneracaoAtualLabel" runat="server" Font-Bold="True" 
                                                Text="Remuneração atual:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" 
                                                    ControlToValidate="valorRemAtualTextBox" Display="Dynamic" 
                                                    ErrorMessage="* Remuneração é obrigatória." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="valorRemAtualTextBox" runat="server" CssClass="InputCad" 
                                                    Text="" Width="320px" ToolTip="Informe sua remuneração atual, se não tem clique em (Meu primeiro emprego)."></asp:TextBox>
                                                <cc1:MaskedEditExtender ID="valorRemAtualTextBox_MaskedEditExtender" 
                                                    runat="server" ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                                    CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" DisplayMoney="Left" 
                                                    Enabled="True" InputDirection="RightToLeft" Mask="99\.999\,99" 
                                                    MaskType="Number" TargetControlID="valorRemAtualTextBox">
                                                </cc1:MaskedEditExtender>
                                            </asp:Panel>
                                            <br />
                                        </td>
                                        <td align="left" bgcolor="#F4F4F4">
                                            <br />
                                            <asp:CheckBox ID="CheckBoxACOMBINAR" runat="server" AutoPostBack="True" 
                                                Text="A Combinar" ToolTip="CLique aqui se você desejar receber uma proposta de salário." />
                                            <br />
                                            <asp:Panel ID="PanelRemuneraPret" runat="server">
                                                <asp:Label ID="PretendidaLabel" 
    runat="server" Font-Bold="True" 
                                                
    Text="Remuneração pretendida:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                                    ControlToValidate="valorRemPretendidaTextBox" Display="Dynamic" 
                                                    ErrorMessage="* Remuneração pretendida é obrigatória." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="valorRemPretendidaTextBox" runat="server" CssClass="InputCad" 
                                                    Text="" Width="320px" ToolTip="Remuneração pretendida. (Salário)"></asp:TextBox>
                                                <cc1:MaskedEditExtender ID="valorRemPretendidaTextBox_MaskedEditExtender" 
                                                    runat="server" ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                                    CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" DisplayMoney="Left" 
                                                    Enabled="True" InputDirection="RightToLeft" Mask="99\.999\,99" 
                                                    MaskType="Number" TargetControlID="valorRemPretendidaTextBox">
                                                </cc1:MaskedEditExtender>
                                            </asp:Panel>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <br />
                                            <asp:Label ID="LocalLabel" runat="server" Font-Bold="True" 
                                                Text="Local de trabalho (Preferência):"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="localPreferencia" runat="server" CssClass="DropCad" 
                                                DataSourceID="SqlLocalPref" DataTextField="dsuf" DataValueField="dsuf" 
                                                Width="327px" ToolTip="Você tem alguma preferência de local de trabalho, informe aqui. Caso não informe o seu estado.">
                                            </asp:DropDownList>
                                            <br /></td>
                                        <td><br /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                            <br />
                                            <br />
                                            </td>
                                        <td><br /></td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                                                Text="Informe sua área de atuação:"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" 
                                                ErrorMessage="* Informe sua área de atuação." 
                                                ControlToValidate="DropDownListAreaAtuacaoC">*</asp:RequiredFieldValidator>
                                            <br />
                                            <asp:DropDownList ID="DropDownListAreaAtuacaoC" runat="server" 
                                                CssClass="DropCad" DataSourceID="SqlAtuacaoCandidado" 
                                                DataTextField="dsAreaAtuacaoCandidato" DataValueField="dsAreaAtuacaoCandidato" 
                                                Width="327px" ToolTip="Qual é a sua área de atuação?">
                                            </asp:DropDownList>
                                            </td>
                                        <td align="left">
                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" 
                                                Text="Informe cargo de seu interesse: (1ª opção)"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" 
                                                ErrorMessage="* Seu interesse deve ser informado." 
                                                ControlToValidate="interesseTextBox1">*</asp:RequiredFieldValidator>
                                            <br />
                                            <asp:TextBox ID="interesseTextBox1" runat="server" CssClass="InputCad" 
                                                Width="320px" ToolTip="(1) Defina a área ou cargo de seu interesse. (Nós utilizamos esta informação para localizar vagas para você!)"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td align="left">
                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" 
                                                Text="Informe cargo de seu interesse: (2ª opção)"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="interesseTextBox2" runat="server" CssClass="InputCad" 
                                                Width="320px" ToolTip="(2) Defina a área ou cargo de seu interesse. (Nós utilizamos esta informação para localizar vagas para você!)"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td align="left">
                                            <asp:Label ID="Label5" runat="server" Font-Bold="True" 
                                                Text="Informe cargo de seu interesse: (3ª opção)"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="interesseTextBox3" runat="server" CssClass="InputCad" 
                                                Width="320px" ToolTip="(3) Defina a área ou cargo de seu interesse. (Nós utilizamos esta informação para localizar vagas para você!)"></asp:TextBox>
                                        </td>
                                    </tr>
                                    </table>
                            </td>
                        </tr>
                    </table>
                                            <asp:Label ID="infoLabel" runat="server" 
                        Font-Bold="True" Text="Como ficou sabendo de nossa empresa?"></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidatorOrigem" runat="server" ControlToValidate="origem" 
                                                Display="Dynamic" 
                        ErrorMessage="* Informe como ficou sabendo do JobClick" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                            <br />
                                            <asp:RadioButtonList ID="origem" 
                                                runat="server" DataSourceID="SqlOrigem" DataTextField="origem" 
                                                DataValueField="origem" 
                        RepeatDirection="Horizontal" Width="100%" RepeatColumns="4" ToolTip="Como ficou sabendo de nosso portal?"></asp:RadioButtonList>
                    <br />
                    <asp:Label ID="ResumoLabel" runat="server" Font-Bold="True" 
                        Text="Resumo das qualificações profissionais:"></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator26" runat="server" ControlToValidate="resumoTextBox" 
                        Display="Dynamic" ErrorMessage="* Resumo é obrigatório.">*</asp:RequiredFieldValidator>
                    &nbsp;<asp:Label ID="Label16" runat="server" Text="(Máximo de 1200 caracteres)"></asp:Label>
                    <br />
                    <asp:TextBox ID="resumoTextBox" runat="server" Text='' CssClass="InputCad" 
                        Height="96px" TextMode="MultiLine" Width="687px" MaxLength="500" ToolTip="IMPORTANTE! Use este espaço para descrever resumidamente suas experiências profissionais, haverá outras oportunidades para descrever todas as suas experiências."></asp:TextBox>
                    <br />
                    Caracteres restantes:
                    <span id="contador">1200</span> (Máximo de 1200 caracteres)
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
        </table> 
            </td>
        </tr>
    </table> 
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Label8" runat="server" Text="PNE - Pessoas com necessidades especiais" 
                    CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>
    <table align="center" id="PNE" width="740">
        <tr>
            <td width="40">&nbsp;</td> 
            <td align="left" width="700" bgcolor="#FFFFF9">       
                    <br />
                    <asp:CheckBox ID="CheckBoxPNE" runat="server" 
                        Text="Necessito de cuidados especiais (Selecione o campo)" 
                        AutoPostBack="True" ToolTip="Clique aqui apenas se você precisa de atenção especial." />
                    <br />
                    <br />
                    <table runat="server" id="def" visible="false" cellpadding="0" cellspacing="0" width="700">
                        <tr>
                            <td>
                      <table width="100%" cellpadding="1" cellspacing="1">
                       <tr>
                            <td>Deficiência na audição:<br />
                                <asp:DropDownList ID="idDefAuditivaTextBox" runat="server" CssClass="DropCad" 
                                    Width="325px" DataSourceID="SqlDataDEFAuditivo" 
                                    DataTextField="dsDefAuditiva" DataValueField="idDefAuditiva">
                                </asp:DropDownList>
                                                                    </td>
                            <td>
                                <asp:Image ID="Image10" runat="server" ImageUrl="~/images/layout/29px.gif" />
                                                                    </td>
                            <td>Deficiência motora:<br />
                                <asp:DropDownList ID="idDefMotoraTextBox" runat="server" CssClass="DropCad" 
                                    Width="325px" DataSourceID="SqlDataDEFMotora" DataTextField="dsDefMotora" 
                                    DataValueField="idDefMotora">
                                </asp:DropDownList>
                            </td>
                       </tr> 
                       <tr>
                            <td>Deficiência na fala:<br />
                                <asp:DropDownList ID="idDefFalaTextBox" runat="server" CssClass="DropCad" 
                                    Width="325px" DataSourceID="SqlDataDEFFala" DataTextField="dsDefFala" 
                                    DataValueField="idDefFala">
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                            <td>Deficiência visual:<br />
                                <asp:DropDownList ID="idDefVisualTextBox" runat="server" CssClass="DropCad" 
                                    Width="325px" DataSourceID="SqlDataDEFVisual" DataTextField="dsDefVisual" 
                                    DataValueField="idDefVisual">
                                </asp:DropDownList>
                            </td>
                       </tr> 
                       <tr>
                            <td>Deficiência mental:<br />
                                <asp:DropDownList ID="idDefMentalTextBox" runat="server" CssClass="DropCad" 
                                    Width="325px" DataSourceID="SqlDataDEFMental" DataTextField="dsDefMental" 
                                    DataValueField="idDefMental">
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                       </tr> 
                    </table>
                                <table id="COMENTARIOS" cellpadding="1" cellspacing="1" width="100%">
                                    <tr>
                                        <td>
                                            <br />
                                            <asp:Label ID="Label9" runat="server" 
                                                Text="Comentários, observações ou informações referente as necessidades:"></asp:Label>
                                            <asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator25" runat="server" ControlToValidate="ObsTextBox" 
                                    Display="Dynamic" ErrorMessage="* Seus comentários são importantes." 
                                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                            <br />
                    <asp:TextBox ID="ObsTextBox" runat="server" Text='' CssClass="InputCad" 
                        Height="96px" TextMode="MultiLine" Width="687px" MaxLength="255"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <asp:Label ID="idUserRESLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="UserNameLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="pwdLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="emailLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="fraseLabel" runat="server" Visible="False"></asp:Label>
                    <br />          
                                              
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
                        AssociatedUpdatePanelID="UpdatePanelCEP" DisplayAfter="1">
                        <ProgressTemplate>
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center">
                                    <asp:Image ID="Image12" runat="server" 
                                        ImageUrl="~/images/layout/zwf4lc.jpg.gif" />
                                    <br />
                                    <asp:Label ID="lblPesquisando" runat="server" Text="Pesquisando..."></asp:Label>
                                </td>
                            </tr>
                        </table>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                                              
                    <cc1:AlwaysVisibleControlExtender ID="UpdateProgress1_AlwaysVisibleControlExtender" 
                        runat="server" Enabled="True" HorizontalSide="Center" 
                        TargetControlID="UpdateProgress1" VerticalSide="Middle" 
                        HorizontalOffset="50" VerticalOffset="50">
                    </cc1:AlwaysVisibleControlExtender>
                    
                </td>
            </tr>
        </table> 

    
                  
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Cabec1" runat="server" Text="Termos e Condições Gerais" 
                    CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>
        <table runat="server" id="TERMOS" width="740" cellpadding="0" 
        cellspacing="0" align="center">
        <tr>
            <td width="40"></td> 
            <td width="700">
                <asp:TextBox ID="TextBoxCondicoes" runat="server" CssClass="InputCad" 
                    Height="100px" TextMode="MultiLine" Width="687px" ToolTip="Leia atentamente este contrato, ao se cadastrar em nosso portal, entenderemos que você aceita todas os termos e condições deste contrato."></asp:TextBox>
                <br />
                <br />
                    <asp:CheckBox ID="apresentarCheckBox" runat="server" 
                        Text="&lt;b&gt;Não&lt;/b&gt; disponibilizar meu currículo após o término deste cadastro." 
                        CssClass="textoGeral" ToolTip="Clique aqui se você (não) quer publicar imediatamente para todos os consultores e analistas os seus dados profissionais cadastrados até este momento." />
                </td>
        </tr>
    </table>              
    <br />
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Label7" runat="server" Text="Informações para seu acesso" 
                    CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>
                      
        <table runat="server" id="CadastroContaAcesso" width="740" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td width="40"></td> 
            <td width="700"> 
    
    
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left">
    
    
                <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td align="left">
                                    <asp:Label ID="EmailUserLabel" runat="server" Font-Bold="True" Text="E-mail:"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                        ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="* E-mail é obrigatório." 
                                        SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                        ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="* E-mail deve ser válido." 
                                        SetFocusOnError="True" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                </td>
                                <td width="30px">
                                    &nbsp;</td>
                                <td align="left">
                                    <asp:Label ID="SenhaLabel" runat="server" Font-Bold="True" Text="Senha:"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                        ControlToValidate="passwordTextBox" Display="Dynamic" ErrorMessage="* Senha é obrigatório." 
                                        SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="emailTextBox" runat="server" CssClass="InputCad" 
                                        Text='<%# Bind("email") %>' Width="320px" ToolTip="Informe seu e-mail, ele será utilizado por você para acessar sua conta."></asp:TextBox>
                                </td>
                                <td width="30px">
                                    &nbsp;</td>
                                <td>
                                    <asp:TextBox ID="passwordTextBox" runat="server" CssClass="InputCad" 
                                        Text='<%# Bind("password") %>' Width="320px" TextMode="Password" 
                                        MaxLength="16" ToolTip="Informe sua senha, ela será utilizada por você para acessar sua conta. (Não divulge para ninguém)"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="EmailUserLabelC" runat="server" Font-Bold="True" 
                                        Text="Confirme o seu e-mail:"></asp:Label>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                        ControlToCompare="emailTextBox0" ControlToValidate="emailTextBox" 
                                        ErrorMessage="* E-mails não estão iguais. ">*</asp:CompareValidator>
                                </td>
                                <td width="30px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="emailTextBox0" runat="server" CssClass="InputCad" 
                                        Text='<%# Bind("email") %>' Width="320px" ToolTip="Confirme seu e-mail."></asp:TextBox>
                                </td>
                                <td width="30px">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                                    <br />
                                    <asp:Label ID="LembreteLabel" runat="server" Font-Bold="True" 
                                        Text="Use uma palavra para lembrete de sua senha:"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" 
                                        runat="server" ControlToValidate="fraseTextBox" Display="Dynamic" 
                                        ErrorMessage="* Lembrete é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="fraseTextBox" runat="server" CssClass="InputCad" 
                                        Text='<%# Bind("frase") %>' Width="680px" ToolTip="Escreva uma frase, ela será utilizada por nossos atendentes para liberar sua senha caso tenha se esquecido."></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                <br />
                <table runat="server" id="sendCadastro" visible="True" cellpadding="0" cellspacing="0" 
                        style="width: 692px">
            <tr>
                <td style="width: 400px" align="center">
                    &nbsp;</td>
                <td>
                            <asp:Label ID="Label1" runat="server" 
                                
                                
                                
                                
                                
                        
                                
                                Text="Ao clicar em '[&lt;b&gt;Cadastrar Dados Básicos&lt;/b&gt;]', você declara ter lido e aceito as normas e condições de uso do sistema." 
                                CssClass="textoGeral"></asp:Label>
                                <br />
                                <br />
                    <asp:LinkButton ID="Cadastro" runat="server" class="button" 
                                ToolTip="Preencha o formulário e clique aqui para cadastrar seus dados básicos">Cadastrar Dados Básicos</asp:LinkButton>
                </td>
            </tr>
        </table>                                                
                                              
                    <br />
                    <br />
    
            </td>
        </tr>
        </table> 
        <table align="center" width="100%">
            <tr>
                <td>                                                
                                              
                    <asp:SqlDataSource ID="SqlPais" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [pais] FROM [tbpais]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlUF" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [uf], [dsuf] FROM [tbuf]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlTipo" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        
                        SelectCommand="SELECT cadastroTipo, publicar FROM tbCadastroTipo WHERE (publicar = 1)">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlEstadoCivil" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [estadocivil] FROM [tbestadocivil]">
                    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlLocalPref" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [uf], [dsuf] FROM [tbuf]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDisponibilidade" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [disponibilidade] FROM [tbDisponibilidade]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlOrigem" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        
                        SelectCommand="SELECT [origem] FROM [tbOrigem] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
                        <SelectParameters>
                            <asp:SessionParameter Name="idCadastroEmpresa" 
                                SessionField="idCadastroEmpresa_layout" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataDEFAuditivo" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                                SelectCommand="SELECT [idDefAuditiva], [dsDefAuditiva] FROM [tbDefAuditiva]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataDEFFala" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                                SelectCommand="SELECT [idDefFala], [dsDefFala] FROM [tbDefFala]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataDEFMental" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                                SelectCommand="SELECT [idDefMental], [dsDefMental] FROM [tbDefMental]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataDEFVisual" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                                SelectCommand="SELECT [idDefVisual], [dsDefVisual] FROM [tbDefVisual]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataDEFMotora" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
                                SelectCommand="SELECT [dsDefMotora], [idDefMotora] FROM [tbDefMotora]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlAtuacaoCandidado" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        
                        SelectCommand="SELECT [idAreaAtuacaoCandidato], [dsAreaAtuacaoCandidato] FROM [tbAreaAtuacaoCandidato] ORDER BY [dsAreaAtuacaoCandidato]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlTipoTelefone" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [idTipoTelefone] FROM [tbTipoTelefone]">
                    </asp:SqlDataSource>
                    </td>
            </tr>
        </table>
  
                    </asp:Content>





