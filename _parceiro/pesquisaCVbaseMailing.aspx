﻿<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiro/parceiroPage.master" AutoEventWireup="false" CodeFile="pesquisaCVbaseMailing.aspx.vb" Inherits="_parceiro_pesquisaCVbaseMailing
" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <br />
    <table id="NAVEGADOR1" align="center" bgcolor="#F3F3F3" cellpadding="0" 
                                    cellspacing="0" width="930px">
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" id="NAVEGADOR2">
                                    <tr>
                                        <td>
                                            <asp:Label ID="PPLabelNomeEmpresa" runat="server" 
                                                            CssClass="bannerNavegadorInternoNomeEmpresa" 
                                                Text="Menu:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Image ID="Image2" runat="server" 
                                                            ImageUrl="~/_corporativo/images/holomatica/navegadorIndicador.png" />
                                        </td>
                                        <td>
                                        <a href="pesquisaCVBase.aspx?menu=4">Pesquisa de Curriculos</a>
                                        </td>
                                        <td>
                                            <asp:Label ID="separadorLabel5" runat="server" Text="&nbsp;&nbsp;|&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td>
                                            <a href="pesquisaCVBaseMailing.aspx?menu=4">Pesquisa de Curriculos (Mailing)</a>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
    <h1><asp:Label ID="Label2" runat="server" Text="Pesquisa de Curriculos (Mailing)"></asp:Label></h1>
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26">&nbsp;</td>
                <td width="614"><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label></td>
            </tr>
        </table>
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26">
                </td>
                <td width="614"></td>
            </tr>
            <tr>
                <td width="26">
                </td>
                <td width="614">
                    <strong>ATENÇÃO:</strong> Serão apresentados apenas os curriculos que os candidatos disponibilizaram para pesquisa. Não estando em conformidade com a quantidade total de cadastrados.
                </td>
            </tr>
            <tr>
                <td width="26">
                </td>
                <td width="614"></td>
            </tr>
        </table>
<table width="640" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26"><asp:Image ID="lateral0" runat="server" 
                    ImageUrl="~/images/h26.gif" /></td>
            <td width="614">
                    <table ID="tbFiltros" cellpadding="2" cellspacing="0" width="100%">
                        <tr>
                            <td width="100%">
                                <asp:Label ID="idFiltroDinamicoMontadorLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idProcessoSeletivoLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idRH_GestorLabel" runat="server" Visible="False"></asp:Label>
                                <br />
                                <asp:GridView ID="GridViewFiltro" runat="server" AutoGenerateColumns="False" 
                                    BorderColor="Gray" BorderStyle="Dotted" BorderWidth="1px" 
                                    DataKeyNames="idFiltroDinamicoMontador,idRH_Gestor" 
                                    DataSourceID="SqlMontaFiltroPesquisa" Width="100%" ShowFooter="True">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                    CommandName="Select" Text="Editar Filtro"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="idFiltroDinamicoXML_Liberado" 
                                            HeaderText="idFiltroDinamicoXML_Liberado" InsertVisible="False" ReadOnly="True" 
                                            SortExpression="idFiltroDinamicoXML_Liberado" Visible="False" />
                                        <asp:BoundField DataField="idSetup" HeaderText="idSetup" 
                                            SortExpression="idSetup" Visible="False" />
                                        <asp:TemplateField HeaderText="Filtro" SortExpression="dsFiltroDinamico">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("dsFiltroDinamico") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" 
                                                    Text='<%# Bind("dsFiltroDinamico") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="refTabela" HeaderText="refTabela" 
                                            SortExpression="refTabela" Visible="False" />
                                        <asp:BoundField DataField="dataPublicacao" HeaderText="dataPublicacao" 
                                            SortExpression="dataPublicacao" Visible="False" />
                                        <asp:BoundField DataField="idProcessoSeletivo" HeaderText="idProcessoSeletivo" 
                                            SortExpression="idProcessoSeletivo" Visible="False" />
                                        <asp:BoundField DataField="field" HeaderText="field" SortExpression="field" 
                                            Visible="False" />
                                        <asp:BoundField DataField="value" HeaderText="O que será filtrado" 
                                            SortExpression="value" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <table cellpadding="10" cellspacing="10" width="100%">
                                            <tr>
                                                <td>
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                <asp:Image ID="ImageAviso" runat="server" 
                                                                    ImageUrl="~/images/empresa/aviso.png" />
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label51" runat="server" 
                                                                    Text="&lt;b&gt;Dica:&lt;/b&gt;&lt;br&gt;Para iniciar uma Pesquisa de Candidatos será necessário informar quais os parâmetros da pesquisa. Após informar todos os parâmetos desejados é só clicar em [&lt;b&gt;Pesquisar base com as informações acima&lt;/b&gt;].&lt;br&gt;&lt;br&gt;&lt;b&gt;Obs.:&lt;/b&gt;&lt;br&gt;&lt;i&gt;Esta pesquisa não está ligada a nenhuma fase de um processo seletivo&lt;/i&gt;."></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                                <table id="GravaXML" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td align="left">
                                <asp:FormView ID="FormViewFiltro" runat="server" 
                                    DataKeyNames="idFiltroDinamicoMontador" DataSourceID="SqlFiltro" 
                                    Width="100%">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="idRH_GestorTextBox" runat="server" 
                                            Text='<%# Bind("idRH_Gestor") %>' Visible="False" Width="5px" />
                                        <br />
                                        <asp:Label ID="Label2" runat="server" Text="Escola um dos filtro dinâmico:"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="DropDownListField" runat="server" CssClass="DropCad" 
                                            DataSourceID="SqlFiltrosLiberados" DataTextField="dsFiltroDinamico" 
                                            DataValueField="refTabela" SelectedValue='<%# Bind("field") %>'>
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text="O que pesquisar?"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="valueTextBox" ErrorMessage="* Informe o que pesquisar">*</asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="valueTextBox" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("value") %>' />
                                        <br />
                                        <asp:Label ID="Label48" runat="server" Text="Nível:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="nivelTextBox" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("nivel") %>'></asp:TextBox>
                                        <br />
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                            ShowMessageBox="True" />
                                        <asp:LinkButton ID="ImageButton4" runat="server" CommandName="Update" 
                                            Text="Criar o cadastro deste cliente" CssClass="button" />
                                        <asp:LinkButton ID="ImageButton5" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="Cancelar" CssClass="button" />
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        <asp:LinkButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                            CommandName="New" Text="Incluir filtro para pesquisa" CssClass="button" />
                                    </EmptyDataTemplate>
                                    <InsertItemTemplate>
                                        <br />
                                        <asp:Label ID="Label2" runat="server" Text="Escola um dos filtro dinâmico:"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="DropDownListField" runat="server" CssClass="DropCad" 
                                            DataSourceID="SqlFiltrosLiberados" DataTextField="dsFiltroDinamico" 
                                            DataValueField="refTabela" SelectedValue='<%# Bind("field") %>'>
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text="O que pesquisar?"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="valueTextBox" ErrorMessage="* Informe o que pesquisar">*</asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="valueTextBox" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("value") %>' />
                                        <br />
                                        <asp:Label ID="Label48" runat="server" Text="Nível:"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="nivelTextBox" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("nivel") %>'></asp:TextBox>
                                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                                            ShowMessageBox="True" ShowSummary="False" />
                                        <br />
                                        <asp:LinkButton ID="ImageButton3" runat="server" CommandName="Insert" 
                                            Text="Criar o cadastro deste cliente" CssClass="button" />
                                        &nbsp;<asp:LinkButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="Cancelar" CssClass="button" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" 
                                            Text="Você selecionou para edição o filtro:"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="valueLabel" runat="server" CssClass="msnOK" 
                                            Text='<%# Bind("value") %>' />
                                        <br />
                                        <br />
                                        <asp:LinkButton ID="ImageButton8" runat="server" CausesValidation="False" 
                                            CommandName="Edit" Text="Alterar" CssClass="button" />
                                        &nbsp;<asp:LinkButton ID="ImageButton6" runat="server" CausesValidation="False" 
                                            CommandName="Delete" Text="Excluir" CssClass="button" />
                                        <asp:LinkButton ID="ImageButton7" runat="server" CausesValidation="False" 
                                            CommandName="New" Text="Incluir filtro para pesquisa" CssClass="button" />
                                    </ItemTemplate>
                                </asp:FormView>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:LinkButton ID="ImageButtonPSQ" runat="server" 
                                    Text="Pesquisar" CssClass="button" />
                                <br />
                                <br />
                            <asp:Panel ID="PanelApresentaRes" runat="server" Visible="False">
                                <table ID="Res" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="80%">
                                            <asp:GridView ID="GridViewResPesquisa" runat="server" 
                                                AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="Dotted" 
                                                BorderWidth="1px" DataKeyNames="idcurriculo,idUser" Width="100%">
                                                <AlternatingRowStyle BackColor="#EBEBEB" />
                                                <Columns>
                                                    <asp:ButtonField ButtonType="Image" CommandName="Select" 
                                                        ImageUrl="~/images/candidato/bvcv.png" Text="CV" ShowHeader="True" HeaderText="CV" />
                                                    <asp:BoundField DataField="idcurriculo" Visible="False" />
                                                    <asp:BoundField DataField="idUser" Visible="False" />
                                                    <asp:BoundField DataField="nome" HeaderText="Nome" />
                                                    <asp:BoundField DataField="email" HeaderText="Email" />
                                                    <asp:BoundField DataField="bairro" HeaderText="Bairro" />
                                                    <asp:BoundField DataField="cidade" HeaderText="Cidade" />
                                                    <asp:BoundField DataField="uf" HeaderText="Estado" />
                                                    <asp:BoundField DataField="idade" HeaderText="Idade" />
                                                    <asp:BoundField DataField="idTipoTelefone" HeaderText="Tipo de Telefone" />
                                                    <asp:BoundField DataField="telefone" HeaderText="Telefone" />
                                                    <asp:BoundField DataField="UltimaEmpresa" HeaderText="Ultima Experiencia" />
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                        <td valign="top">
                                            <asp:ImageButton ID="ImageButtonClose" runat="server" 
                                                ImageUrl="~/images/close.png" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </asp:Panel>
                                <asp:Label ID="idUserLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idcurriculoLabel" runat="server" Visible="False"></asp:Label>
                                <br />
                                <asp:Label ID="Passo1Label0" runat="server" CssClass="tituloEmp" 
                                    Text="Passo 2 (dois) - Editar ou Incluir os filtros dinâmicos:" Visible="False"></asp:Label>
                                <br />
                                <table id="IncluirFiltro" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td align="left">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <br />
                                 <br />
                    <asp:SqlDataSource ID="SqlFiltro" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        DeleteCommand="DELETE FROM [tbFiltroDinamicoXMLMontador_Consultor] WHERE [idFiltroDinamicoMontador] = @idFiltroDinamicoMontador" 
                        InsertCommand="INSERT INTO [tbFiltroDinamicoXMLMontador_Consultor] ([idRH_Gestor], [field], [value], [nivel]) VALUES (@idRH_Gestor, @field, @value, @nivel)" 
                        SelectCommand="SELECT [idFiltroDinamicoMontador], [idRH_Gestor], [field], [value], [nivel] FROM [tbFiltroDinamicoXMLMontador_Consultor] WHERE ([idFiltroDinamicoMontador] = @idFiltroDinamicoMontador)" 
                        
                        
                        
                        UpdateCommand="UPDATE [tbFiltroDinamicoXMLMontador_Consultor] SET [idRH_Gestor] = @idRH_Gestor, [field] = @field, [value] = @value, [nivel] = @nivel WHERE [idFiltroDinamicoMontador] = @idFiltroDinamicoMontador">
                        <DeleteParameters>
                            <asp:Parameter Name="idFiltroDinamicoMontador" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="idRH_Gestor" Type="Int32" />
                            <asp:Parameter Name="field" Type="String" />
                            <asp:Parameter Name="value" Type="String" />
                            <asp:Parameter Name="nivel" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="idFiltroDinamicoMontadorLabel" 
                                Name="idFiltroDinamicoMontador" PropertyName="Text" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="idRH_Gestor" Type="Int32" />
                            <asp:Parameter Name="field" Type="String" />
                            <asp:Parameter Name="value" Type="String" />
                            <asp:Parameter Name="nivel" Type="String" />
                            <asp:Parameter Name="idFiltroDinamicoMontador" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlEmpresa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT idCadastroEmpresa, nmempresa, idCadastroEmpresa_Pai FROM tbCadastroEmpresa WHERE (idCadastroEmpresa_Pai = @idCadastroEmpresa_Pai) OR (idCadastroEmpresa = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa_Pai" 
                SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:SessionParameter Name="idCadastroEmpresa" 
                SessionField="idCadastroEmpresaFilha" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlVaga" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
                    
                    SelectCommand="_USP_PROCESSOSELETIVO_DROPDOWNLIST_FASES" 
                    SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:ControlParameter ControlID="idCadastroEmpresaFilhaLabel" 
                Name="idCadastroEmpresa_Filha" PropertyName="Text" Type="Int32" />
            <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlMontaFiltroPesquisa" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="_USP_PROCESSOSELETIVO_FILTROS_MONTADOS_CONSULTOR" 
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" 
                                Type="Int32" />
                            <asp:SessionParameter Name="idSetup" SessionField="idSetup" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlFiltrosLiberados" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="SELECT [idFiltroDinamicoXML_Liberado], [idSetup], [dsFiltroDinamico], [refTabela], [dataPublicacao] FROM [tbFiltroDinamicoXML_Liberado]">
                    </asp:SqlDataSource>
                                 <br />
</td>
</tr>
</table>
        <br />
        <asp:Panel ID="PanelCV" runat="server" Visible="False" CssClass="CVPosition">
            <table cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="right">
                        <asp:ImageButton ID="ImageButtonPanel" runat="server" 
                            ImageUrl="~/images/fecharportifolio.gif" />
                    </td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" width="600">
                <tr>
                    <td width="600">
                        <table border="0" cellpadding="0" cellspacing="0" width="600">
                            <tr>
                                <td height="131" valign="top" width="135" align="right">
                                    <br />
                            <br />
                                    <asp:Image ID="ImageCV" runat="server" ImageUrl="~/images/cvnoImage.png" 
                                        Width="120px" />
                                    <asp:Image ID="ImageDef" runat="server" 
                                        ImageUrl="~/images/candidato/cv/deficienteT.gif" 
                                        ToolTip="Pessoa com necessidades especiais." Visible="False" />
                                </td>
                                <td valign="top" width="465">
                                    <asp:Image ID="Image1" runat="server" 
                                        ImageUrl="~/images/candidato/cv/titdadospessoais.gif" />
                                    <br />
                                    <table cellpadding="0" cellspacing="0" width="465">
                                        <tr>
                                            <td width="10" valign="top">
                                                &nbsp;</td>
                                            <td width="439">
                                                <asp:DataList ID="DataList1" runat="server" DataKeyField="idCadastroUser" 
                                                    DataSourceID="SqlDataSource1" Width="420px">
                                                    <ItemTemplate>
                                                        <table ID="DadosINT" cellpadding="5" cellspacing="0" width="465">
                                                            <tr>
                                                                <td valign="top" width="439">
                                                                    <asp:Label ID="Label1" runat="server" CssClass="cur01st" Text="Nome:"></asp:Label>
                                                                    &nbsp;<br />
                                                                    <asp:Label ID="nomeLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("nome") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label2" runat="server" CssClass="cur01st" Text="Endereço: "></asp:Label>
                                                                    &nbsp;<br />
                                                                    <asp:Label ID="enderecoLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("endereco") %>'></asp:Label>
                                                                    &nbsp;<br />
                                                                    <asp:Label ID="bairroLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("bairro") %>'></asp:Label>
                                                                    -
                                                                    <asp:Label ID="cidadeLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("cidade") %>'></asp:Label>
                                                                    /
                                                                    <asp:Label ID="ufLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("uf") %>'></asp:Label>
                                                                    -
                                                                    <asp:Label ID="paisLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("pais") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label3" runat="server" CssClass="cur01st" Text="CEP: "></asp:Label>
                                                                    <asp:Label ID="cepLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("cep") %>'></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label5" runat="server" CssClass="cur01st" 
                                                                        Text="Data de nascimento:"></asp:Label>
                                                                    <asp:Label ID="nascimentoLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("nascimento", "{0:d}") %>'></asp:Label>
                                                                    &nbsp;<br />
                                                                    <asp:Label ID="Label6" runat="server" CssClass="cur01st" Text="Sexo: "></asp:Label>
                                                                    <asp:Label ID="sexoLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("sexo") %>'></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label7" runat="server" CssClass="cur01st" 
                                                                        Text="Area de Atuação: "></asp:Label>
                                                                    <asp:Label ID="areaAtuacaoLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("areaAtuacao") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label17" runat="server" CssClass="cur01st" 
                                                                        Text="Email: "></asp:Label>
                                                                    <asp:Label ID="EmailLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("email") %>'></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label8" runat="server" CssClass="cur01st" Text="Estado civil: "></asp:Label>
                                                                    <asp:Label ID="estadocivilLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("estadocivil") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label9" runat="server" CssClass="cur01st" Text="Dependente(s): "></asp:Label>
                                                                    <asp:Label ID="nrdependenteLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("nrdependente") %>'></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label10" runat="server" CssClass="cur01st" 
                                                                        Text="Resumo profissional:"></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="resumoLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("resumo") %>'></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label11" runat="server" CssClass="cur01st" 
                                                                        Text="Remuneração atual: "></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="valorRemAtualLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("valorRemAtual", "{0:C}") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label12" runat="server" CssClass="cur01st" 
                                                                        Text="Remuneração pretendida: "></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="valorRemPretendidaLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("valorRemPretendida", "{0:C}") %>'></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label13" runat="server" CssClass="cur01st" 
                                                                        Text="Deseja trabalhar em: "></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="localPreferenciaLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("localPreferencia") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label14" runat="server" CssClass="cur01st" 
                                                                        Text="Disponibilidade: "></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="disponibilidadeLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("disponibilidade") %>'></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label15" runat="server" CssClass="cur01st" Text="Origem: "></asp:Label>
                                                                    <asp:Label ID="origemLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("origem") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label16" runat="server" CssClass="cur01st" 
                                                                        Text="Data do cadastro: "></asp:Label>
                                                                    <asp:Label ID="dataLabel" runat="server" CssClass="cur01" 
                                                                        Text='<%# Eval("data") %>'></asp:Label>
                                                                    <asp:Label ID="portadorDefLabel" runat="server" 
                                                                        Text='<%# Eval("portadorDef") %>' Visible="False"></asp:Label>
                                                                    <asp:Label ID="trabalhandoLabel" runat="server" 
                                                                        Text='<%# Eval("trabalhando") %>' Visible="False">
                                                </asp:Label>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            </td>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                        <br />
                                                <asp:DataList ID="DataListSumario" runat="server" DataSourceID="SqlDataSource3">
                                                    <ItemTemplate>
                                                <br />
                                                <br />
                                                        <asp:Image ID="Image3" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/titobjetivo.gif" />
                                                        <br />
                                                        <asp:Label ID="Label17" runat="server" CssClass="cur01st" Text="Apresentacao:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="apresentacaoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("apresentacao") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label18" runat="server" CssClass="cur01st" Text="Realizações:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="realizacaoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("realizacao") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label19" runat="server" CssClass="cur01st" Text="Resumo:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="resumogeralLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("resumogeral") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label20" runat="server" CssClass="cur01st" Text="Objetivo:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="objetivoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("objetivo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                                <asp:DataList ID="DataList4" runat="server" DataKeyField="estado" 
                                                    DataSourceID="SqlDataSource4" ShowFooter="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="dsinstituicaoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsinstituicao") %>'></asp:Label>
                                                        <asp:Label ID="idcurriculoLabel" runat="server" 
                                                            Text='<%# Eval("idcurriculo") %>' Visible="False"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="estadoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("estado") %>'></asp:Label>
                                                        /
                                                        <asp:Label ID="ufLabel0" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("uf") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label21" runat="server" CssClass="cur01st" Text="Curso: "></asp:Label>
                                                        <asp:Label ID="dsCursoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsCurso") %>'></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label22" runat="server" CssClass="cur01st" Text="Observações:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="obsLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("obs") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label23" runat="server" CssClass="cur01st" Text="Início: "></asp:Label>
                                                        <asp:Label ID="data_iniLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("data_ini", "{0:d}") %>'></asp:Label>
                                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                        <asp:Label ID="Label24" runat="server" CssClass="cur01st" Text="Término: "></asp:Label>
                                                        <asp:Label ID="data_fimLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("data_fim", "{0:d}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                <br />
                                                <br />
                                                        <asp:Image ID="Image5" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/titformacao.gif" />
                                                    </HeaderTemplate>
                                                    <SeparatorTemplate>
                                                        <asp:Image ID="Image4" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/separador.gif" />
                                                    </SeparatorTemplate>
                                                </asp:DataList>
                                                <asp:DataList ID="DataList5" runat="server" DataSourceID="SqlDataSource5">
                                                    <ItemTemplate>
                                                        <asp:Label ID="InstituicaoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("Instituicao") %>'></asp:Label>
                                                        <asp:Label ID="idcurriculoLabel" runat="server" 
                                                            Text='<%# Eval("idcurriculo") %>' Visible="False"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label26" runat="server" CssClass="cur01st" Text="Curso:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="dsCursoLabel0" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsCurso") %>'></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label27" runat="server" CssClass="cur01st" Text="Observações:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="obsCursoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("obsCurso") %>'></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label28" runat="server" CssClass="cur01st" Text="Início: "></asp:Label>
                                                        <asp:Label ID="data_iniLabel0" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("data_ini", "{0:d}") %>'></asp:Label>
                                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                                        <asp:Label ID="Label29" runat="server" CssClass="cur01st" Text="Término: "></asp:Label>
                                                        <asp:Label ID="data_fimLabel0" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("data_fim", "{0:d}") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label30" runat="server" CssClass="cur01st" Text="Concluído: "></asp:Label>
                                                        <asp:Label ID="concluidoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("concluido") %>'></asp:Label>
                                                        <asp:Label ID="labelRES" runat="server" Text='<%# Eval("concluido") %>' 
                                                            Visible="False"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                <br />
                                                <br />
                                                        <asp:Image ID="Image6" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/titcursocomplementar.gif" />
                                                    </HeaderTemplate>
                                                    <SeparatorTemplate>
                                                        <asp:Image ID="Image7" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/separador.gif" />
                                                    </SeparatorTemplate>
                                                </asp:DataList>
                                                <asp:DataList ID="DataList6" runat="server" DataSourceID="SqlDataSource6" 
                                                    Width="440px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="dsTipoConhecimentoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsTipoConhecimento") %>'></asp:Label>
                                                        <asp:Label ID="idcurriculoLabel2" runat="server" 
                                                            Text='<%# Eval("idcurriculo") %>' Visible="False"></asp:Label>
                                                <br />
                                                        <asp:Label ID="dsTipoConhecimentoRelLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsTipoConhecimentoRel") %>'></asp:Label>
                                                <br />
                                                <br />
                                                        <asp:Label ID="dsGrauExperienciaLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsGrauExperiencia") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label32" runat="server" CssClass="cur01st" Text="Observações:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="obsLabel0" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("obs") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                <br />
                                                <br />
                                                        <asp:Image ID="Image8" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/titconhecimentoinfo.gif" />
                                                    </HeaderTemplate>
                                                    <SeparatorTemplate>
                                                        <asp:Image ID="Image9" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/separador.gif" />
                                                    </SeparatorTemplate>
                                                </asp:DataList>
                                                <asp:DataList ID="DataList7" runat="server" DataSourceID="SqlDataSource7" 
                                                    Width="440px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="nomeempresaLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("nomeempresa") %>'></asp:Label>
                                                        <asp:Label ID="idcurriculoLabel3" runat="server" 
                                                            Text='<%# Eval("idcurriculo") %>' Visible="False"></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label38" runat="server" CssClass="cur01st" Text="Experiência: "></asp:Label>
                                                        <br />
                                                        <asp:Label ID="dsexperienciaLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsexperiencia") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label33" runat="server" CssClass="cur01st" Text="Início: "></asp:Label>
                                                        <asp:Label ID="data_iniLabel1" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("data_ini", "{0:d}") %>'></asp:Label>
                                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                        <asp:Label ID="Label34" runat="server" CssClass="cur01st" Text="Término:  "></asp:Label>
                                                        <asp:Label ID="data_fimLabel1" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("data_fim", "{0:d}") %>'></asp:Label>
                                                <br />
                                                <br />
                                                        <asp:Label ID="Label35" runat="server" CssClass="cur01st" 
                                                            Text="Área de Atuacao:"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="dsAreaAtuacaoLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsAreaAtuacao") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label36" runat="server" CssClass="cur01st" 
                                                            Text="Relação trabalhista: "></asp:Label>
                                                        <asp:Label ID="dsRelacaoTrabalhistaLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsRelacaoTrabalhista") %>'></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label37" runat="server" CssClass="cur01st" 
                                                            Text="Porte da empresa: "></asp:Label>
                                                        <asp:Label ID="dsPorteLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsPorte") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                <br />
                                                <br />
                                                        <asp:Image ID="Image10" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/titconhecimentoprof.gif" />
                                                    </HeaderTemplate>
                                                    <SeparatorTemplate>
                                                        <asp:Image ID="Image13" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/separador.gif" />
                                                    </SeparatorTemplate>
                                                </asp:DataList>
                                                <asp:DataList ID="DataList8" runat="server" DataSourceID="SqlDataSource8">
                                                    <ItemTemplate>
                                                        <asp:Label ID="dsidiomaLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsidioma") %>'></asp:Label>
                                                        <br />
                                                        <asp:Label ID="dsnivelLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsnivel") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label40" runat="server" CssClass="cur01st" Text="Comentários: "></asp:Label>
                                                        <br />
                                                        <asp:Label ID="dscomentarioLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dscomentario") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                <br />
                                                <br />
                                                        <asp:Image ID="Image11" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/titidioma.gif" />
                                                    </HeaderTemplate>
                                                    <SeparatorTemplate>
                                                        <asp:Image ID="Image14" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/separador.gif" />
                                                    </SeparatorTemplate>
                                                </asp:DataList>
                                                <asp:DataList ID="DataList9" runat="server" DataSourceID="SqlDataSource9">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label39" runat="server" CssClass="cur01st" Text="Pais: "></asp:Label>
                                                        <asp:Label ID="paisLabel0" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("pais") %>'></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label45" runat="server" CssClass="cur01st" Text="Comentários: "></asp:Label>
                                                        <br />
                                                        <asp:Label ID="dsIntercambioLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsIntercambio") %>'></asp:Label>
                                                        <br />
                                                <br />
                                                        <asp:Label ID="Label46" runat="server" CssClass="cur01st" Text="Início: "></asp:Label>
                                                        <asp:Label ID="data_iniLabel2" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("data_ini", "{0:d}") %>'></asp:Label>
                                                        &nbsp; &nbsp;&nbsp;
                                                        <asp:Label ID="Label47" runat="server" CssClass="cur01st" Text="Término:  "></asp:Label>
                                                        <asp:Label ID="data_fimLabel2" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("data_fim", "{0:d}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                <br />
                                                <br />
                                                        <asp:Image ID="Image15" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/titintercambio.gif" />
                                                    </HeaderTemplate>
                                                    <SeparatorTemplate>
                                                        <asp:Image ID="Image16" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/separador.gif" />
                                                    </SeparatorTemplate>
                                                </asp:DataList>
                                                <asp:DataList ID="DataListDef" runat="server" DataKeyField="Obs" 
                                                    DataSourceID="SqlDataSource2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="dsDefFalaLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsDefFala") %>'></asp:Label>
                                                <br />
                                                        <asp:Label ID="dsDefAuditivaLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsDefAuditiva") %>'></asp:Label>
                                                <br />
                                                        <asp:Label ID="dsDefMentalLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsDefMental") %>'></asp:Label>
                                                <br />
                                                        <asp:Label ID="dsDefMotoraLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsDefMotora") %>'></asp:Label>
                                                <br />
                                                        <asp:Label ID="dsDefVisualLabel" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("dsDefVisual") %>'></asp:Label>
                                                <br />
                                                <br />
                                                        <asp:Label ID="ObsLabel1" runat="server" CssClass="cur01" 
                                                            Text='<%# Eval("Obs") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                <br />
                                                        <asp:Image ID="ImageDef0" runat="server" 
                                                            ImageUrl="~/images/candidato/cv/titdeficiencia.gif" />
                                                    </HeaderTemplate>
                                                </asp:DataList>
                                                <asp:Label ID="Label25" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="Label31" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="Label41" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="Label42" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="Label43" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="Label44" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LabelDp" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LabelDf" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="imageLabel" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                
                SelectCommand="SELECT 
	CU.idCadastroUser
	, CU.nome
	, CU.endereco
	, CU.cep
	, CU.bairro
	, CU.cidade
	, CU.uf
	, CU.pais
	, CU.nascimento
	, CU.sexo
	, CU.cadastroTipo
	, CU.apresentar
	, CU.estadocivil
	, CU.nrdependente
	, CU.portadorDef
	, CU.trabalhando
	, CU.resumo
	, CU.valorRemAtual
	, CU.valorRemPretendida
	, CU.localPreferencia
	, CU.disponibilidade
	, CU.origem
	, CU.data
	, CU.foto 
	, CU.areaAtuacao 
	, U.email
FROM tbCadastroUser CU 
INNER JOIN tbuser U 
	ON CU.idUser = U.idUser WHERE (CU.idUser = @idUser)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idUserLabel" DefaultValue="0" Name="idUser" 
                        PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="SELECT [idUser], [dsDefFala], [dsDefAuditiva], [dsDefMental], [dsDefMotora], [dsDefVisual], [Obs] FROM [vwdeficienciafisica] WHERE ([idUser] = @idUser)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idUserLabel" DefaultValue="0" Name="idUser" 
                        PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="SELECT [idcurriculo], [apresentacao], [realizacao], [resumogeral], [objetivo] FROM [tbCartaApresentacao] WHERE ([idcurriculo] = @idcurriculo)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="" 
                        Name="idcurriculo" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="SELECT [idcurriculo], [dsCurso], [obs], [data_ini], [data_fim], [dsinstituicao], [estado], [uf], [dsTipo] FROM [vwformacaoacademica] WHERE ([idcurriculo] = @idcurriculo)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="0" 
                        Name="idcurriculo" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="SELECT [idcurriculo], [Instituicao], [dsCurso], [obsCurso], [data_ini], [data_fim], [concluido] FROM [tbCursoExtraCurricular] WHERE ([idcurriculo] = @idcurriculo)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="0" 
                        Name="idcurriculo" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="SELECT [idcurriculo], [dsTipoConhecimento], [dsGrauExperiencia], [dsTipoConhecimentoRel], [obs] FROM [vwconhecimentoInfo] WHERE ([idcurriculo] = @idcurriculo)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="0" 
                        Name="idcurriculo" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="SELECT [nomeempresa], [dsexperiencia], [data_ini], [data_fim], [dsAreaAtuacao], [dsRelacaoTrabalhista], [dsPorte], [idcurriculo] FROM [vwExperienciaProf] WHERE ([idcurriculo] = @idcurriculo) ORDER BY [data_ini] DESC, [data_fim] DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="0" 
                        Name="idcurriculo" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="SELECT [idcurriculo], [dsnivel], [dsidioma], [dscomentario] FROM [vwidioma] WHERE ([idcurriculo] = @idcurriculo)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="" 
                        Name="idcurriculo" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                SelectCommand="SELECT [idcurriculo], [pais], [dsIntercambio], [data_ini], [data_fim] FROM [tbintercambio] WHERE ([idcurriculo] = @idcurriculo) ORDER BY [data_ini] DESC, [data_fim] DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idcurriculoLabel" DefaultValue="0" 
                        Name="idcurriculo" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <cc1:DragPanelExtender ID="PanelCV_DragPanelExtender" runat="server" 
            DragHandleID="PanelCV" Enabled="True" TargetControlID="PanelCV">
        </cc1:DragPanelExtender>

</asp:Content>

