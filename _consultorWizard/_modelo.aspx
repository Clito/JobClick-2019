<%@ Page Title="" Language="VB" MasterPageFile="~/_consultor/ConsultorMasterPage.master" AutoEventWireup="false" CodeFile="_modelo.aspx.vb" Inherits="_consultor_modelo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26"></td>
                <td width="614"><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label></td>
            </tr>
        </table>
        <br />
            <table border="0" cellpadding="0" cellspacing="0" width="640">
                <tr>
                    <td width="26">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/h26.gif" />
                    </td>
                    <td width="614">
                                                    <asp:GridView ID="GridViewMODELO" runat="server" AutoGenerateColumns="False" 
                                                        BorderStyle="None" 
                            DataKeyNames="idPerfilVagaFill" DataSourceID="SqlMODELO" 
                                                        GridLines="None" ShowHeader="False" 
                            Width="100%">
                                                        <AlternatingRowStyle BackColor="#DDDDDD" />
                                                        <Columns>
                                                            <asp:BoundField DataField="idPerfilVagaFill" HeaderText="idPerfilVagaFill" 
                                                                InsertVisible="False" ReadOnly="True" SortExpression="idPerfilVagaFill" 
                                                                Visible="False" />
                                                            <asp:TemplateField HeaderText="Modelo" ShowHeader="False">
                                                                <ItemTemplate>
                                                                    •
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                                                        CommandName="Select" Text='<%# Eval("dsPerfilVaga") %>'></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="dsPerfilVaga" HeaderText="Modelo" 
                                                                SortExpression="dsPerfilVaga" Visible="False">
                                                            <HeaderStyle HorizontalAlign="Left" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                                                                SortExpression="idCadastroEmpresa" Visible="False" />
                                                        </Columns>
                                                    </asp:GridView>
                                                    <asp:Label ID="idPerfilVagaFillLabel" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="MSN" runat="server" CssClass="msn"></asp:Label>
                                                <br />
                        <asp:FormView ID="FormViewModelo" runat="server" DataKeyNames="idPerfilVagaFill" 
                            DataSourceID="SqlMODELOFORM">
                            <EditItemTemplate>
                                <asp:Label ID="idPerfilVagaFillLabel1" runat="server" 
                                    Text='<%# Eval("idPerfilVagaFill") %>' Visible="False" />
                                <br />
                                <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" 
                                    Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" />
                                <asp:TextBox ID="idCadastroEmpresa_FilhaTextBox" runat="server" 
                                    Text='<%# Bind("idCadastroEmpresa_Filha") %>' Visible="False" />
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="Formação Acadêmica:"></asp:Label>
                                <br />
                                <asp:DropDownList ID="DropDownListFormacao" runat="server" CssClass="DropCad" 
                                    DataSourceID="SqlDataTipoFormacao" DataTextField="dsTipoFormacao" 
                                    DataValueField="idTipoFormacao" SelectedValue='<%# Bind("idTipoFormacao") %>'>
                                </asp:DropDownList>
                                <br />
                                <asp:Label ID="Label2" runat="server" Text="Nome que dado a este Modelo:"></asp:Label>
                                <br />
                                <asp:TextBox ID="dsPerfilVagaTextBox" runat="server" CssClass="InputCad" 
                                    Text='<%# Bind("dsPerfilVaga") %>' />
                                <br />
                                <asp:Label ID="Label3" runat="server" Text="Cargo:"></asp:Label>
                                <br />
                                <asp:TextBox ID="CargoTextBox" runat="server" CssClass="InputCad" 
                                    Text='<%# Bind("Cargo") %>' />
                                <br />
                                <asp:Label ID="Label4" runat="server" Text="Número de vagas:"></asp:Label>
                                <br />
                                <asp:TextBox ID="nrovagaTextBox" runat="server" CssClass="InputCad" 
                                    Text='<%# Bind("nrovaga") %>' Width="50px" />
                                <br />
                                <br />
                                <asp:Label ID="Label5" runat="server" Text="Tipo de oportunidade:"></asp:Label>
                                <br />
                                <asp:RadioButtonList ID="RadioButtonListTipoOportunidade" runat="server" 
                                    DataSourceID="SqlTipoVaga" DataTextField="dsTipoVAga" 
                                    DataValueField="idTipoVaga" SelectedValue='<%# Bind("TipoOportunidade") %>' 
                                    ValidationGroup="PerfilVagaForm">
                                </asp:RadioButtonList>
                                <br />
                                <asp:Label ID="Label6" runat="server" 
                                    Text="Qualificacao e Habilidades Especificas:"></asp:Label>
                                <br />
                                <asp:TextBox ID="QualificacaoHabilidadesEspecificasTextBox" runat="server" 
                                    CssClass="InputCad" Height="120px" 
                                    Text='<%# Bind("QualificacaoHabilidadesEspecificas") %>' TextMode="MultiLine" />
                                <br />
                                <br />
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            <asp:Label ID="Label7" runat="server" Text="Remuneração:"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label8" runat="server" Text="R$"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="RemuneracaoTextBox" runat="server" CssClass="InputCad" 
                                                Text='<%# Bind("Remuneracao", "{0:N}") %>' Width="150px" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            <asp:Label ID="Label9" runat="server" Text="Remuneração Variável:"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label10" runat="server" Text="R$"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="RemuneracaoVariavelTextBox" runat="server" CssClass="InputCad" 
                                                Text='<%# Bind("RemuneracaoVariavel", "{0:N}") %>' Width="150px" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            <asp:Label ID="Label11" runat="server" Text="Honorários:"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label12" runat="server" Text="R$"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="HonorarioTextBox" runat="server" CssClass="InputCad" 
                                                Text='<%# Bind("Honorario", "{0:N}") %>' Width="150px" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label13" runat="server" Text="Local de Trabalho:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label14" runat="server" Text="UF:"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="LocalTrabalhoTextBox" runat="server" CssClass="InputCad" 
                                                Text='<%# Bind("LocalTrabalho") %>' Width="300px" />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListUF" runat="server" CssClass="DropUF" 
                                                DataSourceID="SqlUF" DataTextField="uf" DataValueField="uf" 
                                                SelectedValue='<%# Bind("UF") %>'>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                                &nbsp;<br />&nbsp;<br />
                                <br />
                                <asp:Label ID="Label15" runat="server" Text="Observações Complementares:"></asp:Label>
                                <br />
                                <asp:TextBox ID="ObsComplementaresTextBox" runat="server" CssClass="InputCad" 
                                    Height="120px" Text='<%# Bind("ObsComplementares") %>' TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label16" runat="server" Text="Perfil do Gestor:"></asp:Label>
                                <br />
                                <asp:TextBox ID="PerfilGestorTextBox" runat="server" CssClass="InputCad" 
                                    Height="80px" Text='<%# Bind("PerfilGestor") %>' TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label17" runat="server" Text="Benefícios:"></asp:Label>
                                <br />
                                <asp:TextBox ID="BeneficiosTextBox" runat="server" CssClass="InputCad" 
                                    Height="100px" Text='<%# Bind("Beneficios") %>' TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label18" runat="server" Text="Perspectiva:"></asp:Label>
                                <br />
                                <asp:TextBox ID="PerspectivaTextBox" runat="server" CssClass="InputCad" 
                                    Height="100px" Text='<%# Bind("Perspectiva") %>' TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label19" runat="server" Text="Idade de:"></asp:Label>
                                <br />
                                <asp:TextBox ID="FaixaEtariaInicioTextBox" runat="server" CssClass="InputCad" 
                                    Text='<%# Bind("FaixaEtariaInicio") %>' Width="80px" />
                                <br />
                                <asp:Label ID="Label20" runat="server" Text="Idade até:"></asp:Label>
                                <br />
                                <asp:TextBox ID="FaixaEtariaFimTextBox" runat="server" CssClass="InputCad" 
                                    Text='<%# Bind("FaixaEtariaFim") %>' Width="80px" />
                                <br />
                                <br />
                                <asp:RadioButtonList ID="RadioButtonListSexo" runat="server" 
                                    RepeatDirection="Horizontal" SelectedValue='<%# Bind("Sexo") %>'>
                                    <asp:ListItem Value="M">Masculino</asp:ListItem>
                                    <asp:ListItem Value="F">Feminino</asp:ListItem>
                                    <asp:ListItem Value="I">Indiferente</asp:ListItem>
                                </asp:RadioButtonList>
                                <br />
                                <asp:Label ID="Label21" runat="server" Text="Conhecimento no(s) Idioma(s):"></asp:Label>
                                <br />
                                <asp:TextBox ID="ConhecimentoIdiomaTextBox" runat="server" CssClass="InputCad" 
                                    Height="80px" Text='<%# Bind("ConhecimentoIdioma") %>' TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label22" runat="server" Text="Perfil Composicao da Equipe:"></asp:Label>
                                <br />
                                <asp:TextBox ID="PerfilComposicaoEquipeTextBox" runat="server" 
                                    CssClass="InputCad" Height="50px" Text='<%# Bind("PerfilComposicaoEquipe") %>' 
                                    TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label23" runat="server" Text="Cursos Específicos:"></asp:Label>
                                <br />
                                <asp:TextBox ID="CursoEspecificoTextBox" runat="server" CssClass="InputCad" 
                                    Height="50px" Text='<%# Bind("CursoEspecifico") %>' TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label24" runat="server" Text="Conhecimentos:"></asp:Label>
                                <br />
                                <asp:TextBox ID="ConhecimentoTextBox" runat="server" CssClass="InputCad" 
                                    Height="50px" Text='<%# Bind("Conhecimento") %>' TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label25" runat="server" Text="Conhecimento(s) em Informatica:"></asp:Label>
                                <br />
                                <asp:TextBox ID="ConhecimentoInformaticaTextBox" runat="server" 
                                    CssClass="InputCad" Height="50px" Text='<%# Bind("ConhecimentoInformatica") %>' 
                                    TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label26" runat="server" Text="Competência Comportamental:"></asp:Label>
                                <br />
                                <asp:TextBox ID="CompetenciaComportamentalTextBox" runat="server" 
                                    CssClass="InputCad" Height="50px" 
                                    Text='<%# Bind("CompetenciaComportamental") %>' TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label27" runat="server" Text="Competência Profissional:"></asp:Label>
                                <br />
                                <asp:TextBox ID="CompetenciaProfissionalTextBox" runat="server" 
                                    CssClass="InputCad" Height="50px" Text='<%# Bind("CompetenciaProfissional") %>' 
                                    TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label28" runat="server" Text="Aspectos Criticos:"></asp:Label>
                                <br />
                                <asp:TextBox ID="AspectoCriticoTextBox" runat="server" CssClass="InputCad" 
                                    Height="50px" Text='<%# Bind("AspectoCritico") %>' TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label29" runat="server" Text="Principal Desafio:"></asp:Label>
                                <br />
                                <asp:TextBox ID="PrincipalDesafioTextBox" runat="server" CssClass="InputCad" 
                                    Height="50px" Text='<%# Bind("PrincipalDesafio") %>' TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label30" runat="server" Text="Relacionamento Interno:"></asp:Label>
                                <br />
                                <asp:TextBox ID="RelacionamentoInternoTextBox" runat="server" 
                                    CssClass="InputCad" Height="50px" Text='<%# Bind("RelacionamentoInterno") %>' 
                                    TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label31" runat="server" Text="Relacionamento Externo:"></asp:Label>
                                <br />
                                <asp:TextBox ID="RelacionamentoExternoTextBox" runat="server" 
                                    CssClass="InputCad" Height="50px" Text='<%# Bind("RelacionamentoExterno") %>' 
                                    TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label32" runat="server" Text="Viagens:"></asp:Label>
                                <br />
                                <asp:TextBox ID="viagensTextBox" runat="server" CssClass="InputCad" 
                                    Height="50px" Text='<%# Bind("viagens") %>' TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label33" runat="server" Text="Descritivo das viagens:"></asp:Label>
                                <br />
                                <asp:TextBox ID="infoSobre_viagensTextBox" runat="server" CssClass="InputCad" 
                                    Height="50px" Text='<%# Bind("infoSobre_viagens") %>' TextMode="MultiLine" />
                                <br />
                                <br />
                                <asp:CheckBox ID="confidencialCheckBox" runat="server" 
                                    Checked='<%# Bind("confidencial") %>' Text="Vaga confidencial:" />
                                <br />
                                <br />
                                <asp:Label ID="Label34" runat="server" Text="Estrutura Organizacional:"></asp:Label>
                                <br />
                                <asp:TextBox ID="EstruturaOrganizacionalTextBox" runat="server" 
                                    CssClass="InputCad" Height="50px" Text='<%# Bind("EstruturaOrganizacional") %>' 
                                    TextMode="MultiLine" />
                                <br />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Salvar as alterações feitas" />
                                &nbsp;|
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                    CausesValidation="False" CommandName="Cancel" Text="Cancelar" 
                                    onclick="UpdateCancelButton_Click" />
                                &nbsp;|
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete" 
                                    onclientclick="return confirm(&quot;Quer excluir este Modelo?&quot;)">Excluir</asp:LinkButton>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                    CommandName="New" 
                                    Text="Cadastrar um novo modelo de Levantamento de Perfil de vaga" />
                                &nbsp;|
                                <asp:LinkButton ID="LinkButtonCarga" runat="server" 
                                    onclick="LinkButtonCarga_Click"> Cadastrar a partir de um Levantamento</asp:LinkButton>
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="Formação Acadêmica:"></asp:Label>
                                <br />
                                <asp:DropDownList ID="DropDownListFormacao" runat="server" CssClass="DropCad" 
                                    DataSourceID="SqlDataTipoFormacao" DataTextField="dsTipoFormacao" 
                                    DataValueField="idTipoFormacao" 
                                    SelectedValue='<%# Bind("idTipoFormacao") %>'>
                                </asp:DropDownList>
                                <br />
                                <asp:Label ID="Label2" runat="server" Text="Nome que será dado a este Modelo:"></asp:Label>
                                <br />
                                <asp:TextBox ID="dsPerfilVagaTextBox" runat="server" 
                                    Text='<%# Bind("dsPerfilVaga") %>' CssClass="InputCad" />
                                <br />
                                <asp:Label ID="Label3" runat="server" Text="Cargo:"></asp:Label>
                                <br />
                                <asp:TextBox ID="CargoTextBox" runat="server" Text='<%# Bind("Cargo") %>' 
                                    CssClass="InputCad" />
                                <br />
                                <asp:Label ID="Label4" runat="server" Text="Número de vagas:"></asp:Label>
                                <br />
                                <asp:TextBox ID="nrovagaTextBox" runat="server" Text='<%# Bind("nrovaga") %>' 
                                    CssClass="InputCad" Width="50px" />
                                <br />
                                <br />
                                <asp:Label ID="Label5" runat="server" Text="Tipo de oportunidade:"></asp:Label>
                                <br />
                                <asp:RadioButtonList ID="RadioButtonListTipoOportunidade" runat="server" 
                                    DataSourceID="SqlTipoVaga" DataTextField="dsTipoVAga" 
                                    DataValueField="idTipoVaga" SelectedValue='<%# Bind("TipoOportunidade") %>' 
                                    ValidationGroup="PerfilVagaForm">
                                </asp:RadioButtonList>
                                <br />
                                <asp:Label ID="Label6" runat="server" 
                                    Text="Qualificacao e Habilidades Especificas:"></asp:Label>
                                <br />
                                <asp:TextBox ID="QualificacaoHabilidadesEspecificasTextBox" runat="server" 
                                    Text='<%# Bind("QualificacaoHabilidadesEspecificas") %>' 
                                    CssClass="InputCad" Height="120px" TextMode="MultiLine" />
                                <br />
                                <br />
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            <asp:Label ID="Label7" runat="server" Text="Remuneração:"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label8" runat="server" Text="R$"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="RemuneracaoTextBox" runat="server" CssClass="InputCad" 
                                                Text='<%# Bind("Remuneracao") %>' Width="150px" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            <asp:Label ID="Label9" runat="server" Text="Remuneração Variável:"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label10" runat="server" Text="R$"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="RemuneracaoVariavelTextBox" runat="server" CssClass="InputCad" 
                                                Text='<%# Bind("RemuneracaoVariavel") %>' Width="150px" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            <asp:Label ID="Label11" runat="server" Text="Honorários:"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label12" runat="server" Text="R$"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="HonorarioTextBox" runat="server" CssClass="InputCad" 
                                                Text='<%# Bind("Honorario") %>' Width="150px" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label13" runat="server" Text="Local de Trabalho:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label14" runat="server" Text="UF:"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="LocalTrabalhoTextBox" runat="server" CssClass="InputCad" 
                                                Text='<%# Bind("LocalTrabalho") %>' Width="300px" />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownListUF" runat="server" CssClass="DropUF" 
                                                DataSourceID="SqlUF" DataTextField="uf" DataValueField="uf" 
                                                SelectedValue='<%# Bind("UF") %>'>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                                &nbsp;<br />&nbsp;<br />
                                <br />
                                <asp:Label ID="Label15" runat="server" Text="Observações Complementares:"></asp:Label>
                                <br />
                                <asp:TextBox ID="ObsComplementaresTextBox" runat="server" 
                                    Text='<%# Bind("ObsComplementares") %>' CssClass="InputCad" Height="120px" 
                                    TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label16" runat="server" Text="Perfil do Gestor:"></asp:Label>
                                <br />
                                <asp:TextBox ID="PerfilGestorTextBox" runat="server" 
                                    Text='<%# Bind("PerfilGestor") %>' CssClass="InputCad" Height="80px" 
                                    TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label17" runat="server" Text="Benefícios:"></asp:Label>
                                <br />
                                <asp:TextBox ID="BeneficiosTextBox" runat="server" 
                                    Text='<%# Bind("Beneficios") %>' CssClass="InputCad" Height="100px" 
                                    TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label18" runat="server" Text="Perspectiva:"></asp:Label>
                                <br />
                                <asp:TextBox ID="PerspectivaTextBox" runat="server" 
                                    Text='<%# Bind("Perspectiva") %>' CssClass="InputCad" Height="100px" 
                                    TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label19" runat="server" Text="Idade de:"></asp:Label>
                                <br />
                                <asp:TextBox ID="FaixaEtariaInicioTextBox" runat="server" 
                                    Text='<%# Bind("FaixaEtariaInicio") %>' CssClass="InputCad" Width="80px" />
                                <br />
                                <asp:Label ID="Label20" runat="server" Text="Idade até:"></asp:Label>
                                <br />
                                <asp:TextBox ID="FaixaEtariaFimTextBox" runat="server" 
                                    Text='<%# Bind("FaixaEtariaFim") %>' CssClass="InputCad" Width="80px" />
                                <br />
                                <br />
                                <asp:RadioButtonList ID="RadioButtonListSexo" runat="server" 
                                    RepeatDirection="Horizontal" SelectedValue='<%# Bind("Sexo") %>'>
                                    <asp:ListItem Value="M">Masculino</asp:ListItem>
                                    <asp:ListItem Value="F">Feminino</asp:ListItem>
                                    <asp:ListItem Value="I">Indiferente</asp:ListItem>
                                </asp:RadioButtonList>
                                <br />
                                <asp:Label ID="Label21" runat="server" Text="Conhecimento no(s) Idioma(s):"></asp:Label>
                                <br />
                                <asp:TextBox ID="ConhecimentoIdiomaTextBox" runat="server" 
                                    Text='<%# Bind("ConhecimentoIdioma") %>' CssClass="InputCad" Height="80px" 
                                    TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label22" runat="server" Text="Perfil Composicao da Equipe:"></asp:Label>
                                <br />
                                <asp:TextBox ID="PerfilComposicaoEquipeTextBox" runat="server" 
                                    Text='<%# Bind("PerfilComposicaoEquipe") %>' CssClass="InputCad" 
                                    Height="50px" TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label23" runat="server" Text="Cursos Específicos:"></asp:Label>
                                <br />
                                <asp:TextBox ID="CursoEspecificoTextBox" runat="server" 
                                    Text='<%# Bind("CursoEspecifico") %>' CssClass="InputCad" Height="50px" 
                                    TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label24" runat="server" Text="Conhecimentos:"></asp:Label>
                                <br />
                                <asp:TextBox ID="ConhecimentoTextBox" runat="server" 
                                    Text='<%# Bind("Conhecimento") %>' CssClass="InputCad" Height="50px" 
                                    TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label25" runat="server" Text="Conhecimento(s) em Informatica:"></asp:Label>
                                <br />
                                <asp:TextBox ID="ConhecimentoInformaticaTextBox" runat="server" 
                                    Text='<%# Bind("ConhecimentoInformatica") %>' CssClass="InputCad" 
                                    Height="50px" TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label26" runat="server" Text="Competência Comportamental:"></asp:Label>
                                <br />
                                <asp:TextBox ID="CompetenciaComportamentalTextBox" runat="server" 
                                    Text='<%# Bind("CompetenciaComportamental") %>' CssClass="InputCad" 
                                    Height="50px" TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label27" runat="server" Text="Competência Profissional:"></asp:Label>
                                <br />
                                <asp:TextBox ID="CompetenciaProfissionalTextBox" runat="server" 
                                    Text='<%# Bind("CompetenciaProfissional") %>' CssClass="InputCad" 
                                    Height="50px" TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label28" runat="server" Text="Aspectos Criticos:"></asp:Label>
                                <br />
                                <asp:TextBox ID="AspectoCriticoTextBox" runat="server" 
                                    Text='<%# Bind("AspectoCritico") %>' CssClass="InputCad" Height="50px" 
                                    TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label29" runat="server" Text="Principal Desafio:"></asp:Label>
                                <br />
                                <asp:TextBox ID="PrincipalDesafioTextBox" runat="server" 
                                    Text='<%# Bind("PrincipalDesafio") %>' CssClass="InputCad" Height="50px" 
                                    TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label30" runat="server" Text="Relacionamento Interno:"></asp:Label>
                                <br />
                                <asp:TextBox ID="RelacionamentoInternoTextBox" runat="server" 
                                    Text='<%# Bind("RelacionamentoInterno") %>' CssClass="InputCad" 
                                    Height="50px" TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label31" runat="server" Text="Relacionamento Externo:"></asp:Label>
                                <br />
                                <asp:TextBox ID="RelacionamentoExternoTextBox" runat="server" 
                                    Text='<%# Bind("RelacionamentoExterno") %>' CssClass="InputCad" 
                                    Height="50px" TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label32" runat="server" Text="Viagens:"></asp:Label>
                                <br />
                                <asp:TextBox ID="viagensTextBox" runat="server" Text='<%# Bind("viagens") %>' 
                                    CssClass="InputCad" Height="50px" TextMode="MultiLine" />
                                <br />
                                <asp:Label ID="Label33" runat="server" Text="Descritivo das viagens:"></asp:Label>
                                <br />
                                <asp:TextBox ID="infoSobre_viagensTextBox" runat="server" 
                                    Text='<%# Bind("infoSobre_viagens") %>' CssClass="InputCad" Height="50px" 
                                    TextMode="MultiLine" />
                                <br />
                                <br />
                                <asp:CheckBox ID="confidencialCheckBox" runat="server" 
                                    Checked='<%# Bind("confidencial") %>' Text="Vaga confidencial:" />
                                <br />
                                <br />
                                <asp:Label ID="Label34" runat="server" Text="Estrutura Organizacional:"></asp:Label>
                                <br />
                                <asp:TextBox ID="EstruturaOrganizacionalTextBox" runat="server" 
                                    Text='<%# Bind("EstruturaOrganizacional") %>' CssClass="InputCad" 
                                    Height="50px" TextMode="MultiLine" />
                                <br />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                    CommandName="Insert" Text="Salvar modelo" />
                                &nbsp;|
                                <asp:LinkButton ID="InsertCancelButton" runat="server" 
                                    CausesValidation="False" CommandName="Cancel" Text="Cancelar (Limpar)" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                idPerfilVagaFill:
                                <asp:Label ID="idPerfilVagaFillLabel" runat="server" 
                                    Text='<%# Eval("idPerfilVagaFill") %>' />
                                <br />
                                idCadastroEmpresa:
                                <asp:Label ID="idCadastroEmpresaLabel" runat="server" 
                                    Text='<%# Bind("idCadastroEmpresa") %>' />
                                <br />
                                idCadastroEmpresa_Filha:
                                <asp:Label ID="idCadastroEmpresa_FilhaLabel" runat="server" 
                                    Text='<%# Bind("idCadastroEmpresa_Filha") %>' />
                                <br />
                                idstatusvaga:
                                <asp:Label ID="idstatusvagaLabel" runat="server" 
                                    Text='<%# Bind("idstatusvaga") %>' />
                                <br />
                                idTipoFormacao:
                                <asp:Label ID="idTipoFormacaoLabel" runat="server" 
                                    Text='<%# Bind("idTipoFormacao") %>' />
                                <br />
                                FormacaoAcademica:
                                <asp:Label ID="FormacaoAcademicaLabel" runat="server" 
                                    Text='<%# Bind("FormacaoAcademica") %>' />
                                <br />
                                dsPerfilVaga:
                                <asp:Label ID="dsPerfilVagaLabel" runat="server" 
                                    Text='<%# Bind("dsPerfilVaga") %>' />
                                <br />
                                Cargo:
                                <asp:Label ID="CargoLabel" runat="server" Text='<%# Bind("Cargo") %>' />
                                <br />
                                nrovaga:
                                <asp:Label ID="nrovagaLabel" runat="server" Text='<%# Bind("nrovaga") %>' />
                                <br />
                                TipoOportunidade:
                                <asp:Label ID="TipoOportunidadeLabel" runat="server" 
                                    Text='<%# Bind("TipoOportunidade") %>' />
                                <br />
                                QualificacaoHabilidadesEspecificas:
                                <asp:Label ID="QualificacaoHabilidadesEspecificasLabel" runat="server" 
                                    Text='<%# Bind("QualificacaoHabilidadesEspecificas") %>' />
                                <br />
                                Remuneracao:
                                <asp:Label ID="RemuneracaoLabel" runat="server" 
                                    Text='<%# Bind("Remuneracao") %>' />
                                <br />
                                RemuneracaoVariavel:
                                <asp:Label ID="RemuneracaoVariavelLabel" runat="server" 
                                    Text='<%# Bind("RemuneracaoVariavel") %>' />
                                <br />
                                Honorario:
                                <asp:Label ID="HonorarioLabel" runat="server" Text='<%# Bind("Honorario") %>' />
                                <br />
                                LocalTrabalho:
                                <asp:Label ID="LocalTrabalhoLabel" runat="server" 
                                    Text='<%# Bind("LocalTrabalho") %>' />
                                <br />
                                UF:
                                <asp:Label ID="UFLabel" runat="server" Text='<%# Bind("UF") %>' />
                                <br />
                                ObsComplementares:
                                <asp:Label ID="ObsComplementaresLabel" runat="server" 
                                    Text='<%# Bind("ObsComplementares") %>' />
                                <br />
                                PerfilGestor:
                                <asp:Label ID="PerfilGestorLabel" runat="server" 
                                    Text='<%# Bind("PerfilGestor") %>' />
                                <br />
                                Beneficios:
                                <asp:Label ID="BeneficiosLabel" runat="server" 
                                    Text='<%# Bind("Beneficios") %>' />
                                <br />
                                Perspectiva:
                                <asp:Label ID="PerspectivaLabel" runat="server" 
                                    Text='<%# Bind("Perspectiva") %>' />
                                <br />
                                FaixaEtariaInicio:
                                <asp:Label ID="FaixaEtariaInicioLabel" runat="server" 
                                    Text='<%# Bind("FaixaEtariaInicio") %>' />
                                <br />
                                FaixaEtariaFim:
                                <asp:Label ID="FaixaEtariaFimLabel" runat="server" 
                                    Text='<%# Bind("FaixaEtariaFim") %>' />
                                <br />
                                Sexo:
                                <asp:Label ID="SexoLabel" runat="server" Text='<%# Bind("Sexo") %>' />
                                <br />
                                ConhecimentoIdioma:
                                <asp:Label ID="ConhecimentoIdiomaLabel" runat="server" 
                                    Text='<%# Bind("ConhecimentoIdioma") %>' />
                                <br />
                                PerfilComposicaoEquipe:
                                <asp:Label ID="PerfilComposicaoEquipeLabel" runat="server" 
                                    Text='<%# Bind("PerfilComposicaoEquipe") %>' />
                                <br />
                                CursoEspecifico:
                                <asp:Label ID="CursoEspecificoLabel" runat="server" 
                                    Text='<%# Bind("CursoEspecifico") %>' />
                                <br />
                                Conhecimento:
                                <asp:Label ID="ConhecimentoLabel" runat="server" 
                                    Text='<%# Bind("Conhecimento") %>' />
                                <br />
                                ConhecimentoInformatica:
                                <asp:Label ID="ConhecimentoInformaticaLabel" runat="server" 
                                    Text='<%# Bind("ConhecimentoInformatica") %>' />
                                <br />
                                CompetenciaComportamental:
                                <asp:Label ID="CompetenciaComportamentalLabel" runat="server" 
                                    Text='<%# Bind("CompetenciaComportamental") %>' />
                                <br />
                                CompetenciaProfissional:
                                <asp:Label ID="CompetenciaProfissionalLabel" runat="server" 
                                    Text='<%# Bind("CompetenciaProfissional") %>' />
                                <br />
                                AspectoCritico:
                                <asp:Label ID="AspectoCriticoLabel" runat="server" 
                                    Text='<%# Bind("AspectoCritico") %>' />
                                <br />
                                PrincipalDesafio:
                                <asp:Label ID="PrincipalDesafioLabel" runat="server" 
                                    Text='<%# Bind("PrincipalDesafio") %>' />
                                <br />
                                RelacionamentoInterno:
                                <asp:Label ID="RelacionamentoInternoLabel" runat="server" 
                                    Text='<%# Bind("RelacionamentoInterno") %>' />
                                <br />
                                RelacionamentoExterno:
                                <asp:Label ID="RelacionamentoExternoLabel" runat="server" 
                                    Text='<%# Bind("RelacionamentoExterno") %>' />
                                <br />
                                viagens:
                                <asp:Label ID="viagensLabel" runat="server" Text='<%# Bind("viagens") %>' />
                                <br />
                                infoSobre_viagens:
                                <asp:Label ID="infoSobre_viagensLabel" runat="server" 
                                    Text='<%# Bind("infoSobre_viagens") %>' />
                                <br />
                                confidencial:
                                <asp:CheckBox ID="confidencialCheckBox" runat="server" 
                                    Checked='<%# Bind("confidencial") %>' Enabled="false" />
                                <br />
                                EstruturaOrganizacional:
                                <asp:Label ID="EstruturaOrganizacionalLabel" runat="server" 
                                    Text='<%# Bind("EstruturaOrganizacional") %>' />
                                <br />
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Edit" />
                                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                    CommandName="Delete" Text="Delete" />
                                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                    CommandName="New" Text="New" />
                            </ItemTemplate>
                        </asp:FormView>
                    </td>
                </tr>
            </table>
                        
        <br />
                        
        <asp:Panel ID="PanelLevantamento" runat="server" Visible="False">
            <table ID="Fechar" align="center" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="right">
                        <asp:LinkButton ID="LinkButtonFechar" runat="server">[Fechar]</asp:LinkButton>
                    </td>
                </tr>
            </table>
            <asp:GridView ID="GridViewLevantamentoCad" runat="server" 
                AutoGenerateColumns="False" DataKeyNames="idPerfilVaga" 
                DataSourceID="SqlTodoLevantamento" GridLines="None" Width="100%">
                <AlternatingRowStyle BackColor="#F0F0F0" BorderStyle="None" />
                <Columns>
                    <asp:BoundField DataField="idPerfilVaga" HeaderText="idPerfilVaga" 
                        InsertVisible="False" ReadOnly="True" SortExpression="idPerfilVaga" 
                        Visible="False" />
                    <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" 
                        SortExpression="Protocolo" />
                    <asp:ButtonField CommandName="Select" DataTextField="Cargo" 
                        HeaderText="Levantamento" Text="Button" />
                    <asp:BoundField DataField="Cargo" HeaderText="Cargo" SortExpression="Cargo" 
                        Visible="False" />
                    <asp:CommandField SelectText="Copiar deste Levantamento" 
                        ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
                        
        <asp:SqlDataSource ID="SqlMODELO" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="SELECT [idPerfilVagaFill], [dsPerfilVaga], [idCadastroEmpresa] FROM [_tbPerfilVagaModelo] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
            <SelectParameters>
                <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
                        
        <asp:SqlDataSource ID="SqlMODELOFORM" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            
            SelectCommand="SELECT [idPerfilVagaFill], [idCadastroEmpresa], [idCadastroEmpresa_Filha], [idstatusvaga], [idTipoFormacao], [FormacaoAcademica], [dsPerfilVaga], [Cargo], [nrovaga], [TipoOportunidade], [QualificacaoHabilidadesEspecificas], [Remuneracao], [RemuneracaoVariavel], [Honorario], [LocalTrabalho], [UF], [ObsComplementares], [PerfilGestor], [Beneficios], [Perspectiva], [FaixaEtariaInicio], [FaixaEtariaFim], [Sexo], [ConhecimentoIdioma], [PerfilComposicaoEquipe], [CursoEspecifico], [Conhecimento], [ConhecimentoInformatica], [CompetenciaComportamental], [CompetenciaProfissional], [AspectoCritico], [PrincipalDesafio], [RelacionamentoInterno], [RelacionamentoExterno], [viagens], [infoSobre_viagens], [confidencial], [EstruturaOrganizacional] FROM [_tbPerfilVagaModelo] WHERE ([idPerfilVagaFill] = @idPerfilVagaFill)" 
            DeleteCommand="DELETE FROM [_tbPerfilVagaModelo] WHERE [idPerfilVagaFill] = @idPerfilVagaFill" 
            InsertCommand="INSERT INTO _tbPerfilVagaModelo(idCadastroEmpresa, idCadastroEmpresa_Filha, idstatusvaga, idTipoFormacao, FormacaoAcademica, dsPerfilVaga, Cargo, nrovaga, TipoOportunidade, QualificacaoHabilidadesEspecificas, Remuneracao, RemuneracaoVariavel, Honorario, LocalTrabalho, UF, ObsComplementares, PerfilGestor, Beneficios, Perspectiva, FaixaEtariaInicio, FaixaEtariaFim, Sexo, ConhecimentoIdioma, PerfilComposicaoEquipe, CursoEspecifico, Conhecimento, ConhecimentoInformatica, CompetenciaComportamental, CompetenciaProfissional, AspectoCritico, PrincipalDesafio, RelacionamentoInterno, RelacionamentoExterno, viagens, infoSobre_viagens, confidencial, EstruturaOrganizacional, perfil_vaga_aprovado_comentario) VALUES (@idCadastroEmpresa, @idCadastroEmpresa_Filha, @idstatusvaga, @idTipoFormacao, @FormacaoAcademica, @dsPerfilVaga, @Cargo, @nrovaga, @TipoOportunidade, @QualificacaoHabilidadesEspecificas, @Remuneracao, @RemuneracaoVariavel, @Honorario, @LocalTrabalho, @UF, @ObsComplementares, @PerfilGestor, @Beneficios, @Perspectiva, @FaixaEtariaInicio, @FaixaEtariaFim, @Sexo, @ConhecimentoIdioma, @PerfilComposicaoEquipe, @CursoEspecifico, @Conhecimento, @ConhecimentoInformatica, @CompetenciaComportamental, @CompetenciaProfissional, @AspectoCritico, @PrincipalDesafio, @RelacionamentoInterno, @RelacionamentoExterno, @viagens, @infoSobre_viagens, @confidencial, @EstruturaOrganizacional, @perfil_vaga_aprovado_comentario)" 
            
            UpdateCommand="UPDATE [_tbPerfilVagaModelo] SET [idCadastroEmpresa] = @idCadastroEmpresa, [idCadastroEmpresa_Filha] = @idCadastroEmpresa_Filha, [idstatusvaga] = @idstatusvaga, [idTipoFormacao] = @idTipoFormacao, [FormacaoAcademica] = @FormacaoAcademica, [dsPerfilVaga] = @dsPerfilVaga, [Cargo] = @Cargo, [nrovaga] = @nrovaga, [TipoOportunidade] = @TipoOportunidade, [QualificacaoHabilidadesEspecificas] = @QualificacaoHabilidadesEspecificas, [Remuneracao] = @Remuneracao, [RemuneracaoVariavel] = @RemuneracaoVariavel, [Honorario] = @Honorario, [LocalTrabalho] = @LocalTrabalho, [UF] = @UF, [ObsComplementares] = @ObsComplementares, [PerfilGestor] = @PerfilGestor, [Beneficios] = @Beneficios, [Perspectiva] = @Perspectiva, [FaixaEtariaInicio] = @FaixaEtariaInicio, [FaixaEtariaFim] = @FaixaEtariaFim, [Sexo] = @Sexo, [ConhecimentoIdioma] = @ConhecimentoIdioma, [PerfilComposicaoEquipe] = @PerfilComposicaoEquipe, [CursoEspecifico] = @CursoEspecifico, [Conhecimento] = @Conhecimento, [ConhecimentoInformatica] = @ConhecimentoInformatica, [CompetenciaComportamental] = @CompetenciaComportamental, [CompetenciaProfissional] = @CompetenciaProfissional, [AspectoCritico] = @AspectoCritico, [PrincipalDesafio] = @PrincipalDesafio, [RelacionamentoInterno] = @RelacionamentoInterno, [RelacionamentoExterno] = @RelacionamentoExterno, [viagens] = @viagens, [infoSobre_viagens] = @infoSobre_viagens, [confidencial] = @confidencial, [EstruturaOrganizacional] = @EstruturaOrganizacional WHERE [idPerfilVagaFill] = @idPerfilVagaFill">
            <DeleteParameters>
                <asp:Parameter Name="idPerfilVagaFill" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                <asp:Parameter Name="idCadastroEmpresa_Filha" Type="Int32" />
                <asp:Parameter Name="idstatusvaga" Type="String" />
                <asp:Parameter Name="idTipoFormacao" Type="Int32" />
                <asp:Parameter Name="FormacaoAcademica" Type="String" />
                <asp:Parameter Name="dsPerfilVaga" Type="String" />
                <asp:Parameter Name="Cargo" Type="String" />
                <asp:Parameter Name="nrovaga" Type="Int32" />
                <asp:Parameter Name="TipoOportunidade" Type="String" />
                <asp:Parameter Name="QualificacaoHabilidadesEspecificas" Type="String" />
                <asp:Parameter Name="Remuneracao" Type="Decimal" />
                <asp:Parameter Name="RemuneracaoVariavel" Type="Decimal" />
                <asp:Parameter Name="Honorario" Type="Decimal" />
                <asp:Parameter Name="LocalTrabalho" Type="String" />
                <asp:Parameter Name="UF" Type="String" />
                <asp:Parameter Name="ObsComplementares" Type="String" />
                <asp:Parameter Name="PerfilGestor" Type="String" />
                <asp:Parameter Name="Beneficios" Type="String" />
                <asp:Parameter Name="Perspectiva" Type="String" />
                <asp:Parameter Name="FaixaEtariaInicio" Type="Int32" />
                <asp:Parameter Name="FaixaEtariaFim" Type="Int32" />
                <asp:Parameter Name="Sexo" Type="String" />
                <asp:Parameter Name="ConhecimentoIdioma" Type="String" />
                <asp:Parameter Name="PerfilComposicaoEquipe" Type="String" />
                <asp:Parameter Name="CursoEspecifico" Type="String" />
                <asp:Parameter Name="Conhecimento" Type="String" />
                <asp:Parameter Name="ConhecimentoInformatica" Type="String" />
                <asp:Parameter Name="CompetenciaComportamental" Type="String" />
                <asp:Parameter Name="CompetenciaProfissional" Type="String" />
                <asp:Parameter Name="AspectoCritico" Type="String" />
                <asp:Parameter Name="PrincipalDesafio" Type="String" />
                <asp:Parameter Name="RelacionamentoInterno" Type="String" />
                <asp:Parameter Name="RelacionamentoExterno" Type="String" />
                <asp:Parameter Name="viagens" Type="String" />
                <asp:Parameter Name="infoSobre_viagens" Type="String" />
                <asp:Parameter Name="confidencial" Type="Boolean" />
                <asp:Parameter Name="EstruturaOrganizacional" Type="String" />
                <asp:Parameter Name="perfil_vaga_aprovado_comentario" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="idPerfilVagaFillLabel" Name="idPerfilVagaFill" 
                    PropertyName="Text" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                <asp:Parameter Name="idCadastroEmpresa_Filha" Type="Int32" />
                <asp:Parameter Name="idstatusvaga" Type="String" />
                <asp:Parameter Name="idTipoFormacao" Type="Int32" />
                <asp:Parameter Name="FormacaoAcademica" Type="String" />
                <asp:Parameter Name="dsPerfilVaga" Type="String" />
                <asp:Parameter Name="Cargo" Type="String" />
                <asp:Parameter Name="nrovaga" Type="Int32" />
                <asp:Parameter Name="TipoOportunidade" Type="String" />
                <asp:Parameter Name="QualificacaoHabilidadesEspecificas" Type="String" />
                <asp:Parameter Name="Remuneracao" Type="Decimal" />
                <asp:Parameter Name="RemuneracaoVariavel" Type="Decimal" />
                <asp:Parameter Name="Honorario" Type="Decimal" />
                <asp:Parameter Name="LocalTrabalho" Type="String" />
                <asp:Parameter Name="UF" Type="String" />
                <asp:Parameter Name="ObsComplementares" Type="String" />
                <asp:Parameter Name="PerfilGestor" Type="String" />
                <asp:Parameter Name="Beneficios" Type="String" />
                <asp:Parameter Name="Perspectiva" Type="String" />
                <asp:Parameter Name="FaixaEtariaInicio" Type="Int32" />
                <asp:Parameter Name="FaixaEtariaFim" Type="Int32" />
                <asp:Parameter Name="Sexo" Type="String" />
                <asp:Parameter Name="ConhecimentoIdioma" Type="String" />
                <asp:Parameter Name="PerfilComposicaoEquipe" Type="String" />
                <asp:Parameter Name="CursoEspecifico" Type="String" />
                <asp:Parameter Name="Conhecimento" Type="String" />
                <asp:Parameter Name="ConhecimentoInformatica" Type="String" />
                <asp:Parameter Name="CompetenciaComportamental" Type="String" />
                <asp:Parameter Name="CompetenciaProfissional" Type="String" />
                <asp:Parameter Name="AspectoCritico" Type="String" />
                <asp:Parameter Name="PrincipalDesafio" Type="String" />
                <asp:Parameter Name="RelacionamentoInterno" Type="String" />
                <asp:Parameter Name="RelacionamentoExterno" Type="String" />
                <asp:Parameter Name="viagens" Type="String" />
                <asp:Parameter Name="infoSobre_viagens" Type="String" />
                <asp:Parameter Name="confidencial" Type="Boolean" />
                <asp:Parameter Name="EstruturaOrganizacional" Type="String" />
                <asp:Parameter Name="idPerfilVagaFill" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataTipoFormacao" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idTipoFormacao], [dsTipoFormacao] FROM [tbTipoFormacao]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlTipoVaga" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idTipoVaga], [idSetup], [dsTipoVAga] FROM [tbTipoVaga] WHERE ([idSetup] = @idSetup)">
        <SelectParameters>
            <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlUF" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [uf], [dsuf] FROM [tbuf]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlTodoLevantamento" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="SELECT [idPerfilVaga], [Protocolo], [dsPerfilVaga], [Cargo] FROM [_tbPerfilVaga] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
            <SelectParameters>
                <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    <br />
</asp:Content>

