Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader

Partial Class App_Include_cep
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spCEP", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@CEP", SqlDbType.NVarChar, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@CEP").Value = CEPTextBox.Text.ToString

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

            logradouroTextBox.Text = dr("LOGRADOURO")
            enderecoTextBox.Text = dr("RUA") & ", "
            bairroTextBox.Text = dr("BAIRRO")
            cidadeTextBox.Text = dr("CIDADE")
            UFTextBox.Text = dr("UF")


        Else

            enderecoTextBox.Text = "Não encontrei o endereço...."

        End If


        dr.Close()
        cn.Close()


    End Sub


    Public Property CEP() As String

        Get

            Return logradouroTextBox.Text
            Return enderecoTextBox.Text
            Return bairroTextBox.Text
            Return cidadeTextBox.Text
            Return UFTextBox.Text
            Return CEPTextBox.Text

        End Get

        Set(ByVal value As String)
            CEPTextBox.Text = value
        End Set

    End Property

End Class
