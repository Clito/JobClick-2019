Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter

Partial Class _candidato_depoimentoZoya
    Inherits System.Web.UI.Page

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spUpdDepoimento", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idDepoimentosZoya", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idDepoimentosZoya").Value = GridView1.SelectedValue

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        Response.Redirect("depoimentoZoya.aspx")

    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        Dim img As ImageButton

        If e.Row.RowType = DataControlRowType.DataRow Then

            If e.Row.RowState = DataControlRowState.Normal Or e.Row.RowState = DataControlRowState.Alternate Then

                Dim publicaRes As String = e.Row.Cells(9).Text

                If publicaRes Then
                    e.Row.Cells(9).Visible = False
                    img = e.Row.FindControl("ImageButton1")
                    img.ImageUrl = "~/images/ckPublica_on.gif"
                Else
                    e.Row.Cells(9).Visible = False
                    img = e.Row.FindControl("ImageButton1")
                    img.ImageUrl = "~/images/ckPublica_off.gif"
                End If

            End If

        End If

    End Sub

End Class
