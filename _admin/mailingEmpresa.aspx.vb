Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _admin_mailingEmpresa
    Inherits System.Web.UI.Page

    Protected Sub GridViewLISTAENVIO_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewLISTAENVIO.SelectedIndexChanged

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB_Mailing").ConnectionString)

        cmd = New SqlCommand("[USP_LISTA_MAIL_BASE_EMPRESA_UPDATE_SENDMAIL]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idUser", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idUser").Value = GridViewLISTAENVIO.SelectedDataKey("idUser")


        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        GridViewLISTAENVIO.DataBind()

    End Sub

    Protected Sub LinkButtonMARCAR_Click(sender As Object, e As EventArgs) Handles LinkButtonMARCAR.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        Dim sendmail As Int32 = 0

        If RadioButtonListMARCAR.SelectedValue = "0" Then
            sendmail = 0
        Else
            sendmail = 1
        End If

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB_Mailing").ConnectionString)

        cmd = New SqlCommand("[USP_LISTA_MAIL_BASE_EMPRESA_UPDATE_SENDMAIL_TODOS]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idTypeUser", SqlDbType.VarChar, 50)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idTypeUser").Value = DropDownListACESSO.SelectedItem.Text

        prm = New SqlParameter("@sendMail", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@sendMail").Value = sendmail

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        GridViewLISTAENVIO.DataBind()

    End Sub

    Protected Sub LinkButtonENVIAR_Click(sender As Object, e As EventArgs) Handles LinkButtonENVIAR.Click

        REM ** ********************************************************************************
        REM ** DISPARA E-MAILS PARA AS EMPRESAS SELECIONADAS
        REM ** ********************************************************************************
        '_USP_AD_ENVIA_EMAIL_PARA_BASE_EMPRESAS

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_AD_ENVIA_EMAIL_PARA_BASE_EMPRESAS]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idCampanha", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCampanha").Value = DropDownListCAMPANHA.SelectedValue

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows Then
            dr.Read()
            TotalEmailsEnviadosLabel.Text = "Total de e-mails enviados: " & dr("TOTALENVIADO")
        End If

        dr.Close()
        cn.Close()

        GridViewLISTAENVIO.DataBind()

    End Sub

    Protected Sub GridViewLISTAENVIO_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridViewLISTAENVIO.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim flgidsetup As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "idsetup"))
            Dim flgidCadastroUser As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "idCadastroUser"))
            Dim flgidUser As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "idUser"))

            Dim myLinkButtonVAGA As New LinkButton
            myLinkButtonVAGA = e.Row.FindControl("LinkButtonVAGA")

            Select Case flgidsetup
                Case "0"
                    e.Row.BackColor = System.Drawing.Color.FromName("#75cae3")  'Não enviar.
            End Select

            Select Case flgidCadastroUser
                Case "0"
                    e.Row.BackColor = System.Drawing.Color.FromName("#75cae3")  'Não enviar.
            End Select

            Select Case flgidUser
                Case "0"
                    e.Row.BackColor = System.Drawing.Color.FromName("#75cae3")  'Não enviar.
            End Select
        End If

    End Sub
End Class
