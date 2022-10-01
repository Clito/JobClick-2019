
Partial Class _consultor_atribuicaoConsultores
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Request.QueryString("autoTit") <> "" Then
            LabelCabec.Text = Request.QueryString("autoTit")
        Else
            LabelCabec.Text = "Página Principal"
        End If
    End Sub

    Protected Sub GridViewAtr_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewAtr.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim flgAprovado As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "CORTEXTO"))
            Select Case flgAprovado
                Case "#e30000"
                    e.Row.BackColor = Drawing.Color.Yellow ' NÃO ESTÁ PUBLICADO.
                Case "#277b19"
                    e.Row.BackColor = Drawing.Color.YellowGreen ' PUBLICADO SEM OCORRENCIA
                Case "#f0c604"
                    e.Row.BackColor = Drawing.Color.Red  ' PRECISA CADASTRAR A VAGA.
                Case Else
                    e.Row.BackColor = Drawing.Color.White ' NORMAL

            End Select
        End If
    End Sub
End Class
