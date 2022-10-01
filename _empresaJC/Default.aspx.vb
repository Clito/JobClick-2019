Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Web.Security
Imports System.Web.HttpCookie
Imports System.DBNull
Imports EmailSQL
Imports BodyEmail


Partial Class _empresa_Default
    Inherits System.Web.UI.Page


    Sub VERIFICAPROMOCODE(idCadastroEmpresa As Int32)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROMOCODE_UTILIZADO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresa

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Read()

        Session("PROMOCODE") = dr("PROMOCODE")

        dr.Close()
        cn.Close()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        idCadastroEmpresaLabel.Text = Session("idCadastroEmpresa")
        'If idCadastroEmpresaLabel.Text <> "" Then
        '    VERIFICAPROMOCODE(idCadastroEmpresaLabel.Text)

        '    REM ** ********************************************************************************************
        '    REM ** LIBERA O PROMOCODE
        '    REM ** ********************************************************************************************
        '    If Session("PROMOCODE") <> "0" Then
        '        GET_PROMO.Visible = False
        '        InstruLabel.Text = "<b>(!)</b><br>Seu Promocode está ativo: <b>" & Session("PROMOCODE") & "</B> para utiliza-lo você deverá clicar em [<a href='/logout.aspx'><b>Sair</b></a>] e se logar novamente no JOBCLICK"
        '        LIBERA_ACESSO()
        '    Else
        '        GET_PROMO.Visible = True
        '    End If
        '    REM ** ********************************************************************************************
        '    REM ** LIBERA O PROMOCODE
        '    REM ** ********************************************************************************************


        '    lblStatus.Text = ""
        '    idRH_gestorLabel.Text = "Session Gestor: " & Session("idRH_Gestor")

        '    emailLabel.Text = Session("emailUser")
        '    nomeLabel.Text = Session("nomeRes")
        '    emailRes.Text = Session("email")

        '    If Not IsPostBack Then
        '        Session("PROMOCODERES") = 0
        '    End If
        'End If
    End Sub

    Sub GetPROMOCODE(idCadastroEmpresa As Int32)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROMOCODE_DB", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresa

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Read()



        dr.Close()
        cn.Close()


    End Sub

    Sub LIBERA_ACESSO()


        REM ** *********************************************************************************
        REM ** [LIBERA PROMOCODE AO CLIENTE]
        REM ** *********************************************************************************

        LIBERAPROMOCODE(idCadastroEmpresaLabel.Text, 1)

        REM ** *********************************************************************************
        REM ** [FIM]
        REM ** *********************************************************************************

    End Sub

    Sub LIBERAPROMOCODE(idCadastroEmpresa As Int32, IdStatus As Int32)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_LIBERA_PROMOCODE", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@IdStatus", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@PROMOCODE", SqlDbType.VarChar, 200)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)


        cmd.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresa
        cmd.Parameters("@IdStatus").Value = IdStatus
        cmd.Parameters("@PROMOCODE").Value = Session("PROMOCODE")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

        End If

        dr.Close()
        cn.Close()

        SomaSMS(idCadastroEmpresa, 200)
        ENVIAMENSAGEM()

    End Sub

    Sub ENVIAMENSAGEM()

        Dim BodyEmailRES As String = ""
        Dim MENSAGEMRES As String = ""
        MENSAGEMRES = "PROMOCODE"

        Dim myEnviaEmail As New EmailSQL
        Dim myBodyEmail As New BodyEmail

        BodyEmailRES = Replace(Replace(Replace(Replace(myBodyEmail.GetBodySetup(MENSAGEMRES, 1), "#1#", "Informações sobre a liberação do Promocode " & Session("PROMOCODE") & " JobClick e-Recruitment"), "#2#", Session("nmempresa")), "#3#", Session("nomeRes")), "#4#", "[Confirmação de liberação de seu Promocode JOBCLICK].")
        myEnviaEmail.EnviamensagemSQL(BodyEmailRES, Session("nomeRes"), Session("emailUser"), "Seu Promocode no JobClick e-Recruitment")

    End Sub
    Sub SomaSMS(idCadastroEmpresa As Int32, QTDCota As Int32)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_CREDITO_SMS", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@QTDCota", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idCadastroEmpresa").Value = idCadastroEmpresa
        cmd.Parameters("@QTDCota").Value = QTDCota

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

    End Sub


End Class
