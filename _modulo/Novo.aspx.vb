Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Nullable
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Xml
Imports System.Collections.ObjectModel
Imports System.Linq


Partial Class _modulo_Novo
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("tituloBanner") = "Novo"
        LabelDs.Text = "<b>Descrição das funcionalidades desta página.</b><br>Selecione o(s) Grupo(s) que irá(ão) receber a mensagem, se desejar informe também número(s) avulso(s) de celular(es), separados com [;] escreva a mensagem e clique em [Enviar]."
    End Sub

 
    Protected Sub ButtonEnvioSMS_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonEnvioSMS.Click
        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim HtmlBanner As String = ""
        Dim HtmlLateral As String = ""

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("SMSCenterConnectionString").ConnectionString)

        cmd = New SqlCommand("SMSSite.spPrepareMessage", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@FKidClient", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@FKidClient").Value = Session("idClient")

        prm = New SqlParameter("@FKidProject", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@FKidProject").Value = Session("idProject")

        prm = New SqlParameter("@idUser", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idUser").Value = Session("idUser_SMS")

        prm = New SqlParameter("@strPhoneOdds", SqlDbType.VarChar, 8000)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@strPhoneOdds").Value = strPhoneOddsTextBox.Text  '--> CAMPO TELEFONES

        prm = New SqlParameter("@strGroups", SqlDbType.VarChar, 8000)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@strGroups").Value = GroupLabel.Text

        prm = New SqlParameter("@strMessage", SqlDbType.VarChar, 150)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@strMessage").Value = menssageTextBox.Text

        cn.Open()

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            dr.Close()
            MSN.Text = "Mensagens enviadas para a fila de envio."
            MSN.CssClass = "okMSN"
        Catch ex As Exception
            MSN.Text = "Erro ao enviar as mensagens, veja se o preenchimento está correto e repita a operação."
            MSN.CssClass = "errorMSN"
        End Try



        cn.Close()


    End Sub

    Protected Sub CheckBoxListGroups_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxListGroups.SelectedIndexChanged
        Dim Itens As New Collection(Of String)()
        For index As Integer = 0 To CheckBoxListGroups.Items.Count - 1
            If CheckBoxListGroups.Items(index).Selected Then
                Itens.Add(CheckBoxListGroups.Items(index).Value)
            End If
        Next
        GroupLabel.Text = [String].Join(",", Itens.ToArray())
    End Sub
End Class
