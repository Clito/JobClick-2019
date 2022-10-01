<%@ Page Language="VB" MasterPageFile="~/MasterPageJobClick.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="cadastroCandidato.aspx.vb" Inherits="_anonimo_cadastroCandidato" title="Cadastrar Currículo" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Cabec" runat="server" Text="Cadastro de Currículo Gratuito" CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>
            <table id="TableAvisoCadastro" align="center" cellpadding="0" cellspacing="0" width="740px">
                <tr>
                    <td align="left">
                        <asp:Panel ID="PanelAviso" runat="server" Visible="False" Width="740px">
                        <table id="AVISO0" align="center" cellpadding="5" cellspacing="5" width="100%" bgcolor="#EEEEEE">
                            <tr>
                                <td align="left">
                                    <asp:Label ID="AVISOLABEL0" runat="server" CssClass="msnOK"></asp:Label>
                                </td>
                                <td align="right" valign="top" width="100px">
                                    <asp:LinkButton ID="LinkButtonFechar0" runat="server">Fechar</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            <br />
    <table align="center" id="Aviso" width="740">
        <tr>
            <td width="40">&nbsp;</td> 
            <td align="left" width="700"><asp:Label ID="LabelAviso" runat="server" 
                    
                    Text="&lt;b&gt;Aviso importante!&lt;/b&gt;&lt;br&gt;A importância do &lt;b&gt;Cadastro correto&lt;/b&gt;, todos os processos seletivos das empresas são realizados pelo nosso sistema informatizado de vagas.&lt;br&gt;&lt;br&gt;Sendo assim, é imprescindível que você mantenha o seu cadastro sempre atualizado e completo, pois dele depende sua participação nos processos seletivos abertos. Através deste site você poderá acompanhar às vagas abertas e se candidatar para aquelas que estão dentro do seu perfil profissional.&lt;br&gt;É importante salientar que nossos serviços para os candidatos são totalmente gratuitos."></asp:Label>
                <br />
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
        <table runat="server" id="CadastroContaAcesso" width="740" cellpadding="0" cellspacing="0">
        <tr>
            <td width="40"></td> 
            <td width="700"> 
    <asp:Panel ID="Panel1" runat="server" CssClass="Contrato" Visible="False" 
        Width="630px">
        <asp:LinkButton ID="FecharPanel" runat="server" CausesValidation="False">Fechar</asp:LinkButton>

        <br />
        <asp:Label ID="lblContrato" runat="server"></asp:Label>

        <br />
        <br />
        <asp:LinkButton ID="LbFechar1" runat="server" CausesValidation="False">Fechar</asp:LinkButton>

    </asp:Panel>
    <cc1:DragPanelExtender ID="Panel1_DragPanelExtender" runat="server" 
        DragHandleID="Panel1" Enabled="False" TargetControlID="Panel1">
    </cc1:DragPanelExtender>
    
    
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
                                        Text='<%# Bind("email") %>' Width="320px"></asp:TextBox>
                                </td>
                                <td width="30px">
                                    &nbsp;</td>
                                <td>
                                    <asp:TextBox ID="passwordTextBox" runat="server" CssClass="InputCad" 
                                        Text='<%# Bind("password") %>' Width="320px" TextMode="Password" 
                                        MaxLength="16"></asp:TextBox>
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
                                        Text='<%# Bind("email") %>' Width="320px"></asp:TextBox>
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
                                        Text='<%# Bind("frase") %>' Width="680px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    <br />
                <asp:Label ID="lblText" runat="server" CssClass="msn"></asp:Label>
    
            </td>
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
    
                  
                <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Cabec0" runat="server" Text="Informe seus Dados Pessoais" 
                    CssClass="TituloBGText"></asp:Label></td>
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
                CssClass="InputCad" Width="320px"></asp:TextBox>
                                                                    </td>
                                        <td align="left">  
                        
                                            <asp:UpdatePanel ID="UpdatePanelCPF" runat="server">
                                            <ContentTemplate>
                                                <asp:Label ID="CPFLabel" runat="server" Font-Bold="True" Text="CPF:"></asp:Label>
                                                <asp:Label ID="lblmsn"
                    runat="server" CssClass="msn"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="TextBoxCPF"
                Display="Dynamic" ErrorMessage="* CPF é obrigatório.">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator10" 
                                                runat="server" ControlToValidate="TextBoxCPF" Display="Dynamic" 
                                                ErrorMessage="* Utilizar o formato [999.999.999-99]" 
                                                    ValidationExpression="^\d{3}\.\d{3}\.\d{3}\-\d{2}$">*</asp:RegularExpressionValidator>
                    <asp:TextBox ID="TextBoxCPF" runat="server" CssClass="InputCad" OnTextChanged="PesquisaCPF"
                Text='' AutoPostBack="True" Width="320px"></asp:TextBox>
                
                    <cc1:MaskedEditExtender id="MaskedEditExtender1" runat="server" ClearMaskOnLostFocus="false"
                ErrorTooltipEnabled="true" Mask="999\.999\.999\-99" MaskType="Number" MessageValidatorTip="true"
                TargetControlID="TextBoxCPF" InputDirection="RightToLeft">
                    </cc1:MaskedEditExtender>                                                                                            
                                            </ContentTemplate>
                                            </asp:UpdatePanel>
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
                                    <asp:TextBox ID="cepTextBox" runat="server" CssClass="InputCad" Text='' ValidationGroup="psqCEP" Width="320px"></asp:TextBox>
                                       <cc1:MaskedEditExtender ID="cepTextBox_MaskedEditExtender" runat="server" 
                                           ClearMaskOnLostFocus="False" CultureAMPMPlaceholder="" 
                                           CultureCurrencySymbolPlaceholder="" CultureDateFormat="" 
                                           CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                           CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                           InputDirection="RightToLeft" Mask="99999\-999" MaskType="Number" 
                                           TargetControlID="cepTextBox">
                                       </cc1:MaskedEditExtender>
                                    </td>
                                    <td><br /><asp:ImageButton ID="PesquisaCEP" runat="server" ImageUrl="~/images/layout/pesquisa.gif" OnClick="PesquisaCEP_Click" ValidationGroup="psqCEP"  />
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
                                            Width="276px"></asp:TextBox>
                                        &nbsp;</td>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Nº"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" 
                                            ControlToValidate="NrTextBox" ErrorMessage="* Endereço número é obrigatório">*</asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="NrTextBox" runat="server" CssClass="InputCad" Width="30px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:Label ID="BairroLabel" runat="server" Font-Bold="True" Text="Bairro:"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="bairroTextBox" Display="Dynamic" ErrorMessage="* Bairro é obrigatório." 
                                SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="bairroTextBox" runat="server" CssClass="InputCad" Text="" 
                                Width="320px"></asp:TextBox>
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
                                            Width="267px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Image ID="Image2" runat="server" ImageUrl="../images/5px.gif" />
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DDUf" runat="server" CssClass="DropUF" 
                                            DataSourceID="SqlUF" DataTextField="uf" DataValueField="uf">
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
                                                RepeatColumns="3">
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
                                                DataValueField="estadocivil" RepeatColumns="3" Width="323px">
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
                                        <td align="left">
                                            <asp:Label ID="PaisLabel" runat="server" Font-Bold="True" Text="Pais:"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="pais" runat="server" CssClass="DropCad" Width="327px" 
                                                DataSourceID="SqlPais" DataTextField="pais" DataValueField="pais">
                                            </asp:DropDownList>
                                                                    </td>
                                        <td align="left">
                                            
                                            <asp:Label ID="DataLabel" runat="server" Font-Bold="True" 
                                                Text="Data de nascimento:"></asp:Label>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="nascimentoTextBox"
                Display="Dynamic" ErrorMessage="* Data no formato d/m/yyyy" SetFocusOnError="True"
                ValidationExpression="\d{1,2}/\d{1,2}/\d{4}">*</asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator6" runat="server"
                ControlToValidate="nascimentoTextBox" Display="Dynamic" ErrorMessage="* Data de nascimento é obrigatório." 
                SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                            <br />
                    <asp:TextBox ID="nascimentoTextBox" runat="server" 
                Text='' CssClass="InputCad" Width="320px"></asp:TextBox>
                    <cc1:CalendarExtender id="CalendarExtender1" runat="server" Format="dd/M/yyyy" 
                TargetControlID="nascimentoTextBox" DefaultView="Years">
                    </cc1:CalendarExtender>
                                                                    </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" align="left">
                                            <asp:Label ID="SexoLabel" runat="server" Font-Bold="True" Text="Sexo:"></asp:Label>
                                            <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator20" runat="server" ControlToValidate="sexo"
                Display="Dynamic" ErrorMessage="* Sexo é campo obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                            <asp:RadioButtonList ID="sexo" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="Masculino">Masculino</asp:ListItem>
                                                <asp:ListItem>Feminino</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <br />
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="DisponibilidadeLabel" runat="server" Font-Bold="True" 
                                                Text="Disponibilidade:"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator27" 
                                                runat="server" ControlToValidate="Disponibilidade" Display="Dynamic" 
                                                ErrorMessage="* Disponibilidade é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                            <asp:RadioButtonList ID="Disponibilidade" runat="server" 
                                                DataSourceID="SqlDisponibilidade" DataTextField="disponibilidade" 
                                                DataValueField="disponibilidade" RepeatColumns="3" Width="330px">
                                            </asp:RadioButtonList>
                                                                    <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="dependentesLabel" runat="server" Font-Bold="True" 
                                                Text="Número de dependentes:"></asp:Label>
                                            &nbsp;(Valor numérico)<asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" 
                                                ControlToValidate="nrdependenteTextBox" Display="Dynamic" ErrorMessage="*" 
                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="nrdependenteTextBox" runat="server" CssClass="InputCad" 
                Text='0' Width="320px"></asp:TextBox>
                                            <cc1:MaskedEditExtender ID="nrdependenteTextBox_MaskedEditExtender" 
                                                runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                InputDirection="RightToLeft" Mask="99" MaskType="Number" 
                                                TargetControlID="nrdependenteTextBox">
                                            </cc1:MaskedEditExtender>
                                            <br />
                                            <br />
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="SituacaoLabel" runat="server" Font-Bold="True" 
                                                Text="Sua situação atual:"></asp:Label>
                                            <br />
                                            <asp:CheckBox ID="situacao" runat="server" Text="Atualmente estou trabalhando. " />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" bgcolor="#F4F4F4">
                                            <br />
                                            <asp:CheckBox ID="CheckBoxPrimeiroEmprego" runat="server" AutoPostBack="True" 
                                                Text="Meu primeiro emprego." />
                                            <br />
                                            <asp:Panel ID="PanelRemuneraAtual" runat="server">
                                                <asp:Label ID="RemuneracaoAtualLabel" runat="server" Font-Bold="True" 
                                                Text="Remuneração atual:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" 
                                                    ControlToValidate="valorRemAtualTextBox" Display="Dynamic" 
                                                    ErrorMessage="* Remuneração é obrigatória." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="valorRemAtualTextBox" runat="server" CssClass="InputCad" 
                                                    Text="" Width="320px"></asp:TextBox>
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
                                                Text="A Combinar" />
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
                                                    Text="" Width="320px"></asp:TextBox>
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
                                                Width="327px">
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
                                                Width="327px">
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
                                                Width="320px"></asp:TextBox>
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
                                                Width="320px"></asp:TextBox>
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
                                                Width="320px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    </table>
                            </td>
                        </tr>
                    </table>
                                            <asp:Label ID="infoLabel" runat="server" 
                        Font-Bold="True" Text="Como ficou sabendo do JobClick?"></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidatorOrigem" runat="server" ControlToValidate="origem" 
                                                Display="Dynamic" 
                        ErrorMessage="* Informe como ficou sabendo do JobClick" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                            <br />
                                            <asp:RadioButtonList ID="origem" 
                                                runat="server" DataSourceID="SqlOrigem" DataTextField="origem" 
                                                DataValueField="origem" 
                        RepeatDirection="Horizontal" Width="100%"></asp:RadioButtonList>
                    <br />
                    <asp:Label ID="ResumoLabel" runat="server" Font-Bold="True" 
                        Text="Resumo das qualificações: (Apenas um resumo)"></asp:Label>
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator26" runat="server" ControlToValidate="resumoTextBox" 
                        Display="Dynamic" ErrorMessage="* Resumo é obrigatório.">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="resumoTextBox" runat="server" Text='' CssClass="InputCad" Height="96px" TextMode="MultiLine" Width="687px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:CheckBox ID="apresentarCheckBox" runat="server" 
                        Text="Apresentar meus dados imediatamente após a criação." 
                        CssClass="textoGeral" />
                    <br />
                    <br />
                    <asp:Image ID="Image9" runat="server" ImageUrl="~/images/necessidades.gif" />
                    <br />
                    <asp:RadioButtonList ID="portadorDef" runat="server" AutoPostBack="True">
                        <asp:ListItem Value="1">Necessito de cuidados especiais. Clique aqui e preencha 
                        o formulário.</asp:ListItem>
                        <asp:ListItem Selected="True" Value="0">Não necessito de cuidados especiais.</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                    <br />
                    <table runat="server" id="def" visible="false" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td>
                      <table width="100%" cellpadding="1" cellspacing="1">
                       <tr>
                            <td>Deficiência na audição:ição:<br />
                                <asp:DropDownList ID="idDefAuditivaTextBox" runat="server" CssClass="DropCad" 
                                    Width="327px" DataSourceID="SqlDataDEFAuditivo" 
                                    DataTextField="dsDefAuditiva" DataValueField="idDefAuditiva">
                                </asp:DropDownList>
                                                                    </td>
                            <td>
                                <asp:Image ID="Image10" runat="server" ImageUrl="~/images/layout/29px.gif" />
                                                                    </td>
                            <td>Deficiência motora:<br />
                                <asp:DropDownList ID="idDefMotoraTextBox" runat="server" CssClass="DropCad" 
                                    Width="327px" DataSourceID="SqlDataDEFMotora" DataTextField="dsDefMotora" 
                                    DataValueField="idDefMotora">
                                </asp:DropDownList>
                            </td>
                       </tr> 
                       <tr>
                            <td>Deficiência na fala:<br />
                                <asp:DropDownList ID="idDefFalaTextBox" runat="server" CssClass="DropCad" 
                                    Width="327px" DataSourceID="SqlDataDEFFala" DataTextField="dsDefFala" 
                                    DataValueField="idDefFala">
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                            <td>Deficiência visual:<br />
                                <asp:DropDownList ID="idDefVisualTextBox" runat="server" CssClass="DropCad" 
                                    Width="327px" DataSourceID="SqlDataDEFVisual" DataTextField="dsDefVisual" 
                                    DataValueField="idDefVisual">
                                </asp:DropDownList>
                            </td>
                       </tr> 
                       <tr>
                            <td>Deficiência mental:<br />
                                <asp:DropDownList ID="idDefMentalTextBox" runat="server" CssClass="DropCad" 
                                    Width="327px" DataSourceID="SqlDataDEFMental" DataTextField="dsDefMental" 
                                    DataValueField="idDefMental">
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                       </tr> 
                    </table>
                                <br />
                    Comentários, observações ou informações referente as necessidades:<asp:RequiredFieldValidator 
                                    ID="RequiredFieldValidator25" runat="server" ControlToValidate="ObsTextBox" 
                                    Display="Dynamic" ErrorMessage="* Seus comentários são importantes." 
                                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="ObsTextBox" runat="server" Text='' CssClass="InputCad" 
                        Height="96px" TextMode="MultiLine" Width="687px" MaxLength="255"></asp:TextBox>
                                <br />                            
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
                    
                    <asp:UpdateProgress ID="UpdateProgress2" runat="server" 
                        AssociatedUpdatePanelID="UpdatePanelCPF" DisplayAfter="1">
                        <ProgressTemplate>
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center">
                                    <asp:Image ID="ImageCPF" runat="server" 
                                        ImageUrl="~/images/layout/zwf4lc.jpg.gif" />
                                    <br />
                                    <asp:Label ID="lblPesquisandoCPF" runat="server" Text="Pesquisando..."></asp:Label>
                                </td>
                            </tr>
                        </table>
                            <br />
                        </ProgressTemplate>
                    
                    </asp:UpdateProgress>            

                    <cc1:AlwaysVisibleControlExtender ID="UpdateProgress2_AlwaysVisibleControlExtender" 
                        runat="server" Enabled="True" HorizontalOffset="50" HorizontalSide="Center" 
                        TargetControlID="UpdateProgress2" VerticalOffset="50" VerticalSide="Middle">
                    </cc1:AlwaysVisibleControlExtender>
                    <br />                                          
                                              
                            <asp:Panel ID="AvisoPanel" runat="server" BackColor="#FFFFDF" 
                        Visible="False" CssClass="DGVAGAloginPosition">
                                <table align="right" cellpadding="3" cellspacing="3" class="style2">
                                    <tr>
                                        <td align="right">
                                            <asp:LinkButton ID="LinkButtonFechar" runat="server" CausesValidation="False">[X] Fechar</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table ID="Aviso" align="center" cellpadding="5" cellspacing="5">
                                    <tr>
                                        <td>
                                            <asp:Image ID="ImageAviso" runat="server" ImageUrl="~/images/aviso.png" />
                                        </td>
                                        <td>
                                            <asp:Label ID="AvisoLabel" runat="server" CssClass="msn"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>                                                
                                              
                    &nbsp;<table runat="server" id="sendCadastro" visible="True" cellpadding="0" cellspacing="0" 
                        style="width: 692px">
            <tr>
                <td style="width: 400px" align="center">
                <asp:LinkButton ID="LBNormas" runat="server" CausesValidation="False" 
                        CssClass="textoGeral">Ler normas e  condições de uso</asp:LinkButton>
                        </td>
                <td>
                            <asp:Label ID="Label1" runat="server" 
                                
                                
                                
                                
                                
                        
                                
                                Text="Ao clicar em '[&lt;b&gt;Cadastrar Dados Pessoais&lt;/b&gt;]', você declara ter lido e aceito as normas e condições de uso do JobClick." 
                                CssClass="textoGeral"></asp:Label>
                                <br />
                                <br />
                    <asp:LinkButton ID="Cadastro" runat="server" class="button">Cadastrar Dados Pessoais</asp:LinkButton>
                </td>
            </tr>
        </table>                                                
                                              
                    <asp:SqlDataSource ID="SqlPais" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [pais] FROM [tbpais]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlUF" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [uf], [dsuf] FROM [tbuf]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlTipo" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [cadastroTipo] FROM [tbCadastroTipo]">
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
                        SelectCommand="SELECT [origem] FROM [tbOrigem]"></asp:SqlDataSource>
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
                    <br />
                    <br />
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
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
    </style>
</asp:Content>


