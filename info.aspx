<%@ Page Language="VB" MasterPageFile="~/MasterPageJobClick.master" AutoEventWireup="false" CodeFile="info.aspx.vb" Inherits="info" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Image ID="cabec" runat="server" ImageUrl="~/images/titInfo.gif" /> 
    <div style="text-align: center; width: 100%">
        <table width="740" cellpadding="0" cellspacing="0" style="margin:auto">
            <tr>
                <td width="40"></td>
                <td width="500">
                    <asp:FormView ID="FormView1" runat="server" 
                        DataKeyNames="idMultimidiaInfoComentario" DataSourceID="SqlComentario" 
                        Width="495px" DefaultMode="Insert" Visible="False">
                        <EditItemTemplate>
                            idMultimidiaInfoComentario:
                            <asp:Label ID="idMultimidiaInfoComentarioLabel1" runat="server" 
                                Text='<%# Eval("idMultimidiaInfoComentario") %>' />
                            <br />
                            idMultimidiaInfo:
                            <asp:TextBox ID="idMultimidiaInfoTextBox" runat="server" 
                                Text='<%# Bind("idMultimidiaInfo") %>' />
                            <br />
                            comentario:
                            <asp:TextBox ID="comentarioTextBox" runat="server" 
                                Text='<%# Bind("comentario") %>' />
                            <br />
                            email:
                            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                            <br />
                            nome:
                            <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
                            <br />
                            data:
                            <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            &nbsp;<asp:TextBox ID="idMultimidiaInfoTextBox" runat="server" 
                                Text='<%# Bind("idMultimidiaInfo") %>' Visible="False" Width="16px" />
                            <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>' 
                                Visible="False" Width="17px" />
                            <br />
                            <b>Faça seu comentário: </b>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="comentarioTextBox" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="comentarioTextBox" runat="server" 
                                Text='<%# Bind("comentario") %>' CssClass="InputCad" Height="72px" 
                                TextMode="MultiLine" Width="476px" />
                            <br />
                            Seu e-mail: (Não será publicado)
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="emailTextBox" Display="Dynamic" 
                                ErrorMessage="* Embora não será publicado é obrigatório...."></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="emailTextBox" Display="Dynamic" 
                                ErrorMessage=" Ahh... e tem que ser verdadeiro!" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            <br />
                            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' 
                                CssClass="InputCad" Width="475px" />
                            <br />
                            Nome: (Pode ser um nome fictício)<asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator3" runat="server" ControlToValidate="nomeTextBox" 
                                Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' 
                                CssClass="InputCad" Width="475px" />
                            <br />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                CommandName="Insert" Text="Enviar seu comentário" />
                            &nbsp;|&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancelar" 
                                onclick="InsertCancelButton_Click" />
                            <br />
                            <br />
                            <br />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            idMultimidiaInfoComentario:
                            <asp:Label ID="idMultimidiaInfoComentarioLabel" runat="server" 
                                Text='<%# Eval("idMultimidiaInfoComentario") %>' />
                            <br />
                            idMultimidiaInfo:
                            <asp:Label ID="idMultimidiaInfoLabel" runat="server" 
                                Text='<%# Bind("idMultimidiaInfo") %>' />
                            <br />
                            comentario:
                            <asp:Label ID="comentarioLabel" runat="server" 
                                Text='<%# Bind("comentario") %>' />
                            <br />
                            email:
                            <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                            <br />
                            nome:
                            <asp:Label ID="nomeLabel" runat="server" Text='<%# Bind("nome") %>' />
                            <br />
                            data:
                            <asp:Label ID="dataLabel" runat="server" Text='<%# Bind("data") %>' />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Edit" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                CommandName="Delete" Text="Delete" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                CommandName="New" Text="New" />
                        </ItemTemplate>
                    </asp:FormView>
                </td>
                <td width="200"></td>
            </tr>
        </table> 
        <table width="740" cellpadding="0" cellspacing="0" style="margin:auto">
        <tr>
            <td width="40"></td> 
            <td width="500" style="padding-right: 10px;">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BorderStyle="None" DataKeyNames="idMultimidiaInfoCategoria" 
                    DataSourceID="SqlCategoria" GridLines="None" ShowHeader="False" Width="495px">
                    <Columns>
                        <asp:BoundField DataField="idMultimidiaInfoCategoria" 
                            HeaderText="idMultimidiaInfoCategoria" InsertVisible="False" ReadOnly="True" 
                            SortExpression="idMultimidiaInfoCategoria" Visible="False" />
                        <asp:BoundField DataField="dsCategoria" HeaderText="dsCategoria" 
                            SortExpression="dsCategoria">
                            <ItemStyle CssClass="tituloZoya" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <br />
                <asp:Label ID="HTML" runat="server"></asp:Label><br /><br /></td>
            <td width="200" valign="top" style="border-left: 1px solid gray">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlCategoriaTodas">
                <ItemTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" width="200" id="lateral">
	                    <tr>
		                    <td width="190" ><a href="info.aspx?idMultimidiaInfoCategoria=<%#Eval("idMultimidiaInfoCategoria") %>"><%#Eval("dsCategoria")%></a></td>
	                    </tr>
                    </table>
                    <table cellpadding="1" cellspacing="1" border="0" cellpadding="0" cellspacing="0" width="200" id="Table1">
	                    <tr>
		                    <td valign="top" width="10"></td>
		                    <td width="190" ></td>
	                    </tr>
                    </table>                    
                </ItemTemplate>
                </asp:Repeater>
            </td>
        </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlCategoria" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        
        SelectCommand="SELECT [idMultimidiaInfoCategoria], [dsCategoria] FROM [tbMultimidiaInfoCategoria] WHERE ([idMultimidiaInfoCategoria] = @idMultimidiaInfoCategoria)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="idMultimidiaInfoCategoria" 
                QueryStringField="idMultimidiaInfoCategoria" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlCategoriaTodas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        SelectCommand="SELECT [idMultimidiaInfoCategoria], [dsCategoria] FROM [tbMultimidiaInfoCategoria]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlComentario" runat="server" 
        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
        DeleteCommand="DELETE FROM [tbMultimidiaInfoComentario] WHERE [idMultimidiaInfoComentario] = @idMultimidiaInfoComentario" 
        InsertCommand="INSERT INTO [tbMultimidiaInfoComentario] ([idMultimidiaInfo], [comentario], [email], [nome], [data]) VALUES (@idMultimidiaInfo, @comentario, @email, @nome, @data)" 
        SelectCommand="SELECT [idMultimidiaInfoComentario], [idMultimidiaInfo], [comentario], [email], [nome], [data] FROM [tbMultimidiaInfoComentario] WHERE ([idMultimidiaInfo] = @idMultimidiaInfo)" 
        UpdateCommand="UPDATE [tbMultimidiaInfoComentario] SET [idMultimidiaInfo] = @idMultimidiaInfo, [comentario] = @comentario, [email] = @email, [nome] = @nome, [data] = @data WHERE [idMultimidiaInfoComentario] = @idMultimidiaInfoComentario">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="idMultimidiaInfo" 
                QueryStringField="idMultimidiaInfo" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idMultimidiaInfoComentario" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="idMultimidiaInfo" Type="Int32" />
            <asp:Parameter Name="comentario" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter Name="data" Type="DateTime" />
            <asp:Parameter Name="idMultimidiaInfoComentario" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="idMultimidiaInfo" Type="Int32" />
            <asp:Parameter Name="comentario" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter Name="data" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

