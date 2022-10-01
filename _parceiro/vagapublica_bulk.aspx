<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiro/ParceiroPage.master" AutoEventWireup="false" CodeFile="vagapublica_bulk.aspx.vb" Inherits="_parceiro_vagapublica_bulk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                                        <a href="vagapublica.aspx?menu=3">Cadastro de Vagas</a>
                                        </td>
                                        <td>
                                            <asp:Label ID="separadorLabel5" runat="server" Text="&nbsp;&nbsp;|&nbsp;&nbsp;"></asp:Label>
                                        </td>
                                        <td>
                                            <a href="vagapublica_bulk.aspx?menu=3">Cadastro de Vagas em Lote</a></td>
                                        <td>
                                            <asp:Label ID="separadorLabel6" runat="server" Text="&nbsp;&nbsp;|&nbsp;&nbsp;"></asp:Label>
                                        <td>
                                            <a href="candidatura.aspx?menu=3">Candidaturas vindas do Site</a></td>
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
    <h1><asp:Label ID="Label9" runat="server" Text="Cadastro de Vagas em Lote"></asp:Label></h1>
    <asp:Label ID="LabelCabec" runat="server" CssClass="tituloEmpresa"></asp:Label>
    <br />
    Selecione o arquivo a ser importado<br />
    <asp:FileUpload ID="XLS_BulkVaga" runat="server" CssClass="button" />    <br />
    <asp:Label ID="lbl_ArquivoXLS" runat="server" Visible="False"></asp:Label>
    <br />
    <asp:LinkButton ID="LinkButton_btEnviarArquivo" runat="server" class="button">Upload do Arquivo</asp:LinkButton>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="LinkButton_btDownloadModelo" runat="server" class="button">Fazer Download do Arquivo Modelo</asp:LinkButton>
    <br />
    <br />
    <asp:Label ID="lbl_ResultUpload" runat="server"></asp:Label>
    <br />
    <br />
    <asp:Panel ID="PanelVagas" runat="server" Visible="False">
        Arquivo Carregado: &quot;<asp:Label ID="lbl_FileName" runat="server"></asp:Label>&quot;
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView_Vagas" runat="server" style="text-align: center" 
            AllowSorting="False" >
            <Columns>
                <asp:TemplateField HeaderText="Selecionar">
                    <HeaderTemplate>
                        <asp:CheckBox ID="CheckBox_SelecionarTudo" runat="server" Text="Selecionar" AutoPostBack="True" OnCheckedChanged="chkSelectAll_CheckedChanged" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox_Selecionar" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:LinkButton ID="LinkButton_InsertVaga" runat="server" CssClass="button">Salvar e Publicar Vagas</asp:LinkButton>
    </asp:Panel>
</asp:Content>

