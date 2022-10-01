<%@ Page Title="" Language="VB" MasterPageFile="~/_consultorWizard/ConsultorMasterPage.master" AutoEventWireup="false" CodeFile="previewVaga.aspx.vb" Inherits="_empresa_previewVaga" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="cabec" runat="server" ImageUrl="~/images/layout/e_vagas.gif" />
    <table runat="server" id="VagaAdm" width="700" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="614">
                <asp:FormView ID="FormViewAnuncio" runat="server" DataKeyNames="idVagaAnuncio" 
                    DataSourceID="SqlDataSourcePreviewVaga" Width="100%">
                    <EditItemTemplate>
                        <asp:Label ID="idVagaAnuncioLabel" runat="server" 
                            Text='<%# Eval("idVagaAnuncio") %>' Visible="False"></asp:Label>
                        <br />
                        <br />
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" 
                            Text="Voltar para visualização da Vaga" />
                        <br />
                        <br />
                        <asp:DetailsView ID="DetailsViewVaga" runat="server" AllowPaging="True" 
                            AutoGenerateRows="False" DataKeyNames="idVagaAnuncio" 
                            DataSourceID="SqlDataSourceVagasEdit" Height="50px" Width="100%" 
                            BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px" 
                            CssClass="tableFormulario" GridLines="Horizontal">
                            <Fields>
                                <asp:CommandField CancelText="Cancelar" DeleteText="Excluir" 
                                    EditText="Editar Anúncio" ShowEditButton="True" ButtonType="Image" 
                                    CancelImageUrl="~/images/empresa/btCancelarItensdaVaga.png" 
                                    EditImageUrl="~/images/empresa/btEditarItensdaVaga.png" 
                                    UpdateImageUrl="~/images/empresa/btSalvarItensdaVaga.png" />
                                <asp:BoundField DataField="idVagaAnuncio" HeaderText="idVagaAnuncio" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="idVagaAnuncio" 
                                    Visible="False" ShowHeader="False" />
                                <asp:TemplateField HeaderText="Protocolo:" ShowHeader="False" 
                                    SortExpression="Protocolo">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBoxProtocoloT" runat="server" CssClass="InputCad" Enabled="False" 
                                            Text='<%# Bind("Protocolo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox33" runat="server" Text='<%# Bind("Protocolo") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Protocolo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Formacao Acadêmica:" ShowHeader="False" 
                                    SortExpression="FormacaoAcademica_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("FormacaoAcademica_Label") %>' TextMode="MultiLine"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox31" runat="server" 
                                            Text='<%# Bind("FormacaoAcademica_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" 
                                            Text='<%# Bind("FormacaoAcademica_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FormacaoAcademica" ShowHeader="False" 
                                    SortExpression="FormacaoAcademica">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("FormacaoAcademica") %>' TextMode="MultiLine"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox32" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("FormacaoAcademica") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("FormacaoAcademica") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FormacaoAcademica_Apresenta" 
                                    SortExpression="FormacaoAcademica_Apresenta" ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListFormacao" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("FormacaoAcademica_Apresenta", "{0}") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" 
                                            Text='<%# Bind("FormacaoAcademica_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListFormacaoEdit" runat="server" 
                                            Enabled="False" RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("FormacaoAcademica_Apresenta", "{0}") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Perfil da Vaga:" ShowHeader="False" 
                                    SortExpression="dsPerfilVaga_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="InputCad"
                                            Text='<%# Bind("dsPerfilVaga_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox34" runat="server" CssClass="InputCad"
                                            Text='<%# Bind("dsPerfilVaga_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("dsPerfilVaga_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="dsPerfilVaga" ShowHeader="False" 
                                    SortExpression="dsPerfilVaga">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" CssClass="InputCad" Text='<%# Bind("dsPerfilVaga") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox35" runat="server" CssClass="InputCad" Text='<%# Bind("dsPerfilVaga") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("dsPerfilVaga") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="dsPerfilVaga_Apresenta" 
                                    SortExpression="dsPerfilVaga_Apresenta" ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListdsPerfilVagaEdit" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("dsPerfilVaga_Apresenta", "{0}") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" 
                                            Text='<%# Bind("dsPerfilVaga_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListdsPerfilVaga" runat="server" 
                                            Enabled="False" RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("dsPerfilVaga_Apresenta", "{0}") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cargo:" ShowHeader="False" 
                                    SortExpression="Cargo_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="InputCad" Text='<%# Bind("Cargo_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox36" runat="server" CssClass="InputCad" Text='<%# Bind("Cargo_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Cargo_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cargo" ShowHeader="False" SortExpression="Cargo">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" CssClass="InputCad" Text='<%# Bind("Cargo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox37" runat="server" CssClass="InputCad" Text='<%# Bind("Cargo") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Cargo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cargo_Apresenta" 
                                    SortExpression="Cargo_Apresenta" ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListCargo" runat="server" 
                                            RepeatDirection="Horizontal" SelectedValue='<%# Bind("Cargo_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Cargo_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListCargoEdit" runat="server" 
                                            Enabled="False" RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("Cargo_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="nrovaga_Label" ShowHeader="False" 
                                    SortExpression="nrovaga_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox8" runat="server" CssClass="InputCad" Text='<%# Bind("nrovaga_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox38" runat="server" CssClass="InputCad" Text='<%# Bind("nrovaga_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("nrovaga_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="nrovaga" ShowHeader="False" 
                                    SortExpression="nrovaga">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox9" runat="server" CssClass="InputCad" Text='<%# Bind("nrovaga") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox39" runat="server" CssClass="InputCad" Text='<%# Bind("nrovaga") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("nrovaga") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="nrovaga_Apresenta" ShowHeader="False" 
                                    SortExpression="nrovaga_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListnroVaga" runat="server" 
                                            RepeatDirection="Horizontal" SelectedValue='<%# Bind("nrovaga_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" 
                                            Text='<%# Bind("nrovaga_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListnroVagaEdit" runat="server" 
                                            Enabled="False" RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("nrovaga_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="nmresponsavel_Label" ShowHeader="False" 
                                    SortExpression="nmresponsavel_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox10" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("nmresponsavel_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox40" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("nmresponsavel_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" 
                                            Text='<%# Bind("nmresponsavel_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="nmresponsavel" ShowHeader="False" 
                                    SortExpression="nmresponsavel">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox11" runat="server" CssClass="InputCad" Text='<%# Bind("nmresponsavel") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox41" runat="server" CssClass="InputCad" Text='<%# Bind("nmresponsavel") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("nmresponsavel") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="nmresponsavel_Apresenta" ShowHeader="False" 
                                    SortExpression="nmresponsavel_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListRes" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("nmresponsavel_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" 
                                            Text='<%# Bind("nmresponsavel_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListResEdit" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("nmresponsavel_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TipoOportunidade_Label" ShowHeader="False" 
                                    SortExpression="TipoOportunidade_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox12" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("TipoOportunidade_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox42" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("TipoOportunidade_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label12" runat="server" 
                                            Text='<%# Bind("TipoOportunidade_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TipoOportunidade" ShowHeader="False" 
                                    SortExpression="TipoOportunidade">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox13" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("TipoOportunidade") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox43" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("TipoOportunidade") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("TipoOportunidade") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TipoOportunidade_Apresenta" ShowHeader="False" 
                                    SortExpression="TipoOportunidade_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListOpt" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("TipoOportunidade_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" 
                                            Text='<%# Bind("TipoOportunidade_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListOptEdit" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("TipoOportunidade_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="QualificacaoHabilidadesEspecificas_Label" 
                                    ShowHeader="False" SortExpression="QualificacaoHabilidadesEspecificas_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox14" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("QualificacaoHabilidadesEspecificas_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox44" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("QualificacaoHabilidadesEspecificas_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label14" runat="server" 
                                            Text='<%# Bind("QualificacaoHabilidadesEspecificas_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="QualificacaoHabilidadesEspecificas" 
                                    ShowHeader="False" SortExpression="QualificacaoHabilidadesEspecificas">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox15" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("QualificacaoHabilidadesEspecificas") %>' 
                                            TextMode="MultiLine" Height="80px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox45" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("QualificacaoHabilidadesEspecificas") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label15" runat="server" 
                                            Text='<%# Bind("QualificacaoHabilidadesEspecificas") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="QualificacaoHabilidadesEspecificas_Apresenta" 
                                    ShowHeader="False" 
                                    SortExpression="QualificacaoHabilidadesEspecificas_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListQHE" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("QualificacaoHabilidadesEspecificas_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" 
                                            Text='<%# Bind("QualificacaoHabilidadesEspecificas_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListQHEEdit" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("QualificacaoHabilidadesEspecificas_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remuneracao_Label" ShowHeader="False" 
                                    SortExpression="Remuneracao_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox16" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("Remuneracao_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox46" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("Remuneracao_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label16" runat="server" Text='<%# Bind("Remuneracao_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remuneracao" ShowHeader="False" 
                                    SortExpression="Remuneracao">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox17" runat="server" CssClass="InputCad" Text='<%# Bind("Remuneracao") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox47" runat="server" CssClass="InputCad" Text='<%# Bind("Remuneracao") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label17" runat="server" Text='<%# Bind("Remuneracao") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remuneracao_Apresenta" ShowHeader="False" 
                                    SortExpression="Remuneracao_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListREM" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("Remuneracao_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox8" runat="server" 
                                            Text='<%# Bind("Remuneracao_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListREMEdit" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("Remuneracao_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RemuneracaoVariavel_Label" ShowHeader="False" 
                                    SortExpression="RemuneracaoVariavel_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox18" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("RemuneracaoVariavel_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox48" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("RemuneracaoVariavel_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label18" runat="server" 
                                            Text='<%# Bind("RemuneracaoVariavel_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RemuneracaoVariavel" ShowHeader="False" 
                                    SortExpression="RemuneracaoVariavel">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox19" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("RemuneracaoVariavel") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox49" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("RemuneracaoVariavel") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label19" runat="server"  
                                            Text='<%# Bind("RemuneracaoVariavel") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RemuneracaoVariavel_Apresenta" 
                                    ShowHeader="False" SortExpression="RemuneracaoVariavel_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListVAR" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("RemuneracaoVariavel_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox9" runat="server" 
                                            Text='<%# Bind("RemuneracaoVariavel_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListVAREdit" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("RemuneracaoVariavel_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Honorario_Label" ShowHeader="False" 
                                    SortExpression="Honorario_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox20" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("Honorario_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox50" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("Honorario_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label20" runat="server" Text='<%# Bind("Honorario_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Honorario" ShowHeader="False" 
                                    SortExpression="Honorario">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox21" runat="server" CssClass="InputCad" Text='<%# Bind("Honorario") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox51" runat="server" CssClass="InputCad" Text='<%# Bind("Honorario") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label21" runat="server" Text='<%# Bind("Honorario") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Honorario_Apresenta" ShowHeader="False" 
                                    SortExpression="Honorario_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListHON" runat="server" 
                                            RepeatDirection="Horizontal" SelectedValue='<%# Bind("Honorario_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox10" runat="server" 
                                            Text='<%# Bind("Honorario_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListHONEdit" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" SelectedValue='<%# Bind("Honorario_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="LocalTrabalho_Label" ShowHeader="False" 
                                    SortExpression="LocalTrabalho_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox22" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("LocalTrabalho_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox52" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("LocalTrabalho_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label22" runat="server" 
                                            Text='<%# Bind("LocalTrabalho_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="LocalTrabalho" ShowHeader="False" 
                                    SortExpression="LocalTrabalho">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox23" runat="server" CssClass="InputCad" Text='<%# Bind("LocalTrabalho") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox53" runat="server" CssClass="InputCad" Text='<%# Bind("LocalTrabalho") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label23" runat="server" Text='<%# Bind("LocalTrabalho") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="LocalTrabalho_Apresenta" ShowHeader="False" 
                                    SortExpression="LocalTrabalho_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListLOCA" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("LocalTrabalho_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox11" runat="server" 
                                            Text='<%# Bind("LocalTrabalho_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListLOCAEdit" runat="server" 
                                            Enabled="False" RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("LocalTrabalho_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ObsComplementares_Label" ShowHeader="False" 
                                    SortExpression="ObsComplementares_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox24" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("ObsComplementares_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox54" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("ObsComplementares_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label24" runat="server" 
                                            Text='<%# Bind("ObsComplementares_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ObsComplementares" ShowHeader="False" 
                                    SortExpression="ObsComplementares">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox25" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("ObsComplementares") %>' TextMode="MultiLine" Height="80px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox55" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("ObsComplementares") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label25" runat="server" Text='<%# Bind("ObsComplementares") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ObsComplementares_Apresenta" ShowHeader="False" 
                                    SortExpression="ObsComplementares_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListobsC" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("ObsComplementares_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox12" runat="server" 
                                            Text='<%# Bind("ObsComplementares_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListobsCEdit" runat="server" 
                                            Enabled="False" RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("ObsComplementares_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Beneficios_Label" ShowHeader="False" 
                                    SortExpression="Beneficios_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox26" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("Beneficios_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox56" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("Beneficios_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label26" runat="server" Text='<%# Bind("Beneficios_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Beneficios" ShowHeader="False" 
                                    SortExpression="Beneficios">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox27" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("Beneficios") %>' TextMode="MultiLine" Height="80px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox57" runat="server" CssClass="InputCad" Text='<%# Bind("Beneficios") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label27" runat="server" Text='<%# Bind("Beneficios") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Beneficios_Apresenta" ShowHeader="False" 
                                    SortExpression="Beneficios_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListBenC" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("Beneficios_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox13" runat="server" 
                                            Text='<%# Bind("Beneficios_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListBenCEdit" runat="server" 
                                            Enabled="False" RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("Beneficios_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Perspectiva_Label" ShowHeader="False" 
                                    SortExpression="Perspectiva_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox28" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("Perspectiva_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox58" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("Perspectiva_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label28" runat="server" Text='<%# Bind("Perspectiva_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Perspectiva" ShowHeader="False" 
                                    SortExpression="Perspectiva">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox29" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("Perspectiva") %>' TextMode="MultiLine" Height="80px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox59" runat="server" CssClass="InputCad" Text='<%# Bind("Perspectiva") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label29" runat="server" Text='<%# Bind("Perspectiva") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Perspectiva_Apresenta" ShowHeader="False" 
                                    SortExpression="Perspectiva_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListPerEdit" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("Perspectiva_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox14" runat="server" 
                                            Text='<%# Bind("Perspectiva_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListPer" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("Perspectiva_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FaixaEtariaInicio_Label" ShowHeader="False" 
                                    SortExpression="FaixaEtariaInicio_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox30" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("FaixaEtariaInicio_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox60" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("FaixaEtariaInicio_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label30" runat="server" 
                                            Text='<%# Bind("FaixaEtariaInicio_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FaixaEtariaInicio" ShowHeader="False" 
                                    SortExpression="FaixaEtariaInicio">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox31" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("FaixaEtariaInicio") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox61" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("FaixaEtariaInicio") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label31" runat="server" Text='<%# Bind("FaixaEtariaInicio") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FaixaEtariaInicio_Apresenta" ShowHeader="False" 
                                    SortExpression="FaixaEtariaInicio_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListFaixaIE" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("FaixaEtariaInicio_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox15" runat="server" 
                                            Text='<%# Bind("FaixaEtariaInicio_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListFaixaI" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("FaixaEtariaInicio_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FaixaEtariaFim_Label" ShowHeader="False" 
                                    SortExpression="FaixaEtariaFim_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox32" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("FaixaEtariaFim_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox62" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("FaixaEtariaFim_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label32" runat="server" 
                                            Text='<%# Bind("FaixaEtariaFim_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FaixaEtariaFim" ShowHeader="False" 
                                    SortExpression="FaixaEtariaFim">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox33" runat="server" CssClass="InputCad" Text='<%# Bind("FaixaEtariaFim") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox63" runat="server" CssClass="InputCad" Text='<%# Bind("FaixaEtariaFim") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label33" runat="server" Text='<%# Bind("FaixaEtariaFim") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FaixaEtariaFim_Apresenta" ShowHeader="False" 
                                    SortExpression="FaixaEtariaFim_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListFaixaFE" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("FaixaEtariaFim_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox16" runat="server" 
                                            Text='<%# Bind("FaixaEtariaFim_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListFaixaF" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("FaixaEtariaFim_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sexo_Label" ShowHeader="False" 
                                    SortExpression="Sexo_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox34" runat="server" CssClass="InputCad" Text='<%# Bind("Sexo_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox64" runat="server" CssClass="InputCad" Text='<%# Bind("Sexo_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label34" runat="server" Text='<%# Bind("Sexo_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sexo" ShowHeader="False" SortExpression="Sexo">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox35" runat="server" CssClass="InputCad" Text='<%# Bind("Sexo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox65" runat="server" CssClass="InputCad" Text='<%# Bind("Sexo") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label35" runat="server" Text='<%# Bind("Sexo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sexo_Apresenta" ShowHeader="False" 
                                    SortExpression="Sexo_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListSEXO" runat="server" 
                                            RepeatDirection="Horizontal" SelectedValue='<%# Bind("Sexo_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("Sexo_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListSEXO" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" SelectedValue='<%# Bind("Sexo_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ConhecimentoIdioma_Label" ShowHeader="False" 
                                    SortExpression="ConhecimentoIdioma_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox36" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("ConhecimentoIdioma_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox66" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("ConhecimentoIdioma_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label36" runat="server" 
                                            Text='<%# Bind("ConhecimentoIdioma_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ConhecimentoIdioma" ShowHeader="False" 
                                    SortExpression="ConhecimentoIdioma">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox37" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("ConhecimentoIdioma") %>' TextMode="MultiLine" 
                                            Height="80px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox67" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("ConhecimentoIdioma") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label37" runat="server" Text='<%# Bind("ConhecimentoIdioma") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ConhecimentoIdioma_Apresenta" ShowHeader="False" 
                                    SortExpression="ConhecimentoIdioma_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListIDIOMA" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("ConhecimentoIdioma_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox18" runat="server" 
                                            Text='<%# Bind("ConhecimentoIdioma_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListIDIOMA" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("ConhecimentoIdioma_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PerfilComposicaoEquipe_Label" ShowHeader="False" 
                                    SortExpression="PerfilComposicaoEquipe_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox38" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("PerfilComposicaoEquipe_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox68" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("PerfilComposicaoEquipe_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label38" runat="server" 
                                            Text='<%# Bind("PerfilComposicaoEquipe_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PerfilComposicaoEquipe" ShowHeader="False" 
                                    SortExpression="PerfilComposicaoEquipe">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox39" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("PerfilComposicaoEquipe") %>' TextMode="MultiLine" 
                                            Height="80px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox69" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("PerfilComposicaoEquipe") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label39" runat="server" 
                                            Text='<%# Bind("PerfilComposicaoEquipe") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PerfilComposicaoEquipe_Apresenta" 
                                    ShowHeader="False" SortExpression="PerfilComposicaoEquipe_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListEQUIPE" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("PerfilComposicaoEquipe_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox19" runat="server" 
                                            Text='<%# Bind("PerfilComposicaoEquipe_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListEQUIPE" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("PerfilComposicaoEquipe_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PerfilGestor_Label" ShowHeader="False" 
                                    SortExpression="PerfilGestor_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox40" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("PerfilGestor_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox70" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("PerfilGestor_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label40" runat="server" Text='<%# Bind("PerfilGestor_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PerfilGestor" ShowHeader="False" 
                                    SortExpression="PerfilGestor">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox41" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("PerfilGestor") %>' Height="80px" TextMode="MultiLine"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox71" runat="server" CssClass="InputCad" Text='<%# Bind("PerfilGestor") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label41" runat="server" Text='<%# Bind("PerfilGestor") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PerfilGestor_Apresenta" ShowHeader="False" 
                                    SortExpression="PerfilGestor_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListGESTOR" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("PerfilGestor_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox20" runat="server" 
                                            Text='<%# Bind("PerfilGestor_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListGESTOR" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("PerfilGestor_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CursoEspecifico_Label" ShowHeader="False" 
                                    SortExpression="CursoEspecifico_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox42" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("CursoEspecifico_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox72" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("CursoEspecifico_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label42" runat="server" 
                                            Text='<%# Bind("CursoEspecifico_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CursoEspecifico" ShowHeader="False" 
                                    SortExpression="CursoEspecifico">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox43" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("CursoEspecifico") %>' TextMode="MultiLine" Height="80px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox73" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("CursoEspecifico") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label43" runat="server" Text='<%# Bind("CursoEspecifico") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CursoEspecifico_Apresenta" ShowHeader="False" 
                                    SortExpression="CursoEspecifico_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListCURSO" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("CursoEspecifico_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox21" runat="server" 
                                            Text='<%# Bind("CursoEspecifico_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListCURSO" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("CursoEspecifico_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Conhecimento_Label" ShowHeader="False" 
                                    SortExpression="Conhecimento_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox44" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("Conhecimento_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox74" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("Conhecimento_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label44" runat="server" Text='<%# Bind("Conhecimento_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Conhecimento" ShowHeader="False" 
                                    SortExpression="Conhecimento">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox45" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("Conhecimento") %>' TextMode="MultiLine" Height="80px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox75" runat="server" CssClass="InputCad" Text='<%# Bind("Conhecimento") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label45" runat="server" Text='<%# Bind("Conhecimento") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Conhecimento_Apresenta" ShowHeader="False" 
                                    SortExpression="Conhecimento_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListCONHECIMENTO" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("Conhecimento_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox22" runat="server" 
                                            Text='<%# Bind("Conhecimento_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListCONHECIMENTO" runat="server" 
                                            Enabled="False" RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("Conhecimento_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ConhecimentoInformatica_Label" 
                                    ShowHeader="False" SortExpression="ConhecimentoInformatica_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox46" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("ConhecimentoInformatica_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox76" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("ConhecimentoInformatica_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label46" runat="server" 
                                            Text='<%# Bind("ConhecimentoInformatica_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ConhecimentoInformatica" ShowHeader="False" 
                                    SortExpression="ConhecimentoInformatica">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox47" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("ConhecimentoInformatica") %>' TextMode="MultiLine" 
                                            Height="80px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox77" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("ConhecimentoInformatica") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label47" runat="server" 
                                            Text='<%# Bind("ConhecimentoInformatica") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ConhecimentoInformatica_Apresenta" 
                                    ShowHeader="False" SortExpression="ConhecimentoInformatica_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListINFORMATICA" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("ConhecimentoInformatica_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox23" runat="server" 
                                            Text='<%# Bind("ConhecimentoInformatica_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListINFORMATICA" runat="server" 
                                            Enabled="False" RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("ConhecimentoInformatica_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CompetenciaComportamental_Label" 
                                    ShowHeader="False" SortExpression="CompetenciaComportamental_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox48" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("CompetenciaComportamental_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox78" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("CompetenciaComportamental_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label48" runat="server" 
                                            Text='<%# Bind("CompetenciaComportamental_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CompetenciaComportamental" ShowHeader="False" 
                                    SortExpression="CompetenciaComportamental">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox49" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("CompetenciaComportamental") %>' TextMode="MultiLine" 
                                            Height="80px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox79" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("CompetenciaComportamental") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label49" runat="server" 
                                            Text='<%# Bind("CompetenciaComportamental") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CompetenciaComportamental_Apresenta" 
                                    ShowHeader="False" SortExpression="CompetenciaComportamental_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListCOMPET" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("CompetenciaComportamental_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox24" runat="server" 
                                            Text='<%# Bind("CompetenciaComportamental_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListCOMPET" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("CompetenciaComportamental_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CompetenciaProfissional_Label" 
                                    ShowHeader="False" SortExpression="CompetenciaProfissional_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox50" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("CompetenciaProfissional_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox80" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("CompetenciaProfissional_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label50" runat="server" 
                                            Text='<%# Bind("CompetenciaProfissional_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CompetenciaProfissional" ShowHeader="False" 
                                    SortExpression="CompetenciaProfissional">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox51" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("CompetenciaProfissional") %>' TextMode="MultiLine" 
                                            Height="80px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox81" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("CompetenciaProfissional") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label51" runat="server" 
                                            Text='<%# Bind("CompetenciaProfissional") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CompetenciaProfissional_Apresenta" 
                                    ShowHeader="False" SortExpression="CompetenciaProfissional_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListCOMPETP" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("CompetenciaProfissional_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox25" runat="server" 
                                            Text='<%# Bind("CompetenciaProfissional_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListCOMPETP" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("CompetenciaProfissional_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="AspectoCritico_Label" ShowHeader="False" 
                                    SortExpression="AspectoCritico_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox52" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("AspectoCritico_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox82" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("AspectoCritico_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label52" runat="server" 
                                            Text='<%# Bind("AspectoCritico_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="AspectoCritico" ShowHeader="False" 
                                    SortExpression="AspectoCritico">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox53" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("AspectoCritico") %>' TextMode="MultiLine" Height="80px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox83" runat="server" CssClass="InputCad" Text='<%# Bind("AspectoCritico") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label53" runat="server" Text='<%# Bind("AspectoCritico") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="AspectoCritico_Apresenta" ShowHeader="False" 
                                    SortExpression="AspectoCritico_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListASPECTOD" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("AspectoCritico_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox26" runat="server" 
                                            Text='<%# Bind("AspectoCritico_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListASPECTOC" runat="server" 
                                            Enabled="False" RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("AspectoCritico_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PrincipalDesafio_Label" ShowHeader="False" 
                                    SortExpression="PrincipalDesafio_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox54" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("PrincipalDesafio_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox84" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("PrincipalDesafio_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label54" runat="server" 
                                            Text='<%# Bind("PrincipalDesafio_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PrincipalDesafio" ShowHeader="False" 
                                    SortExpression="PrincipalDesafio">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox55" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("PrincipalDesafio") %>' TextMode="MultiLine" Height="80px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox85" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("PrincipalDesafio") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label55" runat="server" Text='<%# Bind("PrincipalDesafio") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PrincipalDesafio_Apresenta" ShowHeader="False" 
                                    SortExpression="PrincipalDesafio_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListASPECTO" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("PrincipalDesafio_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox27" runat="server" 
                                            Text='<%# Bind("PrincipalDesafio_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListDesafio" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("PrincipalDesafio_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RelacionamentoInterno_Label" ShowHeader="False" 
                                    SortExpression="RelacionamentoInterno_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox56" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("RelacionamentoInterno_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox86" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("RelacionamentoInterno_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label56" runat="server" 
                                            Text='<%# Bind("RelacionamentoInterno_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RelacionamentoInterno" ShowHeader="False" 
                                    SortExpression="RelacionamentoInterno">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox57" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("RelacionamentoInterno") %>' Height="80px" 
                                            TextMode="MultiLine"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox87" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("RelacionamentoInterno") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label57" runat="server" 
                                            Text='<%# Bind("RelacionamentoInterno") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RelacionamentoInterno_Apresenta" 
                                    ShowHeader="False" SortExpression="RelacionamentoInterno_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListRI" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("RelacionamentoInterno_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox28" runat="server" 
                                            Text='<%# Bind("RelacionamentoInterno_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListRI" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("RelacionamentoInterno_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RelacionamentoExterno_Label" ShowHeader="False" 
                                    SortExpression="RelacionamentoExterno_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox58" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("RelacionamentoExterno_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox88" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("RelacionamentoExterno_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label58" runat="server" 
                                            Text='<%# Bind("RelacionamentoExterno_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RelacionamentoExterno" ShowHeader="False" 
                                    SortExpression="RelacionamentoExterno">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox59" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("RelacionamentoExterno") %>' Height="80px" 
                                            TextMode="MultiLine"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox89" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("RelacionamentoExterno") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label59" runat="server" 
                                            Text='<%# Bind("RelacionamentoExterno") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RelacionamentoExterno_Apresenta" 
                                    ShowHeader="False" SortExpression="RelacionamentoExterno_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListRE" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("RelacionamentoExterno_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox29" runat="server" 
                                            Text='<%# Bind("RelacionamentoExterno_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListRE" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("RelacionamentoExterno_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="infoSobre_viagens_Label" ShowHeader="False" 
                                    SortExpression="infoSobre_viagens_Label">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox60" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("infoSobre_viagens_Label") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox90" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("infoSobre_viagens_Label") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label60" runat="server" 
                                            Text='<%# Bind("infoSobre_viagens_Label") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="infoSobre_viagens" ShowHeader="False" 
                                    SortExpression="infoSobre_viagens">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox61" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("infoSobre_viagens") %>' Height="80px" TextMode="MultiLine"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox91" runat="server" CssClass="InputCad" 
                                            Text='<%# Bind("infoSobre_viagens") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label61" runat="server" Text='<%# Bind("infoSobre_viagens") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="infoSobre_viagens_Apresenta" ShowHeader="False" 
                                    SortExpression="infoSobre_viagens_Apresenta">
                                    <EditItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListIV" runat="server" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("infoSobre_viagens_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox30" runat="server" 
                                            Text='<%# Bind("infoSobre_viagens_Apresenta") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="RadioButtonListIV" runat="server" Enabled="False" 
                                            RepeatDirection="Horizontal" 
                                            SelectedValue='<%# Bind("infoSobre_viagens_Apresenta") %>'>
                                            <asp:ListItem Value="1">Apresentar</asp:ListItem>
                                            <asp:ListItem Value="0">Não Apresentar</asp:ListItem>
                                        </asp:RadioButtonList><br><br>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" CancelText="Cancelar" 
                                    DeleteText="Excluir" EditText="Editar Anúncio" ButtonType="Image" 
                                    CancelImageUrl="~/images/empresa/btCancelarItensdaVaga.png" 
                                    EditImageUrl="~/images/empresa/btEditarItensdaVaga.png" 
                                    UpdateImageUrl="~/images/empresa/btSalvarItensdaVaga.png" />
                            </Fields>
                            <PagerSettings Position="TopAndBottom" />
                        </asp:DetailsView>
                        <br />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSourceVagasEdit" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                            DeleteCommand="DELETE FROM [_tbVagaAnuncio] WHERE [idVagaAnuncio] = @idVagaAnuncio" 
                            InsertCommand="INSERT INTO [_tbVagaAnuncio] ([Protocolo], [FormacaoAcademica_Label], [FormacaoAcademica], [FormacaoAcademica_Apresenta], [dsPerfilVaga_Label], [dsPerfilVaga], [dsPerfilVaga_Apresenta], [Cargo_Label], [Cargo], [Cargo_Apresenta], [nrovaga_Label], [nrovaga], [nrovaga_Apresenta], [nmresponsavel_Label], [nmresponsavel], [nmresponsavel_Apresenta], [TipoOportunidade_Label], [TipoOportunidade], [TipoOportunidade_Apresenta], [QualificacaoHabilidadesEspecificas_Label], [QualificacaoHabilidadesEspecificas], [QualificacaoHabilidadesEspecificas_Apresenta], [Remuneracao_Label], [Remuneracao], [Remuneracao_Apresenta], [RemuneracaoVariavel_Label], [RemuneracaoVariavel], [RemuneracaoVariavel_Apresenta], [Honorario_Label], [Honorario], [Honorario_Apresenta], [LocalTrabalho_Label], [LocalTrabalho], [LocalTrabalho_Apresenta], [ObsComplementares_Label], [ObsComplementares], [ObsComplementares_Apresenta], [Beneficios_Label], [Beneficios], [Beneficios_Apresenta], [Perspectiva_Label], [Perspectiva], [Perspectiva_Apresenta], [FaixaEtariaInicio_Label], [FaixaEtariaInicio], [FaixaEtariaInicio_Apresenta], [FaixaEtariaFim_Label], [FaixaEtariaFim], [FaixaEtariaFim_Apresenta], [Sexo_Label], [Sexo], [Sexo_Apresenta], [ConhecimentoIdioma_Label], [ConhecimentoIdioma], [ConhecimentoIdioma_Apresenta], [PerfilComposicaoEquipe_Label], [PerfilComposicaoEquipe], [PerfilComposicaoEquipe_Apresenta], [PerfilGestor_Label], [PerfilGestor], [PerfilGestor_Apresenta], [CursoEspecifico_Label], [CursoEspecifico], [CursoEspecifico_Apresenta], [Conhecimento_Label], [Conhecimento], [Conhecimento_Apresenta], [ConhecimentoInformatica_Label], [ConhecimentoInformatica], [ConhecimentoInformatica_Apresenta], [CompetenciaComportamental_Label], [CompetenciaComportamental], [CompetenciaComportamental_Apresenta], [CompetenciaProfissional_Label], [CompetenciaProfissional], [CompetenciaProfissional_Apresenta], [AspectoCritico_Label], [AspectoCritico], [AspectoCritico_Apresenta], [PrincipalDesafio_Label], [PrincipalDesafio], [PrincipalDesafio_Apresenta], [RelacionamentoInterno_Label], [RelacionamentoInterno], [RelacionamentoInterno_Apresenta], [RelacionamentoExterno_Label], [RelacionamentoExterno], [RelacionamentoExterno_Apresenta], [infoSobre_viagens_Label], [infoSobre_viagens], [infoSobre_viagens_Apresenta], [confidencial_Label], [confidencial], [confidencial_Apresenta]) VALUES (@Protocolo, @FormacaoAcademica_Label, @FormacaoAcademica, @FormacaoAcademica_Apresenta, @dsPerfilVaga_Label, @dsPerfilVaga, @dsPerfilVaga_Apresenta, @Cargo_Label, @Cargo, @Cargo_Apresenta, @nrovaga_Label, @nrovaga, @nrovaga_Apresenta, @nmresponsavel_Label, @nmresponsavel, @nmresponsavel_Apresenta, @TipoOportunidade_Label, @TipoOportunidade, @TipoOportunidade_Apresenta, @QualificacaoHabilidadesEspecificas_Label, @QualificacaoHabilidadesEspecificas, @QualificacaoHabilidadesEspecificas_Apresenta, @Remuneracao_Label, @Remuneracao, @Remuneracao_Apresenta, @RemuneracaoVariavel_Label, @RemuneracaoVariavel, @RemuneracaoVariavel_Apresenta, @Honorario_Label, @Honorario, @Honorario_Apresenta, @LocalTrabalho_Label, @LocalTrabalho, @LocalTrabalho_Apresenta, @ObsComplementares_Label, @ObsComplementares, @ObsComplementares_Apresenta, @Beneficios_Label, @Beneficios, @Beneficios_Apresenta, @Perspectiva_Label, @Perspectiva, @Perspectiva_Apresenta, @FaixaEtariaInicio_Label, @FaixaEtariaInicio, @FaixaEtariaInicio_Apresenta, @FaixaEtariaFim_Label, @FaixaEtariaFim, @FaixaEtariaFim_Apresenta, @Sexo_Label, @Sexo, @Sexo_Apresenta, @ConhecimentoIdioma_Label, @ConhecimentoIdioma, @ConhecimentoIdioma_Apresenta, @PerfilComposicaoEquipe_Label, @PerfilComposicaoEquipe, @PerfilComposicaoEquipe_Apresenta, @PerfilGestor_Label, @PerfilGestor, @PerfilGestor_Apresenta, @CursoEspecifico_Label, @CursoEspecifico, @CursoEspecifico_Apresenta, @Conhecimento_Label, @Conhecimento, @Conhecimento_Apresenta, @ConhecimentoInformatica_Label, @ConhecimentoInformatica, @ConhecimentoInformatica_Apresenta, @CompetenciaComportamental_Label, @CompetenciaComportamental, @CompetenciaComportamental_Apresenta, @CompetenciaProfissional_Label, @CompetenciaProfissional, @CompetenciaProfissional_Apresenta, @AspectoCritico_Label, @AspectoCritico, @AspectoCritico_Apresenta, @PrincipalDesafio_Label, @PrincipalDesafio, @PrincipalDesafio_Apresenta, @RelacionamentoInterno_Label, @RelacionamentoInterno, @RelacionamentoInterno_Apresenta, @RelacionamentoExterno_Label, @RelacionamentoExterno, @RelacionamentoExterno_Apresenta, @infoSobre_viagens_Label, @infoSobre_viagens, @infoSobre_viagens_Apresenta, @confidencial_Label, @confidencial, @confidencial_Apresenta)" 
                            SelectCommand="SELECT [idVagaAnuncio], [Protocolo], [FormacaoAcademica_Label], [FormacaoAcademica], [FormacaoAcademica_Apresenta], [dsPerfilVaga_Label], [dsPerfilVaga], [dsPerfilVaga_Apresenta], [Cargo_Label], [Cargo], [Cargo_Apresenta], [nrovaga_Label], [nrovaga], [nrovaga_Apresenta], [nmresponsavel_Label], [nmresponsavel], [nmresponsavel_Apresenta], [TipoOportunidade_Label], [TipoOportunidade], [TipoOportunidade_Apresenta], [QualificacaoHabilidadesEspecificas_Label], [QualificacaoHabilidadesEspecificas], [QualificacaoHabilidadesEspecificas_Apresenta], [Remuneracao_Label], [Remuneracao], [Remuneracao_Apresenta], [RemuneracaoVariavel_Label], [RemuneracaoVariavel], [RemuneracaoVariavel_Apresenta], [Honorario_Label], [Honorario], [Honorario_Apresenta], [LocalTrabalho_Label], [LocalTrabalho], [LocalTrabalho_Apresenta], [ObsComplementares_Label], [ObsComplementares], [ObsComplementares_Apresenta], [Beneficios_Label], [Beneficios], [Beneficios_Apresenta], [Perspectiva_Label], [Perspectiva], [Perspectiva_Apresenta], [FaixaEtariaInicio_Label], [FaixaEtariaInicio], [FaixaEtariaInicio_Apresenta], [FaixaEtariaFim_Label], [FaixaEtariaFim], [FaixaEtariaFim_Apresenta], [Sexo_Label], [Sexo], [Sexo_Apresenta], [ConhecimentoIdioma_Label], [ConhecimentoIdioma], [ConhecimentoIdioma_Apresenta], [PerfilComposicaoEquipe_Label], [PerfilComposicaoEquipe], [PerfilComposicaoEquipe_Apresenta], [PerfilGestor_Label], [PerfilGestor], [PerfilGestor_Apresenta], [CursoEspecifico_Label], [CursoEspecifico], [CursoEspecifico_Apresenta], [Conhecimento_Label], [Conhecimento], [Conhecimento_Apresenta], [ConhecimentoInformatica_Label], [ConhecimentoInformatica], [ConhecimentoInformatica_Apresenta], [CompetenciaComportamental_Label], [CompetenciaComportamental], [CompetenciaComportamental_Apresenta], [CompetenciaProfissional_Label], [CompetenciaProfissional], [CompetenciaProfissional_Apresenta], [AspectoCritico_Label], [AspectoCritico], [AspectoCritico_Apresenta], [PrincipalDesafio_Label], [PrincipalDesafio], [PrincipalDesafio_Apresenta], [RelacionamentoInterno_Label], [RelacionamentoInterno], [RelacionamentoInterno_Apresenta], [RelacionamentoExterno_Label], [RelacionamentoExterno], [RelacionamentoExterno_Apresenta], [infoSobre_viagens_Label], [infoSobre_viagens], [infoSobre_viagens_Apresenta], [confidencial_Label], [confidencial], [confidencial_Apresenta] FROM [_tbVagaAnuncio] WHERE ([idVagaAnuncio] = @idVagaAnuncio)" 
                            UpdateCommand="UPDATE [_tbVagaAnuncio] SET [Protocolo] = @Protocolo, [FormacaoAcademica_Label] = @FormacaoAcademica_Label, [FormacaoAcademica] = @FormacaoAcademica, [FormacaoAcademica_Apresenta] = @FormacaoAcademica_Apresenta, [dsPerfilVaga_Label] = @dsPerfilVaga_Label, [dsPerfilVaga] = @dsPerfilVaga, [dsPerfilVaga_Apresenta] = @dsPerfilVaga_Apresenta, [Cargo_Label] = @Cargo_Label, [Cargo] = @Cargo, [Cargo_Apresenta] = @Cargo_Apresenta, [nrovaga_Label] = @nrovaga_Label, [nrovaga] = @nrovaga, [nrovaga_Apresenta] = @nrovaga_Apresenta, [nmresponsavel_Label] = @nmresponsavel_Label, [nmresponsavel] = @nmresponsavel, [nmresponsavel_Apresenta] = @nmresponsavel_Apresenta, [TipoOportunidade_Label] = @TipoOportunidade_Label, [TipoOportunidade] = @TipoOportunidade, [TipoOportunidade_Apresenta] = @TipoOportunidade_Apresenta, [QualificacaoHabilidadesEspecificas_Label] = @QualificacaoHabilidadesEspecificas_Label, [QualificacaoHabilidadesEspecificas] = @QualificacaoHabilidadesEspecificas, [QualificacaoHabilidadesEspecificas_Apresenta] = @QualificacaoHabilidadesEspecificas_Apresenta, [Remuneracao_Label] = @Remuneracao_Label, [Remuneracao] = @Remuneracao, [Remuneracao_Apresenta] = @Remuneracao_Apresenta, [RemuneracaoVariavel_Label] = @RemuneracaoVariavel_Label, [RemuneracaoVariavel] = @RemuneracaoVariavel, [RemuneracaoVariavel_Apresenta] = @RemuneracaoVariavel_Apresenta, [Honorario_Label] = @Honorario_Label, [Honorario] = @Honorario, [Honorario_Apresenta] = @Honorario_Apresenta, [LocalTrabalho_Label] = @LocalTrabalho_Label, [LocalTrabalho] = @LocalTrabalho, [LocalTrabalho_Apresenta] = @LocalTrabalho_Apresenta, [ObsComplementares_Label] = @ObsComplementares_Label, [ObsComplementares] = @ObsComplementares, [ObsComplementares_Apresenta] = @ObsComplementares_Apresenta, [Beneficios_Label] = @Beneficios_Label, [Beneficios] = @Beneficios, [Beneficios_Apresenta] = @Beneficios_Apresenta, [Perspectiva_Label] = @Perspectiva_Label, [Perspectiva] = @Perspectiva, [Perspectiva_Apresenta] = @Perspectiva_Apresenta, [FaixaEtariaInicio_Label] = @FaixaEtariaInicio_Label, [FaixaEtariaInicio] = @FaixaEtariaInicio, [FaixaEtariaInicio_Apresenta] = @FaixaEtariaInicio_Apresenta, [FaixaEtariaFim_Label] = @FaixaEtariaFim_Label, [FaixaEtariaFim] = @FaixaEtariaFim, [FaixaEtariaFim_Apresenta] = @FaixaEtariaFim_Apresenta, [Sexo_Label] = @Sexo_Label, [Sexo] = @Sexo, [Sexo_Apresenta] = @Sexo_Apresenta, [ConhecimentoIdioma_Label] = @ConhecimentoIdioma_Label, [ConhecimentoIdioma] = @ConhecimentoIdioma, [ConhecimentoIdioma_Apresenta] = @ConhecimentoIdioma_Apresenta, [PerfilComposicaoEquipe_Label] = @PerfilComposicaoEquipe_Label, [PerfilComposicaoEquipe] = @PerfilComposicaoEquipe, [PerfilComposicaoEquipe_Apresenta] = @PerfilComposicaoEquipe_Apresenta, [PerfilGestor_Label] = @PerfilGestor_Label, [PerfilGestor] = @PerfilGestor, [PerfilGestor_Apresenta] = @PerfilGestor_Apresenta, [CursoEspecifico_Label] = @CursoEspecifico_Label, [CursoEspecifico] = @CursoEspecifico, [CursoEspecifico_Apresenta] = @CursoEspecifico_Apresenta, [Conhecimento_Label] = @Conhecimento_Label, [Conhecimento] = @Conhecimento, [Conhecimento_Apresenta] = @Conhecimento_Apresenta, [ConhecimentoInformatica_Label] = @ConhecimentoInformatica_Label, [ConhecimentoInformatica] = @ConhecimentoInformatica, [ConhecimentoInformatica_Apresenta] = @ConhecimentoInformatica_Apresenta, [CompetenciaComportamental_Label] = @CompetenciaComportamental_Label, [CompetenciaComportamental] = @CompetenciaComportamental, [CompetenciaComportamental_Apresenta] = @CompetenciaComportamental_Apresenta, [CompetenciaProfissional_Label] = @CompetenciaProfissional_Label, [CompetenciaProfissional] = @CompetenciaProfissional, [CompetenciaProfissional_Apresenta] = @CompetenciaProfissional_Apresenta, [AspectoCritico_Label] = @AspectoCritico_Label, [AspectoCritico] = @AspectoCritico, [AspectoCritico_Apresenta] = @AspectoCritico_Apresenta, [PrincipalDesafio_Label] = @PrincipalDesafio_Label, [PrincipalDesafio] = @PrincipalDesafio, [PrincipalDesafio_Apresenta] = @PrincipalDesafio_Apresenta, [RelacionamentoInterno_Label] = @RelacionamentoInterno_Label, [RelacionamentoInterno] = @RelacionamentoInterno, [RelacionamentoInterno_Apresenta] = @RelacionamentoInterno_Apresenta, [RelacionamentoExterno_Label] = @RelacionamentoExterno_Label, [RelacionamentoExterno] = @RelacionamentoExterno, [RelacionamentoExterno_Apresenta] = @RelacionamentoExterno_Apresenta, [infoSobre_viagens_Label] = @infoSobre_viagens_Label, [infoSobre_viagens] = @infoSobre_viagens, [infoSobre_viagens_Apresenta] = @infoSobre_viagens_Apresenta, [confidencial_Label] = @confidencial_Label, [confidencial] = @confidencial, [confidencial_Apresenta] = @confidencial_Apresenta WHERE [idVagaAnuncio] = @idVagaAnuncio">
                            <DeleteParameters>
                                <asp:Parameter Name="idVagaAnuncio" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Protocolo" Type="String" />
                                <asp:Parameter Name="FormacaoAcademica_Label" Type="String" />
                                <asp:Parameter Name="FormacaoAcademica" Type="String" />
                                <asp:Parameter Name="FormacaoAcademica_Apresenta" Type="Int32" />
                                <asp:Parameter Name="dsPerfilVaga_Label" Type="String" />
                                <asp:Parameter Name="dsPerfilVaga" Type="String" />
                                <asp:Parameter Name="dsPerfilVaga_Apresenta" Type="Int32" />
                                <asp:Parameter Name="Cargo_Label" Type="String" />
                                <asp:Parameter Name="Cargo" Type="String" />
                                <asp:Parameter Name="Cargo_Apresenta" Type="Int32" />
                                <asp:Parameter Name="nrovaga_Label" Type="String" />
                                <asp:Parameter Name="nrovaga" Type="Int32" />
                                <asp:Parameter Name="nrovaga_Apresenta" Type="Int32" />
                                <asp:Parameter Name="nmresponsavel_Label" Type="String" />
                                <asp:Parameter Name="nmresponsavel" Type="String" />
                                <asp:Parameter Name="nmresponsavel_Apresenta" Type="Int32" />
                                <asp:Parameter Name="TipoOportunidade_Label" Type="String" />
                                <asp:Parameter Name="TipoOportunidade" Type="String" />
                                <asp:Parameter Name="TipoOportunidade_Apresenta" Type="Int32" />
                                <asp:Parameter Name="QualificacaoHabilidadesEspecificas_Label" Type="String" />
                                <asp:Parameter Name="QualificacaoHabilidadesEspecificas" Type="String" />
                                <asp:Parameter Name="QualificacaoHabilidadesEspecificas_Apresenta" 
                                    Type="Int32" />
                                <asp:Parameter Name="Remuneracao_Label" Type="String" />
                                <asp:Parameter Name="Remuneracao" Type="Decimal" />
                                <asp:Parameter Name="Remuneracao_Apresenta" Type="Int32" />
                                <asp:Parameter Name="RemuneracaoVariavel_Label" Type="String" />
                                <asp:Parameter Name="RemuneracaoVariavel" Type="Decimal" />
                                <asp:Parameter Name="RemuneracaoVariavel_Apresenta" Type="Int32" />
                                <asp:Parameter Name="Honorario_Label" Type="String" />
                                <asp:Parameter Name="Honorario" Type="Decimal" />
                                <asp:Parameter Name="Honorario_Apresenta" Type="Int32" />
                                <asp:Parameter Name="LocalTrabalho_Label" Type="String" />
                                <asp:Parameter Name="LocalTrabalho" Type="String" />
                                <asp:Parameter Name="LocalTrabalho_Apresenta" Type="Int32" />
                                <asp:Parameter Name="ObsComplementares_Label" Type="String" />
                                <asp:Parameter Name="ObsComplementares" Type="String" />
                                <asp:Parameter Name="ObsComplementares_Apresenta" Type="Int32" />
                                <asp:Parameter Name="Beneficios_Label" Type="String" />
                                <asp:Parameter Name="Beneficios" Type="String" />
                                <asp:Parameter Name="Beneficios_Apresenta" Type="Int32" />
                                <asp:Parameter Name="Perspectiva_Label" Type="String" />
                                <asp:Parameter Name="Perspectiva" Type="String" />
                                <asp:Parameter Name="Perspectiva_Apresenta" Type="Int32" />
                                <asp:Parameter Name="FaixaEtariaInicio_Label" Type="String" />
                                <asp:Parameter Name="FaixaEtariaInicio" Type="Int32" />
                                <asp:Parameter Name="FaixaEtariaInicio_Apresenta" Type="Int32" />
                                <asp:Parameter Name="FaixaEtariaFim_Label" Type="String" />
                                <asp:Parameter Name="FaixaEtariaFim" Type="Int32" />
                                <asp:Parameter Name="FaixaEtariaFim_Apresenta" Type="Int32" />
                                <asp:Parameter Name="Sexo_Label" Type="String" />
                                <asp:Parameter Name="Sexo" Type="String" />
                                <asp:Parameter Name="Sexo_Apresenta" Type="Int32" />
                                <asp:Parameter Name="ConhecimentoIdioma_Label" Type="String" />
                                <asp:Parameter Name="ConhecimentoIdioma" Type="String" />
                                <asp:Parameter Name="ConhecimentoIdioma_Apresenta" Type="Int32" />
                                <asp:Parameter Name="PerfilComposicaoEquipe_Label" Type="String" />
                                <asp:Parameter Name="PerfilComposicaoEquipe" Type="String" />
                                <asp:Parameter Name="PerfilComposicaoEquipe_Apresenta" Type="Int32" />
                                <asp:Parameter Name="PerfilGestor_Label" Type="String" />
                                <asp:Parameter Name="PerfilGestor" Type="String" />
                                <asp:Parameter Name="PerfilGestor_Apresenta" Type="Int32" />
                                <asp:Parameter Name="CursoEspecifico_Label" Type="String" />
                                <asp:Parameter Name="CursoEspecifico" Type="String" />
                                <asp:Parameter Name="CursoEspecifico_Apresenta" Type="Int32" />
                                <asp:Parameter Name="Conhecimento_Label" Type="String" />
                                <asp:Parameter Name="Conhecimento" Type="String" />
                                <asp:Parameter Name="Conhecimento_Apresenta" Type="Int32" />
                                <asp:Parameter Name="ConhecimentoInformatica_Label" Type="String" />
                                <asp:Parameter Name="ConhecimentoInformatica" Type="String" />
                                <asp:Parameter Name="ConhecimentoInformatica_Apresenta" Type="Int32" />
                                <asp:Parameter Name="CompetenciaComportamental_Label" Type="String" />
                                <asp:Parameter Name="CompetenciaComportamental" Type="String" />
                                <asp:Parameter Name="CompetenciaComportamental_Apresenta" Type="Int32" />
                                <asp:Parameter Name="CompetenciaProfissional_Label" Type="String" />
                                <asp:Parameter Name="CompetenciaProfissional" Type="String" />
                                <asp:Parameter Name="CompetenciaProfissional_Apresenta" Type="Int32" />
                                <asp:Parameter Name="AspectoCritico_Label" Type="String" />
                                <asp:Parameter Name="AspectoCritico" Type="String" />
                                <asp:Parameter Name="AspectoCritico_Apresenta" Type="Int32" />
                                <asp:Parameter Name="PrincipalDesafio_Label" Type="String" />
                                <asp:Parameter Name="PrincipalDesafio" Type="String" />
                                <asp:Parameter Name="PrincipalDesafio_Apresenta" Type="Int32" />
                                <asp:Parameter Name="RelacionamentoInterno_Label" Type="String" />
                                <asp:Parameter Name="RelacionamentoInterno" Type="String" />
                                <asp:Parameter Name="RelacionamentoInterno_Apresenta" Type="Int32" />
                                <asp:Parameter Name="RelacionamentoExterno_Label" Type="String" />
                                <asp:Parameter Name="RelacionamentoExterno" Type="String" />
                                <asp:Parameter Name="RelacionamentoExterno_Apresenta" Type="Int32" />
                                <asp:Parameter Name="infoSobre_viagens_Label" Type="String" />
                                <asp:Parameter Name="infoSobre_viagens" Type="String" />
                                <asp:Parameter Name="infoSobre_viagens_Apresenta" Type="Int32" />
                                <asp:Parameter Name="confidencial_Label" Type="String" />
                                <asp:Parameter Name="confidencial" Type="Boolean" />
                                <asp:Parameter Name="confidencial_Apresenta" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="idVagaAnuncioLabel" Name="idVagaAnuncio" 
                                    PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Protocolo" Type="String" />
                                <asp:Parameter Name="FormacaoAcademica_Label" Type="String" />
                                <asp:Parameter Name="FormacaoAcademica" Type="String" />
                                <asp:Parameter Name="FormacaoAcademica_Apresenta" Type="Int32" />
                                <asp:Parameter Name="dsPerfilVaga_Label" Type="String" />
                                <asp:Parameter Name="dsPerfilVaga" Type="String" />
                                <asp:Parameter Name="dsPerfilVaga_Apresenta" Type="Int32" />
                                <asp:Parameter Name="Cargo_Label" Type="String" />
                                <asp:Parameter Name="Cargo" Type="String" />
                                <asp:Parameter Name="Cargo_Apresenta" Type="Int32" />
                                <asp:Parameter Name="nrovaga_Label" Type="String" />
                                <asp:Parameter Name="nrovaga" Type="Int32" />
                                <asp:Parameter Name="nrovaga_Apresenta" Type="Int32" />
                                <asp:Parameter Name="nmresponsavel_Label" Type="String" />
                                <asp:Parameter Name="nmresponsavel" Type="String" />
                                <asp:Parameter Name="nmresponsavel_Apresenta" Type="Int32" />
                                <asp:Parameter Name="TipoOportunidade_Label" Type="String" />
                                <asp:Parameter Name="TipoOportunidade" Type="String" />
                                <asp:Parameter Name="TipoOportunidade_Apresenta" Type="Int32" />
                                <asp:Parameter Name="QualificacaoHabilidadesEspecificas_Label" Type="String" />
                                <asp:Parameter Name="QualificacaoHabilidadesEspecificas" Type="String" />
                                <asp:Parameter Name="QualificacaoHabilidadesEspecificas_Apresenta" 
                                    Type="Int32" />
                                <asp:Parameter Name="Remuneracao_Label" Type="String" />
                                <asp:Parameter Name="Remuneracao" Type="Decimal" />
                                <asp:Parameter Name="Remuneracao_Apresenta" Type="Int32" />
                                <asp:Parameter Name="RemuneracaoVariavel_Label" Type="String" />
                                <asp:Parameter Name="RemuneracaoVariavel" Type="Decimal" />
                                <asp:Parameter Name="RemuneracaoVariavel_Apresenta" Type="Int32" />
                                <asp:Parameter Name="Honorario_Label" Type="String" />
                                <asp:Parameter Name="Honorario" Type="Decimal" />
                                <asp:Parameter Name="Honorario_Apresenta" Type="Int32" />
                                <asp:Parameter Name="LocalTrabalho_Label" Type="String" />
                                <asp:Parameter Name="LocalTrabalho" Type="String" />
                                <asp:Parameter Name="LocalTrabalho_Apresenta" Type="Int32" />
                                <asp:Parameter Name="ObsComplementares_Label" Type="String" />
                                <asp:Parameter Name="ObsComplementares" Type="String" />
                                <asp:Parameter Name="ObsComplementares_Apresenta" Type="Int32" />
                                <asp:Parameter Name="Beneficios_Label" Type="String" />
                                <asp:Parameter Name="Beneficios" Type="String" />
                                <asp:Parameter Name="Beneficios_Apresenta" Type="Int32" />
                                <asp:Parameter Name="Perspectiva_Label" Type="String" />
                                <asp:Parameter Name="Perspectiva" Type="String" />
                                <asp:Parameter Name="Perspectiva_Apresenta" Type="Int32" />
                                <asp:Parameter Name="FaixaEtariaInicio_Label" Type="String" />
                                <asp:Parameter Name="FaixaEtariaInicio" Type="Int32" />
                                <asp:Parameter Name="FaixaEtariaInicio_Apresenta" Type="Int32" />
                                <asp:Parameter Name="FaixaEtariaFim_Label" Type="String" />
                                <asp:Parameter Name="FaixaEtariaFim" Type="Int32" />
                                <asp:Parameter Name="FaixaEtariaFim_Apresenta" Type="Int32" />
                                <asp:Parameter Name="Sexo_Label" Type="String" />
                                <asp:Parameter Name="Sexo" Type="String" />
                                <asp:Parameter Name="Sexo_Apresenta" Type="Int32" />
                                <asp:Parameter Name="ConhecimentoIdioma_Label" Type="String" />
                                <asp:Parameter Name="ConhecimentoIdioma" Type="String" />
                                <asp:Parameter Name="ConhecimentoIdioma_Apresenta" Type="Int32" />
                                <asp:Parameter Name="PerfilComposicaoEquipe_Label" Type="String" />
                                <asp:Parameter Name="PerfilComposicaoEquipe" Type="String" />
                                <asp:Parameter Name="PerfilComposicaoEquipe_Apresenta" Type="Int32" />
                                <asp:Parameter Name="PerfilGestor_Label" Type="String" />
                                <asp:Parameter Name="PerfilGestor" Type="String" />
                                <asp:Parameter Name="PerfilGestor_Apresenta" Type="Int32" />
                                <asp:Parameter Name="CursoEspecifico_Label" Type="String" />
                                <asp:Parameter Name="CursoEspecifico" Type="String" />
                                <asp:Parameter Name="CursoEspecifico_Apresenta" Type="Int32" />
                                <asp:Parameter Name="Conhecimento_Label" Type="String" />
                                <asp:Parameter Name="Conhecimento" Type="String" />
                                <asp:Parameter Name="Conhecimento_Apresenta" Type="Int32" />
                                <asp:Parameter Name="ConhecimentoInformatica_Label" Type="String" />
                                <asp:Parameter Name="ConhecimentoInformatica" Type="String" />
                                <asp:Parameter Name="ConhecimentoInformatica_Apresenta" Type="Int32" />
                                <asp:Parameter Name="CompetenciaComportamental_Label" Type="String" />
                                <asp:Parameter Name="CompetenciaComportamental" Type="String" />
                                <asp:Parameter Name="CompetenciaComportamental_Apresenta" Type="Int32" />
                                <asp:Parameter Name="CompetenciaProfissional_Label" Type="String" />
                                <asp:Parameter Name="CompetenciaProfissional" Type="String" />
                                <asp:Parameter Name="CompetenciaProfissional_Apresenta" Type="Int32" />
                                <asp:Parameter Name="AspectoCritico_Label" Type="String" />
                                <asp:Parameter Name="AspectoCritico" Type="String" />
                                <asp:Parameter Name="AspectoCritico_Apresenta" Type="Int32" />
                                <asp:Parameter Name="PrincipalDesafio_Label" Type="String" />
                                <asp:Parameter Name="PrincipalDesafio" Type="String" />
                                <asp:Parameter Name="PrincipalDesafio_Apresenta" Type="Int32" />
                                <asp:Parameter Name="RelacionamentoInterno_Label" Type="String" />
                                <asp:Parameter Name="RelacionamentoInterno" Type="String" />
                                <asp:Parameter Name="RelacionamentoInterno_Apresenta" Type="Int32" />
                                <asp:Parameter Name="RelacionamentoExterno_Label" Type="String" />
                                <asp:Parameter Name="RelacionamentoExterno" Type="String" />
                                <asp:Parameter Name="RelacionamentoExterno_Apresenta" Type="Int32" />
                                <asp:Parameter Name="infoSobre_viagens_Label" Type="String" />
                                <asp:Parameter Name="infoSobre_viagens" Type="String" />
                                <asp:Parameter Name="infoSobre_viagens_Apresenta" Type="Int32" />
                                <asp:Parameter Name="confidencial_Label" Type="String" />
                                <asp:Parameter Name="confidencial" Type="Boolean" />
                                <asp:Parameter Name="confidencial_Apresenta" Type="Int32" />
                                <asp:Parameter Name="idVagaAnuncio" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <br />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Protocolo:
                        <asp:TextBox ID="ProtocoloTextBox" runat="server" 
                            Text='<%# Bind("Protocolo") %>' />
                        <br />
                        FormacaoAcademica_Label:
                        <asp:TextBox ID="FormacaoAcademica_LabelTextBox" runat="server" 
                            Text='<%# Bind("FormacaoAcademica_Label") %>' />
                        <br />
                        FormacaoAcademica:
                        <asp:TextBox ID="FormacaoAcademicaTextBox" runat="server" 
                            Text='<%# Bind("FormacaoAcademica") %>' />
                        <br />
                        FormacaoAcademica_Apresenta:
                        <asp:TextBox ID="FormacaoAcademica_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("FormacaoAcademica_Apresenta") %>' />
                        <br />
                        dsPerfilVaga_Label:
                        <asp:TextBox ID="dsPerfilVaga_LabelTextBox" runat="server" 
                            Text='<%# Bind("dsPerfilVaga_Label") %>' />
                        <br />
                        dsPerfilVaga:
                        <asp:TextBox ID="dsPerfilVagaTextBox" runat="server" 
                            Text='<%# Bind("dsPerfilVaga") %>' />
                        <br />
                        dsPerfilVaga_Apresenta:
                        <asp:TextBox ID="dsPerfilVaga_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("dsPerfilVaga_Apresenta") %>' />
                        <br />
                        Cargo_Label:
                        <asp:TextBox ID="Cargo_LabelTextBox" runat="server" 
                            Text='<%# Bind("Cargo_Label") %>' />
                        <br />
                        Cargo:
                        <asp:TextBox ID="CargoTextBox" runat="server" Text='<%# Bind("Cargo") %>' />
                        <br />
                        Cargo_Apresenta:
                        <asp:TextBox ID="Cargo_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("Cargo_Apresenta") %>' />
                        <br />
                        nrovaga_Label:
                        <asp:TextBox ID="nrovaga_LabelTextBox" runat="server" 
                            Text='<%# Bind("nrovaga_Label") %>' />
                        <br />
                        nrovaga:
                        <asp:TextBox ID="nrovagaTextBox" runat="server" Text='<%# Bind("nrovaga") %>' />
                        <br />
                        nrovaga_Apresenta:
                        <asp:TextBox ID="nrovaga_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("nrovaga_Apresenta") %>' />
                        <br />
                        nmresponsavel_Label:
                        <asp:TextBox ID="nmresponsavel_LabelTextBox" runat="server" 
                            Text='<%# Bind("nmresponsavel_Label") %>' />
                        <br />
                        nmresponsavel:
                        <asp:TextBox ID="nmresponsavelTextBox" runat="server" 
                            Text='<%# Bind("nmresponsavel") %>' />
                        <br />
                        nmresponsavel_Apresenta:
                        <asp:TextBox ID="nmresponsavel_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("nmresponsavel_Apresenta") %>' />
                        <br />
                        TipoOportunidade_Label:
                        <asp:TextBox ID="TipoOportunidade_LabelTextBox" runat="server" 
                            Text='<%# Bind("TipoOportunidade_Label") %>' />
                        <br />
                        TipoOportunidade:
                        <asp:TextBox ID="TipoOportunidadeTextBox" runat="server" 
                            Text='<%# Bind("TipoOportunidade") %>' />
                        <br />
                        TipoOportunidade_Apresenta:
                        <asp:TextBox ID="TipoOportunidade_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("TipoOportunidade_Apresenta") %>' />
                        <br />
                        QualificacaoHabilidadesEspecificas_Label:
                        <asp:TextBox ID="QualificacaoHabilidadesEspecificas_LabelTextBox" 
                            runat="server" Text='<%# Bind("QualificacaoHabilidadesEspecificas_Label") %>' />
                        <br />
                        QualificacaoHabilidadesEspecificas:
                        <asp:TextBox ID="QualificacaoHabilidadesEspecificasTextBox" runat="server" 
                            Text='<%# Bind("QualificacaoHabilidadesEspecificas") %>' />
                        <br />
                        QualificacaoHabilidadesEspecificas_Apresenta:
                        <asp:TextBox ID="QualificacaoHabilidadesEspecificas_ApresentaTextBox" 
                            runat="server" 
                            Text='<%# Bind("QualificacaoHabilidadesEspecificas_Apresenta") %>' />
                        <br />
                        Remuneracao_Label:
                        <asp:TextBox ID="Remuneracao_LabelTextBox" runat="server" 
                            Text='<%# Bind("Remuneracao_Label") %>' />
                        <br />
                        Remuneracao:
                        <asp:TextBox ID="RemuneracaoTextBox" runat="server" 
                            Text='<%# Bind("Remuneracao") %>' />
                        <br />
                        Remuneracao_Apresenta:
                        <asp:TextBox ID="Remuneracao_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("Remuneracao_Apresenta") %>' />
                        <br />
                        RemuneracaoVariavel_Label:
                        <asp:TextBox ID="RemuneracaoVariavel_LabelTextBox" runat="server" 
                            Text='<%# Bind("RemuneracaoVariavel_Label") %>' />
                        <br />
                        RemuneracaoVariavel:
                        <asp:TextBox ID="RemuneracaoVariavelTextBox" runat="server" 
                            Text='<%# Bind("RemuneracaoVariavel") %>' />
                        <br />
                        RemuneracaoVariavel_Apresenta:
                        <asp:TextBox ID="RemuneracaoVariavel_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("RemuneracaoVariavel_Apresenta") %>' />
                        <br />
                        Honorario_Label:
                        <asp:TextBox ID="Honorario_LabelTextBox" runat="server" 
                            Text='<%# Bind("Honorario_Label") %>' />
                        <br />
                        Honorario:
                        <asp:TextBox ID="HonorarioTextBox" runat="server" 
                            Text='<%# Bind("Honorario") %>' />
                        <br />
                        Honorario_Apresenta:
                        <asp:TextBox ID="Honorario_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("Honorario_Apresenta") %>' />
                        <br />
                        LocalTrabalho_Label:
                        <asp:TextBox ID="LocalTrabalho_LabelTextBox" runat="server" 
                            Text='<%# Bind("LocalTrabalho_Label") %>' />
                        <br />
                        LocalTrabalho:
                        <asp:TextBox ID="LocalTrabalhoTextBox" runat="server" 
                            Text='<%# Bind("LocalTrabalho") %>' />
                        <br />
                        LocalTrabalho_Apresenta:
                        <asp:TextBox ID="LocalTrabalho_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("LocalTrabalho_Apresenta") %>' />
                        <br />
                        ObsComplementares_Label:
                        <asp:TextBox ID="ObsComplementares_LabelTextBox" runat="server" 
                            Text='<%# Bind("ObsComplementares_Label") %>' />
                        <br />
                        ObsComplementares:
                        <asp:TextBox ID="ObsComplementaresTextBox" runat="server" 
                            Text='<%# Bind("ObsComplementares") %>' />
                        <br />
                        ObsComplementares_Apresenta:
                        <asp:TextBox ID="ObsComplementares_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("ObsComplementares_Apresenta") %>' />
                        <br />
                        Beneficios_Label:
                        <asp:TextBox ID="Beneficios_LabelTextBox" runat="server" 
                            Text='<%# Bind("Beneficios_Label") %>' />
                        <br />
                        Beneficios:
                        <asp:TextBox ID="BeneficiosTextBox" runat="server" 
                            Text='<%# Bind("Beneficios") %>' />
                        <br />
                        Beneficios_Apresenta:
                        <asp:TextBox ID="Beneficios_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("Beneficios_Apresenta") %>' />
                        <br />
                        Perspectiva_Label:
                        <asp:TextBox ID="Perspectiva_LabelTextBox" runat="server" 
                            Text='<%# Bind("Perspectiva_Label") %>' />
                        <br />
                        Perspectiva:
                        <asp:TextBox ID="PerspectivaTextBox" runat="server" 
                            Text='<%# Bind("Perspectiva") %>' />
                        <br />
                        Perspectiva_Apresenta:
                        <asp:TextBox ID="Perspectiva_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("Perspectiva_Apresenta") %>' />
                        <br />
                        FaixaEtariaInicio_Label:
                        <asp:TextBox ID="FaixaEtariaInicio_LabelTextBox" runat="server" 
                            Text='<%# Bind("FaixaEtariaInicio_Label") %>' />
                        <br />
                        FaixaEtariaInicio:
                        <asp:TextBox ID="FaixaEtariaInicioTextBox" runat="server" 
                            Text='<%# Bind("FaixaEtariaInicio") %>' />
                        <br />
                        FaixaEtariaInicio_Apresenta:
                        <asp:TextBox ID="FaixaEtariaInicio_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("FaixaEtariaInicio_Apresenta") %>' />
                        <br />
                        FaixaEtariaFim_Label:
                        <asp:TextBox ID="FaixaEtariaFim_LabelTextBox" runat="server" 
                            Text='<%# Bind("FaixaEtariaFim_Label") %>' />
                        <br />
                        FaixaEtariaFim:
                        <asp:TextBox ID="FaixaEtariaFimTextBox" runat="server" 
                            Text='<%# Bind("FaixaEtariaFim") %>' />
                        <br />
                        FaixaEtariaFim_Apresenta:
                        <asp:TextBox ID="FaixaEtariaFim_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("FaixaEtariaFim_Apresenta") %>' />
                        <br />
                        Sexo_Label:
                        <asp:TextBox ID="Sexo_LabelTextBox" runat="server" 
                            Text='<%# Bind("Sexo_Label") %>' />
                        <br />
                        Sexo:
                        <asp:TextBox ID="SexoTextBox" runat="server" Text='<%# Bind("Sexo") %>' />
                        <br />
                        Sexo_Apresenta:
                        <asp:TextBox ID="Sexo_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("Sexo_Apresenta") %>' />
                        <br />
                        ConhecimentoIdioma_Label:
                        <asp:TextBox ID="ConhecimentoIdioma_LabelTextBox" runat="server" 
                            Text='<%# Bind("ConhecimentoIdioma_Label") %>' />
                        <br />
                        ConhecimentoIdioma:
                        <asp:TextBox ID="ConhecimentoIdiomaTextBox" runat="server" 
                            Text='<%# Bind("ConhecimentoIdioma") %>' />
                        <br />
                        ConhecimentoIdioma_Apresenta:
                        <asp:TextBox ID="ConhecimentoIdioma_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("ConhecimentoIdioma_Apresenta") %>' />
                        <br />
                        PerfilComposicaoEquipe_Label:
                        <asp:TextBox ID="PerfilComposicaoEquipe_LabelTextBox" runat="server" 
                            Text='<%# Bind("PerfilComposicaoEquipe_Label") %>' />
                        <br />
                        PerfilComposicaoEquipe:
                        <asp:TextBox ID="PerfilComposicaoEquipeTextBox" runat="server" 
                            Text='<%# Bind("PerfilComposicaoEquipe") %>' />
                        <br />
                        PerfilComposicaoEquipe_Apresenta:
                        <asp:TextBox ID="PerfilComposicaoEquipe_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("PerfilComposicaoEquipe_Apresenta") %>' />
                        <br />
                        PerfilGestor_Label:
                        <asp:TextBox ID="PerfilGestor_LabelTextBox" runat="server" 
                            Text='<%# Bind("PerfilGestor_Label") %>' />
                        <br />
                        PerfilGestor:
                        <asp:TextBox ID="PerfilGestorTextBox" runat="server" 
                            Text='<%# Bind("PerfilGestor") %>' />
                        <br />
                        PerfilGestor_Apresenta:
                        <asp:TextBox ID="PerfilGestor_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("PerfilGestor_Apresenta") %>' />
                        <br />
                        CursoEspecifico_Label:
                        <asp:TextBox ID="CursoEspecifico_LabelTextBox" runat="server" 
                            Text='<%# Bind("CursoEspecifico_Label") %>' />
                        <br />
                        CursoEspecifico:
                        <asp:TextBox ID="CursoEspecificoTextBox" runat="server" 
                            Text='<%# Bind("CursoEspecifico") %>' />
                        <br />
                        CursoEspecifico_Apresenta:
                        <asp:TextBox ID="CursoEspecifico_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("CursoEspecifico_Apresenta") %>' />
                        <br />
                        Conhecimento_Label:
                        <asp:TextBox ID="Conhecimento_LabelTextBox" runat="server" 
                            Text='<%# Bind("Conhecimento_Label") %>' />
                        <br />
                        Conhecimento:
                        <asp:TextBox ID="ConhecimentoTextBox" runat="server" 
                            Text='<%# Bind("Conhecimento") %>' />
                        <br />
                        Conhecimento_Apresenta:
                        <asp:TextBox ID="Conhecimento_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("Conhecimento_Apresenta") %>' />
                        <br />
                        ConhecimentoInformatica_Label:
                        <asp:TextBox ID="ConhecimentoInformatica_LabelTextBox" runat="server" 
                            Text='<%# Bind("ConhecimentoInformatica_Label") %>' />
                        <br />
                        ConhecimentoInformatica:
                        <asp:TextBox ID="ConhecimentoInformaticaTextBox" runat="server" 
                            Text='<%# Bind("ConhecimentoInformatica") %>' />
                        <br />
                        ConhecimentoInformatica_Apresenta:
                        <asp:TextBox ID="ConhecimentoInformatica_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("ConhecimentoInformatica_Apresenta") %>' />
                        <br />
                        CompetenciaComportamental_Label:
                        <asp:TextBox ID="CompetenciaComportamental_LabelTextBox" runat="server" 
                            Text='<%# Bind("CompetenciaComportamental_Label") %>' />
                        <br />
                        CompetenciaComportamental:
                        <asp:TextBox ID="CompetenciaComportamentalTextBox" runat="server" 
                            Text='<%# Bind("CompetenciaComportamental") %>' />
                        <br />
                        CompetenciaComportamental_Apresenta:
                        <asp:TextBox ID="CompetenciaComportamental_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("CompetenciaComportamental_Apresenta") %>' />
                        <br />
                        CompetenciaProfissional_Label:
                        <asp:TextBox ID="CompetenciaProfissional_LabelTextBox" runat="server" 
                            Text='<%# Bind("CompetenciaProfissional_Label") %>' />
                        <br />
                        CompetenciaProfissional:
                        <asp:TextBox ID="CompetenciaProfissionalTextBox" runat="server" 
                            Text='<%# Bind("CompetenciaProfissional") %>' />
                        <br />
                        CompetenciaProfissional_Apresenta:
                        <asp:TextBox ID="CompetenciaProfissional_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("CompetenciaProfissional_Apresenta") %>' />
                        <br />
                        AspectoCritico_Label:
                        <asp:TextBox ID="AspectoCritico_LabelTextBox" runat="server" 
                            Text='<%# Bind("AspectoCritico_Label") %>' />
                        <br />
                        AspectoCritico:
                        <asp:TextBox ID="AspectoCriticoTextBox" runat="server" 
                            Text='<%# Bind("AspectoCritico") %>' />
                        <br />
                        AspectoCritico_Apresenta:
                        <asp:TextBox ID="AspectoCritico_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("AspectoCritico_Apresenta") %>' />
                        <br />
                        PrincipalDesafio_Label:
                        <asp:TextBox ID="PrincipalDesafio_LabelTextBox" runat="server" 
                            Text='<%# Bind("PrincipalDesafio_Label") %>' />
                        <br />
                        PrincipalDesafio:
                        <asp:TextBox ID="PrincipalDesafioTextBox" runat="server" 
                            Text='<%# Bind("PrincipalDesafio") %>' />
                        <br />
                        PrincipalDesafio_Apresenta:
                        <asp:TextBox ID="PrincipalDesafio_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("PrincipalDesafio_Apresenta") %>' />
                        <br />
                        RelacionamentoInterno_Label:
                        <asp:TextBox ID="RelacionamentoInterno_LabelTextBox" runat="server" 
                            Text='<%# Bind("RelacionamentoInterno_Label") %>' />
                        <br />
                        RelacionamentoInterno:
                        <asp:TextBox ID="RelacionamentoInternoTextBox" runat="server" 
                            Text='<%# Bind("RelacionamentoInterno") %>' />
                        <br />
                        RelacionamentoInterno_Apresenta:
                        <asp:TextBox ID="RelacionamentoInterno_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("RelacionamentoInterno_Apresenta") %>' />
                        <br />
                        RelacionamentoExterno_Label:
                        <asp:TextBox ID="RelacionamentoExterno_LabelTextBox" runat="server" 
                            Text='<%# Bind("RelacionamentoExterno_Label") %>' />
                        <br />
                        RelacionamentoExterno:
                        <asp:TextBox ID="RelacionamentoExternoTextBox" runat="server" 
                            Text='<%# Bind("RelacionamentoExterno") %>' />
                        <br />
                        RelacionamentoExterno_Apresenta:
                        <asp:TextBox ID="RelacionamentoExterno_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("RelacionamentoExterno_Apresenta") %>' />
                        <br />
                        infoSobre_viagens_Label:
                        <asp:TextBox ID="infoSobre_viagens_LabelTextBox" runat="server" 
                            Text='<%# Bind("infoSobre_viagens_Label") %>' />
                        <br />
                        infoSobre_viagens:
                        <asp:TextBox ID="infoSobre_viagensTextBox" runat="server" 
                            Text='<%# Bind("infoSobre_viagens") %>' />
                        <br />
                        infoSobre_viagens_Apresenta:
                        <asp:TextBox ID="infoSobre_viagens_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("infoSobre_viagens_Apresenta") %>' />
                        <br />
                        confidencial_Label:
                        <asp:TextBox ID="confidencial_LabelTextBox" runat="server" 
                            Text='<%# Bind("confidencial_Label") %>' />
                        <br />
                        confidencial:
                        <asp:CheckBox ID="confidencialCheckBox" runat="server" 
                            Checked='<%# Bind("confidencial") %>' />
                        <br />
                        confidencial_Apresenta:
                        <asp:TextBox ID="confidencial_ApresentaTextBox" runat="server" 
                            Text='<%# Bind("confidencial_Apresenta") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table ID="PreViewVaga" cellpadding="0" cellspacing="0" width="600px">
                            <tr>
                                <td>
                                    <asp:Label ID="ProtocoloLabel" runat="server" CssClass="tituloCurriculo" 
                                        Text='<%# Bind("Protocolo") %>' />
                                    <br />
                                    <br />
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                        CommandName="Edit" Text="Editar dados da Publicação" />
                                    &nbsp;|
                                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                        CommandName="Delete" 
                                        onclientclick="return confirm(&quot;Quer excluir o anúncio?&quot;)" 
                                        Text="Excluir Publicação" Enabled="False" />
                                    &nbsp;|
                                    <asp:HyperLink ID="HyperLinkVoltar" runat="server" 
                                        NavigateUrl="~/_consultorWizard/vaga.aspx">Voltar</asp:HyperLink>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                        <table ID="Form" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="FormacaoTD1" visible='<%# Eval("FormacaoAcademica_Apresenta") %>'>
                                    <asp:Label ID="FormacaoAcademica_LabelLabel" runat="server" 
                                        CssClass="tituloEmp" Text='<%# Bind("FormacaoAcademica_Label") %>' 
                                        Visible='<%# Eval("FormacaoAcademica_Apresenta") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="FormacaoTD2" visible='<%# Eval("FormacaoAcademica_Apresenta") %>'>
                                    <asp:Label ID="FormacaoAcademicaLabel" runat="server" 
                                        Text='<%# Bind("FormacaoAcademica") %>' 
                                        Visible='<%# Eval("FormacaoAcademica_Apresenta") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="PerfilVagaTD1" visible='<%# Eval("dsPerfilVaga_Apresenta") %>'>
                                    <asp:Label ID="dsPerfilVaga_LabelLabel" runat="server" CssClass="tituloEmp" 
                                        Text='<%# Bind("dsPerfilVaga_Label") %>' 
                                        Visible='<%# Eval("dsPerfilVaga_Apresenta") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="PerfilVagaTD2" visible='<%# Eval("dsPerfilVaga_Apresenta") %>'>
                                    <asp:Label ID="dsPerfilVagaLabel" runat="server" 
                                        Text='<%# Bind("dsPerfilVaga") %>' 
                                        Visible='<%# Eval("dsPerfilVaga_Apresenta") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="CargoTD1" visible='<%# Eval("Cargo_Apresenta") %>'>
                                    <asp:Label ID="Cargo_LabelLabel" runat="server" CssClass="tituloEmp" 
                                        Text='<%# Bind("Cargo_Label") %>' 
                                        Visible='<%# Eval("Cargo_Apresenta") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="CargoTD2" visible='<%# Eval("Cargo_Apresenta") %>'>
                                    <asp:Label ID="CargoLabel" runat="server" 
                                        Text='<%# Bind("Cargo") %>'
                                        Visible='<%# Eval("Cargo_Apresenta") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="nrovagaTD1" visible='<%# Eval("nrovaga_Apresenta") %>'>
                                    <asp:Label ID="nrovaga_LabelLabel" runat="server" CssClass="tituloEmp" 
                                        Text='<%# Bind("nrovaga_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="nrovagaTD2" visible='<%# Eval("nrovaga_Apresenta") %>'>
                                    <asp:Label ID="nrovagaLabel" runat="server" Text='<%# Bind("nrovaga") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="nmresponsavelTD1" visible='<%# Eval("nmresponsavel_Apresenta") %>'>
                                    <asp:Label ID="nmresponsavel_LabelLabel" runat="server" CssClass="tituloEmp" 
                                        Text='<%# Bind("nmresponsavel_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="nmresponsavelTD2" visible='<%# Eval("nmresponsavel_Apresenta") %>'>
                                    <asp:Label ID="nmresponsavelLabel" runat="server" 
                                        Text='<%# Bind("nmresponsavel") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="TipoOportunidadeTD1" visible='<%# Eval("TipoOportunidade_Apresenta") %>'>
                                    <asp:Label ID="TipoOportunidade_LabelLabel" runat="server" CssClass="tituloEmp" 
                                        Text='<%# Bind("TipoOportunidade_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="TipoOportunidadeTD2" visible='<%# Eval("TipoOportunidade_Apresenta") %>'>
                                    <asp:Label ID="TipoOportunidadeLabel" runat="server" 
                                        Text='<%# Bind("TipoOportunidade") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="QualificacaoHabilidadesEspecificasTD1" visible='<%# Eval("QualificacaoHabilidadesEspecificas_Apresenta") %>'>
                                    <asp:Label ID="QualificacaoHabilidadesEspecificas_LabelLabel" runat="server" 
                                        CssClass="tituloEmp" 
                                        Text='<%# Bind("QualificacaoHabilidadesEspecificas_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="QualificacaoHabilidadesEspecificasTD2" visible='<%# Eval("QualificacaoHabilidadesEspecificas_Apresenta") %>'>
                                    <asp:Label ID="QualificacaoHabilidadesEspecificasLabel" runat="server" 
                                        Text='<%# Bind("QualificacaoHabilidadesEspecificas") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="Remuneracao_LabelTD1" visible='<%# Eval("Remuneracao_Apresenta") %>'>
                                    <asp:Label ID="Remuneracao_LabelLabel" runat="server" CssClass="tituloEmp" 
                                        Text='<%# Bind("Remuneracao_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="Remuneracao_LabelTD2" visible='<%# Eval("Remuneracao_Apresenta") %>'>
                                    <asp:Label ID="RemuneracaoLabel" runat="server" 
                                        Text='<%# Bind("Remuneracao", "{0:C}") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="RemuneracaoVariavelTD1" visible='<%# Eval("RemuneracaoVariavel_Apresenta") %>'>
                                    <asp:Label ID="RemuneracaoVariavel_LabelLabel" runat="server" 
                                        CssClass="tituloEmp" Text='<%# Bind("RemuneracaoVariavel_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="RemuneracaoVariavelTD2" visible='<%# Eval("RemuneracaoVariavel_Apresenta") %>'>
                                    <asp:Label ID="RemuneracaoVariavelLabel" runat="server" 
                                        Text='<%# Bind("RemuneracaoVariavel", "{0:C}") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="HonorarioTD1" visible='<%# Eval("Honorario_Apresenta") %>'>
                                    <asp:Label ID="Honorario_LabelLabel" runat="server" CssClass="tituloEmp" 
                                        Text='<%# Bind("Honorario_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="HonorarioTD2" visible='<%# Eval("Honorario_Apresenta") %>'>
                                    <asp:Label ID="HonorarioLabel" runat="server" 
                                        Text='<%# Bind("Honorario", "{0:C}") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="LocalTrabalhoTD1" visible='<%# Eval("LocalTrabalho_Apresenta") %>'>
                                    <asp:Label ID="LocalTrabalho_LabelLabel" runat="server" CssClass="tituloEmp" 
                                        Text='<%# Bind("LocalTrabalho_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="LocalTrabalhoTD2" visible='<%# Eval("LocalTrabalho_Apresenta") %>'>
                                    <asp:Label ID="LocalTrabalhoLabel" runat="server" 
                                        Text='<%# Bind("LocalTrabalho") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="ObsComplementaresTD1" visible='<%# Eval("ObsComplementares_Apresenta") %>'>
                                    <asp:Label ID="ObsComplementares_LabelLabel" runat="server" 
                                        CssClass="tituloEmp" Text='<%# Bind("ObsComplementares_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="ObsComplementaresTD2" visible='<%# Eval("ObsComplementares_Apresenta") %>'>
                                    <asp:Label ID="ObsComplementaresLabel" runat="server" 
                                        Text='<%# Bind("ObsComplementares") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="BeneficiosTD1" visible='<%# Eval("Beneficios_Apresenta") %>'>
                                    <asp:Label ID="Beneficios_LabelLabel" runat="server" CssClass="tituloEmp" 
                                        Text='<%# Bind("Beneficios_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="BeneficiosTD2" visible='<%# Eval("Beneficios_Apresenta") %>'>
                                    <asp:Label ID="BeneficiosLabel" runat="server" 
                                        Text='<%# Bind("Beneficios") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="PerspectivaTD1" visible='<%# Eval("Perspectiva_Apresenta") %>'>
                                    <asp:Label ID="Perspectiva_LabelLabel" runat="server" CssClass="tituloEmp" 
                                        Text='<%# Bind("Perspectiva_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="PerspectivaTD2" visible='<%# Eval("Perspectiva_Apresenta") %>'>
                                    <asp:Label ID="PerspectivaLabel" runat="server" 
                                        Text='<%# Bind("Perspectiva") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="FaixaEtariaInicioTD1" visible='<%# Eval("FaixaEtariaInicio_Apresenta") %>'>
                                    <asp:Label ID="FaixaEtariaInicio_LabelLabel" runat="server" 
                                        CssClass="tituloEmp" Text='<%# Bind("FaixaEtariaInicio_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="FaixaEtariaInicioTD2" visible='<%# Eval("FaixaEtariaInicio_Apresenta") %>'>
                                    <asp:Label ID="FaixaEtariaInicioLabel" runat="server" 
                                        Text='<%# Bind("FaixaEtariaInicio", "{0} anos") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="FaixaEtariaFimTD1" visible='<%# Eval("FaixaEtariaFim_Apresenta") %>'>
                                    <asp:Label ID="FaixaEtariaFim_LabelLabel" runat="server" CssClass="tituloEmp" 
                                        Text='<%# Bind("FaixaEtariaFim_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="FaixaEtariaFimTD2" visible='<%# Eval("FaixaEtariaFim_Apresenta") %>'>
                                    <asp:Label ID="FaixaEtariaFimLabel" runat="server" 
                                        Text='<%# Bind("FaixaEtariaFim", "{0} anos") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="SexoTD1" visible='<%# Eval("Sexo_Apresenta") %>'>
                                    <asp:Label ID="Sexo_LabelLabel" runat="server" CssClass="tituloEmp" 
                                        Text='<%# Bind("Sexo_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="SexoTD2" visible='<%# Eval("Sexo_Apresenta") %>'>
                                    <asp:Label ID="SexoLabel" runat="server" Text='<%# Bind("Sexo") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="ConhecimentoIdiomaTD1" visible='<%# Eval("ConhecimentoIdioma_Apresenta") %>'>
                                    <asp:Label ID="ConhecimentoIdioma_LabelLabel" runat="server" 
                                        CssClass="tituloEmp" Text='<%# Bind("ConhecimentoIdioma_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="ConhecimentoIdiomaTD2" visible='<%# Eval("ConhecimentoIdioma_Apresenta") %>'>
                                    <asp:Label ID="ConhecimentoIdiomaLabel" runat="server" 
                                        Text='<%# Bind("ConhecimentoIdioma") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="PerfilComposicaoEquipeTD1" visible='<%# Eval("PerfilComposicaoEquipe_Apresenta") %>'>
                                    <asp:Label ID="PerfilComposicaoEquipe_LabelLabel" runat="server" 
                                        CssClass="tituloEmp" Text='<%# Bind("PerfilComposicaoEquipe_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="PerfilComposicaoEquipeTD2" visible='<%# Eval("PerfilComposicaoEquipe_Apresenta") %>'>
                                    <asp:Label ID="PerfilComposicaoEquipeLabel" runat="server" 
                                        Text='<%# Bind("PerfilComposicaoEquipe") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="PerfilGestorTD1" visible='<%# Eval("PerfilGestor_Apresenta") %>'>
                                    <asp:Label ID="PerfilGestor_LabelLabel" runat="server" CssClass="tituloEmp" 
                                        Text='<%# Bind("PerfilGestor_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="PerfilGestorTD2" visible='<%# Eval("PerfilGestor_Apresenta") %>'>
                                    <asp:Label ID="PerfilGestorLabel" runat="server" 
                                        Text='<%# Bind("PerfilGestor") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="CursoEspecificoTD1" visible='<%# Eval("CursoEspecifico_Apresenta") %>'>
                                    <asp:Label ID="CursoEspecifico_LabelLabel" runat="server" CssClass="tituloEmp" 
                                        Text='<%# Bind("CursoEspecifico_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="CursoEspecificoTD2" visible='<%# Eval("CursoEspecifico_Apresenta") %>'>
                                    <asp:Label ID="CursoEspecificoLabel" runat="server" 
                                        Text='<%# Bind("CursoEspecifico") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="ConhecimentoTD1" visible='<%# Eval("Conhecimento_Apresenta") %>'>
                                    <asp:Label ID="Conhecimento_LabelLabel" runat="server" CssClass="tituloEmp" 
                                        Text='<%# Bind("Conhecimento_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="ConhecimentoTD2" visible='<%# Eval("Conhecimento_Apresenta") %>'>
                                    <asp:Label ID="ConhecimentoLabel" runat="server" 
                                        Text='<%# Bind("Conhecimento") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="ConhecimentoInformaticaTD1" visible='<%# Eval("ConhecimentoInformatica_Apresenta") %>'>
                                    <asp:Label ID="ConhecimentoInformatica_LabelLabel" runat="server" 
                                        CssClass="tituloEmp" Text='<%# Bind("ConhecimentoInformatica_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="ConhecimentoInformaticaTD2" visible='<%# Eval("ConhecimentoInformatica_Apresenta") %>'>
                                    <asp:Label ID="ConhecimentoInformaticaLabel" runat="server" 
                                        Text='<%# Bind("ConhecimentoInformatica") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="CompetenciaComportamentalTD1" visible='<%# Eval("CompetenciaComportamental_Apresenta") %>'>
                                    <asp:Label ID="CompetenciaComportamental_LabelLabel" runat="server" 
                                        CssClass="tituloEmp" Text='<%# Bind("CompetenciaComportamental_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="CompetenciaComportamentalTD2" visible='<%# Eval("CompetenciaComportamental_Apresenta") %>'>
                                    <asp:Label ID="CompetenciaComportamentalLabel" runat="server" 
                                        Text='<%# Bind("CompetenciaComportamental") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="CompetenciaProfissionalTD1" visible='<%# Eval("CompetenciaProfissional_Apresenta") %>'>
                                    <asp:Label ID="CompetenciaProfissional_LabelLabel" runat="server" 
                                        CssClass="tituloEmp" Text='<%# Bind("CompetenciaProfissional_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="CompetenciaProfissionalTD2" visible='<%# Eval("CompetenciaProfissional_Apresenta") %>'>
                                    <asp:Label ID="CompetenciaProfissionalLabel" runat="server" 
                                        Text='<%# Bind("CompetenciaProfissional") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="AspectoCriticoTD1" visible='<%# Eval("AspectoCritico_Apresenta") %>'>
                                    <asp:Label ID="AspectoCritico_LabelLabel" runat="server" CssClass="tituloEmp" 
                                        Text='<%# Bind("AspectoCritico_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="AspectoCriticoTD2" visible='<%# Eval("AspectoCritico_Apresenta") %>'>
                                    <asp:Label ID="AspectoCriticoLabel" runat="server" 
                                        Text='<%# Bind("AspectoCritico") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="PrincipalDesafioTD1" visible='<%# Eval("PrincipalDesafio_Apresenta") %>'>
                                    <asp:Label ID="PrincipalDesafio_LabelLabel" runat="server" CssClass="tituloEmp" 
                                        Text='<%# Bind("PrincipalDesafio_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="PrincipalDesafioTD2" visible='<%# Eval("PrincipalDesafio_Apresenta") %>'>
                                    <asp:Label ID="PrincipalDesafioLabel" runat="server" 
                                        Text='<%# Bind("PrincipalDesafio") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="RelacionamentoInternoTD1" visible='<%# Eval("RelacionamentoInterno_Apresenta") %>'>
                                    <asp:Label ID="RelacionamentoInterno_LabelLabel" runat="server" 
                                        CssClass="tituloEmp" Text='<%# Bind("RelacionamentoInterno_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="RelacionamentoInternoTD2" visible='<%# Eval("RelacionamentoInterno_Apresenta") %>'>
                                    <asp:Label ID="RelacionamentoInternoLabel" runat="server" 
                                        Text='<%# Bind("RelacionamentoInterno") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="RelacionamentoExternoTD1" visible='<%# Eval("RelacionamentoExterno_Apresenta") %>'>
                                    <asp:Label ID="RelacionamentoExterno_LabelLabel" runat="server" 
                                        CssClass="tituloEmp" Text='<%# Bind("RelacionamentoExterno_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="RelacionamentoExternoTD2" visible='<%# Eval("RelacionamentoExterno_Apresenta") %>'>
                                    <asp:Label ID="RelacionamentoExternoLabel" runat="server" 
                                        Text='<%# Bind("RelacionamentoExterno") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" width="40%" class="tableFormulario" runat="server" id="infoSobre_viagensTD1" visible='<%# Eval("infoSobre_viagens_Apresenta") %>'>
                                    <asp:Label ID="infoSobre_viagens_LabelLabel" runat="server" 
                                        CssClass="tituloEmp" Text='<%# Bind("infoSobre_viagens_Label") %>' />
                                </td>
                                <td class="tableFormulario" runat="server" id="infoSobre_viagensTD2" visible='<%# Eval("infoSobre_viagens_Apresenta") %>'>
                                    <asp:Label ID="infoSobre_viagensLabel" runat="server" 
                                        Text='<%# Bind("infoSobre_viagens") %>' />
                                </td>
                            </tr>
                        </table>
                        <br />
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSourcePreviewVaga" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    DeleteCommand="DELETE FROM [_tbVagaAnuncio] WHERE [idVagaAnuncio] = @idVagaAnuncio" 
                    InsertCommand="INSERT INTO [_tbVagaAnuncio] ([Protocolo], [FormacaoAcademica_Label], [FormacaoAcademica], [FormacaoAcademica_Apresenta], [dsPerfilVaga_Label], [dsPerfilVaga], [dsPerfilVaga_Apresenta], [Cargo_Label], [Cargo], [Cargo_Apresenta], [nrovaga_Label], [nrovaga], [nrovaga_Apresenta], [nmresponsavel_Label], [nmresponsavel], [nmresponsavel_Apresenta], [TipoOportunidade_Label], [TipoOportunidade], [TipoOportunidade_Apresenta], [QualificacaoHabilidadesEspecificas_Label], [QualificacaoHabilidadesEspecificas], [QualificacaoHabilidadesEspecificas_Apresenta], [Remuneracao_Label], [Remuneracao], [Remuneracao_Apresenta], [RemuneracaoVariavel_Label], [RemuneracaoVariavel], [RemuneracaoVariavel_Apresenta], [Honorario_Label], [Honorario], [Honorario_Apresenta], [LocalTrabalho_Label], [LocalTrabalho], [LocalTrabalho_Apresenta], [ObsComplementares_Label], [ObsComplementares], [ObsComplementares_Apresenta], [Beneficios_Label], [Beneficios], [Beneficios_Apresenta], [Perspectiva_Label], [Perspectiva], [Perspectiva_Apresenta], [FaixaEtariaInicio_Label], [FaixaEtariaInicio], [FaixaEtariaInicio_Apresenta], [FaixaEtariaFim_Label], [FaixaEtariaFim], [FaixaEtariaFim_Apresenta], [Sexo_Label], [Sexo], [Sexo_Apresenta], [ConhecimentoIdioma_Label], [ConhecimentoIdioma], [ConhecimentoIdioma_Apresenta], [PerfilComposicaoEquipe_Label], [PerfilComposicaoEquipe], [PerfilComposicaoEquipe_Apresenta], [PerfilGestor_Label], [PerfilGestor], [PerfilGestor_Apresenta], [CursoEspecifico_Label], [CursoEspecifico], [CursoEspecifico_Apresenta], [Conhecimento_Label], [Conhecimento], [Conhecimento_Apresenta], [ConhecimentoInformatica_Label], [ConhecimentoInformatica], [ConhecimentoInformatica_Apresenta], [CompetenciaComportamental_Label], [CompetenciaComportamental], [CompetenciaComportamental_Apresenta], [CompetenciaProfissional_Label], [CompetenciaProfissional], [CompetenciaProfissional_Apresenta], [AspectoCritico_Label], [AspectoCritico], [AspectoCritico_Apresenta], [PrincipalDesafio_Label], [PrincipalDesafio], [PrincipalDesafio_Apresenta], [RelacionamentoInterno_Label], [RelacionamentoInterno], [RelacionamentoInterno_Apresenta], [RelacionamentoExterno_Label], [RelacionamentoExterno], [RelacionamentoExterno_Apresenta], [infoSobre_viagens_Label], [infoSobre_viagens], [infoSobre_viagens_Apresenta], [confidencial_Label], [confidencial], [confidencial_Apresenta]) VALUES (@Protocolo, @FormacaoAcademica_Label, @FormacaoAcademica, @FormacaoAcademica_Apresenta, @dsPerfilVaga_Label, @dsPerfilVaga, @dsPerfilVaga_Apresenta, @Cargo_Label, @Cargo, @Cargo_Apresenta, @nrovaga_Label, @nrovaga, @nrovaga_Apresenta, @nmresponsavel_Label, @nmresponsavel, @nmresponsavel_Apresenta, @TipoOportunidade_Label, @TipoOportunidade, @TipoOportunidade_Apresenta, @QualificacaoHabilidadesEspecificas_Label, @QualificacaoHabilidadesEspecificas, @QualificacaoHabilidadesEspecificas_Apresenta, @Remuneracao_Label, @Remuneracao, @Remuneracao_Apresenta, @RemuneracaoVariavel_Label, @RemuneracaoVariavel, @RemuneracaoVariavel_Apresenta, @Honorario_Label, @Honorario, @Honorario_Apresenta, @LocalTrabalho_Label, @LocalTrabalho, @LocalTrabalho_Apresenta, @ObsComplementares_Label, @ObsComplementares, @ObsComplementares_Apresenta, @Beneficios_Label, @Beneficios, @Beneficios_Apresenta, @Perspectiva_Label, @Perspectiva, @Perspectiva_Apresenta, @FaixaEtariaInicio_Label, @FaixaEtariaInicio, @FaixaEtariaInicio_Apresenta, @FaixaEtariaFim_Label, @FaixaEtariaFim, @FaixaEtariaFim_Apresenta, @Sexo_Label, @Sexo, @Sexo_Apresenta, @ConhecimentoIdioma_Label, @ConhecimentoIdioma, @ConhecimentoIdioma_Apresenta, @PerfilComposicaoEquipe_Label, @PerfilComposicaoEquipe, @PerfilComposicaoEquipe_Apresenta, @PerfilGestor_Label, @PerfilGestor, @PerfilGestor_Apresenta, @CursoEspecifico_Label, @CursoEspecifico, @CursoEspecifico_Apresenta, @Conhecimento_Label, @Conhecimento, @Conhecimento_Apresenta, @ConhecimentoInformatica_Label, @ConhecimentoInformatica, @ConhecimentoInformatica_Apresenta, @CompetenciaComportamental_Label, @CompetenciaComportamental, @CompetenciaComportamental_Apresenta, @CompetenciaProfissional_Label, @CompetenciaProfissional, @CompetenciaProfissional_Apresenta, @AspectoCritico_Label, @AspectoCritico, @AspectoCritico_Apresenta, @PrincipalDesafio_Label, @PrincipalDesafio, @PrincipalDesafio_Apresenta, @RelacionamentoInterno_Label, @RelacionamentoInterno, @RelacionamentoInterno_Apresenta, @RelacionamentoExterno_Label, @RelacionamentoExterno, @RelacionamentoExterno_Apresenta, @infoSobre_viagens_Label, @infoSobre_viagens, @infoSobre_viagens_Apresenta, @confidencial_Label, @confidencial, @confidencial_Apresenta)" 
                    SelectCommand="SELECT [idVagaAnuncio], [Protocolo], [FormacaoAcademica_Label], [FormacaoAcademica], [FormacaoAcademica_Apresenta], [dsPerfilVaga_Label], [dsPerfilVaga], [dsPerfilVaga_Apresenta], [Cargo_Label], [Cargo], [Cargo_Apresenta], [nrovaga_Label], [nrovaga], [nrovaga_Apresenta], [nmresponsavel_Label], [nmresponsavel], [nmresponsavel_Apresenta], [TipoOportunidade_Label], [TipoOportunidade], [TipoOportunidade_Apresenta], [QualificacaoHabilidadesEspecificas_Label], [QualificacaoHabilidadesEspecificas], [QualificacaoHabilidadesEspecificas_Apresenta], [Remuneracao_Label], [Remuneracao], [Remuneracao_Apresenta], [RemuneracaoVariavel_Label], [RemuneracaoVariavel], [RemuneracaoVariavel_Apresenta], [Honorario_Label], [Honorario], [Honorario_Apresenta], [LocalTrabalho_Label], [LocalTrabalho], [LocalTrabalho_Apresenta], [ObsComplementares_Label], [ObsComplementares], [ObsComplementares_Apresenta], [Beneficios_Label], [Beneficios], [Beneficios_Apresenta], [Perspectiva_Label], [Perspectiva], [Perspectiva_Apresenta], [FaixaEtariaInicio_Label], [FaixaEtariaInicio], [FaixaEtariaInicio_Apresenta], [FaixaEtariaFim_Label], [FaixaEtariaFim], [FaixaEtariaFim_Apresenta], [Sexo_Label], [Sexo], [Sexo_Apresenta], [ConhecimentoIdioma_Label], [ConhecimentoIdioma], [ConhecimentoIdioma_Apresenta], [PerfilComposicaoEquipe_Label], [PerfilComposicaoEquipe], [PerfilComposicaoEquipe_Apresenta], [PerfilGestor_Label], [PerfilGestor], [PerfilGestor_Apresenta], [CursoEspecifico_Label], [CursoEspecifico], [CursoEspecifico_Apresenta], [Conhecimento_Label], [Conhecimento], [Conhecimento_Apresenta], [ConhecimentoInformatica_Label], [ConhecimentoInformatica], [ConhecimentoInformatica_Apresenta], [CompetenciaComportamental_Label], [CompetenciaComportamental], [CompetenciaComportamental_Apresenta], [CompetenciaProfissional_Label], [CompetenciaProfissional], [CompetenciaProfissional_Apresenta], [AspectoCritico_Label], [AspectoCritico], [AspectoCritico_Apresenta], [PrincipalDesafio_Label], [PrincipalDesafio], [PrincipalDesafio_Apresenta], [RelacionamentoInterno_Label], [RelacionamentoInterno], [RelacionamentoInterno_Apresenta], [RelacionamentoExterno_Label], [RelacionamentoExterno], [RelacionamentoExterno_Apresenta], [infoSobre_viagens_Label], [infoSobre_viagens], [infoSobre_viagens_Apresenta], [confidencial_Label], [confidencial], [confidencial_Apresenta] FROM [_tbVagaAnuncio] WHERE ([Protocolo] = @Protocolo)" 
                    UpdateCommand="UPDATE [_tbVagaAnuncio] SET [Protocolo] = @Protocolo, [FormacaoAcademica_Label] = @FormacaoAcademica_Label, [FormacaoAcademica] = @FormacaoAcademica, [FormacaoAcademica_Apresenta] = @FormacaoAcademica_Apresenta, [dsPerfilVaga_Label] = @dsPerfilVaga_Label, [dsPerfilVaga] = @dsPerfilVaga, [dsPerfilVaga_Apresenta] = @dsPerfilVaga_Apresenta, [Cargo_Label] = @Cargo_Label, [Cargo] = @Cargo, [Cargo_Apresenta] = @Cargo_Apresenta, [nrovaga_Label] = @nrovaga_Label, [nrovaga] = @nrovaga, [nrovaga_Apresenta] = @nrovaga_Apresenta, [nmresponsavel_Label] = @nmresponsavel_Label, [nmresponsavel] = @nmresponsavel, [nmresponsavel_Apresenta] = @nmresponsavel_Apresenta, [TipoOportunidade_Label] = @TipoOportunidade_Label, [TipoOportunidade] = @TipoOportunidade, [TipoOportunidade_Apresenta] = @TipoOportunidade_Apresenta, [QualificacaoHabilidadesEspecificas_Label] = @QualificacaoHabilidadesEspecificas_Label, [QualificacaoHabilidadesEspecificas] = @QualificacaoHabilidadesEspecificas, [QualificacaoHabilidadesEspecificas_Apresenta] = @QualificacaoHabilidadesEspecificas_Apresenta, [Remuneracao_Label] = @Remuneracao_Label, [Remuneracao] = @Remuneracao, [Remuneracao_Apresenta] = @Remuneracao_Apresenta, [RemuneracaoVariavel_Label] = @RemuneracaoVariavel_Label, [RemuneracaoVariavel] = @RemuneracaoVariavel, [RemuneracaoVariavel_Apresenta] = @RemuneracaoVariavel_Apresenta, [Honorario_Label] = @Honorario_Label, [Honorario] = @Honorario, [Honorario_Apresenta] = @Honorario_Apresenta, [LocalTrabalho_Label] = @LocalTrabalho_Label, [LocalTrabalho] = @LocalTrabalho, [LocalTrabalho_Apresenta] = @LocalTrabalho_Apresenta, [ObsComplementares_Label] = @ObsComplementares_Label, [ObsComplementares] = @ObsComplementares, [ObsComplementares_Apresenta] = @ObsComplementares_Apresenta, [Beneficios_Label] = @Beneficios_Label, [Beneficios] = @Beneficios, [Beneficios_Apresenta] = @Beneficios_Apresenta, [Perspectiva_Label] = @Perspectiva_Label, [Perspectiva] = @Perspectiva, [Perspectiva_Apresenta] = @Perspectiva_Apresenta, [FaixaEtariaInicio_Label] = @FaixaEtariaInicio_Label, [FaixaEtariaInicio] = @FaixaEtariaInicio, [FaixaEtariaInicio_Apresenta] = @FaixaEtariaInicio_Apresenta, [FaixaEtariaFim_Label] = @FaixaEtariaFim_Label, [FaixaEtariaFim] = @FaixaEtariaFim, [FaixaEtariaFim_Apresenta] = @FaixaEtariaFim_Apresenta, [Sexo_Label] = @Sexo_Label, [Sexo] = @Sexo, [Sexo_Apresenta] = @Sexo_Apresenta, [ConhecimentoIdioma_Label] = @ConhecimentoIdioma_Label, [ConhecimentoIdioma] = @ConhecimentoIdioma, [ConhecimentoIdioma_Apresenta] = @ConhecimentoIdioma_Apresenta, [PerfilComposicaoEquipe_Label] = @PerfilComposicaoEquipe_Label, [PerfilComposicaoEquipe] = @PerfilComposicaoEquipe, [PerfilComposicaoEquipe_Apresenta] = @PerfilComposicaoEquipe_Apresenta, [PerfilGestor_Label] = @PerfilGestor_Label, [PerfilGestor] = @PerfilGestor, [PerfilGestor_Apresenta] = @PerfilGestor_Apresenta, [CursoEspecifico_Label] = @CursoEspecifico_Label, [CursoEspecifico] = @CursoEspecifico, [CursoEspecifico_Apresenta] = @CursoEspecifico_Apresenta, [Conhecimento_Label] = @Conhecimento_Label, [Conhecimento] = @Conhecimento, [Conhecimento_Apresenta] = @Conhecimento_Apresenta, [ConhecimentoInformatica_Label] = @ConhecimentoInformatica_Label, [ConhecimentoInformatica] = @ConhecimentoInformatica, [ConhecimentoInformatica_Apresenta] = @ConhecimentoInformatica_Apresenta, [CompetenciaComportamental_Label] = @CompetenciaComportamental_Label, [CompetenciaComportamental] = @CompetenciaComportamental, [CompetenciaComportamental_Apresenta] = @CompetenciaComportamental_Apresenta, [CompetenciaProfissional_Label] = @CompetenciaProfissional_Label, [CompetenciaProfissional] = @CompetenciaProfissional, [CompetenciaProfissional_Apresenta] = @CompetenciaProfissional_Apresenta, [AspectoCritico_Label] = @AspectoCritico_Label, [AspectoCritico] = @AspectoCritico, [AspectoCritico_Apresenta] = @AspectoCritico_Apresenta, [PrincipalDesafio_Label] = @PrincipalDesafio_Label, [PrincipalDesafio] = @PrincipalDesafio, [PrincipalDesafio_Apresenta] = @PrincipalDesafio_Apresenta, [RelacionamentoInterno_Label] = @RelacionamentoInterno_Label, [RelacionamentoInterno] = @RelacionamentoInterno, [RelacionamentoInterno_Apresenta] = @RelacionamentoInterno_Apresenta, [RelacionamentoExterno_Label] = @RelacionamentoExterno_Label, [RelacionamentoExterno] = @RelacionamentoExterno, [RelacionamentoExterno_Apresenta] = @RelacionamentoExterno_Apresenta, [infoSobre_viagens_Label] = @infoSobre_viagens_Label, [infoSobre_viagens] = @infoSobre_viagens, [infoSobre_viagens_Apresenta] = @infoSobre_viagens_Apresenta, [confidencial_Label] = @confidencial_Label, [confidencial] = @confidencial, [confidencial_Apresenta] = @confidencial_Apresenta WHERE [idVagaAnuncio] = @idVagaAnuncio">
                    <DeleteParameters>
                        <asp:Parameter Name="idVagaAnuncio" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Protocolo" Type="String" />
                        <asp:Parameter Name="FormacaoAcademica_Label" Type="String" />
                        <asp:Parameter Name="FormacaoAcademica" Type="String" />
                        <asp:Parameter Name="FormacaoAcademica_Apresenta" Type="Int32" />
                        <asp:Parameter Name="dsPerfilVaga_Label" Type="String" />
                        <asp:Parameter Name="dsPerfilVaga" Type="String" />
                        <asp:Parameter Name="dsPerfilVaga_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Cargo_Label" Type="String" />
                        <asp:Parameter Name="Cargo" Type="String" />
                        <asp:Parameter Name="Cargo_Apresenta" Type="Int32" />
                        <asp:Parameter Name="nrovaga_Label" Type="String" />
                        <asp:Parameter Name="nrovaga" Type="Int32" />
                        <asp:Parameter Name="nrovaga_Apresenta" Type="Int32" />
                        <asp:Parameter Name="nmresponsavel_Label" Type="String" />
                        <asp:Parameter Name="nmresponsavel" Type="String" />
                        <asp:Parameter Name="nmresponsavel_Apresenta" Type="Int32" />
                        <asp:Parameter Name="TipoOportunidade_Label" Type="String" />
                        <asp:Parameter Name="TipoOportunidade" Type="String" />
                        <asp:Parameter Name="TipoOportunidade_Apresenta" Type="Int32" />
                        <asp:Parameter Name="QualificacaoHabilidadesEspecificas_Label" Type="String" />
                        <asp:Parameter Name="QualificacaoHabilidadesEspecificas" Type="String" />
                        <asp:Parameter Name="QualificacaoHabilidadesEspecificas_Apresenta" 
                            Type="Int32" />
                        <asp:Parameter Name="Remuneracao_Label" Type="String" />
                        <asp:Parameter Name="Remuneracao" Type="Decimal" />
                        <asp:Parameter Name="Remuneracao_Apresenta" Type="Int32" />
                        <asp:Parameter Name="RemuneracaoVariavel_Label" Type="String" />
                        <asp:Parameter Name="RemuneracaoVariavel" Type="Decimal" />
                        <asp:Parameter Name="RemuneracaoVariavel_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Honorario_Label" Type="String" />
                        <asp:Parameter Name="Honorario" Type="Decimal" />
                        <asp:Parameter Name="Honorario_Apresenta" Type="Int32" />
                        <asp:Parameter Name="LocalTrabalho_Label" Type="String" />
                        <asp:Parameter Name="LocalTrabalho" Type="String" />
                        <asp:Parameter Name="LocalTrabalho_Apresenta" Type="Int32" />
                        <asp:Parameter Name="ObsComplementares_Label" Type="String" />
                        <asp:Parameter Name="ObsComplementares" Type="String" />
                        <asp:Parameter Name="ObsComplementares_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Beneficios_Label" Type="String" />
                        <asp:Parameter Name="Beneficios" Type="String" />
                        <asp:Parameter Name="Beneficios_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Perspectiva_Label" Type="String" />
                        <asp:Parameter Name="Perspectiva" Type="String" />
                        <asp:Parameter Name="Perspectiva_Apresenta" Type="Int32" />
                        <asp:Parameter Name="FaixaEtariaInicio_Label" Type="String" />
                        <asp:Parameter Name="FaixaEtariaInicio" Type="Int32" />
                        <asp:Parameter Name="FaixaEtariaInicio_Apresenta" Type="Int32" />
                        <asp:Parameter Name="FaixaEtariaFim_Label" Type="String" />
                        <asp:Parameter Name="FaixaEtariaFim" Type="Int32" />
                        <asp:Parameter Name="FaixaEtariaFim_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Sexo_Label" Type="String" />
                        <asp:Parameter Name="Sexo" Type="String" />
                        <asp:Parameter Name="Sexo_Apresenta" Type="Int32" />
                        <asp:Parameter Name="ConhecimentoIdioma_Label" Type="String" />
                        <asp:Parameter Name="ConhecimentoIdioma" Type="String" />
                        <asp:Parameter Name="ConhecimentoIdioma_Apresenta" Type="Int32" />
                        <asp:Parameter Name="PerfilComposicaoEquipe_Label" Type="String" />
                        <asp:Parameter Name="PerfilComposicaoEquipe" Type="String" />
                        <asp:Parameter Name="PerfilComposicaoEquipe_Apresenta" Type="Int32" />
                        <asp:Parameter Name="PerfilGestor_Label" Type="String" />
                        <asp:Parameter Name="PerfilGestor" Type="String" />
                        <asp:Parameter Name="PerfilGestor_Apresenta" Type="Int32" />
                        <asp:Parameter Name="CursoEspecifico_Label" Type="String" />
                        <asp:Parameter Name="CursoEspecifico" Type="String" />
                        <asp:Parameter Name="CursoEspecifico_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Conhecimento_Label" Type="String" />
                        <asp:Parameter Name="Conhecimento" Type="String" />
                        <asp:Parameter Name="Conhecimento_Apresenta" Type="Int32" />
                        <asp:Parameter Name="ConhecimentoInformatica_Label" Type="String" />
                        <asp:Parameter Name="ConhecimentoInformatica" Type="String" />
                        <asp:Parameter Name="ConhecimentoInformatica_Apresenta" Type="Int32" />
                        <asp:Parameter Name="CompetenciaComportamental_Label" Type="String" />
                        <asp:Parameter Name="CompetenciaComportamental" Type="String" />
                        <asp:Parameter Name="CompetenciaComportamental_Apresenta" Type="Int32" />
                        <asp:Parameter Name="CompetenciaProfissional_Label" Type="String" />
                        <asp:Parameter Name="CompetenciaProfissional" Type="String" />
                        <asp:Parameter Name="CompetenciaProfissional_Apresenta" Type="Int32" />
                        <asp:Parameter Name="AspectoCritico_Label" Type="String" />
                        <asp:Parameter Name="AspectoCritico" Type="String" />
                        <asp:Parameter Name="AspectoCritico_Apresenta" Type="Int32" />
                        <asp:Parameter Name="PrincipalDesafio_Label" Type="String" />
                        <asp:Parameter Name="PrincipalDesafio" Type="String" />
                        <asp:Parameter Name="PrincipalDesafio_Apresenta" Type="Int32" />
                        <asp:Parameter Name="RelacionamentoInterno_Label" Type="String" />
                        <asp:Parameter Name="RelacionamentoInterno" Type="String" />
                        <asp:Parameter Name="RelacionamentoInterno_Apresenta" Type="Int32" />
                        <asp:Parameter Name="RelacionamentoExterno_Label" Type="String" />
                        <asp:Parameter Name="RelacionamentoExterno" Type="String" />
                        <asp:Parameter Name="RelacionamentoExterno_Apresenta" Type="Int32" />
                        <asp:Parameter Name="infoSobre_viagens_Label" Type="String" />
                        <asp:Parameter Name="infoSobre_viagens" Type="String" />
                        <asp:Parameter Name="infoSobre_viagens_Apresenta" Type="Int32" />
                        <asp:Parameter Name="confidencial_Label" Type="String" />
                        <asp:Parameter Name="confidencial" Type="Boolean" />
                        <asp:Parameter Name="confidencial_Apresenta" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Protocolo" QueryStringField="Protocolo" 
                            Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Protocolo" Type="String" />
                        <asp:Parameter Name="FormacaoAcademica_Label" Type="String" />
                        <asp:Parameter Name="FormacaoAcademica" Type="String" />
                        <asp:Parameter Name="FormacaoAcademica_Apresenta" Type="Int32" />
                        <asp:Parameter Name="dsPerfilVaga_Label" Type="String" />
                        <asp:Parameter Name="dsPerfilVaga" Type="String" />
                        <asp:Parameter Name="dsPerfilVaga_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Cargo_Label" Type="String" />
                        <asp:Parameter Name="Cargo" Type="String" />
                        <asp:Parameter Name="Cargo_Apresenta" Type="Int32" />
                        <asp:Parameter Name="nrovaga_Label" Type="String" />
                        <asp:Parameter Name="nrovaga" Type="Int32" />
                        <asp:Parameter Name="nrovaga_Apresenta" Type="Int32" />
                        <asp:Parameter Name="nmresponsavel_Label" Type="String" />
                        <asp:Parameter Name="nmresponsavel" Type="String" />
                        <asp:Parameter Name="nmresponsavel_Apresenta" Type="Int32" />
                        <asp:Parameter Name="TipoOportunidade_Label" Type="String" />
                        <asp:Parameter Name="TipoOportunidade" Type="String" />
                        <asp:Parameter Name="TipoOportunidade_Apresenta" Type="Int32" />
                        <asp:Parameter Name="QualificacaoHabilidadesEspecificas_Label" Type="String" />
                        <asp:Parameter Name="QualificacaoHabilidadesEspecificas" Type="String" />
                        <asp:Parameter Name="QualificacaoHabilidadesEspecificas_Apresenta" 
                            Type="Int32" />
                        <asp:Parameter Name="Remuneracao_Label" Type="String" />
                        <asp:Parameter Name="Remuneracao" Type="Decimal" />
                        <asp:Parameter Name="Remuneracao_Apresenta" Type="Int32" />
                        <asp:Parameter Name="RemuneracaoVariavel_Label" Type="String" />
                        <asp:Parameter Name="RemuneracaoVariavel" Type="Decimal" />
                        <asp:Parameter Name="RemuneracaoVariavel_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Honorario_Label" Type="String" />
                        <asp:Parameter Name="Honorario" Type="Decimal" />
                        <asp:Parameter Name="Honorario_Apresenta" Type="Int32" />
                        <asp:Parameter Name="LocalTrabalho_Label" Type="String" />
                        <asp:Parameter Name="LocalTrabalho" Type="String" />
                        <asp:Parameter Name="LocalTrabalho_Apresenta" Type="Int32" />
                        <asp:Parameter Name="ObsComplementares_Label" Type="String" />
                        <asp:Parameter Name="ObsComplementares" Type="String" />
                        <asp:Parameter Name="ObsComplementares_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Beneficios_Label" Type="String" />
                        <asp:Parameter Name="Beneficios" Type="String" />
                        <asp:Parameter Name="Beneficios_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Perspectiva_Label" Type="String" />
                        <asp:Parameter Name="Perspectiva" Type="String" />
                        <asp:Parameter Name="Perspectiva_Apresenta" Type="Int32" />
                        <asp:Parameter Name="FaixaEtariaInicio_Label" Type="String" />
                        <asp:Parameter Name="FaixaEtariaInicio" Type="Int32" />
                        <asp:Parameter Name="FaixaEtariaInicio_Apresenta" Type="Int32" />
                        <asp:Parameter Name="FaixaEtariaFim_Label" Type="String" />
                        <asp:Parameter Name="FaixaEtariaFim" Type="Int32" />
                        <asp:Parameter Name="FaixaEtariaFim_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Sexo_Label" Type="String" />
                        <asp:Parameter Name="Sexo" Type="String" />
                        <asp:Parameter Name="Sexo_Apresenta" Type="Int32" />
                        <asp:Parameter Name="ConhecimentoIdioma_Label" Type="String" />
                        <asp:Parameter Name="ConhecimentoIdioma" Type="String" />
                        <asp:Parameter Name="ConhecimentoIdioma_Apresenta" Type="Int32" />
                        <asp:Parameter Name="PerfilComposicaoEquipe_Label" Type="String" />
                        <asp:Parameter Name="PerfilComposicaoEquipe" Type="String" />
                        <asp:Parameter Name="PerfilComposicaoEquipe_Apresenta" Type="Int32" />
                        <asp:Parameter Name="PerfilGestor_Label" Type="String" />
                        <asp:Parameter Name="PerfilGestor" Type="String" />
                        <asp:Parameter Name="PerfilGestor_Apresenta" Type="Int32" />
                        <asp:Parameter Name="CursoEspecifico_Label" Type="String" />
                        <asp:Parameter Name="CursoEspecifico" Type="String" />
                        <asp:Parameter Name="CursoEspecifico_Apresenta" Type="Int32" />
                        <asp:Parameter Name="Conhecimento_Label" Type="String" />
                        <asp:Parameter Name="Conhecimento" Type="String" />
                        <asp:Parameter Name="Conhecimento_Apresenta" Type="Int32" />
                        <asp:Parameter Name="ConhecimentoInformatica_Label" Type="String" />
                        <asp:Parameter Name="ConhecimentoInformatica" Type="String" />
                        <asp:Parameter Name="ConhecimentoInformatica_Apresenta" Type="Int32" />
                        <asp:Parameter Name="CompetenciaComportamental_Label" Type="String" />
                        <asp:Parameter Name="CompetenciaComportamental" Type="String" />
                        <asp:Parameter Name="CompetenciaComportamental_Apresenta" Type="Int32" />
                        <asp:Parameter Name="CompetenciaProfissional_Label" Type="String" />
                        <asp:Parameter Name="CompetenciaProfissional" Type="String" />
                        <asp:Parameter Name="CompetenciaProfissional_Apresenta" Type="Int32" />
                        <asp:Parameter Name="AspectoCritico_Label" Type="String" />
                        <asp:Parameter Name="AspectoCritico" Type="String" />
                        <asp:Parameter Name="AspectoCritico_Apresenta" Type="Int32" />
                        <asp:Parameter Name="PrincipalDesafio_Label" Type="String" />
                        <asp:Parameter Name="PrincipalDesafio" Type="String" />
                        <asp:Parameter Name="PrincipalDesafio_Apresenta" Type="Int32" />
                        <asp:Parameter Name="RelacionamentoInterno_Label" Type="String" />
                        <asp:Parameter Name="RelacionamentoInterno" Type="String" />
                        <asp:Parameter Name="RelacionamentoInterno_Apresenta" Type="Int32" />
                        <asp:Parameter Name="RelacionamentoExterno_Label" Type="String" />
                        <asp:Parameter Name="RelacionamentoExterno" Type="String" />
                        <asp:Parameter Name="RelacionamentoExterno_Apresenta" Type="Int32" />
                        <asp:Parameter Name="infoSobre_viagens_Label" Type="String" />
                        <asp:Parameter Name="infoSobre_viagens" Type="String" />
                        <asp:Parameter Name="infoSobre_viagens_Apresenta" Type="Int32" />
                        <asp:Parameter Name="confidencial_Label" Type="String" />
                        <asp:Parameter Name="confidencial" Type="Boolean" />
                        <asp:Parameter Name="confidencial_Apresenta" Type="Int32" />
                        <asp:Parameter Name="idVagaAnuncio" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

