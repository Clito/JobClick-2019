if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbExperienciaProf_tbAreaAtuacao]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbExperienciaProf] DROP CONSTRAINT FK_tbExperienciaProf_tbAreaAtuacao
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbDescEmpresa_Vaga_tbCadastroEmpresa]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbDescEmpresa_Vaga] DROP CONSTRAINT FK_tbDescEmpresa_Vaga_tbCadastroEmpresa
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbVaga_tbCadastroEmpresa]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbVaga] DROP CONSTRAINT FK_tbVaga_tbCadastroEmpresa
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbCadastroUser_tbCadastroTipo]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbCadastroUser] DROP CONSTRAINT FK_tbCadastroUser_tbCadastroTipo
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbCurriculo_tbCadastroUser]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbCurriculo] DROP CONSTRAINT FK_tbCurriculo_tbCadastroUser
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbDocumento_tbCadastroUser]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbDocumento] DROP CONSTRAINT FK_tbDocumento_tbCadastroUser
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbMultimidia_tbCadastroUser]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbMultimidia] DROP CONSTRAINT FK_tbMultimidia_tbCadastroUser
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbTelefone_tbCadastroUser]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbTelefone] DROP CONSTRAINT FK_tbTelefone_tbCadastroUser
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbExperienciaInformatica_TbConhecimentoInformatica]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbExperienciaInformatica] DROP CONSTRAINT FK_tbExperienciaInformatica_TbConhecimentoInformatica
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbTipoConhecimentoRel_TbConhecimentoInformatica]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbTipoConhecimentoRel] DROP CONSTRAINT FK_tbTipoConhecimentoRel_TbConhecimentoInformatica
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbCartaApresentacao_tbCurriculo]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbCartaApresentacao] DROP CONSTRAINT FK_tbCartaApresentacao_tbCurriculo
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbConhecimento_tbCurriculo]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbConhecimento] DROP CONSTRAINT FK_tbConhecimento_tbCurriculo
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbCursoExtraCurricular_tbCurriculo]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbCursoExtraCurricular] DROP CONSTRAINT FK_tbCursoExtraCurricular_tbCurriculo
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbExperienciaInformatica_tbCurriculo]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbExperienciaInformatica] DROP CONSTRAINT FK_tbExperienciaInformatica_tbCurriculo
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbExperienciaProf_tbCurriculo]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbExperienciaProf] DROP CONSTRAINT FK_tbExperienciaProf_tbCurriculo
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbFormacao_tbCurriculo]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbFormacao] DROP CONSTRAINT FK_tbFormacao_tbCurriculo
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbIdiomaC_tbCurriculo1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbIdiomaC] DROP CONSTRAINT FK_tbIdiomaC_tbCurriculo1
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbintercambio_tbCurriculo]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbintercambio] DROP CONSTRAINT FK_tbintercambio_tbCurriculo
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbRELcandidato_vaga_tbCurriculo]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbRELcandidato_vaga] DROP CONSTRAINT FK_tbRELcandidato_vaga_tbCurriculo
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbDeficienteFisico_tbDefAuditiva]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbDeficienteFisico] DROP CONSTRAINT FK_tbDeficienteFisico_tbDefAuditiva
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbDeficienteFisico_tbDefFala]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbDeficienteFisico] DROP CONSTRAINT FK_tbDeficienteFisico_tbDefFala
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbDeficienteFisico_tbDefMental]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbDeficienteFisico] DROP CONSTRAINT FK_tbDeficienteFisico_tbDefMental
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbDeficienteFisico_tbDefMotora]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbDeficienteFisico] DROP CONSTRAINT FK_tbDeficienteFisico_tbDefMotora
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbDeficienteFisico_tbDefVisual]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbDeficienteFisico] DROP CONSTRAINT FK_tbDeficienteFisico_tbDefVisual
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbVaga_tbDescEmpresa_Vaga]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbVaga] DROP CONSTRAINT FK_tbVaga_tbDescEmpresa_Vaga
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbCadastroUser_tbDisponibilidade]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbCadastroUser] DROP CONSTRAINT FK_tbCadastroUser_tbDisponibilidade
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbExperienciaInformatica_tbExperienciaInfoNivel]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbExperienciaInformatica] DROP CONSTRAINT FK_tbExperienciaInformatica_tbExperienciaInfoNivel
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbEmail_res_tbFAQ]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbEmail_res] DROP CONSTRAINT FK_tbEmail_res_tbFAQ
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbFAQresAssunto_tbFAQ]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbFAQresAssunto] DROP CONSTRAINT FK_tbFAQresAssunto_tbFAQ
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbExperienciaProf_tbFuncao]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbExperienciaProf] DROP CONSTRAINT FK_tbExperienciaProf_tbFuncao
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbVaga_tbFuncao]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbVaga] DROP CONSTRAINT FK_tbVaga_tbFuncao
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbFuncao_tbFuncaoIndex]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbFuncao] DROP CONSTRAINT FK_tbFuncao_tbFuncaoIndex
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbIdiomaC_tbIdiomaNivel]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbIdiomaC] DROP CONSTRAINT FK_tbIdiomaC_tbIdiomaNivel
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbFormacao_tbInstituicao]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbFormacao] DROP CONSTRAINT FK_tbFormacao_tbInstituicao
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbInstituicao_tbInstituicaoEstado]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbInstituicao] DROP CONSTRAINT FK_tbInstituicao_tbInstituicaoEstado
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbInstituicao_tbInstituicaoTipo]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbInstituicao] DROP CONSTRAINT FK_tbInstituicao_tbInstituicaoTipo
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbCadastroUser_tbOrigem]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbCadastroUser] DROP CONSTRAINT FK_tbCadastroUser_tbOrigem
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbExperienciaProf_tbPorteEmpresa]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbExperienciaProf] DROP CONSTRAINT FK_tbExperienciaProf_tbPorteEmpresa
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbAgenda_tbRELcandidato_vaga]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbAgenda] DROP CONSTRAINT FK_tbAgenda_tbRELcandidato_vaga
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbExperienciaProf_tbRelacaoTrabalhista]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbExperienciaProf] DROP CONSTRAINT FK_tbExperienciaProf_tbRelacaoTrabalhista
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbVaga_tbStatusVaga]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbVaga] DROP CONSTRAINT FK_tbVaga_tbStatusVaga
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbExperienciaInformatica_tbTipoConhecimentoRel]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbExperienciaInformatica] DROP CONSTRAINT FK_tbExperienciaInformatica_tbTipoConhecimentoRel
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbDocumento_tbTipoDocumento]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbDocumento] DROP CONSTRAINT FK_tbDocumento_tbTipoDocumento
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbFormacao_tbTipoFormacao]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbFormacao] DROP CONSTRAINT FK_tbFormacao_tbTipoFormacao
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbintercambio_tbTipoIntercambio]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbintercambio] DROP CONSTRAINT FK_tbintercambio_tbTipoIntercambio
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbTelefone_tbTipoTelefone1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbTelefone] DROP CONSTRAINT FK_tbTelefone_tbTipoTelefone1
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbRELcandidato_vaga_tbVaga]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbRELcandidato_vaga] DROP CONSTRAINT FK_tbRELcandidato_vaga_tbVaga
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbCadastroUser_tbestadocivil]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbCadastroUser] DROP CONSTRAINT FK_tbCadastroUser_tbestadocivil
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbCurriculo_tbidioma]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbCurriculo] DROP CONSTRAINT FK_tbCurriculo_tbidioma
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbIdiomaC_tbidioma]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbIdiomaC] DROP CONSTRAINT FK_tbIdiomaC_tbidioma
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbCadastroEmpresa_tbpais]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbCadastroEmpresa] DROP CONSTRAINT FK_tbCadastroEmpresa_tbpais
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbCadastroUser_tbpais]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbCadastroUser] DROP CONSTRAINT FK_tbCadastroUser_tbpais
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbCadastroEmpresa_tbuf]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbCadastroEmpresa] DROP CONSTRAINT FK_tbCadastroEmpresa_tbuf
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbCadastroUser_tbuf]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbCadastroUser] DROP CONSTRAINT FK_tbCadastroUser_tbuf
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbCadastroEmpresa_tbuser]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbCadastroEmpresa] DROP CONSTRAINT FK_tbCadastroEmpresa_tbuser
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbCadastroUser_tbuser]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbCadastroUser] DROP CONSTRAINT FK_tbCadastroUser_tbuser
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbDeficienteFisico_tbuser]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbDeficienteFisico] DROP CONSTRAINT FK_tbDeficienteFisico_tbuser
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_tbuser_tbuserType1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[tbuser] DROP CONSTRAINT FK_tbuser_tbuserType1
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spContadorAcesso]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spContadorAcesso]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spGetFunction]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spGetFunction]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spGetInstituicao]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spGetInstituicao]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spGetUser]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spGetUser]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spGetUserName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spGetUserName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spGetUserNameEmp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spGetUserNameEmp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spIncEmail]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spIncEmail]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spUpdEmail]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spUpdEmail]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spUpdateFAQ]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spUpdateFAQ]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spUpdateFoto]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spUpdateFoto]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spVerifyUser]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spVerifyUser]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spcontaFAQ]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spcontaFAQ]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vwExperienciaProf]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vwExperienciaProf]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vwconhecimentoInfo]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vwconhecimentoInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vwformacaoacademica]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vwformacaoacademica]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vwidioma]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vwidioma]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vwcurriculo_publicado]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vwcurriculo_publicado]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vwdocumento]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vwdocumento]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vwdeficienciafisica]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vwdeficienciafisica]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[totalusuarios]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[totalusuarios]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vwInformaticaRel]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vwInformaticaRel]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vwconhecimentoInformatica]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vwconhecimentoInformatica]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vwfaq]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vwfaq]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vwfaqres]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vwfaqres]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vwfuncao]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vwfuncao]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vwinformatica]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vwinformatica]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vwinstituicao]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vwinstituicao]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vwuser]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vwuser]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbAgenda]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbAgenda]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbAreaAtuacao]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbAreaAtuacao]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbCadastroEmpresa]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbCadastroEmpresa]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbCadastroTipo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbCadastroTipo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbCadastroUser]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbCadastroUser]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbCartaApresentacao]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbCartaApresentacao]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbConhecimento]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbConhecimento]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbConhecimentoInformatica]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbConhecimentoInformatica]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbCurriculo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbCurriculo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbCurso]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbCurso]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbCursoExtraCurricular]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbCursoExtraCurricular]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbDefAuditiva]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbDefAuditiva]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbDefFala]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbDefFala]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbDefMental]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbDefMental]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbDefMotora]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbDefMotora]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbDefVisual]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbDefVisual]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbDeficienteFisico]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbDeficienteFisico]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbDescEmpresa_Vaga]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbDescEmpresa_Vaga]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbDisponibilidade]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbDisponibilidade]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbDocumento]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbDocumento]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbEmail_res]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbEmail_res]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbExperienciaInfoNivel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbExperienciaInfoNivel]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbExperienciaInformatica]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbExperienciaInformatica]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbExperienciaProf]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbExperienciaProf]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbFAQ]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbFAQ]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbFAQresAssunto]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbFAQresAssunto]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbFormacao]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbFormacao]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbFuncao]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbFuncao]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbFuncaoIndex]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbFuncaoIndex]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbIdiomaC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbIdiomaC]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbIdiomaNivel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbIdiomaNivel]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbInstituicao]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbInstituicao]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbInstituicaoEstado]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbInstituicaoEstado]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbInstituicaoTipo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbInstituicaoTipo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbMultimidia]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbMultimidia]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbOrigem]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbOrigem]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbPorteEmpresa]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbPorteEmpresa]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbRELcandidato_vaga]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbRELcandidato_vaga]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbRelacaoTrabalhista]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbRelacaoTrabalhista]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbStatusVaga]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbStatusVaga]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbTelefone]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbTelefone]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbTipoConhecimentoRel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbTipoConhecimentoRel]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbTipoDocumento]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbTipoDocumento]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbTipoFormacao]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbTipoFormacao]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbTipoIntercambio]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbTipoIntercambio]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbTipoTelefone]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbTipoTelefone]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbVaga]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbVaga]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbestadocivil]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbestadocivil]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbidioma]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbidioma]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbintercambio]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbintercambio]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbmensagem]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbmensagem]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbpais]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbpais]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbpublicaCurriculo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbpublicaCurriculo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbsetup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbsetup]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbuf]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbuf]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbuser]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbuser]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tbuserType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tbuserType]
GO

CREATE TABLE [dbo].[tbAgenda] (
	[idagenda] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[idRELcandidato_vaga] [int] NOT NULL ,
	[data] [datetime] NOT NULL ,
	[data_start] [datetime] NOT NULL ,
	[data_end] [datetime] NOT NULL ,
	[dsCompromissoEmp] [varchar] (255) COLLATE Latin1_General_CI_AI NOT NULL ,
	[dsRespostaCandidato] [varchar] (255) COLLATE Latin1_General_CI_AI NOT NULL ,
	[ativo] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbAreaAtuacao] (
	[idAreaAtuacao] [int] IDENTITY (1, 1) NOT NULL ,
	[dsAreaAtuacao] [varchar] (200) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbCadastroEmpresa] (
	[idCadastroEmpresa] [int] IDENTITY (1, 1) NOT NULL ,
	[idUser] [int] NOT NULL ,
	[nmempresa] [varchar] (200) COLLATE Latin1_General_CI_AI NOT NULL ,
	[cnpj] [varchar] (20) COLLATE Latin1_General_CI_AI NOT NULL ,
	[emailRes] [varchar] (200) COLLATE Latin1_General_CI_AI NOT NULL ,
	[nomeRes] [varchar] (200) COLLATE Latin1_General_CI_AI NOT NULL ,
	[endereco] [varchar] (200) COLLATE Latin1_General_CI_AI NOT NULL ,
	[cep] [varchar] (10) COLLATE Latin1_General_CI_AI NOT NULL ,
	[bairro] [varchar] (180) COLLATE Latin1_General_CI_AI NOT NULL ,
	[cidade] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL ,
	[uf] [char] (2) COLLATE Latin1_General_CI_AI NOT NULL ,
	[pais] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL ,
	[data] [datetime] NULL ,
	[dataultimoacess] [datetime] NULL ,
	[contador] [int] NULL ,
	[aprovado] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbCadastroTipo] (
	[cadastroTipo] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbCadastroUser] (
	[idCadastroUser] [int] IDENTITY (1, 1) NOT NULL ,
	[idUser] [int] NOT NULL ,
	[foto] [varchar] (255) COLLATE Latin1_General_CI_AI NULL ,
	[nome] [varchar] (200) COLLATE Latin1_General_CI_AI NOT NULL ,
	[endereco] [varchar] (200) COLLATE Latin1_General_CI_AI NOT NULL ,
	[cep] [varchar] (10) COLLATE Latin1_General_CI_AI NOT NULL ,
	[bairro] [varchar] (180) COLLATE Latin1_General_CI_AI NOT NULL ,
	[cidade] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL ,
	[uf] [char] (2) COLLATE Latin1_General_CI_AI NOT NULL ,
	[pais] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL ,
	[nascimento] [datetime] NOT NULL ,
	[sexo] [varchar] (10) COLLATE Latin1_General_CI_AI NOT NULL ,
	[cadastroTipo] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL ,
	[apresentar] [bit] NOT NULL ,
	[estadocivil] [varchar] (50) COLLATE Latin1_General_CI_AI NOT NULL ,
	[nrdependente] [int] NULL ,
	[portadorDef] [bit] NOT NULL ,
	[trabalhando] [bit] NOT NULL ,
	[resumo] [text] COLLATE Latin1_General_CI_AI NULL ,
	[valorRemAtual] [money] NOT NULL ,
	[valorRemPretendida] [money] NOT NULL ,
	[localPreferencia] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL ,
	[disponibilidade] [varchar] (50) COLLATE Latin1_General_CI_AI NOT NULL ,
	[origem] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL ,
	[data] [datetime] NOT NULL ,
	[dataultimoacess] [datetime] NULL ,
	[contador] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbCartaApresentacao] (
	[idCartaApresentacao] [int] IDENTITY (1, 1) NOT NULL ,
	[idcurriculo] [int] NOT NULL ,
	[apresentacao] [text] COLLATE Latin1_General_CI_AI NOT NULL ,
	[realizacao] [text] COLLATE Latin1_General_CI_AI NULL ,
	[resumogeral] [text] COLLATE Latin1_General_CI_AI NULL ,
	[objetivo] [text] COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbConhecimento] (
	[idconhecimento] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[idcurriculo] [int] NOT NULL ,
	[dsconhecimento] [text] COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbConhecimentoInformatica] (
	[idTipoConhecimento] [int] IDENTITY (1, 1) NOT NULL ,
	[dsTipoConhecimento] [varchar] (200) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbCurriculo] (
	[idcurriculo] [int] IDENTITY (1, 1) NOT NULL ,
	[idCadastroUser] [int] NOT NULL ,
	[dscurriculo] [varchar] (255) COLLATE Latin1_General_CI_AI NOT NULL ,
	[ididioma] [int] NOT NULL ,
	[publicar] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbCurso] (
	[idCurso] [int] IDENTITY (1, 1) NOT NULL ,
	[dsCurso] [varchar] (200) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbCursoExtraCurricular] (
	[idCursoExtraCurricular] [int] IDENTITY (1, 1) NOT NULL ,
	[idcurriculo] [int] NOT NULL ,
	[Instituicao] [varchar] (150) COLLATE Latin1_General_CI_AI NOT NULL ,
	[dsCurso] [varchar] (200) COLLATE Latin1_General_CI_AI NOT NULL ,
	[obsCurso] [text] COLLATE Latin1_General_CI_AI NOT NULL ,
	[data_ini] [datetime] NOT NULL ,
	[data_fim] [datetime] NULL ,
	[concluido] [bit] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbDefAuditiva] (
	[idDefAuditiva] [int] IDENTITY (1, 1) NOT NULL ,
	[dsDefAuditiva] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbDefFala] (
	[idDefFala] [int] IDENTITY (1, 1) NOT NULL ,
	[dsDefFala] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbDefMental] (
	[idDefMental] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[dsDefMental] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbDefMotora] (
	[idDefMotora] [int] IDENTITY (1, 1) NOT NULL ,
	[dsDefMotora] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbDefVisual] (
	[idDefVisual] [int] IDENTITY (1, 1) NOT NULL ,
	[dsDefVisual] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbDeficienteFisico] (
	[idDeficienteFisico] [int] IDENTITY (1, 1) NOT NULL ,
	[idUser] [int] NOT NULL ,
	[idDefAuditiva] [int] NULL ,
	[idDefMotora] [int] NULL ,
	[idDefFala] [int] NULL ,
	[idDefMental] [int] NULL ,
	[idDefVisual] [int] NULL ,
	[Obs] [text] COLLATE Latin1_General_CI_AI NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbDescEmpresa_Vaga] (
	[iddsempresa] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[idCadastroEmpresa] [int] NOT NULL ,
	[tituloDesEmpresa] [varchar] (180) COLLATE Latin1_General_CI_AI NOT NULL ,
	[dsempresaVaga] [text] COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbDisponibilidade] (
	[disponibilidade] [varchar] (50) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbDocumento] (
	[idDocumento] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[idTipoDocumento] [int] NOT NULL ,
	[idCadastroUser] [int] NOT NULL ,
	[nrDocumento] [varchar] (80) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbEmail_res] (
	[idemailres] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[idFAQ] [int] NOT NULL ,
	[pergunta] [text] COLLATE Latin1_General_CI_AI NOT NULL ,
	[resposta] [text] COLLATE Latin1_General_CI_AI NULL ,
	[email] [varchar] (180) COLLATE Latin1_General_CI_AI NOT NULL ,
	[nome] [varchar] (180) COLLATE Latin1_General_CI_AI NOT NULL ,
	[ip] [varchar] (18) COLLATE Latin1_General_CI_AI NULL ,
	[ticket] [varchar] (25) COLLATE Latin1_General_CI_AI NULL ,
	[data] [datetime] NULL ,
	[status] [bit] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbExperienciaInfoNivel] (
	[idGrauExperiencia] [int] IDENTITY (1, 1) NOT NULL ,
	[dsGrauExperiencia] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbExperienciaInformatica] (
	[idexprofissionalInformatica] [int] IDENTITY (1, 1) NOT NULL ,
	[idcurriculo] [int] NULL ,
	[idTipoConhecimento] [int] NOT NULL ,
	[idTipoConhecimentoRel] [int] NOT NULL ,
	[idGrauExperiencia] [int] NULL ,
	[obs] [text] COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbExperienciaProf] (
	[idexprofissional] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[idcurriculo] [int] NOT NULL ,
	[idfuncao] [int] NOT NULL ,
	[idAreaAtuacao] [int] NOT NULL ,
	[idPorte] [int] NOT NULL ,
	[idRelacaoTrabalhista] [int] NOT NULL ,
	[nomeempresa] [varchar] (255) COLLATE Latin1_General_CI_AI NOT NULL ,
	[dsexperiencia] [text] COLLATE Latin1_General_CI_AI NOT NULL ,
	[data_ini] [datetime] NOT NULL ,
	[data_fim] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbFAQ] (
	[idFAQ] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[tema] [varchar] (150) COLLATE Latin1_General_CI_AI NOT NULL ,
	[contaclick] [int] NOT NULL ,
	[apresentar] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbFAQresAssunto] (
	[idFAQresAssunto] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[idFAQ] [int] NOT NULL ,
	[duvida] [text] COLLATE Latin1_General_CI_AI NOT NULL ,
	[resposta] [text] COLLATE Latin1_General_CI_AI NULL ,
	[data] [datetime] NULL ,
	[datares] [datetime] NULL ,
	[apresentar] [bit] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbFormacao] (
	[idFormacao] [int] IDENTITY (1, 1) NOT NULL ,
	[idcurriculo] [int] NOT NULL ,
	[idTipoFormacao] [int] NOT NULL ,
	[idInstituicao] [int] NOT NULL ,
	[dsCurso] [varchar] (200) COLLATE Latin1_General_CI_AI NOT NULL ,
	[obs] [text] COLLATE Latin1_General_CI_AI NULL ,
	[data_ini] [datetime] NOT NULL ,
	[data_fim] [datetime] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbFuncao] (
	[idfuncao] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[idindex] [int] NOT NULL ,
	[dsfuncao] [varchar] (255) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbFuncaoIndex] (
	[idindex] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[dsindex] [char] (1) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbIdiomaC] (
	[ididiomaC] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[idcurriculo] [int] NOT NULL ,
	[ididioma] [int] NOT NULL ,
	[ididiomanivel] [int] NOT NULL ,
	[dscomentario] [varchar] (255) COLLATE Latin1_General_CI_AI NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbIdiomaNivel] (
	[ididiomanivel] [int] IDENTITY (1, 1) NOT NULL ,
	[dsnivel] [varchar] (255) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbInstituicao] (
	[idInstituicao] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[identidadeTipo] [int] NOT NULL ,
	[dsinstituicao] [varchar] (255) COLLATE Latin1_General_CI_AI NOT NULL ,
	[estado] [varchar] (255) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbInstituicaoEstado] (
	[estado] [varchar] (255) COLLATE Latin1_General_CI_AI NOT NULL ,
	[uf] [char] (2) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbInstituicaoTipo] (
	[identidadeTipo] [int] IDENTITY (1, 1) NOT NULL ,
	[dsTipo] [varchar] (50) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbMultimidia] (
	[idMultimidia] [int] IDENTITY (1, 1) NOT NULL ,
	[idCadastroUser] [int] NOT NULL ,
	[url] [varchar] (255) COLLATE Latin1_General_CI_AI NOT NULL ,
	[dsMultimídia] [text] COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbOrigem] (
	[origem] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbPorteEmpresa] (
	[idPorte] [int] IDENTITY (1, 1) NOT NULL ,
	[dsPorte] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbRELcandidato_vaga] (
	[idRELcandidato_vaga] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[idvaga] [int] NOT NULL ,
	[idcurriculo] [int] NOT NULL ,
	[apresentacao] [text] COLLATE Latin1_General_CI_AI NOT NULL ,
	[liberarRH] [bit] NOT NULL ,
	[liberarCandidato] [bit] NOT NULL ,
	[msnRH] [text] COLLATE Latin1_General_CI_AI NULL ,
	[GerarProcesso] [bit] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbRelacaoTrabalhista] (
	[idRelacaoTrabalhista] [int] IDENTITY (1, 1) NOT NULL ,
	[dsRelacaoTrabalhista] [varchar] (150) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbStatusVaga] (
	[idstatusvaga] [varchar] (50) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbTelefone] (
	[idTelefone] [int] IDENTITY (1, 1) NOT NULL ,
	[idTipoTelefone] [varchar] (50) COLLATE Latin1_General_CI_AI NOT NULL ,
	[idCadastroUser] [int] NOT NULL ,
	[ddd] [char] (2) COLLATE Latin1_General_CI_AI NOT NULL ,
	[numero] [varchar] (10) COLLATE Latin1_General_CI_AI NOT NULL ,
	[ramal] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbTipoConhecimentoRel] (
	[idTipoConhecimentoRel] [int] IDENTITY (1, 1) NOT NULL ,
	[idTipoConhecimento] [int] NOT NULL ,
	[dsTipoConhecimentoRel] [varchar] (255) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbTipoDocumento] (
	[idTipoDocumento] [int] IDENTITY (1, 1) NOT NULL ,
	[dsTipoDocumento] [varchar] (200) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbTipoFormacao] (
	[idTipoFormacao] [int] IDENTITY (1, 1) NOT NULL ,
	[dsTipoFormacao] [varchar] (150) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbTipoIntercambio] (
	[idTipoIntercambio] [varchar] (50) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbTipoTelefone] (
	[idTipoTelefone] [varchar] (50) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbVaga] (
	[idVaga] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[idCadastroEmpresa] [int] NOT NULL ,
	[codvaga] [varchar] (20) COLLATE Latin1_General_CI_AI NOT NULL ,
	[idfuncao] [int] NOT NULL ,
	[dsfuncao] [varchar] (255) COLLATE Latin1_General_CI_AI NOT NULL ,
	[data_ini] [datetime] NOT NULL ,
	[data_fim] [datetime] NOT NULL ,
	[nrovaga] [int] NOT NULL ,
	[nropedido] [varchar] (50) COLLATE Latin1_General_CI_AI NOT NULL ,
	[dsdepartamento] [varchar] (180) COLLATE Latin1_General_CI_AI NOT NULL ,
	[nmresponsavel] [varchar] (180) COLLATE Latin1_General_CI_AI NOT NULL ,
	[centrodecusto] [varchar] (20) COLLATE Latin1_General_CI_AI NULL ,
	[dsvaga] [text] COLLATE Latin1_General_CI_AI NOT NULL ,
	[idstatusvaga] [varchar] (50) COLLATE Latin1_General_CI_AI NOT NULL ,
	[iddsempresa] [int] NOT NULL ,
	[publicar] [bit] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbestadocivil] (
	[estadocivil] [varchar] (50) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbidioma] (
	[ididioma] [int] IDENTITY (1, 1) NOT NULL ,
	[dsidioma] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbintercambio] (
	[idintercambio] [int] IDENTITY (1, 1) NOT NULL ,
	[idTipoIntercambio] [varchar] (50) COLLATE Latin1_General_CI_AI NOT NULL ,
	[idcurriculo] [int] NOT NULL ,
	[pais] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL ,
	[dsIntercambio] [text] COLLATE Latin1_General_CI_AI NOT NULL ,
	[data_ini] [datetime] NOT NULL ,
	[data_fim] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbmensagem] (
	[idmensagem] [varchar] (50) COLLATE Latin1_General_CI_AI NOT NULL ,
	[sbody] [text] COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbpais] (
	[pais] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbpublicaCurriculo] (
	[idpublica] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[idUser] [int] NOT NULL ,
	[idcurriculo] [int] NOT NULL ,
	[emailTO] [varchar] (200) COLLATE Latin1_General_CI_AI NOT NULL ,
	[midia] [varchar] (200) COLLATE Latin1_General_CI_AI NOT NULL ,
	[codigo] [varchar] (50) COLLATE Latin1_General_CI_AI NULL ,
	[apresentacao] [text] COLLATE Latin1_General_CI_AI NOT NULL ,
	[status] [bit] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbsetup] (
	[idsetup] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[sSmtp] [varchar] (180) COLLATE Latin1_General_CI_AI NOT NULL ,
	[emailAdmin] [varchar] (180) COLLATE Latin1_General_CI_AI NOT NULL ,
	[nomeAdmin] [varchar] (255) COLLATE Latin1_General_CI_AI NOT NULL ,
	[sSubject] [varchar] (255) COLLATE Latin1_General_CI_AI NOT NULL ,
	[sTitle] [varchar] (255) COLLATE Latin1_General_CI_AI NOT NULL ,
	[celular] [varchar] (50) COLLATE Latin1_General_CI_AI NULL ,
	[operadora] [varchar] (50) COLLATE Latin1_General_CI_AI NULL ,
	[meta] [varchar] (4000) COLLATE Latin1_General_CI_AI NULL ,
	[fonte] [varchar] (180) COLLATE Latin1_General_CI_AI NULL ,
	[url] [varchar] (255) COLLATE Latin1_General_CI_AI NULL ,
	[google] [varchar] (4000) COLLATE Latin1_General_CI_AI NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbuf] (
	[uf] [char] (2) COLLATE Latin1_General_CI_AI NOT NULL ,
	[dsuf] [varchar] (100) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbuser] (
	[idUser] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[idTypeUser] [varchar] (50) COLLATE Latin1_General_CI_AI NOT NULL ,
	[userName] [varchar] (16) COLLATE Latin1_General_CI_AI NOT NULL ,
	[password] [varchar] (16) COLLATE Latin1_General_CI_AI NOT NULL ,
	[email] [varchar] (180) COLLATE Latin1_General_CI_AI NOT NULL ,
	[frase] [varchar] (60) COLLATE Latin1_General_CI_AI NOT NULL ,
	[bloquear] [bit] NOT NULL ,
	[data] [datetime] NULL ,
	[privacidade] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbuserType] (
	[idTypeUser] [varchar] (50) COLLATE Latin1_General_CI_AI NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbAgenda] WITH NOCHECK ADD 
	CONSTRAINT [PK_testeAgenda] PRIMARY KEY  CLUSTERED 
	(
		[idagenda]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbAreaAtuacao] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbAreaAtuacao] PRIMARY KEY  CLUSTERED 
	(
		[idAreaAtuacao]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbCadastroEmpresa] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbCadastroEmpresa] PRIMARY KEY  CLUSTERED 
	(
		[idCadastroEmpresa]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbCadastroTipo] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbCadastroTipo] PRIMARY KEY  CLUSTERED 
	(
		[cadastroTipo]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbCadastroUser] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbCadastroUser] PRIMARY KEY  CLUSTERED 
	(
		[idCadastroUser]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbCartaApresentacao] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbCartaApresentacao] PRIMARY KEY  CLUSTERED 
	(
		[idCartaApresentacao]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbConhecimento] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbConhecimento] PRIMARY KEY  CLUSTERED 
	(
		[idconhecimento]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbConhecimentoInformatica] WITH NOCHECK ADD 
	CONSTRAINT [PK_TbConhecimentoInformatica] PRIMARY KEY  CLUSTERED 
	(
		[idTipoConhecimento]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbCurriculo] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbCurriculo] PRIMARY KEY  CLUSTERED 
	(
		[idcurriculo]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbCurso] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbCurso] PRIMARY KEY  CLUSTERED 
	(
		[idCurso]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbCursoExtraCurricular] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbCursoExtraCurricular] PRIMARY KEY  CLUSTERED 
	(
		[idCursoExtraCurricular]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbDefAuditiva] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbDefAuditiva] PRIMARY KEY  CLUSTERED 
	(
		[idDefAuditiva]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbDefFala] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbDefFala] PRIMARY KEY  CLUSTERED 
	(
		[idDefFala]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbDefMental] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbDefMental] PRIMARY KEY  CLUSTERED 
	(
		[idDefMental]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbDefMotora] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbDefMotora] PRIMARY KEY  CLUSTERED 
	(
		[idDefMotora]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbDefVisual] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbDefVisual] PRIMARY KEY  CLUSTERED 
	(
		[idDefVisual]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbDeficienteFisico] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbDeficienteFisico] PRIMARY KEY  CLUSTERED 
	(
		[idDeficienteFisico]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbDescEmpresa_Vaga] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbDescEmpresa_Vaga] PRIMARY KEY  CLUSTERED 
	(
		[iddsempresa]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbDisponibilidade] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbDisponibilidade] PRIMARY KEY  CLUSTERED 
	(
		[disponibilidade]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbDocumento] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbDocumento] PRIMARY KEY  CLUSTERED 
	(
		[idDocumento]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbEmail_res] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbEmail_res] PRIMARY KEY  CLUSTERED 
	(
		[idemailres]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbExperienciaInfoNivel] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbExperienciaInfoNivel] PRIMARY KEY  CLUSTERED 
	(
		[idGrauExperiencia]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbExperienciaInformatica] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbExperienciaInformatica] PRIMARY KEY  CLUSTERED 
	(
		[idexprofissionalInformatica]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbExperienciaProf] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbExperienciaProf] PRIMARY KEY  CLUSTERED 
	(
		[idexprofissional]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbFAQ] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbFAQ] PRIMARY KEY  CLUSTERED 
	(
		[idFAQ]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbFAQresAssunto] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbFAQresAssunto] PRIMARY KEY  CLUSTERED 
	(
		[idFAQresAssunto]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbFormacao] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbFormacao] PRIMARY KEY  CLUSTERED 
	(
		[idFormacao]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbFuncao] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbFuncao] PRIMARY KEY  CLUSTERED 
	(
		[idfuncao]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbFuncaoIndex] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbFuncaoIndex] PRIMARY KEY  CLUSTERED 
	(
		[idindex]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbIdiomaC] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbIdiomaC] PRIMARY KEY  CLUSTERED 
	(
		[ididiomaC]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbIdiomaNivel] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbIdiomaNivel] PRIMARY KEY  CLUSTERED 
	(
		[ididiomanivel]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbInstituicao] WITH NOCHECK ADD 
	CONSTRAINT [PK_Plan1$] PRIMARY KEY  CLUSTERED 
	(
		[idInstituicao]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbInstituicaoEstado] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbinstituicaoEstado] PRIMARY KEY  CLUSTERED 
	(
		[estado]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbInstituicaoTipo] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbInstituicaoTipo] PRIMARY KEY  CLUSTERED 
	(
		[identidadeTipo]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbMultimidia] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbMultimidia] PRIMARY KEY  CLUSTERED 
	(
		[idMultimidia]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbOrigem] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbOrigem] PRIMARY KEY  CLUSTERED 
	(
		[origem]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbPorteEmpresa] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbPorteEmpresa] PRIMARY KEY  CLUSTERED 
	(
		[idPorte]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbRELcandidato_vaga] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbRELcandidato_vaga] PRIMARY KEY  CLUSTERED 
	(
		[idRELcandidato_vaga]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbRelacaoTrabalhista] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbRelacaoTrabalhista] PRIMARY KEY  CLUSTERED 
	(
		[idRelacaoTrabalhista]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbStatusVaga] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbStatusVaga] PRIMARY KEY  CLUSTERED 
	(
		[idstatusvaga]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbTelefone] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbTelefone] PRIMARY KEY  CLUSTERED 
	(
		[idTelefone]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbTipoConhecimentoRel] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbTipoConhecimentoRel] PRIMARY KEY  CLUSTERED 
	(
		[idTipoConhecimentoRel]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbTipoDocumento] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbTipoDocumento] PRIMARY KEY  CLUSTERED 
	(
		[idTipoDocumento]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbTipoFormacao] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbTipoFormacao] PRIMARY KEY  CLUSTERED 
	(
		[idTipoFormacao]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbTipoIntercambio] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbTipoIntercambio] PRIMARY KEY  CLUSTERED 
	(
		[idTipoIntercambio]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbTipoTelefone] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbTipoTelefone] PRIMARY KEY  CLUSTERED 
	(
		[idTipoTelefone]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbVaga] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbVaga] PRIMARY KEY  CLUSTERED 
	(
		[idVaga]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbestadocivil] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbestadocivil] PRIMARY KEY  CLUSTERED 
	(
		[estadocivil]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbidioma] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbidioma] PRIMARY KEY  CLUSTERED 
	(
		[ididioma]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbintercambio] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbintercambio] PRIMARY KEY  CLUSTERED 
	(
		[idintercambio]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbmensagem] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbmensagem] PRIMARY KEY  CLUSTERED 
	(
		[idmensagem]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbpais] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbpais] PRIMARY KEY  CLUSTERED 
	(
		[pais]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbpublicaCurriculo] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbpublicaCurriculo] PRIMARY KEY  CLUSTERED 
	(
		[idpublica]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbsetup] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbsetup] PRIMARY KEY  CLUSTERED 
	(
		[idsetup]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbuf] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbuf] PRIMARY KEY  CLUSTERED 
	(
		[uf]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbuser] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbuser] PRIMARY KEY  CLUSTERED 
	(
		[idUser]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbuserType] WITH NOCHECK ADD 
	CONSTRAINT [PK_tbuserType] PRIMARY KEY  CLUSTERED 
	(
		[idTypeUser]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbCadastroEmpresa] ADD 
	CONSTRAINT [DF_tbCadastroEmpresa_data] DEFAULT (getdate()) FOR [data],
	CONSTRAINT [DF_tbCadastroEmpresa_dataultimoacess] DEFAULT (getdate()) FOR [dataultimoacess],
	CONSTRAINT [DF_tbCadastroEmpresa_contador] DEFAULT (0) FOR [contador],
	CONSTRAINT [DF_tbCadastroEmpresa_aprovado] DEFAULT (0) FOR [aprovado]
GO

ALTER TABLE [dbo].[tbCadastroUser] ADD 
	CONSTRAINT [DF_tbCadastroUser_nrdependente] DEFAULT (0) FOR [nrdependente],
	CONSTRAINT [DF_tbCadastroUser_portadorDef] DEFAULT (0) FOR [portadorDef],
	CONSTRAINT [DF_tbCadastroUser_data] DEFAULT (getdate()) FOR [data],
	CONSTRAINT [DF_tbCadastroUser_dataultimoacess] DEFAULT (getdate()) FOR [dataultimoacess],
	CONSTRAINT [DF_tbCadastroUser_contador] DEFAULT (0) FOR [contador]
GO

ALTER TABLE [dbo].[tbCurriculo] ADD 
	CONSTRAINT [DF_tbCurriculo_publicar] DEFAULT (1) FOR [publicar]
GO

ALTER TABLE [dbo].[tbEmail_res] ADD 
	CONSTRAINT [DF_tbEmail_res_data_1] DEFAULT (getdate()) FOR [data],
	CONSTRAINT [DF_tbEmail_res_status_1] DEFAULT (0) FOR [status]
GO

ALTER TABLE [dbo].[tbFAQ] ADD 
	CONSTRAINT [DF_tbFAQ_apresentar_1] DEFAULT (1) FOR [apresentar]
GO

ALTER TABLE [dbo].[tbFAQresAssunto] ADD 
	CONSTRAINT [DF_tbFAQresAssunto_data_1] DEFAULT (getdate()) FOR [data],
	CONSTRAINT [DF_tbFAQresAssunto_datares_1] DEFAULT (getdate()) FOR [datares]
GO

ALTER TABLE [dbo].[tbRELcandidato_vaga] ADD 
	CONSTRAINT [DF_tbRELcandidato_vaga_liberar] DEFAULT (0) FOR [liberarRH],
	CONSTRAINT [DF_tbRELcandidato_vaga_liberarCandidato] DEFAULT (0) FOR [liberarCandidato],
	CONSTRAINT [DF_tbRELcandidato_vaga_liberarProcesso] DEFAULT (0) FOR [GerarProcesso]
GO

ALTER TABLE [dbo].[tbVaga] ADD 
	CONSTRAINT [DF_tbVaga_data_ini] DEFAULT (getdate()) FOR [data_ini],
	CONSTRAINT [DF_tbVaga_data_fim] DEFAULT (getdate()) FOR [data_fim],
	CONSTRAINT [DF_tbVaga_publicar] DEFAULT (0) FOR [publicar]
GO

ALTER TABLE [dbo].[tbpublicaCurriculo] ADD 
	CONSTRAINT [DF_tbpublicaCurriculo_status] DEFAULT (0) FOR [status]
GO

ALTER TABLE [dbo].[tbuser] ADD 
	CONSTRAINT [DF_tbuser_data] DEFAULT (getdate()) FOR [data]
GO

ALTER TABLE [dbo].[tbAgenda] ADD 
	CONSTRAINT [FK_tbAgenda_tbRELcandidato_vaga] FOREIGN KEY 
	(
		[idRELcandidato_vaga]
	) REFERENCES [dbo].[tbRELcandidato_vaga] (
		[idRELcandidato_vaga]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbCadastroEmpresa] ADD 
	CONSTRAINT [FK_tbCadastroEmpresa_tbpais] FOREIGN KEY 
	(
		[pais]
	) REFERENCES [dbo].[tbpais] (
		[pais]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbCadastroEmpresa_tbuf] FOREIGN KEY 
	(
		[uf]
	) REFERENCES [dbo].[tbuf] (
		[uf]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbCadastroEmpresa_tbuser] FOREIGN KEY 
	(
		[idUser]
	) REFERENCES [dbo].[tbuser] (
		[idUser]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbCadastroUser] ADD 
	CONSTRAINT [FK_tbCadastroUser_tbCadastroTipo] FOREIGN KEY 
	(
		[cadastroTipo]
	) REFERENCES [dbo].[tbCadastroTipo] (
		[cadastroTipo]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbCadastroUser_tbDisponibilidade] FOREIGN KEY 
	(
		[disponibilidade]
	) REFERENCES [dbo].[tbDisponibilidade] (
		[disponibilidade]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbCadastroUser_tbestadocivil] FOREIGN KEY 
	(
		[estadocivil]
	) REFERENCES [dbo].[tbestadocivil] (
		[estadocivil]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbCadastroUser_tbOrigem] FOREIGN KEY 
	(
		[origem]
	) REFERENCES [dbo].[tbOrigem] (
		[origem]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbCadastroUser_tbpais] FOREIGN KEY 
	(
		[pais]
	) REFERENCES [dbo].[tbpais] (
		[pais]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbCadastroUser_tbuf] FOREIGN KEY 
	(
		[uf]
	) REFERENCES [dbo].[tbuf] (
		[uf]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbCadastroUser_tbuser] FOREIGN KEY 
	(
		[idUser]
	) REFERENCES [dbo].[tbuser] (
		[idUser]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbCartaApresentacao] ADD 
	CONSTRAINT [FK_tbCartaApresentacao_tbCurriculo] FOREIGN KEY 
	(
		[idcurriculo]
	) REFERENCES [dbo].[tbCurriculo] (
		[idcurriculo]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbConhecimento] ADD 
	CONSTRAINT [FK_tbConhecimento_tbCurriculo] FOREIGN KEY 
	(
		[idcurriculo]
	) REFERENCES [dbo].[tbCurriculo] (
		[idcurriculo]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbCurriculo] ADD 
	CONSTRAINT [FK_tbCurriculo_tbCadastroUser] FOREIGN KEY 
	(
		[idCadastroUser]
	) REFERENCES [dbo].[tbCadastroUser] (
		[idCadastroUser]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbCurriculo_tbidioma] FOREIGN KEY 
	(
		[ididioma]
	) REFERENCES [dbo].[tbidioma] (
		[ididioma]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbCursoExtraCurricular] ADD 
	CONSTRAINT [FK_tbCursoExtraCurricular_tbCurriculo] FOREIGN KEY 
	(
		[idcurriculo]
	) REFERENCES [dbo].[tbCurriculo] (
		[idcurriculo]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbDeficienteFisico] ADD 
	CONSTRAINT [FK_tbDeficienteFisico_tbDefAuditiva] FOREIGN KEY 
	(
		[idDefAuditiva]
	) REFERENCES [dbo].[tbDefAuditiva] (
		[idDefAuditiva]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbDeficienteFisico_tbDefFala] FOREIGN KEY 
	(
		[idDefFala]
	) REFERENCES [dbo].[tbDefFala] (
		[idDefFala]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbDeficienteFisico_tbDefMental] FOREIGN KEY 
	(
		[idDefMental]
	) REFERENCES [dbo].[tbDefMental] (
		[idDefMental]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbDeficienteFisico_tbDefMotora] FOREIGN KEY 
	(
		[idDefMotora]
	) REFERENCES [dbo].[tbDefMotora] (
		[idDefMotora]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbDeficienteFisico_tbDefVisual] FOREIGN KEY 
	(
		[idDefVisual]
	) REFERENCES [dbo].[tbDefVisual] (
		[idDefVisual]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbDeficienteFisico_tbuser] FOREIGN KEY 
	(
		[idUser]
	) REFERENCES [dbo].[tbuser] (
		[idUser]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbDescEmpresa_Vaga] ADD 
	CONSTRAINT [FK_tbDescEmpresa_Vaga_tbCadastroEmpresa] FOREIGN KEY 
	(
		[idCadastroEmpresa]
	) REFERENCES [dbo].[tbCadastroEmpresa] (
		[idCadastroEmpresa]
	)
GO

ALTER TABLE [dbo].[tbDocumento] ADD 
	CONSTRAINT [FK_tbDocumento_tbCadastroUser] FOREIGN KEY 
	(
		[idCadastroUser]
	) REFERENCES [dbo].[tbCadastroUser] (
		[idCadastroUser]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbDocumento_tbTipoDocumento] FOREIGN KEY 
	(
		[idTipoDocumento]
	) REFERENCES [dbo].[tbTipoDocumento] (
		[idTipoDocumento]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbEmail_res] ADD 
	CONSTRAINT [FK_tbEmail_res_tbFAQ] FOREIGN KEY 
	(
		[idFAQ]
	) REFERENCES [dbo].[tbFAQ] (
		[idFAQ]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbExperienciaInformatica] ADD 
	CONSTRAINT [FK_tbExperienciaInformatica_TbConhecimentoInformatica] FOREIGN KEY 
	(
		[idTipoConhecimento]
	) REFERENCES [dbo].[tbConhecimentoInformatica] (
		[idTipoConhecimento]
	),
	CONSTRAINT [FK_tbExperienciaInformatica_tbCurriculo] FOREIGN KEY 
	(
		[idcurriculo]
	) REFERENCES [dbo].[tbCurriculo] (
		[idcurriculo]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbExperienciaInformatica_tbExperienciaInfoNivel] FOREIGN KEY 
	(
		[idGrauExperiencia]
	) REFERENCES [dbo].[tbExperienciaInfoNivel] (
		[idGrauExperiencia]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbExperienciaInformatica_tbTipoConhecimentoRel] FOREIGN KEY 
	(
		[idTipoConhecimentoRel]
	) REFERENCES [dbo].[tbTipoConhecimentoRel] (
		[idTipoConhecimentoRel]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbExperienciaProf] ADD 
	CONSTRAINT [FK_tbExperienciaProf_tbAreaAtuacao] FOREIGN KEY 
	(
		[idAreaAtuacao]
	) REFERENCES [dbo].[tbAreaAtuacao] (
		[idAreaAtuacao]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbExperienciaProf_tbCurriculo] FOREIGN KEY 
	(
		[idcurriculo]
	) REFERENCES [dbo].[tbCurriculo] (
		[idcurriculo]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbExperienciaProf_tbFuncao] FOREIGN KEY 
	(
		[idfuncao]
	) REFERENCES [dbo].[tbFuncao] (
		[idfuncao]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbExperienciaProf_tbPorteEmpresa] FOREIGN KEY 
	(
		[idPorte]
	) REFERENCES [dbo].[tbPorteEmpresa] (
		[idPorte]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbExperienciaProf_tbRelacaoTrabalhista] FOREIGN KEY 
	(
		[idRelacaoTrabalhista]
	) REFERENCES [dbo].[tbRelacaoTrabalhista] (
		[idRelacaoTrabalhista]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbFAQresAssunto] ADD 
	CONSTRAINT [FK_tbFAQresAssunto_tbFAQ] FOREIGN KEY 
	(
		[idFAQ]
	) REFERENCES [dbo].[tbFAQ] (
		[idFAQ]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbFormacao] ADD 
	CONSTRAINT [FK_tbFormacao_tbCurriculo] FOREIGN KEY 
	(
		[idcurriculo]
	) REFERENCES [dbo].[tbCurriculo] (
		[idcurriculo]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbFormacao_tbInstituicao] FOREIGN KEY 
	(
		[idInstituicao]
	) REFERENCES [dbo].[tbInstituicao] (
		[idInstituicao]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbFormacao_tbTipoFormacao] FOREIGN KEY 
	(
		[idTipoFormacao]
	) REFERENCES [dbo].[tbTipoFormacao] (
		[idTipoFormacao]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbFuncao] ADD 
	CONSTRAINT [FK_tbFuncao_tbFuncaoIndex] FOREIGN KEY 
	(
		[idindex]
	) REFERENCES [dbo].[tbFuncaoIndex] (
		[idindex]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbIdiomaC] ADD 
	CONSTRAINT [FK_tbIdiomaC_tbCurriculo1] FOREIGN KEY 
	(
		[idcurriculo]
	) REFERENCES [dbo].[tbCurriculo] (
		[idcurriculo]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbIdiomaC_tbidioma] FOREIGN KEY 
	(
		[ididioma]
	) REFERENCES [dbo].[tbidioma] (
		[ididioma]
	),
	CONSTRAINT [FK_tbIdiomaC_tbIdiomaNivel] FOREIGN KEY 
	(
		[ididiomanivel]
	) REFERENCES [dbo].[tbIdiomaNivel] (
		[ididiomanivel]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbInstituicao] ADD 
	CONSTRAINT [FK_tbInstituicao_tbInstituicaoEstado] FOREIGN KEY 
	(
		[estado]
	) REFERENCES [dbo].[tbInstituicaoEstado] (
		[estado]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbInstituicao_tbInstituicaoTipo] FOREIGN KEY 
	(
		[identidadeTipo]
	) REFERENCES [dbo].[tbInstituicaoTipo] (
		[identidadeTipo]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbMultimidia] ADD 
	CONSTRAINT [FK_tbMultimidia_tbCadastroUser] FOREIGN KEY 
	(
		[idCadastroUser]
	) REFERENCES [dbo].[tbCadastroUser] (
		[idCadastroUser]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbRELcandidato_vaga] ADD 
	CONSTRAINT [FK_tbRELcandidato_vaga_tbCurriculo] FOREIGN KEY 
	(
		[idcurriculo]
	) REFERENCES [dbo].[tbCurriculo] (
		[idcurriculo]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbRELcandidato_vaga_tbVaga] FOREIGN KEY 
	(
		[idvaga]
	) REFERENCES [dbo].[tbVaga] (
		[idVaga]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbTelefone] ADD 
	CONSTRAINT [FK_tbTelefone_tbCadastroUser] FOREIGN KEY 
	(
		[idCadastroUser]
	) REFERENCES [dbo].[tbCadastroUser] (
		[idCadastroUser]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbTelefone_tbTipoTelefone1] FOREIGN KEY 
	(
		[idTipoTelefone]
	) REFERENCES [dbo].[tbTipoTelefone] (
		[idTipoTelefone]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbTipoConhecimentoRel] ADD 
	CONSTRAINT [FK_tbTipoConhecimentoRel_TbConhecimentoInformatica] FOREIGN KEY 
	(
		[idTipoConhecimento]
	) REFERENCES [dbo].[tbConhecimentoInformatica] (
		[idTipoConhecimento]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbVaga] ADD 
	CONSTRAINT [FK_tbVaga_tbCadastroEmpresa] FOREIGN KEY 
	(
		[idCadastroEmpresa]
	) REFERENCES [dbo].[tbCadastroEmpresa] (
		[idCadastroEmpresa]
	),
	CONSTRAINT [FK_tbVaga_tbDescEmpresa_Vaga] FOREIGN KEY 
	(
		[iddsempresa]
	) REFERENCES [dbo].[tbDescEmpresa_Vaga] (
		[iddsempresa]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbVaga_tbFuncao] FOREIGN KEY 
	(
		[idfuncao]
	) REFERENCES [dbo].[tbFuncao] (
		[idfuncao]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbVaga_tbStatusVaga] FOREIGN KEY 
	(
		[idstatusvaga]
	) REFERENCES [dbo].[tbStatusVaga] (
		[idstatusvaga]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbintercambio] ADD 
	CONSTRAINT [FK_tbintercambio_tbCurriculo] FOREIGN KEY 
	(
		[idcurriculo]
	) REFERENCES [dbo].[tbCurriculo] (
		[idcurriculo]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_tbintercambio_tbTipoIntercambio] FOREIGN KEY 
	(
		[idTipoIntercambio]
	) REFERENCES [dbo].[tbTipoIntercambio] (
		[idTipoIntercambio]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[tbuser] ADD 
	CONSTRAINT [FK_tbuser_tbuserType1] FOREIGN KEY 
	(
		[idTypeUser]
	) REFERENCES [dbo].[tbuserType] (
		[idTypeUser]
	) ON UPDATE CASCADE 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwuser
AS
SELECT     dbo.tbuser.idUser, dbo.tbuser.idTypeUser AS grupo, dbo.tbuser.userName, dbo.tbuser.password, dbo.tbuser.email, dbo.tbuser.frase, 
                      dbo.tbuser.bloquear, dbo.tbuser.data, dbo.tbuser.privacidade
FROM         dbo.tbuserType INNER JOIN
                      dbo.tbuser ON dbo.tbuserType.idTypeUser = dbo.tbuser.idTypeUser

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.totalusuarios
AS
SELECT     COUNT(*) AS usuarios
FROM         dbo.tbuser

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwInformaticaRel
AS
SELECT     dbo.tbTipoConhecimentoRel.idTipoConhecimentoRel, dbo.tbTipoConhecimentoRel.idTipoConhecimento, 
                      dbo.tbTipoConhecimentoRel.dsTipoConhecimentoRel, dbo.tbConhecimentoInformatica.dsTipoConhecimento
FROM         dbo.tbTipoConhecimentoRel INNER JOIN
                      dbo.tbConhecimentoInformatica ON dbo.tbTipoConhecimentoRel.idTipoConhecimento = dbo.tbConhecimentoInformatica.idTipoConhecimento

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwconhecimentoInformatica
AS
SELECT     dbo.TbConhecimentoInformatica.dsTipoConhecimento, dbo.tbTipoConhecimentoRel.dsTipoConhecimentoRel, 
                      dbo.tbTipoConhecimentoRel.idTipoConhecimento, dbo.tbTipoConhecimentoRel.idTipoConhecimentoRel
FROM         dbo.TbConhecimentoInformatica INNER JOIN
                      dbo.tbTipoConhecimentoRel ON dbo.TbConhecimentoInformatica.idTipoConhecimento = dbo.tbTipoConhecimentoRel.idTipoConhecimento

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwfaq
AS
SELECT     dbo.tbFAQ.idFAQ, dbo.tbFAQ.tema, dbo.tbFAQ.contaclick, dbo.tbFAQ.apresentar, dbo.tbFAQresAssunto.idFAQresAssunto, dbo.tbFAQresAssunto.duvida, 
                      dbo.tbFAQresAssunto.data, dbo.tbFAQresAssunto.apresentar AS apr1, dbo.tbFAQresAssunto.resposta, dbo.tbFAQresAssunto.datares
FROM         dbo.tbFAQ INNER JOIN
                      dbo.tbFAQresAssunto ON dbo.tbFAQ.idFAQ = dbo.tbFAQresAssunto.idFAQ
WHERE     (dbo.tbFAQresAssunto.apresentar = 1)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwFAQres
AS
SELECT     dbo.tbFAQ.idFAQ, dbo.tbFAQ.tema, dbo.tbFAQ.contaclick, dbo.tbFAQ.apresentar, dbo.tbFAQresAssunto.idFAQresAssunto
FROM         dbo.tbFAQ LEFT OUTER JOIN
                      dbo.tbFAQresAssunto ON dbo.tbFAQ.idFAQ = dbo.tbFAQresAssunto.idFAQ

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwfuncao
AS
SELECT     dbo.tbFuncaoIndex.idindex, dbo.tbFuncaoIndex.dsindex, dbo.tbFuncao.idfuncao, dbo.tbFuncao.dsfuncao
FROM         dbo.tbFuncaoIndex INNER JOIN
                      dbo.tbFuncao ON dbo.tbFuncaoIndex.idindex = dbo.tbFuncao.idindex

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwinformatica
AS
SELECT     dbo.tbExperienciaInformatica.idexprofissionalInformatica, dbo.tbExperienciaInformatica.idcurriculo, dbo.tbExperienciaInformatica.idTipoConhecimento, 
                      dbo.tbExperienciaInformatica.idTipoConhecimentoRel, dbo.tbExperienciaInformatica.obs, dbo.tbTipoConhecimentoRel.dsTipoConhecimentoRel, 
                      dbo.tbConhecimentoInformatica.dsTipoConhecimento
FROM         dbo.tbExperienciaInformatica INNER JOIN
                      dbo.tbTipoConhecimentoRel ON 
                      dbo.tbExperienciaInformatica.idTipoConhecimentoRel = dbo.tbTipoConhecimentoRel.idTipoConhecimentoRel INNER JOIN
                      dbo.tbConhecimentoInformatica ON dbo.tbExperienciaInformatica.idTipoConhecimento = dbo.tbConhecimentoInformatica.idTipoConhecimento AND 
                      dbo.tbTipoConhecimentoRel.idTipoConhecimento = dbo.tbConhecimentoInformatica.idTipoConhecimento

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwinstituicao
AS
SELECT     dbo.tbInstituicao.idInstituicao, dbo.tbInstituicao.identidadeTipo, dbo.tbInstituicaoTipo.dsTipo, dbo.tbInstituicao.dsinstituicao, dbo.tbInstituicao.estado, 
                      dbo.tbInstituicaoEstado.uf
FROM         dbo.tbInstituicao INNER JOIN
                      dbo.tbInstituicaoEstado ON dbo.tbInstituicao.estado = dbo.tbInstituicaoEstado.estado INNER JOIN
                      dbo.tbInstituicaoTipo ON dbo.tbInstituicao.identidadeTipo = dbo.tbInstituicaoTipo.identidadeTipo

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwdeficienciafisica
AS
SELECT     dbo.tbDeficienteFisico.idUser, dbo.tbDeficienteFisico.Obs, dbo.tbDefFala.dsDefFala, dbo.tbDefAuditiva.dsDefAuditiva, dbo.tbDefMental.dsDefMental, 
                      dbo.tbDefMotora.dsDefMotora, dbo.tbDefVisual.dsDefVisual
FROM         dbo.tbDeficienteFisico INNER JOIN
                      dbo.tbDefFala ON dbo.tbDeficienteFisico.idDefFala = dbo.tbDefFala.idDefFala INNER JOIN
                      dbo.tbDefAuditiva ON dbo.tbDeficienteFisico.idDefAuditiva = dbo.tbDefAuditiva.idDefAuditiva INNER JOIN
                      dbo.tbDefMental ON dbo.tbDeficienteFisico.idDefMental = dbo.tbDefMental.idDefMental INNER JOIN
                      dbo.tbDefMotora ON dbo.tbDeficienteFisico.idDefMotora = dbo.tbDefMotora.idDefMotora INNER JOIN
                      dbo.tbDefVisual ON dbo.tbDeficienteFisico.idDefVisual = dbo.tbDefVisual.idDefVisual

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwcurriculo_publicado
AS
SELECT     dbo.tbCurriculo.ididioma, dbo.tbidioma.dsidioma, dbo.tbCurriculo.publicar, COUNT(*) AS cnt
FROM         dbo.tbCurriculo INNER JOIN
                      dbo.tbidioma ON dbo.tbCurriculo.ididioma = dbo.tbidioma.ididioma
GROUP BY dbo.tbCurriculo.ididioma, dbo.tbidioma.dsidioma, dbo.tbCurriculo.publicar
HAVING      (dbo.tbCurriculo.publicar = 1)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwdocumento
AS
SELECT     dbo.tbDocumento.idDocumento, dbo.tbDocumento.idTipoDocumento, dbo.tbDocumento.idCadastroUser, dbo.tbDocumento.nrDocumento, 
                      dbo.tbTipoDocumento.dsTipoDocumento
FROM         dbo.tbDocumento INNER JOIN
                      dbo.tbTipoDocumento ON dbo.tbDocumento.idTipoDocumento = dbo.tbTipoDocumento.idTipoDocumento

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwExperienciaProf
AS
SELECT     dbo.tbExperienciaProf.idexprofissional, dbo.tbExperienciaProf.idcurriculo, dbo.tbExperienciaProf.idfuncao, dbo.tbExperienciaProf.idAreaAtuacao, 
                      dbo.tbExperienciaProf.idPorte, dbo.tbExperienciaProf.idRelacaoTrabalhista, dbo.tbExperienciaProf.nomeempresa, 
                      dbo.tbExperienciaProf.dsexperiencia, dbo.tbExperienciaProf.data_ini, dbo.tbExperienciaProf.data_fim, dbo.tbAreaAtuacao.dsAreaAtuacao, 
                      dbo.tbRelacaoTrabalhista.dsRelacaoTrabalhista, dbo.tbPorteEmpresa.dsPorte
FROM         dbo.tbExperienciaProf INNER JOIN
                      dbo.tbAreaAtuacao ON dbo.tbExperienciaProf.idAreaAtuacao = dbo.tbAreaAtuacao.idAreaAtuacao INNER JOIN
                      dbo.tbPorteEmpresa ON dbo.tbExperienciaProf.idPorte = dbo.tbPorteEmpresa.idPorte INNER JOIN
                      dbo.tbRelacaoTrabalhista ON dbo.tbExperienciaProf.idRelacaoTrabalhista = dbo.tbRelacaoTrabalhista.idRelacaoTrabalhista

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwconhecimentoInfo
AS
SELECT     dbo.tbConhecimentoInformatica.dsTipoConhecimento, dbo.tbExperienciaInformatica.idcurriculo, dbo.tbExperienciaInformatica.obs, 
                      dbo.tbExperienciaInfoNivel.dsGrauExperiencia, dbo.tbTipoConhecimentoRel.dsTipoConhecimentoRel
FROM         dbo.tbConhecimentoInformatica INNER JOIN
                      dbo.tbExperienciaInformatica ON dbo.tbConhecimentoInformatica.idTipoConhecimento = dbo.tbExperienciaInformatica.idTipoConhecimento INNER JOIN
                      dbo.tbExperienciaInfoNivel ON dbo.tbExperienciaInformatica.idGrauExperiencia = dbo.tbExperienciaInfoNivel.idGrauExperiencia INNER JOIN
                      dbo.tbTipoConhecimentoRel ON dbo.tbConhecimentoInformatica.idTipoConhecimento = dbo.tbTipoConhecimentoRel.idTipoConhecimento AND 
                      dbo.tbExperienciaInformatica.idTipoConhecimentoRel = dbo.tbTipoConhecimentoRel.idTipoConhecimentoRel

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwformacaoacademica
AS
SELECT     TOP 100 PERCENT dbo.tbFormacao.idFormacao, dbo.tbFormacao.idcurriculo, dbo.tbFormacao.idTipoFormacao, dbo.tbFormacao.idInstituicao, 
                      dbo.tbFormacao.dsCurso, dbo.tbFormacao.obs, dbo.tbFormacao.data_ini, dbo.tbFormacao.data_fim, dbo.tbInstituicao.dsinstituicao, 
                      dbo.tbInstituicaoEstado.estado, dbo.tbInstituicaoEstado.uf, dbo.tbInstituicaoTipo.dsTipo
FROM         dbo.tbFormacao INNER JOIN
                      dbo.tbInstituicao ON dbo.tbFormacao.idInstituicao = dbo.tbInstituicao.idInstituicao INNER JOIN
                      dbo.tbInstituicaoTipo ON dbo.tbInstituicao.identidadeTipo = dbo.tbInstituicaoTipo.identidadeTipo INNER JOIN
                      dbo.tbInstituicaoEstado ON dbo.tbInstituicao.estado = dbo.tbInstituicaoEstado.estado
ORDER BY dbo.tbInstituicaoTipo.dsTipo

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.vwidioma
AS
SELECT     dbo.tbIdiomaC.ididiomaC, dbo.tbIdiomaC.idcurriculo, dbo.tbIdiomaC.ididioma, dbo.tbIdiomaC.ididiomanivel, dbo.tbIdiomaNivel.dsnivel, 
                      dbo.tbidioma.dsidioma, dbo.tbIdiomaC.dscomentario
FROM         dbo.tbIdiomaC INNER JOIN
                      dbo.tbIdiomaNivel ON dbo.tbIdiomaC.ididiomanivel = dbo.tbIdiomaNivel.ididiomanivel INNER JOIN
                      dbo.tbidioma ON dbo.tbIdiomaC.ididioma = dbo.tbidioma.ididioma

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE dbo.spContadorAcesso
(	
	@idUser As Int
)

AS

	DECLARE @ultimoacess As Datetime

	SET @ultimoacess = (SELECT dataultimoacess FROM tbCadastroEmpresa WHERE (idUser = @idUser))

	if (@ultimoacess is null) or (@ultimoacess = '')

		SELECT dataultimoacess FROM tbCadastroUser WHERE (idUser = @idUser)
	else

		SELECT dataultimoacess FROM tbCadastroEmpresa WHERE (idUser = @idUser)


	SET NOCOUNT OFF;

	UPDATE tbCadastroEmpresa SET contador = contador + 1, dataultimoacess = getdate()  WHERE (idUser = @idUser)
	UPDATE tbCadastroUser SET contador = contador + 1, dataultimoacess = getdate()  WHERE (idUser = @idUser)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE dbo.spGetFunction
(
	@buscador As Varchar(255) 
)


AS
		SELECT idfuncao, idindex, dsfuncao FROM tbFuncao  WHERE (dsfuncao LIKE @buscador) ORDER BY dsfuncao
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE dbo.spGetInstituicao
(
	@buscador As Varchar(255) 
)

AS
		SELECT idInstituicao, identidadeTipo, dsTipo, dsinstituicao, estado, uf FROM vwinstituicao WHERE (dsinstituicao LIKE @buscador) ORDER BY dsinstituicao
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE dbo.spGetUser

AS

	SELECT MAX(idUser) as IdUser FROM tbuser
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE dbo.spGetUserName
(	
	@idUser As int
)

AS


	SELECT nome, cadastroTipo FROM tbCadastroUser WHERE (idUser = @idUser)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE dbo.spGetUserNameEmp
(	
	@idUser As int
)

AS

	SELECT nmempresa, nomeRes  FROM tbCadastroEmpresa WHERE (idUser = @idUser)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE dbo.spIncEmail
(
	@idUser As int,
	@idcurriculo As int,
	@emailTO As varchar(200),
	@midia As varchar(200),
	@codigo As varchar(50),
	@apresentacao As text
	
)
AS

	SET NOCOUNT OFF;
	INSERT INTO tbpublicaCurriculo (idUser, idcurriculo, emailTO, midia, codigo, apresentacao) VALUES (@idUser, @idcurriculo, @emailTO, @midia, @codigo, @apresentacao)

	SELECT MAX(idpublica) as idpublica FROM tbpublicaCurriculo
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE dbo.spUpdEmail
(	
	@idpublica As int
)

AS

	DECLARE @status As Bit
	Set @status = '1'

	SET NOCOUNT OFF;
	UPDATE [tbpublicaCurriculo] SET [status] = @status WHERE [idpublica] = @idpublica
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE dbo.spUpdateFAQ
(	
	@ip varchar(18),
	@ticket varchar(25)
)

AS

	DECLARE @idemailres As int

	Set @idemailres = (SELECT MAX(idemailres) FROM tbEmail_res)

	SET NOCOUNT OFF;
	UPDATE tbEmail_res SET ip = @ip, ticket = @ticket  WHERE (idemailres = @idemailres)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE dbo.spUpdateFoto
(	
	@idCadastroUser As int,
	@foto As varchar(255)

)

AS
	SET NOCOUNT OFF;
	UPDATE [tbCadastroUser] SET [foto] = @foto WHERE [idCadastroUser] = @idCadastroUser
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE dbo.spVerifyUser
(
	@email As varchar(180)
)
AS

	SELECT email FROM tbuser WHERE (email = @email)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE dbo.spcontaFAQ
(	
	@idFAQ int
)

AS

	SET NOCOUNT OFF;
	UPDATE tbFAQ SET contaclick = contaclick + 1 WHERE (idFAQ = @idFAQ)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

