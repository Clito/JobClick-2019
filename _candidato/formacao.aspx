<%@ Page Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="formacao.aspx.vb" Inherits="_candidato_formacao" title="Jobclick" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Cabec" runat="server" Text="Formação Acadêmica" CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>
    <table width="720px" cellpadding="0" cellspacing="0" style="margin-bottom: 0px" align="center">
        <tr>
            <td width="30px">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="690px" align="left">
                                <asp:Label ID="msn0" runat="server" CssClass="msn"></asp:Label>
                                <asp:Label ID="CidadeLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="UFLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="TIPOLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idInstituicaoLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="idFormacaoLabel" runat="server" Visible="False"></asp:Label>
                                <asp:GridView ID="GridViewCURSO" runat="server" AutoGenerateColumns="False" 
                                    BorderStyle="None" DataKeyNames="idFormacao" 
                                    DataSourceID="SqlDataSourceFormacao" GridLines="None" Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="idFormacao" HeaderText="idFormacao" 
                                            InsertVisible="False" ReadOnly="True" SortExpression="idFormacao" 
                                            Visible="False" />
                                        <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" 
                                            SortExpression="idcurriculo" Visible="False" />
                                        <asp:BoundField DataField="idTipoFormacao" HeaderText="idTipoFormacao" 
                                            SortExpression="idTipoFormacao" Visible="False" />
                                        <asp:BoundField DataField="idInstituicao" HeaderText="idInstituicao" 
                                            SortExpression="idInstituicao" Visible="False" />
                                        <asp:BoundField DataField="dsCurso" HeaderText="Curso" SortExpression="dsCurso" 
                                            Visible="False" />
                                        <asp:BoundField DataField="obs" HeaderText="obs" SortExpression="obs" 
                                            Visible="False" />
                                        <asp:BoundField DataField="data_ini" HeaderText="data_ini" 
                                            SortExpression="data_ini" Visible="False" />
                                        <asp:BoundField DataField="data_fim" HeaderText="data_fim" 
                                            SortExpression="data_fim" Visible="False" />
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                •
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                                    CommandName="Select" Text='<%# Eval("dsCurso") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <br />
                                <asp:ImageButton ID="ImageButtonIncFormacao" runat="server" 
                                    ImageUrl="~/_candidato/images/buttonFORMACAOACADEMICA.png" />
                                <asp:ImageButton ID="ImageButtonVoltar" runat="server" 
                                    ImageUrl="~/_candidato/images/menuprincipal.png" 
                                    CausesValidation="False" />
                                <br />
                                <br />
                                <asp:Panel ID="PanelPesquisa" runat="server" BackColor="#FFFFEA" 
                                    CssClass="CVPositionxxx" Visible="False"><br />
                                    <table cellpadding="2" cellspacing="2" width="100%" bgcolor="#EFEFEF">
                                        <tr>
                                            <td align="right">
                                                <asp:LinkButton ID="LinkButtonFechar" runat="server">[X] Fechar</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <table cellpadding="2" cellspacing="0" align="left">
                                        <tr>
                                            <td>
                                                <asp:DropDownList ID="DropDownListUF" runat="server" AutoPostBack="True" 
                                                    CssClass="DropCad" DataSourceID="SqlDataUF" DataTextField="dsuf" 
                                                    DataValueField="uf" Width="200px">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListCIDADES" runat="server" AutoPostBack="True" 
                                                    CssClass="DropCad" DataSourceID="SqlCidadeEntidade_UF" DataTextField="estado" 
                                                    DataValueField="estado" Width="290px">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownListTIPO" runat="server" AutoPostBack="True" 
                                                    CssClass="DropCad" DataSourceID="SqlTIPOENTIDADE" DataTextField="dsTipo" 
                                                    DataValueField="dsTipo" Width="150px">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                    <br /><br />
                                    <br />
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="10%">
                                                &nbsp;</td>
                                            <td width="80%">
                                                <asp:GridView ID="GridViewLISTA" runat="server" AllowPaging="True" 
                                                    AutoGenerateColumns="False" BorderStyle="None" DataKeyNames="idInstituicao,dsinstituicao" 
                                                    DataSourceID="SqlEntidadeLISTA" GridLines="None" ShowHeader="False" 
                                                    Width="100%">
                                                    <AlternatingRowStyle BackColor="#F3F3F3" />
                                                    <Columns>
                                                        <asp:BoundField DataField="idInstituicao" HeaderText="idInstituicao" 
                                                            InsertVisible="False" ReadOnly="True" SortExpression="idInstituicao" 
                                                            Visible="False" />
                                                        <asp:TemplateField ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                                                    CommandName="Select" 
                                                                    onclientclick="return confirm(&quot;Você deseja incluir sua Formação Acadêmica com esta entidade?&quot;)" 
                                                                    Text='<%# Eval("dsinstituicao") %>'></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <PagerSettings Position="TopAndBottom" />
                                                </asp:GridView>
                                            </td>
                                            <td width="10%">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />
                                    <table align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="center">
                                                <asp:ImageMap ID="ImageMapBrasil" runat="server" HotSpotMode="PostBack" 
                                                    ImageUrl="~/images/layout/mapaBrasil.gif">
                                                    <asp:CircleHotSpot HotSpotMode="PostBack" PostBackValue="SP" Radius="10" 
                                                        X="208" Y="245" />
                                                    <asp:CircleHotSpot PostBackValue="RJ" Radius="10" X="269" Y="251" />
                                                    <asp:CircleHotSpot PostBackValue="MG" Radius="10" X="245" Y="220" />
                                                    <asp:CircleHotSpot PostBackValue="GO" Radius="10" X="200" Y="205" />
                                                    <asp:CircleHotSpot PostBackValue="PR" Radius="10" X="185" Y="270" />
                                                    <asp:CircleHotSpot PostBackValue="SC" Radius="10" X="197" Y="290" />
                                                    <asp:CircleHotSpot PostBackValue="RS" Radius="10" X="175" Y="310" />
                                                    <asp:CircleHotSpot PostBackValue="MS" Radius="10" X="164" Y="230" />
                                                    <asp:CircleHotSpot PostBackValue="ES" Radius="10" X="286" Y="237" />
                                                    <asp:CircleHotSpot PostBackValue="DF" Radius="10" X="210" Y="185" />
                                                    <asp:CircleHotSpot PostBackValue="MT" Radius="10" X="158" Y="172" />
                                                    <asp:CircleHotSpot PostBackValue="BA" Radius="10" X="269" Y="172" />
                                                    <asp:CircleHotSpot PostBackValue="SE" Radius="10" X="311" Y="166" />
                                                    <asp:CircleHotSpot PostBackValue="AL" Radius="10" X="322" Y="154" />
                                                    <asp:CircleHotSpot PostBackValue="PE" Radius="10" X="329" Y="140" />
                                                    <asp:CircleHotSpot PostBackValue="PB" Radius="10" X="332" Y="126" />
                                                    <asp:CircleHotSpot PostBackValue="RN" Radius="10" X="324" Y="107" />
                                                    <asp:CircleHotSpot PostBackValue="CE" Radius="10" X="286" Y="107" />
                                                    <asp:CircleHotSpot PostBackValue="MA" Radius="10" X="238" Y="109" />
                                                    <asp:CircleHotSpot PostBackValue="PI" Radius="10" X="260" Y="135" />
                                                    <asp:CircleHotSpot PostBackValue="TO" Radius="10" X="215" Y="152" />
                                                    <asp:CircleHotSpot PostBackValue="PA" Radius="10" X="175" Y="109" />
                                                    <asp:CircleHotSpot PostBackValue="AP" Radius="10" X="185" Y="55" />
                                                    <asp:CircleHotSpot PostBackValue="RR" Radius="10" X="109" Y="46" />
                                                    <asp:CircleHotSpot PostBackValue="AM" Radius="10" X="87" Y="99 " />
                                                    <asp:CircleHotSpot PostBackValue="AC" Radius="10" X="45" Y="150 " />
                                                    <asp:CircleHotSpot PostBackValue="RO" Radius="10" X="96" Y="156 " />
                                                </asp:ImageMap>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <asp:FormView ID="FormViewEntidade" runat="server" DataKeyNames="idInstituicao" 
                                                    DataSourceID="SqlEntidadeFORM" DefaultMode="Insert" Visible="False">
                                                    <EditItemTemplate>
                                                        idInstituicao:
                                                        <asp:Label ID="idInstituicaoLabel1" runat="server" 
                                                            Text='<%# Eval("idInstituicao") %>' />
                                                        <br />
                                                        identidadeTipo:
                                                        <asp:TextBox ID="identidadeTipoTextBox" runat="server" 
                                                            Text='<%# Bind("identidadeTipo") %>' />
                                                        <br />
                                                        dsinstituicao:
                                                        <asp:TextBox ID="dsinstituicaoTextBox" runat="server" 
                                                            Text='<%# Bind("dsinstituicao") %>' />
                                                        <br />
                                                        estado:
                                                        <asp:TextBox ID="estadoTextBox" runat="server" Text='<%# Bind("estado") %>' />
                                                        <br />
                                                        uf:
                                                        <asp:TextBox ID="ufTextBox" runat="server" Text='<%# Bind("uf") %>' />
                                                        <br />
                                                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                                                            onclick="InsertCancelButton_Click" Text="Fechar" />
                                                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                                            ControlToValidate="DropDownListTipo" Display="Dynamic" 
                                                            ErrorMessage="Em qual grupo a entidade pertence?">•</asp:RequiredFieldValidator>
                                                        <asp:Label ID="Label1" runat="server" Text="Grupo:"></asp:Label>
                                                        <br />
                                                        <asp:DropDownList ID="DropDownListTipo" runat="server" 
                                                            AppendDataBoundItems="True" CssClass="DropCad" DataSourceID="SqlEntidadeTIPO" 
                                                            DataTextField="dsTipo" DataValueField="identidadeTipo" 
                                                            SelectedValue='<%# Bind("identidadeTipo", "{0}") %>'>
                                                            <asp:ListItem Value="0">-- Informe Grupo --</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <br />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                            ControlToValidate="dsinstituicaoTextBox" Display="Dynamic" 
                                                            ErrorMessage="Informe o nome da Entidade de ensino." 
                                                            ValidationGroup="EntidadeForm">•</asp:RequiredFieldValidator>
                                                        <asp:Label ID="Label2" runat="server" Text="Entidade:"></asp:Label>
                                                        <br />
                                                        <asp:TextBox ID="dsinstituicaoTextBox" runat="server" CssClass="InputCad" 
                                                            MaxLength="150" Text='<%# Bind("dsinstituicao") %>' 
                                                            ValidationGroup="EntidadeForm" />
                                                        <br />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                                            ControlToValidate="estadoTextBox" Display="Dynamic" 
                                                            ErrorMessage="Informe em qual cidade está a Entidade." 
                                                            ValidationGroup="EntidadeForm">•</asp:RequiredFieldValidator>
                                                        <asp:Label ID="Label3" runat="server" Text="Cidade:"></asp:Label>
                                                        <br />
                                                        <asp:TextBox ID="estadoTextBox" runat="server" CssClass="InputCad" 
                                                            MaxLength="80" Text='<%# Bind("estado") %>' ValidationGroup="EntidadeForm" />
                                                        <br />
                                                        <asp:Label ID="Label4" runat="server" Text="UF:"></asp:Label>
                                                        <br />
                                                        <asp:DropDownList ID="DropDownListUF" runat="server" 
                                                            AppendDataBoundItems="True" CssClass="DropCad" DataSourceID="SqlDataUF" 
                                                            DataTextField="uf" DataValueField="uf" SelectedValue='<%# Bind("uf") %>'>
                                                            <asp:ListItem Value="0">Informe a Sigla do estado (UF)</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <br />
                                                        <asp:ValidationSummary ID="ValidationSummary3" runat="server" 
                                                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="EntidadeForm" />
                                                        <br />
                                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                                            CommandName="Insert" Text="Salvar" ValidationGroup="EntidadeForm" />
                                                        &nbsp;|&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                                            CausesValidation="False" onclick="InsertCancelButton_Click" Text="Fechar" />
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        idInstituicao:
                                                        <asp:Label ID="idInstituicaoLabel" runat="server" 
                                                            Text='<%# Eval("idInstituicao") %>' />
                                                        <br />
                                                        identidadeTipo:
                                                        <asp:Label ID="identidadeTipoLabel" runat="server" 
                                                            Text='<%# Bind("identidadeTipo") %>' />
                                                        <br />
                                                        dsinstituicao:
                                                        <asp:Label ID="dsinstituicaoLabel" runat="server" 
                                                            Text='<%# Bind("dsinstituicao") %>' />
                                                        <br />
                                                        estado:
                                                        <asp:Label ID="estadoLabel" runat="server" Text='<%# Bind("estado") %>' />
                                                        <br />
                                                        uf:
                                                        <asp:Label ID="ufLabel" runat="server" Text='<%# Bind("uf") %>' />
                                                        <br />
                                                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                                            CommandName="Edit" Text="Edit" />
                                                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                                            CommandName="Delete" Text="Delete" />
                                                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                                            CommandName="New" Text="New" />
                                                    </ItemTemplate>
                                                </asp:FormView>
                                                <br />
                                                <asp:SqlDataSource ID="SqlEntidadeFORM" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                    DeleteCommand="DELETE FROM [tbEntidadeEnsino] WHERE [idInstituicao] = @idInstituicao" 
                                                    InsertCommand="INSERT INTO [tbEntidadeEnsino] ([identidadeTipo], [dsinstituicao], [estado], [uf]) VALUES (@identidadeTipo, @dsinstituicao, @estado, @uf)" 
                                                    SelectCommand="SELECT [idInstituicao], [identidadeTipo], [dsinstituicao], [estado], [uf] FROM [tbEntidadeEnsino]" 
                                                    UpdateCommand="UPDATE [tbEntidadeEnsino] SET [identidadeTipo] = @identidadeTipo, [dsinstituicao] = @dsinstituicao, [estado] = @estado, [uf] = @uf WHERE [idInstituicao] = @idInstituicao">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="idInstituicao" Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="identidadeTipo" Type="Int32" />
                                                        <asp:Parameter Name="dsinstituicao" Type="String" />
                                                        <asp:Parameter Name="estado" Type="String" />
                                                        <asp:Parameter Name="uf" Type="String" />
                                                    </InsertParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="identidadeTipo" Type="Int32" />
                                                        <asp:Parameter Name="dsinstituicao" Type="String" />
                                                        <asp:Parameter Name="estado" Type="String" />
                                                        <asp:Parameter Name="uf" Type="String" />
                                                        <asp:Parameter Name="idInstituicao" Type="Int32" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>
                                                <asp:SqlDataSource ID="SqlEntidadeTIPO" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                    SelectCommand="SELECT [identidadeTipo], [dsTipo] FROM [tbInstituicaoTipo]">
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <asp:ImageButton ID="ImageButtonNovaEntidade" runat="server" 
                                        ImageUrl="~/_candidato/images/buttonENTIDADEDEENSINO.png" Visible="False" 
                                        CausesValidation="False" 
                                        onclientclick="return confirm(&quot;Se você já fez a pesquisa para localizar a sua entidade de ensino e não encontrou, clique em [Ok] para cadastrá-la.&quot;)" />
                                    <br />
                                    <br />
                                </asp:Panel>
                                <cc1:DragPanelExtender ID="PanelPesquisa_DragPanelExtender" runat="server" 
                                    DragHandleID="PanelPesquisa" Enabled="True" TargetControlID="PanelPesquisa">
                                </cc1:DragPanelExtender>
                                <asp:Panel ID="PanelForm" runat="server">
                                    <br />
                                    <asp:Label ID="EntidadeNomeLabel" runat="server" Visible="False"></asp:Label>
                                    <asp:FormView ID="FormViewFormacao" runat="server" 
    DataKeyNames="idFormacao" DataSourceID="SqlDataSourceFORM"
                    Width="100%">
                                        <EditItemTemplate>
                                            <asp:Label ID="EntidadeLabel" runat="server" 
                            Text='<%# Eval("dsinstituicao") %>' CssClass="tituloEmpresa"></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label ID="LabelFormacao" runat="server" Text="Referente a formação:"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="DropDownListTipoFormacao" runat="server" 
                            CssClass="DropCad" DataSourceID="SqlTIPOFORMACAO" 
                            DataTextField="dsTipoFormacao" DataValueField="idTipoFormacao" 
                            SelectedValue='<%# Bind("idTipoFormacao", "{0}") %>'>
                                            </asp:DropDownList>
                                            <br />
                                            Curso:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1"
                            Display="Dynamic" ErrorMessage="* Informe o nome do Curso" 
                            SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                            <br />
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="InputCadFormCandidatoCV" 
                            Text='<%# Bind("dsCurso") %>'></asp:TextBox>
                                            <br />
                                            Observações:<br />
                                            <asp:TextBox ID="obsTextBox" runat="server" CssClass="InputCad" Height="120px" Text='<%# Bind("obs") %>'
                            TextMode="MultiLine"></asp:TextBox>
                                            <br />
                                            Inicio do curso:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="data_iniTextBox" Display="Dynamic" 
                            ErrorMessage="* Data do início do Curso é obrigatória" 
                            SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1" runat="server" ControlToValidate="data_iniTextBox"
                                Display="Dynamic" ErrorMessage="* Formato (dd/m/yyyy)" SetFocusOnError="True"
                                
                            
                            ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d">*</asp:RegularExpressionValidator>
                                            <cc1:calendarextender id="CalendarExtender1" runat="server" format="dd/M/yyyy" 
                            targetcontrolid="data_iniTextBox">
                                            </cc1:calendarextender>
                                            <br />
                                            <asp:TextBox ID="data_iniTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("data_ini", "{0:d}") %>'></asp:TextBox>
                                            <br />
                                            Término do curso: (Previsão)<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="data_fimTextBox" Display="Dynamic" 
                            ErrorMessage="* Data do término do Curso é obrigatória" 
                            SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator2" runat="server" ControlToValidate="data_fimTextBox"
                                Display="Dynamic" ErrorMessage="* Formato (dd/m/yyyy)" SetFocusOnError="True"
                                
                            
                            ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d">*</asp:RegularExpressionValidator>
                                            <cc1:calendarextender id="CalendarExtender2" runat="server" format="dd/M/yyyy" 
                            targetcontrolid="data_fimTextBox">
                                            </cc1:calendarextender>
                                            <br />
                                            <asp:TextBox ID="data_fimTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("data_fim", "{0:d}") %>'></asp:TextBox>
                                            <br />
                                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                            ShowMessageBox="True" />
                                            <br />
                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Atualizar"></asp:LinkButton>
                                            |
                                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            OnClientClick='return confirm("Você quer realmente excluir esta formação acadêmica?")'
                            Text="Excluir"></asp:LinkButton>
                                            |
                                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar" ></asp:LinkButton>
                                        </EditItemTemplate>
                                        <EmptyDataTemplate>
                                            <table ID="BtNew" align="center" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td align="center">
                                                        <br />
                                                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                        CommandName="New" ></asp:LinkButton>
                                                        <br />
                                                    </td>
                                                </tr>
                                            </table>
                                        </EmptyDataTemplate>
                                        <InsertItemTemplate>
                                            <asp:Label ID="EntidadeLabel" runat="server" CssClass="tituloEmpresa"></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label ID="LabelFormacao" runat="server" Text="Referente a formação:"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="DropDownListTipoFormacao" runat="server" 
                            CssClass="DropCad" DataSourceID="SqlTIPOFORMACAO" 
                            DataTextField="dsTipoFormacao" DataValueField="idTipoFormacao" 
                            SelectedValue='<%# Bind("idTipoFormacao") %>'>
                                            </asp:DropDownList>
                                            <br />
                                            Curso:<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox2"
                            Display="Dynamic" ErrorMessage="* Informe o nome do Curso." 
                            SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                            <br />
                                            <asp:TextBox ID="TextBox2" runat="server" CssClass="InputCad" MaxLength="200" 
                            Text='<%# Bind("dsCurso") %>'></asp:TextBox>
                                            <br />
                                            Observações:<br />
                                            <asp:TextBox ID="obsTextBox" runat="server" CssClass="InputCad" Height="120px" Text='<%# Bind("obs") %>'
                            TextMode="MultiLine"></asp:TextBox>
                                            <br />
                                            Inicio do curso:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="data_iniTextBox" Display="Dynamic" 
                            ErrorMessage="* Data do início do Curso é obrigatória" 
                            SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1" runat="server" ControlToValidate="data_iniTextBox"
                                Display="Dynamic" ErrorMessage="Formato (dd/m/yyyy)" SetFocusOnError="True"
                                
                            
                            ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d">*</asp:RegularExpressionValidator>
                                            <cc1:calendarextender
                                    id="CalendarExtender1" runat="server" format="dd/M/yyyy" 
                            targetcontrolid="data_iniTextBox" DefaultView="Years">
                                            </cc1:calendarextender>
                                            <br />
                                            <asp:TextBox ID="data_iniTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("data_ini") %>'></asp:TextBox>
                                            <br />
                                            Término do curso: (Previsão)<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="data_fimTextBox" Display="Dynamic" 
                            ErrorMessage="* Data do término do Curso é obrigatória" 
                            SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator3" runat="server" ControlToValidate="data_fimTextBox"
                                Display="Dynamic" ErrorMessage="Formato (dd/m/yyyy)" SetFocusOnError="True"
                                
                            
                            ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.]([1-9]|1[012])[- /.](19|20)\d\d">*</asp:RegularExpressionValidator>
                                            <cc1:calendarextender
                                    id="CalendarExtender2" runat="server" format="dd/M/yyyy" 
                            targetcontrolid="data_fimTextBox" DefaultView="Years">
                                            </cc1:calendarextender>
                                            <br />
                                            <asp:TextBox ID="data_fimTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("data_fim") %>'></asp:TextBox>
                                            <br />
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            ShowMessageBox="True" />
                                            <br />
                                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Incluir Formação Profissional"></asp:LinkButton>
                                            |
                                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar" onclick="InsertCancelButton_Click1" ></asp:LinkButton>
                                        </InsertItemTemplate>
                                    </asp:FormView>
                                </asp:Panel>
                                <br />
                <br />
                <div style="text-align: left">
                    <table runat="server" id="Table1" visible="true" border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </div>
            </td> 
        </tr>
        <tr>
            <td width="26">
                &nbsp;</td>
            <td width="450">
                                &nbsp;</td> 
        </tr>
    </table> 
    <br />
    <asp:SqlDataSource ID="SqlDataSourceFormacao" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbFormacao] WHERE [idFormacao] = @idFormacao" InsertCommand="INSERT INTO [tbFormacao] ([idcurriculo], [idTipoFormacao], [idInstituicao], [dsCurso], [obs], [data_ini], [data_fim]) VALUES (@idcurriculo, @idTipoFormacao, @idInstituicao, @dsCurso, @obs, @data_ini, @data_fim)"
        SelectCommand="SELECT [idFormacao], [idcurriculo], [idTipoFormacao], [idInstituicao], [dsCurso], [obs], [data_ini], [data_fim] FROM [tbFormacao] WHERE ([idcurriculo] = @idcurriculo)"
        
        UpdateCommand="UPDATE [tbFormacao] SET [idcurriculo] = @idcurriculo, [idTipoFormacao] = @idTipoFormacao, [idInstituicao] = @idInstituicao, [dsCurso] = @dsCurso, [obs] = @obs, [data_ini] = @data_ini, [data_fim] = @data_fim WHERE [idFormacao] = @idFormacao">
        <DeleteParameters>
            <asp:Parameter Name="idFormacao" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="idTipoFormacao" Type="Int32" />
            <asp:Parameter Name="idInstituicao" Type="Int32" />
            <asp:Parameter Name="dsCurso" />
            <asp:Parameter Name="obs" Type="String" />
            <asp:Parameter Name="data_ini" Type="DateTime" />
            <asp:Parameter Name="data_fim" Type="DateTime" />
            <asp:Parameter Name="idFormacao" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" SessionField="idcurriculo"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="idTipoFormacao" Type="Int32" />
            <asp:Parameter Name="idInstituicao" Type="Int32" />
            <asp:Parameter Name="dsCurso" />
            <asp:Parameter Name="obs" Type="String" />
            <asp:Parameter Name="data_ini" Type="DateTime" />
            <asp:Parameter Name="data_fim" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceFORM" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbFormacao] WHERE [idFormacao] = @idFormacao" 
        InsertCommand="INSERT INTO [tbFormacao] ([idcurriculo], [idTipoFormacao], [idInstituicao], [dsCurso], [obs], [data_ini], [data_fim]) VALUES (@idcurriculo, @idTipoFormacao, @idInstituicao, @dsCurso, @obs, @data_ini, @data_fim)"
        SelectCommand="SELECT tbFormacao.idFormacao, tbFormacao.idcurriculo, tbFormacao.idTipoFormacao, tbFormacao.idInstituicao, tbFormacao.dsCurso, tbFormacao.obs, tbFormacao.data_ini, tbFormacao.data_fim, tbEntidadeEnsino.dsinstituicao FROM tbFormacao INNER JOIN tbEntidadeEnsino ON tbFormacao.idInstituicao = tbEntidadeEnsino.idInstituicao WHERE (idFormacao = @idFormacao)"
        UpdateCommand="UPDATE tbFormacao SET idcurriculo = @idcurriculo, dsCurso = @dsCurso, obs = @obs, data_ini = @data_ini, data_fim = @data_fim, idTipoFormacao = @idTipoFormacao WHERE (idFormacao = @idFormacao)">
        <DeleteParameters>
            <asp:Parameter Name="idFormacao" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="dsCurso" />
            <asp:Parameter Name="obs" Type="String" />
            <asp:Parameter Name="data_ini" Type="DateTime" />
            <asp:Parameter Name="data_fim" Type="DateTime" />
            <asp:Parameter Name="idTipoFormacao" Type="Int32" />
            <asp:Parameter Name="idFormacao" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="idFormacaoLabel" DefaultValue="0" 
                Name="idFormacao" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="idTipoFormacao" Type="Int32" />
            <asp:Parameter Name="idInstituicao" Type="Int32" />
            <asp:Parameter Name="dsCurso" />
            <asp:Parameter Name="obs" Type="String" />
            <asp:Parameter Name="data_ini" Type="DateTime" />
            <asp:Parameter Name="data_fim" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlTIPOENTIDADE" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="_USP_ENTIDADE_DE_ENSINO_TIPO" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="UFLabel" Name="UF" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="CidadeLabel" Name="estado" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataUF" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [uf], [dsuf] FROM [tbuf]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlCidadeEntidade_UF" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="_USP_ENTIDADE_DE_ENSINO_CIDADES_UF" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListUF" Name="UF" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlEntidadeLISTA" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="_USP_ENTIDADE_DE_ENSINO_LISTA" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="UFLabel" Name="UF" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="CidadeLabel" Name="estado" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TIPOLabel" Name="dsTipo" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlTIPOFORMACAO" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idTipoFormacao], [dsTipoFormacao] FROM [tbTipoFormacao]">
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>

