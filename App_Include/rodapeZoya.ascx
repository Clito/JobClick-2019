<%@ Control Language="VB" AutoEventWireup="false" CodeFile="rodapeZoya.ascx.vb" Inherits="App_Include_rodapeZoya" %>
<table border="0" width="750" id="navegador">
	<tr>
		<td><asp:Image ID="Image0" runat="server" ImageUrl="~/images/layout/home.gif" /></td>
		<td>    
                <asp:LinkButton ID="LinkButton1" runat="server" 
                    PostBackUrl="/" CausesValidation="False">Home</asp:LinkButton>
		</td>
		<td></td>
		<td></td>
		<td></td>
		<td>
            <asp:Image ID="Image7" runat="server" ImageUrl="~/images/rplzoya.gif" 
                ImageAlign="Right" />
        </td>
		<td>
            &nbsp;</td>
	</tr>
	<tr>
		<td><asp:Image ID="Image1" runat="server" ImageUrl="~/images/layout/setalat.gif" /></td>
		<td>    
                <asp:LinkButton ID="LinkButton2" runat="server" 
                    PostBackUrl="~/_anonimo/cadastroCandidato.aspx" CausesValidation="False">Cadastre grátis seu CV</asp:LinkButton>
		</td>
		<td><asp:Image ID="Image2" runat="server" ImageUrl="~/images/layout/setalat.gif" /></td>
		<td>
                <asp:LinkButton ID="LinkButton3" runat="server" 
                    PostBackUrl="~/_anonimo/cadastroEmpresa.aspx" CausesValidation="False">Cadastre sua empresa</asp:LinkButton>
		</td>
		<td><asp:Image ID="Image3" runat="server" ImageUrl="~/images/layout/setalat.gif" /></td>
		<td>
                <asp:LinkButton ID="LinkButton4" runat="server" 
                    PostBackUrl="~/_candidato/" CausesValidation="False">Acesso para candidatos cadastrados</asp:LinkButton>
		</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><asp:Image ID="Image5" runat="server" ImageUrl="~/images/layout/setalat.gif" /></td>
		<td>    
                <asp:LinkButton ID="LinkButton6" runat="server" 
                    PostBackUrl="~/_anonimo/vagas.aspx" CausesValidation="False">Vagas publicadas</asp:LinkButton>
		</td>
		<td><asp:Image ID="Image6" runat="server" ImageUrl="~/images/layout/setalat.gif" /></td>
		<td>    
                <asp:LinkButton ID="LinkButton7" runat="server" 
                    PostBackUrl="~/_anonimo/cadastroCandidato.aspx" 
                CausesValidation="False">Zoya (Cadastro)</asp:LinkButton>
		</td>
		<td><asp:Image ID="Image4" runat="server" ImageUrl="~/images/layout/setalat.gif" /></td>
		<td>
                <asp:LinkButton ID="LinkButton5" runat="server" 
                    PostBackUrl="~/_empresa/" CausesValidation="False">Publicar vagas</asp:LinkButton>
            </td>
		<td></td>
	</tr>	
</table>
