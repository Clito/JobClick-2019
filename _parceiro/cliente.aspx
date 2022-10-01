<%@ Page Language="VB" MasterPageFile="~/_parceiro/ParceiroPage.master" AutoEventWireup="false" CodeFile="cliente.aspx.vb" Inherits="_empresa_cadastro" title=":. Sistema JobClick .:" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", height: '100', position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up"} });
        });
	</script>

                <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_parceiro/images/buttonOK.png" />
                            </td>
                            <td align="center" valign="top">
                                <asp:Label ID="AVISOLABEL" runat="server" 
                                    CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
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
                                            <asp:Image ID="Image1" runat="server" 
                                                            ImageUrl="~/_corporativo/images/holomatica/navegadorIndicador.png" />
                                        </td>
                                        <td>
                                        <a href="cadastroCliente.aspx?menu=2">Incluir Novo Cliente</a>
                                        </td>
                                        <td>
                                            <asp:Label ID="separadorLabel5" runat="server" Text="&nbsp;&nbsp;|&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td>
                                            <a href="atualizacadastroCliente.aspx?menu=2">Atualizar dados de Cliente</a></td>
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
    <h1><asp:Label ID="LabelCabec" runat="server" Text="Dados do Parceiro"></asp:Label></h1>
    
    <table border="0" cellpadding="0" cellspacing="0"> 
        <tr>
            <td width="26">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="350">
    
                <asp:DataList ID="DataListLogin" runat="server" DataKeyField="contador" DataSourceID="SqlDataSourceACESSO"
                    Width="100%">
                    <ItemTemplate>
                        Login em:
                        <asp:Label ID="dataultimoacessLabel" runat="server" Text='<%# Eval("dataultimoacess") %>'></asp:Label>
                        | nº acesso(s):
                        <asp:Label ID="contadorLabel" runat="server" Text='<%# Eval("contador") %>'></asp:Label><br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:Label ID="msn" runat="server" CssClass="msn"></asp:Label><br />
                <asp:FormView ID="FormViewCADASTRO" runat="server" 
                    DataKeyNames="idCadastroEmpresa" DataSourceID="SqlDataSource1"
        DefaultMode="Edit" Width="400px">
        <EditItemTemplate>
            <table cellpadding="0" cellspacing="0" class="col_16">
                <tr>
                    <td>
                        <br />
                        <table cellpadding="0" cellspacing="0" class="col_15">
                            <tr>
                                <td align="right">
                                    <asp:TextBox ID="ufTextBox" runat="server" Text='<%# Bind("uf") %>' 
                                        Visible="False" Width="10px"></asp:TextBox>
                                    <asp:TextBox ID="paisTextBox" runat="server" Text='<%# Bind("pais") %>' 
                                        Visible="False" Width="8px"></asp:TextBox>
                                    <asp:TextBox ID="idUserTextBox" runat="server" Text='<%# Bind("idUser") %>' 
                                        Visible="False" Width="8px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="nmempresaTextBox" Display="Dynamic" ErrorMessage="*" 
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:Label ID="Label001" runat="server" Text="Empresa: (Razão Social)"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="nmempresaTextBox" runat="server" CssClass="InputCadEmp" 
                                        Text='<%# Bind("nmempresa") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="cnpjTextBox" Display="Dynamic" ErrorMessage="*" 
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                        ControlToValidate="cnpjTextBox" ErrorMessage="* Formato (999.999.999/9999-99)" 
                                        SetFocusOnError="True" 
                                        ValidationExpression="^\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$"></asp:RegularExpressionValidator>
                                    <asp:Label ID="Label2" runat="server" Text="CNPJ:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="cnpjTextBox" runat="server" CssClass="InputCadEmp" 
                                        Enabled="False" Text='<%# Bind("cnpj") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                        ControlToValidate="nomeResTextBox" Display="Dynamic" ErrorMessage="*" 
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:Label ID="Label4" runat="server" Text="Nome: (Responsável)"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="nomeResTextBox" runat="server" CssClass="InputCadEmp" 
                                        Text='<%# Bind("nomeRes") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ControlToValidate="emailResTextBox" Display="Dynamic" ErrorMessage="*" 
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                        ControlToValidate="emailResTextBox" Display="Dynamic" 
                                        ErrorMessage="* Informe um e-mail válido..." SetFocusOnError="True" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    <asp:Label ID="Label3" runat="server" Text="E-mail: (Responsável)"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="emailResTextBox" runat="server" CssClass="InputCadEmp" 
                                        Text='<%# Bind("emailRes") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                        ControlToValidate="enderecoTextBox" Display="Dynamic" ErrorMessage="*" 
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:Label ID="Label5" runat="server" Text="Endereço:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="enderecoTextBox" runat="server" CssClass="InputCadEmp" 
                                        Text='<%# Bind("endereco") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                        ControlToValidate="cepTextBox" Display="Dynamic" ErrorMessage="*" 
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                        ControlToValidate="cepTextBox" Display="Dynamic" 
                                        ErrorMessage="* Formato (99999-999)" SetFocusOnError="True" 
                                        ValidationExpression="\d{5}(-\d{3})?"></asp:RegularExpressionValidator>
                                    <asp:Label ID="Label6" runat="server" Text="CEP:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="cepTextBox" runat="server" CssClass="InputCadEmp" 
                                        Text='<%# Bind("cep") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                        ControlToValidate="bairroTextBox" Display="Dynamic" ErrorMessage="*" 
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:Label ID="Label7" runat="server" Text="Bairro:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="bairroTextBox" runat="server" CssClass="InputCadEmp" 
                                        Text='<%# Bind("bairro") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                        ControlToValidate="cidadeTextBox" Display="Dynamic" ErrorMessage="*" 
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <asp:Label ID="Label8" runat="server" Text="Cidade:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="cidadeTextBox" runat="server" CssClass="InputCadEmp" 
                                        Text='<%# Bind("cidade") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="Label9" runat="server" Text="UF:"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" runat="server" 
                                        DataSourceID="SqlDataSource4" DataTextField="dsuf" DataValueField="uf" 
                                        SelectedValue='<%# Bind("uf") %>' type="text">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="Label10" runat="server" Text="Pais:"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        DataSourceID="SqlDataSource3" DataTextField="pais" DataValueField="pais" 
                                        SelectedValue='<%# Bind("pais") %>' type="text">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    &nbsp;</td>
                                <td>
                                    <br />
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                        CommandName="Update" CssClass="button" Text="Atualizar cadastro" 
                                        ToolTip="Clique aqui para salvar as alteraááes feitas"></asp:LinkButton>
                                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" CssClass="button" OnClick="GoBack" Text="Menu Principal" 
                                        ToolTip="Clique aqui para cancelar as alteraááes"></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </EditItemTemplate>
        <EmptyDataTemplate>
            Bem-vindo ao sistema JobClick.<br />
            <br />
            Agradeáemos seu interesse em conhecer nossa ferramenta, para iniciar seus trabalhos
            em nosso sistema primeiramente será necessário informar alguns dados de sua empresa.<br />
            <br />
            Trata-se apenas de uma forma de garantir o sigilo dos profissionais aqui cadastrados.<br />
            <br />
            O sistema irá pesquisar o CNPJ informado e validar seu cadastro em nosso sistema.<br />
            <br />
            Agradecemos desde já a sua compreensáo.<br />
            <br />
            WebMaster JobClick
            <br />
            <br />
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="Cadastrar minha empresa"></asp:LinkButton>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            Empresa:<asp:TextBox ID="idUserTextBox" runat="server" Text='<%# Bind("idUser") %>' Visible="False" Width="1px"></asp:TextBox><asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource2"
                DataTextField="idUser" DataValueField="idUser" SelectedValue='<%# Bind("idUser") %>'
                Visible="False">
            </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ControlToValidate="nmempresaTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="nmempresaTextBox" runat="server" Text='<%# Bind("nmempresa") %>' CssClass="InputCadEmp"></asp:TextBox><br />
            CNPJ:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cnpjTextBox"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
            [99.999.999/9999-99]<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="cnpjTextBox"
                ErrorMessage="*" SetFocusOnError="True" ValidationExpression="^\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$"></asp:RegularExpressionValidator>
            <br />
            <asp:TextBox ID="cnpjTextBox" runat="server" Text='<%# Bind("cnpj") %>' CssClass="InputCadEmp"></asp:TextBox><br />
            E-mail:<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="emailResTextBox"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="emailResTextBox"
                ErrorMessage="* Informe um e-mail válido..." SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />
            <asp:TextBox ID="emailResTextBox" runat="server" Text='<%# Bind("emailRes") %>' CssClass="InputCadEmp"></asp:TextBox><br />
            Nome:<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="nomeResTextBox"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="nomeResTextBox" runat="server" Text='<%# Bind("nomeRes") %>' CssClass="InputCadEmp"></asp:TextBox><br />
            Endereço:<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server"
                ControlToValidate="enderecoTextBox" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="enderecoTextBox" runat="server" Text='<%# Bind("endereco") %>' CssClass="InputCadEmp"></asp:TextBox><br />
            CEP:<asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="cepTextBox"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="cepTextBox"
                ErrorMessage="* Formato (99999999)" SetFocusOnError="True" ValidationExpression="\d{8}"></asp:RegularExpressionValidator><br />
            <asp:TextBox ID="cepTextBox" runat="server" Text='<%# Bind("cep") %>' CssClass="InputCadEmp"></asp:TextBox><br />
            Bairro:<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="bairroTextBox"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="bairroTextBox" runat="server" Text='<%# Bind("bairro") %>' CssClass="InputCadEmp"></asp:TextBox><br />
            Cidade:<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="cidadeTextBox"
                Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="cidadeTextBox" runat="server" Text='<%# Bind("cidade") %>' CssClass="InputCadEmp"></asp:TextBox><br />
            UF:<asp:TextBox ID="ufTextBox" runat="server" Text='<%# Bind("uf") %>' Visible="False" Width="1px"></asp:TextBox><br />
            <asp:DropDownList ID="DropDownList3" runat="server" CssClass="DropCadEmp" DataSourceID="SqlDataSource4"
                DataTextField="uf" DataValueField="uf" SelectedValue='<%# Bind("uf") %>'>
            </asp:DropDownList><br />
            Pais:<asp:TextBox ID="paisTextBox" runat="server" Text='<%# Bind("pais") %>' Visible="False" Width="1px"></asp:TextBox><br />
            <asp:DropDownList ID="DropDownList4" runat="server" CssClass="DropCadEmp" DataSourceID="SqlDataSource3"
                DataTextField="pais" DataValueField="pais" SelectedValue='<%# Bind("pais") %>'>
            </asp:DropDownList><br />
            <br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Salvar cadastro"></asp:LinkButton>
            |
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancelar" OnClick="GoBack"></asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            idCadastroEmpresa:
            <asp:Label ID="idCadastroEmpresaLabel" runat="server" Text='<%# Eval("idCadastroEmpresa") %>'></asp:Label><br />
            idUser:
            <asp:Label ID="idUserLabel" runat="server" Text='<%# Bind("idUser") %>'></asp:Label><br />
            nmempresa:
            <asp:Label ID="nmempresaLabel" runat="server" Text='<%# Bind("nmempresa") %>'></asp:Label><br />
            cnpj:
            <asp:Label ID="cnpjLabel" runat="server" Text='<%# Bind("cnpj") %>'></asp:Label><br />
            emailRes:
            <asp:Label ID="emailResLabel" runat="server" Text='<%# Bind("emailRes") %>'></asp:Label><br />
            nomeRes:
            <asp:Label ID="nomeResLabel" runat="server" Text='<%# Bind("nomeRes") %>'></asp:Label><br />
            endereco:
            <asp:Label ID="enderecoLabel" runat="server" Text='<%# Bind("endereco") %>'></asp:Label><br />
            cep:
            <asp:Label ID="cepLabel" runat="server" Text='<%# Bind("cep") %>'></asp:Label><br />
            bairro:
            <asp:Label ID="bairroLabel" runat="server" Text='<%# Bind("bairro") %>'></asp:Label><br />
            cidade:
            <asp:Label ID="cidadeLabel" runat="server" Text='<%# Bind("cidade") %>'></asp:Label><br />
            uf:
            <asp:Label ID="ufLabel" runat="server" Text='<%# Bind("uf") %>'></asp:Label><br />
            pais:
            <asp:Label ID="paisLabel" runat="server" Text='<%# Bind("pais") %>'></asp:Label><br />
            data:
            <asp:Label ID="dataLabel" runat="server" Text='<%# Bind("data") %>'></asp:Label><br />
            contador:
            <asp:Label ID="contadorLabel" runat="server" Text='<%# Bind("contador") %>'></asp:Label><br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Edit"></asp:LinkButton>
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                Text="Delete"></asp:LinkButton>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="New"></asp:LinkButton>
        </ItemTemplate>
    </asp:FormView>
    </td> 
        </tr>
    </table>     
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbCadastroEmpresa] WHERE [idCadastroEmpresa] = @idCadastroEmpresa"
        InsertCommand="INSERT INTO [tbCadastroEmpresa] ([idUser], [nmempresa], [cnpj], [emailRes], [nomeRes], [endereco], [cep], [bairro], [cidade], [uf], [pais]) VALUES (@idUser, @nmempresa, @cnpj, @emailRes, @nomeRes, @endereco, @cep, @bairro, @cidade, @uf, @pais)"
        SelectCommand="SELECT [idCadastroEmpresa], [idUser], [nmempresa], [cnpj], [emailRes], [nomeRes], [endereco], [cep], [bairro], [cidade], [uf], [pais], [data], [contador] FROM [tbCadastroEmpresa] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa2)"
        UpdateCommand="UPDATE [tbCadastroEmpresa] SET [idUser] = @idUser, [nmempresa] = @nmempresa, [cnpj] = @cnpj, [emailRes] = @emailRes, [nomeRes] = @nomeRes, [endereco] = @endereco, [cep] = @cep, [bairro] = @bairro, [cidade] = @cidade, [uf] = @uf, [pais] = @pais WHERE [idCadastroEmpresa] = @idCadastroEmpresa">
        <DeleteParameters>
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idUser" Type="Int32" />
            <asp:Parameter Name="nmempresa" Type="String" />
            <asp:Parameter Name="cnpj" Type="String" />
            <asp:Parameter Name="emailRes" Type="String" />
            <asp:Parameter Name="nomeRes" Type="String" />
            <asp:Parameter Name="endereco" Type="String" />
            <asp:Parameter Name="cep" Type="String" />
            <asp:Parameter Name="bairro" Type="String" />
            <asp:Parameter Name="cidade" Type="String" />
            <asp:Parameter Name="uf" Type="String" />
            <asp:Parameter Name="pais" Type="String" />
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idCadastroEmpresa2" SessionField="idCadastroEmpresa"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="idUser" Type="Int32" />
            <asp:Parameter Name="nmempresa" Type="String" />
            <asp:Parameter Name="cnpj" Type="String" />
            <asp:Parameter Name="emailRes" Type="String" />
            <asp:Parameter Name="nomeRes" Type="String" />
            <asp:Parameter Name="endereco" Type="String" />
            <asp:Parameter Name="cep" Type="String" />
            <asp:Parameter Name="bairro" Type="String" />
            <asp:Parameter Name="cidade" Type="String" />
            <asp:Parameter Name="uf" Type="String" />
            <asp:Parameter Name="pais" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idUser] FROM [tbuser] WHERE ([idUser] = @idUser)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="idUser" SessionField="idUser" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [pais] FROM [tbpais]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [uf], [dsuf] FROM [tbuf]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceACESSO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="_USP_LOGIN_DADOS" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idUser" SessionField="idUser"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

