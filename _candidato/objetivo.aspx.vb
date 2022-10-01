
Partial Class _candidato_objetivo
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        PanelAviso.Visible = False
    End Sub


    Protected Sub FormView1_DataBound(sender As Object, e As System.EventArgs) Handles FormView1.DataBound
        Dim htmlText As String = ""
        htmlText = htmlText & "<i>Já li em um jornal uma consultora de RH falando que se vc não citar o objetivo no CV você pode aumentar as suas chances. No meu caso quero trabalhar com MKT. Neste caso preciso colocar o objetivo ou não?</i><br><br>" & Chr(10)
        htmlText = htmlText & "Não colocar o <b>OBJETIVO</b> pode aumentar muito as chances de não conseguir um emprego ou estágio, a conseqüência dessa estratégia ainda pode ser indesejada, ou seja, você poderá ser direcionado(a) para vagas que não deseja.<br><br>" & Chr(10)
        htmlText = htmlText & "A maioria dos selecionadores orienta aos candidatos que insiram em seus currículos o campo ""OBJETIVO"" ou ""OBJETIVO PROFISSIONAL"".<br><br>" & Chr(10)
        htmlText = htmlText & "Imaginemos que um selecionador está analisando candidatos para 5 áreas diferentes, e ele têm 30 currículos para ler até o final do dia, e ele não terá tempo para ligar para aqueles candidatos que não escreveram em que área desejam trabalhar.<br><br>" & Chr(10)
        htmlText = htmlText & "Nesta circunstância o candidato que não colocou o OBJETIVO sairá prejudicado, pois, mesmo tendo um bom currículo, o selecionador optou pelos currículos que continham o OBJETIVO.<br><br>" & Chr(10)
        htmlText = htmlText & "É também por isso que nos cadastramentos via internet não tem como nós nos inscrevermos sem expressarmos pelo menos o desejo por uma área. Geralmente o candidato de início de carreira, como ainda não tem muita experiência, insere em seu OBJETIVO coisas como ""Oportunidade em Administração de Empresas"" ou ""Estágio em Publicidade"", que é uma forma generalista e compreensível de expressar que deseja obter experiência dentro da sua formação.<br><br>" & Chr(10)
        htmlText = htmlText & "O candidato deve inserir no campo OBJETIVO a área em que deseja trabalhar e, se possível, também o cargo. Caso o candidato queira colocar mais de uma área no OBJETIVO sugiro que coloque em ordem de preferência.<br><br>" & Chr(10)
        htmlText = htmlText & "Por exemplo: se você está aberto a ocupar posições que podem ser tanto de finanças como de recursos humanos, mas você prefere finanças, então coloque no OBJETIVO: VAGA ou ESTÁGIO em FINANÇAS / RECURSOS HUMANOS<br><br>. " & Chr(10)
        htmlText = htmlText & "Colocar mais do que três áres não é recomendável.<br><br>" & Chr(10)
        htmlText = htmlText & "Boa Sorte!!!" & Chr(10)

        Try
            CType(FormView1.FindControl("LabelConteudo"), Label).Text = htmlText
        Catch ex As Exception

        End Try
    End Sub


    Protected Sub VaPara(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("/_candidato")
    End Sub

    Protected Sub UpdObjetivo(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Updated
        If (e.AffectedRows > 0) Then
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Seus dados foram atualizados com sucesso!<br>"
            AVISOLABEL.CssClass = "msnOK"
        End If
    End Sub

    Protected Sub IncObjetivo(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Inserted
        If (e.AffectedRows > 0) Then
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Seus dados foram atualizados com sucesso!<br>"
            AVISOLABEL.CssClass = "msnOK"
        End If
    End Sub

    Protected Sub SqlDataSource1_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Inserting
        e.Command.Parameters("@apresentacao").Value = Replace(CType(FormView1.FindControl("apresentacaoTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@realizacao").Value = Replace(CType(FormView1.FindControl("realizacaoTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@resumogeral").Value = Replace(CType(FormView1.FindControl("resumogeralTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@objetivo").Value = Replace(CType(FormView1.FindControl("objetivoTextBox"), TextBox).Text, Chr(10), "<br>")
    End Sub

    Protected Sub SqlDataSource1_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Updating
        e.Command.Parameters("@apresentacao").Value = Replace(CType(FormView1.FindControl("apresentacaoTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@realizacao").Value = Replace(CType(FormView1.FindControl("realizacaoTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@resumogeral").Value = Replace(CType(FormView1.FindControl("resumogeralTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@objetivo").Value = Replace(CType(FormView1.FindControl("objetivoTextBox"), TextBox).Text, Chr(10), "<br>")
    End Sub

    Protected Sub apresentacaoTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("apresentacaoTextBox"), TextBox).Text = Replace(CType(FormView1.FindControl("apresentacaoTextBox"), TextBox).Text, "<br>", "")
    End Sub

    Protected Sub realizacaoTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("realizacaoTextBox"), TextBox).Text = Replace(CType(FormView1.FindControl("realizacaoTextBox"), TextBox).Text, "<br>", "")
    End Sub

    Protected Sub resumogeralTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("resumogeralTextBox"), TextBox).Text = Replace(CType(FormView1.FindControl("resumogeralTextBox"), TextBox).Text, "<br>", "")
    End Sub

    Protected Sub objetivoTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("objetivoTextBox"), TextBox).Text = Replace(CType(FormView1.FindControl("objetivoTextBox"), TextBox).Text, "<br>", "")
    End Sub

    Protected Sub ImageButtonNew_Load(sender As Object, e As System.EventArgs)
        FormView1.ChangeMode(FormViewMode.Insert)
    End Sub

    Protected Sub InsertCancelButton_Click(sender As Object, e As System.EventArgs)
        Response.Redirect("/_candidato")
    End Sub

    Protected Sub LinkButtonAP1_Click(sender As Object, e As System.EventArgs) Handles LinkButtonAP1.Click
        PanelAP.Visible = True
        ConteudoAP.Text = "Em busca de nova proposta de trabalho na área _________________, apresento-lhes meu currículo anexo.<br><br>Entre minhas características básicas encontram-se: adaptabilidade, bom humor, dinamismo, responsabilidades, perfeccionismo, auto-exigência, dedicação ao trabalho e bom relacionamento em geral.<br><br>Informo ainda que estou disponível para viagens, de acordo com a necessidade da organização.<br><br>No aguardo de contato de sua parte, coloco-me à disposição para prestar-lhes mais esclarecimentos.<br><br>Atenciosamente,"
    End Sub

    Protected Sub LinkButtonFECHAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonFECHAR.Click
        PanelAP.Visible = False
    End Sub

    Protected Sub LinkButtonAA_Click(sender As Object, e As System.EventArgs) Handles LinkButtonAA.Click
        PanelAP.Visible = True
        ConteudoAP.Text = "Tenho um perfil dinâmico, organizado e focado em resultados."
    End Sub

End Class
