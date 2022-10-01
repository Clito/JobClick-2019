<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="termo.aspx.vb" Inherits="_parceiroJobClick_termo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Termos e Condições de uso"></asp:Label>
                <br />
            <br />
                <table>
                    <tr>
                        <td>
                            <asp:DataList ID="DataListContrato" runat="server" DataKeyField="idContratoOnline" DataSourceID="SqlContrato">
                                <ItemTemplate>
                                    <asp:TextBox ID="TextBoxContrato" runat="server" CssClass="simple" Height="400px" Text='<%# Eval("ContratoOnLine") %>' TextMode="MultiLine" Width="850px"></asp:TextBox>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                </table>
            <br />
                <asp:SqlDataSource ID="SqlContrato" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    DeleteCommand="DELETE FROM [tbContratoOnLine] WHERE [idContratoOnline] = @idContratoOnline" 
                    InsertCommand="INSERT INTO [tbContratoOnLine] ([idSetup], [ContratoOnLine], [Modelo]) VALUES (@idSetup, @ContratoOnLine, @Modelo)" 
                    SelectCommand="SELECT idContratoOnline, idSetup, ContratoOnLine, Modelo FROM tbContratoOnLine WHERE (idSetup = @idSetup) AND (Modelo = 'CadastroEmpresa')" 
                    UpdateCommand="UPDATE [tbContratoOnLine] SET [idSetup] = @idSetup, [ContratoOnLine] = @ContratoOnLine, [Modelo] = @Modelo WHERE [idContratoOnline] = @idContratoOnline">
                    <DeleteParameters>
                        <asp:Parameter Name="idContratoOnline" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idSetup" Type="Int32" />
                        <asp:Parameter Name="ContratoOnLine" Type="String" />
                        <asp:Parameter Name="Modelo" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="idSetup" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idSetup" Type="Int32" />
                        <asp:Parameter Name="ContratoOnLine" Type="String" />
                        <asp:Parameter Name="Modelo" Type="String" />
                        <asp:Parameter Name="idContratoOnline" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </div>
</asp:Content>

