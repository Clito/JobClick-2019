Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Public Class userCandidatoService

    Public Shared Function GetDadoCandidato(ByVal uPwd As String, uEmail As String) As userCandidato

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim en As userCandidato = New userCandidato

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_LOGIN_CANDIDATO", cn)
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
            en.url = dr("url")
            en.idTypeUser = dr("idTypeUser")
            en.emailRes = dr("email")

            If dr("idCadastroUser") Is DBNull.Value Then
                en.idCadastroUser = 0
            Else
                en.idCadastroUser = dr("idCadastroUser")
            End If

            If dr("dataultimoacess") Is DBNull.Value Then
                en.dataultimoacess = Now()
            Else
                en.dataultimoacess = dr("dataultimoacess")
            End If

            If dr("nome") Is DBNull.Value Then
                en.nome = "Administrador JOBCLICK"
            Else
                en.nome = dr("nome")
            End If

            If dr("idCurriculo") Is DBNull.Value Then
                en.idCurriculo = 0
            Else
                en.idCurriculo = dr("idCurriculo")
            End If

            If dr("dscurriculo") Is DBNull.Value Then
                en.dscurriculo = 0
            Else
                en.dscurriculo = dr("dscurriculo")
            End If

            If dr("foto") Is DBNull.Value Then
                en.foto = "http://foto.jobclick.com.br/_candidato/foto/cvnoImage.png"
            Else
                en.foto = dr("foto")
            End If

            REM ** ****************************************************************************************************
            REM ** RETORNA CAMPOS PARA O PAGSEGURO E OUTROS BANCOS
            REM ** ****************************************************************************************************

            If dr("endereco") Is DBNull.Value Then
                en.Endereco = 0
            Else
                en.Endereco = dr("endereco")
            End If

            If dr("complemento") Is DBNull.Value Then
                en.Complemento = 0
            Else
                en.Complemento = dr("complemento")
            End If

            If dr("bairro") Is DBNull.Value Then
                en.Bairro = 0
            Else
                en.Bairro = dr("bairro")
            End If

            If dr("cidade") Is DBNull.Value Then
                en.Cidade = 0
            Else
                en.Cidade = dr("cidade")
            End If

            If dr("uf") Is DBNull.Value Then
                en.uf = 0
            Else
                en.uf = dr("uf")
            End If

            If dr("cep") Is DBNull.Value Then
                en.CEP = 0
            Else
                en.CEP = dr("cep")
            End If

            If dr("ddd") Is DBNull.Value Then
                en.ddd = 0
            Else
                en.ddd = dr("ddd")
            End If

            If dr("telefone") Is DBNull.Value Then
                en.telefone = 0
            Else
                en.telefone = dr("telefone")
            End If

            REM ** ****************************************************************************************************
            REM ** [FIM] RETORNA CAMPOS PARA O PAGSEGURO E OUTROS BANCOS
            REM ** ****************************************************************************************************


            en.isCandidato = 1

            FormsAuthentication.SetAuthCookie(dr("idTypeUser"), False)

        Else

            en.idUser = 0
            en.url = "/"
            en.idTypeUser = ""
            en.idCadastroUser = 0
            en.dataultimoacess = ""
            en.nome = ""
            en.isCandidato = 0
            en.idCurriculo = 0

        End If

            dr.Close()
            cn.Close()

            Return en

    End Function

End Class
