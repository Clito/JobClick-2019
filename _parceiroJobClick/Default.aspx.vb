Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _parceiroJobClick_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Request.QueryString("parceiro") <> "" Then
            Session("idCadastroEmpresa") = Request.QueryString("parceiro")
        End If

        REM ** ******************************************************************************
        REM ** CARREGA ALGUMAS VARIÁVEIS IMPORTANTES NO SISTEMA (DEMO)
        REM ** ******************************************************************************
        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_LOGIN_PARA_AD_PARCEIRO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

            Session("idsetup") = dr("idSetup")
            Session("idUser") = dr("idUser")
            Session("idTypeUser") = dr("idTypeUser")
            Session("nome") = dr("nomeRes")
            Session("nmempresa") = dr("nmempresa")
            Session("idCadastroUser") = dr("idCadastroUser")
            Session("idCadastroEmpresa") = dr("idCadastroEmpresa")
            Session("emailRes") = dr("emailRes")
            Session("ddd") = dr("ddd")
            Session("telefone") = dr("telefone")

            REM ** **************************************************************************
            REM ** DADOS PARA EMISSÃO DE BOLETO
            REM ** **************************************************************************
            Session("cnpj") = dr("cnpj")
            Session("endereco") = dr("endereco")
            Session("complemento") = dr("complemento")
            Session("bairro") = dr("bairro")
            Session("cep") = dr("cep")
            Session("uf") = dr("uf")
            Session("numero") = dr("numero")
            Session("estado") = dr("dsuf")
            Session("cidade") = dr("cidade")
            Session("pais") = dr("pais")
            Session("emailAdmin") = dr("emailAdmin")

        End If

        dr.Close()
        cn.Close()

        REM ** ******************************************************************************
        REM ** [FIM]
        REM ** ******************************************************************************

        DELETAVAGASPATROCINADAS()

    End Sub

    Sub DELETAVAGASPATROCINADAS()

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_AD_DELETA", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

    End Sub

End Class
