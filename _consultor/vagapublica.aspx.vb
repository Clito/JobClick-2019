Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports checkdigit
Imports System.DBNull

Partial Class _empresa_vagapublica
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub SqlForm_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlForm.Inserting

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection

        Dim myCheckDigit As New checkdigit
        Dim idVagaPublica As String = ""
        Dim nrVaga As String = ""
        Dim nrVagaFinal As String = ""

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT MAX(idVagaPublica) as CNT FROM tbVagaPublica"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        REM ** ***************************************************************
        REM ** CONFIGURAÇÃO DO SISTEMA DE ENVIO DE E-MAIL - DB
        REM ** ***************************************************************

        Try

            If oReader.HasRows() Then
                oReader.Read()
                idVagaPublica = oReader("CNT") + 1
            Else
                idVagaPublica = "1"
            End If

        Catch ex As Exception

            idVagaPublica = "1"

        End Try

        nrVaga = idVagaPublica.ToString.PadLeft(8, "0")
        nrVagaFinal = nrVaga & "-" & myCheckDigit.CALCDIG10(nrVaga).ToString

        oConnection.Close()


        Dim CodVagaRES As String = ""
        Dim CodVagaRESUp As String = ""


        CodVagaRES = Left(CType(FormView1.FindControl("titVagaPublicaTextBox"), TextBox).Text, 3)
        CodVagaRESUp = UCase(CodVagaRES)

        e.Command.Parameters("@dsVagaPublica").Value = Replace(CType(FormView1.FindControl("dsVagaPublicaTextBox"), TextBox).Text, Chr(10), "<br>")

        e.Command.Parameters("@codigo").Value = nrVagaFinal
        'CType(FormView1.FindControl("codigoTextBox"), TextBox).Text  REM CodVagaRESUp & nrVagaFinal.ToString
        e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa").ToString
        e.Command.Parameters("@data").Value = Now()


    End Sub

    Protected Sub SqlForm_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlForm.Updated
        GridView1.DataBind()
    End Sub

    Protected Sub SqlForm_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlForm.Deleted
        GridView1.DataBind()
    End Sub

    Protected Sub SqlForm_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlForm.Inserted
        GridView1.DataBind()
    End Sub

    Protected Sub SqlForm_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlForm.Updating
        e.Command.Parameters("@dsVagaPublica").Value = Replace(CType(FormView1.FindControl("dsVagaPublicaTextBox"), TextBox).Text, Chr(10), "<br>")
    End Sub

    Protected Sub dsVagaPublicaTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("dsVagaPublicaTextBox"), TextBox).Text = Replace(CType(FormView1.FindControl("dsVagaPublicaTextBox"), TextBox).Text, "<br>", "")
    End Sub

End Class
