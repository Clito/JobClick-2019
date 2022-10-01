<%@ Page Language="VB" MasterPageFile="~/_empresaJC/EmpresaPage.master" AutoEventWireup="false" CodeFile="main_processo.aspx.vb" Inherits="_empresa__processo_Default" title=":. Sistema JobClick .:" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Image ID="cabec" runat="server" ImageUrl="~/images/layout/e_processo.gif" /><br />
    <table width="376" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" /></td>
            <td width="350">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BorderStyle="None"
                    DataSourceID="SqlContadorBaseExclusiva" GridLines="None" Width="614px">
                    <Fields>
                        <asp:BoundField DataField="ContadorBase" HeaderText="N&#250;mero de curr&#237;culos na base exclusiva: "
                            SortExpression="ContadorBase" />
                        <asp:BoundField DataField="idCadastroEmpresa" HeaderText="idCadastroEmpresa" SortExpression="idCadastroEmpresa"
                            Visible="False" />
                        <asp:BoundField DataField="nmempresa" HeaderText="nmempresa" SortExpression="nmempresa"
                            Visible="False" />
                    </Fields>
                    <FieldHeaderStyle Width="600px" />
                </asp:DetailsView>
                <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" BorderStyle="None"
                    DataSourceID="SqlContadorBaseGeral" GridLines="None" Width="614px">
                    <Fields>
                        <asp:BoundField DataField="ContadorGeral" HeaderText="N&#250;mero de curr&#237;culos na base geral: "
                            SortExpression="ContadorGeral" />
                    </Fields>
                    <FieldHeaderStyle Width="600px" />
                </asp:DetailsView>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                    DataKeyNames="idProcessoSeletivo" DataSourceID="SqlProcessoSeletivoView" GridLines="None"
                    Width="614px">
                    <Columns>
                        <asp:BoundField DataField="idProcessoSeletivo" HeaderText="idProcessoSeletivo" InsertVisible="False"
                            ReadOnly="True" SortExpression="idProcessoSeletivo" Visible="False" />
                        <asp:BoundField DataField="idVaga" HeaderText="idVaga" SortExpression="idVaga" Visible="False" />
                        <asp:BoundField DataField="idRH_Gestor" HeaderText="idRH_Gestor" SortExpression="idRH_Gestor"
                            Visible="False" />
                        <asp:TemplateField HeaderText="Processo Seletivo" ShowHeader="False">
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/layout/setalat.gif" />
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Select"
                                    Text='<%# Eval("dsProcesso") %>'></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="344px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="dsProcesso" HeaderText="Processo Seletivo" SortExpression="dsProcesso"
                            Visible="False" />
                        <asp:BoundField DataField="data" DataFormatString="{0:d}" HeaderText="Criado em:"
                            SortExpression="data">
                            <HeaderStyle Width="120px" />
                            <ItemStyle Width="60px" />
                        </asp:BoundField>
                        <asp:TemplateField Visible="False">
                            <ItemTemplate>
                                - [<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("idProcessoSeletivo", "filtro.aspx?idProcessoSeletivo={0}") %>' Text="Criar/Editar filtro de pesquisa"></asp:HyperLink>]
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="dsProcesso,idProcessoSeletivo,idvaga" 
                            DataNavigateUrlFormatString="filtro.aspx?dsProcesso={0}&amp;idProcessoSeletivo={1}&amp;idvaga={2}" 
                            Text="[Editar Filtro]">
                            <ItemStyle Width="90px" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="idProcessoSeletivo,idvaga,dsProcesso" 
                            DataNavigateUrlFormatString="processo.aspx?id={0}&amp;idvaga={1}&amp;dsProcesso={2}" 
                            Text="[Processo Seletivo]">
                            <ItemStyle Width="130px" />
                        </asp:HyperLinkField>
                    </Columns>
                    <EmptyDataTemplate>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    Não foi criado nenhum processo seletivo até este momento...</td>
                                <td>
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/layout/antencao.gif" /></td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="Azure" />
                </asp:GridView>
                <asp:Label ID="idProcessoSeletivolbl" runat="server" Visible="False"></asp:Label>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="idProcessoSeletivo" 
                    DataSourceID="SqlProcessoSeletivoForm" Width="614px" DefaultMode="Edit">
                    <EditItemTemplate>
                        <asp:TextBox ID="idVagaTextBox" runat="server" Text='<%# Bind("idVaga") %>' Visible="False"
                            Width="7px"></asp:TextBox><asp:TextBox ID="idRH_GestorTextBox" runat="server" Text='<%# Bind("idRH_Gestor") %>'
                                Visible="False" Width="16px"></asp:TextBox><asp:TextBox ID="idCadastroEmpresaTextBox"
                                    runat="server" Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="7px"></asp:TextBox>
                        <br />
                        Consultor:<br />
                        <asp:DropDownList ID="DDGestor" runat="server" CssClass="DropCadEmp" DataSourceID="SqlGestor"
                            DataTextField="nome" DataValueField="idRH_Gestor"
                            SelectedValue='<%# Bind("idRH_Gestor") %>' Enabled="False" 
                            ondatabinding="DDGestor_DataBinding">
                        </asp:DropDownList><br />
                        Vaga:<br />
                        <asp:DropDownList ID="DDidvaga" runat="server" CssClass="DropCadEmp" DataSourceID="SqlVagaGestor"
                            DataTextField="codvaga" DataValueField="idVaga" OnDataBinding="DDidvaga_DataBinding"
                            SelectedValue='<%# Bind("idVaga") %>' Enabled="False">
                        </asp:DropDownList><br />
                        Processo Seletivo (Descrição) Ex.: [PS Vaga Técnico]
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dsProcessoTextBox"
                            Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="dsProcessoTextBox" runat="server" CssClass="InputCadEmp" Text='<%# Bind("dsProcesso") %>'></asp:TextBox><br />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Salvar alterações no processo seletivo"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar"></asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="idVagaTextBox" runat="server" Text='<%# Bind("idVaga") %>' Visible="False"
                            Width="7px"></asp:TextBox><asp:TextBox ID="idRH_GestorTextBox" runat="server" Text='<%# Bind("idRH_Gestor") %>'
                                Visible="False" Width="16px"></asp:TextBox><asp:TextBox ID="idCadastroEmpresaTextBox"
                                    runat="server" Text='<%# Bind("idCadastroEmpresa") %>' Visible="False" Width="7px"></asp:TextBox>
                        <br />
                        Consultor:<br />
                        <asp:DropDownList ID="DDGestor" runat="server" CssClass="DropCadEmp" DataSourceID="SqlGestor"
                            DataTextField="nome" DataValueField="idRH_Gestor"
                            SelectedValue='<%# Bind("idRH_Gestor") %>' 
                            ondatabinding="DDGestor_DataBinding">
                        </asp:DropDownList><br />
                        Vaga:<br />
                        <asp:DropDownList ID="DDidvaga" runat="server" CssClass="DropCadEmp" DataSourceID="SqlVagaGestor"
                            DataTextField="codvaga" DataValueField="idVaga" OnDataBinding="DDidvaga_DataBinding"
                            SelectedValue='<%# Bind("idVaga") %>'>
                        </asp:DropDownList><br />
                        Processo Seletivo (Descrição) Ex.: [PS Vaga Técnico]
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dsProcessoTextBox"
                            Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                        <asp:TextBox ID="dsProcessoTextBox" runat="server" CssClass="InputCadEmp" Text='<%# Bind("dsProcesso") %>'></asp:TextBox><br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Salvar este processo seletivo"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancelar"></asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Você selecionou para edição o processo seletivo [<asp:Label ID="dsProcessoLabel"
                            runat="server" Text='<%# Bind("dsProcesso") %>'></asp:Label>]<br />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Editar a descrição deste processo seletivo"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="Incluir um novo processo seletivo"></asp:LinkButton>
                        |
                        <asp:LinkButton ID="lbCancelar" runat="server" CommandName="Cancel">Cancelar</asp:LinkButton>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <br />
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="Crie um processo seletivo (Clique aqui)"></asp:LinkButton>
                    </EmptyDataTemplate>
                </asp:FormView>
            </td> 
        </tr>
    </table> 
    <br />
    <asp:SqlDataSource ID="SqlProcessoSeletivoView" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idProcessoSeletivo], [idVaga], [idRH_Gestor], [dsProcesso], [data], [idCadastroEmpresa] FROM [tbProcessoSeletivo] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlProcessoSeletivoForm" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        DeleteCommand="DELETE FROM [tbProcessoSeletivo] WHERE [idProcessoSeletivo] = @idProcessoSeletivo"
        InsertCommand="INSERT INTO [tbProcessoSeletivo] ([idVaga], [idRH_Gestor], [dsProcesso], [idCadastroEmpresa]) VALUES (@idVaga, @idRH_Gestor, @dsProcesso, @idCadastroEmpresa)"
        SelectCommand="SELECT [idProcessoSeletivo], [idVaga], [idRH_Gestor], [dsProcesso], [idCadastroEmpresa] FROM [tbProcessoSeletivo] WHERE (([idCadastroEmpresa] = @idCadastroEmpresa) AND ([idProcessoSeletivo] = @idProcessoSeletivo))"
        UpdateCommand="UPDATE [tbProcessoSeletivo] SET [idVaga] = @idVaga, [idRH_Gestor] = @idRH_Gestor, [dsProcesso] = @dsProcesso, [idCadastroEmpresa] = @idCadastroEmpresa WHERE [idProcessoSeletivo] = @idProcessoSeletivo">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:ControlParameter ControlID="idProcessoSeletivolbl" DefaultValue="0" Name="idProcessoSeletivo"
                PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idProcessoSeletivo" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idVaga" Type="Int32" />
            <asp:Parameter Name="idRH_Gestor" Type="Int32" />
            <asp:Parameter Name="dsProcesso" Type="String" />
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
            <asp:Parameter Name="idProcessoSeletivo" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idVaga" Type="Int32" />
            <asp:Parameter Name="idRH_Gestor" Type="Int32" />
            <asp:Parameter Name="dsProcesso" Type="String" />
            <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlProcessoSeletivoViewGestor" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
        SelectCommand="SELECT idProcessoSeletivo, idVaga, idRH_Gestor, dsProcesso, data, idCadastroEmpresa FROM tbProcessoSeletivo WHERE (idCadastroEmpresa = @idCadastroEmpresa) AND (idRH_Gestor = @idRH_Gestor)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlVagaGestor" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
        SelectCommand="SELECT idVaga, codvaga, idRH_Gestor, idCadastroEmpresa FROM vwvaga WHERE (idRH_Gestor = @idRH_Gestor) AND (idCadastroEmpresa = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" Type="Int32" />
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlVaga" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idVaga], [codvaga], [idCadastroEmpresa] FROM [vwvaga] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlGestor" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [idRH_Gestor], [nome], [idCadastroEmpresa] FROM [tbRH_Gestor] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlGestor_Gestor" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        
        SelectCommand="SELECT idRH_Gestor, nome, idCadastroEmpresa FROM tbRH_Gestor WHERE (idCadastroEmpresa = @idCadastroEmpresa) AND (idRH_Gestor = @idRH_Gestor)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:SessionParameter Name="idRH_Gestor" SessionField="idRH_Gestor" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlContadorBaseExclusiva" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [ContadorBase], [idCadastroEmpresa], [nmempresa] FROM [vwRelCandidato_Vaga] WHERE ([idCadastroEmpresa] = @idCadastroEmpresa)">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlContadorBaseGeral" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
        SelectCommand="SELECT [ContadorGeral] FROM [vwRelCandidato_VagaGeral]"></asp:SqlDataSource>
</asp:Content>

