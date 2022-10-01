<%@ Page Title="" Language="VB" ValidateRequest="false" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="publicarNovaVaga.aspx.vb" Inherits="_parceiroJobClick_publicarNovaVaga" %>
<%@ Register src="../App_Include/pesquisaFuncao.ascx" tagname="pesquisaFuncao" tagprefix="uc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript" src="../scripts/jquery.autocomplete.js"></script>
    <script type="text/javascript" src="../scripts/jquery.leaveNotice.min.js"></script> 
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=TextBoxPsq.ClientID%>").autocomplete("AutocompleteCargoData.ashx");
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
        });
	</script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelPSQ.ClientID%>").dialog({ closeText: '', width: '800', title: "Pesquisa de cargos em nossa base de dados", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" }, close: function () { window.location.href = "Default.aspx" } });
        });
	</script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelCargosRelacionados.ClientID%>").dialog({ closeText: '', width: '900', title: "Cargos relacionados (CBO)", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
        });
	</script>
    <script type="text/javascript">
        $(function () {
            $("#<%=CargoCBO.ClientID%>").dialog({ closeText: '', width: '800', title: "Pesquisa de cargos em nossa base de dados", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" }, close: function () { window.location.href = "publicarNovaVaga.aspx" } });
        });
	</script>
     <script type="text/javascript">
         function GetMensagem() {
             $("input[id$='textPesquisa']").val($("#<%=TextBoxPsq.ClientID%>").val());
         }
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

                 <asp:Panel ID="PanelCargosRelacionados" runat="server" Visible="False">
                    <table id="AVISOTABELAPANEL" align="center" cellpadding="5" cellspacing="5" width="100%">
                        <tr>
                            <td align="center">
                                <asp:GridView ID="GridViewPsqCargoPANEL" runat="server" AllowPaging="True" 
                                    AutoGenerateColumns="False" BorderColor="Silver" 
                                    BorderStyle="Dotted" BorderWidth="1px" 
                                    DataKeyNames="idCBOOcupacao,dsCBOOcupacao,dsCBOSinonimo" 
                                    DataSourceID="SqlCARGOSRELACIONADOS" PageSize="50" Width="100%">
                                    <AlternatingRowStyle BackColor="#F2F2F2" />
                                    <Columns>
                                        <asp:BoundField DataField="idCBOOcupacao" HeaderText="idCBOOcupacao" 
                                            SortExpression="idCBOOcupacao" Visible="False" />
                                        <asp:BoundField DataField="dsCBOOcupacao" HeaderText="Cargo" 
                                            NullDisplayText="-" SortExpression="dsCBOOcupacao" />
                                        <asp:BoundField DataField="dsCBOSinonimo" HeaderText="Sinônimo" 
                                            SortExpression="dsCBOSinonimo" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <asp:Label ID="LabelAVISO" runat="server" Text="Você optou por não vincular esta publicação com os cargos (CBO)"></asp:Label>
                                    </EmptyDataTemplate>
                                    <PagerSettings Position="TopAndBottom" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
    <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Publicar uma nova oportunidade (Vaga)"></asp:Label>
            <table>
        <tr>
            <td>
                <asp:Label ID="LabelAviso" runat="server" Text="Antes de iniciar a publicação da vaga, será necessário pesquisar um [Cargo] em nossa base de dados. No resultado da pesquisa você deverá selecionar um dos cargos nestas condições todos Candidatos que possuem o mesmo [Cargo] em seus Currículos serão convidados através de e-mails a se candidatar a esta vaga." Visible="False"></asp:Label>
                <asp:Label ID="idVagaPublicaLabel" runat="server" Visible="False"></asp:Label>
                <br />
                <br />
                 <asp:LinkButton ID="PSQlb" runat="server" CausesValidation="False" 
                    CssClass="button" ToolTip="Clique aqui para publicar uma nova vaga." Visible="False">Para publicar uma nova vaga [Clique aqui].</asp:LinkButton>
                <asp:Label ID="idfuncaoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="dsfuncaoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="textPesquisaLabel" runat="server" Visible="False"></asp:Label>
                <input runat="server" id="textPesquisa" type="hidden" />
                <asp:Label ID="idCBOOcupacaoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="dsCBOOcupacaoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="dsCBOSinonimoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lipClient" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="ipLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="CidadeLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="EstadoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="UFLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="PaisLabel" runat="server" Visible="False"></asp:Label>
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <br />
                            <br />
                <asp:GridView ID="GridViewListaVagas" runat="server" AutoGenerateColumns="False" 
                    BorderStyle="None" DataKeyNames="idVagaPublica" DataSourceID="SqlDataGrid" 
                    GridLines="None" HorizontalAlign="Left" Width="100%" AllowPaging="True" 
                                CellPadding="0" CellSpacing="10" Visible="False">
                    <PagerSettings Position="TopAndBottom" />
                    <Columns>
                        <asp:BoundField DataField="idVagaPublica" HeaderText="idVagaPublica" 
                            InsertVisible="False" ReadOnly="True" SortExpression="idVagaPublica" 
                            Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                            SortExpression="idCadastroEmpresa" Visible="False" />
                        <asp:BoundField DataField="idfuncao" HeaderText="idfuncao" 
                            SortExpression="idfuncao" Visible="False" />
                        <asp:BoundField DataField="codigo" HeaderText="Código" 
                            SortExpression="codigo" >
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="titVagaPublica" HeaderText="Vaga" 
                            SortExpression="titVagaPublica" >
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dsVagaPublica" HeaderText="dsVagaPublica" 
                            SortExpression="dsVagaPublica" Visible="False" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" 
                            Visible="False" />
                        <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" 
                            Visible="False" />
                        <asp:BoundField DataField="validade" HeaderText="Validade" 
                            SortExpression="validade" DataFormatString="{0:d}" >
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="referencia" HeaderText="referencia" 
                            SortExpression="referencia" Visible="False" />
                        <asp:CheckBoxField DataField="publicar" HeaderText="Publicada" 
                            SortExpression="publicar" >
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:CheckBoxField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="Select" CssClass="button" Text="Selecionar"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="60px" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="#F2F2F2" />
                </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="CargoCBO" runat="server">
                                <asp:Label ID="LabelResPSQ" runat="server" Text="Veja abaixo o resultado de sua pesquisa." CssClass="titulo"></asp:Label>
                                <asp:GridView ID="GridViewPsqCargo" runat="server" AutoGenerateColumns="False" 
                                    BorderColor="Silver" BorderStyle="Dotted" BorderWidth="1px" 
                                    DataKeyNames="idCBOOcupacao,dsCBOOcupacao,dsCBOSinonimo" DataSourceID="SqlDataSourcePesquisa" 
                                    Width="100%" PageSize="50" CssClass="mGrid">
                                    <AlternatingRowStyle BackColor="#F2F2F2" />
                                    <Columns>
                                        <asp:BoundField DataField="idCBOOcupacao" HeaderText="idCBOOcupacao" SortExpression="idCBOOcupacao" 
                                            Visible="False" />
                                        <asp:BoundField DataField="dsCBOOcupacao" HeaderText="Cargo" 
                                            SortExpression="dsCBOOcupacao" NullDisplayText="-" >
                                        <HeaderStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:ButtonField CommandName="Select" DataTextField="dsCBOSinonimo" 
                                            HeaderText="Sinônimo" Text="Button">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                        </asp:ButtonField>
                                        <asp:BoundField DataField="dsCBOSinonimo" HeaderText="Sinônimo" 
                                            SortExpression="dsCBOSinonimo" Visible="False" />
                                    </Columns>
                                    <PagerSettings Position="TopAndBottom" />
                                </asp:GridView>
                                <br />                                
                                <table id="buttonND" class="right">
                                    <tr>
                                        <td><asp:LinkButton ID="LinkButtonPular0" runat="server" CausesValidation="False" CssClass="button" ToolTip="Se você não encontrou o cargo na tabela CBO, clique aqui para seguir para a próxima etapa.">Não encontrei o cargo para esta publicação</asp:LinkButton></td>
                                    </tr>
                                </table>
                                <br />
                           </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:FormView ID="FormViewVaga" runat="server" DataKeyNames="idVagaPublica,idCBOOcupacao" 
                    DataSourceID="SqlForm" Width="100%" DefaultMode="Insert">
                    <EditItemTemplate>
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td valign="top">
                                                <asp:Label ID="Label2" runat="server" 
                                                    Text="Título que será utilizado na divulgação da oportunidade:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="titVagaPublicaEditTextBox" runat="server" 
                                                    CssClass="InputCadEmp" Enabled="False" MaxLength="50" 
                                                    Text='<%# Bind("titVagaPublica") %>' />
                                                <cc1:TextBoxWatermarkExtender ID="titVagaPublicaEditTextBox_TextBoxWatermarkExtender" 
                                                    runat="server" Enabled="True" TargetControlID="titVagaPublicaEditTextBox" 
                                                    WatermarkText="Pesquise um cargo.">
                                                </cc1:TextBoxWatermarkExtender>
                                                <asp:TextBox ID="codigoTextBox" runat="server" Text='<%# Bind("codigo") %>' 
                                                    Visible="False" Width="5px" />
                                                <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>' 
                                                    Visible="False" Width="5px" />
                                                <asp:TextBox ID="idCBOOcupacaoTextBoxEdit" runat="server" Text='<%# Bind("idCBOOcupacao") %>' 
                                                    Width="5px" Visible="False" CausesValidation="False"></asp:TextBox>
                                                <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" 
                                                    Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="5px" />
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("idfuncao") %>' 
                                                    Visible="False" Width="5px"></asp:TextBox>
                                                <br />
                                                <asp:LinkButton ID="LinkButtonCargos" runat="server" CommandName="Select" 
                                                    onclick="LinkButtonCargos_Click" 
                                                    ToolTip="Veja os cargos relacionados na tabela CBO (Classificação Brasileira de Ocupações - Ministério do Trabalho)">Cargos relacionados</asp:LinkButton>
                                                <br />
                                                <br />
                                                <asp:Label ID="Label4" runat="server" Text="Número de vagas:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                    ControlToValidate="nroVagasTextBox" Display="Dynamic" ErrorMessage="*" 
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                                    ControlToValidate="nroVagasTextBox" Display="Dynamic" ErrorMessage="*" 
                                                    SetFocusOnError="True" ValidationExpression="\d{1,9}"></asp:RegularExpressionValidator>
                                                <br />
                                                <asp:TextBox ID="nroVagasTextBox" runat="server" CssClass="InputCadEmp" 
                                                    Text='<%# Bind("nroVaga") %>'></asp:TextBox>
                                                <br />
                                                <table align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label5" runat="server" Text="Local de trabalho: Ex.: São Paulo"></asp:Label>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                                ControlToValidate="LocalTrabalhoTextBox" Display="Dynamic" 
                                                                ErrorMessage="Local de trabalho é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                            <br />
                                                            <asp:TextBox ID="LocalTrabalhoTextBox" runat="server" CssClass="InputCadEmp" 
                                                                Text='<%# Bind("localTrabalho") %>' Width="296px"></asp:TextBox>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label1" runat="server" Text="UF:"></asp:Label>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                                                ControlToValidate="DropDownListUF" ErrorMessage="UF obrigatório.">*</asp:RequiredFieldValidator>
                                                            <br />
                                                            <asp:DropDownList ID="DropDownListUF" type="text" runat="server" DataSourceID="SqlUF" 
                                                                DataTextField="uf" DataValueField="uf" SelectedValue='<%# Bind("UF") %>' 
                                                                Width="50px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <br />
                                                <br />
                                                <asp:Label ID="Label6" runat="server" Text="E-Mail que receberá os Currículos:"></asp:Label>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                    ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="*" 
                                                    SetFocusOnError="True" 
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                    ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="*" 
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="emailTextBox" runat="server" CssClass="InputCadEmp" 
                                                    Enabled="False" MaxLength="180" Text='<%# Bind("email") %>' />
                                                <br />
                                                <asp:Label ID="Label7" runat="server" Text="Validade desta publicação:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                    ControlToValidate="validadeTextBox" Display="Dynamic" ErrorMessage="*" 
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                    ControlToValidate="validadeTextBox" Display="Dynamic" ErrorMessage="*" 
                                                    SetFocusOnError="True" 
                                                    ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
                                                <br />
                                                <asp:TextBox ID="validadeTextBox" runat="server" CssClass="InputCadEmp" 
                                                    Text='<%# Bind("validade", "{0:d}") %>' />
                                                <cc1:CalendarExtender ID="validadeTextBox_CalendarExtender" runat="server" 
                                                    Enabled="True" Format="dd/M/yyyy" TargetControlID="validadeTextBox">
                                                </cc1:CalendarExtender>
                                                <br />
                                                <asp:Label ID="Label8" runat="server" 
                                                    Text="Código de Referência: (Opcional - Para seu controle)"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="referenciaTextBox" runat="server" CssClass="InputCadEmp" 
                                                    MaxLength="180" Text='<%# Bind("referencia") %>' />
                                                <br />
                                                <br />
                                            </td>
                                            <td>
                                                <asp:Label ID="LabelNivelProf" runat="server" Text="Nível Profissional:"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="DropDownListNivelProfissional" runat="server" 
                                                    CssClass="DropCadEmp" DataSourceID="SqlNivelProfissional" 
                                                    DataTextField="dsNivelProfissional" DataValueField="idNivelProfissional" 
                                                    SelectedValue='<%# Bind("idNivelProfissional") %>' type="text" 
                                                    Width="505px">
                                                </asp:DropDownList>
                                                <br />
                                                <asp:Label ID="Label3" runat="server" Text="Principais atribuições do cargo:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                    ControlToValidate="dsVagaPublicaTextBox" Display="Dynamic" ErrorMessage="*" 
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="dsVagaPublicaTextBox" runat="server" CssClass="InputCadEmp" 
                                                    Height="265px" ondatabinding="dsVagaPublicaTextBox_DataBinding" 
                                                    Text='<%# Bind("dsVagaPublica") %>' TextMode="MultiLine" Width="500px" />
                                                <br />
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td>
                                                            <asp:CheckBox ID="publicarCheckBox" runat="server" 
                                                                Checked='<%# Bind("publicar") %>' Text="Publicar esta vaga" />
                                                        </td>
                                                        <td align="right">
                                                            <asp:CheckBox ID="CheckBoxPNE" runat="server" AutoPostBack="True" 
                                                                oncheckedchanged="CheckBoxPNE_CheckedChanged" 
                                                                Text="Portador de Necessidade Especiais (PNE)" 
                                                                Checked='<%# Bind("pne") %>' />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                    CommandName="Update" CssClass="button" Text="Atualizar os dados desta vaga" />
                                                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                                    CommandName="Delete" CssClass="button" 
                                                    onclientclick="return confirm(&quot;Você quer excluir esta vaga?&quot;)" 
                                                    Text="Excluir vaga" />
                                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                                    CssClass="button" Text="Cancelar" onclick="UpdateCancelButton_Click"></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" id="FormularioVagaPublica">
                                        <tr>
                                            <td valign="top" class="left">
                                                <asp:Label ID="Label2" runat="server" 
                                                    Text="Título:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="titVagaPublicaEditTextBox" ErrorMessage="Título é obrigatório!" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="titVagaPublicaEditTextBox" runat="server" 
                                                    CssClass="simple" Enabled="False" MaxLength="50" 
                                                    Text='<%# Bind("titVagaPublica") %>' Width="300px" />
                                                <br />
                                                <asp:TextBox ID="codigoTextBox" runat="server" Text='<%# Bind("codigo") %>' 
                                                    Visible="False" Width="5px" />
                                                <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>' 
                                                    Visible="False" Width="5px" />
                                                <asp:TextBox ID="idCadastroEmpresaTextBox0" runat="server" 
                                                    Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="5px" ></asp:TextBox>
                                                <asp:TextBox ID="idCBOOcupacaoTextBox" runat="server" 
                                                    Text='<%# Bind("idCBOOcupacao") %>' Visible="False" Width="5px"></asp:TextBox>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("idfuncao") %>' 
                                                    Visible="False" Width="5px"></asp:TextBox>
                                                <br />
                                                <asp:Label ID="Label4" runat="server" Text="Número de vagas:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                    ControlToValidate="nroVagasTextBox" Display="Dynamic" ErrorMessage="Número de vagas é obrigatório!" 
                                                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                                    ControlToValidate="nroVagasTextBox" Display="Dynamic" ErrorMessage="*" 
                                                    SetFocusOnError="True" ValidationExpression="\d{1,9}"></asp:RegularExpressionValidator>
                                                <br />
                                                <asp:TextBox ID="nroVagasTextBox" runat="server" CssClass="simple" 
                                                    Text='<%# Bind("nroVaga") %>' Width="300px"></asp:TextBox>
                                                <br />
                                                <table align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label5" runat="server" Text="Local de trabalho: Ex.: São Paulo"></asp:Label>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                                ControlToValidate="LocalTrabalhoTextBox" Display="Dynamic" 
                                                                ErrorMessage="Local de trabalho é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                            <br />
                                                            <asp:TextBox ID="LocalTrabalhoTextBox" runat="server" CssClass="simple" 
                                                                Text='<%# Bind("localTrabalho") %>' Width="220px"></asp:TextBox>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label1" runat="server" Text="UF:"></asp:Label>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                                                ControlToValidate="DropDownListUF" ErrorMessage="UF obrigatório.">*</asp:RequiredFieldValidator>
                                                            <br />
                                                            <asp:DropDownList ID="DropDownListUF" runat="server" DataSourceID="SqlUF" 
                                                                DataTextField="uf" DataValueField="dsuf" SelectedValue='<%# Bind("UF") %>' 
                                                                type="text" Width="75px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <asp:Label ID="Label6" runat="server" Text="E-Mail que receberá os Currículos:"></asp:Label>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                    ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="E-mail é obrigatório!" 
                                                    SetFocusOnError="True" 
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                    ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="E-mail é obrigatório!" 
                                                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="emailTextBox" runat="server" CssClass="withIconEmail" MaxLength="180" Text='<%# Bind("email") %>' Width="300px" />
                                                <br />
                                                <asp:Label ID="Label7Insert" runat="server" Text="Validade desta publicação:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                    ControlToValidate="validadeTextBoxINSERT" Display="Dynamic" ErrorMessage="Informe a validade desta vaga!" 
                                                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                    ControlToValidate="validadeTextBoxINSERT" Display="Dynamic" ErrorMessage="Informe uma data válida!" 
                                                    SetFocusOnError="True" 
                                                    
                                                    ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d">*</asp:RegularExpressionValidator>
                                                <br />
                                                <asp:TextBox ID="validadeTextBoxINSERT" runat="server" CssClass="simple" 
                                                    Text='<%# Bind("validade", "{0:d}") %>' Width="300px" />
                                                <cc1:CalendarExtender ID="validadeTextBox_CalendarExtender" runat="server" 
                                                    Enabled="True" Format="dd/M/yyyy" TargetControlID="validadeTextBoxINSERT">
                                                </cc1:CalendarExtender>
                                                <br />
                                                <asp:Label ID="Label8" runat="server" 
                                                    Text="Código de Referência: (Para seu controle)"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="referenciaTextBox" runat="server" CssClass="simple" 
                                                    MaxLength="180" Text='<%# Bind("referencia") %>' Width="300px" Enabled="False" />
                                                <br />
                                                <br />
                                            </td>
                                            <td class="right">
                                                <asp:Label ID="LabelNivelProf" runat="server" Text="Nível Profissional:"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="DropDownListNivelProfissional" runat="server" 
                                                    CssClass="DropCadEmp" DataSourceID="SqlNivelProfissional" type="text" 
                                                    DataTextField="dsNivelProfissional" DataValueField="idNivelProfissional" 
                                                    SelectedValue='<%# Bind("idNivelProfissional") %>' Width="410px">
                                                </asp:DropDownList>
                                                <br />
                                                <asp:Label ID="Label3" runat="server" Text="Principais atribuições do cargo:"></asp:Label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                    ControlToValidate="dsVagaPublicaTextBox" Display="Dynamic" ErrorMessage="Quais as atribuições do cargo?" 
                                                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="dsVagaPublicaTextBox" runat="server" CssClass="simple" 
                                                    Height="225px" ondatabinding="dsVagaPublicaTextBox_DataBinding" 
                                                    Text='<%# Bind("dsVagaPublica") %>' TextMode="MultiLine" Width="400px" />
                                                <br />
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td>
                                                            <br />
                                                            <asp:CheckBox ID="publicarCheckBox" runat="server" 
                                                                Checked='<%# Bind("publicar") %>' Text="Publicar esta vaga" ToolTip="Selecione aqui para publicar esta vaga." />
                                                        </td>
                                                        <td>
                                                            <br />
                                                            <asp:CheckBox ID="CheckBoxPNE" runat="server" AutoPostBack="True" 
                                                                oncheckedchanged="CheckBoxPNE_CheckedChanged" 
                                                                Text="(PNE)" 
                                                                Checked='<%# Bind("pne") %>' ToolTip="Pessoa com Necessidades Especiais" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:ValidationSummary ID="ValidationSummary3" runat="server" ShowMessageBox="True" ShowSummary="False" />
                                                <br />
                                                <br />
                                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                    CommandName="Insert" CssClass="button" Text="Publicar vaga" />
                                                <asp:LinkButton ID="LinkButtonCargosINSERT" runat="server" CausesValidation="False" CommandName="Select" CssClass="button" onclick="LinkButtonCargosINSERT_Click" ToolTip="Veja os cargos relacionados na tabela CBO (Classificação Brasileira de Ocupações - Ministério do Trabalho)">Veja os cargos relacionados</asp:LinkButton>
                                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                                    CssClass="button" onclick="UpdateCancelButton_Click" Text="Cancelar"></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        &nbsp;
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Vaga selecionada para edição
                        <h1><asp:Label ID="titVagaPublicaLabel" runat="server" 
                            Text='<%# Bind("titVagaPublica") %>' /></h1>
                        <br />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Editar esta vaga" CssClass="button" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Excluir vaga" 
                            onclientclick="return confirm(&quot;Você quer excluir esta vaga?&quot;)" 
                            CssClass="button" />
                        &nbsp;<asp:LinkButton ID="LinkButtonCancelar" runat="server" 
                            onclick="LinkButtonCancelar_Click" CssClass="button">Cancelar</asp:LinkButton>
                        <br />
                        <br />
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <asp:Label ID="infoIncVagaLabel" runat="server"></asp:Label>
                    </EmptyDataTemplate>
                </asp:FormView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <br />
                <br />
                <br />
           </td> 
        </tr>
    </table>
<asp:Panel ID="PanelPSQ" runat="server">
        <table ID="Aviso" cellpadding="5" cellspacing="5">
            <tr>
                <td>
                    <asp:Label ID="LabelDica" runat="server" Text="Informe o cargo para a nova vaga, em seguida clique no botão &quot;Pesquisar&quot;. Será apresentado uma lista de cargos que mais se aproxima com o informado na pesquisa. Ao selecionar um dos cargos, será apresentado o formulário para preenchimento.&lt;br&gt;&lt;br&gt;&lt;b&gt;&lt;i&gt;Obs.: Você pode &quot;pular&quot; esta etapa sem informar o cargo CBO.&lt;/i&gt;&lt;/b&gt;"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
        </table>
        <table ID="PSQ" align="center" cellpadding="5" cellspacing="5" width="700px">
            <tr>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBoxPsq" ErrorMessage="Informe o cargo, (CBO)" ValidationGroup="PSQ">•</asp:RequiredFieldValidator>
                    <asp:TextBox ID="TextBoxPsq" runat="server" CssClass="simple" ValidationGroup="PSQ" Width="350px"></asp:TextBox></td>
                <td><asp:LinkButton ID="LinkButtonPESQUISAR" runat="server" CssClass="button" onclientclick="GetMensagem();" ValidationGroup="PSQ" ToolTip="Preencha o campo de pesquisa e selecione um cargo, depois clique aqui.">Pesquisar</asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonPular" runat="server" CssClass="button" ToolTip="Se você deseja &quot;não&quot; vincular esta vaga com um cargo, clique aqui." CausesValidation="False">Pular</asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonSAIR" runat="server" CssClass="button" PostBackUrl="~/_parceiroJobClick/Default.aspx" CausesValidation="False" ToolTip="Para voltar para a página principal, clique aqui.">Sair</asp:LinkButton>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
        ShowMessageBox="True" ShowSummary="False" ValidationGroup="PSQ" />
    <asp:SqlDataSource ID="SqlForm" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="DELETE FROM [tbVagaPublica] WHERE [idVagaPublica] = @idVagaPublica" 
        InsertCommand="INSERT INTO tbVagaPublica(idCadastroEmpresa, idfuncao, titVagaPublica, dsVagaPublica, email, data, validade, codigo, referencia, publicar, nroVaga, localTrabalho, UF, pne, idCBOOcupacao, idNivelProfissional) VALUES (@idCadastroEmpresa, @idfuncao, @titVagaPublica, @dsVagaPublica, @email, @data, @validade, @codigo, @referencia, @publicar, @nroVaga, @localTrabalho, @UF, @pne, @idCBOOcupacao, @idNivelProfissional)" 
        SelectCommand="SELECT idVagaPublica, idCadastroEmpresa, idfuncao, titVagaPublica, dsVagaPublica, email, data, validade, codigo, referencia, publicar, nroVaga, localTrabalho, UF, ISNULL(idCBOOcupacao, 0) AS idCBOOcupacao, pne, idNivelProfissional FROM tbVagaPublica WHERE (idCadastroEmpresa = @idCadastroEmpresa) AND (idVagaPublica = @idVagaPublica)" 
        
        
        
        
        
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

        </div>
    </div>
</asp:Content>

