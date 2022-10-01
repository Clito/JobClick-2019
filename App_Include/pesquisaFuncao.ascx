<%@ Control Language="VB" AutoEventWireup="false" CodeFile="pesquisaFuncao.ascx.vb" Inherits="App_Include_pesquisaFuncao" %>
<table cellpadding="0" cellspacing="0">
    <tr>
        <td>
Pesquise aqui a função:
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
    Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" ValidationGroup="PsqFn"></asp:RequiredFieldValidator><br />
<table cellpadding="0" cellspacing="0" style="color: #000000">
    <tr>
        <td>
<asp:TextBox ID="TextBox1" runat="server" CssClass="InputCadEmp"
    MaxLength="255" Width="265px" ValidationGroup="PsqFn"></asp:TextBox>&nbsp;</td>
        <td>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/candidato/btpesquisar.gif" ValidationGroup="PsqFn" /></td>
    </tr>
</table>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox1"
                Display="Dynamic" ErrorMessage="* Inicie sua pesquisa com no mínimo 5 caracteres"
                SetFocusOnError="True" ValidationExpression="^[a-zA-Z0-9!¡$%&/\()=?¿*+-_{};:,áéíóú'.\s][^>][^<]{3,50}$"
                ValidationGroup="PsqFn"></asp:RegularExpressionValidator><br />
Funções encontradas na pesquisa:<br />
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="DropCadEmp"
    DataSourceID="SqlDataSourcePsq" DataTextField="dsfuncao" DataValueField="idfuncao">
</asp:DropDownList>
<asp:Label ID="resTxt" runat="server" Visible="False"></asp:Label>
            <br />
            <asp:Label ID="lblCabecFnc" runat="server" Text="Função selecionada:" Visible="False"></asp:Label>
            <br />
<asp:DropDownList ID="DropDownList2" runat="server" CssClass="DropCadEmp" Visible="False">
</asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSourcePsq" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>"
    SelectCommand="spGetFuncao" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="TextBox1" Name="buscador" PropertyName="Text"
            Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
        </td>
    </tr>
</table>
