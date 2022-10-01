<%@ Page Language="VB" MasterPageFile="~/_candidato/CandidatoPageJobClick.master" AutoEventWireup="false" CodeFile="cursos.aspx.vb" Inherits="_candidato_cursos" title="Jobclick" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up"} });
        });
	</script>
    <table class="TituloBG" align="center">
        <tr>
            <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Cabec" runat="server" Text="Cursos Complementares" CssClass="TituloBGText"></asp:Label>
                <asp:Label ID="idCursoExtraCurricularLabel" runat="server" Visible="False"></asp:Label>
            </td>
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
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                    CellPadding="0" DataKeyNames="idCursoExtraCurricular" DataSourceID="SqlDataSource1"
                    GridLines="None" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="idCursoExtraCurricular" HeaderText="idCursoExtraCurricular"
                            InsertVisible="False" ReadOnly="True" SortExpression="idCursoExtraCurricular"
                            Visible="False" />
                        <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" SortExpression="idcurriculo"
                            Visible="False" />
                        <asp:BoundField DataField="Instituicao" HeaderText="Instituicao" SortExpression="Instituicao"
                            Visible="False" />
                        <asp:ButtonField CommandName="Select" DataTextField="Instituicao" 
                            Text="Button" />
                        <asp:HyperLinkField DataNavigateUrlFields="idCursoExtraCurricular" DataNavigateUrlFormatString="cursos.aspx?idCursoExtraCurricular={0}"
                            DataTextField="Instituicao" HeaderText="Institui&#231;&#227;o" 
                            Visible="False" />
                        <asp:BoundField DataField="dsCurso" HeaderText="dsCurso" SortExpression="dsCurso"
                            Visible="False" />
                        <asp:BoundField DataField="obsCurso" HeaderText="obsCurso" SortExpression="obsCurso"
                            Visible="False" />
                        <asp:BoundField DataField="data_ini" HeaderText="data_ini" SortExpression="data_ini"
                            Visible="False" />
                        <asp:BoundField DataField="data_fim" HeaderText="data_fim" SortExpression="data_fim"
                            Visible="False" />
                        <asp:CheckBoxField DataField="concluido" HeaderText="Conclu&#237;do" SortExpression="concluido">
                            <ItemStyle Width="100px" />
                        </asp:CheckBoxField>
                    </Columns>
                    <EmptyDataTemplate>
                        Nesse item entram cursos que realmente agregaram valor à sua formação e que sejam
                        interessantes à empresa em que você está querendo trabalhar.&nbsp;<br />
                        <br />
                        <b>O que não fazer:</b><br />Listar cursos relâmpagos, sabe aquele curso de 
                        administração de tempo que você fez?
                        <br />
                        Ele pode ter muito mais efeito sobre o recrutador se for mencionado na entrevista.
                        <br />
                        <br />
                        No currículo, dá a impressão de que você está fazendo qualquer negócio para 
                        valorizar seu passe.
                        <br />
                        O mesmo vale para alguns cursos de imersão em inglês que costumam durar apenas 
                        um fim de semana.&nbsp;
                    </EmptyDataTemplate>
                    <HeaderStyle BackColor="WhiteSmoke" HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="WhiteSmoke" />
                </asp:GridView>
                <asp:Label ID="msn" runat="server" CssClass="msn"></asp:Label><br />
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="idCursoExtraCurricular"
                    DataSourceID="SqlDataSource2" DefaultMode="Edit" Width="100%">
                    <EditItemTemplate>
                        Instituicao:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="InstituicaoTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>&nbsp;
                        <asp:TextBox ID="idcurriculoTextBox" runat="server" Text='<%# Bind("idcurriculo") %>'
                            Visible="False" Width="32px"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3"
                            DataTextField="idcurriculo" DataValueField="idcurriculo" SelectedValue='<%# Bind("idcurriculo") %>'
                            Visible="False">
                        </asp:DropDownList><br />
                        <asp:TextBox ID="InstituicaoTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                            Text='<%# Bind("Instituicao") %>' Width="100%"></asp:TextBox><br />
                        Descrição do curso:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="dsCursoTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="dsCursoTextBox" runat="server" 
                            CssClass="InputCadFormCandidatoCV" Height="56px"
                            Text='<%# Bind("dsCurso") %>' TextMode="MultiLine" MaxLength="200" 
                            Width="100%"></asp:TextBox><br />
                        Observação sobre o curso:<asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            runat="server" ControlToValidate="obsCursoTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="obsCursoTextBox" runat="server" 
                            CssClass="InputCadFormCandidatoCV" Height="56px"
                            Text='<%# Bind("obsCurso") %>' TextMode="MultiLine" Width="100%"></asp:TextBox><br />
                        Data do início do curso:<asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                            runat="server" ControlToValidate="data_iniTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1" runat="server" ControlToValidate="data_iniTextBox"
                                Display="Dynamic" ErrorMessage="* Formato (dd/mm/yyyy)" SetFocusOnError="True"
                                ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|[1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
                        <cc1:CalendarExtender id="CalendarExtender1" runat="server" Format="dd/M/yyyy" 
                            TargetControlID="data_iniTextBox" DefaultView="Years">
                        </cc1:CalendarExtender>
                        <br />
                        <asp:TextBox ID="data_iniTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                            Text='<%# Bind("data_ini", "{0:d}") %>' Width="100%"></asp:TextBox><br />
                        Data do início do término do curso:<asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                            runat="server" ControlToValidate="data_fimTextBox" Display="Dynamic" ErrorMessage="*"
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="data_fimTextBox"
                            Display="Dynamic" ErrorMessage="* Formato (dd/mm/yyyy)" SetFocusOnError="True"
                            ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|[1-9]|1[012])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
                        <cc1:CalendarExtender id="CalendarExtender2" runat="server" Format="dd/M/yyyy" 
                            TargetControlID="data_fimTextBox" DefaultView="Years">
                        </cc1:CalendarExtender>
                        <br />
                        <asp:TextBox ID="data_fimTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                            Text='<%# Bind("data_fim", "{0:d}") %>' Width="100%"></asp:TextBox><br />
                        <br />
                        <asp:CheckBox ID="concluidoCheckBox" runat="server" Checked='<%# Bind("concluido") %>'
                            Text="Curso concluído" /><br />
                        <br />
                        <asp:LinkButton ID="LinkButtonSALVAR" runat="server" CommandName="Update" 
                            CssClass="button" ToolTip="Faça suas alterações e clique aqui para salvar">Salvar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonEXCLUIR" runat="server" CausesValidation="False" 
                            CommandName="Delete" CssClass="button" 
                            
                            onclientclick="return confirm(&quot;Você irá excluir este curso de seu currículo atual.\nVocê está certo disso?&quot;)" 
                            ToolTip="Clique aqui para excluir o registro deste formulário">Excluir</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CausesValidation="False" 
                            CommandName="Cancel" CssClass="button" onclick="VaPara" 
                            ToolTip="Clique aqui para cancelar">Cancelar</asp:LinkButton>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <br />
                        <table ID="BtCurso" align="center" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td align="left">
                                    <asp:LinkButton ID="ImageButtonINCLUIR" runat="server" CausesValidation="False" 
                                        CommandName="New" CssClass="button" 
                                        ToolTip="Clique aqui para cadastrar seus cursos complementares">Informar cursos complementares</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonMP" runat="server" CausesValidation="False" 
                                        CssClass="button" PostBackUrl="~/_candidato/Default.aspx" 
                                        ToolTip="Clique aqui para voltar ao menu principal">Menu Principal</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        Instituicao:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="InstituicaoTextBox" Display="Dynamic" 
                            ErrorMessage="* Informe qual empresa ou instituição" SetFocusOnError="True">•</asp:RequiredFieldValidator>&nbsp;
                        <asp:TextBox ID="idcurriculoTextBox" runat="server" Text='<%# Bind("idcurriculo") %>'
                            Visible="False" Width="32px"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3"
                            DataTextField="idcurriculo" DataValueField="idcurriculo" SelectedValue='<%# Bind("idcurriculo") %>'
                            Visible="False">
                        </asp:DropDownList><br />
                        <asp:TextBox ID="InstituicaoTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                            Text='<%# Bind("Instituicao") %>' Width="100%"></asp:TextBox><br />
                        Descrição do curso:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="dsCursoTextBox" Display="Dynamic" 
                            ErrorMessage="* Descreva o curso" SetFocusOnError="True">•</asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="dsCursoTextBox" runat="server" 
                            CssClass="InputCadFormCandidatoCV" Height="56px"
                            Text='<%# Bind("dsCurso") %>' TextMode="MultiLine" MaxLength="200" 
                            Width="100%"></asp:TextBox><br />
                        Observação sobre o curso:<asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            runat="server" ControlToValidate="obsCursoTextBox" Display="Dynamic" ErrorMessage="* Escreva alguma observação sobre o curso"
                            SetFocusOnError="True">•</asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="obsCursoTextBox" runat="server" 
                            CssClass="InputCadFormCandidatoCV" Height="56px"
                            Text='<%# Bind("obsCurso") %>' TextMode="MultiLine" Width="100%"></asp:TextBox><br />
                        Data do início do curso:<asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                            runat="server" ControlToValidate="data_iniTextBox" Display="Dynamic" ErrorMessage="* Data de início é obrigatória"
                            SetFocusOnError="True">•</asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1" runat="server" ControlToValidate="data_iniTextBox"
                                Display="Dynamic" ErrorMessage="* Formato (dd/mm/yyyy)" SetFocusOnError="True"
                                ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|[1-9]|1[012])[- /.](19|20)\d\d">•</asp:RegularExpressionValidator>
                        <cc1:CalendarExtender id="CalendarExtender1" runat="server" Format="dd/M/yyyy" 
                            TargetControlID="data_iniTextBox" DefaultView="Years">
                        </cc1:CalendarExtender>
                        <br />
                        <asp:TextBox ID="data_iniTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                            Text='<%# Bind("data_ini", "{0:d}") %>' Width="100%"></asp:TextBox><br />
                        Data do início do término do curso: (Se ainda não finalizou, informe dê uma 
                        previsão)<asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                            runat="server" ControlToValidate="data_fimTextBox" Display="Dynamic" ErrorMessage="* Data de encerramento é obrigatória (Informe uma previsão de encerramento)"
                            SetFocusOnError="True">•</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="data_fimTextBox"
                            Display="Dynamic" ErrorMessage="* Formato (dd/mm/yyyy)" SetFocusOnError="True"
                            ValidationExpression="(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|[1-9]|1[012])[- /.](19|20)\d\d">•</asp:RegularExpressionValidator>
                        <cc1:CalendarExtender id="CalendarExtender2" runat="server" Format="dd/M/yyyy" 
                            TargetControlID="data_fimTextBox" DefaultView="Years">
                        </cc1:CalendarExtender>
                        <br />
                        <asp:TextBox ID="data_fimTextBox" runat="server" CssClass="InputCadFormCandidatoCV" 
                            Text='<%# Bind("data_fim", "{0:d}") %>' Width="100%"></asp:TextBox><br />
                        <br />
                        <asp:CheckBox ID="concluidoCheckBox" runat="server" Checked='<%# Bind("concluido") %>'
                            Text="Curso concluído" /><br />
                        <br />
                        <asp:LinkButton ID="LinkButtonSalvar" runat="server" CommandName="Insert" 
                            CssClass="button" 
                            ToolTip="Preencha o formulário e clique aqui para salvar.">Salvar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonCANCELAR" runat="server" CausesValidation="False" 
                            CommandName="Cancel" CssClass="button" ToolTip="Clique aqui para cancelar">Cancelar</asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonMP" runat="server" CausesValidation="False" 
                            CssClass="button" PostBackUrl="~/_candidato/Default.aspx" 
                            ToolTip="Voltar ao menu principal">Menu Principal</asp:LinkButton>
                        <br />
                        <asp:ValidationSummary ID="ValidationSummaryINSERT" runat="server" 
                            ShowMessageBox="True" ShowSummary="False" />
                    </InsertItemTemplate>
                </asp:FormView>
            </td> 
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idCursoExtraCurricular], [idcurriculo], [Instituicao], [dsCurso], [obsCurso], [data_ini], [data_fim], [concluido] FROM [tbCursoExtraCurricular] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" SessionField="idcurriculo"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbCursoExtraCurricular] WHERE [idCursoExtraCurricular] = @idCursoExtraCurricular"
        InsertCommand="INSERT INTO [tbCursoExtraCurricular] ([idcurriculo], [Instituicao], [dsCurso], [obsCurso], [data_ini], [data_fim], [concluido]) VALUES (@idcurriculo, @Instituicao, @dsCurso, @obsCurso, @data_ini, @data_fim, @concluido)"
        SelectCommand="SELECT [idCursoExtraCurricular], [idcurriculo], [Instituicao], [dsCurso], [obsCurso], [data_ini], [data_fim], [concluido] FROM [tbCursoExtraCurricular] WHERE ([idCursoExtraCurricular] = @idCursoExtraCurricular)"
        UpdateCommand="UPDATE [tbCursoExtraCurricular] SET [idcurriculo] = @idcurriculo, [Instituicao] = @Instituicao, [dsCurso] = @dsCurso, [obsCurso] = @obsCurso, [data_ini] = @data_ini, [data_fim] = @data_fim, [concluido] = @concluido WHERE [idCursoExtraCurricular] = @idCursoExtraCurricular">
        <DeleteParameters>
            <asp:Parameter Name="idCursoExtraCurricular" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="Instituicao" Type="String" />
            <asp:Parameter Name="dsCurso" Type="String" />
            <asp:Parameter Name="obsCurso" Type="String" />
            <asp:Parameter Name="data_ini" Type="DateTime" />
            <asp:Parameter Name="data_fim" Type="DateTime" />
            <asp:Parameter Name="concluido" Type="Boolean" />
            <asp:Parameter Name="idCursoExtraCurricular" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="idCursoExtraCurricularLabel" DefaultValue="0" 
                Name="idCursoExtraCurricular" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idcurriculo" Type="Int32" />
            <asp:Parameter Name="Instituicao" Type="String" />
            <asp:Parameter Name="dsCurso" Type="String" />
            <asp:Parameter Name="obsCurso" Type="String" />
            <asp:Parameter Name="data_ini" Type="DateTime" />
            <asp:Parameter Name="data_fim" Type="DateTime" />
            <asp:Parameter Name="concluido" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idcurriculo], [idCadastroUser] FROM [tbCurriculo] WHERE ([idcurriculo] = @idcurriculo)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idcurriculo" SessionField="idcurriculo"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

