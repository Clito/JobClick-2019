Imports am
Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter

Partial Class _candidato_status
    Inherits System.Web.UI.Page

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        idcurriculoTextBox.Text = GridView1.SelectedValue.ToString

        Dim dr As SqlDataReader = Nothing
        Dim status As Boolean = False
        Dim sSQL As String
        Dim Connection As SqlConnection

        Connection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim command As SqlCommand

        sSQL = "SELECT idRELduvida_vaga, idvaga, idcurriculo, liberarRH FROM tbRELduvida_vaga WHERE (idcurriculo = " & idcurriculoTextBox.Text & ") AND (liberarRH = 1)"

        Try

            Connection.Open()

            command = New SqlCommand(sSQL, Connection)
            dr = command.ExecuteReader()

            If dr.HasRows() Then
                dr.Read()
                outlookPanel.Visible = True
                outlooktxt.PostBackUrl = "outlook.aspx?id=" & dr("idcurriculo")
                outlookbt.PostBackUrl = "outlook.aspx?id=" & dr("idcurriculo")
            Else
                outlookPanel.Visible = False
            End If

        Catch ex As SqlClient.SqlException

        Finally

            Connection.Close()

        End Try

    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("id") <> "" Then
            LiberaRH(Request.QueryString("id"))
        End If
    End Sub

    Protected Sub GetCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)

        Select Case e.CommandName
            Case "Cancel"
            Case "Select"
                TextBoxCommandName.Text = e.CommandName
        End Select

    End Sub

    Protected Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            CType(e.Item.FindControl("contador_emailLabel"), Label).Text = "Currículo visualizado [" & CType(e.Item.FindControl("contador_emailLabel"), Label).Text & "] vez(es) no sistema de e-mails. "
            CType(e.Item.FindControl("lblContadorRES"), Label).Text = "Currículo visualizado [" & CType(e.Item.FindControl("lblContadorRES"), Label).Text & "] vez(es) no sistema JobClick. "

            If CType(e.Item.FindControl("GerarProcessoLabel"), Label).Text Then
                CType(e.Item.FindControl("GerarProcessoLabel"), Label).Text = "Em processo seletivo"
            Else
                CType(e.Item.FindControl("GerarProcessoLabel"), Label).Text = "Aguardando processo..."
            End If

            REM ** ****************************************************************************
            REM ** VERIFICA A DATA DA PUBLICAÇÃO E DATA DE ENCERRAMENTO Libera as devidas MSN
            REM ** ****************************************************************************
            Dim data_iniRes As Date = CType(e.Item.FindControl("data_iniLabel"), Label).Text
            Dim data_fimRes As Date = CType(e.Item.FindControl("data_fimLabel"), Label).Text
            Dim data_atual As Date = Now()

            REM ** CÁLCULO
            Dim dataCal As Integer = DateDiff(DateInterval.Day, data_iniRes, data_fimRes)
            Dim dataAtual As Integer = DateDiff(DateInterval.Day, data_iniRes, data_atual)

            If dataCal < dataAtual Then
                CType(e.Item.FindControl("diffData"), Label).Text = "Vaga vencida..."
            End If

            If dataCal >= dataAtual Then
                CType(e.Item.FindControl("diffData"), Label).Text = "Vaga dentro do prazo..."
            End If
            REM ** FIM CÁLCULO

            If CType(e.Item.FindControl("publicarLabel"), Label).Text Then
                CType(e.Item.FindControl("lblComentarioSys"), Label).Text = "Vaga com o status [publicada]"
            Else
                CType(e.Item.FindControl("lblComentarioSys"), Label).Text = "Vaga não está mais publicada, pode ter sido finalizada..."
            End If

            If CType(e.Item.FindControl("lblliberaCandidato"), Label).Text Then
                CType(e.Item.FindControl("lblComentarioSys"), Label).Text = CType(e.Item.FindControl("lblComentarioSys"), Label).Text & "<br>• Empresa liberou seu CV."
                CType(e.Item.FindControl("LBLiberaRH"), LinkButton).Visible = True
                CType(e.Item.FindControl("LBLiberaRH"), LinkButton).PostBackUrl = "~/_candidato/status.aspx?id=" & CType(e.Item.FindControl("lblidRelCandidato_vaga"), Label).Text
            Else
                CType(e.Item.FindControl("lblComentarioSys"), Label).Text = CType(e.Item.FindControl("lblComentarioSys"), Label).Text & "<br>• Empresa aceitou seu CV para avaliação."
                CType(e.Item.FindControl("LBLiberaRH"), LinkButton).Visible = False
            End If

            Dim lblContadorRES As String = CType(e.Item.FindControl("lblContador"), Label).Text

            If lblContadorRES > "1" Then
                CType(e.Item.FindControl("lblComentarioSys"), Label).Text = CType(e.Item.FindControl("lblComentarioSys"), Label).Text & "<br>• Empresa avaliou seu CV [" & CType(e.Item.FindControl("lblContador"), Label).Text & "] vezes"
            Else
                If lblContadorRES = "0" And lblContadorRES <> "" Then
                    CType(e.Item.FindControl("lblComentarioSys"), Label).Text = CType(e.Item.FindControl("lblComentarioSys"), Label).Text & "<br>• Empresa não abriu seu CV para leitura."
                Else
                    CType(e.Item.FindControl("lblComentarioSys"), Label).Text = CType(e.Item.FindControl("lblComentarioSys"), Label).Text & "<br>• Empresa abriu seu CV [" & CType(e.Item.FindControl("lblContador"), Label).Text & "] vez(es)"
                End If
            End If

        End If

    End Sub


    Sub LiberaRH(ByVal idRelCandidato_vagalbl)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter

        Dim ContadorJOBCLICK As Int32 = 0

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spLiberaRel_CndRH", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idRELcandidato_vaga", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idRELcandidato_vaga").Value = idRelCandidato_vagalbl

        Try
            cn.Open()

            Dim dr As SqlDataReader = cmd.ExecuteReader
            dr.Close()

        Catch ex As Exception

        End Try

        cn.Close()

        DataList1.DataBind()

    End Sub

End Class
