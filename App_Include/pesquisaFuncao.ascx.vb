Imports System.Data
Imports System.Data.SqlClient
Imports System.DBNull

Partial Class App_Include_pesquisaFuncao
    Inherits System.Web.UI.UserControl

    Public Property funcao() As String

        Get
            Return DropDownList1.SelectedValue
        End Get

        Set(ByVal value As String)

            If value <> "" Then

                Dim myconnection As SqlConnection
                Dim myda As SqlDataAdapter
                Dim ds As New DataSet

                myconnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
                myda = New SqlDataAdapter("SELECT idfuncao, dsfuncao FROM tbFuncao WHERE (idfuncao = " & value & ")", myconnection)
                ds = New DataSet
                myda.Fill(ds, "funcaoDDL")

                Try
                    DropDownList2.Visible = True
                    lblCabecFnc.Visible = True

                    DropDownList2.DataSource = ds
                    DropDownList2.DataSource = ds.Tables(0)
                    DropDownList2.DataTextField = ds.Tables(0).Columns("dsfuncao").ColumnName.ToString()
                    DropDownList2.DataValueField = ds.Tables(0).Columns("idfuncao").ColumnName.ToString()
                    DropDownList2.DataBind()

                Finally

                End Try

            End If

        End Set

    End Property

    Protected Sub DropDownList1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.DataBound, DropDownList1.SelectedIndexChanged
        resTxt.Text = DropDownList1.SelectedValue
    End Sub

    Protected Sub SqlDataSourcePsq_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSourcePsq.Selecting
        e.Command.Parameters("@buscador").Value = Replace(TextBox1.Text, " ", "%")
    End Sub
End Class
