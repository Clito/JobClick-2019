Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class loginMailingParceiroJobclick
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Request.QueryString("parceiro") <> "" Then

            Dim idCadastroUser As String = Request.QueryString("parceiro")

            Dim findIdCadastroUser As Int32 = 0
            Dim idCadastroUser_ As Int32 = 0
            idCadastroUser = Trim(idCadastroUser)


            Dim i As Int32 = 0
            Dim nCar As String = ""
            Dim cCar As String = ""

            Dim ChavePar = 256
            Dim ChaveImpar = 255

            If ChavePar < 1 Or ChavePar > 255 Then ChavePar = 25
            If ChaveImpar < 1 Or ChaveImpar > 255 Then ChaveImpar = 33

            cCar = ""

            For i = 1 To Len(idCadastroUser)
                If i / 2 = Int(i / 2) Then
                    nCar = Asc(Mid(idCadastroUser, i, 1)) Xor ChavePar
                Else
                    nCar = Asc(Mid(idCadastroUser, i, 1)) Xor ChaveImpar
                End If
                cCar = cCar + Chr(nCar)
            Next

            findIdCadastroUser = InStr(cCar, "|") - 1
            idCadastroUser_ = Left(cCar, findIdCadastroUser)

            Session("idCadastroEmpresa") = idCadastroUser_

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

                FormsAuthentication.SetAuthCookie(dr("idTypeUser"), False)
                Response.Redirect("_parceiroJobClick")

            End If

            dr.Close()
            cn.Close()

            REM ** ******************************************************************************
            REM ** [FIM]
            REM ** ******************************************************************************

        Else
            Response.Redirect("/")
        End If


    End Sub
End Class
