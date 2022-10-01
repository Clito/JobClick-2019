Imports System.Data.SqlClient
Imports System.Web.Script.Serialization

Partial Class services_PesquisaVagaMais
    Inherits System.Web.UI.Page

    Public Class ResultPesquisaVagaMais

#Region "Campos"
        Public ORDERID As String
        Public idVaga As String
        Public strVaga As String
        Public strEmpresa As String
        Public strSite As String
        Public strLogo As String
        Public strDsVaga As String
        Public strFuncao As String
        Public strNivelProfissional As String
        Public strFormacaoAcademica As String
        Public strPerfilVaga As String
        Public strCargo As String
        Public strCargosRelacionados As String
        Public numQtdVaga As String
        Public strTipoContratacao As String
        Public strQualificacaoHabilidadesEspecificas As String
        Public strLocalTrabalho As String
        Public strUF As String
        Public strSalarioBase As String
        Public strHonorario As String
        Public strRemuneracaoVariavel As String
        Public strBeneficios As String
        Public strPerspectiva As String
        Public strFaixaEtariaInicio As String
        Public strFaixaEtariaFim As String
        Public strSexo As String
        Public strPerfilComposicaoEquipe As String
        Public strPerfilGestor As String
        Public strConhecimentoIdioma As String
        Public strConhecimentoInformatica As String
        Public strCursoEspecifico As String
        Public strConhecimento As String
        Public strCompetenciaComportamental As String
        Public strCompetenciaProfissional As String
        Public strAspectoCritico As String
        Public strPrincipalDesafio As String
        Public strRelacionamentoInterno As String
        Public strRelacionamentoExterno As String
        Public strViagens As String
        Public strinfoSobre_Viagens As String
        Public strObsComplementares As String
        Public strProtocolo As String
        Public strValidade As String
        Public NivelTipoVaga As String
        Public pne As String
        Public flgCandidatou As String
#End Region

        Public Sub New(
                            ORDERID As String, _
                            idVaga As String, _
                            strVaga As String, _
                            strEmpresa As String, _
                            strSite As String, _
                            strLogo As String, _
                            strDsVaga As String, _
                            strFuncao As String, _
                            strNivelProfissional As String, _
                            strFormacaoAcademica As String, _
                            strPerfilVaga As String, _
                            strCargo As String, _
                            strCargosRelacionados As String, _
                            numQtdVaga As String, _
                            strTipoContratacao As String, _
                            strQualificacaoHabilidadesEspecificas As String, _
                            strLocalTrabalho As String, _
                            strUF As String, _
                            strSalarioBase As String, _
                            strHonorario As String, _
                            strRemuneracaoVariavel As String, _
                            strBeneficios As String, _
                            strPerspectiva As String, _
                            strFaixaEtariaInicio As String, _
                            strFaixaEtariaFim As String, _
                            strSexo As String, _
                            strPerfilComposicaoEquipe As String, _
                            strPerfilGestor As String, _
                            strConhecimentoIdioma As String, _
                            strConhecimentoInformatica As String, _
                            strCursoEspecifico As String, _
                            strConhecimento As String, _
                            strCompetenciaComportamental As String, _
                            strCompetenciaProfissional As String, _
                            strAspectoCritico As String, _
                            strPrincipalDesafio As String, _
                            strRelacionamentoInterno As String, _
                            strRelacionamentoExterno As String, _
                            strViagens As String, _
                            strinfoSobre_Viagens As String, _
                            strObsComplementares As String, _
                            strProtocolo As String, _
                            strValidade As String, _
                            NivelTipoVaga As String, _
                            pne As String, _
                            flgCandidatou As String
                        )

            Me.ORDERID = ORDERID
            Me.idVaga = idVaga
            Me.strVaga = strVaga
            Me.strEmpresa = strEmpresa
            Me.strSite = strSite
            Me.strLogo = strLogo
            Me.strDsVaga = strDsVaga
            Me.strFuncao = strFuncao
            Me.strNivelProfissional = strNivelProfissional
            Me.strFormacaoAcademica = strFormacaoAcademica
            Me.strPerfilVaga = strPerfilVaga
            Me.strCargo = strCargo
            Me.strCargosRelacionados = strCargosRelacionados
            Me.numQtdVaga = numQtdVaga
            Me.strTipoContratacao = strTipoContratacao
            Me.strQualificacaoHabilidadesEspecificas = strQualificacaoHabilidadesEspecificas
            Me.strLocalTrabalho = strLocalTrabalho
            Me.strUF = strUF
            Me.strSalarioBase = strSalarioBase
            Me.strHonorario = strHonorario
            Me.strRemuneracaoVariavel = strRemuneracaoVariavel
            Me.strBeneficios = strBeneficios
            Me.strPerspectiva = strPerspectiva
            Me.strFaixaEtariaInicio = strFaixaEtariaInicio
            Me.strFaixaEtariaFim = strFaixaEtariaFim
            Me.strSexo = strSexo
            Me.strPerfilComposicaoEquipe = strPerfilComposicaoEquipe
            Me.strPerfilGestor = strPerfilGestor
            Me.strConhecimentoIdioma = strConhecimentoIdioma
            Me.strConhecimentoInformatica = strConhecimentoInformatica
            Me.strCursoEspecifico = strCursoEspecifico
            Me.strConhecimento = strConhecimento
            Me.strCompetenciaComportamental = strCompetenciaComportamental
            Me.strCompetenciaProfissional = strCompetenciaProfissional
            Me.strAspectoCritico = strAspectoCritico
            Me.strPrincipalDesafio = strPrincipalDesafio
            Me.strRelacionamentoInterno = strRelacionamentoInterno
            Me.strRelacionamentoExterno = strRelacionamentoExterno
            Me.strViagens = strViagens
            Me.strinfoSobre_Viagens = strinfoSobre_Viagens
            Me.strObsComplementares = strObsComplementares
            Me.strProtocolo = strProtocolo
            Me.strValidade = strValidade
            Me.NivelTipoVaga = NivelTipoVaga
            Me.pne = pne
            Me.flgCandidatou = flgCandidatou

        End Sub

    End Class

    Public Function PesquisaVagaMais(
                                          ByVal LAST_OrderID As String _
                                        , ByVal searchTerm As String _
                                        , ByVal idEmpresa As Integer _
                                        , ByVal idParceiro As Integer _
                                        , ByVal Cidade As String _
                                        , ByVal Estado As String _
                                        , ByVal PNE As String _
                                        , ByVal idCurriculo As String _
                                    ) As String
        Dim i As Int32
        Dim myConnection As SqlConnection
        Dim myCommand As SqlCommand
        Dim dr As SqlDataReader
        Dim jss As New JavaScriptSerializer()
        Dim sbRes As New StringBuilder()
        Dim ResultSet As New Hashtable

        Dim strVaga As String
        Dim strProtocolo As String

        Dim lstVagas As New List(Of ResultPesquisaVagaMais)()
        myConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Try
            myConnection.Open()
            myCommand = New SqlCommand("_spVagas_SELECT @pesquisa='" & searchTerm & "', @top = '10', @LAST_OrderId = " & LAST_OrderID & ", @idEmpresa = '" & idEmpresa & "', @idParceiro = '" & idParceiro & "', @Cidade = '" & Cidade & "', @Estado = '" & Estado & "', @PNE = '" & PNE & "', @idCurriculo = '" & idCurriculo & "'", myConnection)
            dr = myCommand.ExecuteReader

            Do
                While dr.Read()

                    strVaga = Replace(Replace(dr("strVaga"), Chr(13), ""), Chr(10), "")
                    strProtocolo = Replace(Replace(dr("strProtocolo"), Chr(13), ""), Chr(10), "")


                    lstVagas.Add(New ResultPesquisaVagaMais(
                                                                If(IsDBNull(dr("ORDERID")), "", dr("ORDERID")),
                                                                If(IsDBNull(dr("idVaga")), "", dr("idVaga")),
                                                                strVaga,
                                                                If(IsDBNull(dr("strEmpresa")), "", dr("strEmpresa")),
                                                                If(IsDBNull(dr("strSite")), "", dr("strSite")),
                                                                If(IsDBNull(dr("strLogo")), "", dr("strLogo")),
                                                                If(IsDBNull(dr("strDsVaga")), "", dr("strDsVaga")),
                                                                If(IsDBNull(dr("strFuncao")), "", dr("strFuncao")),
                                                                If(IsDBNull(dr("strNivelProfissional")), "", dr("strNivelProfissional")),
                                                                If(IsDBNull(dr("strFormacaoAcademica")), "", dr("strFormacaoAcademica")),
                                                                If(IsDBNull(dr("strPerfilVaga")), "", dr("strPerfilVaga")),
                                                                If(IsDBNull(dr("strCargo")), "", dr("strCargo")),
                                                                If(IsDBNull(dr("strCargosRelacionados")), "", dr("strCargosRelacionados")),
                                                                If(IsDBNull(dr("numQtdVaga")), "", dr("numQtdVaga")),
                                                                If(IsDBNull(dr("strTipoContratacao")), "", dr("strTipoContratacao")),
                                                                If(IsDBNull(dr("strQualificacaoHabilidadesEspecificas")), "", dr("strQualificacaoHabilidadesEspecificas")),
                                                                If(IsDBNull(dr("strLocalTrabalho")), "", dr("strLocalTrabalho")),
                                                                If(IsDBNull(dr("strUF")), "", dr("strUF")),
                                                                If(IsDBNull(dr("strSalarioBase")), "", dr("strSalarioBase")),
                                                                If(IsDBNull(dr("strHonorario")), "", dr("strHonorario")),
                                                                If(IsDBNull(dr("strRemuneracaoVariavel")), "", dr("strRemuneracaoVariavel")),
                                                                If(IsDBNull(dr("strBeneficios")), "", dr("strBeneficios")),
                                                                If(IsDBNull(dr("strPerspectiva")), "", dr("strPerspectiva")),
                                                                If(IsDBNull(dr("strFaixaEtariaInicio")), "", dr("strFaixaEtariaInicio")),
                                                                If(IsDBNull(dr("strFaixaEtariaFim")), "", dr("strFaixaEtariaFim")),
                                                                If(IsDBNull(dr("strSexo")), "", dr("strSexo")),
                                                                If(IsDBNull(dr("strPerfilComposicaoEquipe")), "", dr("strPerfilComposicaoEquipe")),
                                                                If(IsDBNull(dr("strPerfilGestor")), "", dr("strPerfilGestor")),
                                                                If(IsDBNull(dr("strConhecimentoIdioma")), "", dr("strConhecimentoIdioma")),
                                                                If(IsDBNull(dr("strConhecimentoInformatica")), "", dr("strConhecimentoInformatica")),
                                                                If(IsDBNull(dr("strCursoEspecifico")), "", dr("strCursoEspecifico")),
                                                                If(IsDBNull(dr("strConhecimento")), "", dr("strConhecimento")),
                                                                If(IsDBNull(dr("strCompetenciaComportamental")), "", dr("strCompetenciaComportamental")),
                                                                If(IsDBNull(dr("strCompetenciaProfissional")), "", dr("strCompetenciaProfissional")),
                                                                If(IsDBNull(dr("strAspectoCritico")), "", dr("strAspectoCritico")),
                                                                If(IsDBNull(dr("strPrincipalDesafio")), "", dr("strPrincipalDesafio")),
                                                                If(IsDBNull(dr("strRelacionamentoInterno")), "", dr("strRelacionamentoInterno")),
                                                                If(IsDBNull(dr("strRelacionamentoExterno")), "", dr("strRelacionamentoExterno")),
                                                                If(IsDBNull(dr("strViagens")), "", dr("strViagens")),
                                                                If(IsDBNull(dr("strinfoSobre_Viagens")), "", dr("strinfoSobre_Viagens")),
                                                                If(IsDBNull(dr("strObsComplementares")), "", dr("strObsComplementares")),
                                                                strProtocolo,
                                                                If(IsDBNull(dr("strValidade")), "", dr("strValidade")),
                                                                If(IsDBNull(dr("NivelTipoVaga")), "", dr("NivelTipoVaga")),
                                                                If(IsDBNull(dr("pne")), "", dr("pne")),
                                                                If(IsDBNull(dr("flgCandidatou")), "", dr("flgCandidatou"))
                                                            ))

                    i = dr("ORDERID")

                End While
            Loop While dr.NextResult()

            ResultSet.Add("ResultStatus", True)
            ResultSet.Add("ResultSet", lstVagas)


            If i > 0 Then
                ResultSet.Add("ResultSwitch", False)
                ResultSet.Add("ResultLAST_OrderID", i)

                'result += " document.getElementById(""switch"").value = ""false"";"
                'result += " document.getElementById(""LAST_OrderID"").value = """ & i & """;"

            End If

            dr.Close()
        Catch e As Exception
            ResultSet.Add("ResultStatus", False)
            ResultSet.Add("ResultStatus_ErrorMessage", "Erro - " & e.Message.ToString)
        Finally
            myConnection.Close()
        End Try

        jss.Serialize(ResultSet, sbRes)

        Return sbRes.ToString()
    End Function

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim LAST_OrderID As String = Request.QueryString("LAST_OrderID")
        If LAST_OrderID = "" Then
            LAST_OrderID = 0
        End If

        Dim searchTerm As String = Request.QueryString("searchTerm")
        Dim idEmpresa As String = Request.QueryString("idEmpresa")
        Dim idParceiro As String = Request.QueryString("idParceiro")
        Dim Cidade As String = Request.QueryString("Cidade")
        Dim Estado As String = Request.QueryString("Estado")
        Dim PNE As String = Request.QueryString("PNE")
        Dim idCurriculo As String = Request.QueryString("idCurriculo")

        If idCurriculo = "" Then
            idCurriculo = 0
        End If

        Response.ContentType = "application/json"
        Response.Write(PesquisaVagaMais(LAST_OrderID, searchTerm, idEmpresa, idParceiro, Cidade, Estado, PNE, idCurriculo))
    End Sub
End Class
