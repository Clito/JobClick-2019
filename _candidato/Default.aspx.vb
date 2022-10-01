Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Web.Security
Imports System.Web.HttpCookie

Partial Class _candidato_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("candidatoPaga") = 1 Then
            LinkButtonHistorico.Visible = True
        Else
            LinkButtonHistorico.Visible = False
        End If

        TokenLabel.Text = Application("token")
        emailLabel.Text = Application("emailAdmin")

        If Session("idCadastroUser") = 0 Then
            Response.Redirect("/_candidato/cadastro.aspx")
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

                'If Not dr("nome") Is DBNull.Value Then
                '    Session("nome") = dr("nome")
                'Else
                '    Session("nome") = "Anônimo"
                'End If

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

    End Sub

    Protected Sub SqlDataSource1_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlFormCV.Inserted
        If e.AffectedRows > 0 Then
            Response.Redirect("cv.aspx")
        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spUpdPublica", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idcurriculo", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idcurriculo").Value = GridView1.SelectedValue

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        Response.Redirect("/_candidato")

    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        Dim img As ImageButton

        If e.Row.RowType = DataControlRowType.DataRow Then

            If e.Row.RowState = DataControlRowState.Normal Or e.Row.RowState = DataControlRowState.Alternate Then

                Dim publicaRes As String = e.Row.Cells(6).Text

                If publicaRes Then
                    e.Row.Cells(6).Visible = False
                    img = e.Row.FindControl("ImageButton1")
                    img.ImageUrl = "~/images/ckPublica_on.gif"
                Else
                    e.Row.Cells(6).Visible = False
                    img = e.Row.FindControl("ImageButton1")
                    img.ImageUrl = "~/images/ckPublica_off.gif"
                End If

            End If

        End If

    End Sub

    Protected Sub Status_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles Status.ItemDataBound
        If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then

            If CType(e.Item.FindControl("DADOSPESSOAISLabel"), Label).Text = 1 Then
                CType(e.Item.FindControl("DADOSPESSOAISLabel"), Label).Text = "Preenchido"
                CType(e.Item.FindControl("PanelDADOSPESSOAIS"), Panel).CssClass = "STATUSOK"
            Else
                CType(e.Item.FindControl("DADOSPESSOAISLabel"), Label).Text = "Não Informado"
                CType(e.Item.FindControl("PanelDADOSPESSOAIS"), Panel).CssClass = "STATUSNOK"
            End If

            If CType(e.Item.FindControl("SUMARIOLabel"), Label).Text = 1 Then
                CType(e.Item.FindControl("SUMARIOLabel"), Label).Text = "Preenchido"
                CType(e.Item.FindControl("PanelSUMARIO"), Panel).CssClass = "STATUSOK"
            Else
                CType(e.Item.FindControl("SUMARIOLabel"), Label).Text = "Não Informado"
                CType(e.Item.FindControl("PanelSUMARIO"), Panel).CssClass = "STATUSNOK"
            End If

            If CType(e.Item.FindControl("FORMACAOLabel"), Label).Text = 1 Then
                CType(e.Item.FindControl("FORMACAOLabel"), Label).Text = "Preenchido"
                CType(e.Item.FindControl("PanelFORMACAO"), Panel).CssClass = "STATUSOK"
            Else
                CType(e.Item.FindControl("FORMACAOLabel"), Label).Text = "Não Informado"
                CType(e.Item.FindControl("PanelFORMACAO"), Panel).CssClass = "STATUSNOK"
            End If

            If CType(e.Item.FindControl("CURSOLabel"), Label).Text = 1 Then
                CType(e.Item.FindControl("CURSOLabel"), Label).Text = "Preenchido"
                CType(e.Item.FindControl("PanelCURSO"), Panel).CssClass = "STATUSOK"
            Else
                CType(e.Item.FindControl("CURSOLabel"), Label).Text = "Não Informado"
                CType(e.Item.FindControl("PanelCURSO"), Panel).CssClass = "STATUSNOK"
            End If

            If CType(e.Item.FindControl("INFORMATICALabel"), Label).Text = 1 Then
                CType(e.Item.FindControl("INFORMATICALabel"), Label).Text = "Preenchido"
                CType(e.Item.FindControl("PanelINFORMATICA"), Panel).CssClass = "STATUSOK"
            Else
                CType(e.Item.FindControl("INFORMATICALabel"), Label).Text = "Não Informado"
                CType(e.Item.FindControl("PanelINFORMATICA"), Panel).CssClass = "STATUSNOK"
            End If

            If CType(e.Item.FindControl("EXPERIENCIALabel"), Label).Text = 1 Then
                CType(e.Item.FindControl("EXPERIENCIALabel"), Label).Text = "Preenchido"
                CType(e.Item.FindControl("PanelEXPERIENCIA"), Panel).CssClass = "STATUSOK"
            Else
                CType(e.Item.FindControl("EXPERIENCIALabel"), Label).Text = "Não Informado"
                CType(e.Item.FindControl("PanelEXPERIENCIA"), Panel).CssClass = "STATUSNOK"
            End If

            If CType(e.Item.FindControl("IDIOMALabel"), Label).Text = 1 Then
                CType(e.Item.FindControl("IDIOMALabel"), Label).Text = "Preenchido"
                CType(e.Item.FindControl("PanelIDIOMA"), Panel).CssClass = "STATUSOK"
            Else
                CType(e.Item.FindControl("IDIOMALabel"), Label).Text = "Não Informado"
                CType(e.Item.FindControl("PanelIDIOMA"), Panel).CssClass = "STATUSNOK"
            End If

            If CType(e.Item.FindControl("TELEFONELabel"), Label).Text = 1 Then
                CType(e.Item.FindControl("TELEFONELabel"), Label).Text = "Preenchido"
                CType(e.Item.FindControl("PanelTELEFONE"), Panel).CssClass = "STATUSOK"
            Else
                CType(e.Item.FindControl("TELEFONELabel"), Label).Text = "Não Informado"
                CType(e.Item.FindControl("PanelTELEFONE"), Panel).CssClass = "STATUSNOK"
            End If

            If CType(e.Item.FindControl("COMPETENCIALabel"), Label).Text = 1 Then
                CType(e.Item.FindControl("COMPETENCIALabel"), Label).Text = "Preenchido"
                CType(e.Item.FindControl("PanelCOMPETENCIA"), Panel).CssClass = "STATUSOK"
            Else
                CType(e.Item.FindControl("COMPETENCIALabel"), Label).Text = "Não Informado"
                CType(e.Item.FindControl("PanelCOMPETENCIA"), Panel).CssClass = "STATUSNOK"
            End If

            If CType(e.Item.FindControl("AVALIACAOLabel"), Label).Text = 1 Then
                CType(e.Item.FindControl("AVALIACAOLabel"), Label).Text = "Avaliação Solicitada"
                CType(e.Item.FindControl("PanelAVALIACAO"), Panel).CssClass = "STATUSOK"
            Else
                CType(e.Item.FindControl("AVALIACAOLabel"), Label).Text = "Não há avaliação"
                CType(e.Item.FindControl("PanelAVALIACAO"), Panel).CssClass = "STATUSNOK"
            End If

            If CType(e.Item.FindControl("ENTREVISTALabel"), Label).Text = 1 Then
                CType(e.Item.FindControl("ENTREVISTALabel"), Label).Text = "Entrevista Solicitada"
                CType(e.Item.FindControl("PanelENTREVISTA"), Panel).CssClass = "STATUSOK"
            Else
                CType(e.Item.FindControl("ENTREVISTALabel"), Label).Text = "Não há entrevistas"
                CType(e.Item.FindControl("PanelENTREVISTA"), Panel).CssClass = "STATUSNOK"
            End If

            If CType(e.Item.FindControl("VIRTUALLabel"), Label).Text = 1 Then
                CType(e.Item.FindControl("VIRTUALLabel"), Label).Text = "Entrevista Solicitada"
                CType(e.Item.FindControl("PanelVIRTUAL"), Panel).CssClass = "STATUSOK"
            Else
                CType(e.Item.FindControl("VIRTUALLabel"), Label).Text = "Não há entrevistas"
                CType(e.Item.FindControl("PanelVIRTUAL"), Panel).CssClass = "STATUSNOK"
            End If

        End If
    End Sub

    Protected Sub LinkButtonHistorico_Click(sender As Object, e As EventArgs) Handles LinkButtonHistorico.Click
        Response.Redirect("~/_candidato/_extrato.aspx")
    End Sub
End Class
