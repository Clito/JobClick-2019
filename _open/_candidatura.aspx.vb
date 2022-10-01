﻿Imports System.Web.UI.WebControls.Label
Imports System.Web.UI.WebControls.DataList
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull

Partial Class _empresaJC_candidatura
    Inherits System.Web.UI.Page

    Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        LabelCabec.Text = Request.QueryString("autoTit")

        If idUserLabel.Text <> "" Then

            REM ** *****************************************************************************
            REM ** FOTO DO CANDIDATO
            REM ** *****************************************************************************

            Dim HTMLFoto As String = ""
            Dim Foto As String = ""

            Dim oReader As SqlDataReader = Nothing
            Dim oSQL As String
            Dim oConnection As SqlConnection

            oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
            Dim oCommand As SqlCommand

            oSQL = "SELECT nome, foto FROM tbCadastroUser WHERE (idUser = " + idUserLabel.Text + ")"

            oConnection.Open()

            oCommand = New SqlCommand(oSQL, oConnection)
            oReader = oCommand.ExecuteReader()

            If oReader.HasRows() Then

                oReader.Read()

                Try

                    If Not oReader("foto") Is DBNull.Value Then
                        ImageCandidato.ImageUrl = oReader("foto")
                    Else
                        ImageCandidato.ImageUrl = "~/images/candidato/cvnoImage.png"
                    End If

                Catch ex As Exception

                End Try

            Else

                ImageCandidato.ImageUrl = "~/images/candidato/cvnoImage.png"

            End If

            oReader.Close()
            oConnection.Close()

        End If

    End Sub

    Protected Sub GridViewCandidatura_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewCandidatura.SelectedIndexChanged

        idCurriculoLabel.Text = GridViewCandidatura.SelectedDataKey("idCurriculo")
        idUserLabel.Text = GridViewCandidatura.SelectedDataKey("idUser")
        idpublicaLabel.Text = GridViewCandidatura.SelectedDataKey("idpublica")
        PanelCV.Visible = True

        If idpublicaLabel.Text <> "" Then

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("spUpdEmail", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idpublica", SqlDbType.Int, 4)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@idpublica").Value = idpublicaLabel.Text

            cn.Open()

            Try

                Dim dr As SqlDataReader = cmd.ExecuteReader()
                dr.Close()

            Catch ex As Exception

            End Try


            cn.Close()

        End If

    End Sub


    Private Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound

        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then
            If DirectCast(e.Item.DataItem, DataRowView).Item("portadorDef") Then
                ImageDef.Visible = True
            End If
        End If

    End Sub


    Private Sub DataList4_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList4.ItemDataBound


        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            Label25.Text = DirectCast(e.Item.DataItem, DataRowView).Item("idcurriculo").ToString

        End If

        If Label25.Text.ToString <> "" Then
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

    Protected Sub DataListDef_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListDef.ItemDataBound
        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then

            LabelDef.Text = DirectCast(e.Item.DataItem, DataRowView).Item("Obs").ToString

        End If

        If LabelDef.Text.ToString <> "" Then
            DataListDef.ShowHeader = True
        Else
            DataListDef.ShowHeader = False
        End If
    End Sub

    Protected Sub LinkButtonClose_Click(sender As Object, e As System.EventArgs) Handles LinkButtonClose.Click
        PanelCV.Visible = False
    End Sub

    Protected Sub GridViewListaVagas_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridViewListaVagas.SelectedIndexChanged
        codigoLabel.Text = GridViewListaVagas.SelectedDataKey("codigo")
    End Sub
End Class
