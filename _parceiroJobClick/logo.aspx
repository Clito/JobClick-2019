<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" AutoEventWireup="false" CodeFile="logo.aspx.vb" Inherits="_parceiroJobClick_logo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $("#<%=PanelAvisoSucesso.ClientID%>").dialog({ closeText: '', width: '600', title: "Aviso", position: "top", show: { effect: 'drop', direction: "up" } });
            setTimeout(function () {
                $("#<%=PanelAvisoSucesso.ClientID%>").dialog('close')
            }, 2000);
        });
	</script>
                 <asp:Panel ID="PanelAvisoSucesso" runat="server" Visible="False">
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
    <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Envie a logo da sua empresa"></asp:Label>

            <br />
            <br />
            <asp:Label ID="informeLabel" runat="server" Text="A logomarca da sua empresa poderá ser apresentada juntamente com todos os anúncios de oferta de emprego cadastrados no &lt;b&gt;Jobclick&lt;/b&gt;, nas vagas patrocinadas e nos detalhes de cada vaga. Para enviar a sua logomarca, &lt;b&gt;&lt;i&gt;basta preparar um arquivo no formato [.png]&lt;/i&gt;&lt;/b&gt; nas seguintes dimensões: 100px x 80px.&lt;br&gt;&lt;i&gt;&lt;b&gt;Obs.: &lt;/b&gt;Após a aprovação de nossos analistas a imagem será liberada para divulgação.&lt;/i&gt; "></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <asp:GridView ID="GridViewLOGO" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceLOGO" GridLines="None" ShowHeader="False">
                <Columns>
                    <asp:TemplateField HeaderText="logoVaga" SortExpression="logoVaga">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("logoVaga") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("logoVaga", "/images/buscador/{0}")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUploadLOGO" ErrorMessage="(*) Informe qual a imagem."></asp:RequiredFieldValidator>
            <br />
            <asp:FileUpload ID="FileUploadLOGO" runat="server" CssClass="simple" Width="300px" />
            <br />
            <br />
            <asp:LinkButton ID="LinkButtonENVIAR" runat="server" CssClass="button">Enviar logomarca</asp:LinkButton>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceLOGO" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_AD_LOGO_EMPRESA" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idcadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
                    <asp:Parameter DefaultValue="0" Name="URLlogo" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </div>
</asp:Content>

