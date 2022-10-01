Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Public Class userEmpresaService

    Public Shared Function GetDadoEmpresa(ByVal uPwd As String, uEmail As String) As userEmpresa

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim en As userEmpresa = New userEmpresa

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_LOGIN_EMPRESA_CREDITO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@password", SqlDbType.VarChar, 16)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@password").Value = uPwd

        prm = New SqlParameter("@email", SqlDbType.VarChar, 180)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@email").Value = uEmail


        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

            en.idUser = dr("idUser")
            en.idCadastroEmpresa = dr("idCadastroEmpresa")
            en.url = dr("url")
            en.idTypeUser = dr("idTypeUser")
            en.nmempresa = dr("nmempresa")
            en.nomeRes = dr("nomeRes")
            en.idCadastroUser = dr("idCadastroUser")
            en.dataultimoacess = dr("dataultimoacess")
            en.nome = dr("nome")
            en.idRH_Gestor = dr("idRH_Gestor")
            en.idSetup = GetSetup(dr("idCadastroEmpresa"))
            en.liberaQtdCad = dr("liberaQtdCad")
            en.candidatoPaga = dr("candidatoPaga")
            en.idClient_SMS = dr("idClient_SMS")
            en.idProject_SMS = dr("idProject_SMS")
            en.userName_SMS = dr("userName")
            en.PWD_SMS = dr("password")
            en.emailRes = dr("emailRes")

            en.nomeConsultor = dr("nomeConsultor")
            en.emailConsultor = dr("emailConsultor")

            If dr("DDD") Is DBNull.Value Then
                en.ddd = 0
            Else
                en.ddd = dr("DDD")
            End If

            If dr("telefoneGestor") Is DBNull.Value Then
                en.telefoneGestor = 0
            Else
                en.telefoneGestor = dr("telefoneGestor")
            End If

            en.dddEmpresa = dr("DDDEmpresa")
            en.telefoneEmpresa = dr("TELEFONEEmpresa")

            en.bairro = dr("bairro")
            en.Cidade = dr("cidade")
            en.Endereco = dr("endereco")
            en.CEP = dr("CEP")
            en.Estado = dr("cidade")
            en.uf = dr("uf")
            en.SETLayout = dr("SETLayout")
            en.CustomCSS = dr("CustomCSS")
            en.contador = dr("contador")


            FormsAuthentication.SetAuthCookie(dr("idTypeUser"), False)

        Else

            en.idUser = 0
            en.idCadastroEmpresa = 0
            en.url = "/"
            en.idTypeUser = ""
            en.nmempresa = ""
            en.nomeRes = ""
            en.idCadastroUser = 0
            en.dataultimoacess = ""
            en.nome = ""
            en.idRH_Gestor = 0
            en.ddd = ""
            en.telefoneGestor = ""
            en.idSetup = 1
            en.userName_SMS = ""
            en.bairro = ""
            en.Cidade = ""
            en.Endereco = ""
            en.CEP = ""
            en.Estado = ""
            en.contador = 0

        End If

        dr.Close()
        cn.Close()

        Return en

    End Function

    Public Shared Function GetSetup(idCadastroEmpresa As Int32) As Int32

        Dim idSetupRES As Int32

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim en As userEmpresa = New userEmpresa

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_SETUP", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresa

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then
            dr.Read()
            idSetupRES = dr("idsetup")
        Else
            idSetupRES = 1
        End If

        Return idSetupRES

    End Function

End Class
