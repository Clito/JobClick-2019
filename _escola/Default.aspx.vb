Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Web.Security
Imports System.Web.HttpCookie
Imports System.DBNull

Partial Class _escola_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        lblStatus.Text = ""
        idRH_gestorLabel.Text = "Session Gestor: " & Session("idRH_Gestor")

        If Session("idCadastroEmpresa") = "" Then
            Response.Redirect("/_empresa/cadastro.aspx")
        End If

        If Session("idUser") Then

            Dim idUserRes As Int32 = Session("idUser")

            REM ** **********************************************************************
            REM ** ATUALIZA CONTADOR DE ACESSO E DATA DE ACESSO
            REM ** **********************************************************************

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("spGetUserNameEmp", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idUser", SqlDbType.Int, 4)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@idUser").Value = idUserRes

            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader

            If dr.HasRows() Then

                dr.Read()

                If Not dr("nomeRes") Is DBNull.Value Then
                    Session("nome") = dr("nomeRes")
                Else
                    Session("nome") = "Anônimo"
                End If

                If Not dr("nmempresa") Is DBNull.Value Then
                    Session("nmempresa") = dr("nmempresa")
                Else
                    Session("nmempresa") = "Cadastre sua empresa ..."
                End If

                If Not dr("idTypeUser") Is DBNull.Value Then
                    Session("idTypeUser") = dr("idTypeUser")
                Else
                    Session("idTypeUser") = ""
                End If


            End If


            dr.Close()
            cn.Close()

        Else

            Session.Abandon()
            FormsAuthentication.SignOut()
            Response.Redirect("/_candidato/")

        End If

    End Sub

End Class
