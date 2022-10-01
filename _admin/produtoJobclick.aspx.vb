Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Text.Encoding
Imports System.DBNull

Partial Class _admin_produtoJobclick
    Inherits System.Web.UI.Page

    Protected Sub GridViewProduto_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewProduto.SelectedIndexChanged
        idProdutoLabel.Text = GridViewProduto.SelectedValue
    End Sub

    Protected Sub GridViewEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewEmpresa.SelectedIndexChanged

        idSetupLabel.Text = GridViewEmpresa.SelectedDataKey("idsetup")
        idCadastroEmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("idCadastroEmpresa")
        EmpresaLabel.Text = GridViewEmpresa.SelectedDataKey("empresa")
        GridViewEmpresa.Visible = False
        LinkButtonCARGA.Visible = True

    End Sub

    Protected Sub LinkButtonReset_Click(sender As Object, e As System.EventArgs)
        idSetupLabel.Text = ""
        idCadastroEmpresaLabel.Text = ""
        EmpresaLabel.Text = ""
        GridViewEmpresa.Visible = True
    End Sub

    Protected Sub LinkButtonReset_Click1(sender As Object, e As System.EventArgs)
        idSetupLabel.Text = ""
        idCadastroEmpresaLabel.Text = ""
        EmpresaLabel.Text = ""
        GridViewEmpresa.Visible = True
    End Sub

    Protected Sub LinkButtonCARGA_Click(sender As Object, e As EventArgs) Handles LinkButtonCARGA.Click

        If idSetupLabel.Text <> "" Then

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("_USP_CARGA_PRODUTO", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idSetup", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idSetup").Value = idSetupLabel.Text

            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Close()
            cn.Close()

            GridViewProduto.DataBind()
            LinkButtonCARGA.Visible = False

        Else
            MSN.Text = "Selecione uma empresa!"
        End If

    End Sub

    Protected Sub SqlDataSourcePRODUTOFORM_Inserting(sender As Object, e As SqlDataSourceCommandEventArgs) Handles SqlDataSourcePRODUTOFORM.Inserting
        Select Case CType(FormViewPRODUTO.FindControl("RadioButtonListTipoProduto"), RadioButtonList).SelectedValue

            Case "Candidato"
                e.Command.Parameters("@candidato").Value = 1
                e.Command.Parameters("@sms").Value = 0
                e.Command.Parameters("@credito").Value = 0
            Case "SMS"
                e.Command.Parameters("@candidato").Value = 0
                e.Command.Parameters("@sms").Value = 1
                e.Command.Parameters("@credito").Value = 0
            Case "Credito"
                e.Command.Parameters("@candidato").Value = 0
                e.Command.Parameters("@sms").Value = 0
                e.Command.Parameters("@credito").Value = 1
        End Select
    End Sub

    Protected Sub SqlDataSourcePRODUTOFORM_Updating(sender As Object, e As SqlDataSourceCommandEventArgs) Handles SqlDataSourcePRODUTOFORM.Updating
        Select Case CType(FormViewPRODUTO.FindControl("RadioButtonListTipoProduto"), RadioButtonList).SelectedValue

            Case "Candidato"
                e.Command.Parameters("@candidato").Value = 1
                e.Command.Parameters("@sms").Value = 0
                e.Command.Parameters("@credito").Value = 0
            Case "SMS"
                e.Command.Parameters("@candidato").Value = 0
                e.Command.Parameters("@sms").Value = 1
                e.Command.Parameters("@credito").Value = 0
            Case "Credito"
                e.Command.Parameters("@candidato").Value = 0
                e.Command.Parameters("@sms").Value = 0
                e.Command.Parameters("@credito").Value = 1
        End Select
    End Sub

    Protected Sub FormViewPRODUTO_DataBound(sender As Object, e As EventArgs) Handles FormViewPRODUTO.DataBound
        Try
            Dim myDropDownList As DropDownList
            Dim myRadioButton As RadioButtonList

            myDropDownList = CType(FormViewPRODUTO.FindControl("DropDownListTIPO"), DropDownList)
            myRadioButton = CType(FormViewPRODUTO.FindControl("RadioButtonListTipoProduto"), RadioButtonList)

            Select Case myDropDownList.SelectedValue
                Case 1
                    myRadioButton.SelectedValue = "Candidato"
                Case 2
                    myRadioButton.SelectedValue = "SMS"
                Case 3
                    myRadioButton.SelectedValue = "Credito"
            End Select

        Catch ex As Exception

        End Try
    End Sub
End Class
