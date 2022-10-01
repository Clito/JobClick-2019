<%@ Control Language="VB" AutoEventWireup="false" CodeFile="bannerControlEmpresa.ascx.vb" Inherits="App_Include_bannerControlEmpresa" %>
<asp:Label ID="StatusLog" runat="server"></asp:Label>
<table id="BannerEmpresa" align="center" cellpadding="0" cellspacing="0" 
    class="CreditoBG" width="100%">
    <tr>
        <td align="left">
            <table id="SubBanner" align="left" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="left">
                                    
                        &nbsp;</td>
                    <td align="left">
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="EmpresaLabel" runat="server"></asp:Label>
                                    </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="SInome" runat="server"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="SData" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="ExtratoSaldoLabel" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

        <asp:DataList ID="DataListEmpresaFilha" runat="server" 
            DataKeyField="idCadastroEmpresa" DataSourceID="SqlEmpresaFilha" Width="100%">
            <ItemTemplate>
                <asp:Label ID="EmpresaLabel0" runat="server" 
                    Text="Você está trabalhando com a empresa: "></asp:Label>
                <asp:Label ID="nmempresaLabel" runat="server" Font-Bold="True" 
                    Text='<%# Eval("nmempresa") %>' ForeColor="#499300" />
            </ItemTemplate>
        </asp:DataList>
    
        <asp:SqlDataSource ID="SqlEmpresaFilha" runat="server" 
            ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
            SelectCommand="SELECT idCadastroEmpresa, nmempresa, idCadastroEmpresa_Pai FROM tbCadastroEmpresa WHERE (idCadastroEmpresa_Pai = @idCadastroEmpresa_Pai) AND (idCadastroEmpresa = @idCadastroEmpresa)">
            <SelectParameters>
                <asp:SessionParameter Name="idCadastroEmpresa_Pai" 
                    SessionField="idCadastroEmpresa" Type="Int32" />
                <asp:SessionParameter Name="idCadastroEmpresa" 
                    SessionField="idCadastroEmpresaFilha" />
            </SelectParameters>
        </asp:SqlDataSource>
        

