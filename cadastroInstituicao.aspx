<%@ Page Language="VB" MasterPageFile="~/DefaultPage.master" AutoEventWireup="false" CodeFile="cadastroInstituicao.aspx.vb" Inherits="_anonimo_cadastroInstituicao" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:ScriptManager id="ScriptManager1" runat="server" EnableScriptGlobalization="True">
    </asp:ScriptManager>
<asp:Image ID="cabec" runat="server" ImageUrl="~/images/titulocadastroEdu.gif" /> 
        <table width="740" cellpadding="0" cellspacing="0">
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
            </td>
        </tr>
        </table> 
            
    <table width="376" cellpadding="0" cellspacing="0">
        <tr>
            <td width="40">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" 
                    Height="39px" Width="40px" /></td>
            <td width="630" style="text-align: left">
                <br />
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                Usuário (Master):<asp:RequiredFieldValidator ID="RequiredFieldValidator7" 
                    runat="server" ControlToValidate="userNameTextBox" Display="Dynamic" 
                    ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                Senha:<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="passwordTextBox" Display="Dynamic" ErrorMessage="*" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                E-mail:<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="*" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="*" 
                    SetFocusOnError="True" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                <asp:TextBox ID="userNameTextBox" runat="server" CssClass="InputCad" 
                    Width="210px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Image ID="Image6" runat="server" ImageUrl="~/images/15px.gif" />
                                                            </td>
                                                            <td>
                <asp:TextBox ID="passwordTextBox" runat="server" CssClass="InputCad" 
                    Width="210px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Image ID="Image8" runat="server" ImageUrl="~/images/15px.gif" />
                                                            </td>
                                                            <td>
                <asp:TextBox ID="emailTextBox" runat="server" CssClass="InputCad" Width="210px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                Lembrete:<asp:RequiredFieldValidator ID="RequiredFieldValidator10" 
                    runat="server" ControlToValidate="fraseTextBox" Display="Dynamic" 
                    ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                <asp:TextBox ID="fraseTextBox" runat="server" CssClass="InputCad" Width="673px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                <br />
                <asp:Image ID="Image5" runat="server" 
                    ImageUrl="~/images/dadosdaIEtitulo.gif" />
                    <br />
  
                <asp:UpdatePanel ID="UpdatePanelCNPJ" runat="server" EnableViewState="False">
                    <ContentTemplate>
                                                  <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="LabelCabec1" runat="server" 
                                                                    Text="Nome da Instituição de Ensino (Razão Social):"></asp:Label>
                                                                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="nmempresaTextBox" Display="Dynamic" ErrorMessage="*" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                                                                <asp:Label ID="LabelCabec2" runat="server" Text="Nome do responsável:"></asp:Label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                                                    ControlToValidate="nomeResTextBox" Display="Dynamic" ErrorMessage="*" 
                                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                <asp:TextBox ID="nmempresaTextBox" runat="server" CssClass="InputCad" 
                    Width="327px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Image ID="Image9" runat="server" ImageUrl="~/images/15px.gif" />
                                                            </td>
                                                            <td>
                <asp:TextBox ID="nomeResTextBox" runat="server" CssClass="InputCad" 
                    Width="327px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="LabelCabec3" runat="server" Text="CNPJ:"></asp:Label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                runat="server" ControlToValidate="TextBoxCNPJ" Display="Dynamic" ErrorMessage="*"
                SetFocusOnError="True"></asp:RequiredFieldValidator>

                <cc1:MaskedEditValidator ID="MaskedEditValidator1"                         
                         runat="server"
                         ControlToValidate="TextBoxCNPJ"                         
                         ControlExtender="MaskedEditExtender1"
                         IsValidEmpty=false
                         Display="Dynamic" 
                         InvalidValueMessage="Formato não é válido!"
                         ToolTipMessage="Preencha o campo no formato [00.000.000/0000-00]" 
                         EmptyValueMessage="Preencha o campo no formato [00.000.000/0000-00]" 
                         ErrorMessage="*" 
                         SetFocusOnError="True" 
                         ValidationExpression="^\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$" /> 
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                                                                <asp:Label ID="LabelCabec4" runat="server" Text="Cadastro especial para área :"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                <asp:TextBox ID="TextBoxCNPJ" runat="server" CssClass="InputCad" Width="327px" ValidationGroup="CNPJ" 
                    AutoPostBack="True"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Image ID="Image10" runat="server" ImageUrl="~/images/15px.gif" />
                                                            </td>
                                                            <td>
                <asp:DropDownList ID="idAreaAtuacaoDropDownList" runat="server" CssClass="DropCad" 
                    DataSourceID="SqlAtividade" DataTextField="dsAreaAtuacao" 
                    DataValueField="idAreaAtuacao" Width="334px" Enabled="False">
                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                    </table>
                <cc1:MaskedEditExtender id="MaskedEditExtender1" 
                        runat="server"
                        TargetControlID="TextBoxCNPJ" 
                        Mask="99\.999\.999\/9999-99" 
                        MaskType="None"
                        MessageValidatorTip=true 
                        ErrorTooltipEnabled=true 
                        ClearMaskOnLostFocus=false />
                <asp:Label ID="lblmsn" runat="server" CssClass="msn"></asp:Label>
                                                  <asp:Label ID="lblmsnOK" runat="server" CssClass="msnOK"></asp:Label>
                <br />
                <br />                        
                    </ContentTemplate>
                </asp:UpdatePanel>
                                                    <asp:UpdatePanel ID="UpdatePanelCEP" 
                    runat="server" EnableViewState="False">
                                                        <ContentTemplate>
                                                            <table cellpadding="0" 
    cellspacing="0" style="width: 100%">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="LabelCabec6" runat="server" Text="CEP:"></asp:Label>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="cepTextBox"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                    ControlToValidate="cepTextBox" Display="Dynamic" ErrorMessage="*" 
                    SetFocusOnError="True" ValidationGroup="CEP"></asp:RequiredFieldValidator>
                                                                        <asp:RegularExpressionValidator
                    ID="RegularExpressionValidator1" runat="server" ControlToValidate="cepTextBox"
                    ErrorMessage="* CEP 99999-999" ValidationExpression="\d{5}(-\d{3})?" 
                ValidationGroup="CEP"></asp:RegularExpressionValidator>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                    <td>
                                                                        <asp:Label ID="LabelCabec5" runat="server" 
                                                                            Text="Porte da Instituição de Ensino:"></asp:Label>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" 
                    runat="server" ControlToValidate="idPorteRadioButtonList" Display="Dynamic" 
                    ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="top">
                                                                        <table cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:TextBox ID="cepTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("cep") %>'
                            Width="307px" ValidationGroup="CEP"></asp:TextBox>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:ImageButton ID="PesquisaCEP" runat="server" 
                            ImageUrl="~/images/layout/pesquisa.gif" OnClick="PesquisaCEP_Click1" 
                            ValidationGroup="CEP" />
                                                                                    &nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:Label ID="LabelCabec7" runat="server" Text="Endereço:"></asp:Label>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ControlToValidate="enderecoTextBox" Display="Dynamic" ErrorMessage="*" 
                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        <br />
                                                                        <asp:TextBox ID="enderecoTextBox" runat="server" Text='<%# Bind("endereco") %>' 
                CssClass="InputCad" Width="327px"></asp:TextBox>
                                                                        <br />
                                                                        <asp:Label ID="LabelCabec8" runat="server" Text="Bairro:"></asp:Label>
                                                                        <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator4" runat="server" ControlToValidate="bairroTextBox"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        <br />
                                                                        <asp:TextBox ID="bairroTextBox" runat="server" Text='<%# Bind("bairro") %>' 
                CssClass="InputCad" Width="327px"></asp:TextBox>
                                                                        <br />
                                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="LabelCabec9" runat="server" Text="Cidade:"></asp:Label>
                                                                                    <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator5" runat="server" ControlToValidate="cidadeTextBox"
                            Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Image ID="Image1" runat="server" 
                            ImageUrl="../images/5px.gif" />
                                                                                </td>
                                                                                <td>
                                                                                    UF:</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:TextBox ID="cidadeTextBox" runat="server" 
                            Text='<%# Bind("cidade") %>' CssClass="InputCad" Width="273px"></asp:TextBox>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Image ID="Image2" runat="server" 
                            ImageUrl="../images/5px.gif" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DDUf" runat="server" CssClass="DropUF" 
                                DataSourceID="SqlUF" DataTextField="uf" DataValueField="uf">
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:Label ID="LabelCabec10" runat="server" Text="Pais:"></asp:Label>
                                                                        <br />
                                                                        <asp:DropDownList ID="paisDropDownList" runat="server" CssClass="DropCad" 
                    DataSourceID="SqlPais" DataTextField="pais" DataValueField="pais" 
                    Width="335px">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Image ID="Image11" runat="server" ImageUrl="~/images/15px.gif" />
                                                                    </td>
                                                                    <td valign="top">
                                                                        <asp:RadioButtonList ID="idPorteRadioButtonList" runat="server" CellPadding="0" 
                    CellSpacing="0" DataSourceID="SqlPorte" DataTextField="dsPorte" 
                    DataValueField="idPorte" RepeatColumns="1" RepeatDirection="Horizontal" 
                    Width="300px">
                                                                        </asp:RadioButtonList>
                                                                        <br />
                                                                        <asp:Label ID="LabelPrv" runat="server" Text="Privacidade:"></asp:Label>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                                                    ControlToValidate="PrivacidadeRadioButtonList" Display="Dynamic" 
                                                                    ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        <asp:RadioButtonList ID="PrivacidadeRadioButtonList" runat="server" 
                                                                            CellPadding="0" CellSpacing="0">
                                                                            <asp:ListItem Value="1">Nome da Instituição não deve ser informada</asp:ListItem>
                                                                            <asp:ListItem Value="0">Nome da Instituição pode ser informada</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                </asp:UpdatePanel>
                <asp:Label ID="lblText" runat="server" CssClass="msn"></asp:Label>

                <br />
                <br />
                <asp:UpdateProgress ID="UpdateProgressCEP" runat="server" 
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
                
                
                <cc1:AlwaysVisibleControlExtender ID="UpdateProgressCEP_AlwaysVisibleControlExtender" 
                    runat="server" Enabled="True" HorizontalSide="Center" 
                    TargetControlID="UpdateProgressCEP" VerticalOffset="50" 
                    VerticalSide="Middle" HorizontalOffset="50">
                </cc1:AlwaysVisibleControlExtender>
                <br />

                <asp:UpdateProgress ID="UpdateProgressCNPJ" runat="server" 
                    AssociatedUpdatePanelID="UpdatePanelCNPJ" DisplayAfter="1">
                    <ProgressTemplate>
                          <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center">
                                    <asp:Image ID="Image13" runat="server" 
                                        ImageUrl="~/images/layout/zwf4lc.jpg.gif" />
                                    <br />
                                    <asp:Label ID="lblPesquisandoCNPJ" runat="server" Text="Pesquisando..."></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <cc1:AlwaysVisibleControlExtender ID="UpdateProgressCNPJ_AlwaysVisibleControlExtender" 
                    runat="server" Enabled="True" HorizontalOffset="50" HorizontalSide="Center" 
                    TargetControlID="UpdateProgressCNPJ" VerticalOffset="50" VerticalSide="Middle">
                </cc1:AlwaysVisibleControlExtender>

            </td> 
        </tr>
    </table> 
    <table width="730px" cellpadding="0" cellspacing="0">
       <tr>
            <td width="400px" align="center">
                <asp:Image ID="Image14" runat="server" ImageUrl="~/images/layout/setalat.gif" />
                <asp:LinkButton ID="LBNormas" runat="server" CausesValidation="False">Ler normas 
                de uso e condições</asp:LinkButton>
                <br />
            </td>
            <td><asp:Label ID="LabelCondicaoes" runat="server" 
                    Text="Ao clicar em [Cadastrar Instituição], você declara ter lido e aceito as normas de uso e condições da JobClick."></asp:Label><br />
                <asp:ImageButton ID="Cadastro" runat="server" 
                    ImageUrl="~/images/btcadastrarInstituicao.gif" />
                <br />
&nbsp;</td>
        </tr>
    </table>
                
    <asp:SqlDataSource ID="SqlAtividade" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idAreaAtuacao], [dsAreaAtuacao] FROM [tbAreaAtuacao]">
    </asp:SqlDataSource>
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
    <br />
    

</asp:Content>

