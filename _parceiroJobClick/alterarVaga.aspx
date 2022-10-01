<%@ Page Title="" Language="VB" ValidateRequest="false" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="alterarVaga.aspx.vb" Inherits="_parceiroJobClick_alterarVaga" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" }, close: function () { window.location.href = "<%=URLReturn.Value%>"  } });
            setTimeout(function () {
                $("#<%=PanelAviso.ClientID%>").dialog('close')
            }, 2000);
        });
	</script>
                 <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
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
    <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Alterar vagas publicadas"></asp:Label>
            <asp:Label ID="PSQLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="idVagaPublicaLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="textPesquisaLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="idCBOOcupacaoLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="idADLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="StatusPublicaLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="referenciaLabel" runat="server" Visible="False"></asp:Label>
            <input id="URLReturn" runat="server" type="hidden"/><br />
            <asp:Panel ID="PanelPSQ" runat="server" DefaultButton="LinkButtonPSQ">
                <asp:TextBox ID="TextBoxPSQ" runat="server" CssClass="simple" ToolTip="Informe aqui o título da vaga, pode ser parte do título." Width="300px"></asp:TextBox>
                <asp:LinkButton ID="LinkButtonPSQ" runat="server" CssClass="button" ToolTip="Pesquisar o título informado.">Pesquisar</asp:LinkButton>
                <asp:LinkButton ID="LinkButtonTodas" runat="server" CssClass="button" ToolTip="Apresentar todas as vagas publicadas">Todas</asp:LinkButton>
                <asp:LinkButton ID="LinkButtonVAGA" runat="server" CssClass="button" PostBackUrl="~/_parceiroJobClick/relatorioVaga.aspx">Gráficos (Vaga)</asp:LinkButton>
                <asp:LinkButton ID="LinkButtonVagasPatrocinadas" runat="server" CssClass="button" Visible="False">Vagas patrocinadas</asp:LinkButton>
                <br />
                <asp:Label ID="LabelpsqAviso" runat="server" CssClass="legenda" Text="* Informe acima, o título da vaga, ou parte dele."></asp:Label>
            </asp:Panel>
            <br />
            <br />
            <asp:FormView ID="FormViewVagaPublica" runat="server" DataKeyNames="idVagaPublica" DataSourceID="SqlForm" DefaultMode="Edit" Width="100%">
                <EditItemTemplate>
                    <table id="FormularioVagaPublica" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="left" valign="top">
                                <asp:Label ID="Label2" runat="server" Text="Título:"></asp:Label>
                                <br />
                                <asp:TextBox ID="titVagaPublicaEditTextBox" runat="server" CssClass="simple" Enabled="False" MaxLength="50" Text='<%# Bind("titVagaPublica") %>' Width="300px" />
                                <br />
                                <cc1:TextBoxWatermarkExtender ID="titVagaPublicaEditTextBox_TextBoxWatermarkExtender" runat="server" Enabled="True" TargetControlID="titVagaPublicaEditTextBox" WatermarkText="Pesquise um cargo.">
                                </cc1:TextBoxWatermarkExtender>
                                <asp:TextBox ID="codigoTextBox" runat="server" Text='<%# Bind("codigo") %>' Visible="False" Width="5px" />
                                <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>' Visible="False" Width="5px" />
                                <asp:TextBox ID="idCBOOcupacaoTextBoxEdit" runat="server" CausesValidation="False" Text='<%# Bind("idCBOOcupacao") %>' Visible="False" Width="5px"></asp:TextBox>
                                <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="5px" />
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("idfuncao") %>' Visible="False" Width="5px"></asp:TextBox>
                                <br />
                                <asp:Label ID="Label4" runat="server" Text="Número de vagas:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="nroVagasTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="nroVagasTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" ValidationExpression="\d{1,9}"></asp:RegularExpressionValidator>
                                <br />
                                <asp:TextBox ID="nroVagasTextBox" runat="server" CssClass="simple" Text='<%# Bind("nroVaga") %>' Width="300px"></asp:TextBox>
                                <br />
                                <table align="left" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text="Local de trabalho: Ex.: São Paulo"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="LocalTrabalhoTextBox" Display="Dynamic" ErrorMessage="Local de trabalho é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                            <br />
                                            <asp:TextBox ID="LocalTrabalhoTextBox" runat="server" CssClass="simple" Text='<%# Bind("localTrabalho") %>' Width="220px"></asp:TextBox>
                                            &nbsp; </td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text="UF:"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DropDownListUF" ErrorMessage="UF obrigatório.">*</asp:RequiredFieldValidator>
                                            <br />
                                            <asp:DropDownList ID="DropDownListUF" runat="server" DataSourceID="SqlUF" DataTextField="uf" DataValueField="uf" SelectedValue='<%# Bind("UF") %>' type="text" Width="75px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                                <br />
                                <br />
                                <asp:Label ID="Label6" runat="server" Text="E-Mail que receberá os Currículos:"></asp:Label>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <br />
                                <asp:TextBox ID="emailTextBox" runat="server" CssClass="simple" Enabled="False" MaxLength="180" Text='<%# Bind("email") %>' Width="300px" />
                                <br />
                                <asp:Label ID="Label7" runat="server" Text="Validade desta publicação:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="validadeTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="validadeTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
                                <br />
                                <asp:TextBox ID="validadeTextBox" runat="server" CssClass="simple" Text='<%# Bind("validade", "{0:d}") %>' Width="300px" />
                                <cc1:CalendarExtender ID="validadeTextBox_CalendarExtender" runat="server" Enabled="True" Format="dd/M/yyyy" TargetControlID="validadeTextBox">
                                </cc1:CalendarExtender>
                                <br />
                                <asp:Label ID="Label8" runat="server" Text="Código de Referência: (Opcional)"></asp:Label>
                                <br />
                                <asp:TextBox ID="referenciaTextBox" runat="server" CssClass="simple" MaxLength="180" Text='<%# Bind("referencia") %>' Width="300px" />
                                <br />
                                <br />
                            </td>
                            <td class="right">
                                <asp:Label ID="LabelNivelProf" runat="server" Text="Nível Profissional:"></asp:Label>
                                <br />
                                <asp:DropDownList ID="DropDownListNivelProfissional" runat="server" CssClass="DropCadEmp" DataSourceID="SqlNivelProfissional" DataTextField="dsNivelProfissional" DataValueField="idNivelProfissional" SelectedValue='<%# Bind("idNivelProfissional") %>' type="text" Width="410px">
                                </asp:DropDownList>
                                <br />
                                <asp:Label ID="Label3" runat="server" Text="Principais atribuições do cargo:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dsVagaPublicaTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <br />
                                <asp:TextBox ID="dsVagaPublicaTextBox" runat="server" CssClass="simple" Height="225px" ondatabinding="dsVagaPublicaTextBox_DataBinding" Text='<%# Bind("dsVagaPublica") %>' TextMode="MultiLine" Width="400px" />
                                <br />
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="publicarCheckBox" runat="server" Checked='<%# Bind("publicar") %>' Text="Publicar esta vaga" ToolTip="Selecione aqui para publicar esta vaga." />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="CheckBoxPNE" runat="server" AutoPostBack="True" Checked='<%# Bind("pne") %>' oncheckedchanged="CheckBoxPNE_CheckedChanged" Text="(PNE):" ToolTip="Pessoa com Necessidades Especiais" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" CssClass="button" Text="Atualizar os dados desta vaga" />
                                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" CssClass="button" onclientclick="return confirm(&quot;Você quer excluir esta vaga?&quot;)" Text="Excluir vaga" />
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CssClass="button" onclick="UpdateCancelButton_Click" Text="Fechar"></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    idCadastroEmpresa:
                    <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" Text='<%# Bind("idCadastroEmpresa") %>' />
                    <br />
                    idfuncao:
                    <asp:TextBox ID="idfuncaoTextBox" runat="server" Text='<%# Bind("idfuncao") %>' />
                    <br />
                    titVagaPublica:
                    <asp:TextBox ID="titVagaPublicaTextBox" runat="server" Text='<%# Bind("titVagaPublica") %>' />
                    <br />
                    dsVagaPublica:
                    <asp:TextBox ID="dsVagaPublicaTextBox" runat="server" Text='<%# Bind("dsVagaPublica") %>' />
                    <br />
                    email:
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    <br />
                    data:
                    <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>' />
                    <br />
                    validade:
                    <asp:TextBox ID="validadeTextBox" runat="server" Text='<%# Bind("validade") %>' />
                    <br />
                    codigo:
                    <asp:TextBox ID="codigoTextBox" runat="server" Text='<%# Bind("codigo") %>' />
                    <br />
                    referencia:
                    <asp:TextBox ID="referenciaTextBox" runat="server" Text='<%# Bind("referencia") %>' />
                    <br />
                    publicar:
                    <asp:CheckBox ID="publicarCheckBox" runat="server" Checked='<%# Bind("publicar") %>' />
                    <br />
                    nroVaga:
                    <asp:TextBox ID="nroVagaTextBox" runat="server" Text='<%# Bind("nroVaga") %>' />
                    <br />
                    localTrabalho:
                    <asp:TextBox ID="localTrabalhoTextBox" runat="server" Text='<%# Bind("localTrabalho") %>' />
                    <br />
                    UF:
                    <asp:TextBox ID="UFTextBox" runat="server" Text='<%# Bind("UF") %>' />
                    <br />
                    idCBOOcupacao:
                    <asp:TextBox ID="idCBOOcupacaoTextBox" runat="server" Text='<%# Bind("idCBOOcupacao") %>' />
                    <br />
                    pne:
                    <asp:TextBox ID="pneTextBox" runat="server" Text='<%# Bind("pne") %>' />
                    <br />
                    idNivelProfissional:
                    <asp:TextBox ID="idNivelProfissionalTextBox" runat="server" Text='<%# Bind("idNivelProfissional") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    idVagaPublica:
                    <asp:Label ID="idVagaPublicaLabel" runat="server" Text='<%# Eval("idVagaPublica") %>' />
                    <br />
                    idCadastroEmpresa:
                    <asp:Label ID="idCadastroEmpresaLabel" runat="server" Text='<%# Bind("idCadastroEmpresa") %>' />
                    <br />
                    idfuncao:
                    <asp:Label ID="idfuncaoLabel" runat="server" Text='<%# Bind("idfuncao") %>' />
                    <br />
                    titVagaPublica:
                    <asp:Label ID="titVagaPublicaLabel" runat="server" Text='<%# Bind("titVagaPublica") %>' />
                    <br />
                    dsVagaPublica:
                    <asp:Label ID="dsVagaPublicaLabel" runat="server" Text='<%# Bind("dsVagaPublica") %>' />
                    <br />
                    email:
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                    <br />
                    data:
                    <asp:Label ID="dataLabel" runat="server" Text='<%# Bind("data") %>' />
                    <br />
                    validade:
                    <asp:Label ID="validadeLabel" runat="server" Text='<%# Bind("validade") %>' />
                    <br />
                    codigo:
                    <asp:Label ID="codigoLabel" runat="server" Text='<%# Bind("codigo") %>' />
                    <br />
                    referencia:
                    <asp:Label ID="referenciaLabel" runat="server" Text='<%# Bind("referencia") %>' />
                    <br />
                    publicar:
                    <asp:CheckBox ID="publicarCheckBox" runat="server" Checked='<%# Bind("publicar") %>' Enabled="false" />
                    <br />
                    nroVaga:
                    <asp:Label ID="nroVagaLabel" runat="server" Text='<%# Bind("nroVaga") %>' />
                    <br />
                    localTrabalho:
                    <asp:Label ID="localTrabalhoLabel" runat="server" Text='<%# Bind("localTrabalho") %>' />
                    <br />
                    UF:
                    <asp:Label ID="UFLabel" runat="server" Text='<%# Bind("UF") %>' />
                    <br />
                    idCBOOcupacao:
                    <asp:Label ID="idCBOOcupacaoLabel" runat="server" Text='<%# Bind("idCBOOcupacao") %>' />
                    <br />
                    pne:
                    <asp:Label ID="pneLabel" runat="server" Text='<%# Bind("pne") %>' />
                    <br />
                    idNivelProfissional:
                    <asp:Label ID="idNivelProfissionalLabel" runat="server" Text='<%# Bind("idNivelProfissional") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <br />
            <asp:GridView ID="GridViewVagasPublicadas" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="idVagaPublica,idAD,referencia" DataSourceID="SqlDataSourceVagasPublicas" Visible="False">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonSelect" runat="server" CommandName="Select" ImageUrl="~/_parceiroJobClick/images/viewDescricao.png" ToolTip='<%# Eval("titVagaPublica") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="idVagaPublica" HeaderText="idVagaPublica" InsertVisible="False" ReadOnly="True" SortExpression="idVagaPublica" Visible="False" />
                    <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" SortExpression="idCadastroEmpresa" Visible="False" />
                    <asp:BoundField DataField="idfuncao" HeaderText="idfuncao" SortExpression="idfuncao" Visible="False" />
                    <asp:TemplateField HeaderText="Título" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text='<%# Eval("titVagaPublica") %>' ToolTip='<%# Eval("titVagaPublica", "Clique aqui para editar a vaga {0}") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="titVagaPublica" HeaderText="Título" SortExpression="titVagaPublica" Visible="False" />
                    <asp:BoundField DataField="dsVagaPublica" HeaderText="dsVagaPublica" SortExpression="dsVagaPublica" Visible="False" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" Visible="False" />
                    <asp:BoundField DataField="data" HeaderText="Publicado em:" SortExpression="data" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="validade" HeaderText="validade" SortExpression="validade" Visible="False" />
                    <asp:BoundField DataField="codigo" HeaderText="Código" SortExpression="codigo" />
                    <asp:BoundField DataField="referencia" HeaderText="Referência" SortExpression="referencia" />
                    <asp:CheckBoxField DataField="publicar" HeaderText="Publicada" SortExpression="publicar" />
                </Columns>
                <EmptyDataTemplate>
                    <asp:Label ID="Label1" runat="server" Text="Não foi encontrado nenhuma vaga!"></asp:Label>
                </EmptyDataTemplate>
                <PagerStyle CssClass="pgr" />
            </asp:GridView>
            <br />
         <asp:Label ID="LabelLeganda" runat="server" CssClass="legenda" Text="Legenda:"></asp:Label>
         <br __designer:mapid="16d" />
         <br __designer:mapid="16e" />
         <asp:Image ID="ImagePublicada" runat="server" ImageUrl="~/_parceiroJobClick/images/legenda_AD_AP.png" ToolTip="Vagas publicadas no painel vagas patrocinadas" />
         &nbsp;<asp:Label ID="Label23" runat="server" CssClass="legenda" Text="Anúncio publicado nas vagas patrocinadas."></asp:Label>
         <br __designer:mapid="171" />
         <asp:Image ID="ImageNpublicadas" runat="server" ImageUrl="~/_parceiroJobClick/images/legenda_AD_NP.png" ToolTip="Vagas não publicadas no painel vagas patrocinadas" />
         &nbsp;<asp:Label ID="Label24" runat="server" CssClass="legenda" Text="Vaga publicada no painel JobClick"></asp:Label>
         <br __designer:mapid="174" />
         <asp:Image ID="ImageNAnunciada" runat="server" ImageUrl="~/_parceiroJobClick/images/legenda_AD_NA.png" ToolTip="Vagas não publicadas no painel vagas patrocinadas" />
         &nbsp;<asp:Label ID="Label26" runat="server" CssClass="legenda" Text="Vaga &lt;b&gt;não&lt;/b&gt; está publicada no painel JobClick"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSourceVagasPublicas" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_VAGASPUBLICAS_LISTA" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
                    <asp:ControlParameter ControlID="PSQLabel" Name="searchVaga" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlForm" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="DELETE FROM [tbVagaPublica] WHERE [idVagaPublica] = @idVagaPublica" 
        InsertCommand="INSERT INTO tbVagaPublica(idCadastroEmpresa, idfuncao, titVagaPublica, dsVagaPublica, email, data, validade, codigo, referencia, publicar, nroVaga, localTrabalho, UF, pne, idCBOOcupacao, idNivelProfissional) VALUES (@idCadastroEmpresa, @idfuncao, @titVagaPublica, @dsVagaPublica, @email, @data, @validade, @codigo, @referencia, @publicar, @nroVaga, @localTrabalho, @UF, @pne, @idCBOOcupacao, @idNivelProfissional)" 
        SelectCommand="SELECT idVagaPublica, idCadastroEmpresa, idfuncao, titVagaPublica, dsVagaPublica, LTRIM(RTRIM(email)) AS email, data, validade, codigo, referencia, publicar, nroVaga, localTrabalho, UF, ISNULL(idCBOOcupacao, 0) AS idCBOOcupacao, pne, idNivelProfissional FROM tbVagaPublica WHERE (idCadastroEmpresa = @idCadastroEmpresa) AND (idVagaPublica = @idVagaPublica)" 
        
        
        
        
        
        UpdateCommand="UPDATE tbVagaPublica SET idCadastroEmpresa = @idCadastroEmpresa, idfuncao = @idfuncao, titVagaPublica = @titVagaPublica, dsVagaPublica = @dsVagaPublica, email = @email, data = @data, validade = @validade, codigo = @codigo, referencia = @referencia, publicar = @publicar, nroVaga = @nroVaga, localTrabalho = @localTrabalho, UF = @UF, idCBOOcupacao = @idCBOOcupacao, pne = @pne, idNivelProfissional = @idNivelProfissional WHERE (idVagaPublica = @idVagaPublica)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
            <asp:ControlParameter ControlID="idVagaPublicaLabel" Name="idVagaPublica" 
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idVagaPublica" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="idfuncao" Type="Int32" />
            <asp:Parameter Name="titVagaPublica" Type="String" />
            <asp:Parameter Name="dsVagaPublica" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="data" Type="DateTime" />
            <asp:Parameter Name="validade" Type="DateTime" />
            <asp:Parameter Name="codigo" Type="String" />
            <asp:Parameter Name="referencia" Type="String" />
            <asp:Parameter Name="publicar" Type="Boolean" />
            <asp:Parameter Name="nroVaga" />
            <asp:Parameter Name="localTrabalho" />
            <asp:Parameter Name="UF" />
            <asp:Parameter Name="idCBOOcupacao" />
            <asp:Parameter Name="pne" />
            <asp:Parameter Name="idNivelProfissional" />
            <asp:Parameter Name="idVagaPublica" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="idfuncao" Type="Int32" />
            <asp:Parameter Name="titVagaPublica" Type="String" />
            <asp:Parameter Name="dsVagaPublica" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="data" Type="DateTime" />
            <asp:Parameter Name="validade" Type="DateTime" />
            <asp:Parameter Name="codigo" Type="String" />
            <asp:Parameter Name="referencia" Type="String" />
            <asp:Parameter Name="publicar" Type="Boolean" />
            <asp:Parameter Name="nroVaga" />
            <asp:Parameter Name="localTrabalho" />
            <asp:Parameter Name="UF" />
            <asp:Parameter Name="pne" />
            <asp:Parameter Name="idCBOOcupacao" />
            <asp:Parameter Name="idNivelProfissional" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataGrid" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        
        SelectCommand="SELECT [idVagaPublica], [idCadastroEmpresa], [idfuncao], [titVagaPublica], [dsVagaPublica], [email], [data], [validade], [codigo], [referencia], [publicar] FROM [tbVagaPublica] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa) ">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcePesquisa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="_spCBO_SELECT" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="textPesquisaLabel" Name="SearchTerm" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlUF" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [uf], [dsuf] FROM [tbuf]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlCARGOSRELACIONADOS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="_spCBO_SELECT" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="idCBOOcupacaoLabel" Name="SearchTerm" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlNivelProfissional" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                            
        SelectCommand="SELECT [idNivelProfissional], [dsNivelProfissional] FROM [tbNivelProfissional] ORDER BY [idNivelProfissional]">
                        </asp:SqlDataSource>

            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </div>
</asp:Content>

