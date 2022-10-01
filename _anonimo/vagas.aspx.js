/// <reference path="~/jquery-1.7.min.js" />

function replaceAll(string, token, newtoken) {
    while (string.indexOf(token) != -1) {
        string = string.replace(token, newtoken);
    }
    return string;
}

// ----------------------------------------------------------------- /Pesquisa ---------------------------------------------------------------------
//-------------------------------------- Classes --------------------------------

var ClassVagas = {
    ResultSet: undefined

    , PrintVaga: function () {
        ORDERID = this.ResultSet.ORDERID
        idVaga = this.ResultSet.idVaga
        strVaga = this.ResultSet.strVaga
        strEmpresa = this.ResultSet.strEmpresa
        strSite = this.ResultSet.strSite
        strLogo = this.ResultSet.strLogo
        strDsVaga = this.ResultSet.strDsVaga
        strFuncao = this.ResultSet.strFuncao
        strNivelProfissional = this.ResultSet.strNivelProfissional
        strFormacaoAcademica = this.ResultSet.strFormacaoAcademica
        strPerfilVaga = this.ResultSet.strPerfilVaga
        strCargo = this.ResultSet.strCargo
        strCargosRelacionados = this.ResultSet.strCargosRelacionados
        numQtdVaga = this.ResultSet.numQtdVaga
        strTipoContratacao = this.ResultSet.strTipoContratacao
        strQualificacaoHabilidadesEspecificas = this.ResultSet.strQualificacaoHabilidadesEspecificas
        strLocalTrabalho = this.ResultSet.strLocalTrabalho
        strUF = this.ResultSet.strUF
        strSalarioBase = this.ResultSet.strSalarioBase
        strHonorario = this.ResultSet.strHonorario
        strRemuneracaoVariavel = this.ResultSet.strRemuneracaoVariavel
        strBeneficios = this.ResultSet.strBeneficios
        strPerspectiva = this.ResultSet.strPerspectiva
        strFaixaEtariaInicio = this.ResultSet.strFaixaEtariaInicio
        strFaixaEtariaFim = this.ResultSet.strFaixaEtariaFim
        strSexo = this.ResultSet.strSexo
        strPerfilComposicaoEquipe = this.ResultSet.strPerfilComposicaoEquipe
        strPerfilGestor = this.ResultSet.strPerfilGestor
        strConhecimentoIdioma = this.ResultSet.strConhecimentoIdioma
        strConhecimentoInformatica = this.ResultSet.strConhecimentoInformatica
        strCursoEspecifico = this.ResultSet.strCursoEspecifico
        strConhecimento = this.ResultSet.strConhecimento
        strCompetenciaComportamental = this.ResultSet.strCompetenciaComportamental
        strCompetenciaProfissional = this.ResultSet.strCompetenciaProfissional
        strAspectoCritico = this.ResultSet.strAspectoCritico
        strPrincipalDesafio = this.ResultSet.strPrincipalDesafio
        strRelacionamentoInterno = this.ResultSet.strRelacionamentoInterno
        strRelacionamentoExterno = this.ResultSet.strRelacionamentoExterno
        strViagens = this.ResultSet.strViagens
        strinfoSobre_Viagens = this.ResultSet.strinfoSobre_Viagens
        strObsComplementares = this.ResultSet.strObsComplementares
        strProtocolo = this.ResultSet.strProtocolo
        strValidade = this.ResultSet.strValidade
        NivelTipoVaga = this.ResultSet.NivelTipoVaga
        pne = this.ResultSet.pne
        flgCandidatou = this.ResultSet.flgCandidatou

        result = ""

        result += "<li id=\"" + ORDERID + "\" class=\"ulli\" onmouseover=\"javascript: $('#social " + ORDERID + "').show();\">";

        result += "<table style=\"width:100%; font-family: Arial, Helvetica, sans-serif; font-size: small; text-align:left\" cellpadding=\"2\" cellspacing=\"2\">"
        result += "<tr>"
        result += "<td align=\"center\" rowspan=\"3\" valign=\"top\" width=\"100px\">"
        if (strLogo != "") {
            if (NivelTipoVaga == 1) {
                result += "<a href=\"" + strSite + "\" target=\"_blank\">"
            }
            result += "<img alt=\"\" src=\"../images/buscador/"
            result += strLogo
            result += "\" border=\"0px\" />"
            if (NivelTipoVaga == 1) {
                result += "</a>"
            }
        }
        else
            result += "<img alt=\"\" src=\"../images/buscador/confidencial.png\" border=\"0px\" />"

        result += "</td>"
        result += "<td>"
        result += "<div style=\"float: left\">"
        if (flgCandidatou == 1) {
            result += "<span style=\"color: #660099; font-size: 12pt; text-decoration: underline;\">"
        } else {
            result += "<span style=\"color: #1122cc; font-size: 12pt; text-decoration: underline;\">"
        }
        result += "<a onclick=\"javascript: $('#openclose" + ORDERID + "').click();\" style=\"cursor: pointer\">"
        result += strVaga
        result += "</a></span></div>"
        if (flgCandidatou == 1) {
            result += "<div style=\"float: left\">&nbsp; <img src=\"../images/candidatou.gif\" onmouseover=\"javascript: $('#labelCandidatou" + ORDERID + "').toggle(500);\" onmouseout=\"javascript: $('#labelCandidatou" + ORDERID + "').toggle(500);\" />&nbsp;</div><div id=\"labelCandidatou" + ORDERID + "\" style=\"display: none; float: left; font-weight: bold; color: #737373\"> Candidatou-se à esta vaga </div>"
        }
        if (NivelTipoVaga == 1) {
            result += "<div style=\"float: left\">&nbsp; <img src=\"../images/star.png\" onmouseover=\"javascript: $('#labelVagaOuro" + ORDERID + "').toggle(500);\" onmouseout=\"javascript: $('#labelVagaOuro" + ORDERID + "').toggle(500);\" />&nbsp;</div><div id=\"labelVagaOuro" + ORDERID + "\" style=\"display: none; float: left; font-weight: bold; color: #f8bb37\"> Ouro </div>"
        }
        result += "</td>"
        result += "</tr>"
        result += "<tr>"
        result += "<td>"
        result += "<span style=\"color: #009933;\"> Código: "
        result += strProtocolo
        result += "</span> <br /> "
        result += replaceAll(replaceAll(strQualificacaoHabilidadesEspecificas, "<br>", ""), "<br />", "")
        result += "<br />"
        result += "<span class=\"style1\" style=\"font-size: x-small;\">Quantidade de Vagas: "
        result += numQtdVaga
        result += " - Local de Trabalho: "
        result += strLocalTrabalho
        result += " - "
        result += strUF
        result += "</span>"
        result += "<br />"
        result += "<div style=\"float:left; height:25px\">"
        result += "<span style=\"color: #1122cc\"><a onclick=\"javascript: $('#NomeVagaCandidato').text('" + strVaga + "');  $('#idVagaCandidato').val('" + idVaga + "');  $('#CodigoVagaCandidato').text('" + strProtocolo + "'); $('#idTipoVagaCandidato').val('" + NivelTipoVaga + "'); $('#CandidatarSe').click(); $('.DGCandidatarsePosition').css('top', ($(this).position().top - 150)  + 'px');\" style=\"cursor: pointer\">Candidatar-se</a></span>"
        result += "<span class=\"style1\"> - </span>"
        result += "<span style=\"color: #1122cc\"><a onclick=\"javascript: $('#IndicaAmigo').click(); $('#strVaga').text('" + strVaga + "');  $('#idVaga').val('" + idVaga + "');  $('#strCodigo').text('" + strProtocolo + "'); $('.DGINDICAPosition').css('top', ($(this).position().top - 150)  + 'px');\" style=\"cursor: pointer; \">Indicar para Amigos</a></span>"
        result += "<span class=\"style1\"> - </span>"
        result += "<span style=\"color: #1122cc\"><a onclick=\"javascript: $('#opencloseSocial" + ORDERID + "').click();\" style=\"cursor: pointer\">Redes Sociais</a></span>"
        result += "<span class=\"style1\"> - </span>"
        result += "<span style=\"color: #1122cc\"><a onclick=\"javascript: $('#openclose" + ORDERID + "').click();\" style=\"cursor: pointer\">Detalhes da Oportunidade</a></span>"
        result += "</div>"
        result += "</td>"
        result += "<td style=\"text-align: right\">"
        if (pne == 1) {
            result += "<img src=\"/images/candidato/cv/deficienteT.png\">"
        }
        result += "</td>"
        result += "</tr>"
        result += "<tr>"
        result += "<td>"

        result += "<a id=\"opencloseSocial" + ORDERID + "\" class=\"OpenClose\" href=\"#\" onclick=\"$(this).siblings('.DivSocial').toggle(500, function() {$('#Painel_Jobclick', parent.document).find('iframe').height($(document).height());}); CreateSocialButtons('#social" + ORDERID + "', '" + strProtocolo + "', '" + strVaga + "'); \"></a>"
        result += "<div id=\"social" + ORDERID + "\" class=\"DivSocial\" style=\"display: none; height:30px;\">"
        result += "</div>"


        result += "<a id=\"openclose" + ORDERID + "\" class=\"OpenClose\" href=\"#\" onclick=\"$(this).siblings('.DivStyle').toggle(500, function() {$('#Painel_Jobclick', parent.document).find('iframe').height($(document).height());}); fnContador('" + idVaga + "', '" + NivelTipoVaga + "'); \"></a>"

        result += "<div class=\"DivStyle\" style=\"display:none\">"

        result += "<table cellspacing=\"0\" border=\"0\" style=\"border-color:Gray;border-width:1px;border-style:Groove;width:100%;border-collapse:collapse;\">"
        result += "<tr>"
        result += "<td colspan=\"2\">"
        result += "<table cellpadding=\"4\" cellspacing=\"0\" width=\"100%\">"
        result += "<tr>"
        result += "<td>"
        result += "<table cellpadding=\"10\" cellspacing=\"0\" style=\"width: 100%\">"
        result += "<tr>"
        result += "<td align=\"left\" bgcolor=\"#999999\" style=\"width:50%\">"
        result += "<a onclick=\"javascript: $('#IndicaAmigo').click(); $('#strVaga').text('" + strVaga + "');  $('#idVaga').val('" + idVaga + "');  $('#strCodigo').text('" + strProtocolo + "'); \" style=\"cursor: pointer; color:White;font-weight:bold;\">Indique esta oportunidade a um amigo</a>"
        result += "</td>"
        result += "<td align=\"right\" bgcolor=\"#999999\" style=\"width:50%\">"
        result += "<a onclick=\"javascript: $('#openclose" + ORDERID + "').click();\" style=\"cursor: pointer; color:White;font-weight:bold;\">Fechar</a>"
        result += "&nbsp;&nbsp;"
        result += "</td>"
        result += "</tr>"
        result += "</table>"
        result += "<table>"
        result += "<tr>"
        result += "<td valign=\"top\" style=\"text-align: left; vertical-align: top\">"
        if (pne == 1) {
            result += "<br />"
            result += "<img src=\"/images/candidato/cv/deficienteT.png\">"
        }
        result += "</td>"
        result += "<td>"
        result += "<br />"
        result += "<span class=\"tituloVaga\">"
        result += strVaga
        result += "</span>"
        result += "<br />"
        result += "<br />"
        result += "<span>"
        result += strDsVaga
        result += "</span>"
        result += "<br />"
        result += "<br />"
        result += "</td>"
        result += "</tr>"
        result += "</table>"

        result += "<span class=\"titulo\"> Código: "
        result += strProtocolo
        result += "</span>"
        result += "<br />"
        result += "</td>"
        result += "</tr>"
        result += "</table>"
        result += "<table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">"

        if (strNivelProfissional !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Nível Profissional: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strNivelProfissional
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strQualificacaoHabilidadesEspecificas !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Qualificações e Habilidades Específicas: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strQualificacaoHabilidadesEspecificas
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strUF !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Local de Trabalho: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strLocalTrabalho
            result += " - "
            result += strUF
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strFormacaoAcademica !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Formação Acadêmica: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strFormacaoAcademica
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strTipoContratacao !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Tipo da Contratação: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strTipoContratacao
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strSalarioBase !== "0,00") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Salário Base: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += "R$ " + strSalarioBase
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strHonorario !== "0,00") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Honorários: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += "R$ " + strHonorario
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strRemuneracaoVariavel !== "0,00") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Remuneração Variavel: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += "R$ " + strRemuneracaoVariavel
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strBeneficios !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Benefícios: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strBeneficios
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strPerspectiva !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Perspectiva: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strPerspectiva
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strFaixaEtariaInicio !== "0") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Idade Mínima: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strFaixaEtariaInicio
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strFaixaEtariaFim !== "0") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Idade Máxima: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strFaixaEtariaFim
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strSexo !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Sexo: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strSexo
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strPerfilComposicaoEquipe !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Perfil Composição da Equipe: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strPerfilComposicaoEquipe
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strPerfilGestor !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Perfil Composição do Gestor: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strPerfilGestor
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strConhecimentoIdioma !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Conhecimento em Idiomas: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strConhecimentoIdioma
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strConhecimentoInformatica !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Conhecimento em Informática: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strConhecimentoInformatica
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strCursoEspecifico !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Cursos Especificos: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strCursoEspecifico
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strConhecimento !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Conhecimentos Específicos: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strConhecimento
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strCompetenciaComportamental !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Competências Comportamentais: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strCompetenciaComportamental
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strCompetenciaProfissional !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Competências Profissionais: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strCompetenciaProfissional
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strAspectoCritico !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Aspectos Críticos: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strAspectoCritico
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strPrincipalDesafio !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Principal Desafio: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strPrincipalDesafio
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strRelacionamentoInterno !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Relacionamento Interno: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strRelacionamentoInterno
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strRelacionamentoExterno !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Relacionamento Externo: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strRelacionamentoExterno
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strViagens !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Viagens: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strViagens
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strinfoSobre_Viagens !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Informações sobre Viagens: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strinfoSobre_Viagens
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strObsComplementares !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Observações: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strObsComplementares
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (numQtdVaga !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Quantidade de Vagas: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += numQtdVaga
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strCargosRelacionados !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Cargos Relacionados: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strCargosRelacionados
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        if (strValidade !== "") {
            result += "<tr>"
            result += "<td align=\"right\" class=\"tableFormulario\" valign=\"top\" width=\"30%\">"
            result += "<span class=\"tituloEmp\">"
            result += "Data de Finalização da Vaga: "
            result += "</span>"
            result += "</td>"
            result += "<td class=\"tableFormulario\">"
            result += "<span>"
            result += strValidade
            result += "</span>"
            result += "</td>"
            result += "</tr>"
        }

        result += "</table>"
        result += "<br />"
        result += "<table align=\"center\" cellpadding=\"0\" cellspacing=\"0\">"
        result += "<tr>"
        result += "<td align=\"center\">"
        result += "<asp:LinkButton ID=\"LinkButton_CandidatarSe\" onclick=\"javascript: $('#NomeVagaCandidato').text('" + strVaga + "');  $('#idVagaCandidato').val('" + idVaga + "');  $('#CodigoVagaCandidato').text('" + strProtocolo + "'); $('#idTipoVagaCandidato').val('" + NivelTipoVaga + "'); $('#CandidatarSe').click(); $('.DGCandidatarsePosition').css('top', ($(this).position().top - 150)  + 'px');\" \" style=\"cursor: pointer; border-width:0px\" class=\"button\">Candidatar-se a esta oportunidade</asp:LinkButton>"
        result += "<script type='text/javascript'> $('.DGCandidatarsePosition').center(); </script>"
        result += "</td>"
        result += "</tr>"
        result += "</table>"
        result += "<br />"
        result += "</td>"
        result += "</tr>"
        result += "</table>"

        result += "</div>"

        result += "</td>"
        result += "</tr>"
        result += "</table>"
        result += "<br />"

        result += "</li>"

        return result;
    }
}

//-------------------------------------- /Classes --------------------------------


//-------------------------------------- Initialize --------------------------------
$.ajaxSetup({
    cache: false
	, global: false
});

$(document).ready(function () {
    //More();
});

$(parent.window).scroll(function () {
    if ($(parent.window).scrollTop() >= $(document).height() - $(parent.window).height() - 100) {
        More();
    }
});

function Trim(str) { return str.replace(/^\s+|\s+$/g, ""); };

function parseScript(_source) {
    var source = _source;
    var scripts = new Array();

    // Strip out tags
    while (source.indexOf("<script") > -1 || source.indexOf("</script") > -1) {
        var s = source.indexOf("<script");
        var s_e = source.indexOf(">", s);
        var e = source.indexOf("</script", s);
        var e_e = source.indexOf(">", e);

        // Add to scripts array
        scripts.push(source.substring(s_e + 1, e));
        // Strip from source
        source = source.substring(0, s) + source.substring(e_e + 1);
    };

    // Loop through every script collected and eval it
    for (var i = 0; i < scripts.length; i++) {
        try {
            eval(scripts[i]);
        }
        catch (ex) {
            // do what you want here when a script fails
        };
    };

    // Return the cleaned source
    return source;
};

//-------------------------------------- /Social --------------------------------
function CreateSocialButtons(SocialDiv, StrProtocolo, strVaga) {

    $(SocialDiv).empty();
    StrProtocolo = StrProtocolo.replace("/", "%2f")

    // Facebook //
    var fblike = $(document.createElement("div"));
    fblike.attr("class", "fb-like");
    fblike.attr("data-href", "http://www.jobclick.com.br/_anonimo/vagas.aspx&#63;pesquisa=" + strProtocolo);
    fblike.attr("data-send", "true");
    fblike.attr("data-layout", "button_count");
    fblike.attr("data-show-faces", "false");
    $(SocialDiv).append(fblike);
    FB.XFBML.parse();

    // Google +1 //
    var gplus = $(document.createElement("div"));
    gplus.attr("class", "g-plusone");
    gplus.attr("data-href", "http://www.jobclick.com.br/_anonimo/vagas.aspx&#63;pesquisa=" + strProtocolo);
    gplus.attr("data-size", "medium");
    $(SocialDiv).append(gplus);
    gapi.plusone.go();

    // Twitter //
    var tweet = $(document.createElement("a"));
    tweet.attr("class", "twitter-share-button");
    tweet.attr("href", "https://twitter.com/share");
    tweet.attr("data-url", "http://www.jobclick.com.br/_anonimo/vagas.aspx?pesquisa=" + strProtocolo);
    tweet.attr("data-text", "Vaga JobClick: " + strVaga);
    tweet.attr("data-lang", "pt");
    $(SocialDiv).append(tweet);
    twttr.widgets.load();
};
//-------------------------------------- /Social --------------------------------

//-------------------------------------- /Initialize --------------------------------

// ----------------------------------- Busca mais vagas para apresentar --------------------------------------
function More() {
    if ($get("switch").value == "false") {

        $get("switch").value = "true";

        LAST_OrderID = $get("LAST_OrderID").value;
        searchTerm = $get("pesquisa").value;
        idEmpresaParam = idEmpresa;
        CidadeParam = Cidade;
        EstadoParam = Estado;
        idParceiroParam = idParceiro;
        idCurriculoParam = $('#SelectedCurriculo').val();

        if (PNE == "True") {
            PNEParam = 1;
        }
        else {
            PNEParam = 0;
        }

        if (!partner) {
            idParceiroParam = 0;
        };

        $('#moreButton').show();
        $.getJSON(
                    "/services/PesquisaVagaMais.aspx"
                    , {
                        "LAST_OrderID": LAST_OrderID
                        , "searchTerm": searchTerm
                        , "idEmpresa": idEmpresaParam
                        , "idParceiro": idParceiroParam
                        , "Cidade": CidadeParam
                        , "Estado": EstadoParam
                        , "PNE": PNEParam
                        , "idCurriculo": idCurriculoParam
                    }
                    , "")
                    .success(function (data) {
                        if (data.ResultStatus == true) {
                            var htmlresult = ""
                            $.each(data.ResultSet, function (i) {
                                ClassVagas.ResultSet = data.ResultSet[i];

                                htmlresult += ClassVagas.PrintVaga();
                            });
                            OnVagaComplete(htmlresult)
                            document.getElementById("switch").value = data.ResultSwitch;
                            document.getElementById("LAST_OrderID").value = data.ResultLAST_OrderID;
                            $(".button").addClass(css);

                        }
                        else {
                            $('#moreButton').html('<div style="color: red"> Falha ao carregar as oportunidades. Por favor, entre em contato com <a href="mailto:helpdesk@jobclick.com.br">helpdesk@jobclick.com.br</a>.');
                            console.log(data.ResultStatus_ErrorMessage);
                        }
                    })
                    .error(function () {
                        $('#moreButton').html('<div style="color: red"> Falha ao carregar as oportunidades. Por favor, entre em contato com <a href="mailto:helpdesk@jobclick.com.br">helpdesk@jobclick.com.br</a>.');
                        console.log('Pagina/Serviço PesquisaVagaMais não encontrada');
                    });
    }
}

function OnVagaComplete(result) {
    $get("dispVaga").innerHTML += parseScript(result);
    $('#moreButton').hide();
    if (result.length == 0) {
        if (Trim($get("dispVaga").innerHTML) == "") {
            if (document.getElementById("pesquisa").value == "") {
                SemResultado = "</ul>";
                SemResultado += "<span style='font-size: 12pt; font-face: Verdana'>";
                SemResultado += "Não existem vagas abertas no momento para a região de: ";
                SemResultado += $('.DropDownList_Estado option:selected').text();
                SemResultado += ". ";
                SemResultado += "</span>";
                SemResultado += "<ul>";
            } else {
                SemResultado = "</ul>";
                SemResultado += "<span style='font-size: 12pt; font-face: Verdana'>";
                SemResultado += "Sua pesquisa - ";
                SemResultado += "<span style='font-weight: bold;'>";
                SemResultado += document.getElementById("pesquisa").value;
                SemResultado += "</span>";
                SemResultado += " - não encontrou nenhuma oportunidade aberta.";
                SemResultado += "<br />";
                SemResultado += "<br />";
                SemResultado += "Sugestões:";
                SemResultado += "<br />";
                SemResultado += "<br />";
                SemResultado += "<ul style='list-style-type: disc; list-style-position: inside;'>"
                SemResultado += "<li>";
                SemResultado += "Certifique-se de que todas as palavras estejam escritas corretamente.";
                SemResultado += "</li><li>";
                SemResultado += "Tente palavras-chave diferentes.";
                SemResultado += "</li><li>";
                SemResultado += "Tente palavras-chave mais genéricas.";
                SemResultado += "</li>";
                SemResultado += "</ul>";
                SemResultado += "</span>";
                SemResultado += "<ul>";
            };
            $get("dispVaga").innerHTML = SemResultado;
        };
    };
}

// ----------------------------------- /Busca mais vagas para apresentar --------------------------------------

// ----------------------------------- Contador de Visualizações --------------------------------------
LAST_idVaga = 0;

function fnContador(idVaga, strTipoNivelVaga) {
    if (LAST_idVaga != idVaga) {
        $.getJSON(
                    "/services/ContadorVaga.aspx"
                    , {
                        "idVaga": idVaga
                        , "strTipoNivelVaga": strTipoNivelVaga
                    }
                    , "")
                    .success(function (data) {
                        if (data.ResultStatus == false) {
                            console.log(data.ResultStatus_ErrorMessage);
                        }
                    })
                    .error(function () {
                        console.log('Pagina/Serviço ContadorVaga não encontrada');
                    });
    };

    LAST_idVaga = idVaga;
};

// ----------------------------------- /Busca mais vagas para apresentar --------------------------------------
// ----------------------------------------------------------------- /Pesquisa --------------------------------------------------------------------- 


// ----------------------------------------------------------------- Envia Email Amigo ---------------------------------------------------------------------
//-------------------------------------- Initialize --------------------------------
$(document).ready(function () {
    $('.DGINDICAPosition').center();
    //$("#aspnetForm #IndicaEmailAmigoForm").validationEngine({scroll: false});
    //$("#aspnetForm #IndicaEmailAmigoForm").validationEngine('attach');
});

$(parent.window).scroll(function () {
    $('.DGINDICAPosition').center();
    //$("##aspnetForm #IndicaEmailAmigoForm").validationEngine("updatePromptsPosition");
});

function OnSendingWindow(elewindow) {
    thewindow = '#formAmigo' + elewindow;

    $('#formAmigo').hide();
    $('#formAmigoErro').hide();
    $('#formAmigoEnviado').hide();
    $('#formAmigoEnviando').hide();
    $(thewindow).show();

    //$('#aspnetForm #IndicaEmailAmigoForm').validationEngine('hideAll');
}
//-------------------------------------- /Initialize --------------------------------

//-------------------------------------- Envia Indicação de Amigo --------------------------------
function fnEnviaEmailAmigo() {
    strCodigo = $('#strCodigo').text();
    strVaga = $('#strVaga').text();
    nomeTextBox = $('#nomeTextBox').val();
    emailTextBox = $('#emailTextBox').val();
    mensagem = $('#mensagem').val();
    inomeTextBox = $('#inomeTextBox').val();
    iemailTextBox = $('#iemailTextBox').val();

    //FormValidated = $("#aspnetForm #IndicaEmailAmigoForm").validationEngine('validate');

    //if (navigator.appName == 'Microsoft Internet Explorer') {
    FormValidated = true;
    //}

    if (FormValidated == true) {
        OnSendingWindow('Enviando');
        $.getJSON(
                    "/services/EnviarEmailAmigo.aspx"
                    , {
                        "strCodigo": strCodigo
                        , "strVaga": strVaga
                        , "nomeTextBox": nomeTextBox
                        , "emailTextBox": emailTextBox
                        , "mensagem": mensagem
                        , "inomeTextBox": inomeTextBox
                        , "iemailTextBox": iemailTextBox
                    }
                    , "")
                    .success(function (data) {
                        if (data.ResultStatus == true) {
                            OnSendingWindow('Enviado');
                        }
                        else {
                            console.log(data.ResultStatus_ErrorMessage);
                            OnSendingWindow('Erro');
                        }
                    })
                    .error(function () {
                        console.log('Pagina/Serviço EnviarEmailAmigo não encontrada');
                        OnSendingWindow('Erro');
                    });
    };
};

//-------------------------------------- Envia Indicação de Amigo --------------------------------
// ----------------------------------------------------------------- /Envia Email Amigo ---------------------------------------------------------------------


// ----------------------------------------------------------------- Candidatar-se ---------------------------------------------------------------------

//-------------------------------------- Initialize --------------------------------

$(document).ready(function () {

    //-------------------------------------- Encontra Curriculos do Candidato Logado --------------------------------
    $.getJSON(
                "/services/PesquisaCurriculo.aspx"
                , {
                    "idUser": idUser
                }
                , "")
                .success(function (data) {
                    if (data.ResultStatus == true) {
                        result = "<select id=\"SelectedCurriculo\" style=\"background-color: #f0f0f0; width: 350px;\" onchange=\"javascript:CheckCandidatura();\">";
                        $.each(data.ResultSet, function (i) {
                            result += "<option value=\"" + data.ResultSet[i].idCurriculo + "\">" + data.ResultSet[i].dsCurriculo + "</option>";
                        });
                        result += "</select>";
                        $("#SelectCurriculo").html(result);
                        More();
                    }
                    else {
                        console.log(data.ResultStatus_ErrorMessage);
                        OnCandidatarWindow('Erro');
                        More();
                    }
                })
                .error(function () {
                    console.log('Pagina/Serviço PesquisaCurriculo não encontrada');
                    OnCandidatarWindow('Erro');
                    More();
                });
});
//-------------------------------------- /Encontra Curriculos do Candidato Logado --------------------------------
$(document).ready(function () {
    $('.DGCandidatarsePosition').center();
    //$("##aspnetForm #CandidatarForm").validationEngine("updatePromptsPosition");
});

$(parent.window).scroll(function () {
    $('.DGCandidatarsePosition').center();
    //$("##aspnetForm #CandidatarForm").validationEngine("updatePromptsPosition");
});

function OnCandidatarWindow(elewindow) {
    if (userLogado == 'False') {
        elewindow = 'Login';
    };

    thewindow = '#formCandidatar' + elewindow;

    $('#formCandidatar').hide();
    $('#formCandidatarErro').hide();
    $('#formCandidatarPaga').hide();
    $('#formCandidatarEnviado').hide();
    $('#formCandidatarEnviando').hide();
    $('#formCandidatarCandidatou').hide();
    $('#formCandidatarCheck').hide();
    $(thewindow).show();

    //$('#aspnetForm #CandidatarForm').validationEngine('hideAll');

}

//-------------------------------------- /Initialize --------------------------------

//-------------------------------------- Check Candidatura --------------------------------
function CheckCandidatura() {
    ProtocoloVaga = $('#CodigoVagaCandidato').text();
    idNivelVaga = $('#idTipoVagaCandidato').val();
    idCurriculo = $('#SelectedCurriculo').val();

    OnCandidatarWindow('Check');
    if (idCurriculo != undefined) {
        $.getJSON(
                    "/services/CheckCandidatura.aspx"
                    , {
                        "idCurriculo": idCurriculo
                        , "ProtocoloVaga": ProtocoloVaga
                        , "idNivelVaga": idNivelVaga
                    }
                    , "")
                    .success(function (data) { 
                        if (data.ResultStatus == true) {
                            if (data.ResultSet == "1") {
                                OnCandidatarWindow('Candidatou');
                            }
                            else if (data.ResultSet == "2") {
                                OnCandidatarWindow('Paga');
                            }
                            else {
                                OnCandidatarWindow('');
                                console.log("Não se Candidatou");
                            }
                        }
                        else {
                            console.log(data.ResultStatus_ErrorMessage);
                            OnCandidatarWindow('Erro');
                        }
                    })
                    .error(function () {
                        console.log('Pagina/Serviço CheckCandidatura não encontrada');
                        OnCandidatarWindow('Erro');
                    });
    }
    else {
        OnCandidatarWindow('');
    }

};

//-------------------------------------- /Check Candidatura --------------------------------

//-------------------------------------- Candidatar --------------------------------
function fnCandidatar() {
    idCurriculo = $('#SelectedCurriculo').val();
    ProtocoloVaga = $('#CodigoVagaCandidato').text();
    idNivelVaga = $('#idTipoVagaCandidato').val();
    idVaga = $('#idVagaCandidato').val();
    strApresentacao = $('#MensagemApresentacaoCandidato').val();

    //FormValidated = $("#aspnetForm #CandidatarForm").validationEngine('validate');

    //if (navigator.appName == 'Microsoft Internet Explorer') {
    FormValidated = true;
    //}

    if (FormValidated == true) {
        OnCandidatarWindow('Enviando');
        $.getJSON(
                    "/services/Candidatar.aspx"
                    , {
                        "idCurriculo": idCurriculo
                        , "ProtocoloVaga": ProtocoloVaga
                        , "idNivelVaga": idNivelVaga
                        , "idVaga": idVaga
                        , "strApresentacao": strApresentacao
                        , "idUser": idUser
                    }
                    , "")
                    .success(function (data) {
                        if (data.ResultStatus == true) {
                            OnCandidatarWindow('Enviado');
                        }
                        else {
                            console.log(data.ResultStatus_ErrorMessage);
                            OnCandidatarWindow('Erro');
                        }
                    })
                    .error(function () {
                        console.log('Pagina/Serviço Candidatar não encontrada');
                        OnCandidatarWindow('Erro');
                    });
    };
};

function OnCandidatarComplete(result) {
    OnCandidatarWindow('Enviado');
    if (result == 'False') {
        OnSendError(result)
    };
};

function OnCandidatarError(result) {
    OnCandidatarWindow('Erro');
};
//-------------------------------------- /Candidatar --------------------------------
//----------------------------------------------------------------- /Candidatar-se --------------------------------------------------------------------- -->