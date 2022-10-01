Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _anonimo_Default
    Inherits System.Web.UI.Page

    Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs)

        If Request.QueryString("jobclickCryp") <> "" Then
            Try
                Session("SETLayout_anonimo") = criptografia.Descriptografar(Request.QueryString("jobclickCryp"), "#!$a36?@")
            Catch ex As Exception
                Response.Redirect("/")
            End Try
        Else
            Session("SETLayout_anonimo") = "jobclick"
        End If

        If Request.QueryString("jobclickCrypID") <> "" Then
            Session("idCadastroEmpresa_ANONIMO") = criptografia.Descriptografar(Request.QueryString("jobclickCrypID"), "#!$a36?@")
        Else
            Session("idCadastroEmpresa_ANONIMO") = 1
        End If

        If Request.QueryString("jobclickProtocolo") <> "" Then
            Session("jobclickProtocolo") = criptografia.Descriptografar(Request.QueryString("jobclickProtocolo"), "#!$a36?@")
        End If

        Dim SETLayout As String = Session("SETLayout_anonimo")
        If SETLayout <> "" Then
            MasterPageFile = "~/_corporativo_departamento/modulo_" & SETLayout & "/master/MasterPageGESTOR.master"
        Else
            MasterPageFile = "~/_corporativo_departamento/modulo_jobclick/master/MasterPageGESTOR.master"
        End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        PanelAviso.Visible = False
    End Sub

    Protected Sub LOGIN_Click(sender As Object, e As System.EventArgs) Handles LOGIN.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_LOGIN_DEPARTAMENTO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@email", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@email").Value = TextBoxemail.Text

        prm = New SqlParameter("@senha", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@senha").Value = TextBoxsenha.Text

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa_ANONIMO")

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                REM ** CARREGA AS VARIÁVEIS E REDIRECIONA PARA PÁGINA (_gestor.aspx)
                Session("idRH_Gestor_ANONIMO") = dr("idRH_Gestor")
                Session("idCadastroEmpresa_ANONIMO") = dr("idCadastroEmpresa")
                Session("nome_ANONIMO") = dr("nome_departamento")
                Session("email_ANONIMO") = dr("email_departamento")
                Session("nome_GESTOR") = dr("nome")
                Session("email_GESTOR") = dr("email")
                Session("ddd_GESTOR") = dr("ddd")
                Session("telefone_GESTOR") = dr("telefone")

                Response.Redirect("~/_corporativo_departamento/")
            Else
                PanelAviso.Visible = True
                AVISOLABEL.Text = "• Acesso Negado!<br>"
                AVISOLABEL.CssClass = "msnNOK"
                ImageAVISO.ImageUrl = "images/buttonNOK.png"
            End If
            cn.Close()
        Catch ex As Exception
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• (Erro) Acesso Negado!<br>" & Err.Description
            AVISOLABEL.CssClass = "msnNOK"
            ImageAVISO.ImageUrl = "images/buttonNOK.png"
        End Try

    End Sub
End Class
