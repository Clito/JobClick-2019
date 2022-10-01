Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter

Partial Class _gestor_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        REM ** RECUPERA A SESSÃO DA EMPRESA
        REM ** ****************************************************************************************
        Dim idUser As String = Session("idUser")
        Session("idCadastroEmpresa_Pai") = Session("idCadastroEmpresa")
        If idUser <> "" Then
            RECUPERAEMPRESAFILHA(idUser)
        End If
        idRH_GestorLabel.Text = Session("idUser")
        ApresentaLabel.Text = "Empresa Wiabiliza = " & Session("idCadastroEmpresa_Pai") & "Empresa Filha = " & Session("idCadastroEmpresa_Filha")


    End Sub

    Sub RECUPERAEMPRESAFILHA(idUser As String)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_GESTOR]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idUser", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idUser").Value = idUser

        cn.Open()

        'Try

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then
            dr.Read()
            Session("idCadastroEmpresa_Filha") = dr("idCadastroEmpresa")
            idRH_GestorLabel.Text = dr("idUser")
        End If

        dr.Close()

        'Catch ex As Exception

        'End Try

        cn.Close()

    End Sub


End Class
