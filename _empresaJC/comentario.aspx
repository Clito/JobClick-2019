<%@ Page Language="VB" MasterPageFile="~/_empresaJC/EmpresaPage.master" AutoEventWireup="false" CodeFile="comentario.aspx.vb" Inherits="_empresa__processo_comentario" title=":. Sistema JobClick .:" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="cabec" runat="server" 
        ImageUrl="~/images/layout/e_processoAnotacao.gif" />
        <table width="640" cellpadding="0" cellspacing="0">
        <tr>
            <td width="26">
                <asp:Image ID="lateral" runat="server" ImageUrl="~/images/h26.gif" />
            </td>
            <td width="614">
                <asp:Label ID="lblidRELcandidato_vaga" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="idProcessoLabel" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblidvaga" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblidUser" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblidcurriculo" runat="server" Visible="False"></asp:Label>
                <asp:LinkButton ID="LBVoltar" runat="server">Voltar ao Processo Seletivo</asp:LinkButton>
                &nbsp;|
                <asp:HyperLink ID="HLCV" runat="server">Ver Currículo deste candidato</asp:HyperLink>
                <br />
                <asp:Label ID="msn" runat="server" CssClass="msnOK"></asp:Label>
                <br />
                <asp:DataList ID="DataList1" runat="server" DataKeyField="idcurriculo" 
                    DataSourceID="SqlDadosPessoais" Width="614px">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" CssClass="textBold" Text="Candidato: "></asp:Label>
                        <asp:Label ID="nomeLabel" runat="server" Text='<%# Eval("nome") %>' />
                        <br />
                        <asp:Label ID="Label2" runat="server" CssClass="textBold" Text="Endereço: "></asp:Label>
                        <asp:Label ID="enderecoLabel" runat="server" Text='<%# Eval("endereco") %>' />
                        &nbsp;-
                        <asp:Label ID="cepLabel" runat="server" Text='<%# Eval("cep") %>' />
                        <br />
                        <asp:Label ID="bairroLabel" runat="server" Text='<%# Eval("bairro") %>' />
                        &nbsp;-
                        <asp:Label ID="cidadeLabel" runat="server" Text='<%# Eval("cidade") %>' />
                        &nbsp;/
                        <asp:Label ID="ufLabel" runat="server" Text='<%# Eval("uf") %>' />
                        &nbsp;-
                        <asp:Label ID="paisLabel" runat="server" Text='<%# Eval("pais") %>' />
                        <br />
                        <br />
                        <asp:Label ID="Label3" runat="server" CssClass="textBold" Text="Nascimento: "></asp:Label>
                        <asp:Label ID="nascimentoLabel" runat="server" 
                            Text='<%# Eval("nascimento", "{0:d}") %>' />
                        <br />
                        <asp:Label ID="Label4" runat="server" CssClass="textBold" Text="Sexo: "></asp:Label>
                        <asp:Label ID="sexoLabel" runat="server" Text='<%# Eval("sexo") %>' />
                        <br />
                        <asp:Label ID="Label5" runat="server" CssClass="textBold" Text="Estado civil: "></asp:Label>
                        <asp:Label ID="estadocivilLabel" runat="server" 
                            Text='<%# Eval("estadocivil") %>' />
                        &nbsp;- Número de dependente(s):
                        <asp:Label ID="nrdependenteLabel" runat="server" 
                            Text='<%# Eval("nrdependente") %>' />
                        <br />
                        <br />
                        <asp:Label ID="Label11" runat="server" CssClass="textBold" 
                            Text="Portador de deficiência: "></asp:Label>
                        <asp:Label ID="portadorDefLabel" runat="server" 
                            Text='<%# Eval("portadorDef") %>' />
                        <br />
                        <asp:Label ID="Label10" runat="server" CssClass="textBold" Text="Trabalhando: "></asp:Label>
                        <asp:Label ID="trabalhandoLabel" runat="server" 
                            Text='<%# Eval("trabalhando") %>' />
                        <br />
                        <br />
                        <asp:Label ID="Label6" runat="server" CssClass="textBold" 
                            Text="Resumo das qualificações: "></asp:Label>
                        <br />
                        <asp:Label ID="resumoLabel" runat="server" Text='<%# Eval("resumo") %>' />
                        <br />
                        <br />
                        <asp:Label ID="Label7" runat="server" CssClass="textBold" 
                            Text="Salário atual: "></asp:Label>
                        <asp:Label ID="valorRemAtualLabel" runat="server" 
                            Text='<%# Eval("valorRemAtual", "{0:C}") %>' />
                        <br />
                        <asp:Label ID="Label8" runat="server" CssClass="textBold" 
                            Text="Salário desejado: "></asp:Label>
                        <asp:Label ID="valorRemPretendidaLabel" runat="server" 
                            Text='<%# Eval("valorRemPretendida", "{0:C}") %>' />
                        <br />
                        <br />
                        <asp:Label ID="Label9" runat="server" CssClass="textBold" 
                            Text="Disponibilidade: "></asp:Label>
                        <asp:Label ID="disponibilidadeLabel" runat="server" 
                            Text='<%# Eval("disponibilidade") %>' />
                        <asp:Label ID="idcurriculoLabel" runat="server" 
                            Text='<%# Eval("idcurriculo") %>' Visible="False" />
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="idRELcandidato_vaga" 
                    DataSourceID="SqlComentario" DefaultMode="Edit" Width="614px">
                    <EditItemTemplate>
                        Anotações &amp; Comentários:<br />
                        <asp:TextBox ID="comentarioCVTextBox" runat="server" CssClass="InputCadEmp" 
                            Height="124px" Text='<%# Bind("comentarioCV") %>' TextMode="MultiLine" 
                            Width="604px" />
                        <br />
                        <asp:TextBox ID="TextBox1" runat="server" 
                            Text='<%# Bind("pontuacao", "{0:N}") %>' Visible="False" Width="25px"></asp:TextBox>
                        <br />
                        Pontuação Geral:<br />
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatColumns="6" 
                            RepeatDirection="Horizontal" SelectedValue='<%# Bind("pontuacao", "{0:N}") %>' 
                            Width="599px" DataSourceID="SqlPontuacao" DataTextField="pontuacao" 
                            DataValueField="pontuacao">
                        </asp:RadioButtonList>
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" 
                            Text="Incluir/Atualizar comentários e pontuação ao candidato" />
                        &nbsp;|&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" 
                            onclick="UpdateCancelButton_Click" Text="Ok" />
                        &nbsp;<asp:Label ID="idRELcandidato_vagaLabel1" runat="server" 
                            Text='<%# Eval("idRELcandidato_vaga") %>' Visible="False" />
                        <asp:TextBox ID="idvagaTextBox" runat="server" Text='<%# Bind("idvaga") %>' 
                            Visible="False" Width="23px" />
                        <asp:TextBox ID="idcurriculoTextBox" runat="server" 
                            Text='<%# Bind("idcurriculo") %>' Visible="False" Width="22px" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        idvaga:
                        <asp:TextBox ID="idvagaTextBox" runat="server" Text='<%# Bind("idvaga") %>' />
                        <br />
                        idcurriculo:
                        <asp:TextBox ID="idcurriculoTextBox" runat="server" 
                            Text='<%# Bind("idcurriculo") %>' />
                        <br />
                        comentarioCV:
                        <asp:TextBox ID="comentarioCVTextBox" runat="server" 
                            Text='<%# Bind("comentarioCV") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        idRELcandidato_vaga:
                        <asp:Label ID="idRELcandidato_vagaLabel" runat="server" 
                            Text='<%# Eval("idRELcandidato_vaga") %>' />
                        <br />
                        idvaga:
                        <asp:Label ID="idvagaLabel" runat="server" Text='<%# Bind("idvaga") %>' />
                        <br />
                        idcurriculo:
                        <asp:Label ID="idcurriculoLabel" runat="server" 
                            Text='<%# Bind("idcurriculo") %>' />
                        <br />
                        comentarioCV:
                        <asp:Label ID="comentarioCVLabel" runat="server" 
                            Text='<%# Bind("comentarioCV") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                            CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlComentario" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    DeleteCommand="DELETE FROM [tbRELcandidato_vaga] WHERE [idRELcandidato_vaga] = @idRELcandidato_vaga" 
                    InsertCommand="INSERT INTO [tbRELcandidato_vaga] ([idvaga], [idcurriculo], [comentarioCV], [pontuacao]) VALUES (@idvaga, @idcurriculo, @comentarioCV, @pontuacao)" 
                    SelectCommand="SELECT [idRELcandidato_vaga], [idvaga], [idcurriculo], [comentarioCV], [pontuacao] FROM [tbRELcandidato_vaga] WHERE ([idRELcandidato_vaga] = @idRELcandidato_vaga)" 
                    UpdateCommand="UPDATE [tbRELcandidato_vaga] SET [idvaga] = @idvaga, [idcurriculo] = @idcurriculo, [comentarioCV] = @comentarioCV, [pontuacao] = @pontuacao WHERE [idRELcandidato_vaga] = @idRELcandidato_vaga">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblidRELcandidato_vaga" 
                            Name="idRELcandidato_vaga" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="idRELcandidato_vaga" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="idvaga" Type="Int32" />
                        <asp:Parameter Name="idcurriculo" Type="Int32" />
                        <asp:Parameter Name="comentarioCV" Type="String" />
                        <asp:Parameter Name="pontuacao" Type="Decimal" />
                        <asp:Parameter Name="idRELcandidato_vaga" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idvaga" Type="Int32" />
                        <asp:Parameter Name="idcurriculo" Type="Int32" />
                        <asp:Parameter Name="comentarioCV" Type="String" />
                        <asp:Parameter Name="pontuacao" Type="Decimal"  />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDadosPessoais" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="SELECT tbCadastroUser.nome, tbCadastroUser.endereco, tbCadastroUser.cep, tbCadastroUser.bairro, tbCadastroUser.cidade, tbCadastroUser.uf, tbCadastroUser.pais, tbCadastroUser.nascimento, tbCadastroUser.sexo, tbCadastroUser.estadocivil, tbCadastroUser.nrdependente, tbCadastroUser.portadorDef, tbCadastroUser.trabalhando, tbCadastroUser.resumo, tbCadastroUser.valorRemAtual, tbCadastroUser.valorRemPretendida, tbCadastroUser.disponibilidade, tbCurriculo.idcurriculo FROM tbCadastroUser INNER JOIN tbCurriculo ON tbCadastroUser.idCadastroUser = tbCurriculo.idCadastroUser WHERE (tbCurriculo.idcurriculo = @idcurriculo)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblidcurriculo" Name="idcurriculo" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlPontuacao" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:jobclickDB %>" 
                    SelectCommand="SELECT [pontuacao] FROM [tbPontuacao]"></asp:SqlDataSource>
            </td>
        </tr>
        </table>     
    </asp:Content>

