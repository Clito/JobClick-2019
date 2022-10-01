Imports user
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports myValidaCNPJ

Partial Class _anonimo_cadastroInstituicao
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            userNameTextBox.Focus()
        End If

        LBNormas.Visible = True

    End Sub

    Protected Sub PesquisaCEP_Click1(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles PesquisaCEP.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spCEP", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@CEP", SqlDbType.NVarChar, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@CEP").Value = Replace(cepTextBox.Text, "-", "")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

            enderecoTextBox.Text = dr("LOGRADOURO") & " " & dr("RUA") & ", "
            bairroTextBox.Text = dr("BAIRRO")
            cidadeTextBox.Text = dr("CIDADE")
            DDUf.SelectedValue = dr("UF")
            enderecoTextBox.Focus()

        Else

            enderecoTextBox.Text = "Não encontrei o endereço...."

        End If

        dr.Close()
        cn.Close()

    End Sub

    Public Sub PesquisaCNPJ(ByVal sender As Object, ByVal e As System.EventArgs) Handles TextBoxCNPJ.TextChanged
        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim ValidaCNPJres As New myValidaCNPJ
        Session("VarError") = False

        If TextBoxCNPJ.Text <> "__.___.___/____-__" Then

            If ValidaCNPJres.ValidaCNPJ(TextBoxCNPJ.Text) Then

                cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

                cmd = New SqlCommand("spBuscaCNPJ", cn)
                cmd.CommandType = CommandType.StoredProcedure

                prm = New SqlParameter("@CNPJ", SqlDbType.VarChar, 20)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)

                cmd.Parameters("@CNPJ").Value = TextBoxCNPJ.Text

                Try

                    cn.Open()

                    Dim dr As SqlDataReader = cmd.ExecuteReader

                    If dr.HasRows() Then
                        dr.Read()
                        lblmsn.Text = "[" & dr("CNPJ") & "] já cadastrado no sistema."
                        Session("VarError") = False
                    Else
                        Session("VarError") = True
                        lblmsnOK.Text = "[Ok!]"
                    End If

                    dr.Close()

                Catch ex As Exception
                    lblmsn.Text = "Erro ao pesquisar o CNPJ..."
                End Try

                cn.Close()
            Else
                lblmsn.Text = "CNPJ não é válido, informe um CNPJ válido."
            End If

        End If

    End Sub

    Protected Sub LBNormas_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LBNormas.Click

        Panel1.Visible = True
        LBNormas.Visible = False

        lblContrato.Text &= "<br />"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "Estes Termos e Condições Gerais aplicam-se à utilização por qualquer pessoa "
        lblContrato.Text &= "física ou jurídica (''Usuário'') dos serviços oferecidos pelo JobClick. Que por "
        lblContrato.Text &= "meio deste site, sendo que sua aceitação é absolutamente indispensável para a "
        lblContrato.Text &= "utilização deste site e dos serviços prestados pelo JobClick. O Usuário deverá "
        lblContrato.Text &= "ler e certificar-se de haver entendido e aceitar todas as condições "
        lblContrato.Text &= "estabelecidas nestes Termos e Condições Gerais."
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "DO OBJETO"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "Os serviços objeto do presente site consistem em oferecer ao Usuário um espaço "
        lblContrato.Text &= "para que este anuncie suas qualificações profissionais e ofertas de emprego. "
        lblContrato.Text &= "JobClick obriga-se apenas a intermediar o contato e as relações entre os "
        lblContrato.Text &= "Usuários, possibilitando que os mesmos troquem conhecimento uns dos outros e "
        lblContrato.Text &= "permitindo que negociem entre si diretamente, ou através de JobClick, as ofertas "
        lblContrato.Text &= "de emprego."
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "DA CAPACITAÇÃO E CADASTRAMENTO DOS USUÁRIOS"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "Os serviços de JobClick estão disponíveis apenas para as pessoas que tenham "
        lblContrato.Text &= "capacidade legal para contratá-los e estejam aptos a trabalhar ou oferecer "
        lblContrato.Text &= "trabalho no mercado profissional brasileiro. Não poderão utilizar os serviços de "
        lblContrato.Text &= "JobClick pessoas que não gozem dessa capacidade, inclusive menores de 14 "
        lblContrato.Text &= "(catorze)anos . Pessoas Jurídicas poderão cadastrar-se mediante seu "
        lblContrato.Text &= "representante legal. O preenchimento de todos os campos do cadastro é condição "
        lblContrato.Text &= "indispensável para a utilização dos serviços de JobClick. As informações "
        lblContrato.Text &= "prestadas pelo Usuário deverão ser completas, exatas, precisas e verdadeiras, e "
        lblContrato.Text &= "este assume o compromisso de atualizar seus dados sempre que houver alguma "
        lblContrato.Text &= "alteração, bem como toda e qualquer responsabilidade relativa às informações "
        lblContrato.Text &= "prestadas. JobClick se reserva o direito de utilizar todos os meios válidos e "
        lblContrato.Text &= "possíveis para identificar os Usuários, não se responsabilizando pela correção "
        lblContrato.Text &= "dos dados pessoais dos Usuários, bem como pelas informações prestadas pelos "
        lblContrato.Text &= "mesmos. Os Usuários garantem e respondem, em qualquer caso, pela veracidade, "
        lblContrato.Text &= "exatidão e autenticidade das informações e dos dados pessoais prestados e "
        lblContrato.Text &= "cadastrados. JobClick poderá a qualquer tempo solicitar informações e dados "
        lblContrato.Text &= "adicionais, bem como documentos que considerem pertinentes a fim de conferir as "
        lblContrato.Text &= "informações prestadas. Outrossim, JobClick reserva-se o direito de inabilitar, "
        lblContrato.Text &= "temporária ou definitivamente, a qualquer tempo, o Usuário que apresentar "
        lblContrato.Text &= "informação inverídica ou o Usuário que não puder ser contatado por JobClick para "
        lblContrato.Text &= "a verificação de tais informações, cancelando automaticamente todas as ofertas "
        lblContrato.Text &= "anunciadas pelo referido Usuário, não assistindo ao Usuário, por essa razão, "
        lblContrato.Text &= "qualquer indenização ou ressarcimento. O Usuário, após cadastramento no site, "
        lblContrato.Text &= "poderá acessar sua conta e informações pessoais através de seus dados e de senha "
        lblContrato.Text &= "específica, e compromete-se a não informar a terceiros esses dados e/ou senha, "
        lblContrato.Text &= "responsabilizando-se integralmente pelo uso que deles seja feito, "
        lblContrato.Text &= "comprometendo-se, ainda, a notificar JobClick imediatamente, por meio do site ou "
        lblContrato.Text &= "de números de telefones informados, a respeito de qualquer uso não autorizado de "
        lblContrato.Text &= "sua conta, bem como o acesso não autorizado por terceiros à mesma. JobClick "
        lblContrato.Text &= "poderá, a seu exclusivo critério, recusar qualquer solicitação de cadastro e/ou "
        lblContrato.Text &= "cancelar qualquer cadastro previamente aceito de qualquer Usuário, sem que "
        lblContrato.Text &= "decorra qualquer direito de indenização ou ressarcimento para o Usuário. O "
        lblContrato.Text &= "Usuário autoriza JobClick desde já a enviar mensagens que JobClick entenda serem "
        lblContrato.Text &= "de seu interesse, a exclusivo critério de JobClick, inclusive, mas sem se "
        lblContrato.Text &= "limitar a informações sobre novos produtos e serviços. O envio de mensagens "
        lblContrato.Text &= "poderá ser cancelado a qualquer tempo, através do link contido em todas as "
        lblContrato.Text &= "mensagens enviadas por JobClick ou mediante solicitação através de e-mail ou "
        lblContrato.Text &= "número de telefone indicado para contato."
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "DA PRIVACIDADE DAS INFORMAÇÕES E DA PROPRIEDADE INTELECTUAL"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "Toda informação ou dado pessoal informado pelo Usuário é armazenado por "
        lblContrato.Text &= "JobClick. O JobClick tomará todas as medidas possíveis para manter a "
        lblContrato.Text &= "confidencialidade e a segurança de tais informações, porém não responderá por "
        lblContrato.Text &= "qualquer prejuízo que possa ser derivado da violação dessas medidas por parte de "
        lblContrato.Text &= "terceiros que utilizem as redes públicas ou a Internet, subvertendo os sistemas "
        lblContrato.Text &= "de segurança para acessar as informações de Usuários. O conteúdo do site "
        lblContrato.Text &= "relativo aos serviços do JobClick, bem como os programas, bancos de dados, redes "
        lblContrato.Text &= "e arquivos que permitem que o Usuário acesse e use os serviços do JobClick são "
        lblContrato.Text &= "de propriedade do JobClick. O uso indevido e a reprodução total ou parcial dos "
        lblContrato.Text &= "referidos conteúdos são proibidos, salvo a autorização expressa do JobClick. O "
        lblContrato.Text &= "site de JobClick poderá conter links para outros sites na Internet, o que não "
        lblContrato.Text &= "significa que esses sites sejam de propriedade de ou operados pelo JobClick ou "
        lblContrato.Text &= "que esta possua qualquer domínio sobre seu conteúdo ou sobre as informações ali "
        lblContrato.Text &= "constantes. Nesse sentido, o JobClick não se responsabilizará por qualquer "
        lblContrato.Text &= "informação, conteúdos, práticas ou serviços ofertados nos mesmos. A presença de "
        lblContrato.Text &= "links para outros sites não implica em relação de sociedade, supervisão, "
        lblContrato.Text &= "cumplicidade ou solidariedade da JobClick para com os respectivos sites e seus "
        lblContrato.Text &= "conteúdos. O usuário titular dos dados pessoais poderá em qualquer momento "
        lblContrato.Text &= "exercer os direitos de acesso, modificação, cancelamento e oposição, mediante "
        lblContrato.Text &= "correio postal aos endereços indicados nos primeiros parágrafos referentes à "
        lblContrato.Text &= "Política de Proteção de Dados com caráter pessoal, no envelope deverá indicar "
        lblContrato.Text &= "''EXCLUIR REGISTRO''."
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "DAS VIOLAÇÕES E SANÇÕES"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "Não é permitida a utilização de nenhum dispositivo, software, ou outro recurso "
        lblContrato.Text &= "que interfira no funcionamento deste site, bem como nos anúncios, descrições, "
        lblContrato.Text &= "contas ou bancos de dados. Qualquer intromissão, tentativa de violação, ou "
        lblContrato.Text &= "atividade que viole ou contrarie as normas de direito de propriedade intelectual "
        lblContrato.Text &= "e/ou as proibições estipuladas nestes Termos e Condições Gerais tornarão o "
        lblContrato.Text &= "responsável passível das ações legais pertinentes, bem como das sanções aqui "
        lblContrato.Text &= "previstas, sendo ainda responsável pelas indenizações por eventuais danos "
        lblContrato.Text &= "causados a JobClick ou a terceiros. Sem prejuízo de outras medidas, JobClick "
        lblContrato.Text &= "poderá advertir, suspender ou cancelar, temporária ou definitivamente, o "
        lblContrato.Text &= "cadastramento de qualquer Usuário, a qualquer tempo, e iniciar as ações legais "
        lblContrato.Text &= "cabíveis(se)"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "a) o Usuário descumprir qualquer dispositivo destes Termos e Condições Gerais;"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "b) o Usuário descumprir seus deveres de Usuário;"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "c) o Usuário praticar atos fraudulentos ou dolosos;"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "d) não puder ser verificada a identidade do Usuário ou qualquer informação "
        lblContrato.Text &= "fornecida pelo Usuário esteja incorreta ou inexata;"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "e) JobClick entender que os anúncios ou qualquer atitude do Usuário haja causado "
        lblContrato.Text &= "algum dano a terceiros ou a JobClick ou tenha a potencialidade de assim o fazer. "
        lblContrato.Text &= "Nos casos de inabilitação do cadastro do Usuário, todas as informações prestadas "
        lblContrato.Text &= "e/ou ofertas realizadas serão automaticamente canceladas."
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "DA RESPONSABILIDADE DA JOBCLICK"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "O JobClick não se responsabiliza pela existência, qualidade, integridade ou "
        lblContrato.Text &= "legitimidade das informações prestadas pelos Usuários, assim como pela "
        lblContrato.Text &= "capacidade dos Usuários para contratar ou pela veracidade dos dados por eles "
        lblContrato.Text &= "inseridos em seus cadastros. O Usuário reconhece e aceita ser o único "
        lblContrato.Text &= "responsável pelas informações que presta ou pelas ofertas que anuncia. JobClick "
        lblContrato.Text &= "não será responsável pelo efetivo cumprimento das obrigações assumidas pelos "
        lblContrato.Text &= "Usuários. O Usuário reconhece e aceita que, ao realizar negociações ou "
        lblContrato.Text &= "contratações com outros Usuários ou terceiros, o faz por sua conta e risco. Em "
        lblContrato.Text &= "nenhum caso JobClick será responsável por qualquer dano e/ou prejuízo que o "
        lblContrato.Text &= "Usuário possa sofrer em virtude de negociações e/ou contratações realizadas ou "
        lblContrato.Text &= "não. Nos casos em que um ou mais Usuários ou algum terceiro venha a apresentar "
        lblContrato.Text &= "qualquer reclamação ou propor qualquer ação, judicial ou extrajudicial, contra "
        lblContrato.Text &= "outro(s) Usuário(s), todos e cada um dos Usuários envolvidos nas reclamações ou "
        lblContrato.Text &= "ações eximem expressamente JobClick, seus diretores, gerentes, empregados, "
        lblContrato.Text &= "agentes, operários, representantes e procuradores de toda e qualquer "
        lblContrato.Text &= "responsabilidade. JobClick não se responsabiliza por qualquer dano, prejuízo ou "
        lblContrato.Text &= "perda no equipamento do Usuário causado por falhas no sistema, no servidor ou na "
        lblContrato.Text &= "internet. JobClick também não será responsável por qualquer vírus que possa "
        lblContrato.Text &= "atacar o equipamento do Usuário em decorrência do acesso, utilização ou "
        lblContrato.Text &= "navegação no presente site ou como conseqüência da transferência de dados, "
        lblContrato.Text &= "arquivos, imagens, textos ou áudio contidos no mesmo. Os Usuários não poderão "
        lblContrato.Text &= "atribuir a JobClick nenhuma responsabilidade nem exigir o pagamento de perdas e "
        lblContrato.Text &= "danos em virtude de prejuízos resultantes de dificuldades técnicas ou falhas nos "
        lblContrato.Text &= "sistemas ou na internet. JobClick não garante o acesso e uso contínuo ou sem "
        lblContrato.Text &= "interrupções de seu site. Este site esta sendo medido e monitorado pelas "
        lblContrato.Text &= "ferramentas das soluções da Google Analytics. Mesmo assim, os cookies poderão "
        lblContrato.Text &= "ser utilizados com a finalidade de facilitar ao máximo a sua navegação pelo "
        lblContrato.Text &= "nosso site, sem que as mesmas lhe proporcionem referências que permitam deduzir "
        lblContrato.Text &= "dados pessoais ou dados do disco duro do seu computador. Os cookies instalados "
        lblContrato.Text &= "no seu computador serão apagados automaticamente depois de 30 dias desde a sua "
        lblContrato.Text &= "instalação. Entretanto, você pode configurar seu computador para que lhe "
        lblContrato.Text &= "notifique e rechace a instalação destes cookies enviados por JobClick.com.br, "
        lblContrato.Text &= "sem que isso prejudique seu acesso ao conteúdo do nosso site."
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "DO PREÇO"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "Para cadastrar-se e utilizar o site de JobClick, o ''Usuário – Candidato aos "
        lblContrato.Text &= "anúncios de empregos'', não deverá pagar absolutamente nada e tem a total "
        lblContrato.Text &= "liberdade para cancelar seu registro a qualquer tempo, também livre de "
        lblContrato.Text &= "cobranças. ''Para o Usuário – Anunciante de Oferta de Emprego'' será permitido "
        lblContrato.Text &= "inserir gratuitamente e por mês, até 5 ofertas da modalidade de anúncio que "
        lblContrato.Text &= "denominamos de ''Oferta Simples'' . Veja detalhes deste tipo de anúncio na Página "
        lblContrato.Text &= "de Produtos e Serviços . O usuário , ao optar por este tipo de anúncio , declara "
        lblContrato.Text &= "que aceita amplamente suas condições . Também poderá cancelar seu registro a "
        lblContrato.Text &= "qualquer tempo, livre de cobranças . O Site oferece a opção de anúncios pagos, "
        lblContrato.Text &= "cuja modalidade denomina de ''Oferta Completa''. Veja detalhes deste tipo de "
        lblContrato.Text &= "anúncio e seus respectivos Preços (Pacotes e Promoções) na Página de Produtos e "
        lblContrato.Text &= "Serviços. Neste caso, o usuário, ao optar por ''Ofertas Completas'', declara que "
        lblContrato.Text &= "aceita amplamente as condições desta modalidade, comprometendo-se a pagar os "
        lblContrato.Text &= "valores contratados segundo as formas e prazos de pagamentos acordados. O Site "
        lblContrato.Text &= "reserva-se no direito de publicar esta Modalidade do Anúncio (Oferta Completa), "
        lblContrato.Text &= "somente após a comprovação do pagamento. Na hipótese de JobClick passar a cobrar "
        lblContrato.Text &= "por novos ou todos os serviços prestados neste site, se compromete a divulgar "
        lblContrato.Text &= "amplamente sua nova política e informar aos seus Usuários com antecedência de 30 "
        lblContrato.Text &= "dias , para que eles decidam se desejam continuar utilizando ou não os serviços "
        lblContrato.Text &= "do site, hipótese em que o Usuário concordaria em pagar a JobClick todos os "
        lblContrato.Text &= "valores decorrentes da utilização dos serviços disponibilizados no site, tais "
        lblContrato.Text &= "como anúncios, comissões ou valores para destaque, ou por qualquer outro serviço "
        lblContrato.Text &= "prestado por JobClick. JobClick reserva-se no direito de abster-se de cobrar, "
        lblContrato.Text &= "modificar, aumentar, reduzir ou eliminar preços vigentes a qualquer momento, "
        lblContrato.Text &= "notificando os Usuários, individualmente ou por meio de publicações em seu site "
        lblContrato.Text &= "para tanto, ou durante promoções e outras formas transitórias da alteração dos "
        lblContrato.Text &= "preços praticados. JobClick reservar-se no direito também de tomar as medidas "
        lblContrato.Text &= "judiciais e extrajudiciais pertinentes para receber os valores devidos"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "DO CONTEÚDO DOS TERMOS E CONDIÇÕES GERAIS"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "Estes Termos e Condições Gerais não geram nenhum relacionamento de sociedade, "
        lblContrato.Text &= "mandato ou relação de trabalho entre JobClick e o Usuário. O Usuário manifesta "
        lblContrato.Text &= "ciência de que JobClick não é parte de nenhuma contratação, nem possui qualquer "
        lblContrato.Text &= "controle sobre a qualidade, segurança ou legalidade das ofertas anunciadas, "
        lblContrato.Text &= "sobre a veracidade ou exatidão das informações, e/ou sobre a capacidade dos "
        lblContrato.Text &= "Usuários. JobClick poderá alterar, a qualquer tempo, os presentes Termos e "
        lblContrato.Text &= "Condições Gerais, sem necessidade de prévia comunicação ao Usuário. A nova "
        lblContrato.Text &= "redação dos Termos e Condições Gerais entrará em vigor 30 (trinta) dias após sua "
        lblContrato.Text &= "divulgação e publicação no site. No prazo de 5 (cinco) dias contados a partir da "
        lblContrato.Text &= "publicação das referidas modificações, o Usuário deverá comunicar-se por e-mail, "
        lblContrato.Text &= "caso não concorde com os termos alterados. Nesse caso, o vínculo contratual "
        lblContrato.Text &= "deixará de existir, desde que não haja contas ou dívidas em aberto. Não havendo "
        lblContrato.Text &= "manifestação no prazo estipulado, entender-se-á que o Usuário aceitou "
        lblContrato.Text &= "tacitamente os novos Termos e Condições e o contrato continuará vinculando as "
        lblContrato.Text &= "partes."
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "DA RESPONSABILIDADE DOS USUÁRIOS"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "O Usuário indenizará JobClick, suas filiais, empresas controladas ou "
        lblContrato.Text &= "controlantes, diretores, administradores, colaboradores, representantes e "
        lblContrato.Text &= "empregados por qualquer demanda promovida por outros Usuários ou terceiros "
        lblContrato.Text &= "decorrente de suas atividades no site ou por descumprimento por parte do Usuário "
        lblContrato.Text &= "dos Termos e Condições Gerais, assim como pela violação de qualquer lei ou de "
        lblContrato.Text &= "direitos de terceiros, incluindo honorários de advogados."
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "DA LEGISLAÇÃO E FORO APLICÁVEIS"
        lblContrato.Text &= "<br />"
        lblContrato.Text &= "Os presentes Termos e Condições Gerais são regidos pelas leis brasileiras e as "
        lblContrato.Text &= "partes elegem o foro da Cidade de Guarulhos como foro competente para dirimir "
        lblContrato.Text &= "quaisquer dúvidas ou controvérsias relacionadas aos Termos e Condições Gerais."

    End Sub

    Protected Sub FecharPanel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles FecharPanel.Click, LbFechar1.Click
        Panel1.Visible = False
    End Sub

    Protected Sub paisDropDownList_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles paisDropDownList.DataBound
        paisDropDownList.SelectedValue = "Brasil"
    End Sub

    Protected Sub Cadastro_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles Cadastro.Click


        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim ValidaCNPJres As New myValidaCNPJ

        REM 
        REM	@userName As varchar(16),
        REM @password As varchar(16),
        REM @email As varchar(180),
        REM @frase As varchar(60),

        REM @idAreaAtuacao As int,
        REM @idPorte As int,
        REM @nmempresa As varchar(200),
        REM @cnpj As varchar(20),
        REM @emailRes As varchar(200),
        REM @nomeRes As varchar(200),
        REM @endereco As varchar(200),
        REM @cep As varchar(10),
        REM @bairro As varchar(180),
        REM @cidade As varchar(100),
        REM @uf As char(2),
        REM @pais As varchar(100),
        REM @privacidade bit
        REM

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spGravaCadastroEscola", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@userName", SqlDbType.VarChar, 16)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@userName").Value = userNameTextBox.Text.ToString


        prm = New SqlParameter("@password", SqlDbType.VarChar, 16)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@password").Value = passwordTextBox.Text.ToString


        prm = New SqlParameter("@email", SqlDbType.VarChar, 180)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@email").Value = emailTextBox.Text.ToString


        prm = New SqlParameter("@frase", SqlDbType.VarChar, 60)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@frase").Value = fraseTextBox.Text.ToString

        REM *****************************************************************************************

        prm = New SqlParameter("@idAreaAtuacao", SqlDbType.Int, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idAreaAtuacao").Value = 50 'idAreaAtuacaoDropDownList.SelectedValue


        prm = New SqlParameter("@idPorte", SqlDbType.Int, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idPorte").Value = idPorteRadioButtonList.SelectedValue.ToString


        prm = New SqlParameter("@nmempresa", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@nmempresa").Value = nmempresaTextBox.Text.ToString


        prm = New SqlParameter("@cnpj", SqlDbType.VarChar, 20)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@cnpj").Value = TextBoxCNPJ.Text.ToString


        prm = New SqlParameter("@emailRes", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@emailRes").Value = emailTextBox.Text.ToString


        prm = New SqlParameter("@nomeRes", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@nomeRes").Value = nomeResTextBox.Text.ToString


        prm = New SqlParameter("@endereco", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@endereco").Value = enderecoTextBox.Text.ToString


        prm = New SqlParameter("@cep", SqlDbType.VarChar, 10)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@cep").Value = cepTextBox.Text.ToString


        prm = New SqlParameter("@bairro", SqlDbType.VarChar, 180)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@bairro").Value = bairroTextBox.Text.ToString


        prm = New SqlParameter("@cidade", SqlDbType.VarChar, 100)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@cidade").Value = cidadeTextBox.Text.ToString


        prm = New SqlParameter("@uf", SqlDbType.Char, 2)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@uf").Value = DDUf.SelectedValue.ToString


        prm = New SqlParameter("@pais", SqlDbType.VarChar, 100)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@pais").Value = paisDropDownList.SelectedValue.ToString

        prm = New SqlParameter("@privacidade", SqlDbType.Int, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@privacidade").Value = PrivacidadeRadioButtonList.SelectedValue.ToString

        If Session("VarError") Then

            Try

                cn.Open()

                Dim dr As SqlDataReader = cmd.ExecuteReader

                lblmsn.Text = "Escola cadastrada no sistema JobClick..."
                enviaEmail(emailTextBox.Text)
                dr.Close()

                Dim AutoLogon As New user

                Session("idUser") = AutoLogon.idUser(userNameTextBox.Text, passwordTextBox.Text, emailTextBox.Text)
                Session("idCadastroEmpresa") = AutoLogon.idCadastroEmpresa(Session("idUser"))
                AutoLogon.AutoLogin(Session("idUser"))

                Response.Redirect("/_escola/Default.aspx")

            Catch ex As Exception

                lblmsn.Text = "Escola cadastrada no sistema JobClick, não pode ser redirecionada..."

            End Try


        Else

            lblmsn.Text = "Erro ao cadastrar sua escola, CNPJ já cadastrado!"

        End If

        cn.Close()


    End Sub

    Sub enviaEmail(ByVal email As String)

        Dim mensagemCandidato As New email

        REM ** ***************************************************************************************************
        Dim MODELO As String = "CadastroI"
        REM ** ***************************************************************************************************

        Dim URL As String = Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.AbsolutePath, "")

        mensagemCandidato.enviarDB(MODELO, URL, userNameTextBox.Text, emailTextBox.Text, Application("idsetup").ToString, userNameTextBox.Text, passwordTextBox.Text, fraseTextBox.Text, Session("ip"))

    End Sub


    Protected Sub idAreaAtuacaoDropDownList_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles idAreaAtuacaoDropDownList.DataBound
        idAreaAtuacaoDropDownList.SelectedValue = 50
    End Sub
End Class
