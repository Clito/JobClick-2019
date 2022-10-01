<%@ Page Title="" Language="VB" MasterPageFile="~/_admin/AdminMasterPageJobClick.master" AutoEventWireup="false" CodeFile="avisoHomePage.aspx.vb" Inherits="_admin_avisoHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table id="Aviso" width="100%">
    <tr>
        <td><asp:Label ID="LabelCabec" runat="server" CssClass="titulo" 
        Text="Avisos na HOME"></asp:Label>
            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="idAviso" 
                DataSourceID="SqlAvisosHOME">
                <EditItemTemplate>
                    Mensagem:
                    <br />
                    <asp:TextBox ID="dsMensagemTextBox" runat="server" CssClass="InputCad" 
                        Height="100px" Text='<%# Bind("dsMensagem") %>' TextMode="MultiLine" />
                    <br />
                    Inicio:
                    <br />
                    <asp:TextBox ID="dtInicioTextBox" runat="server" CssClass="InputCad" 
                        Text='<%# Bind("dtInicio") %>' />
                    <br />
                    Fim:
                    <br />
                    <asp:TextBox ID="dtFimTextBox" runat="server" CssClass="InputCad" 
                        Text='<%# Bind("dtFim") %>' />
                    <br />
                    <br />
                    <asp:CheckBox ID="flgApresentaCheckBox" runat="server" 
                        Checked='<%# Bind("flgApresenta") %>' Text="Apresentar" />
                    <br />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Salvar" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Mensagem:
                    <br />
                    <asp:TextBox ID="dsMensagemTextBox" runat="server" CssClass="InputCad" 
                        Height="100px" Text='<%# Bind("dsMensagem") %>' TextMode="MultiLine" />
                    <br />
                    Inicio:
                    <br />
                    <asp:TextBox ID="dtInicioTextBox" runat="server" CssClass="InputCad" 
                        Text='<%# Bind("dtInicio") %>' />
                    <br />
                    Fim:
                    <br />
                    <asp:TextBox ID="dtFimTextBox" runat="server" CssClass="InputCad" 
                        Text='<%# Bind("dtFim") %>' />
                    <br />
                    <br />
                    <asp:CheckBox ID="flgApresentaCheckBox" runat="server" 
                        Checked='<%# Bind("flgApresenta") %>' Text="Apresentar" />
                    <br />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Salvar" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancelar" />
                </InsertItemTemplate>
                <ItemTemplate>
                    Mensagem:
                    <br />
                    <asp:Label ID="dsMensagemLabel" runat="server" 
                        Text='<%# Bind("dsMensagem") %>' />
                    <br />
                    <br />
                    Inicio:<br />
                    <asp:Label ID="dtInicioLabel" runat="server" Text='<%# Bind("dtInicio") %>' />
                    <br />
                    Fim:<br />
                    <asp:Label ID="dtFimLabel" runat="server" Text='<%# Bind("dtFim") %>' />
                    <br />
                    <br />
                    <asp:CheckBox ID="flgApresentaCheckBox" runat="server" 
                        Checked='<%# Bind("flgApresenta") %>' Enabled="false" Text="Apresentar" />
                    <br />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Editar" />
&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Excluir" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                        CommandName="New" Text="Nova Mensagem" />
                </ItemTemplate>
            </asp:FormView>
            <br />
    <br />
            <asp:SqlDataSource ID="SqlAvisosHOME" runat="server" 
                ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                DeleteCommand="DELETE FROM [tbAviso] WHERE [idAviso] = @idAviso" 
                InsertCommand="INSERT INTO [tbAviso] ([dsMensagem], [dtInicio], [dtFim], [flgApresenta]) VALUES (@dsMensagem, @dtInicio, @dtFim, @flgApresenta)" 
                SelectCommand="SELECT [idAviso], [dsMensagem], [dtInicio], [dtFim], [flgApresenta] FROM [tbAviso]" 
                UpdateCommand="UPDATE [tbAviso] SET [dsMensagem] = @dsMensagem, [dtInicio] = @dtInicio, [dtFim] = @dtFim, [flgApresenta] = @flgApresenta WHERE [idAviso] = @idAviso">
                <DeleteParameters>
                    <asp:Parameter Name="idAviso" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="dsMensagem" Type="String" />
                    <asp:Parameter Name="dtInicio" Type="DateTime" />
                    <asp:Parameter Name="dtFim" Type="DateTime" />
                    <asp:Parameter Name="flgApresenta" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="dsMensagem" Type="String" />
                    <asp:Parameter Name="dtInicio" Type="DateTime" />
                    <asp:Parameter Name="dtFim" Type="DateTime" />
                    <asp:Parameter Name="flgApresenta" Type="Boolean" />
                    <asp:Parameter Name="idAviso" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
    <br /></td>
    </tr>
</table>
</asp:Content>

