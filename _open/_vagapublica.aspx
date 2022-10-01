<%@ Page Language="VB" MasterPageFile="~/_empresa/EmpresaPage.master" AutoEventWireup="false" CodeFile="_vagapublica.aspx.vb" Inherits="_empresa_vagapublica" title="Untitled Page" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register src="../App_Include/pesquisaFuncao.ascx" tagname="pesquisaFuncao" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                    <asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
    <br />
    <br />
    <table width="640" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26" valign="top">
                <asp:ImageButton ID="ImageButtonPSQL" runat="server" 
                    ImageUrl="~/images/empresa/btiniPesquisaCargo.png" />
            </td>
            <td width="614">
                <asp:Label ID="LabelAviso" runat="server" 
                    Text="Antes de iniciar a publicação, será necessário pesquisar uma [Função] para a vaga. A pesquisa irá vincular todos Candidatos que possuem a mesma [Função] em seus Currículos e convidá-los através de e-mails a se candidatar a sua vaga."></asp:Label>
                <asp:Label ID="idVagaPublicaLabel" runat="server" Visible="False"></asp:Label>
                <!-- [ <asp:LinkButton ID="PSQlb" runat="server" CausesValidation="False">Incluir uma nova Vaga</asp:LinkButton> ] -->
                <asp:Label ID="idfuncaoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="dsfuncaoLabel" runat="server" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:ImageButton ID="PSQlb2" runat="server"  CausesValidation="False" 
                    ImageUrl="~/images/layoutNew/btNovaOportunidade.png"/>
                <br />
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <br />
                <asp:GridView ID="GridViewListaVagas" runat="server" AutoGenerateColumns="False" 
                    BorderStyle="None" DataKeyNames="idVagaPublica" DataSourceID="SqlDataGrid" 
                    GridLines="None" HorizontalAlign="Left" Width="614px" AllowPaging="True">
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
                            SortExpression="codigo" />
                        <asp:BoundField DataField="titVagaPublica" HeaderText="Vaga" 
                            SortExpression="titVagaPublica" />
                        <asp:BoundField DataField="dsVagaPublica" HeaderText="dsVagaPublica" 
                            SortExpression="dsVagaPublica" Visible="False" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" 
                            Visible="False" />
                        <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" 
                            Visible="False" />
                        <asp:BoundField DataField="validade" HeaderText="Validade" 
                            SortExpression="validade" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="referencia" HeaderText="referencia" 
                            SortExpression="referencia" Visible="False" />
                        <asp:CheckBoxField DataField="publicar" HeaderText="Publicada" 
                            SortExpression="publicar" />
                        <asp:CommandField SelectText="Editar" ShowSelectButton="True">
                            <ItemStyle Width="60px" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="Azure" />
                </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                <asp:GridView ID="GridViewPsqCargo" runat="server" AutoGenerateColumns="False" 
                    BorderColor="Silver" BorderStyle="Dotted" BorderWidth="1px" 
                    DataKeyNames="idfuncao,dsfuncao" DataSourceID="SqlDataSourcePesquisa" 
                    Width="100%" AllowPaging="True" AllowSorting="True" PageSize="50">
                    <Columns>
                        <asp:BoundField DataField="idfuncao" HeaderText="idfuncao" 
                            InsertVisible="False" ReadOnly="True" SortExpression="idfuncao" 
                            Visible="False" />
                        <asp:BoundField DataField="dsfuncao" HeaderText="dsfuncao" 
                            SortExpression="dsfuncao" Visible="False" />
                        <asp:ButtonField CommandName="Select" DataTextField="dsfuncao" 
                            HeaderText="Cargo(s) encontrado(s)" Text="Button">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:ButtonField>
                    </Columns>
                    <PagerSettings Position="TopAndBottom" />
                </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:FormView ID="FormViewVaga" runat="server" DataKeyNames="idVagaPublica" 
                    DataSourceID="SqlForm" Width="614px" Visible="False">
                    <EditItemTemplate>
                        Título para a vaga:<asp:TextBox ID="codigoTextBox" runat="server" Text='<%# Bind("codigo") %>' 
                            Visible="False" Width="5px" />
                        <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>' 
                            Visible="False" Width="5px" />
                        <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" 
                            Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="5px" />
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("idfuncao") %>' 
                            Visible="False" Width="5px"></asp:TextBox>
                        <br />
                        <asp:TextBox ID="titVagaPublicaEditTextBox" runat="server" CssClass="InputCadEmp" 
                            MaxLength="50" Text='<%# Bind("titVagaPublica") %>' Enabled="False" />
                        <cc1:TextBoxWatermarkExtender ID="titVagaPublicaEditTextBox_TextBoxWatermarkExtender" 
                            runat="server" Enabled="True" TargetControlID="titVagaPublicaEditTextBox" 
                            WatermarkText="Pesquise um cargo.">
                        </cc1:TextBoxWatermarkExtender>
                        <br />
                        Descrição Geral da vaga:<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="dsVagaPublicaTextBox" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="dsVagaPublicaTextBox" runat="server" CssClass="InputCadEmp" 
                            Height="326px" Text='<%# Bind("dsVagaPublica") %>' TextMode="MultiLine" 
                            ondatabinding="dsVagaPublicaTextBox_DataBinding" />
                        <br />
                        <br />
                        <asp:CheckBox ID="CheckBoxPNE" runat="server" AutoPostBack="True" 
                            oncheckedchanged="CheckBoxPNE_CheckedChanged" 
                            Text="Portador de Necessidade Especiais (PNE)" />
                        <br />
                        <br />
                        Número de vagas:<asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                            runat="server" ControlToValidate="nroVagasTextBox" Display="Dynamic" 
                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
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
                                    Local de trabalho: Ex.: São Paulo - SP<asp:RequiredFieldValidator 
                                        ID="RequiredFieldValidator6" runat="server" 
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
                                    <asp:DropDownList ID="DropDownListUF" runat="server" CssClass="DropUF" 
                                        DataSourceID="SqlUF" DataTextField="uf" DataValueField="uf" 
                                        SelectedValue='<%# Bind("UF") %>'>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        E-Mail que receberá os profiles (Currículos):<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator3" runat="server" ControlToValidate="emailTextBox" 
                            Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <br />
                        <asp:TextBox ID="emailTextBox" runat="server" CssClass="InputCadEmp" 
                            MaxLength="180" Text='<%# Bind("email") %>' Enabled="False" />
                        <br />
                        Validade desta publicação:<asp:RegularExpressionValidator 
                            ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="validadeTextBox" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True" 
                            ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="validadeTextBox" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="validadeTextBox" runat="server" CssClass="InputCadEmp" 
                            Text='<%# Bind("validade", "{0:d}") %>' />
                        <cc1:CalendarExtender ID="validadeTextBox_CalendarExtender" runat="server" 
                            Enabled="True" Format="dd/M/yyyy" TargetControlID="validadeTextBox">
                        </cc1:CalendarExtender>
                        <br />
                        Dados de referência da vaga: (Opcional - Para seu controle)<br />
                        <asp:TextBox ID="referenciaTextBox" runat="server" CssClass="InputCadEmp" 
                            MaxLength="180" Text='<%# Bind("referencia") %>' />
                        <br />
                        <br />
                        <asp:CheckBox ID="publicarCheckBox" runat="server" 
                            Checked='<%# Bind("publicar") %>' Text="Publicar esta vaga" />
                        <br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Atualizar os dados desta vaga" />
                        &nbsp;|&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                            CommandName="Delete" 
                            onclientclick="return confirm(&quot;Você quer excluir esta vaga?&quot;)" 
                            Text="Excluir vaga" />
                        &nbsp;|
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Título para a vaga:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                            runat="server" ControlToValidate="titVagaPublicaTextBox" Display="Dynamic" 
                            ErrorMessage="Informe o título da Vaga" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:TextBox ID="codigoTextBox" runat="server" CssClass="InputCadEmp" 
                            Text='<%# Bind("codigo") %>' Visible="False" Width="5px" />
                        <br />
                        <asp:TextBox ID="titVagaPublicaTextBox" runat="server" 
                            Text='<%# Bind("titVagaPublica") %>' CssClass="InputCadEmp" 
                            MaxLength="50" Enabled="False" />
                        <br />
                        Descrição Geral da vaga:<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="dsVagaPublicaTextBox" Display="Dynamic" ErrorMessage="Descrição é campo obrigatório." 
                            SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="dsVagaPublicaTextBox" runat="server" 
                            Text='<%# Bind("dsVagaPublica") %>' CssClass="InputCadEmp" Height="326px" 
                            TextMode="MultiLine" />
                        <br />
                        <br />
                        <asp:CheckBox ID="CheckBoxPNE" runat="server" AutoPostBack="True" 
                            oncheckedchanged="CheckBoxPNE_CheckedChanged" 
                            Text="Portador de Necessidade Especiais (PNE)" />
                        <br />
                        <br />
                        Número de vagas:<asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                            runat="server" ControlToValidate="nroVagasTextBox" Display="Dynamic" 
                            ErrorMessage="Campo número de vagas é obrigatório." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                            ControlToValidate="nroVagasTextBox" Display="Dynamic" ErrorMessage="Campo numérico" 
                            SetFocusOnError="True" ValidationExpression="\d{1,9}">*</asp:RegularExpressionValidator>
                        <br />
                        <asp:TextBox ID="nroVagasTextBox" runat="server" CssClass="InputCadEmp" 
                            Text='<%# Bind("nroVaga") %>'></asp:TextBox>
                        <br />
                        <br />
                        <table align="left" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    Local de trabalho: Ex.: São Paulo - SP<asp:RequiredFieldValidator 
                                        ID="RequiredFieldValidator6" runat="server" 
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
                                    <asp:DropDownList ID="DropDownListUF" runat="server" CssClass="DropUF" 
                                        DataSourceID="SqlUF" DataTextField="uf" DataValueField="uf" 
                                        SelectedValue='<%# Bind("UF") %>'>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        E-Mail que receberá os profiles (Currículos):<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator3" runat="server" ControlToValidate="emailTextBox" 
                            Display="Dynamic" ErrorMessage="E-mail é obrigatório." 
                            SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="Informe e-mail válido." 
                            SetFocusOnError="True" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                        <br />
                        <asp:TextBox ID="emailTextBox" runat="server" CssClass="InputCadEmp" 
                            Text='<%# Bind("email") %>' MaxLength="180"></asp:TextBox>
                        <br />
                        Validade desta publicação:<asp:RegularExpressionValidator 
                            ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="validadeTextBox" Display="Dynamic" ErrorMessage="Data inválida!" 
                            SetFocusOnError="True" 
                            
                            ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d">*</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="validadeTextBox" Display="Dynamic" ErrorMessage="Data da validade da vaga obrigatória." 
                            SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="validadeTextBox" runat="server" 
                            Text='<%# Bind("validade") %>' CssClass="InputCadEmp" />
                        <cc1:CalendarExtender ID="validadeTextBox_CalendarExtender" runat="server" 
                            Enabled="True" Format="dd/M/yyyy" TargetControlID="validadeTextBox">
                        </cc1:CalendarExtender>
                        <br />
                        Código de Referência: (Opcional)<br />
                        <asp:TextBox ID="referenciaTextBox" runat="server" 
                            Text='<%# Bind("referencia") %>' CssClass="InputCadEmp" MaxLength="180" />
                        <br />
                        <br />
                        <asp:CheckBox ID="publicarCheckBox" runat="server" 
                            Checked='<%# Bind("publicar") %>' Text="Publicar esta vaga" />
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Salvar os dados desta vaga" />
                        &nbsp;|&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            ShowMessageBox="True" ShowSummary="False" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Vaga selecionada para edição
                        <asp:Label ID="titVagaPublicaLabel" runat="server" 
                            Text='<%# Bind("titVagaPublica") %>' Font-Bold="True" />
                        <br />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Editar esta vaga" />
                        &nbsp;|&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Excluir vaga" 
                            onclientclick="return confirm(&quot;Você quer excluir esta vaga?&quot;)" />
                        &nbsp;|
                        <asp:LinkButton ID="LinkButtonCancelar" runat="server" 
                            onclick="LinkButtonCancelar_Click">Cancelar</asp:LinkButton>
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
    <asp:Panel ID="PanelPSQ" runat="server" BackColor="#E6F0F0" 
        BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" 
        CssClass="DGVAGAPosition" Visible="False" Width="580px">
        <table ID="Aviso" cellpadding="5" cellspacing="5">
            <tr>
                <td>
                    <asp:Label ID="LabelDica" runat="server" 
                        Text="Informe o cargo que o Levantamento do Perfil da Vaga está recrutando, em seguida clique no botão &quot;Buscar por um Cargo&quot;. Será apresentado uma lista de cargos que mais se aproxima com o informado. Para fechar o campo de pesquisa clique no botão [X] ao lado."></asp:Label>
                </td>
                <td>
                    <asp:ImageButton ID="ImageButtonClose" runat="server" 
                        ImageUrl="~/images/close.png" CausesValidation="False" />
                </td>
            </tr>
        </table>
        <table ID="PSQ" align="center" cellpadding="5" cellspacing="5">
            <tr>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="TextBoxPsq" Display="Dynamic" 
                        ErrorMessage="* Inicie sua pesquisa com no mínimo 5 caracteres" 
                        ValidationGroup="PSQ">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="TextBoxPsq" Display="Dynamic" 
                        ErrorMessage="* Inicie sua pesquisa com no mínimo 5 caracteres" 
                        SetFocusOnError="True" 
                        ValidationExpression="^[a-zA-Z0-9!¡$%&amp;/\()=?¿*+-_{};:,áéíóú'.\s][^&gt;][^&lt;]{5,50}$" 
                        ValidationGroup="PSQ">*</asp:RegularExpressionValidator>
                                <br />
                                <asp:TextBox ID="TextBoxPsq" runat="server" CssClass="InputCad" 
                        ValidationGroup="PSQ" Width="200px"></asp:TextBox>
                </td>
                <td>
                    <asp:ImageButton ID="ImageButtonPSQ" runat="server" 
                        ImageUrl="~/images/empresa/btPesquisaCargo.png" ValidationGroup="PSQ" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <cc1:DragPanelExtender ID="PanelPSQ_DragPanelExtender" runat="server" 
        DragHandleID="PanelPSQ" Enabled="True" TargetControlID="PanelPSQ">
    </cc1:DragPanelExtender>
    <br />
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
        ShowMessageBox="True" ShowSummary="False" ValidationGroup="PSQ" />
    <asp:SqlDataSource ID="SqlForm" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="DELETE FROM [tbVagaPublica] WHERE [idVagaPublica] = @idVagaPublica" 
        InsertCommand="INSERT INTO tbVagaPublica(idCadastroEmpresa, idfuncao, titVagaPublica, dsVagaPublica, email, data, validade, codigo, referencia, publicar, nroVaga, localTrabalho, UF) VALUES (@idCadastroEmpresa, @idfuncao, @titVagaPublica, @dsVagaPublica, @email, @data, @validade, @codigo, @referencia, @publicar, @nroVaga, @localTrabalho, @UF)" 
        SelectCommand="SELECT idVagaPublica, idCadastroEmpresa, idfuncao, titVagaPublica, dsVagaPublica, email, data, validade, codigo, referencia, publicar, nroVaga, localTrabalho, UF FROM tbVagaPublica WHERE (idCadastroEmpresa = @idCadastroEmpresa) AND (idVagaPublica = @idVagaPublica)" 
        
        
        
        UpdateCommand="UPDATE tbVagaPublica SET idCadastroEmpresa = @idCadastroEmpresa, idfuncao = @idfuncao, titVagaPublica = @titVagaPublica, dsVagaPublica = @dsVagaPublica, email = @email, data = @data, validade = @validade, codigo = @codigo, referencia = @referencia, publicar = @publicar, nroVaga = @nroVaga, localTrabalho = @localTrabalho, UF = @UF WHERE (idVagaPublica = @idVagaPublica)">
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
        SelectCommand="spPesquisaCadastraFuncao" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxPsq" Name="buscador" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlUF" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [uf], [dsuf] FROM [tbuf]"></asp:SqlDataSource>
    </asp:Content>

