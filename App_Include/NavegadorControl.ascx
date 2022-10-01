<%@ Control Language="VB" AutoEventWireup="false" CodeFile="NavegadorControl.ascx.vb" Inherits="App_Include_NavegadorControl" %>

<asp:Menu ID="ControlNav" runat="server" Orientation="Horizontal" ClientIDMode="Static" MaximumDynamicDisplayLevels="2">
                <Items>
                    <asp:MenuItem NavigateUrl="/_candidato/" Text="Menu Principal" Value="Menu Principal">
                        <asp:MenuItem NavigateUrl="~/_candidato/agenda.aspx" 
                            Text="Minha Agenda Pessoal" 
                            ToolTip="A sua agenda pessoal, aqui você poderá anotar seus compromissos e ser avisado por email." Value="Minha Agenda Pessoal"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/_candidato/agenda_virtual.aspx" Text="Agenda de Entrevista Virtual" 
                            ToolTip="Esta é sua agenda de entrevistas virtuais com o recrutador." Value="Agenda de Entrevista Virtual"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/_candidato/agenda_candidato.aspx" 
                            Text="Agenda de Entrevista Presencial" 
                            ToolTip="Esta é sua agenda de entrevistas presenciais com o recrutador." Value="Agenda de Entrevista Presencial">
                        </asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/_candidato/indicacandidatoEmpresa.aspx" 
                            Text="Indicações Pessoais" 
                            ToolTip="Solicite uma indicação pessoal para um profissional que você conheça" Value="Indicações Pessoais"></asp:MenuItem>
                        <asp:MenuItem Text="Indicações recebidas por e-mail" 
                            ToolTip="Você recebeu uma indicação por e-mail? Confirme sua candidatura aqui!" NavigateUrl="~/_candidato/indicacandidato.aspx" Value="Indicações recebidas por e-mail">
                        </asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/_candidato/publicar.aspx" Text="Enviar meu Curriculo por email" 
                            ToolTip="Envie seu Currículo para qualquer empresa que desejar." Value="Enviar meu Curriculo por email"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/_candidato/conta.aspx" Text="Minha Conta de Acesso" 
                            ToolTip="Clique aqui para alterar seus dados de acesso" Value="Minha Conta de Acesso">
                        </asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/logout.aspx" Text="Logout" 
                            ToolTip="Clique aqui para sair" Value="Logout"></asp:MenuItem>
                    </asp:MenuItem>
<asp:MenuItem NavigateUrl="~/_candidato/mycurriculo.aspx" Text="Meus Currículos" ToolTip="Impressão, visualização e editar outros CVs" Value="Meus Currículos"><asp:MenuItem NavigateUrl="~/_candidato/mycurriculo.aspx" Text="Visualizar meu Currículo ativo" ToolTip="Veja o seu Curriculo ativo." Value="Visualizar meu Currículo ativo"></asp:MenuItem>
<asp:MenuItem NavigateUrl="~/_candidato/cv.aspx" Text="Editar outro Currículo " ToolTip="Crie ou edite outros Curriculos." Value="Editar outro Currículo "></asp:MenuItem>
<asp:MenuItem NavigateUrl="~/_candidato/administraCV.aspx" Text="Dados Pessoais" ToolTip="Atualizar seus dados pessoais, como endereço, e-mail e outras informações importantes." Value="Dados Pessoais"></asp:MenuItem>
<asp:MenuItem NavigateUrl="~/_candidato/contato.aspx" Text="Telefones para contato" ToolTip="Atualize ou informe os seus telefones para contato." Value="Telefones para contato"></asp:MenuItem>
<asp:MenuItem NavigateUrl="~/_candidato/experiencia.aspx" Text="Experiência profissional" ToolTip="Atualize ou informe as empresas nas quais você trabalhou, suas conquistas e fale dos pontos positivos da empresa." Value="Experiência profissional"></asp:MenuItem>
<asp:MenuItem NavigateUrl="~/_candidato/formacaoAcademica.aspx" Text="Formação acadêmica" ToolTip="Atualize ou informe as escolas nas quais você estudou." Value="Formação acadêmica"></asp:MenuItem>
    <asp:MenuItem NavigateUrl="~/_candidato/conhecimento.aspx" Text="Conhecimentos em informática" ToolTip="Atualize ou informe quais conhecimentos você possui e especifique o grau de conhecimento em softwares." Value="Conhecimentos em informática"></asp:MenuItem>
    <asp:MenuItem NavigateUrl="~/_candidato/idiomas.aspx" Text="Idiomas" ToolTip="Atualize ou informe os idiomas que você domina e sua proficiência." Value="Idiomas"></asp:MenuItem>
    <asp:MenuItem NavigateUrl="~/_candidato/objetivo.aspx" Text="Apresentação pessoal" ToolTip="Atualize ou informe sua apresentação pessoal" Value="Apresentação pessoal"></asp:MenuItem>
    <asp:MenuItem NavigateUrl="~/_candidato/cursos.aspx" Text="Formação complementar" ToolTip="Atualize ou informe os cursos complementares nos quais você participou." Value="Formação complementar"></asp:MenuItem>
    <asp:MenuItem NavigateUrl="~/_candidato/informacoes.aspx" Text="Informações adicionais" ToolTip="Atualize ou informe quando solicitado pela empresa seus documentos e outras comprovações." Value="Informações adicionais"></asp:MenuItem>
    <asp:MenuItem NavigateUrl="~/_candidato/extraCurricular.aspx" Text="Atividade extra curricular" ToolTip="Atualize ou informe suas atividades extra curriculares" Value="Atividade extra curricular"></asp:MenuItem>
    <asp:MenuItem NavigateUrl="~/_candidato/multimidia.aspx" Text="Foto e apresentação multimídia" ToolTip="Atualize ou informe sua foto em seu CV e seus vídeo-curriculos/portifólios publicados no YouTube." Value="Foto e apresentação multimídia"></asp:MenuItem>
    <asp:MenuItem NavigateUrl="~/_candidato/intercambio.aspx" Text="Intercâmbio" ToolTip="Atualize ou informe os países que você fez intercâmbio e suas experiências." Value="Intercâmbio"></asp:MenuItem>
</asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/_candidato/vagas.aspx" Text="Vagas" 
                        ToolTip="Veja o painel de vagas" Value="Vagas">
                        <asp:MenuItem NavigateUrl="~/_candidato/vagas.aspx" Text="Pesquisa de Vagas" 
                            ToolTip="Veja o painel de vagas" Value="Pesquisa de Vagas"></asp:MenuItem>
                    </asp:MenuItem>
                </Items>
            </asp:Menu>