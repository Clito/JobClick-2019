
Partial Class App_Include_NavegadorControl
    Inherits System.Web.UI.UserControl

    'Protected Sub HyperLinkHome_Click(sender As Object, e As System.EventArgs) Handles HyperLinkHome.Click
    '    Response.Redirect("/_candidato")
    'End Sub

    'Protected Sub HyperLinkEditarCV_Click(sender As Object, e As System.EventArgs) Handles HyperLinkEditarCV.Click
    '    Response.Redirect("#")
    'End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        'HyperLinkPublicaCV.Text = "<b>Vagas</b> & Comunicação"
        'HyperLinkFormAgendaPessoal.Text = "<b>• Agenda:</b> A sua agenda pessoal, aqui você poderá anotar seus compromissos e ser avisado por e-mail ou SMS."
        'HyperLinkFormAgendaConsultor.Text = "<b>• Agenda do consultor:</b> - Esta é a agenda que o consultor tem para agendar entrevistas com você."
        'HyperLinkEnvioCV.Text = "<b>• Meios de envio do CV:</b> - Envie seu Currículo para qualquer empresa que desejar."
        'HyperLinkCV.Text = "<b>Veja a apresentação de seu CV</b>"
        'HyperLinkEditarCV.Text = Session("dscurriculo")
        'HyperLinkNavEditarCV.Text = "<b>Quero editar outro Currículo</b> - (Apenas para usuários que tenham mais de 1 (um) Currículo publicado no JobClick.)"
        'HyperLinkNavSumario.Text = "<b>Sumário:</b> - Apresentação pessoal, realizações profissionais, auto-avaliação e objetivos."
        'HyperLinkNavFormacaoAcademica.Text = "<b>Formação Acadêmica:</b> - Informe as entidades educacionais nas quais você estudou."
        'HyperLinkNavFormacaoComplementar.Text = "<b>Formação Complementar:</b> - Informe os cursos complementares nos quais você participou."
        'HyperLinkNavConhecimentoInformatica.Text = "<b>Conhecimentos em Informática:</b> - Informe quais e especifique o grau de conhecimento em softwares."
        'HyperLinkNavExperienciaProfissional.Text = "<b>Experiência Profissional:</b> - Informe as empresas nas quais você trabalhou, suas conquistas e fale dos pontos positivos da empresa."
        'HyperLinkNavIdiomas.Text = "<b>Idiomas:</b> - Informe os idiomas que você domina e sua proficiência."
        'HyperLinkNavInformacoesAdicionais.Text = "<b>Informações adicionais:</b> - Informe quando solicitado pela empresa seus documentos e outras comprovações."
        'HyperLinkNavIntercambio.Text = "<b>Intercâmbio:</b> - Os países que você fez intercâmbio e suas experiências."
        'HyperLinkNavAcesso.Text = "<b>Acesso: </b> - Administre a sua conta de acesso ao portal Jobclick."
        'HyperLinkNavDadosPessoais.Text = "<b>Dados Pessoais: </b> - Administre seus dados pessoais, altere endereço e outras informações importantes."
        'HyperLinkVagas.Text = "<b>• Vagas/Oportunidades de emprego:</b> - Pesquise as vagas publicadas em nosso portal."
        'HyperLinkNavFotoCandidato.Text = "<b>Foto e Apresentação Multimídia:</b> - Envie sua foto e faça o link dos vídeos publicados no YouTube em seu Currículo."
        'HyperLinkContato.Text = "<b>• Telefones para contato:</b> - Informe os seus telefones para contato."
    End Sub

End Class
