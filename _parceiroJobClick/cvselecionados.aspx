<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="cvselecionados.aspx.vb" Inherits="_parceiroJobClick_cvselecionados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelFormEmail.ClientID%>").dialog({ closeText: '', width: '800', title: "Contato com o(a) candidato(a)", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
        });
	</script>
     <script type="text/javascript">
         function GetMensagem() {
             $("input[id$='inpHideTextArea']").val($("#<%=TextBoxMENSAGEM.ClientID%>").val());
         }
    </script>
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAviso.ClientID%>").dialog({ closeText: '', width: '500', title: "Aviso", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
            setTimeout(function () {
                $("#<%=PanelAviso.ClientID%>").dialog('close')
            }, 2000);
        });
	</script>
                 <asp:Panel ID="PanelAviso" runat="server" Visible="False">
                    <table id="Table1" align="center" cellpadding="5" cellspacing="5">
                        <tr>
                            <td align="center">
                                <asp:Image ID="ImageAVISO" runat="server" 
                                    ImageUrl="~/_parceiroJobClick/images/ok.jpg" />
                            </td>
                            <td align="center">
                                <asp:Label ID="AVISOLABEL" runat="server" CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                        <asp:Panel ID="PanelFormEmail" runat="server" Visible="False">
                            <div id="AVISOTABELA">

                                <asp:Label ID="LabelNomeCandidato" runat="server" Text="Mensagem será enviada para: "></asp:Label>

                                <br />

                                <asp:Label ID="nomeLabel" runat="server" Font-Bold="True"></asp:Label>
                                <br />
                                <asp:Label ID="Label2" runat="server" Text="Será utilizado o seguinte e-mail: "></asp:Label>
                                <br />
                                <asp:Label ID="emailLabel" runat="server" Font-Bold="True"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="nomeResLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="AVISOPARAEMPRESALabel" runat="server" Text="&lt;b&gt;Obs.:&lt;/b&gt; Não será necessário informar o e-mail para a resposta, porém se desejar marcar uma entrevista com o candidato por favor informe o endereço da sua empresa para o candidato."></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="emailResLabel" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="Label1" runat="server" Text="Escreva abaixo sua mensagem:" Font-Bold="True"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxMENSAGEM" ErrorMessage="*" ValidationGroup="MENSAGEM"></asp:RequiredFieldValidator>
                                <br />
                                <asp:TextBox ID="TextBoxMENSAGEM" runat="server" CssClass="simple" Height="200px" TextMode="MultiLine" Width="90%" ValidationGroup="MENSAGEM"></asp:TextBox>
                                <br />
                                <br />
                                <asp:LinkButton ID="LinkButtonEnviarMensagem" runat="server" onclientclick="GetMensagem();" CssClass="button" ToolTip="Escreva sua mensagem ao candidato e clique aqui para enviar" ValidationGroup="MENSAGEM">Enviar mensagem</asp:LinkButton>
                                <br />
                                <br />

                                <asp:DataList ID="DataListTELEFONE" runat="server" DataSourceID="SqlDataSourceTELEFONE" RepeatDirection="Horizontal" Width="90%">
                                    <ItemTemplate>
                                        <asp:Label ID="Column1Label" runat="server" CssClass="textoApresentaCV" Text='<%# Eval("TELEFONE") %>' />
                                    </ItemTemplate>
                                </asp:DataList>

                            </div>
                        </asp:Panel>
    <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="(CVs) Seus Contatos Favoritos"></asp:Label>

            <asp:Label ID="idcurriculoLabel" runat="server" Visible="False"></asp:Label>
            <input id="inpHideTextArea" type="hidden" runat="server" />

            <br />
            <asp:Label ID="LabelAviso" runat="server" Text="Abaixo está a lista de todos os CVs liberados as formas de contato com o candidato."></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridViewCVs" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="mGrid" DataSourceID="SqlDataSourceCVS" DataKeyNames="email,nome,idcurriculo,emailRes,nomeRes">
                <AlternatingRowStyle CssClass="alt" />
                <Columns>
                    <asp:BoundField DataField="nome" HeaderText="Candidato" ReadOnly="True" SortExpression="nome" />
                    <asp:ButtonField CommandName="Select" DataTextField="email" HeaderText="E-mail" Text="Button" />
                    <asp:BoundField DataField="cep" HeaderText="CEP" SortExpression="cep" Visible="False" />
                    <asp:BoundField DataField="bairro" HeaderText="Bairro" SortExpression="bairro" Visible="False" />
                    <asp:BoundField DataField="cidade" HeaderText="Cidade" SortExpression="cidade" />
                    <asp:BoundField DataField="CONTATO" HeaderText="CONTATO" ReadOnly="True" SortExpression="CONTATO" Visible="False" />
                    <asp:BoundField DataField="idCadastroEmpresaComprou" HeaderText="idCadastroEmpresaComprou" SortExpression="idCadastroEmpresaComprou" Visible="False" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButtonEnviaEmail" runat="server" CommandName="Select" ImageUrl="images/ContactUs.png" ToolTip='<%# Eval("nome", "Clique aqui para enviar e-mail para {0}") %>' />
                        </ItemTemplate>
                        <ItemStyle Width="96px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="idcurriculo" HeaderText="idcurriculo" InsertVisible="False" ReadOnly="True" SortExpression="idcurriculo" Visible="False" />
                    <asp:BoundField DataField="emailRes" HeaderText="emailRes" SortExpression="emailRes" Visible="False" />
                    <asp:BoundField DataField="nomeRes" HeaderText="nomeRes" SortExpression="nomeRes" Visible="False" />
                </Columns>
                <EmptyDataTemplate>
                    <asp:Label ID="LabelAvisoEmpty" runat="server" Text="<b><i>Não existem currículos em sua lista de contatos!</i></b><br><br>(*) Nesta área os candidatos selecionados serão listados, você poderá enviar e-mails ou utilizar os dados para contato para se comunicar com os candidatos diretamente desta página."></asp:Label>
                </EmptyDataTemplate>
                <PagerStyle CssClass="pgr" />
            </asp:GridView>
            <br />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSourceCVS" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_CVs_COMPRADOS" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceTELEFONE" runat="server" 
                                                                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                                                                        SelectCommand="_USP_CURRICULO_TELEFONE_PARCEIRO_VENDA" 
                                                                        SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idCurriculoLabel" Name="idcurriculo" 
                                                                                PropertyName="Text" Type="Int32" />
                    <asp:Parameter DefaultValue="1" Name="liberaLeituraCompleta" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
 
        </div>
    </div>
</asp:Content>

