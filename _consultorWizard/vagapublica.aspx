<%@ Page Language="VB" MasterPageFile="~/_consultorWizard/ConsultorMasterPage.master" AutoEventWireup="false" CodeFile="vagapublica.aspx.vb" Inherits="_empresa_vagapublica" title="Untitled Page" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register src="../App_Include/pesquisaFuncao.ascx" tagname="pesquisaFuncao" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/layout/publicavagasWeb.gif" />
    <table width="640" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="614">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
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
                            SortExpression="dsVagaPublica" Visible="False" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" 
                            Visible="False" />
                        <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" 
                            Visible="False" />
                        <asp:BoundField DataField="validade" HeaderText="Validade" 
                            SortExpression="validade" />
                        <asp:BoundField DataField="referencia" HeaderText="referencia" 
                            SortExpression="referencia" Visible="False" />
                        <asp:CheckBoxField DataField="publicar" HeaderText="Publicada" 
                            SortExpression="publicar" />
                        <asp:CommandField SelectText="Editar" ShowSelectButton="True">
                            <ItemStyle Width="60px" />
                        </asp:CommandField>
                    </Columns>
                    <EmptyDataTemplate>
                        Publique suas vagas em formato de &quot;classificado de empregos&quot;. Nesta forma de 
                        apresentação você receberá por e-mail os CVs de todos os candidatos que 
                        mostrarem interesse pela vaga. E ainda poderá incluir o CV direto no processo 
                        seletivo.
                        <br />
                        <br />
                        Desta forma não será necessário entrar no sistema para analizar o andamento 
                        processo seletivo.<br />
                    </EmptyDataTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="Azure" />
                </asp:GridView>
                </td> 
        </tr>
        <tr>
            <td width="26">
                &nbsp;</td>
            <td width="614">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="idVagaPublica" 
                    DataSourceID="SqlForm" Width="614px">
                    <EditItemTemplate>
                        <uc1:pesquisaFuncao ID="pesquisaFuncao1" runat="server" 
                            funcao='<%# Bind("idfuncao") %>' Visible="True" />
                        <br />
                        Título para a vaga:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                            runat="server" ControlToValidate="titVagaPublicaTextBox" Display="Dynamic" 
                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="codigoTextBox" runat="server" Text='<%# Bind("codigo") %>' 
                            Visible="False" Width="24px" />
                        <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>' 
                            Visible="False" Width="20px" />
                        <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" 
                            Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="21px" />
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("idfuncao") %>' 
                            Visible="False" Width="23px"></asp:TextBox>
                        <br />
                        <asp:TextBox ID="titVagaPublicaTextBox" runat="server" CssClass="InputCadEmp" 
                            MaxLength="50" Text='<%# Bind("titVagaPublica") %>' />
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
                        Local de trabalho: Ex.: São Paulo / Rio / Americana ...<asp:RequiredFieldValidator ID="RequiredFieldValidator6" 
                            runat="server" ControlToValidate="LocalTrabalhoTextBox" Display="Dynamic" 
                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="LocalTrabalhoTextBox" runat="server" CssClass="InputCadEmp" 
                            Text='<%# Bind("localTrabalho") %>'></asp:TextBox>
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
                            MaxLength="180" Text='<%# Bind("email") %>' />
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
                        <cc1:MaskedEditExtender ID="validadeTextBox_MaskedEditExtender" runat="server" 
                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                            Mask="99\/99\/9999" MaskType="Date" TargetControlID="validadeTextBox">
                        </cc1:MaskedEditExtender>
                        <br />
                        URL da empresa: (Opcional)<br />
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
                        Dicas do sistema:<br />O JobClick desenvolveu uma ferramenta para facilitar ao 
                        candidato localizar a melhor oferta de emprego. O sistema é indexado pela 
                        (função) e para cadastrar uma vaga você deverá pesquisar a função em nosso 
                        sistema.<br />
                        <br />
                        <uc1:pesquisaFuncao ID="pesquisaFuncao1" runat="server" 
                            funcao='<%# Bind("idfuncao") %>' Visible="True" />
                        <br />
                        <br />
                        <asp:TextBox ID="codigoTextBox" runat="server" CssClass="InputCadEmp" 
                            Text='<%# Bind("codigo") %>' Visible="False" />
                        <br />
                        Título para a vaga:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                            runat="server" ControlToValidate="titVagaPublicaTextBox" Display="Dynamic" 
                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="idCadastroEmpresaTextBox" runat="server" 
                            Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="21px" />
                        <br />
                        <asp:TextBox ID="titVagaPublicaTextBox" runat="server" 
                            Text='<%# Bind("titVagaPublica") %>' CssClass="InputCadEmp" 
                            MaxLength="50" />
                        <br />
                        Descrição Geral da vaga:<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="dsVagaPublicaTextBox" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="dsVagaPublicaTextBox" runat="server" 
                            Text='<%# Bind("dsVagaPublica") %>' CssClass="InputCadEmp" Height="326px" 
                            TextMode="MultiLine" />
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
                        Local de trabalho: Ex.: São Paulo / Rio / Americana ...<asp:RequiredFieldValidator ID="RequiredFieldValidator6" 
                            runat="server" ControlToValidate="LocalTrabalhoTextBox" Display="Dynamic" 
                            ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="LocalTrabalhoTextBox" runat="server" CssClass="InputCadEmp" 
                            Text='<%# Bind("localTrabalho") %>'></asp:TextBox>
                        <br />
                        E-Mail que receberá os profiles (Currículos):<asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator3" runat="server" ControlToValidate="emailTextBox" 
                            Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="*" 
                            SetFocusOnError="True" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <br />
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' 
                            CssClass="InputCadEmp" MaxLength="180" />
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
                        <asp:TextBox ID="validadeTextBox" runat="server" 
                            Text='<%# Bind("validade") %>' CssClass="InputCadEmp" />
                        <cc1:MaskedEditExtender ID="validadeTextBox_MaskedEditExtender" runat="server" 
                            CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                            CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                            Mask="99\/99\/9999" MaskType="Date" TargetControlID="validadeTextBox">
                        </cc1:MaskedEditExtender>
                        <br />
                        URL da empresa: (Opcional)<br />
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
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <br />
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
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                            CommandName="New" Text="Publicar uma nova vaga" />
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="New">Cadastrar uma 
                        vaga na Web</asp:LinkButton>
                    </EmptyDataTemplate>
                </asp:FormView>
           </td> 
        </tr>
    </table>
    <br />
    <asp:SqlDataSource ID="SqlForm" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="DELETE FROM [tbVagaPublica] WHERE [idVagaPublica] = @idVagaPublica" 
        InsertCommand="INSERT INTO tbVagaPublica(idCadastroEmpresa, idfuncao, titVagaPublica, dsVagaPublica, email, data, validade, codigo, referencia, publicar, nroVaga, localTrabalho) VALUES (@idCadastroEmpresa, @idfuncao, @titVagaPublica, @dsVagaPublica, @email, @data, @validade, @codigo, @referencia, @publicar, @nroVaga, @localTrabalho)" 
        SelectCommand="SELECT idVagaPublica, idCadastroEmpresa, idfuncao, titVagaPublica, dsVagaPublica, email, data, validade, codigo, referencia, publicar, nroVaga, localTrabalho FROM tbVagaPublica WHERE (idCadastroEmpresa = @idCadastroEmpresa) AND (idVagaPublica = @idVagaPublica)" 
        
        
        UpdateCommand="UPDATE tbVagaPublica SET idCadastroEmpresa = @idCadastroEmpresa, idfuncao = @idfuncao, titVagaPublica = @titVagaPublica, dsVagaPublica = @dsVagaPublica, email = @email, data = @data, validade = @validade, codigo = @codigo, referencia = @referencia, publicar = @publicar, nroVaga = @nroVaga, localTrabalho = @localTrabalho WHERE (idVagaPublica = @idVagaPublica)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" 
                Type="Int32" />
            <asp:ControlParameter ControlID="GridView1" Name="idVagaPublica" 
                PropertyName="SelectedValue" Type="Int32" />
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
    </asp:Content>

