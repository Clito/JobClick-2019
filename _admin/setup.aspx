<%@ Page Language="VB" validateRequest="false" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="true" CodeFile="setup.aspx.vb" Inherits="_admin_setup" title="Administrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCabec" runat="server" CssClass="titulo" Text="Administração (Setup Empresas)"></asp:Label>
    <asp:Label ID="idCadastroEmpresaLabel" runat="server" Visible="False"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridViewEmpresa" runat="server" AutoGenerateColumns="False" BorderStyle="None"
        DataKeyNames="idsetup,idCadastroEmpresa" DataSourceID="SqlSetupGridView" 
        GridLines="Horizontal" Width="100%" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="idsetup" HeaderText="idsetup" InsertVisible="False" ReadOnly="True"
                SortExpression="idsetup" Visible="False" />
            <asp:BoundField DataField="empresa" HeaderText="Empresa" SortExpression="empresa" />
            <asp:BoundField DataField="sSmtp" HeaderText="sSmtp" SortExpression="sSmtp" Visible="False" />
            <asp:BoundField DataField="emailAdmin" HeaderText="E-mail" SortExpression="emailAdmin" />
            <asp:BoundField DataField="nomeAdmin" HeaderText="nomeAdmin" SortExpression="nomeAdmin"
                Visible="False" />
            <asp:BoundField DataField="sSubject" HeaderText="sSubject" SortExpression="sSubject"
                Visible="False" />
            <asp:BoundField DataField="sTitle" HeaderText="sTitle" SortExpression="sTitle" Visible="False" />
            <asp:BoundField DataField="celular" HeaderText="celular" SortExpression="celular"
                Visible="False" />
            <asp:BoundField DataField="operadora" HeaderText="operadora" SortExpression="operadora"
                Visible="False" />
            <asp:BoundField DataField="meta" HeaderText="meta" SortExpression="meta" Visible="False" />
            <asp:BoundField DataField="fonte" HeaderText="fonte" SortExpression="fonte" Visible="False" />
            <asp:BoundField DataField="url" HeaderText="url" SortExpression="url" Visible="False" />
            <asp:BoundField DataField="google" HeaderText="google" SortExpression="google" Visible="False" />
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" 
                SortExpression="idCadastroEmpresa" Visible="False" />
        </Columns>
        <AlternatingRowStyle BackColor="WhiteSmoke" />
    </asp:GridView>
    <br />
    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="idsetup" 
        DataSourceID="SqlSetupForm" Width="100%">
        <EditItemTemplate>
            Código: [<asp:Label ID="idsetupLabel1" runat="server" Text='<%# Eval("idsetup") %>'></asp:Label>]<br />
            <br />
            <table bgcolor="#FFFFCC" cellpadding="2" cellspacing="2" width="100%">
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" CssClass="titulo" 
                            Text="Administração de Associados"></asp:Label>
                        <br />
                        <asp:Label ID="Label7" runat="server" Text="Contrato de comissão empresa:"></asp:Label>
                        <br />
                        <asp:TextBox ID="contratoComissaoEmpresaTextBox" runat="server" 
                            CssClass="InputCad" Height="100px" 
                            Text='<%# Bind("contratoComissaoEmpresa") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label8" runat="server" Text="Contrato de comissao vendedor:"></asp:Label>
                        <br />
                        <asp:TextBox ID="contratoComissaoVendedorTextBox" runat="server" 
                            CssClass="InputCad" Height="100px" 
                            Text='<%# Bind("contratoComissaoVendedor") %>' TextMode="MultiLine" 
                            Width="100%"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label9" runat="server" Text="Contrato:"></asp:Label>
                        <br />
                        <asp:TextBox ID="contratoTextBox" runat="server" CssClass="InputCad" 
                            Height="100px" Text='<%# Bind("contrato") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label10" runat="server" Text="Assinatura:"></asp:Label>
                        <br />
                        <asp:TextBox ID="dataAssinaturaTextBox" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("dataAssinatura") %>' Width="100%"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label11" runat="server" Text="Data Renovação:"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="InputCad" 
                            Text='<%# Bind("dataRenovacao") %>' Width="100%"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label12" runat="server" Text="Observação:"></asp:Label>
                        <br />
                        <asp:TextBox ID="observacaoTextBox" runat="server" CssClass="InputCad" 
                            Height="100px" Text='<%# Bind("observacao") %>' TextMode="MultiLine" 
                            Width="100%"></asp:TextBox>
                        <br />
                    </td>
                </tr>
            </table>
            <br />
            <br />Identificador 
            da empresa:<br />
            <asp:TextBox ID="TextBox1" runat="server" CssClass="InputCad" 
                Text='<%# Bind("idCadastroEmpresa") %>' Width="100%"></asp:TextBox><br />
            Nome da empresa:<br />
            <asp:TextBox ID="empresaTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("empresa") %>' Width="100%"></asp:TextBox><br />
            sSmtp: (localhost)<br />
            <asp:TextBox ID="sSmtpTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("sSmtp") %>' Width="100%"></asp:TextBox><br />
            E-Mail administrador do site:<br />
            <asp:TextBox ID="emailAdminTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("emailAdmin") %>' Width="100%"></asp:TextBox><br />
            Nome que será usado nos e-mails:<br />
            <asp:TextBox ID="nomeAdminTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("nomeAdmin") %>' Width="100%"></asp:TextBox><br />
            sSubject:<br />
            <asp:TextBox ID="sSubjectTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("sSubject") %>' Width="100%"></asp:TextBox><br />
            sTitle:<br />
            <asp:TextBox ID="sTitleTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("sTitle") %>' Width="100%"></asp:TextBox><br />
            celular:<br />
            <asp:TextBox ID="celularTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("celular") %>' Width="100%"></asp:TextBox><br />
            Operadora:<br />
            <asp:TextBox ID="operadoraTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("operadora") %>' Width="100%"></asp:TextBox><br />
            Custom CSS:<br />
            <asp:TextBox ID="metaTextBox" runat="server" CssClass="InputCad" Height="128px" Text='<%# Bind("customcss")%>'
                TextMode="MultiLine" Width="100%"></asp:TextBox><br />
            Fonte RSS:<br />
            <asp:TextBox ID="fonteTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("fonte") %>' Width="100%"></asp:TextBox><br />
            Url:<br />
            <asp:TextBox ID="urlTextBox" runat="server" CssClass="InputCad" 
                Text='<%# Bind("url") %>' Width="100%"></asp:TextBox><br />
            Google Analytics:<br />
            <asp:TextBox ID="googleTextBox" runat="server" CssClass="InputCad" Height="112px"
                Text='<%# Bind("google") %>' TextMode="MultiLine" Width="100%"></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Text="Token (PagSeguro)"></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxtoken" runat="server" CssClass="InputCad" 
                Text='<%# Bind("token") %>' Width="100%"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Layout:"></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxSETLayout" runat="server" CssClass="InputCad" 
                Text='<%# Bind("SETLayout") %>' Width="100%"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Corpo do e-mail padrão:"></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxbodyDoEmail" runat="server" CssClass="InputCad" 
                Height="200px" Text='<%# Bind("bodyDoEmail") %>' TextMode="MultiLine" 
                Width="100%"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" 
                Text="Mensagem principal para as empresas:"></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxbemvindo" runat="server" CssClass="InputCad" 
                Height="200px" Text='<%# Bind("bemvindo_page") %>' TextMode="MultiLine" 
                Width="100%"></asp:TextBox>
            <br />
            <asp:Label ID="Label13" runat="server" Text="Aguardando confirmação de pagamento:"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox3" runat="server" CssClass="InputCad" Height="150px" Text='<%# Bind("AguardandoPagSeguro") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
            <br />
            <asp:Label ID="Label14" runat="server" Text="Pagamento confirmado, aguardando liberação:"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox4" runat="server" CssClass="InputCad" Height="150px" Text='<%# Bind("AprovadoPagSeguro") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
            <br />
            <asp:Label ID="Label15" runat="server" Text="Pagamento em análise:"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox5" runat="server" CssClass="InputCad" Height="150px" Text='<%# Bind("AnalisePagSeguro") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
            <br />
            <asp:Label ID="Label16" runat="server" Text="Disputa (Algum tipo de erro):"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox6" runat="server" CssClass="InputCad" Height="150px" Text='<%# Bind("DisputaPagSeguro") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
            <br />
            <asp:Label ID="DevolvidaPagSeguro" runat="server" Text="Valor da compra devolvido:"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox7" runat="server" CssClass="InputCad" Height="150px" Text='<%# Bind("DevolvidaPagSeguro") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
            <br />
            <asp:Label ID="Label17" runat="server" Text="Cancelado por falta de pagamento:"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox8" runat="server" CssClass="InputCad" Height="150px" Text='<%# Bind("CanceladoPagSeguro") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
            <br />
            <br />
            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("flgExpiraVaga") %>' Text="Vaga expira pelo sistema" />
            <br />
            <br />
            <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("apresentar") %>' Text="Liberar (Apresentar)" />
            <br />
            <br />
            <br />
            <asp:Label ID="Label19" runat="server" Text="Mensagens para os candidatos antes de se cadastrar (Associações)"></asp:Label>
            <br />
            <asp:TextBox ID="LabelMensagemCandidatoTextBox" runat="server" CssClass="InputCad" Height="100px" Text='<%# Bind("mensagemCandidato") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
            <br />
            <asp:Label ID="Label20" runat="server" Text="Mensagens para os candidatos antes de se cadastrar (Associações) - Descrição do produto"></asp:Label>
            <br />
            <asp:TextBox ID="LabelMensagemCandidatoTextBoxDetalhe" runat="server" CssClass="InputCad" Height="100px" Text='<%# Bind("mensagemCandidatoDetalhe") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
            <br />
            <br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" SelectedValue='<%# Bind("candidatoPaga") %>'>
                <asp:ListItem Value="1">O Candidato paga assinatura anual ou qualquer tipo de cobrança.</asp:ListItem>
                <asp:ListItem Value="0">O Candidato não paga nada.</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Salvar"></asp:LinkButton>
            |
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancelar"></asp:LinkButton>
            &nbsp;<br />
            <br />
            <asp:Label ID="LabelBODY" runat="server" Text='<%# Eval("bodyDoEmail") %>'></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="Labelbemvindo" runat="server" 
                Text='<%# Eval("bemvindo_page") %>'></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="Aguardando" runat="server" Text='<%# Eval("AguardandoPagSeguro") %>'></asp:Label>
            <br />
            <br />
            <asp:Label ID="Aprovado" runat="server" Text='<%# Eval("AprovadoPagSeguro") %>'></asp:Label>
            <br />
            <br />
            <asp:Label ID="Analise" runat="server" Text='<%# Eval("AnalisePagSeguro") %>'></asp:Label>
            <br />
            <br />
            <asp:Label ID="Disputa" runat="server" Text='<%# Eval("DisputaPagSeguro") %>'></asp:Label>
            <br />
            <br />
            <asp:Label ID="Devolvido" runat="server" Text='<%# Eval("DevolvidaPagSeguro") %>'></asp:Label>
            <br />
            <br />
            <asp:Label ID="Cancelado" runat="server" Text='<%# Eval("CanceladoPagSeguro") %>'></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label18" runat="server" CssClass="titulo" Text="Mensagem do formulário do cadastro do candidato:"></asp:Label>
            <br />
            <br />
            <asp:Label ID="LabelMensagemCandidato" runat="server" Text='<%# Eval("mensagemCandidato") %>'></asp:Label>
            <br />
            <br />
            <asp:Label ID="LabelMensagemCandidatoDetalhe" runat="server" Text='<%# Eval("mensagemCandidatoDetalhe") %>'></asp:Label>
            <br />
        </EditItemTemplate>
        <InsertItemTemplate>
            Identificador da empresa:<br />
            <asp:TextBox ID="TextBox1" runat="server" CssClass="InputCad" Text='<%# Bind("idCadastroEmpresa") %>'></asp:TextBox><br />
            Nome da empresa:<br />
            <asp:TextBox ID="empresaTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("empresa") %>'></asp:TextBox><br />
            sSmtp: (localhost)<br />
            <asp:TextBox ID="sSmtpTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("sSmtp") %>'></asp:TextBox><br />
            E-Mail administrador do site:<br />
            <asp:TextBox ID="emailAdminTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("emailAdmin") %>'></asp:TextBox><br />
            Nome que será usado nos e-mails:<br />
            <asp:TextBox ID="nomeAdminTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("nomeAdmin") %>'></asp:TextBox><br />
            sSubject:<br />
            <asp:TextBox ID="sSubjectTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("sSubject") %>'></asp:TextBox><br />
            sTitle:<br />
            <asp:TextBox ID="sTitleTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("sTitle") %>'></asp:TextBox><br />
            celular:<br />
            <asp:TextBox ID="celularTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("celular") %>'></asp:TextBox><br />
            Operadora:<br />
            <asp:TextBox ID="operadoraTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("operadora") %>'></asp:TextBox><br />
            Meta:<br />
            <asp:TextBox ID="metaTextBox" runat="server" CssClass="InputCad" Height="128px" Text='<%# Bind("meta") %>'
                TextMode="MultiLine"></asp:TextBox><br />
            Fonte RSS:<br />
            <asp:TextBox ID="fonteTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("fonte") %>'></asp:TextBox><br />
            Url:<br />
            <asp:TextBox ID="urlTextBox" runat="server" CssClass="InputCad" Text='<%# Bind("url") %>'></asp:TextBox><br />
            Google Analytics:<br />
            <asp:TextBox ID="googleTextBox" runat="server" CssClass="InputCad" Height="112px"
                Text='<%# Bind("google") %>' TextMode="MultiLine"></asp:TextBox><br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Salvar"></asp:LinkButton>
            |
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancelar"></asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            Cógigo da empresa: [<asp:Label ID="idsetupLabel" runat="server" Font-Bold="True"
                Text='<%# Eval("idsetup") %>'></asp:Label>]<br />
            <br />
            Empresa:<br />
            <asp:Label ID="empresaLabel" runat="server" Font-Bold="True" Text='<%# Bind("empresa") %>'></asp:Label><br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Editar setup desta empresa"></asp:LinkButton>
            |
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                OnClientClick='return confirm("Cuidado! \nVocê quer realmente excluir este setup?")'
                Text="Excluir"></asp:LinkButton>|
            <asp:LinkButton ID="LinkButtonCancelar" runat="server" CausesValidation="False" 
                onclick="LinkButtonCancelar_Click">Cancelar</asp:LinkButton>
            &nbsp;&nbsp;
        </ItemTemplate>
        <EmptyDataTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="Incluir novo setup"></asp:LinkButton>
        </EmptyDataTemplate>
    </asp:FormView>
    <br />
    <br />
    <asp:FormView ID="FormViewPerfilVaga" runat="server" 
        DataKeyNames="idCadastroEmpresa" DataSourceID="SqlDadosdaEmpresa">
        <EditItemTemplate>
            <asp:CheckBox ID="flgAprovaPerfilAutoCheckBox" runat="server" 
                Checked='<%# Bind("flgAprovaPerfilAuto") %>' 
                Text="Liberar Aprovação automática do Perfil de Vaga" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Empresa:"></asp:Label>
            <br />
            <asp:TextBox ID="nmempresaTextBox" runat="server" CssClass="InputCad" 
                ReadOnly="True" Text='<%# Bind("nmempresa") %>' />
            <br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Salvar alteração" />
&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                CommandName="Cancel" Text="Cancelar" />
        </EditItemTemplate>
        <InsertItemTemplate>
            flgAprovaPerfilAuto:
            <asp:CheckBox ID="flgAprovaPerfilAutoCheckBox" runat="server" 
                Checked='<%# Bind("flgAprovaPerfilAuto") %>' />
            <br />

            nmempresa:
            <asp:TextBox ID="nmempresaTextBox" runat="server" 
                Text='<%# Bind("nmempresa") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Label ID="nmempresaLabel" runat="server" Font-Bold="True" 
                Text='<%# Bind("nmempresa") %>' />
            <br />
            <br />
            <asp:CheckBox ID="flgAprovaPerfilAutoCheckBox" runat="server" 
                Checked='<%# Bind("flgAprovaPerfilAuto") %>' Enabled="false" 
                Text="Liberar Aprovação automática do Perfil de Vaga" />
            <br />
            <br />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Atualizar dados" />
            &nbsp;&nbsp;
        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:SqlDataSource ID="SqlSetupGridView" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
        
        SelectCommand="SELECT [idsetup], [empresa], [sSmtp], [emailAdmin], [nomeAdmin], [sSubject], [sTitle], [celular], [operadora], [customcss], [fonte], [url], [google], [idCadastroEmpresa] FROM [tbsetup]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlSetupForm" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbsetup] WHERE [idsetup] = @idsetup" InsertCommand="INSERT INTO tbsetup(empresa, sSmtp, emailAdmin, nomeAdmin, sSubject, sTitle, celular, operadora, customcss, fonte, url, google, idCadastroEmpresa, token, SETLayout, bodyDoEmail, apresentar, bemvindo_page, contratoComissaoEmpresa, contratoComissaoVendedor, contrato, dataAssinatura, dataRenovacao, observacao, flgExpiraVaga, AguardandoPagSeguro, AprovadoPagSeguro, AnalisePagSeguro, DisputaPagSeguro, DevolvidaPagSeguro, CanceladoPagSeguro, mensagemCandidato, mensagemCandidatoDetalhe, candidatoPaga) VALUES (@empresa, @sSmtp, @emailAdmin, @nomeAdmin, @sSubject, @sTitle, @celular, @operadora, @meta, @fonte, @url, @google, @idCadastroEmpresa, @token, @SETLayout, @bodyDoEmail, @apresentar, @bemvindo_page, @contratoComissaoEmpresa, @contratoComissaoVendedor, @contrato, @dataAssinatura, @dataRenovacao, @observacao, @flgExpiraVaga, @AguardandoPagSeguro, @AprovadoPagSeguro, @AnalisePagSeguro, @DisputaPagSeguro, @DevolvidaPagSeguro, @CanceladoPagSeguro, @mensagemCandidato, @mensagemCandidatoDetalhe, @candidatoPaga)"
        SelectCommand="SELECT idsetup, empresa, sSmtp, emailAdmin, nomeAdmin, sSubject, sTitle, celular, operadora, customcss, fonte, url, google, idCadastroEmpresa, token, SETLayout, bodyDoEmail, apresentar, bemvindo_page, contratoComissaoEmpresa, contratoComissaoVendedor, contrato, dataAssinatura, dataRenovacao, observacao, flgExpiraVaga, AguardandoPagSeguro, AprovadoPagSeguro, AnalisePagSeguro, DisputaPagSeguro, DevolvidaPagSeguro, CanceladoPagSeguro, mensagemCandidato, mensagemCandidatoDetalhe, candidatoPaga FROM tbsetup WHERE (idsetup = @idsetup)"
        
        
        
        
        UpdateCommand="UPDATE tbsetup SET empresa = @empresa, sSmtp = @sSmtp, emailAdmin = @emailAdmin, nomeAdmin = @nomeAdmin, sSubject = @sSubject, sTitle = @sTitle, celular = @celular, operadora = @operadora, customcss = @customcss, fonte = @fonte, url = @url, google = @google, idCadastroEmpresa = @idCadastroEmpresa, token = @token, SETLayout = @SETLayout, bodyDoEmail = @bodyDoEmail, apresentar = @apresentar, bemvindo_page = @bemvindo_page, contratoComissaoEmpresa = @contratoComissaoEmpresa, contratoComissaoVendedor = @contratoComissaoVendedor, contrato = @contrato, dataAssinatura = @dataAssinatura, dataRenovacao = @dataRenovacao, observacao = @observacao, flgExpiraVaga = @flgExpiraVaga, AguardandoPagSeguro = @AguardandoPagSeguro, AprovadoPagSeguro = @AprovadoPagSeguro, AnalisePagSeguro = @AnalisePagSeguro, DisputaPagSeguro = @DisputaPagSeguro, DevolvidaPagSeguro = @DevolvidaPagSeguro, CanceladoPagSeguro = @CanceladoPagSeguro, mensagemCandidato = @mensagemCandidato, mensagemCandidatoDetalhe = @mensagemCandidatoDetalhe, candidatoPaga = @candidatoPaga WHERE (idsetup = @idsetup)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewEmpresa" DefaultValue="0" 
                Name="idsetup" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idsetup" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="empresa" Type="String" />
            <asp:Parameter Name="sSmtp" Type="String" />
            <asp:Parameter Name="emailAdmin" Type="String" />
            <asp:Parameter Name="nomeAdmin" Type="String" />
            <asp:Parameter Name="sSubject" Type="String" />
            <asp:Parameter Name="sTitle" Type="String" />
            <asp:Parameter Name="celular" Type="String" />
            <asp:Parameter Name="operadora" Type="String" />
            <asp:Parameter Name="customcss" Type="String" />
            <asp:Parameter Name="fonte" Type="String" />
            <asp:Parameter Name="url" Type="String" />
            <asp:Parameter Name="google" Type="String" />
            <asp:Parameter Name="idCadastroEmpresa" />
            <asp:Parameter Name="token" />
            <asp:Parameter Name="SETLayout" />
            <asp:Parameter Name="bodyDoEmail" />
            <asp:Parameter Name="apresentar" />
            <asp:Parameter Name="bemvindo_page" />
            <asp:Parameter Name="contratoComissaoEmpresa" />
            <asp:Parameter Name="contratoComissaoVendedor" />
            <asp:Parameter Name="contrato" />
            <asp:Parameter Name="dataAssinatura" />
            <asp:Parameter Name="dataRenovacao" />
            <asp:Parameter Name="observacao" />
            <asp:Parameter Name="flgExpiraVaga" />
            <asp:Parameter Name="AguardandoPagSeguro" />
            <asp:Parameter Name="AprovadoPagSeguro" />
            <asp:Parameter Name="AnalisePagSeguro" />
            <asp:Parameter Name="DisputaPagSeguro" />
            <asp:Parameter Name="DevolvidaPagSeguro" />
            <asp:Parameter Name="CanceladoPagSeguro" />
            <asp:Parameter Name="mensagemCandidato" />
            <asp:Parameter Name="mensagemCandidatoDetalhe" />
            <asp:Parameter Name="candidatoPaga" />
            <asp:Parameter Name="idsetup" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="empresa" Type="String" />
            <asp:Parameter Name="sSmtp" Type="String" />
            <asp:Parameter Name="emailAdmin" Type="String" />
            <asp:Parameter Name="nomeAdmin" Type="String" />
            <asp:Parameter Name="sSubject" Type="String" />
            <asp:Parameter Name="sTitle" Type="String" />
            <asp:Parameter Name="celular" Type="String" />
            <asp:Parameter Name="operadora" Type="String" />
            <asp:Parameter Name="meta" />
            <asp:Parameter Name="fonte" Type="String" />
            <asp:Parameter Name="url" Type="String" />
            <asp:Parameter Name="google" Type="String" />
            <asp:Parameter Name="idCadastroEmpresa" />
            <asp:Parameter Name="token" />
            <asp:Parameter Name="SETLayout" />
            <asp:Parameter Name="bodyDoEmail" />
            <asp:Parameter Name="apresentar" />
            <asp:Parameter Name="bemvindo_page" />
            <asp:Parameter Name="contratoComissaoEmpresa" />
            <asp:Parameter Name="contratoComissaoVendedor" />
            <asp:Parameter Name="contrato" />
            <asp:Parameter Name="dataAssinatura" />
            <asp:Parameter Name="dataRenovacao" />
            <asp:Parameter Name="observacao" />
            <asp:Parameter Name="flgExpiraVaga" />
            <asp:Parameter Name="AguardandoPagSeguro" />
            <asp:Parameter Name="AprovadoPagSeguro" />
            <asp:Parameter Name="AnalisePagSeguro" />
            <asp:Parameter Name="DisputaPagSeguro" />
            <asp:Parameter Name="DevolvidaPagSeguro" />
            <asp:Parameter Name="CanceladoPagSeguro" />
            <asp:Parameter Name="mensagemCandidato" />
            <asp:Parameter Name="mensagemCandidatoDetalhe" />
            <asp:Parameter Name="candidatoPaga" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDadosdaEmpresa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT [flgAprovaPerfilAuto], [idCadastroEmpresa], [nmempresa] FROM [tbCadastroEmpresa] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)" 
        DeleteCommand="DELETE FROM [tbCadastroEmpresa] WHERE [idCadastroEmpresa] = @idCadastroEmpresa" 
        InsertCommand="INSERT INTO [tbCadastroEmpresa] ([flgAprovaPerfilAuto], [nmempresa]) VALUES (@flgAprovaPerfilAuto, @nmempresa)" 
        UpdateCommand="UPDATE [tbCadastroEmpresa] SET [flgAprovaPerfilAuto] = @flgAprovaPerfilAuto, [nmempresa] = @nmempresa WHERE [idCadastroEmpresa] = @idCadastroEmpresa">
        <DeleteParameters>
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="flgAprovaPerfilAuto" Type="Boolean" />
            <asp:Parameter Name="nmempresa" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="idCadastroEmpresaLabel" 
                Name="idCadastroEmpresa" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="flgAprovaPerfilAuto" Type="Boolean" />
            <asp:Parameter Name="nmempresa" Type="String" />
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

