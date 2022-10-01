<%@ Page Title="" Language="VB" MaintainScrollPositionOnPostback="true" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="competenciaProfissional.aspx.vb" Inherits="_candidato_competenciaProfissional" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up"} });
        });
	</script>
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Cabec" runat="server" 
                    Text="Competência Profissional / Realizações / Objetivos" 
                    CssClass="TituloBGText"></asp:Label></td>
        </tr>
    </table>
                <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_candidato/images/buttonOK.png" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABEL" runat="server" CssClass="msnOK"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>  
    <table width="720px" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td width="30px">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="690px" align="left">
                <asp:Label ID="idObjetivoProfissionalLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idRealizacaoProfissionalLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idHabilidadeCompetenciaLabel0" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idHabilidadeCompetenciaLabel1" runat="server" Visible="False"></asp:Label>
                <br />
                <asp:Label ID="LabelInfo" runat="server" 
                    
                    
                    Text="&lt;b&gt;Informação importante:&lt;/b&gt;&lt;br&gt;No modelo de competências importa não só a posse dos saberes disciplinares escolares ou técnico-profissionais, mas a capacidade de mobilizá-los para resolver problemas e enfrentar os imprevistos na situação de trabalho. Os componentes não organizados da formação, como as qualificações tácitas ou sociais e a subjetividade do trabalhador, assumem extrema relevância. O modelo das competências remete, assim, às características individuais dos trabalhadores."></asp:Label>
                <br />
                <asp:Label ID="msn" runat="server" CssClass="msn"></asp:Label>
                <br />
                <table id="linha0" bgcolor="#CCCCCC" cellpadding="0" cellspacing="0" 
                    width="100%">
                    <tr>
                        <td>
                            <asp:Image ID="ImageSep0" runat="server" ImageUrl="~/images/1px.gif" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:FormView ID="FormViewObjetivoProfissional" runat="server" DataKeyNames="idCandidatoObjetivo" 
                    DataSourceID="SqlObjetivoCandidato" Width="100%">
                    <EditItemTemplate>
                        <asp:Label ID="idObjetivoProfissionalLabel" runat="server" Visible="False" 
                            Text='<%# Eval("idObjetivoProfissional") %>'></asp:Label>
                        <asp:Label ID="ObjetivoProf" runat="server" 
                            
                            Text='Informe abaixo uma das opções que mais se aproxima de seu objetivo profissional:' />
                        <br />
                        <asp:GridView ID="GridViewObjetivo" runat="server" AutoGenerateColumns="False" 
                            BorderStyle="None" CellPadding="4" CssClass="textoGeral" 
                            DataKeyNames="idObjetivoProfissional" DataSourceID="SqlObjetivo" 
                            GridLines="Horizontal" onrowdatabound="GridViewObjetivo_RowDataBound" 
                            onselectedindexchanged="GridViewObjetivo_SelectedIndexChanged" 
                            ShowHeader="False" Width="100%">
                            <AlternatingRowStyle BackColor="#F0F0F0" BorderStyle="None" />
                            <Columns>
                                <asp:TemplateField HeaderText="idObjetivoProfissional" InsertVisible="False" 
                                    SortExpression="idObjetivoProfissional">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" 
                                            Text='<%# Eval("idObjetivoProfissional") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="idObjetivoProfissionalLabel" runat="server" 
                                            Text='<%# Bind("idObjetivoProfissional") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButtonSelect" runat="server" CausesValidation="false" 
                                            CommandName="Select" ImageUrl="~/images/candidato/RADIOBUTTON_OFF.png" 
                                            Text="Selecionar" />
                                    </ItemTemplate>
                                    <ItemStyle VerticalAlign="Top" Width="13px" />
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                            CommandName="Select" Text='<%# Eval("ObjetivoProfissional") %>' 
                                            ToolTip='<%# Eval("ObjetivoProfissional") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ObjetivoProfissional" 
                                    HeaderText="ObjetivoProfissional" SortExpression="ObjetivoProfissional" 
                                    Visible="False" />
                            </Columns>
                        </asp:GridView>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Comentário:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="ComentarioTextBox" 
                            ErrorMessage="Campo obrigatório (Comentários)">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ComentarioTextBox" runat="server" 
                            Text='<%# Bind("Comentario") %>' CssClass="InputCad" Height="50px" 
                            TextMode="MultiLine" Width="100%" />
                        <br />
                        <br />
                        <asp:LinkButton ID="LinkButtonSALVAR" runat="server" CommandName="Update" 
                            CssClass="button">Salvar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CausesValidation="False" 
                            CommandName="Cancel" CssClass="button">Cancelar</asp:LinkButton>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <asp:LinkButton ID="LinkButtonOBJETIVO" runat="server" CommandName="New" 
                            CssClass="button">Objetivo Profissional</asp:LinkButton>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <asp:Label ID="ObjetivoProf" runat="server" 
                            
                            Text="Informe abaixo uma das opções que mais se aproxima de seu objetivo profissional:"></asp:Label>
                        <br />
                        <asp:GridView ID="GridViewObjetivo" runat="server" AutoGenerateColumns="False" 
                            BorderStyle="None" CellPadding="4" CssClass="textoGeral" 
                            DataKeyNames="idObjetivoProfissional" DataSourceID="SqlObjetivo" 
                            GridLines="Horizontal" onrowdatabound="GridViewObjetivo_RowDataBound" 
                            onselectedindexchanged="GridViewObjetivo_SelectedIndexChanged" 
                            ShowHeader="False" Width="100%">
                            <AlternatingRowStyle BackColor="#F0F0F0" BorderStyle="None" />
                            <Columns>
                                <asp:TemplateField HeaderText="idObjetivoProfissional" InsertVisible="False" 
                                    SortExpression="idObjetivoProfissional">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" 
                                            Text='<%# Eval("idObjetivoProfissional") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="idObjetivoProfissionalLabel" runat="server" 
                                            Text='<%# Bind("idObjetivoProfissional") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButtonSelect" runat="server" CausesValidation="false" 
                                            CommandName="Select" ImageUrl="~/images/candidato/RADIOBUTTON_OFF.png" 
                                            Text="Selecionar" />
                                    </ItemTemplate>
                                    <ItemStyle VerticalAlign="Top" Width="13px" />
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                            CommandName="Select" Text='<%# Eval("ObjetivoProfissional") %>' 
                                            ToolTip='<%# Eval("ObjetivoProfissional") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ObjetivoProfissional" 
                                    HeaderText="ObjetivoProfissional" SortExpression="ObjetivoProfissional" 
                                    Visible="False" />
                            </Columns>
                        </asp:GridView>
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Comentário:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="ComentarioTextBox" 
                            ErrorMessage="Campo obrigatório (Comentários)">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ComentarioTextBox" runat="server" 
                            CssClass="InputCad" Height="50px" 
                            Text='<%# Bind("Comentario") %>' TextMode="MultiLine" Width="100%" />
                        <br />
                        <br />
                        <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Insert" 
                            CssClass="button">Salvar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CausesValidation="False" 
                            CommandName="Cancel" CssClass="button">Cancelar</asp:LinkButton>
                        <br />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="idObjetivoProfissionalLabel" runat="server" 
                            Text='<%# Eval("idObjetivoProfissional") %>' Visible="False"></asp:Label>
                        <asp:Label ID="dsObjetivoLabel" runat="server" CssClass="tituloEmpresa" 
                            Text="Objetivo informado por você:"></asp:Label>
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text='<%# Eval("ObjetivoProfissional") %>' 
                            ToolTip="Clique aqui para editar seus objetivos profissionais." />
                        <br />
                        <br />
                        <asp:Label ID="seucomentarioLabel" runat="server" CssClass="tituloEmpresa" 
                            Text="Seus comentários:"></asp:Label>
                        <br />
                        <asp:Label ID="ComentarioLabel" runat="server" 
                            Text='<%# Bind("Comentario") %>' />
                        &nbsp;&nbsp;
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <table id="linha" bgcolor="#CCCCCC" cellpadding="0" cellspacing="0" 
                    width="100%">
                    <tr>
                        <td>
                            <asp:Image ID="ImageSep" runat="server" ImageUrl="~/images/1px.gif" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:FormView ID="FormViewRealizacao" runat="server" 
                    DataKeyNames="idCandidatoRealizacaoProfissional" 
                    DataSourceID="SqlRealizacaoCandidato" Width="100%">
                    <EditItemTemplate>
                        <asp:Label ID="idRealizacaoProfissionalLabel" runat="server" 
                            Text='<%# Eval("idRealizacaoProfissional") %>' Visible="False"></asp:Label>
                        <asp:Label ID="ObjetivoProf" runat="server" 
                            Text="Informe abaixo uma das opções que mais se aproxima de sua realização profissional:" />
                        <br />
                        <asp:GridView ID="GridViewRealizacao" runat="server" 
                            AutoGenerateColumns="False" BorderStyle="None" CellPadding="4" 
                            CssClass="textoGeral" DataKeyNames="idRealizacaoProfissional" 
                            DataSourceID="SqlRealizacaoProfissional" GridLines="Horizontal" 
                            onrowdatabound="GridViewRealizacao_RowDataBound" 
                            onselectedindexchanged="GridViewRealizacao_SelectedIndexChanged" 
                            ShowHeader="False" Width="100%">
                            <AlternatingRowStyle BackColor="#F0F0F0" BorderStyle="None" />
                            <Columns>
                                <asp:TemplateField HeaderText="idRealizacaoProfissional" InsertVisible="False" 
                                    SortExpression="idRealizacaoProfissional">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label3" runat="server" 
                                            Text='<%# Eval("idRealizacaoProfissional") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="idRealizacaoProfissionalLabel" runat="server" 
                                            Text='<%# Bind("idRealizacaoProfissional") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButtonSelectRealizacao" runat="server" 
                                            CausesValidation="false" CommandName="Select" 
                                            ImageUrl="~/images/candidato/RADIOBUTTON_OFF.png" 
                                            Text='<%# Eval("RealizacaoProfissional") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="13px" />
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                            CommandName="Select" Text='<%# Eval("RealizacaoProfissional") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="RealizacaoProfissional" 
                                    HeaderText="RealizacaoProfissional" SortExpression="RealizacaoProfissional" 
                                    Visible="False" />
                            </Columns>
                        </asp:GridView>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Comentário:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="ComentarioTextBox" 
                            ErrorMessage="Campo obrigatório (Comentários)">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ComentarioTextBox" runat="server" 
                            Text='<%# Bind("Comentario") %>' CssClass="InputCad" Height="50px" 
                            TextMode="MultiLine" Width="100%" />
                        <br />
                        <br />
                        <asp:LinkButton ID="LinkButtonSALVAR" runat="server" CommandName="Update" 
                            CssClass="button">Salvar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton7" runat="server" CausesValidation="False" 
                            CommandName="Cancel" CssClass="button">Cancelar</asp:LinkButton>
                        <br />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandName="New" 
                            CssClass="button">Realizações Profissionais</asp:LinkButton>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <asp:Label ID="ObjetivoProf" runat="server" 
                            Text="Informe abaixo uma das opções que mais se aproxima de suas realizações profissional:"></asp:Label>
                        <br />
                        <asp:GridView ID="GridViewRealizacao" runat="server" 
                            AutoGenerateColumns="False" BorderStyle="None" CellPadding="4" 
                            CssClass="textoGeral" DataKeyNames="idRealizacaoProfissional" 
                            DataSourceID="SqlRealizacaoProfissional" GridLines="Horizontal" 
                            onrowdatabound="GridViewRealizacao_RowDataBound" 
                            onselectedindexchanged="GridViewRealizacao_SelectedIndexChanged" 
                            ShowHeader="False" Width="100%">
                            <AlternatingRowStyle BackColor="#F0F0F0" BorderStyle="None" />
                            <Columns>
                                <asp:TemplateField HeaderText="idRealizacaoProfissional" InsertVisible="False" 
                                    SortExpression="idRealizacaoProfissional">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label2" runat="server" 
                                            Text='<%# Eval("idRealizacaoProfissional") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="idRealizacaoProfissionalLabel" runat="server" 
                                            Text='<%# Bind("idRealizacaoProfissional") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButtonSelectRealizacao" runat="server" 
                                            CausesValidation="false" CommandName="Select" 
                                            ImageUrl="~/images/candidato/RADIOBUTTON_OFF.png" 
                                            Text='<%# Eval("RealizacaoProfissional") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="13px" />
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                                            CommandName="Select" Text='<%# Eval("RealizacaoProfissional") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="RealizacaoProfissional" 
                                    HeaderText="RealizacaoProfissional" 
                                    SortExpression="RealizacaoProfissional" Visible="False" />
                            </Columns>
                        </asp:GridView>
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Comentário:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="ComentarioTextBox" 
                            ErrorMessage="Campo obrigatório (Comentários)">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ComentarioTextBox" runat="server" CssClass="InputCad" 
                            Height="50px" Text='<%# Bind("Comentario") %>' TextMode="MultiLine" 
                            Width="100%" />
                        <br />
                        <br />
                        <asp:LinkButton ID="LinkButtonSALVAR" runat="server" CommandName="Insert" 
                            CssClass="button">Salvar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CausesValidation="False" 
                            CommandName="Cancel" CssClass="button">Cancelar</asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="idRealizacaoProfissionalLabel" runat="server" 
                            Text='<%# Eval("idRealizacaoProfissional") %>' Visible="False"></asp:Label>
                        <br />
                        <asp:Label ID="dsObjetivoLabel" runat="server" CssClass="tituloEmpresa" 
                            Text="Realização Profissional informada por você:"></asp:Label>
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text='<%# Eval("RealizacaoProfissional") %>' 
                            ToolTip="Clique aqui para editar suas realizações profissionais." />
                        <br />
                        <br />
                        <asp:Label ID="seucomentarioLabel" runat="server" CssClass="tituloEmpresa" 
                            Text="Seus comentários:"></asp:Label>
                        <br />
                        <asp:Label ID="ComentarioLabel" runat="server" 
                            Text='<%# Bind("Comentario") %>' />
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <table id="linha1" bgcolor="#CCCCCC" cellpadding="0" cellspacing="0" 
                    width="100%">
                    <tr>
                        <td>
                            <asp:Image ID="ImageSep1" runat="server" ImageUrl="~/images/1px.gif" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:FormView ID="FormViewHabilidade" runat="server" 
                    DataKeyNames="idCandidatoHabilidadeCompetencia" 
                    DataSourceID="SqlHabilidadeCandidato" Width="100%">
                    <EditItemTemplate>
                        <asp:Label ID="ObjetivoProf" runat="server" 
                            Text="Informe abaixo 2 (duas) das opções que mais se aproximam de suas Competências e Habilidades profissionais:"></asp:Label>
                        &nbsp;<asp:GridView ID="GridViewHabilidade" runat="server" 
                            AutoGenerateColumns="False" BorderStyle="None" CellPadding="4" 
                            DataKeyNames="idHabilidadeCompetencia" DataSourceID="SqlHabilidade" 
                            GridLines="Horizontal" onrowdatabound="GridViewHabilidade_RowDataBound" 
                            onselectedindexchanged="GridViewHabilidade_SelectedIndexChanged" 
                            ShowHeader="False" Width="100%">
                            <AlternatingRowStyle BackColor="#F0F0F0" BorderStyle="None" />
                            <Columns>
                                <asp:TemplateField HeaderText="idHabilidadeCompetencia" InsertVisible="False" 
                                    SortExpression="idHabilidadeCompetencia">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" 
                                            Text='<%# Eval("idHabilidadeCompetencia") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="idHabilidadeCompetenciaLabel" runat="server" 
                                            Text='<%# Bind("idHabilidadeCompetencia") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButtonHabilidade0" runat="server" 
                                            CausesValidation="false" CommandName="Select" 
                                            ImageUrl="~/images/candidato/CHECKBOX_OFF.png" Text="Button" />
                                        <asp:ImageButton ID="ImageButtonHabilidade1" runat="server" 
                                            CausesValidation="false" CommandName="Select" 
                                            ImageUrl="~/images/candidato/CHECKBOX_ON.png" Text="Button" />
                                        <asp:ImageButton ID="ImageButtonHabilidade2" runat="server" 
                                            CausesValidation="false" CommandName="Select" 
                                            ImageUrl="~/images/candidato/CHECKBOX_2.png" Text="Button" Visible="False" />
                                        <asp:ImageButton ID="ImageButtonHabilidade3" runat="server" 
                                            CausesValidation="false" CommandName="Select" 
                                            ImageUrl="~/images/candidato/CHECKBOX_1.png" Text="Button" Visible="False" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width="13px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="idHabilidadeCompetencia_Pai" 
                                    HeaderText="idHabilidadeCompetencia_Pai" 
                                    SortExpression="idHabilidadeCompetencia_Pai" Visible="False" />
                                <asp:BoundField DataField="idHabilidadeCompetencia_Filha" 
                                    HeaderText="idHabilidadeCompetencia_Filha" 
                                    SortExpression="idHabilidadeCompetencia_Filha" Visible="False" />
                                <asp:BoundField DataField="HabilidadeCompetencia" 
                                    HeaderText="HabilidadeCompetencia" SortExpression="HabilidadeCompetencia" 
                                    Visible="False">
                                <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="dsHabilidadeCompetencia" 
                                    HeaderText="dsHabilidadeCompetencia" SortExpression="dsHabilidadeCompetencia" 
                                    Visible="False" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                            CommandName="Select" Text='<%# Eval("HabilidadeCompetencia") %>'></asp:LinkButton>
                                        <asp:HoverMenuExtender ID="LinkButton1_HoverMenuExtender" runat="server" 
                                            DynamicServicePath="" Enabled="True" OffsetX="150" OffsetY="-10" PopDelay="5" 
                                            PopupControlID="ApresentaDados" TargetControlID="LinkButton1">
                                        </asp:HoverMenuExtender>
                                        <asp:Panel ID="ApresentaDados" runat="server" BackColor="Ivory" Width="250px">
                                            <table ID="TableDetalhe0" cellpadding="5" cellspacing="5" width="100%">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Titulo" runat="server" CssClass="textBold" 
                                                            Text='<%# Eval("HabilidadeCompetencia") %>'></asp:Label>
                                                        <br />
                                                        <br />
                                                        <asp:Label ID="DetalhesLabel" runat="server" 
                                                            Text='<%# Eval("dsHabilidadeCompetencia") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br />
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Comentário:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="ComentarioTextBox" 
                            ErrorMessage="Campo obrigatório (Comentários)">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ComentarioTextBox" runat="server" CssClass="InputCad" 
                            Height="50px" Text='<%# Bind("Comentario") %>' TextMode="MultiLine" 
                            Width="100%" />
                        <br />
                        <br />
                        <asp:LinkButton ID="LinkButtonSALVAR" runat="server" CommandName="Update" 
                            CssClass="button">Salvar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CausesValidation="False" 
                            CommandName="Cancel" CssClass="button">Cancelar</asp:LinkButton>
                        <br />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <asp:LinkButton ID="LinkButtonCOMPETENCIA" runat="server" CommandName="New" 
                            CssClass="button"> Competência e Habilidades</asp:LinkButton>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <asp:Label ID="ObjetivoProf" runat="server" 
                            Text="Informe abaixo 2 (duas) das opções que mais se aproximam de suas Competências e Habilidades profissionais:"></asp:Label>
                        &nbsp;<asp:GridView ID="GridViewHabilidade" runat="server" 
                            AutoGenerateColumns="False" BorderStyle="None" CellPadding="4" 
                            DataKeyNames="idHabilidadeCompetencia" DataSourceID="SqlHabilidade" 
                            GridLines="Horizontal" ShowHeader="False" Width="100%" 
                            onrowdatabound="GridViewHabilidade_RowDataBound" 
                            onselectedindexchanged="GridViewHabilidade_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="#F0F0F0" BorderStyle="None" />
                            <Columns>
                                <asp:TemplateField HeaderText="idHabilidadeCompetencia" InsertVisible="False" 
                                    SortExpression="idHabilidadeCompetencia">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" 
                                            Text='<%# Eval("idHabilidadeCompetencia") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="idHabilidadeCompetenciaLabel" runat="server" 
                                            Text='<%# Bind("idHabilidadeCompetencia") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButtonHabilidade0" runat="server" 
                                            CausesValidation="false" CommandName="Select" 
                                            ImageUrl="~/images/candidato/CHECKBOX_OFF.png" Text="Button" />
                                        <asp:ImageButton ID="ImageButtonHabilidade1" runat="server" 
                                            CausesValidation="false" CommandName="Select" 
                                            ImageUrl="~/images/candidato/CHECKBOX_ON.png" Text="Button" />
                                        <asp:ImageButton ID="ImageButtonHabilidade2" runat="server" 
                                            CausesValidation="false" CommandName="Select" 
                                            ImageUrl="~/images/candidato/CHECKBOX_2.png" Text="Button" Visible="False" />
                                        <asp:ImageButton ID="ImageButtonHabilidade3" runat="server" 
                                            CausesValidation="false" CommandName="Select" 
                                            ImageUrl="~/images/candidato/CHECKBOX_1.png" Text="Button" Visible="False" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width="13px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="idHabilidadeCompetencia_Pai" 
                                    HeaderText="idHabilidadeCompetencia_Pai" 
                                    SortExpression="idHabilidadeCompetencia_Pai" Visible="False" />
                                <asp:BoundField DataField="idHabilidadeCompetencia_Filha" 
                                    HeaderText="idHabilidadeCompetencia_Filha" 
                                    SortExpression="idHabilidadeCompetencia_Filha" Visible="False" />
                                <asp:BoundField DataField="HabilidadeCompetencia" 
                                    HeaderText="HabilidadeCompetencia" SortExpression="HabilidadeCompetencia" 
                                    Visible="False">
                                <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="dsHabilidadeCompetencia" 
                                    HeaderText="dsHabilidadeCompetencia" SortExpression="dsHabilidadeCompetencia" 
                                    Visible="False" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                            CommandName="Select" Text='<%# Eval("HabilidadeCompetencia") %>'></asp:LinkButton>
                                        <asp:HoverMenuExtender ID="LinkButton1_HoverMenuExtender" runat="server" 
                                            DynamicServicePath="" Enabled="True" PopupControlID="ApresentaDados" 
                                            TargetControlID="LinkButton1" OffsetX="150" OffsetY="-10" PopDelay="5">
                                        </asp:HoverMenuExtender>
                                        <asp:Panel ID="ApresentaDados" runat="server" BackColor="Ivory" Width="250px">
                                            <table ID="TableDetalhe" cellpadding="5" cellspacing="5" width="100%">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Titulo" runat="server" CssClass="textBold" 
                                                            Text='<%# Eval("HabilidadeCompetencia") %>'></asp:Label>
                                                        <br />
                                                        <br />
                                                        <asp:Label ID="DetalhesLabel" runat="server" 
                                                            Text='<%# Eval("dsHabilidadeCompetencia") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Comentário:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="ComentarioTextBox" 
                            ErrorMessage="Campo obrigatório (Comentários)">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ComentarioTextBox" runat="server" CssClass="InputCad" 
                            Height="50px" Text='<%# Bind("Comentario") %>' TextMode="MultiLine" 
                            Width="100%" />
                        <br />
                        <br />
                        <asp:LinkButton ID="LinkButtonSALVAR" runat="server" CommandName="Insert" 
                            CssClass="button">Salvar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CausesValidation="False" 
                            CommandName="Cancel" CssClass="button">Cancelar</asp:LinkButton>
                        <br />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="idHabilidadeCompetenciaFORM2" runat="server" 
                            Text='<%# Eval("idHabilidadeCompetencia2") %>' Visible="False"></asp:Label>
                        <asp:Label ID="idHabilidadeCompetenciaFORM1" runat="server" 
                            Text='<%# Eval("idHabilidadeCompetencia1") %>' Visible="False"></asp:Label>
                        <asp:Label ID="dsObjetivoLabel" runat="server" CssClass="tituloEmpresa" 
                            Text="Competência e Habilidade Profissional informada por você:"></asp:Label>
                        <br />
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit" 
                            Text='<%# Eval("HabilidadeCompetencia1") %>' 
                            ToolTip="Clique aqui para editar suas competências e habilidades profissionais."></asp:LinkButton>
                        <br />
                        <asp:Label ID="LabelDS1" runat="server" Font-Italic="True" 
                            Text='<%# Eval("dsHabilidadeCompetencia1") %>'></asp:Label>
                        <br />
                        <br />
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Edit" 
                            Text='<%# Eval("HabilidadeCompetencia2") %>' 
                            ToolTip="Clique aqui para editar suas competências e habilidades profissionais."></asp:LinkButton>
                        <br />
                        <asp:Label ID="LabelDS2" runat="server" Font-Italic="True" 
                            Text='<%# Eval("dsHabilidadeCompetencia2") %>'></asp:Label>
                        <br />
&nbsp;
                        <br />
                        <asp:Label ID="seucomentarioLabel" runat="server" CssClass="tituloEmpresa" 
                            Text="Seus comentários:"></asp:Label>
                        <br />
                        <asp:Label ID="ComentarioLabel" runat="server" 
                            Text='<%# Bind("Comentario") %>' />
                        <br />

                    </ItemTemplate>
                </asp:FormView>
                <br />
                <table id="linha2" bgcolor="#CCCCCC" cellpadding="0" cellspacing="0" 
                    width="100%">
                    <tr>
                        <td>
                            <asp:Image ID="ImageSep2" runat="server" ImageUrl="~/images/1px.gif" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:LinkButton ID="LinkButtonMP" runat="server" CausesValidation="False" 
                    CssClass="button" PostBackUrl="~/_candidato/Default.aspx">Menu Principal</asp:LinkButton>
                <br />
                <br />
                <asp:FormView ID="FormViewCompetencia" runat="server" CellPadding="0" DataKeyNames="idCartaApresentacao"
                    DataSourceID="SqlCartaApresentacao" DefaultMode="Edit" Width="100%" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:Label ID="LabelApresentacaopessoal" runat="server" 
                            
                            Text="&lt;b&gt;A primeira impressão sempre é a que fica.&lt;/b&gt;&lt;br&gt;Portanto, tenha atenção redobrada para o vocabulário e o tom que você vai adotar no texto."></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="apresentacaoTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="apresentacaoTextBox" runat="server" CssClass="InputCad" Height="100px"
                            Text='<%# Bind("apresentacao") %>' TextMode="MultiLine" Width="100%"></asp:TextBox><br />
                        <br />
                        <asp:Label ID="LabelAutoAvaliacao" runat="server" 
                            Text="Auto-Avaliação (Profissional):"></asp:Label>
                        <br />
                        <asp:TextBox ID="resumogeralTextBox" runat="server" CssClass="InputCad" Height="100px"
                            Text='<%# Bind("resumogeral") %>' TextMode="MultiLine" Width="100%"></asp:TextBox><br />
                        <br />
                        <br />
                        <br />
                        <asp:ImageButton ID="ImageButtonUpdate" runat="server" CommandName="Update" 
                            ImageUrl="~/images/candidato/buttonSALVAR.png" />
                        &nbsp;<asp:ImageButton ID="ImageButtonVoltar" runat="server" 
                            ImageUrl="~/images/candidato/buttonVOLTAR.png" 
                            PostBackUrl="~/_candidato/Default.aspx" CausesValidation="False" />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table ID="ConteudoObjetivo" runat="server" cellpadding="0" cellspacing="0" 
                            width="100%">
                            <tr>
                                <td align="center">
                                    <asp:ImageButton ID="ImageButtonNew" runat="server" CausesValidation="False" 
                                        CommandName="New" ImageUrl="~/images/layoutNew/btObjetivo.png" 
                                        onload="ImageButtonNew_Load" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <asp:Label ID="LabelConteudo" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <asp:Label ID="LabelApresentacaopessoal" runat="server" 
                            
                            Text="&lt;b&gt;A primeira impressão sempre é a que fica.&lt;/b&gt;&lt;br&gt;Portanto, tenha atenção redobrada para o vocabulário e o tom que você vai adotar no texto."></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="apresentacaoTextBox" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="apresentacaoTextBox0" runat="server" CssClass="InputCad" Height="100px"
                            Text='<%# Bind("apresentacao") %>' TextMode="MultiLine" Width="100%"></asp:TextBox><br />
                        <br />
                        <asp:Label ID="LabelAutoAvaliacao0" runat="server" 
                            Text="Auto-Avaliação (Profissional):"></asp:Label>
                        <br />
                        <asp:TextBox ID="resumogeralTextBox0" runat="server" CssClass="InputCad" Height="100px"
                            Text='<%# Bind("resumogeral") %>' TextMode="MultiLine" Width="100%"></asp:TextBox><br />
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Incluir minha apresentação e objetivo"></asp:LinkButton>
                        |
                        <asp:LinkButton runat="server" CausesValidation="False"
                            Text="Voltar ao Menu Principal" PostBackUrl="~/_candidato/Default.aspx"></asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="apresentacaoLabel" runat="server" Text='<%# Bind("apresentacao") %>'></asp:Label><br />
                        <br />
                        <asp:Label ID="resumogeralLabel" runat="server" Text='<%# Bind("resumogeral") %>'></asp:Label>
                        <br />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit"></asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete"></asp:LinkButton>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New"></asp:LinkButton>
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <asp:SqlDataSource ID="SqlRealizacaoCandidato" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    DeleteCommand="DELETE FROM [tbCandidatoRealizacaoProfissional] WHERE [idCandidatoRealizacaoProfissional] = @idCandidatoRealizacaoProfissional" 
                    InsertCommand="INSERT INTO [tbCandidatoRealizacaoProfissional] ([idcurriculo], [idRealizacaoProfissional], [Comentario]) VALUES (@idcurriculo, @idRealizacaoProfissional, @Comentario)" 
                    SelectCommand="SELECT tbCandidatoRealizacaoProfissional.idCandidatoRealizacaoProfissional, tbCandidatoRealizacaoProfissional.idcurriculo, tbCandidatoRealizacaoProfissional.idRealizacaoProfissional, tbCandidatoRealizacaoProfissional.Comentario, tbRealizacaoProfissional.RealizacaoProfissional FROM tbCandidatoRealizacaoProfissional INNER JOIN tbRealizacaoProfissional ON tbCandidatoRealizacaoProfissional.idRealizacaoProfissional = tbRealizacaoProfissional.idRealizacaoProfissional WHERE (tbCandidatoRealizacaoProfissional.idcurriculo = @idcurriculo)" 
                    
                    UpdateCommand="UPDATE [tbCandidatoRealizacaoProfissional] SET [idcurriculo] = @idcurriculo, [idRealizacaoProfissional] = @idRealizacaoProfissional, [Comentario] = @Comentario WHERE [idCandidatoRealizacaoProfissional] = @idCandidatoRealizacaoProfissional">
                    <DeleteParameters>
                        <asp:Parameter Name="idCandidatoRealizacaoProfissional" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idcurriculo" Type="Int32" />
                        <asp:Parameter Name="idRealizacaoProfissional" Type="Int32" />
                        <asp:Parameter Name="Comentario" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="idcurriculo" SessionField="idCurriculo" 
                            Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idcurriculo" Type="Int32" />
                        <asp:Parameter Name="idRealizacaoProfissional" Type="Int32" />
                        <asp:Parameter Name="Comentario" Type="String" />
                        <asp:Parameter Name="idCandidatoRealizacaoProfissional" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlObjetivoCandidato" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    DeleteCommand="DELETE FROM [tbCandidatoObjetivoProfissional] WHERE [idCandidatoObjetivo] = @idCandidatoObjetivo" 
                    InsertCommand="INSERT INTO [tbCandidatoObjetivoProfissional] ([idcurriculo], [idObjetivoProfissional], [Comentario]) VALUES (@idcurriculo, @idObjetivoProfissional, @Comentario)" 
                    SelectCommand="SELECT tbCandidatoObjetivoProfissional.idCandidatoObjetivo, tbCandidatoObjetivoProfissional.idcurriculo, tbCandidatoObjetivoProfissional.idObjetivoProfissional, tbCandidatoObjetivoProfissional.Comentario, tbObjetivoProfissional.ObjetivoProfissional FROM tbCandidatoObjetivoProfissional INNER JOIN tbObjetivoProfissional ON tbCandidatoObjetivoProfissional.idObjetivoProfissional = tbObjetivoProfissional.idObjetivoProfissional WHERE (tbCandidatoObjetivoProfissional.idcurriculo = @idcurriculo)" 
                    
                    UpdateCommand="UPDATE [tbCandidatoObjetivoProfissional] SET [idcurriculo] = @idcurriculo, [idObjetivoProfissional] = @idObjetivoProfissional, [Comentario] = @Comentario WHERE [idCandidatoObjetivo] = @idCandidatoObjetivo">
                    <DeleteParameters>
                        <asp:Parameter Name="idCandidatoObjetivo" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idcurriculo" Type="Int32" />
                        <asp:Parameter Name="idObjetivoProfissional" Type="Int32" />
                        <asp:Parameter Name="Comentario" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="idcurriculo" SessionField="idCurriculo" 
                            Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idcurriculo" Type="Int32" />
                        <asp:Parameter Name="idObjetivoProfissional" Type="Int32" />
                        <asp:Parameter Name="Comentario" Type="String" />
                        <asp:Parameter Name="idCandidatoObjetivo" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlHabilidadeCandidato" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    
                    SelectCommand="SELECT tbCandidatoHabilidadeCompetencia.idCandidatoHabilidadeCompetencia, tbCandidatoHabilidadeCompetencia.idcurriculo, tbCandidatoHabilidadeCompetencia.idHabilidadeCompetencia1, tbCandidatoHabilidadeCompetencia.idHabilidadeCompetencia2, tbCandidatoHabilidadeCompetencia.Comentario, tbHabilidadeCompetencia.HabilidadeCompetencia AS HabilidadeCompetencia1, tbHabilidadeCompetencia_1.HabilidadeCompetencia AS HabilidadeCompetencia2, tbHabilidadeCompetencia_1.dsHabilidadeCompetencia AS dsHabilidadeCompetencia1, tbHabilidadeCompetencia.dsHabilidadeCompetencia AS dsHabilidadeCompetencia2 FROM tbCandidatoHabilidadeCompetencia INNER JOIN tbHabilidadeCompetencia ON tbCandidatoHabilidadeCompetencia.idHabilidadeCompetencia1 = tbHabilidadeCompetencia.idHabilidadeCompetencia INNER JOIN tbHabilidadeCompetencia AS tbHabilidadeCompetencia_1 ON tbCandidatoHabilidadeCompetencia.idHabilidadeCompetencia2 = tbHabilidadeCompetencia_1.idHabilidadeCompetencia WHERE (tbCandidatoHabilidadeCompetencia.idcurriculo = @idcurriculo)" 
                    DeleteCommand="DELETE FROM [tbCandidatoHabilidadeCompetencia] WHERE [idCandidatoHabilidadeCompetencia] = @idCandidatoHabilidadeCompetencia" 
                    InsertCommand="INSERT INTO [tbCandidatoHabilidadeCompetencia] ([idcurriculo], [idHabilidadeCompetencia1], [idHabilidadeCompetencia2], [Comentario]) VALUES (@idcurriculo, @idHabilidadeCompetencia1, @idHabilidadeCompetencia2, @Comentario)" 
                    
                    UpdateCommand="UPDATE [tbCandidatoHabilidadeCompetencia] SET [idcurriculo] = @idcurriculo, [idHabilidadeCompetencia1] = @idHabilidadeCompetencia1, [idHabilidadeCompetencia2] = @idHabilidadeCompetencia2, [Comentario] = @Comentario WHERE [idCandidatoHabilidadeCompetencia] = @idCandidatoHabilidadeCompetencia">
                    <DeleteParameters>
                        <asp:Parameter Name="idCandidatoHabilidadeCompetencia" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idcurriculo" Type="Int32" />
                        <asp:Parameter Name="idHabilidadeCompetencia1" Type="Int32" />
                        <asp:Parameter Name="idHabilidadeCompetencia2" Type="Int32" />
                        <asp:Parameter Name="Comentario" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="idcurriculo" SessionField="idCurriculo" 
                            Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idcurriculo" Type="Int32" />
                        <asp:Parameter Name="idHabilidadeCompetencia1" Type="Int32" />
                        <asp:Parameter Name="idHabilidadeCompetencia2" Type="Int32" />
                        <asp:Parameter Name="Comentario" Type="String" />
                        <asp:Parameter Name="idCandidatoHabilidadeCompetencia" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlCartaApresentacao" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    DeleteCommand="DELETE FROM [tbCartaApresentacao] WHERE [idCartaApresentacao] = @idCartaApresentacao" 
                    InsertCommand="INSERT INTO [tbCartaApresentacao] ([idcurriculo], [apresentacao], [resumogeral]) VALUES (@idcurriculo, @apresentacao, @resumogeral)" 
                    SelectCommand="SELECT [idCartaApresentacao], [idcurriculo], [apresentacao], [resumogeral] FROM [tbCartaApresentacao] WHERE ([idcurriculo] = @idcurriculo)" 
                    UpdateCommand="UPDATE [tbCartaApresentacao] SET [idcurriculo] = @idcurriculo, [apresentacao] = @apresentacao, [resumogeral] = @resumogeral WHERE [idCartaApresentacao] = @idCartaApresentacao">
                    <DeleteParameters>
                        <asp:Parameter Name="idCartaApresentacao" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idcurriculo" Type="Int32" />
                        <asp:Parameter Name="apresentacao" Type="String" />
                        <asp:Parameter Name="resumogeral" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="idcurriculo" SessionField="idCurriculo" 
                            Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idcurriculo" Type="Int32" />
                        <asp:Parameter Name="apresentacao" Type="String" />
                        <asp:Parameter Name="resumogeral" Type="String" />
                        <asp:Parameter Name="idCartaApresentacao" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlObjetivo" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="SELECT [idObjetivoProfissional], [ObjetivoProfissional] FROM [tbObjetivoProfissional]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlRealizacaoProfissional" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="SELECT [idRealizacaoProfissional], [RealizacaoProfissional] FROM [tbRealizacaoProfissional]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlHabilidade" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_LISTA_COMPETENCIA" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="idHabilidadeCompetencia" Type="Int32" />
                        <asp:Parameter DefaultValue="0" Name="idHabilidadeCompetencia_Pai" 
                            Type="Int32" />
                        <asp:Parameter DefaultValue="0" Name="idHabilidadeCompetencia_Filha" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

