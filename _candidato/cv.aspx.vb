Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Web.Security
Imports System.Web.HttpCookie

Partial Class _candidato_cv
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("idcurriculoD") <> "" Then

            Dim dr As SqlDataReader = Nothing
            Dim sSQL As String
            Dim cSQL As String
            Dim Connection As SqlConnection

            Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            Dim command As SqlCommand

            sSQL = "DELETE FROM tbRelEmpresaCandidato WHERE (idcurriculo = " & Request.QueryString("idcurriculoD") & ")"
            cSQL = "DELETE FROM tbCurriculo WHERE (idcurriculo = " & Request.QueryString("idcurriculoD") & ")"

            Try

                Connection.Open()

                command = New SqlCommand(sSQL, Connection)
                dr = command.ExecuteScalar()
                lblVinculo.Text = "<br><b>Os vinculos foram excluidos!</b>"

                Connection.Close()

                Connection.Open()

                command = New SqlCommand(cSQL, Connection)
                dr = command.ExecuteScalar()
                lblVinculo.Text = lblVinculo.Text & "<br><b>O currículo foi excluido!</b><br>"

                Connection.Close()

            Catch ex As Exception

                lblVinculo.Text = "<br><b>Erro ao excluir o currículo!</b><br>"

            End Try

            Session("idcurriculo") = ""
            Session("dscurriculo") = ""

            Response.Redirect("/_candidato/cv.aspx")

        End If

        If Session("candidatoPaga") = 1 Then
            PanelCANDIDATOPAGA.Visible = False
        Else
            PanelCANDIDATOPAGA.Visible = True
        End If

        If Session("idcurriculo") = "" Then
            PanelCANDIDATOPAGA.Visible = False
        End If



        If Session("idUser") Then

            Dim idUserRes As Int32 = Session("idUser")

            REM ** **********************************************************************
            REM ** ATUALIZA CONTADOR DE ACESSO E DATA DE ACESSO
            REM ** **********************************************************************

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim rs As Boolean = False

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("spGetUserName", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idUser", SqlDbType.Int, 4)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@idUser").Value = idUserRes

            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader

            If dr.HasRows() Then

                dr.Read()

                If Not dr("nome") Is DBNull.Value Then
                    Session("nome") = dr("nome")
                Else
                    Session("nome") = "Anônimo"
                End If

                If Not dr("cadastroTipo") Is DBNull.Value Then
                    Session("cadastroTipo") = dr("cadastroTipo")
                Else
                    Session("cadastroTipo") = "Anônimo"
                End If

            End If


            dr.Close()
            cn.Close()

        Else

            Session.Abandon()
            FormsAuthentication.SignOut()
            Response.Redirect("/_candidato/cv.aspx")

        End If

        LabelCurriculoAtivo.Text = "<b>Curriculo Ativo:</b> " & Replace(Session("dscurriculo"), "<b>Curriculo:</b>", "")

    End Sub

    Protected Sub CargaIdCurriculo(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.DataBinding

        If Request.QueryString("idcurriculoS") <> "" Then

            Session("idcurriculo") = Request.QueryString("idcurriculoS")

            Dim dr As SqlDataReader = Nothing
            Dim sSQL As String
            Dim Connection As SqlConnection
            Dim resposta As String = ""

            Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            Dim command As SqlCommand

            sSQL = "SELECT dscurriculo FROM tbCurriculo WHERE (idcurriculo = " + Session("idcurriculo") + ")"

            Try

                Connection.Open()

                command = New SqlCommand(sSQL, Connection)
                dr = command.ExecuteReader()

                If dr.HasRows() Then
                    dr.Read()
                    resposta = dr("dscurriculo").ToString
                Else
                    resposta = ""
                End If

            Finally

                dr.Close()
                Connection.Close()

            End Try

            Session("dscurriculo") = "<b>Curriculo:</b> " + resposta

            Response.Redirect("/_candidato/cv.aspx?idcurriculoV=" & Request.QueryString("idcurriculoS"))

        End If


    End Sub


    Protected Sub IncluidoCur(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Inserted

        If e.AffectedRows > 0 Then
            GridView1.Visible = True
            Response.Redirect("/_candidato/cv.aspx")
        End If

    End Sub

    Protected Sub ExcluidoCur(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Deleted

        If e.AffectedRows > 0 Then
            GridView1.Visible = True

            Session("idcurriculo") = ""
            Session("dscurriculo") = ""

            Response.Redirect("/_candidato/cv.aspx")

        End If

    End Sub

    Protected Sub PsqRelacionamento(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Deleting

        Dim dr As SqlDataReader = Nothing
        Dim sSQL As String
        Dim Connection As SqlConnection
        Dim resposta As String = ""
        Dim idcurriculoDel As String = e.Command.Parameters("@idcurriculo").Value

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT idRelEmpresaCandidato, idCadastroEmpresa, idcurriculo, nmempresa FROM vwrelempresacandidato WHERE (idcurriculo = " & idcurriculoDel & ")"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then
                Do While dr.Read()
                    resposta = resposta & "• " & dr("nmempresa").ToString & "<br>"
                Loop
            Else
                resposta = ""
            End If

        Finally

            If resposta <> "" Then
                lblVinculo.Text = "<br><b>ATENÇÃO:</b><br><b>O currículo que você está para excluir está vinculado:</b><br>" + resposta + "<br>[<a href='/_candidato/cv.aspx?idcurriculoD=" & idcurriculoDel & "'>Quer realmente excluir este currículo?</a>]<br><br>"
                e.Cancel = True
            End If

            dr.Close()
            Connection.Close()

        End Try

    End Sub

    Protected Sub CriaVinculo(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click

        Dim dr As SqlDataReader = Nothing
        Dim Connection As SqlConnection

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        Dim oSQL As String = "INSERT INTO tbRelEmpresaCandidato(idCadastroEmpresa, idcurriculo) VALUES (" & Session("idCadastroEmpresa_layout") & ", " & Session("idcurriculo") & ")"

        Try

            Connection.Open()
            command = New SqlCommand(oSQL, Connection)
            dr = command.ExecuteReader()

        Finally

            dr.Close()
            Connection.Close()

        End Try

        Response.Redirect("/_candidato/cv.aspx")

    End Sub


    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

            If e.Row.RowState = DataControlRowState.Normal Or e.Row.RowState = DataControlRowState.Alternate Then
                Dim idCadastroEmpresaRes As String = e.Row.Cells(1).Text

                If idCadastroEmpresaRes = Session("idCadastroEmpresa_layout") Then
                    LabelV.Visible = False
                    LinkButton1.Visible = False
                    e.Row.Cells(3).ForeColor = Drawing.Color.Red
                End If

                e.Row.Cells(1).Text = "•"

            End If

        End If

    End Sub

    Protected Sub SqlFormCV_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlFormCV.Updated
        GridView1.DataBind()
    End Sub

    Protected Sub FormView2_DataBound(sender As Object, e As System.EventArgs) Handles FormView2.DataBound
        Try
            CType(FormView2.FindControl("LinkButtonEdit"), LinkButton).Text = "Clique aqui para [Disponibilizar para Recrutadores] ou [Alterar o título] de seu Currículo " & Replace(Session("dscurriculo"), "<b>Curriculo:</b> ", "")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub FormView2_ItemUpdated(sender As Object, e As FormViewUpdatedEventArgs) Handles FormView2.ItemUpdated
        Response.Redirect("/_candidato/cv.aspx?idcurriculoS=" & Session("idCurriculo"))
    End Sub

End Class
