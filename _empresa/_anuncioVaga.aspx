<%@ Page Title="" Language="VB" MasterPageFile="~/_empresa/EmpresaPage.master" AutoEventWireup="false" CodeFile="_anuncioVaga.aspx.vb" Inherits="_empresa_anuncioVaga" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26"></td>
                <td width="614"><asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
                                        <asp:Label ID="ResPSQLabel" runat="server" CssClass="tituloEmp"></asp:Label>
                <asp:Label ID="iddsempresaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idfuncaoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="dsfuncaoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idvagaLabel" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="ProtocoloLabel" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <table width="640" cellpadding="0" cellspacing="0">
            <tr>
                <td width="26">
                    <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" />
                </td>
                <td width="614">
                <asp:Label ID="LabelPS2" runat="server" 
                    Text="Selecione uma empresa:" CssClass="titulo"></asp:Label>
                    <br />
                <asp:DropDownList ID="DropDownListEmpresa" runat="server" AutoPostBack="True" 
                    CssClass="DropCad" DataSourceID="SqlEmpresa" DataTextField="nmempresa" 
                    DataValueField="idCadastroEmpresa">
                </asp:DropDownList>
                    <br />
                    <asp:Label ID="NomeEmpresaLabel" runat="server"></asp:Label>
                    <br />
                    <br />
                <asp:Label ID="LabelPS1" runat="server" 
                    Text="Apresentações da empresa trabalhada" CssClass="titulo"></asp:Label>
                <asp:GridView ID="GridViewAnuncioApr" runat="server" 
                    AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="Dotted" 
                    BorderWidth="1px" DataKeyNames="iddsempresa" 
                    DataSourceID="SqlApresentacaoEmpresas" GridLines="Horizontal" Width="100%" 
                    AllowPaging="True" PageSize="5">
                    <AlternatingRowStyle BackColor="#EFEFEF" BorderStyle="None" />
                    <Columns>
                        <asp:BoundField DataField="iddsempresa" HeaderText="iddsempresa" 
                            InsertVisible="False" ReadOnly="True" SortExpression="iddsempresa" 
                            Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                            SortExpression="idCadastroEmpresa" Visible="False" />
                        <asp:BoundField DataField="idCadastroEmpresaFilha" 
                            HeaderText="idCadastroEmpresaFilha" SortExpression="idCadastroEmpresaFilha" 
                            Visible="False" />
                        <asp:ButtonField CommandName="Select" DataTextField="tituloDesEmpresa" 
                            Text="Button" />
                        <asp:BoundField DataField="tituloDesEmpresa" HeaderText="Apresentação" 
                            SortExpression="tituloDesEmpresa" Visible="False" />
                        <asp:BoundField DataField="dsempresaVaga" HeaderText="dsempresaVaga" 
                            SortExpression="dsempresaVaga" Visible="False" />
                        <asp:BoundField DataField="msnCandidato" HeaderText="msnCandidato" 
                            SortExpression="msnCandidato" Visible="False" />
                        <asp:BoundField DataField="msnCandidatoFim" HeaderText="msnCandidatoFim" 
                            SortExpression="msnCandidatoFim" Visible="False" />
                        <asp:BoundField DataField="nmempresa" HeaderText="Empresa" 
                            SortExpression="nmempresa" />
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Label ID="LabelAviso" runat="server" 
                            Text="Selecione uma empresa para listar as apresentações publicadas."></asp:Label>
                    </EmptyDataTemplate>
                </asp:GridView>
                    <br />
                <asp:FormView ID="FormViewApresentaAnuncio" runat="server" 
                    DataKeyNames="iddsempresa" DataSourceID="SqlApresentacaoEmpresasFORM" 
                    Width="100%">
                    <EditItemTemplate>
                        <br />
                        <asp:Label ID="LabelPS3" runat="server" CssClass="titulo" 
                            Text="Atuallizar Apresentação"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Esta Apresentação é da Empresa?" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="DropDownListEmpresa" ErrorMessage="Informe a Empresa">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:DropDownList ID="DropDownListEmpresa" runat="server" CssClass="DropCad" 
                            DataSourceID="SqlDataSourceListaEmpresa" DataTextField="nmempresa" 
                            DataValueField="idCadastroEmpresa" ondatabound="DropDownListEmpresa_DataBound" 
                            SelectedValue='<%# Bind("idCadastroEmpresaFilha") %>'>
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="titAprLabel" runat="server" Text="Título da Apresentação:" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="tituloDesEmpresaTextBox" ErrorMessage="Título é obrigatório">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="tituloDesEmpresaTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("tituloDesEmpresa") %>' />
                        <br />
                        <asp:Label ID="AprLabel" runat="server" Text="Apresentação no anúncio:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="dsempresaVagaTextBox" 
                            ErrorMessage="Apresentação é obrigatória">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="dsempresaVagaTextBox" runat="server" CssClass="InputCad" 
                            Height="150px" Text='<%# Bind("dsempresaVaga") %>' TextMode="MultiLine" />
                        <br />
                        <asp:Label ID="AprIniLabel" runat="server" 
                            Text="Mensagem ao Candidato que apresentar seu CV:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="msnCandidatoTextBox" 
                            ErrorMessage="Mensagem ao candidato é obrigatória">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="msnCandidatoTextBox" runat="server" CssClass="InputCad" 
                            Height="80px" Text='<%# Bind("msnCandidato") %>' TextMode="MultiLine" />
                        <br />
                        <asp:Label ID="AprFimLabel" runat="server" 
                            Text="Mensagem ao Candidato não classificado no Processo:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="msnCandidatoFimTextBox" 
                            ErrorMessage="Mensagem ao candidato não selecionado é obrigatória">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="msnCandidatoFimTextBox" runat="server" CssClass="InputCad" 
                            Height="80px" Text='<%# Bind("msnCandidatoFim") %>' TextMode="MultiLine" />
                        <br />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            ShowMessageBox="True" />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Atualizar os dados informados" />
                        &nbsp;|&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                        <br />
                        <br />
                        <asp:Image ID="ImageLinha" runat="server" ImageUrl="~/images/linhaEmp.gif" />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <br />
                        <asp:Label ID="LabelPS4" runat="server" CssClass="titulo" 
                            Text="Formulário para novas Apresentações"></asp:Label>
                        <br />
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                            CommandName="New" Text="Incluir uma nova Apresentação" />
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <br />
                        <asp:Label ID="LabelPS5" runat="server" CssClass="titulo" 
                            Text="Nova Apresentação"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Esta Apresentação é da Empresa?"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="DropDownListEmpresa" ErrorMessage="Informe a Empresa">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:DropDownList ID="DropDownListEmpresa" runat="server" CssClass="DropCad" 
                            DataSourceID="SqlDataSourceListaEmpresa" DataTextField="nmempresa" 
                            DataValueField="idCadastroEmpresa" ondatabound="DropDownListEmpresa_DataBound" 
                            SelectedValue='<%# Bind("idCadastroEmpresaFilha") %>'>
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="titAprLabel0" runat="server" Text="Título da Apresentação:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="tituloDesEmpresaTextBox" 
                            ErrorMessage="Título é obrigatório">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="tituloDesEmpresaTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("tituloDesEmpresa") %>' />
                        <br />
                        <asp:Label ID="AprLabel0" runat="server" Text="Apresentação no anúncio:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="dsempresaVagaTextBox" 
                            ErrorMessage="Apresentação é obrigatória">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="dsempresaVagaTextBox" runat="server" CssClass="InputCad" 
                            Height="150px" Text='<%# Bind("dsempresaVaga") %>' TextMode="MultiLine" />
                        <br />
                        <asp:Label ID="AprIniLabel0" runat="server" 
                            Text="Mensagem ao Candidato que apresentar seu CV:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ControlToValidate="msnCandidatoTextBox" 
                            ErrorMessage="Mensagem ao candidato é obrigatória">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="msnCandidatoTextBox" runat="server" CssClass="InputCad" 
                            Height="80px" Text='<%# Bind("msnCandidato") %>' TextMode="MultiLine" />
                        <br />
                        <asp:Label ID="AprFimLabel0" runat="server" 
                            Text="Mensagem ao Candidato não classificado no Processo:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                            ControlToValidate="msnCandidatoFimTextBox" 
                            ErrorMessage="Mensagem ao candidato não selecionado é obrigatória">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="msnCandidatoFimTextBox" runat="server" CssClass="InputCad" 
                            Height="80px" Text='<%# Bind("msnCandidatoFim") %>' TextMode="MultiLine" />
                        <br />
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                            ShowMessageBox="True" />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Salvar Apresentação" />
                        &nbsp;|&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                        <br />
                        <br />
                        <asp:Image ID="ImageLinha0" runat="server" ImageUrl="~/images/linhaEmp.gif" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <br />
                        <asp:Label ID="LabelPS6" runat="server" CssClass="titulo" 
                            Text="Formulário para novas apresentações"></asp:Label>
                        <br />
                        <asp:Label ID="tituloDesEmpresaLabel" runat="server" Font-Bold="True" 
                            Text='<%# Bind("tituloDesEmpresa") %>' />
                        <br />
                        <asp:Label ID="dsempresaVagaLabel" runat="server" 
                            Text='<%# Bind("dsempresaVaga") %>' />
                        <br />
                        <br />
                        <asp:Label ID="msnCandidatoLabel" runat="server" ForeColor="#006600" 
                            Text='<%# Bind("msnCandidato") %>' />
                        <br />
                        <br />
                        <asp:Label ID="msnCandidatoFimLabel" runat="server" ForeColor="#CC3300" 
                            Text='<%# Bind("msnCandidatoFim") %>' />
                        <br />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Editar Apresentação" />
                        &nbsp;|&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                            CommandName="Delete" 
                            onclientclick="return confirm(&quot;Tenha certeza de que não existe nenhuma vaga utilizando esta apresentação antes de excluir&quot;)" 
                            Text="Excluir Apresentação" />
                        &nbsp;|&nbsp;<asp:LinkButton ID="NewButton0" runat="server" CausesValidation="False" 
                            CommandName="New" Text="Nova Apresentação" />
                        |
                        <asp:LinkButton ID="FecharGridView" runat="server" 
                            onclick="FecharGridView_Click">Fechar</asp:LinkButton>
                        <br />
                        <br />
                        <asp:Image ID="ImageLinha1" runat="server" ImageUrl="~/images/linhaEmp.gif" />
                    </ItemTemplate>
                </asp:FormView>
                </td>
            </tr>
        </table>
        <br />
        <br />
    <asp:SqlDataSource ID="SqlEmpresa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idCadastroEmpresa], [nmempresa], [idCadastroEmpresa_Pai] FROM [tbCadastroEmpresa] WHERE ([idCadastroEmpresa_Pai] = @idCadastroEmpresa_Pai)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa_Pai" 
                SessionField="idCadastroEmpresa" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlApresentacaoEmpresas" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="_USP_APRESENTACAO_ANUNCIO_VAGA" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="idCadastroEmpresaFilhaLabel" 
                            Name="idCadastroEmpresaFilha" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlApresentacaoEmpresasFORM" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    DeleteCommand="DELETE FROM [tbDescEmpresa_Vaga] WHERE [iddsempresa] = @iddsempresa" 
                    InsertCommand="INSERT INTO [tbDescEmpresa_Vaga] ([idCadastroEmpresa], [idCadastroEmpresaFilha], [tituloDesEmpresa], [dsempresaVaga], [msnCandidato], [msnCandidatoFim]) VALUES (@idCadastroEmpresa, @idCadastroEmpresaFilha, @tituloDesEmpresa, @dsempresaVaga, @msnCandidato, @msnCandidatoFim)" 
                    SelectCommand="SELECT [iddsempresa], [idCadastroEmpresa], [idCadastroEmpresaFilha], [tituloDesEmpresa], [dsempresaVaga], [msnCandidato], [msnCandidatoFim] FROM [tbDescEmpresa_Vaga] WHERE ([idCadastroEmpresaFilha] = @idCadastroEmpresaFilha)" 
                    
            UpdateCommand="UPDATE [tbDescEmpresa_Vaga] SET [idCadastroEmpresa] = @idCadastroEmpresa, [idCadastroEmpresaFilha] = @idCadastroEmpresaFilha, [tituloDesEmpresa] = @tituloDesEmpresa, [dsempresaVaga] = @dsempresaVaga, [msnCandidato] = @msnCandidato, [msnCandidatoFim] = @msnCandidatoFim WHERE [iddsempresa] = @iddsempresa">
                    <DeleteParameters>
                        <asp:Parameter Name="iddsempresa" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                        <asp:Parameter Name="idCadastroEmpresaFilha" Type="Int32" />
                        <asp:Parameter Name="tituloDesEmpresa" Type="String" />
                        <asp:Parameter Name="dsempresaVaga" Type="String" />
                        <asp:Parameter Name="msnCandidato" Type="String" />
                        <asp:Parameter Name="msnCandidatoFim" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="idCadastroEmpresaFilhaLabel" Name="idCadastroEmpresaFilha" 
                            PropertyName="Text" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                        <asp:Parameter Name="idCadastroEmpresaFilha" Type="Int32" />
                        <asp:Parameter Name="tituloDesEmpresa" Type="String" />
                        <asp:Parameter Name="dsempresaVaga" Type="String" />
                        <asp:Parameter Name="msnCandidato" Type="String" />
                        <asp:Parameter Name="msnCandidatoFim" Type="String" />
                        <asp:Parameter Name="iddsempresa" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceListaEmpresa" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="SELECT [nmempresa], [idCadastroEmpresa_Pai], [idCadastroEmpresa] FROM [tbCadastroEmpresa] WHERE ([idCadastroEmpresa_Pai] = @idCadastroEmpresa_Pai)">
                    <SelectParameters>
                        <asp:SessionParameter Name="idCadastroEmpresa_Pai" 
                            SessionField="idCadastroEmpresa" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </asp:Content>

