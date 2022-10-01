Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class formulario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            idUserLabel.Text = 2
            key_to_UPDATELabel.Text = "idUser"
            table_to_UPDATELabel.Text = "tbCadastroUser"
            column_to_UPDATELabel.Text = "nome"
        End If
    End Sub

    Protected Sub LinkButtonSalvarNome_Click(sender As Object, e As System.EventArgs) Handles LinkButtonSalvarNome.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_UPDATE_INTELIGENTE]", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@table_to_UPDATE", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@table_to_UPDATE").Value = table_to_UPDATELabel.Text

        prm = New SqlParameter("@column_to_UPDATE", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@column_to_UPDATE").Value = column_to_UPDATELabel.Text

        prm = New SqlParameter("@column_value_to_UPDATE", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@column_value_to_UPDATE").Value = nomeTextBox.Text

        prm = New SqlParameter("@key_to_UPDATE", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@key_to_UPDATE").Value = key_to_UPDATELabel.Text

        prm = New SqlParameter("@valuekey_to_UPDATE", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@valuekey_to_UPDATE").Value = idUserLabel.Text

        prm = New SqlParameter("@getSELECT", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@getSELECT").Value = 0

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        PanelNOME.Visible = False
        FormViewCadastro.DataBind()
    End Sub

    Protected Sub LinkButton_interesse01_Click(sender As Object, e As System.EventArgs)
        column_to_UPDATELabel.Text = CType(FormViewCadastro.FindControl("LinkButton_interesse01"), LinkButton).CommandArgument
        nomeTextBox.Text = CType(FormViewCadastro.FindControl("LinkButton_interesse01"), LinkButton).Text
        PanelNOME.Visible = True
    End Sub

    Protected Sub LinkButton_interesse02_Click(sender As Object, e As System.EventArgs)
        column_to_UPDATELabel.Text = CType(FormViewCadastro.FindControl("LinkButton_interesse02"), LinkButton).CommandArgument
        nomeTextBox.Text = CType(FormViewCadastro.FindControl("LinkButton_interesse02"), LinkButton).Text
        PanelNOME.Visible = True
    End Sub

    Protected Sub LinkButton_interesse03_Click(sender As Object, e As System.EventArgs)
        column_to_UPDATELabel.Text = CType(FormViewCadastro.FindControl("LinkButton_interesse03"), LinkButton).CommandArgument
        nomeTextBox.Text = CType(FormViewCadastro.FindControl("LinkButton_interesse03"), LinkButton).Text
        PanelNOME.Visible = True
    End Sub

    Protected Sub LinkButton_areaAtuacao_Click(sender As Object, e As System.EventArgs)
        column_to_UPDATELabel.Text = CType(FormViewCadastro.FindControl("LinkButton_areaAtuacao"), LinkButton).CommandArgument
        nomeTextBox.Text = CType(FormViewCadastro.FindControl("LinkButton_areaAtuacao"), LinkButton).Text
        PanelNOME.Visible = True
    End Sub
End Class
