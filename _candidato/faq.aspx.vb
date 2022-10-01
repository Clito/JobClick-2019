Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter

Partial Class faq
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Session("layout") = "FAQ"

        If Request.QueryString("idFAQ") <> "" Then

            GridView2.Visible = True

            If Not (IsPostBack) Then
                Repeater2.Visible = True
            Else
                Repeater2.Visible = False
            End If

            assuntoLabel.Text = Request.QueryString("idFAQ")
            If Request.QueryString("AtivaForm") <> "" Then
                FormView1.DefaultMode = FormViewMode.Insert
            End If
        Else
            GridView2.Visible = False
            FormView1.Visible = False
            Repeater2.Visible = False
        End If

    End Sub

    Sub ContadorVisita(ByVal idFAQ)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spcontaFAQ", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idFAQ", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idFAQ").Value = idFAQ.ToString

        Try

            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            dr.Close()

            rs = True

        Catch ex As Exception

            rs = False

        End Try

        cn.Close()

    End Sub


    Sub OnChangeDB(ByVal source As Object, ByVal e As SqlDataSourceStatusEventArgs) Handles SqlDataSource3.Inserted

        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Sua dúvida foi enviada com sucesso.<br>"
        AVISOLABEL.CssClass = "msnOK"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"

        lblmsg.Visible = True
        mytmsn.Visible = True
        FormView1.Visible = False
        lblmsg.Text = "Sua dúvida foi enviada ao administrador do site.<br>Em breve entraremos em contato via e-mail."
        GravaIP()

    End Sub


    Sub GravaIP()

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spUpdateFAQ", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@ip", SqlDbType.VarChar, 18)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@ticket", SqlDbType.VarChar, 25)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@ip").Value = Session("ip")
        cmd.Parameters("@ticket").Value = Session("ticket")

        Try

            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            dr.Close()

            rs = True

        Catch ex As Exception

            rs = False

        End Try

        cn.Close()

    End Sub

    Protected Sub GridView2_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.DataBound
        ContadorVisita(Request.QueryString("idFAQ"))
    End Sub

 
    Protected Sub SqlDataSource3_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource3.Inserting
        e.Command.Parameters("@idFAQ").Value = CType(FormView1.FindControl("DropDownList1"), DropDownList).SelectedValue
    End Sub

End Class
