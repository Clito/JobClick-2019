
Partial Class _candidato_objetivo
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        PanelAviso.Visible = False
    End Sub


    Protected Sub FormView1_DataBound(sender As Object, e As System.EventArgs) Handles FormView1.DataBound
        Dim htmlText As String = ""
        htmlText = htmlText & "<i>J� li em um jornal uma consultora de RH falando que se vc n�o citar o objetivo no CV voc� pode aumentar as suas chances. No meu caso quero trabalhar com MKT. Neste caso preciso colocar o objetivo ou n�o?</i><br><br>" & Chr(10)
        htmlText = htmlText & "N�o colocar o <b>OBJETIVO</b> pode aumentar muito as chances de n�o conseguir um emprego ou est�gio, a conseq��ncia dessa estrat�gia ainda pode ser indesejada, ou seja, voc� poder� ser direcionado(a) para vagas que n�o deseja.<br><br>" & Chr(10)
        htmlText = htmlText & "A maioria dos selecionadores orienta aos candidatos que insiram em seus curr�culos o campo ""OBJETIVO"" ou ""OBJETIVO PROFISSIONAL"".<br><br>" & Chr(10)
        htmlText = htmlText & "Imaginemos que um selecionador est� analisando candidatos para 5 �reas diferentes, e ele t�m 30 curr�culos para ler at� o final do dia, e ele n�o ter� tempo para ligar para aqueles candidatos que n�o escreveram em que �rea desejam trabalhar.<br><br>" & Chr(10)
        htmlText = htmlText & "Nesta circunst�ncia o candidato que n�o colocou o OBJETIVO sair� prejudicado, pois, mesmo tendo um bom curr�culo, o selecionador optou pelos curr�culos que continham o OBJETIVO.<br><br>" & Chr(10)
        htmlText = htmlText & "� tamb�m por isso que nos cadastramentos via internet n�o tem como n�s nos inscrevermos sem expressarmos pelo menos o desejo por uma �rea. Geralmente o candidato de in�cio de carreira, como ainda n�o tem muita experi�ncia, insere em seu OBJETIVO coisas como ""Oportunidade em Administra��o de Empresas"" ou ""Est�gio em Publicidade"", que � uma forma generalista e compreens�vel de expressar que deseja obter experi�ncia dentro da sua forma��o.<br><br>" & Chr(10)
        htmlText = htmlText & "O candidato deve inserir no campo OBJETIVO a �rea em que deseja trabalhar e, se poss�vel, tamb�m o cargo. Caso o candidato queira colocar mais de uma �rea no OBJETIVO sugiro que coloque em ordem de prefer�ncia.<br><br>" & Chr(10)
        htmlText = htmlText & "Por exemplo: se voc� est� aberto a ocupar posi��es que podem ser tanto de finan�as como de recursos humanos, mas voc� prefere finan�as, ent�o coloque no OBJETIVO: VAGA ou EST�GIO em FINAN�AS / RECURSOS HUMANOS<br><br>. " & Chr(10)
        htmlText = htmlText & "Colocar mais do que tr�s �res n�o � recomend�vel.<br><br>" & Chr(10)
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
            AVISOLABEL.Text = "� Seus dados foram atualizados com sucesso!<br>"
            AVISOLABEL.CssClass = "msnOK"
        End If
    End Sub

    Protected Sub IncObjetivo(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Inserted
        If (e.AffectedRows > 0) Then
            PanelAviso.Visible = True
            AVISOLABEL.Text = "� Seus dados foram atualizados com sucesso!<br>"
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
        ConteudoAP.Text = "Em busca de nova proposta de trabalho na �rea _________________, apresento-lhes meu curr�culo anexo.<br><br>Entre minhas caracter�sticas b�sicas encontram-se: adaptabilidade, bom humor, dinamismo, responsabilidades, perfeccionismo, auto-exig�ncia, dedica��o ao trabalho e bom relacionamento em geral.<br><br>Informo ainda que estou dispon�vel para viagens, de acordo com a necessidade da organiza��o.<br><br>No aguardo de contato de sua parte, coloco-me � disposi��o para prestar-lhes mais esclarecimentos.<br><br>Atenciosamente,"
    End Sub

    Protected Sub LinkButtonFECHAR_Click(sender As Object, e As System.EventArgs) Handles LinkButtonFECHAR.Click
        PanelAP.Visible = False
    End Sub

    Protected Sub LinkButtonAA_Click(sender As Object, e As System.EventArgs) Handles LinkButtonAA.Click
        PanelAP.Visible = True
        ConteudoAP.Text = "Tenho um perfil din�mico, organizado e focado em resultados."
    End Sub

End Class
