<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="cadastro.aspx.vb" Inherits="_parceiroJobClick_cadastro" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAvisoSucesso.ClientID%>").dialog({ closeText: '', width: '600', title: "Aviso", position: "top", show: { effect: 'drop', direction: "up" } });
            setTimeout(function () {
                $("#<%=PanelAvisoSucesso.ClientID%>").dialog('close')
            }, 2000);
        });
	</script>
    <div id="conteudo">
    <asp:Label ID="LabelCabec" runat="server" Text="Dados da empresa" CssClass="titulo"></asp:Label>
        <asp:Label ID="idUserEmpresaLabel" runat="server" Visible="False"></asp:Label>
                 <asp:Panel ID="PanelAvisoSucesso" runat="server" Visible="False">
                    <table id="Table1" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_parceiroJobClick/images/ok.jpg" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABEL" runat="server" CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
    <br />
    <br />
    <div id="corpoformulario">
        <table cellpadding="0" cellspacing="0">
        <tr>
            <td width="40"></td>
            <td width="630" style="text-align: left">
                <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="UFLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="RamoatividadeLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="paisLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="porteLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="emailANTESLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="pwdANTESLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="privacidadeLabel" runat="server" Visible="False"></asp:Label>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" />
                                            <asp:Panel ID="PanelACESSO" runat="server" Visible="False"> 
                                                  <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td class="trocaSenha">
                                                                <asp:Label ID="LabelPWD" runat="server" Text="Senha de acesso:"></asp:Label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="passwordTextBox" ErrorMessage="Sua senha é necessária!" ValidationGroup="TROCASENHA">*</asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="trocaSenha">
                                                                &nbsp;</td>
                                                            <td class="trocaSenha">
                                                                <asp:Label ID="Label4" runat="server" Text="E-mail de acesso:"></asp:Label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Seu e-mail de acesso é necessário!" ValidationGroup="TROCASENHA">*</asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="trocaSenha">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="trocaSenha">
                                                                <asp:TextBox ID="passwordTextBox" runat="server" CssClass="simple" TextMode="Password" ValidationGroup="TROCASENHA" Width="250px" ToolTip="Caso seja de seu interesse, informe aqui a sua nova senha de acesso. Depois informe seu novo e-mail e clique em [Acesso] para confirmar a alteração."></asp:TextBox>
                                                            </td>
                                                            <td class="trocaSenha">
                                                                &nbsp;</td>
                                                            <td class="trocaSenha">
                                                                <asp:TextBox ID="emailTextBox" runat="server" CssClass="withIconEmail" ValidationGroup="TROCASENHA" Width="250px" ToolTip="Caso seja de seu interesse, informe aqui a seu novo e-mail de acesso. Lembre-se também de informar a sua nova senha de acesso e clique em [Acesso] para confirmar a alteração."></asp:TextBox>
                                                            </td>
                                                            <td class="trocaSenha">
                                                                &nbsp;<asp:LinkButton ID="LinkButtonSalvarACESSO" runat="server" CssClass="button" ValidationGroup="TROCASENHA">Salvar</asp:LinkButton>
                                                                <asp:LinkButton ID="LinkButtonFecharACESSO" runat="server" CssClass="button">Fechar</asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                      </table>
                                                <br />
                                                <br />
                                                </asp:Panel> 
                                                 <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="LabelCabec1" runat="server" 
                                                                    Text="Nome da empresa (Razão Social):"></asp:Label>
                                                                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="nmempresaTextBox" Display="Dynamic" ErrorMessage="Razão Social ou Nome Fantasia é obrigatório." 
                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                                                                <asp:Label ID="LabelCabec2" runat="server" Text="Nome do responsável:"></asp:Label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                                                    ControlToValidate="nomeResTextBox" Display="Dynamic" ErrorMessage="Nome completo do responsável é obrigatório." 
                                                                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                <asp:TextBox ID="nmempresaTextBox" runat="server" CssClass="simple" 
                    Width="327px"></asp:TextBox>
                                                            </td>
                                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                                            <td>
                <asp:TextBox ID="nomeResTextBox" runat="server" CssClass="simple" 
                    Width="327px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label3" runat="server" 
                                                                    Text="Tempo de Existência da Empresa (Anos):"></asp:Label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                                                    ControlToValidate="tempoexistenciaTextBox" 
                                                                    ErrorMessage="Tempo de funcionamento da empresa.">*</asp:RequiredFieldValidator>

                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                                                                <asp:Label ID="LabelER" runat="server" Text="E-mail do responsavel:"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="tempoexistenciaTextBox" runat="server" CssClass="simple" 
                                                                    Width="327px"></asp:TextBox>
                                                                <cc1:MaskedEditExtender ID="tempoexistenciaTextBox_MaskedEditExtender0" 
                                                                    runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                                                                    CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                                                                    CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                                                                    InputDirection="RightToLeft" Mask="99" MaskType="Number" 
                                                                    TargetControlID="tempoexistenciaTextBox">
                                                                </cc1:MaskedEditExtender>
                                                            </td>
                                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                                            <td>
                                                                <asp:TextBox ID="emailResTextBox" runat="server" CssClass="withIconEmail" Width="327px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="LabelCabec3" runat="server" Text="CNPJ:"></asp:Label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                                    ControlToValidate="TextBoxCNPJ" Display="Dynamic" 
                                                                    ErrorMessage="CNPJ é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                                                                <asp:Label ID="Label2" runat="server" Text="Site da Empresa (se existir):"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="TextBoxCNPJ" runat="server" 
                                                                    CssClass="simple" ValidationGroup="CNPJ" Width="327px"></asp:TextBox>
                                                            </td>
                                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                                            <td>
                                                                <asp:TextBox ID="siteTextBox" runat="server" CssClass="simple" Width="327px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Labeltel" runat="server" Text="Telefone para contato: [99] [99999-9999]"></asp:Label>
                                                                <table>
                                                                    <tr>
                                                                        <td>DDD<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="ddd" Display="Dynamic" ErrorMessage="Informe o DDD." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="ddd" Display="Dynamic" ErrorMessage="Deve ser numérico." SetFocusOnError="True" ValidationExpression="\d{2}">*</asp:RegularExpressionValidator>
                                                                        </td>
                                                                        <td>Número<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="telefone" Display="Dynamic" ErrorMessage="Telefone é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="telefone" Display="Dynamic" ErrorMessage="Informe o número do telefone." SetFocusOnError="True" ValidationExpression="([9_]{1})?\d{4}\-\d{4}">*</asp:RegularExpressionValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:TextBox ID="ddd" runat="server" CssClass="simple" MaxLength="2" Width="40px"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="telefone" runat="server" CssClass="simple" MaxLength="10" Width="262px"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td>&nbsp;</td>
                                                            <td>
                                                                <br />
                                                                <asp:Label ID="LabelCabec4" runat="server" Text="Ramo de atividade da empresa:"></asp:Label>
                                                                <br />
                                                                <asp:DropDownList ID="idAreaAtuacaoDropDownList" runat="server" DataSourceID="SqlAtividade" DataTextField="dsAreaAtuacao" DataValueField="idAreaAtuacao" Width="350px">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                    </table>

                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="LabelCabec6" runat="server" Text="CEP:"></asp:Label>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="cepTextBox"
                Display="Dynamic" ErrorMessage="CEP é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                    ControlToValidate="cepTextBox" Display="Dynamic" ErrorMessage="*" 
                    SetFocusOnError="True" ValidationGroup="CEP"></asp:RequiredFieldValidator>
                                                                        <asp:RegularExpressionValidator
                    ID="RegularExpressionValidator1" runat="server" ControlToValidate="cepTextBox"
                    ErrorMessage="* CEP 99999-999" ValidationExpression="\d{5}(-\d{3})?" 
                ValidationGroup="CEP"></asp:RegularExpressionValidator>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Image ID="Image18" runat="server" ImageUrl="~/images/15px.gif" />
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="top" align="left">
                                                                        <table cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:TextBox ID="cepTextBox" runat="server" CssClass="simple" Text='<%# Bind("cep") %>' Width="307px" ValidationGroup="CEP"></asp:TextBox>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:ImageButton ID="PesquisaCEP" runat="server" ImageUrl="~/images/layout/pesquisa.png" OnClick="PesquisaCEP_Click1" ValidationGroup="CEP" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <table cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="LabelCabec7" runat="server" Text="Endereço:"></asp:Label>
                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                                                        ControlToValidate="enderecoTextBox" Display="Dynamic" 
                                                                                        ErrorMessage="Endereço é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                                                    <br />
                                                                                    <asp:TextBox ID="enderecoTextBox" runat="server" CssClass="simple" 
                                                                                        Text='<%# Bind("endereco") %>' Width="255px"></asp:TextBox>
                                                                                </td>
                                                                                <td>
                                                                                    &nbsp;</td>
                                                                                <td>
                                                                                    <asp:Label ID="Labelnro" runat="server" Text="Nº:"></asp:Label>
                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                                                                        ControlToValidate="nrTextBox" ErrorMessage="Número é obrigatório.">*</asp:RequiredFieldValidator>
                                                                                    <br />
                                                                                    <asp:TextBox ID="nrTextBox" runat="server" CssClass="simple" Width="43px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:Label ID="LabelCabec11" runat="server" Text="Complemento:"></asp:Label>
                                                                        <br />
                                                                        <asp:TextBox ID="complementoTextBox" runat="server" CssClass="simple" 
                                                                            Width="327px"></asp:TextBox>
                                                                        <br />
                                                                        <asp:Label ID="LabelCabec8" runat="server" Text="Bairro:"></asp:Label>
                                                                        <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator4" runat="server" ControlToValidate="bairroTextBox"
                Display="Dynamic" ErrorMessage="Bairro é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                                        <br />
                                                                        <asp:TextBox ID="bairroTextBox" runat="server" Text='<%# Bind("bairro") %>' 
                CssClass="simple" Width="327px"></asp:TextBox>
                                                                        <br />
                                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="LabelCabec9" runat="server" Text="Cidade:"></asp:Label>
                                                                                    <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator5" runat="server" ControlToValidate="cidadeTextBox"
                            Display="Dynamic" ErrorMessage="Cidade é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
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
                            Text='<%# Bind("cidade") %>' CssClass="simple" Width="258px"></asp:TextBox>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Image ID="Image2" runat="server" 
                            ImageUrl="../images/5px.gif" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DDUf" runat="server" 
                                DataSourceID="SqlUF" DataTextField="uf" DataValueField="uf" Width="65px">
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:Label ID="LabelCabec10" runat="server" Text="Pais:"></asp:Label>
                                                                        <br />
                                                                        <asp:DropDownList ID="paisDropDownList" runat="server" 
                    DataSourceID="SqlPais" DataTextField="pais" DataValueField="pais" 
                    Width="350px">
                                                                        </asp:DropDownList>
                                                                        <br />
                                                                        <br />
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                                                    <td valign="top" align="left">

                                                                        <br />

                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                                                            ControlToValidate="idPorteRadioButtonList" Display="Dynamic" 
                                                                            ErrorMessage="Porte da empresa é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                                        <asp:Label ID="LabelCabec5" runat="server" Text="Porte da empresa:"></asp:Label>
                                                                        <asp:RadioButtonList ID="idPorteRadioButtonList" runat="server" CellPadding="0" 
                                                                            CellSpacing="0" DataSourceID="SqlPorte" DataTextField="dsPorte" 
                                                                            DataValueField="idPorte" RepeatColumns="1" RepeatDirection="Horizontal" 
                                                                            Width="300px">
                                                                        </asp:RadioButtonList>
                                                                        <br />
                                                                        <br />
                                                                        <br />
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                                                            ControlToValidate="PrivacidadeRadioButtonList" Display="Dynamic" 
                                                                            ErrorMessage="Informe sobre a privacidade." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                                        <asp:Label ID="LabelPrv" runat="server" Text="Privacidade:"></asp:Label>
                                                                        <asp:RadioButtonList ID="PrivacidadeRadioButtonList" runat="server" 
                                                                            CellPadding="0" CellSpacing="0">
                                                                            <asp:ListItem Value="1">Nome da empresa não aparece nos anúncios</asp:ListItem>
                                                                            <asp:ListItem Value="0">Nome da empresa aparece nos anúncios</asp:ListItem>
                                                                        </asp:RadioButtonList>

                                                                        <br />
                                                                        <br />
                                                                        <br />
                                                                        <asp:LinkButton ID="LinkButtonAcesso" runat="server" CssClass="button" OnClientClick="return confirm(&quot;Você deseja alterar sua conta de acesso?\n\nAnote em lugar seguro esta atualização.&quot;)" ToolTip="Atenção: Você irá alterar sua conta de acesso ao sistema!" CausesValidation="False">Acesso</asp:LinkButton>
                                                                        <asp:LinkButton ID="LinkButtonSalvar" runat="server" CssClass="button" ToolTip="Após alterar seus dados cadastrais, clique neste botão para salvar suas alterações.">Salvar alterações</asp:LinkButton>

                                                                    </td>
                                                                </tr>
                                                            </table>

                <asp:Label ID="lblText" runat="server" CssClass="msn"></asp:Label>

                <br />
                </td>
            </tr>
        </table>

    </div>
    <br />
    <asp:SqlDataSource ID="SqlDataSourceDadosDaEmpresa" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" DeleteCommand="DELETE FROM [tbCadastroEmpresa] WHERE [idCadastroEmpresa] = @idCadastroEmpresa" InsertCommand="INSERT INTO [tbCadastroEmpresa] ([idParceiro], [idUser], [idAreaAtuacao], [idPorte], [nmempresa], [cnpj], [ie], [emailRes], [nomeRes], [endereco], [complemento], [cep], [bairro], [cidade], [uf], [pais], [nomeResposavelCobranca], [emailCobranca], [enderecoCobranca], [cepCobranca], [bairroCobranca], [cidadeCobranca], [ufCobranca], [paisCobranca], [dddCobranca], [telefoneCobranca], [ddd], [telefone], [data], [dataultimoacess], [privacidade], [contador], [aprovado], [nroProcessoSeletivo], [nroVagasPub], [max_nroVagasPub], [idCadastroEmpresa_Pai], [site], [portalJobclick], [logoVaga], [logoBGTitulo], [tempoexistencia], [flgAprovaPerfilAuto], [idClient_SMS], [idProject_SMS], [codTransacao], [TipoPagamento], [StatusTransacao], [datapagamento], [liberaQtdCad], [painelParceiro], [EmpresaAssociada]) VALUES (@idParceiro, @idUser, @idAreaAtuacao, @idPorte, @nmempresa, @cnpj, @ie, @emailRes, @nomeRes, @endereco, @complemento, @cep, @bairro, @cidade, @uf, @pais, @nomeResposavelCobranca, @emailCobranca, @enderecoCobranca, @cepCobranca, @bairroCobranca, @cidadeCobranca, @ufCobranca, @paisCobranca, @dddCobranca, @telefoneCobranca, @ddd, @telefone, @data, @dataultimoacess, @privacidade, @contador, @aprovado, @nroProcessoSeletivo, @nroVagasPub, @max_nroVagasPub, @idCadastroEmpresa_Pai, @site, @portalJobclick, @logoVaga, @logoBGTitulo, @tempoexistencia, @flgAprovaPerfilAuto, @idClient_SMS, @idProject_SMS, @codTransacao, @TipoPagamento, @StatusTransacao, @datapagamento, @liberaQtdCad, @painelParceiro, @EmpresaAssociada)" SelectCommand="SELECT [idCadastroEmpresa], [idParceiro], [idUser], [idAreaAtuacao], [idPorte], [nmempresa], [cnpj], [ie], [emailRes], [nomeRes], [endereco], [complemento], [cep], [bairro], [cidade], [uf], [pais], [nomeResposavelCobranca], [emailCobranca], [enderecoCobranca], [cepCobranca], [bairroCobranca], [cidadeCobranca], [ufCobranca], [paisCobranca], [dddCobranca], [telefoneCobranca], [ddd], [telefone], [data], [dataultimoacess], [privacidade], [contador], [aprovado], [nroProcessoSeletivo], [nroVagasPub], [max_nroVagasPub], [idCadastroEmpresa_Pai], [site], [portalJobclick], [logoVaga], [logoBGTitulo], [tempoexistencia], [flgAprovaPerfilAuto], [idClient_SMS], [idProject_SMS], [codTransacao], [TipoPagamento], [StatusTransacao], [datapagamento], [liberaQtdCad], [painelParceiro], [EmpresaAssociada] FROM [tbCadastroEmpresa] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)" UpdateCommand="UPDATE [tbCadastroEmpresa] SET [idParceiro] = @idParceiro, [idUser] = @idUser, [idAreaAtuacao] = @idAreaAtuacao, [idPorte] = @idPorte, [nmempresa] = @nmempresa, [cnpj] = @cnpj, [ie] = @ie, [emailRes] = @emailRes, [nomeRes] = @nomeRes, [endereco] = @endereco, [complemento] = @complemento, [cep] = @cep, [bairro] = @bairro, [cidade] = @cidade, [uf] = @uf, [pais] = @pais, [nomeResposavelCobranca] = @nomeResposavelCobranca, [emailCobranca] = @emailCobranca, [enderecoCobranca] = @enderecoCobranca, [cepCobranca] = @cepCobranca, [bairroCobranca] = @bairroCobranca, [cidadeCobranca] = @cidadeCobranca, [ufCobranca] = @ufCobranca, [paisCobranca] = @paisCobranca, [dddCobranca] = @dddCobranca, [telefoneCobranca] = @telefoneCobranca, [ddd] = @ddd, [telefone] = @telefone, [data] = @data, [dataultimoacess] = @dataultimoacess, [privacidade] = @privacidade, [contador] = @contador, [aprovado] = @aprovado, [nroProcessoSeletivo] = @nroProcessoSeletivo, [nroVagasPub] = @nroVagasPub, [max_nroVagasPub] = @max_nroVagasPub, [idCadastroEmpresa_Pai] = @idCadastroEmpresa_Pai, [site] = @site, [portalJobclick] = @portalJobclick, [logoVaga] = @logoVaga, [logoBGTitulo] = @logoBGTitulo, [tempoexistencia] = @tempoexistencia, [flgAprovaPerfilAuto] = @flgAprovaPerfilAuto, [idClient_SMS] = @idClient_SMS, [idProject_SMS] = @idProject_SMS, [codTransacao] = @codTransacao, [TipoPagamento] = @TipoPagamento, [StatusTransacao] = @StatusTransacao, [datapagamento] = @datapagamento, [liberaQtdCad] = @liberaQtdCad, [painelParceiro] = @painelParceiro, [EmpresaAssociada] = @EmpresaAssociada WHERE [idCadastroEmpresa] = @idCadastroEmpresa">
        <DeleteParameters>
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="idParceiro" Type="Int32" />
            <asp:Parameter Name="idUser" Type="Int32" />
            <asp:Parameter Name="idAreaAtuacao" Type="Int32" />
            <asp:Parameter Name="idPorte" Type="Int32" />
            <asp:Parameter Name="nmempresa" Type="String" />
            <asp:Parameter Name="cnpj" Type="String" />
            <asp:Parameter Name="ie" Type="String" />
            <asp:Parameter Name="emailRes" Type="String" />
            <asp:Parameter Name="nomeRes" Type="String" />
            <asp:Parameter Name="endereco" Type="String" />
            <asp:Parameter Name="complemento" Type="String" />
            <asp:Parameter Name="cep" Type="String" />
            <asp:Parameter Name="bairro" Type="String" />
            <asp:Parameter Name="cidade" Type="String" />
            <asp:Parameter Name="uf" Type="String" />
            <asp:Parameter Name="pais" Type="String" />
            <asp:Parameter Name="nomeResposavelCobranca" Type="String" />
            <asp:Parameter Name="emailCobranca" Type="String" />
            <asp:Parameter Name="enderecoCobranca" Type="String" />
            <asp:Parameter Name="cepCobranca" Type="String" />
            <asp:Parameter Name="bairroCobranca" Type="String" />
            <asp:Parameter Name="cidadeCobranca" Type="String" />
            <asp:Parameter Name="ufCobranca" Type="String" />
            <asp:Parameter Name="paisCobranca" Type="String" />
            <asp:Parameter Name="dddCobranca" Type="String" />
            <asp:Parameter Name="telefoneCobranca" Type="String" />
            <asp:Parameter Name="ddd" Type="String" />
            <asp:Parameter Name="telefone" Type="String" />
            <asp:Parameter Name="data" Type="DateTime" />
            <asp:Parameter Name="dataultimoacess" Type="DateTime" />
            <asp:Parameter Name="privacidade" Type="Boolean" />
            <asp:Parameter Name="contador" Type="Int32" />
            <asp:Parameter Name="aprovado" Type="Boolean" />
            <asp:Parameter Name="nroProcessoSeletivo" Type="Int32" />
            <asp:Parameter Name="nroVagasPub" Type="Int32" />
            <asp:Parameter Name="max_nroVagasPub" Type="Int32" />
            <asp:Parameter Name="idCadastroEmpresa_Pai" Type="Int32" />
            <asp:Parameter Name="site" Type="String" />
            <asp:Parameter Name="portalJobclick" Type="String" />
            <asp:Parameter Name="logoVaga" Type="String" />
            <asp:Parameter Name="logoBGTitulo" Type="String" />
            <asp:Parameter Name="tempoexistencia" Type="Int32" />
            <asp:Parameter Name="flgAprovaPerfilAuto" Type="Boolean" />
            <asp:Parameter Name="idClient_SMS" Type="Int32" />
            <asp:Parameter Name="idProject_SMS" Type="Int32" />
            <asp:Parameter Name="codTransacao" Type="String" />
            <asp:Parameter Name="TipoPagamento" Type="String" />
            <asp:Parameter Name="StatusTransacao" Type="String" />
            <asp:Parameter Name="datapagamento" Type="DateTime" />
            <asp:Parameter Name="liberaQtdCad" Type="Int32" />
            <asp:Parameter Name="painelParceiro" Type="String" />
            <asp:Parameter Name="EmpresaAssociada" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="idParceiro" Type="Int32" />
            <asp:Parameter Name="idUser" Type="Int32" />
            <asp:Parameter Name="idAreaAtuacao" Type="Int32" />
            <asp:Parameter Name="idPorte" Type="Int32" />
            <asp:Parameter Name="nmempresa" Type="String" />
            <asp:Parameter Name="cnpj" Type="String" />
            <asp:Parameter Name="ie" Type="String" />
            <asp:Parameter Name="emailRes" Type="String" />
            <asp:Parameter Name="nomeRes" Type="String" />
            <asp:Parameter Name="endereco" Type="String" />
            <asp:Parameter Name="complemento" Type="String" />
            <asp:Parameter Name="cep" Type="String" />
            <asp:Parameter Name="bairro" Type="String" />
            <asp:Parameter Name="cidade" Type="String" />
            <asp:Parameter Name="uf" Type="String" />
            <asp:Parameter Name="pais" Type="String" />
            <asp:Parameter Name="nomeResposavelCobranca" Type="String" />
            <asp:Parameter Name="emailCobranca" Type="String" />
            <asp:Parameter Name="enderecoCobranca" Type="String" />
            <asp:Parameter Name="cepCobranca" Type="String" />
            <asp:Parameter Name="bairroCobranca" Type="String" />
            <asp:Parameter Name="cidadeCobranca" Type="String" />
            <asp:Parameter Name="ufCobranca" Type="String" />
            <asp:Parameter Name="paisCobranca" Type="String" />
            <asp:Parameter Name="dddCobranca" Type="String" />
            <asp:Parameter Name="telefoneCobranca" Type="String" />
            <asp:Parameter Name="ddd" Type="String" />
            <asp:Parameter Name="telefone" Type="String" />
            <asp:Parameter Name="data" Type="DateTime" />
            <asp:Parameter Name="dataultimoacess" Type="DateTime" />
            <asp:Parameter Name="privacidade" Type="Boolean" />
            <asp:Parameter Name="contador" Type="Int32" />
            <asp:Parameter Name="aprovado" Type="Boolean" />
            <asp:Parameter Name="nroProcessoSeletivo" Type="Int32" />
            <asp:Parameter Name="nroVagasPub" Type="Int32" />
            <asp:Parameter Name="max_nroVagasPub" Type="Int32" />
            <asp:Parameter Name="idCadastroEmpresa_Pai" Type="Int32" />
            <asp:Parameter Name="site" Type="String" />
            <asp:Parameter Name="portalJobclick" Type="String" />
            <asp:Parameter Name="logoVaga" Type="String" />
            <asp:Parameter Name="logoBGTitulo" Type="String" />
            <asp:Parameter Name="tempoexistencia" Type="Int32" />
            <asp:Parameter Name="flgAprovaPerfilAuto" Type="Boolean" />
            <asp:Parameter Name="idClient_SMS" Type="Int32" />
            <asp:Parameter Name="idProject_SMS" Type="Int32" />
            <asp:Parameter Name="codTransacao" Type="String" />
            <asp:Parameter Name="TipoPagamento" Type="String" />
            <asp:Parameter Name="StatusTransacao" Type="String" />
            <asp:Parameter Name="datapagamento" Type="DateTime" />
            <asp:Parameter Name="liberaQtdCad" Type="Int32" />
            <asp:Parameter Name="painelParceiro" Type="String" />
            <asp:Parameter Name="EmpresaAssociada" Type="Int32" />
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
                
    <asp:SqlDataSource ID="SqlAtividade" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
                    SelectCommand="SELECT [idAreaAtuacao], [dsAreaAtuacao] FROM [tbAreaAtuacao] ORDER BY [dsAreaAtuacao]">
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
    <br /><br />
</div>
</asp:Content>

