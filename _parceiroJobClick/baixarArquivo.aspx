<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="baixarArquivo.aspx.vb" Inherits="_parceiroJobClick_baixarArquivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Lista do arquivos excel para publicação em massa."></asp:Label>

            <br />
            <br />
            <asp:Menu ID="Menu1" runat="server">
                <Items>
                    <asp:MenuItem NavigateUrl="~/_parceiroJobClick/modelo/Modelo.xls" Text="• Arquivo excel 97 - 2003" ToolTip="Clique aqui para baixar o arquivo padrão." Value="Arquivo excel 97 - 2003"></asp:MenuItem>
                </Items>
            </asp:Menu>

        </div>
    </div>
</asp:Content>

