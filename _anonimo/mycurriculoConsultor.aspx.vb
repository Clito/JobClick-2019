Imports System.Web.UI.WebControls.Label
Imports System.Web.UI.WebControls.DataList
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull


Partial Class _candidato_mycurriculo
    Inherits System.Web.UI.Page

    Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("id") <> "" Then

            REM ** *****************************************************************************
            REM ** RECUPERA TODAS AS VARIÁVEIS DA LINHA DE COMANDO
            idVagaLabel.Text = Request.QueryString("idVaga")
            idCurriculoFASELabel.Text = Request.QueryString("id")
            REM ** *****************************************************************************
            REM ** *****************************************************************************
            REM ** ATUALIZA STATUS DE LEITURA
            REM ** *****************************************************************************

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("spUpdEmail", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idpublica", SqlDbType.Int, 4)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@idpublica").Value = Request.QueryString("idRes").ToString

            cn.Open()

            Try

                Dim dr As SqlDataReader = cmd.ExecuteReader()
                dr.Close()

            Catch ex As Exception

            End Try


            cn.Close()

        Else

            Response.Redirect("/")

        End If

    End Sub


    Private Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then
            If DirectCast(e.Item.DataItem, DataRowView).Item("portadorDef") Then
                ImageDef.Visible = True
            End If
        End If

        REM ** *****************************************************************************
        REM ** FOTO DO CANDIDATO
        REM ** *****************************************************************************

        Dim myFoto As String = ""
        myFoto = DirectCast(e.Item.DataItem, DataRowView).Item("foto").ToString
        If myFoto <> "" Then
            ImageCandidato.ImageUrl = myFoto
        Else
            ImageCandidato.ImageUrl = "~/images/cvnoImage.png"
        End If

        Dim myNomeCadidato As String = ""
        myNomeCadidato = DirectCast(e.Item.DataItem, DataRowView).Item("nome").ToString
        If myNomeCadidato <> "" Then
            nomeCandidatoLabel.Text = myNomeCadidato
        Else
            nomeCandidatoLabel.Text = ""
        End If


        Dim myEmailCadidato As String = ""
        myEmailCadidato = DirectCast(e.Item.DataItem, DataRowView).Item("email").ToString
        If myEmailCadidato <> "" Then
            emailCandidatoLabel.Text = myEmailCadidato
        Else
            emailCandidatoLabel.Text = ""
        End If


    End Sub


    Private Sub DataList4_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList4.ItemDataBound


        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            idCurriculoLabel.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If idCurriculoLabel.Text.ToString <> "" Then
            DataList4.ShowHeader = True
        Else
            DataList4.ShowHeader = False
        End If

    End Sub


    Private Sub DataList5_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList5.ItemDataBound


        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label31.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo")

            Dim myLabel As Label = DirectCast(e.Item.FindControl("concluidoLabel"), Label)

            If myLabel.Text Then
                myLabel.Text = "Curso concluído"
            Else
                myLabel.Text = "Curso não concluído"
            End If

        End If

        If Label31.Text.ToString <> "" Then
            DataList5.ShowHeader = True
        Else
            DataList5.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList6_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList6.ItemDataBound


        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label41.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label41.Text.ToString <> "" Then
            DataList6.ShowHeader = True
        Else
            DataList6.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList7_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList7.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label42.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label42.Text.ToString <> "" Then
            DataList7.ShowHeader = True
        Else
            DataList7.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList8_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList8.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label43.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label43.Text.ToString <> "" Then
            DataList8.ShowHeader = True
        Else
            DataList8.ShowHeader = False
        End If

    End Sub

    Protected Sub DataList9_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList9.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label44.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label44.Text.ToString <> "" Then
            DataList9.ShowHeader = True
        Else
            DataList9.ShowHeader = False
        End If

    End Sub

    Protected Sub ButtonSalvar_Click(sender As Object, e As System.EventArgs) Handles ButtonSalvar.Click
        If idFaseTextBox.Text = "" Then
            MSN.Text = "Informe qual fase do processo seletivo."
        Else
            If liberarCandidato.SelectedValue = "0" Then
                MSN.Text = "CANDIDATURA REPROVADA!"
                msnConsultor.Text = "AVISO:<br>Caro Consultor esta candidatura foi REPROVADA e a mensagem enviada ao candidato."
                MSN.CssClass = "msn"
                LIBERACANDIDATO()
            Else
                MSN.Text = "CANDIDATURA APROVADA!"
                msnConsultor.Text = "AVISO:<br>Caro Consultor esta candidatura foi APROVADA e a mensagem enviada ao candidato."
                MSN.CssClass = "msnOK"
                APROVACANDIDATO()
            End If
        End If
        REM ** ENVIA EMAIL AO CANDIDATO ...
        REM ** ******************************************************************************************************
    End Sub

    Protected Sub GridViewFases_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewFases.SelectedIndexChanged
        idFaseLabel.Text = GridViewFases.SelectedDataKey("idFaseProcessoSeletivo").ToString
        idFaseTextBox.Text = "Será registrada a sua decisão na fase " & GridViewFases.SelectedDataKey("dsFase").ToString
        idRELcandidato_vagaLabel.Text = GridViewFases.SelectedDataKey("idRELcandidato_vaga").ToString
        VagaLabel.Text = GridViewFases.SelectedDataKey("dsfuncao").ToString
        protocoloLabel.Text = GridViewFases.SelectedDataKey("Protocolo").ToString
    End Sub

    Sub LIBERACANDIDATO()

        REM ** ******************************************************************************************************
        REM ** AÇÃO DO CONSULTOR QUANTO A CANDIDATURA (GRAVA HISTÓRICO DAS AÇÕES)
        REM ** ******************************************************************************************************

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_PROCESSOSELETIVO_LIBERA_CANDIDATO", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idRELcandidato_vaga", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idRELcandidato_vaga").Value = idRELcandidato_vagaLabel.Text

        prm = New SqlParameter("@comentarioCV", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@comentarioCV").Value = comentarioCV.Text & " Comentário do Consultor: " & comentarioCV0.Text

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        Dim myEmail As New EmailSQL
        Dim sBody As String = ""
        Dim Body As String = ""
        Dim myBody As New BodyEmail
        Dim dbBody As String = ""
        Dim URL As String = Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.AbsolutePath, "")

        Body = Body & "<table border='0' width='100%'>" & Chr(10)
        Body = Body & "<tr>" & Chr(10)
        Body = Body & "<td><br><font face='Verdana' size='2'>Referente a sua candidatura ao processo seletivo: " & protocoloLabel.Text & " - " & VagaLabel.Text & " </font></td>" & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "<tr>" & Chr(10)
        Body = Body & "<td><br><font face='Verdana' size='2'>Mensagem do Consultor para você: " & comentarioCV.Text & " </font></td>" & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "</table>" & Chr(10)

        dbBody = dbBody & myBody.GetBody("Curriculo", Application("idsetup")).ToString

        sBody = Replace(Replace(dbBody.ToString, "#", Body.ToString), "*", URL)


        myEmail.EnviamensagemSQL(sBody, emailCandidatoLabel.Text.ToString, emailCandidatoLabel.Text.ToString, "Currículo")

    End Sub

    Sub APROVACANDIDATO()

        REM ** ******************************************************************************************************
        REM ** AÇÃO DO CONSULTOR QUANTO A CANDIDATURA (GRAVA HISTÓRICO DAS AÇÕES)
        REM ** ******************************************************************************************************

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_PROCESSOSELETIVO_FASE_CANDIDATO_INSERT]", cn)
        cmd.CommandType = CommandType.StoredProcedure


        prm = New SqlParameter("@idcurriculo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idcurriculo").Value = idCurriculoLabel.Text

        prm = New SqlParameter("@idFaseProcessoSeletivo", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idFaseProcessoSeletivo").Value = idFaseLabel.Text

        prm = New SqlParameter("@comentario", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@comentario").Value = comentarioCV.Text

        prm = New SqlParameter("@pontuacao", SqlDbType.Decimal, 15, 2)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@pontuacao").Value = "9,00"

        prm = New SqlParameter("@flgAprovado", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@flgAprovado").Value = liberarCandidato.SelectedValue

        prm = New SqlParameter("@idvaga", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idvaga").Value = idVagaLabel.Text

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()


        Dim myEmail As New EmailSQL
        Dim sBody As String = ""
        Dim Body As String = ""
        Dim myBody As New BodyEmail
        Dim dbBody As String = ""
        Dim URL As String = Replace(Request.UrlReferrer.AbsoluteUri, Request.UrlReferrer.AbsolutePath, "")

        Body = Body & "<table border='0' width='100%'>" & Chr(10)
        Body = Body & "<tr>" & Chr(10)
        Body = Body & "<td><br><font face='Verdana' size='2'>Referente a sua candidatura ao processo seletivo: " & protocoloLabel.Text & " - " & VagaLabel.Text & " </font></td>" & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "<tr>" & Chr(10)
        Body = Body & "<td><br><font face='Verdana' size='2'>Mensagem do Consultor para você: " & comentarioCV.Text & " </font></td>" & Chr(10)
        Body = Body & "</tr>" & Chr(10)
        Body = Body & "</table>" & Chr(10)

        dbBody = dbBody & myBody.GetBody("Curriculo", Application("idsetup")).ToString

        sBody = Replace(Replace(dbBody.ToString, "#", Body.ToString), "*", URL)


        myEmail.EnviamensagemSQL(sBody, emailCandidatoLabel.Text.ToString, emailCandidatoLabel.Text.ToString, "Currículo")

    End Sub

End Class
