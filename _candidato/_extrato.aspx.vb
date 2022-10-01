Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.DBNull
Imports System.Xml
Partial Class _candidato_extrato
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        LabelCabec.Text = "Seu extrato"
        If Not IsPostBack Then
            ano.Text = Year(Now())
            mes.Text = Month(Now())
            DropDownListMES.SelectedValue = mes.Text
            DropDownListANO.SelectedValue = ano.Text
        End If
        xmlLabel.Text = ""
    End Sub
    Protected Sub DropDownListMES_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownListMES.SelectedIndexChanged
        mes.Text = DropDownListMES.SelectedValue
    End Sub

    Protected Sub DropDownListANO_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownListANO.SelectedIndexChanged
        ano.Text = DropDownListANO.SelectedValue
    End Sub

    Protected Sub Extrato_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles Extrato.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim flgAprovado As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "Status"))
            Select Case flgAprovado
                Case "Pagamento Aprovado"
                    e.Row.BackColor = Drawing.Color.YellowGreen ' Aprovado.
                Case "Pagamento Cancelado"
                    e.Row.BackColor = Drawing.Color.LightGray  ' Cancelado.
            End Select
        End If
    End Sub

    Protected Sub Extrato_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles Extrato.SelectedIndexChanged

        Dim URLXMLNot As String = "https://ws.pagseguro.uol.com.br/v2/transactions/" & Extrato.SelectedDataKey("TransacaoID") & "?email=" & Application("emailAdmin") & "&token=" & Application("token")
        Dim readerNot As New XmlTextReader(URLXMLNot)

        tokenLabel.Text = Application("token")
        TransacaoIDLabel.Text = Extrato.SelectedDataKey("TransacaoID")
        emailAdminLabel.Text = Application("emailAdmin")
        URLLabel.Text = URLXMLNot

        REM ** ************************************************************************************************
        REM ** MONTA A CHAMADA
        REM ** ************************************************************************************************


        xmlLabel.Text = Extrato.SelectedDataKey("codeNotificacao") & " - " & Extrato.SelectedDataKey("TransacaoID")

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        REM ** *********************************************************************************
        REM ** GRAVA PARA XML
        REM ** *********************************************************************************

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_ATUALIZA_PAGSEGURO_XML", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@code", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@code").Value = Extrato.SelectedDataKey("TransacaoID")

        prm = New SqlParameter("@xmlcode", SqlDbType.Xml)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@xmlcode").Value = readerNot

        prm = New SqlParameter("@codeNotificacao", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@codeNotificacao").Value = Extrato.SelectedDataKey("codeNotificacao")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        Extrato.DataBind()


    End Sub

    Protected Sub LinkButtonAssinatura_Click(sender As Object, e As EventArgs) Handles LinkButtonAssinatura.Click
        Response.Redirect("~/_candidato/_creditoCandidato.aspx")
    End Sub
End Class
