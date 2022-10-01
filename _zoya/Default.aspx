<%@ Page Language="VB" MasterPageFile="~/_zoya/zoyaLogin.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_zoya_Default" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <table align="center" cellpadding="0" cellspacing="0" width="550px">
        <tr>
            <td>
                <asp:Label ID="LabelZoya" runat="server" CssClass="tituloZoya" 
                    Text="Zoya:) o seu Marketing Pessoal"></asp:Label>
                <br />
                <br />
                Marketing Pessoal hoje, é a ferramenta mais eficiente de fazer com que seus 
                pensamentos e atitudes, sua apresentação e comunicação, trabalhem a seu favor no 
                ambiente profissional. Além desses detalhes o cuidado com a ética e a capacidade 
                de liderar, a habilidade de se auto-motivar e de motivar as pessoas a sua volta, 
                também fazem parte do Marketing Pessoal.
                <br />
                <br />
                As empresas de hoje analisam muito mais do que sua experiência profissional. A 
                preocupação com o capital intelectual e a ética, são fundamentais na definição 
                do perfil daqueles que serão parceiros/colaboradores.<br />
                <br />
                O seu profile no Zoya:) poderá de acordo com sua vontade ser apresentado 
                juntamente com o seu CV. Poderá ser utilizado também como uma poderosa 
                ferramenta para profissionais liberais em busca de projetos, serviços e empresas 
                interessadas em contratação via PJ.<br />
                <br />
                <b>• Para ter seu profile no Zoya:) é necessario ter uma conta no JobClick.<br />
                • Crie sua conta agora [<a href="/_anonimo/cadastroCandidato.aspx">clique aqui</a>] e preencha os dados para seu acesso.<br />
                <br />
                • Já tem sua conta de acesso no JobClick?<br />
                - Então utilize o formulário abaixo para iniciar ou ter acesso ao seu profile.<br />
                </b>
                <br />
                                                </td>
        </tr>
        <tr>
            <td>
                <table align="center" width="300px" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <br />Usuário:<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="txtusername"
                    Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtusername" runat = "server" CssClass="InputCad" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Senha:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpwd"
                    Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtpwd" runat = "server" TextMode="Password" CssClass="InputCad" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            E-Mail:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtemail"
                    Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                        ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail"
                        Display="Dynamic" ErrorMessage="* Informe um e-mail válido!" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtemail" runat="server" CssClass="InputCad"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/20px.gif" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                Se você ainda não tem uma conta de acesso em nosso sistema [<asp:HyperLink ID="HyperLink1"
                    runat="server" NavigateUrl="~/_anonimo/cadastroCandidato.aspx">clique aqui</asp:HyperLink>
                            ]
                para iniciar agora mesmo.<br />&nbsp;<br />
                            <asp:ImageButton ID="btnLogin" runat="server" 
                                ImageUrl="~/images/loginZoya.gif" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblDica" runat="server" 
                                
                                Text="&lt;b&gt;Atenção:&lt;/b&gt;&lt;br&gt;Utilize sua conta no JobClick para acessar ou criar o seu profile no Zoya..."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 13px">
                            <br />
                            <asp:Label ID="lblError" runat="server" CssClass="mensagem" Width="350px"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

