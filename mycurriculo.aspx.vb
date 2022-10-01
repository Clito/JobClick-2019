Imports System.Web.UI.WebControls.Label
Imports System.Web.UI.WebControls.DataList
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports criptografia

Partial Class _candidato_mycurriculo
    Inherits System.Web.UI.Page

    Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim idPublica As String = ""

        Try
            If Request.QueryString("idRes") <> "" Then
                idcurriculoLabel.Text = criptografia.Descriptografar(Request.QueryString("id"), "#!$a36?@")
                idUserLabel.Text = criptografia.Descriptografar(Request.QueryString("idUser"), "#!$a36?@")
                idPublica = criptografia.Descriptografar(Request.QueryString("idRes"), "#!$a36?@")
            Else
                idcurriculoLabel.Text = criptografia.Descriptografar(Request.QueryString("id"), "#!$a36?@")
                idUserLabel.Text = criptografia.Descriptografar(Request.QueryString("idUser"), "#!$a36?@")
                idPublica = ""
            End If

        Catch ex As Exception
            idLabel.Text = Request.QueryString("id") REM ** @idpublica --> tbpublicaCurriculo
            idUserLabel.Text = Request.QueryString("idUser")
            idPublica = Request.QueryString("idRes")
        End Try


        If idcurriculoLabel.Text <> "" Then

            REM ** *****************************************************************************
            REM ** ATUALIZA STATUS DE LEITURA
            REM ** *****************************************************************************

            If idPublica <> "" Then

                Dim cn As SqlConnection
                Dim cmd As SqlCommand
                Dim prm As SqlParameter

                cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

                cmd = New SqlCommand("spUpdEmail", cn)
                cmd.CommandType = CommandType.StoredProcedure

                prm = New SqlParameter("@idpublica", SqlDbType.Int, 4)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)

                cmd.Parameters("@idpublica").Value = idPublica

                cn.Open()

                Try

                    Dim dr As SqlDataReader = cmd.ExecuteReader()
                    dr.Close()

                Catch ex As Exception

                End Try


                cn.Close()

            End If

        End If
    End Sub


    
End Class
