<%@ Page Title="" Language="VB" MasterPageFile="~/_parceiroJobClick/parceiroMasterPage.master" ValidateRequest="false" AutoEventWireup="false" CodeFile="vagaPatrocinada.aspx.vb" Inherits="_parceiroJobClick_vagaPatrocinada" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script type="text/javascript">
         $(function () {
             $("#<%=SOBREVAGAPATROCINADA.ClientID%>").dialog
            ({ closeText: '', width: '820', title: "Sobre vaga patrocinada", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
         });         
	</script>

     <script type="text/javascript">
         $(function () {
             $("#<%=PanelCredito.ClientID%>").dialog
            ({ closeText: '', width: '820', title: "Compre seus créditos de forma rápida e segura!", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
         });
	</script>

    <script type="text/javascript">
             $(function () {
                 $("#<%=BOLETO.ClientID%>").dialog
            ({ closeText: '', width: '820', title: "Forma de pagamento", position: "top", show: { effect: 'drop', direction: "up" }, hide: { effect: 'drop', direction: "up" } });
         });
	</script>

    <script type="text/javascript">
             function GetValor() {
                 $("input[id$='inpHideTextArea']").val($("#<%=TextBoxValor.ClientID%>").val());
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
     <script type="text/javascript">
         function GetFormaPagamento() {
             $("input[id$='inpHideFormaP']").val($("#<%=RadioButtonListFormadepagamento.ClientID%>").val());
         }
    </script>
        <asp:Panel ID="PanelAviso" runat="server" Visible="False">
        <table id="AVISOTABELA" align="center" cellpadding="5" cellspacing="5">
            <tr>
                <td align="center">
                    <asp:Image ID="Image1" runat="server" 
                        ImageUrl="~/_parceiroJobClick/images/ok.jpg" />
                </td>
                <td align="center">
                    <asp:Label ID="AVISOLABEL" runat="server" CssClass="textoProcessoSeletivoABERTO"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel ID="BOLETO" runat="server" Visible="False">
        <input id="inpHideFormaP" type="hidden" runat="server" />
        <asp:Label ID="LabelBoletoCabec" runat="server" Text="Escolha abaixo a forma de pagamento" CssClass="titulo"></asp:Label>
        <br />
        <br />
        <div id="DivBOLETO">
            <asp:Label ID="AvisoBoletoLabel" runat="server" Text="&lt;b&gt;Escolha a formas de pagamento para sua empresa.&lt;/b&gt; Após a confirmação do pagamento o sistema irá liberar o valor imediatamente para a divulgação desta vaga, caso escolha emissão de boleto o mesmo será enviado para o e-mail: &lt;b&gt;#1#&lt;/b&gt;."></asp:Label>
            <br />
            <br />
            <asp:RadioButtonList ID="RadioButtonListFormadepagamento" runat="server" RepeatDirection="Horizontal" Width="100%">
                <asp:ListItem Selected="True" Value="0">PagSeguro UOL</asp:ListItem>
                <asp:ListItem Value="1">Emissão de Boleto</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <br />
            <br />
            <asp:LinkButton ID="LinkButtonImprimirBoleto" runat="server" CssClass="button">Sim, quero continuar</asp:LinkButton>
            <br />
            <br />
            <br />
        </div>

    </asp:Panel>

    <asp:Panel ID="PanelCredito" runat="server" Visible="False">
        <div id="Div1" class="AD">
            <div id="Div2" class="ImageAD">
                <asp:Image ID="ImageCredito" runat="server" ImageUrl="~/_parceiroJobClick/images/publicidade AD/creditos.png" /></div>
            <div id="Div3" class="TextAD">
                <asp:Label ID="LabelRecado" runat="server" Text="&lt;br&gt;&lt;b&gt;&quot;Sabemos como é difícil a decisão de pagar um serviço pela rede mundial de computadores.&lt;/b&gt;&lt;br&gt;&lt;br&gt;E é por isso que utilizamos o sistema PagSeguro da UOL, com ele você tem 14 dias para bloquear o pagamento caso o serviço não seja liberado, ou não esteja de acordo com o combinado. E mais, permite a sincronização automática entre pagamentos e liberação dos serviços, todas as suas transações estarão em seu extrato, sem você precisar do convênio com bancos ou administradoras. Com a confirmação automática o serviço será liberado imediatamente.&lt;br&gt;&lt;br&gt;Informamos que a relação de (R$) reais e créditos e de 1 para 1, ou seja, 1(um) real para 1(um) crédito. Você divulga a sua oportunidade de emprego e avalia nossa solução.&lt;br&gt;&lt;br&gt;O &lt;b&gt;valor mínimo&lt;/b&gt; para compra é de &lt;b&gt;R$ 20,00&lt;/b&gt; (vinte Reais) ou seja 20 (vinte Créditos), que serão depositados em sua conta para usar neste e em outros serviços que disponibilizamos para você."></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label22" runat="server" Text="Quantidade de créditos:"></asp:Label>
                <br />
                <asp:TextBox ID="TextBoxValor" runat="server" onkeyup="formataValor(this,event);" style="text-align:left" CssClass="simple" Width="251px" MaxLength="10">20,00</asp:TextBox>
                <asp:LinkButton ID="LinkButtonBOLETO" runat="server" onclientclick="GetValor();" CssClass="button">Emitir boleto</asp:LinkButton>
            </div>
        </div>
     </asp:Panel> 

    <asp:Panel ID="SOBREVAGAPATROCINADA" runat="server" Visible="False">
        <div id="AD" class="AD">
            <div id="ImageAD" class="ImageAD">
                <asp:Image ID="ImageAviso" runat="server" ImageUrl="~/_parceiroJobClick/images/publicidade AD/lupa.png" /></div>
            <div id="TextAD" class="TextAD"><asp:Label ID="LabelSobre" runat="server" Text="&lt;br&gt;Com a divulgação orientada, a sua publicação terá alcance a um número de candidatos em determinado local de destino selecionado com base em cookies exclusivos. Você pode usar os números fornecidos para ter uma ideia de quantos candidatos seu anúncio de emprego podem alcançar em uma área geográfica.&lt;br&gt;&lt;br&gt;Com a divulgação orientada, você pode estimar quantos candidatos podem ver seu anúncio de emprego no Paraná ou em Minas Gerais, bem como comparar o número de pessoas que podem ver seu anúncio de emprego em São Paulo e em Porto Alegre. Você pode usar essas estimativas para identificar se está segmentando as regiões certas ou se precisa selecionar outras regiões que podem oferecer o nível certo de exposição.&lt;br&gt;&lt;br&gt;Com as Vagas Patrocinadas, o filtro &quot;localidade&quot; já será aplicado, além de ter uma divulgação focada e em destaque."></asp:Label></div>
        </div>
     </asp:Panel> 
 
    <div id="conteudo">
        <div id="corpoformulario">
            <asp:Label ID="LabelCabec" runat="server" CssClass="titulo" Text="Vagas Patrocinadas"></asp:Label>

        &nbsp;<asp:Label ID="mes" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="ano" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="TransacaoIDLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="emailAdminLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="tokenLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="URLLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="idVagaPublicaLabel" runat="server" Visible="False"></asp:Label> 
                    <asp:Label ID="idCadastroEmpresaFilhaLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="idADLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="codigoLabel" runat="server"></asp:Label>
                    <asp:Label ID="CreditoLabel" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="qtdCreditoLabel" runat="server" Visible="False"></asp:Label>
                    <input id="inpHideTextArea" runat="server" hidden="hidden" />
                <br />
            <br />
            <asp:LinkButton ID="LinkButtonDuvida" runat="server" CssClass="button" ToolTip="Alguma dúvida? Clique aqui para saber como funciona.">Dúvidas sobre <b>Vagas Patrocinadas</b></asp:LinkButton>
            <asp:LinkButton ID="LinkButtonDivulgarVagaPublicada" runat="server" CssClass="button" ToolTip="Divulgar uma vaga publicada." Visible="False">Divulgar vagas publicadas</asp:LinkButton>
            <asp:LinkButton ID="LinkButtonEXTRATO" runat="server" CssClass="button" ToolTip="Extrato de créditos">Extrato</asp:LinkButton>
            <br />
            <br />
            <asp:RadioButtonList ID="RadioButtonListPESQUISA" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" Width="600px">
                <asp:ListItem Selected="True" Value="3">Todas</asp:ListItem>
                <asp:ListItem Value="1">Abertas (Publicadas)</asp:ListItem>
                <asp:ListItem Value="0">Encerradas (Não publicadas)</asp:ListItem>
                <asp:ListItem Value="999">Patrocinadas</asp:ListItem>
            </asp:RadioButtonList>
            <br />
   <asp:Panel ID="EXTRATO" runat="server" Visible="False">
        <div id="EXTRATORes">        
            <div id="APRESENTAEXTRATO">
                <br />
                <asp:Label ID="Label3" runat="server" CssClass="titulo" Text="Veja seu extrato"></asp:Label>
                <br />
                <asp:Label ID="Label" runat="server" CssClass="legenda" Text="Período:"></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownListMES" runat="server" AutoPostBack="True" CssClass="DropCad" Width="150px">
                    <asp:ListItem Value="1">Janeiro</asp:ListItem>
                    <asp:ListItem Value="2">Fevereiro</asp:ListItem>
                    <asp:ListItem Value="3">Março</asp:ListItem>
                    <asp:ListItem Value="4">Abril</asp:ListItem>
                    <asp:ListItem Value="5">Maio</asp:ListItem>
                    <asp:ListItem Value="6">Junho</asp:ListItem>
                    <asp:ListItem Value="7">Julho</asp:ListItem>
                    <asp:ListItem Value="8">Agosto</asp:ListItem>
                    <asp:ListItem Value="9">Setembro</asp:ListItem>
                    <asp:ListItem Value="10">Outubro</asp:ListItem>
                    <asp:ListItem Value="11">Novembro</asp:ListItem>
                    <asp:ListItem Value="12">Dezembro</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownListANO" runat="server" AutoPostBack="True" CssClass="DropCad" Width="80px">
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2015</asp:ListItem>
                </asp:DropDownList>
                <table class="AD">
                    <tr>
                        <td>
                            <asp:GridView ID="ExtratoEmpresa" runat="server" AutoGenerateColumns="False" BorderStyle="None" CssClass="mGrid" DataSourceID="SqlExtrato" GridLines="None" Width="100%">
                                <AlternatingRowStyle BackColor="#F0F0F0" BorderStyle="None" CssClass="alt" />
                                <Columns>
                                    <asp:BoundField DataField="idUsuario" HeaderText="idUsuario" SortExpression="idUsuario" Visible="False" />
                                    <asp:BoundField DataField="REF_COD" HeaderText="Código" SortExpression="REF_COD" ReadOnly="True" Visible="False" />
                                    <asp:BoundField DataField="Nome" HeaderText="Responsável" SortExpression="Nome" ReadOnly="True" />
                                    <asp:BoundField DataField="dataMovimentacao" HeaderText="Data" SortExpression="dataMovimentacao" ReadOnly="True" />
                                    <asp:TemplateField HeaderText="Descrição" SortExpression="dsMovimentacao">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dsMovimentacao") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("dsMovimentacao") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="tipoMovimentacao" HeaderText="Tipo" SortExpression="tipoMovimentacao" />
                                    <asp:BoundField DataField="valor" HeaderText="Valor" SortExpression="valor" DataFormatString="{0:N}" >
                                    <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <asp:Label ID="Label25" runat="server" Text="Não existe movimentação neste período."></asp:Label>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:Label ID="LabelLeganda0" runat="server" CssClass="legenda" Text="Legenda:"></asp:Label>
                            <br />
                            <asp:Label ID="LabelLegenda" runat="server" CssClass="legenda" Text="&lt;b&gt;A&lt;/b&gt; = Aguardando confirmação de pagamento | &lt;b&gt;C&lt;/b&gt; = Crédito Liberado | &lt;b&gt;S&lt;/b&gt; = Saldo | &lt;b&gt;D&lt;/b&gt; = Débito | &lt;b&gt;E&lt;/b&gt; = Estorno | &lt;b&gt;B&lt;/b&gt; = Bônus"></asp:Label>
                        </td>
                        <td>
                            <div id="close">
                                <asp:ImageButton ID="ImageButtonclose" runat="server" ImageUrl="~/_parceiroJobClick/images/close.png" ToolTip="Clique aqui para fechar seu extrato" />
                            </div>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
        </div>
     </asp:Panel>
     <asp:Panel ID="VagaPUBLICADA" runat="server" Visible="False">
         <br />
         <asp:Label ID="LabelCabecVP" runat="server" CssClass="titulo" Text="Escolha abaixo qual a vaga será utilizada na campanha"></asp:Label>

                             <br />
         <asp:Label ID="LabelLembrete" runat="server" Font-Size="9px" Text="&lt;b&gt;Lembrete:&lt;/b&gt; Para divulgar uma vaga ela precisa estar publicada no painel de vagas."></asp:Label>

                             <asp:GridView ID="GridViewVAGA" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceVAGA" AllowPaging="True" CssClass="mGrid" AllowSorting="True" DataKeyNames="idVagaPublica,titVagaPublica,codigo" PageSize="3">
                                 <Columns>
                                     <asp:TemplateField>
                                         <EditItemTemplate>
                                             <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                         </EditItemTemplate>
                                         <ItemTemplate>
                                             <asp:ImageButton ID="ImageButtonSelect" runat="server" CommandName="Select" ImageUrl="~/_parceiroJobClick/images/viewDescricao.png" ToolTip='<%# Eval("titVagaPublica", "Divulgar esta vaga: {0}") %>' />
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Vaga" SortExpression="titVagaPublica">
                                         <EditItemTemplate>
                                             <asp:Label ID="Label1" runat="server" Text='<%# Eval("titVagaPublica") %>'></asp:Label>
                                         </EditItemTemplate>
                                         <ItemTemplate>
                                             <asp:LinkButton ID="LinkButtonVAGA" runat="server" CommandName="Select" Text='<%# Eval("titVagaPublica") %>' ToolTip='<%# Eval("dsVagaPublica") %>'></asp:LinkButton>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:BoundField DataField="codigo" HeaderText="Código" ReadOnly="True" SortExpression="codigo" />
                                     <asp:BoundField DataField="cnt" HeaderText="Visualizações" ReadOnly="True" SortExpression="cnt" />
                                     <asp:TemplateField HeaderText="topAn" SortExpression="topAn" Visible="False">
                                         <EditItemTemplate>
                                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("topAn") %>'></asp:TextBox>
                                         </EditItemTemplate>
                                         <ItemTemplate>
                                             <asp:Label ID="topAnLabel" runat="server" Text='<%# Bind("topAn") %>'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Publicar" SortExpression="publicar" Visible="False">
                                         <EditItemTemplate>
                                             <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("publicar") %>'></asp:TextBox>
                                         </EditItemTemplate>
                                         <ItemTemplate>
                                             <asp:Label ID="PublicarLabel" runat="server" Text='<%# Bind("publicar") %>'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                 </Columns>
                                 <EmptyDataTemplate>
                                     <asp:Label ID="LabelAVISO" runat="server" Text="Ops... Você não publicou nenhuma vaga, antes de utilizar o sistema de divulgação é necessário ter pelo menos uma vaga devidamente publicado no painel de vagas do Jobclick.&lt;br&gt;&lt;br&gt;&lt;b&gt;Siga esta orientação:&lt;/b&gt;&lt;br&gt;&lt;i&gt;No menu superior, clique em [(Vagas) Oportunidades], [Publicar], [Publicar nova vaga].&lt;br&gt;Você pode optar por [Modelos] e utilizar um modelo de vaga pronto, e fazer as alterações necessárias para sua oportunidade.&lt;/i&gt;"></asp:Label>
                                 </EmptyDataTemplate>
                                 <PagerStyle CssClass="pgr" />
                             </asp:GridView>
         <asp:Label ID="LabelLeganda" runat="server" CssClass="legenda" Text="Legenda:"></asp:Label>
         <br />
         <br />
         <asp:Image ID="ImagePublicada" runat="server" ImageUrl="~/_parceiroJobClick/images/legenda_AD_AP.png" ToolTip="Vagas publicadas no painel vagas patrocinadas" />
         &nbsp;<asp:Label ID="Label23" runat="server" CssClass="legenda" Text="Anúncio publicado nas vagas patrocinadas."></asp:Label>
         <br />
         <asp:Image ID="ImageNpublicadas" runat="server" ImageUrl="~/_parceiroJobClick/images/legenda_AD_NP.png" ToolTip="Vagas não publicadas no painel vagas patrocinadas" />
         &nbsp;<asp:Label ID="Label24" runat="server" CssClass="legenda" Text="Vaga publicada no painel JobClick"></asp:Label>
         <br />
         <asp:Image ID="ImageNAnunciada" runat="server" ImageUrl="~/_parceiroJobClick/images/legenda_AD_NA.png" ToolTip="Vagas não publicadas no painel vagas patrocinadas" />
         &nbsp;<asp:Label ID="Label26" runat="server" CssClass="legenda" Text="Vaga &lt;b&gt;não&lt;/b&gt; está publicada no painel JobClick"></asp:Label>
         <br />
         <asp:Image ID="ImageNVAGAPG" runat="server" ImageUrl="~/_parceiroJobClick/images/legenda_AD_PG.png" ToolTip="Publicação em destaque, aguardando confirmação de pagamento." />
         &nbsp;<asp:Label ID="Label27" runat="server" CssClass="legenda" Text="Publicação em destaque, aguardando confirmação de pagamento."></asp:Label>
         </asp:Panel>
        <asp:Panel ID="FORMULARIO" runat="server" Visible="False">
                    <asp:ValidationSummary ID="ValidationSummaryVAGA" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="FORMULARIO" />
                    <br />
                    <div class="AD">
                        <div class="ImageAD">
                            <asp:Label ID="Label15" runat="server" Text="(CPC) - Custo Por Clique Lance inicial:"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lanceTextBox" ErrorMessage="Informe o CPC - (custo por clique)" SetFocusOnError="True" ValidationGroup="FORMULARIO">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="lanceTextBox" runat="server" onkeyup="formataValor(this,event);" style="text-align:left" CssClass="simple_aviso" Text='<%# Bind("lance") %>' Width="330px" ToolTip="Informe o quanto você deseja pagar por clique para este anúncio, lembrando que este valor será utilizado para definir em qual posição será apresentado seu anúncio. Quanto maior o valor do clique mais alto seu anúncio esta apresentado." />
                        </div>
                        <div class="TextAD">
                            <asp:Label ID="Label16" runat="server" Text="Orçamento:"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="orcamentoTextBox" ErrorMessage="Informe o valor que será usado para esta campanha." SetFocusOnError="True" ValidationGroup="FORMULARIO">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="orcamentoTextBox" runat="server" onkeyup="formataValor(this,event);" style="text-align:left" CssClass="simple_aviso" Text='<%# Bind("orcamento") %>' Width="400px" ToolTip="Qual o valor limite de investimento para esta campanha? Lembrando que este valor irá fornecer o número de apresentações de seu anúncio para os candidatos." />
                        </div>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="ID">
                        <div class="TextADPesquisa">
                            <asp:Label ID="Label8" runat="server" Text="Divulgar:"></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownListPublicarEm" runat="server" CssClass="simple" ToolTip="Qual alcance desejado?" Width="350px">
                                <asp:ListItem Value="3">Território Nacional</asp:ListItem>
                                <asp:ListItem Value="2">Apenas no Estado</asp:ListItem>
                                <asp:ListItem Value="1">Apenas na Cidade</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;&nbsp;
                            <asp:Label ID="Label21" runat="server" Text="IP desta conexão: "></asp:Label>
                            <asp:Label ID="lipClient" runat="server"></asp:Label>
                            <asp:Label ID="idCBOOcupacaoLabel" runat="server" Visible="False"></asp:Label>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="AD">
                        <div class="TextADPesquisa">
                            <asp:Label ID="Label20" runat="server" Text="Informe o CEP da localização da Vaga:"></asp:Label>
                            <br />
                            <asp:TextBox ID="TextBoxCEP" runat="server" CssClass="simple" ToolTip="Informe o CEP de origem da vaga." Width="330px"></asp:TextBox>
                            <asp:DropDownList ID="DropDownListRange" runat="server" ToolTip="Defina qual será o alcance desta vaga." Width="200px">
                                <asp:ListItem Value="2">60km (+/-)</asp:ListItem>
                                <asp:ListItem Value="3">20km (+/-)</asp:ListItem>
                                <asp:ListItem Value="4">5Km (+/-)</asp:ListItem>
                                <asp:ListItem Value="5">3Km (+/-)</asp:ListItem>
                                <asp:ListItem Value="6">1Km (+/-)</asp:ListItem>
                            </asp:DropDownList>
                            <asp:ImageButton ID="ImageButtonPSQ" runat="server" ImageUrl="/images/layout/pesquisa.png" ToolTip="Defina qual será o alcance desta vaga." />
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="AD">
                        <div class="ImageAD">
                            <asp:Label ID="Label5" runat="server" Text="Vaga:"></asp:Label>
                            <br />
                            <asp:TextBox ID="nomeADTextBox" runat="server" CssClass="simple" Text='<%# Bind("nomeAD") %>' Width="330px" />
                        </div>
                        <div class="TextAD">
                            <asp:Label ID="Label6" runat="server" Text="Pequena descrição:"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="chamadaVagaTextBox" CssClass="simple_aviso" Display="Dynamic" ErrorMessage="Informe uma rápida descrição da vaga" SetFocusOnError="True" ValidationGroup="FORMULARIO">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="chamadaVagaTextBox" runat="server" CssClass="simple" Text='<%# Bind("chamadaVaga") %>' ToolTip="Este espaço será utilizado para uma rápida descrição da vaga para chamar a atenção do candidato. Exemplo: Vaga de Analista de sistemas para início imediato." ValidationGroup="FORMULARIO" Width="400px" />
                        </div>
                    </div>
                    <div class="AD">
                        <div class="TextAreaAD">
                            <asp:Label ID="Label7" runat="server" Text="Sobre a Vaga:"></asp:Label>
                            <br />
                            <asp:TextBox ID="dsVagaTextBox" runat="server" CssClass="simple" Height="100px" Text='<%# Bind("dsVaga") %>' TextMode="MultiLine" Width="754px" />
                        </div>
                    </div>
                    <div class="AD">
                        <div class="TextAreaAD">
                            <asp:Label ID="Label12" runat="server" Text="URL da empresa:"></asp:Label>
                            <br />
                            <asp:TextBox ID="URLempresaTextBox" runat="server" CssClass="simple" Text="" Width="754px" />
                            <br />
                        </div>
                    </div>
                    <div class="AD">
                        <div class="ImageAD">
                            <asp:Label ID="Label9" runat="server" Text="Cidade:"></asp:Label>
                            <br />
                            <asp:TextBox ID="cidadeADTextBox" runat="server" CssClass="simple" Text='<%# Bind("cidadeAD") %>' Width="330px" />
                        </div>
                        <div class="TextAD">
                            <asp:Label ID="Label10" runat="server" Text="Estado:"></asp:Label>
                            <br />
                            <asp:TextBox ID="estadoADTextBox" runat="server" CssClass="simple" Text='<%# Bind("estadoAD") %>' Width="400px" />
                        </div>
                    </div>
                    <div class="AD">
                        <div class="ImageAD">
                            <asp:Label ID="Label11" runat="server" Text="Pais:"></asp:Label>
                            <br />
                            <asp:TextBox ID="paisADTextBox" runat="server" CssClass="simple" Text='<%# Bind("paisAD") %>' Width="330px" />
                        </div>
                        <div class="TextAD">
                            <asp:Label ID="Label19" runat="server" Text="Palavra Chave:"></asp:Label>
                            <br />
                            <asp:TextBox ID="palavrachaveTextBox" runat="server" CssClass="simple" Text='<%# Bind("palavrachave") %>' Width="400px" />
                        </div>
                    </div>
                    <div class="AD">
                        <div class="ImageAD">
                            <asp:Label ID="Label13" runat="server" Text="Longitude:"></asp:Label>
                            <br />
                            <asp:TextBox ID="longitudeTextBox" runat="server" CssClass="simple" Text='<%# Bind("longitude") %>' Width="330px" />
                        </div>
                        <div class="TextAD">
                            <asp:Label ID="Label14" runat="server" Text="Latitude:"></asp:Label>
                            <br />
                            <asp:TextBox ID="latitudeTextBox" runat="server" CssClass="simple" Text='<%# Bind("latitude") %>' Width="400px" />
                        </div>
                    </div>
                    <div class="AD">
                        <div class="ImageAD">
                            <asp:Label ID="Label17" runat="server" Text="Região:"></asp:Label>
                            <br />
                            <asp:TextBox ID="paraRegiaoTextBox" runat="server" CssClass="simple" Height="80px" Text='<%# Bind("paraRegiao") %>' TextMode="MultiLine" Width="330px" />
                        </div>
                        <div class="TextAD">
                            <asp:Label ID="Label18" runat="server" Text="Cargos relacionados:"></asp:Label>
                            <br />
                            <asp:TextBox ID="cargoRelacionadoTextBox" runat="server" CssClass="simple" Height="80px" Text='<%# Bind("cargoRelacionado") %>' TextMode="MultiLine" Width="400px" />
                        </div>
                    </div>
                    <div class="TextAreaAD">
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CssClass="button" Text="Divulgar esta vaga" ValidationGroup="FORMULARIO" />
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="button" Text="Cancelar" />
                        &nbsp;<br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </div>
                    <br />
                    <br />
            </asp:Panel>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
                    <asp:SqlDataSource ID="SqlExtrato" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                        SelectCommand="USP_RELATORIO_GERAL_MENSAL" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="mes" Name="MES" PropertyName="Text" 
                                Type="Int32" />
                            <asp:ControlParameter ControlID="ano" Name="ANO" PropertyName="Text" 
                                Type="Int32" />
                            <asp:SessionParameter Name="REF_COD" SessionField="idUser" Type="String" />
                            <asp:SessionParameter Name="idUsuario" SessionField="idUser" 
                                Type="Int32" />
                            <asp:SessionParameter Name="idsetup" SessionField="idSetup" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceVAGA" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" SelectCommand="_USP_RELATORIO_JSON_VAGASPUBLICAS_TEXTO" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idCadastroEmpresa" SessionField="idCadastroEmpresa" Type="Int32" />
            <asp:ControlParameter ControlID="RadioButtonListPESQUISA" Name="pesquisa" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceVAGAPATROCINADA_FORM" runat="server" ConnectionString="<%$ ConnectionStrings:jobclickDB %>" InsertCommand="_USP_AD_ADICIONA" InsertCommandType="StoredProcedure" SelectCommand="_USP_AD_SELECIONA" SelectCommandType="StoredProcedure" UpdateCommand="_USP_AD_ATUALIZA" UpdateCommandType="StoredProcedure">
                <InsertParameters>
                    <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                    <asp:Parameter Name="idVagaPublica" Type="Int32" />
                    <asp:Parameter Name="idVaga" Type="Int32" />
                    <asp:Parameter Name="tipoVaga" Type="Int32" />
                    <asp:Parameter Name="nomeAD" Type="String" />
                    <asp:Parameter Name="chamadaVaga" Type="String" />
                    <asp:Parameter Name="dsVaga" Type="String" />
                    <asp:Parameter Name="redeAD" Type="String" />
                    <asp:Parameter Name="cidadeAD" Type="String" />
                    <asp:Parameter Name="estadoAD" Type="String" />
                    <asp:Parameter Name="paisAD" Type="String" />
                    <asp:Parameter Name="publicarEm" Type="Int32" />
                    <asp:Parameter Name="longitude" Type="String" />
                    <asp:Parameter Name="latitude" Type="String" />
                    <asp:Parameter Name="lance" Type="Decimal" />
                    <asp:Parameter Name="orcamento" Type="Decimal" />
                    <asp:Parameter Name="URLdestino" Type="String" />
                    <asp:Parameter Name="URLempresa" Type="String" />
                    <asp:Parameter Name="palavrachave" Type="String" />
                    <asp:Parameter Name="cntClick" Type="Int32" />
                    <asp:Parameter Name="cntImpressao" Type="Int32" />
                    <asp:Parameter Name="cntMergulho" Type="Int32" />
                    <asp:Parameter Name="qtdImpressao" Type="Int32" />
                    <asp:Parameter Name="paraRegiao" Type="String" />
                    <asp:Parameter Name="cargoRelacionado" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewVAGA" Name="idAD" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="idAD" Type="Int32" />
                    <asp:Parameter Name="idCadastroEmpresa" Type="Int32" />
                    <asp:Parameter Name="idVagaPublica" Type="Int32" />
                    <asp:Parameter Name="idVaga" Type="Int32" />
                    <asp:Parameter Name="tipoVaga" Type="Int32" />
                    <asp:Parameter Name="nomeAD" Type="String" />
                    <asp:Parameter Name="chamadaVaga" Type="String" />
                    <asp:Parameter Name="dsVaga" Type="String" />
                    <asp:Parameter Name="redeAD" Type="String" />
                    <asp:Parameter Name="cidadeAD" Type="String" />
                    <asp:Parameter Name="estadoAD" Type="String" />
                    <asp:Parameter Name="paisAD" Type="String" />
                    <asp:Parameter Name="publicarEm" Type="Int32" />
                    <asp:Parameter Name="longitude" Type="String" />
                    <asp:Parameter Name="latitude" Type="String" />
                    <asp:Parameter Name="lance" Type="Decimal" />
                    <asp:Parameter Name="orcamento" Type="Decimal" />
                    <asp:Parameter Name="URLdestino" Type="String" />
                    <asp:Parameter Name="URLempresa" Type="String" />
                    <asp:Parameter Name="palavrachave" Type="String" />
                    <asp:Parameter Name="cntClick" Type="Int32" />
                    <asp:Parameter Name="cntImpressao" Type="Int32" />
                    <asp:Parameter Name="cntMergulho" Type="Int32" />
                    <asp:Parameter Name="qtdImpressao" Type="Int32" />
                    <asp:Parameter Name="paraRegiao" Type="String" />
                    <asp:Parameter Name="cargoRelacionado" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

        </div>
    </div>
</asp:Content>












