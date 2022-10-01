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
        If Request.QueryString("idRes") <> "" Then
            MODELO_ANTIGO()
        Else
            MODELO_NOVO()
        End If
    End Sub

    Sub MODELO_ANTIGO()

        Dim idPublica As String = ""
        idCurriculo_CRIPTOGRAFADOLabel.Text = " "

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
                    If dr.HasRows Then
                        dr.Read()
                    End If
                    dr.Close()

                Catch ex As Exception

                End Try

                cn.Close()

            End If

        End If
    End Sub

    Sub MODELO_NOVO()
        REM ** *************************************************************************************
        REM ** NOVA VISUALIZAÇÃO DE CV
        REM ** *************************************************************************************

        Dim ProtocoloVaga As String = ""
        idcurriculoLabel.Text = 0

        Try
            If Request.QueryString("P") <> "" Then
                idCurriculo_CRIPTOGRAFADOLabel.Text = Request.QueryString("C")
                idUserLabel.Text = Request.QueryString("U")
                ProtocoloVaga = Request.QueryString("P")
            Else
                idCurriculo_CRIPTOGRAFADOLabel.Text = Request.QueryString("C")
                idUserLabel.Text = Request.QueryString("U")
                ProtocoloVaga = ""
            End If

        Catch ex As Exception

        End Try


        If idCurriculo_CRIPTOGRAFADOLabel.Text <> "" Then

            REM ** *****************************************************************************
            REM ** ATUALIZA STATUS DE LEITURA
            REM ** *****************************************************************************

            If ProtocoloVaga <> "" Then

                Dim cn As SqlConnection
                Dim cmd As SqlCommand
                Dim prm As SqlParameter

                cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

                cmd = New SqlCommand("_USP_PUBLICACURRICULO_LIDO", cn)
                cmd.CommandType = CommandType.StoredProcedure

                prm = New SqlParameter("@idCurriculo", SqlDbType.VarChar, 255)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)

                cmd.Parameters("@idCurriculo").Value = idCurriculo_CRIPTOGRAFADOLabel.Text

                prm = New SqlParameter("@codigo", SqlDbType.VarChar, 255)
                prm.Direction = ParameterDirection.Input
                cmd.Parameters.Add(prm)

                cmd.Parameters("@codigo").Value = ProtocoloVaga

                cn.Open()

                Try

                    Dim dr As SqlDataReader = cmd.ExecuteReader()
                    dr.Close()

                Catch ex As Exception

                End Try


                cn.Close()

            End If

        End If

        REM ** *************************************************************************************
        REM ** [FIM] - NOVA VISUALIZAÇÃO DE CV
        REM ** *************************************************************************************

    End Sub

End Class


