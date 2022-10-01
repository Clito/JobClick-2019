Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Web.Security
Imports System.Web.HttpCookie
Imports System.DBNull

Partial Class _empresa_Default
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        idUserLabel.Text = Session("idUser")

        REM ** *******************************************************************************************************
        REM ** VERIFICA SE EXISTE CRÉDITOS
        REM ** *******************************************************************************************************
        Dim CREDITO As Int32 = Session("liberaQtdCad")

        If CREDITO = 0 Then
            PanelAvisoCredito.Visible = True
        Else
            PanelAvisoCredito.Visible = False
        End If

        SetupLabel.Text = Session("idSetup")
        idCadastroEmpresaLabel.Text = Session("idCadastroEmpresa")

        lblStatus.Text = ""
        idRH_gestorLabel.Text = "Session Gestor: " & Session("idRH_Gestor")

        Dim idCadastroEmpresaFilha As String = Session("nomeEmpresaFilha")

        If idCadastroEmpresaFilha = "" Then

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter
            Dim HtmlBanner As String = ""
            Dim HtmlLateral As String = ""

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("_USP_EMPRESA_CLIENTE_HOMEPAGE", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

            cn.Open()

            Try
                Dim dr As SqlDataReader = cmd.ExecuteReader
                dr.Read()
                Session("idCadastroEmpresaFilha") = dr("idCadastroEmpresa")
                Session("ApresentaChart") = dr("idPerfilVaga")
                dr.Close()
            Catch ex As Exception

            End Try

            cn.Close()

        End If

        REM ** ************************************************************************************
        REM ** DEFINE SE APRESENTA O CHART OU A IMAGEM DE BOAS VINDAS

        If Session("ApresentaChart") > 0 Then
            LineChart.Visible = True
            ImageChartNULL.Visible = False
            idPerfilVagaLabel.Text = Session("ApresentaChart")
        Else
            LineChart.Visible = False
            ImageChartNULL.Visible = True
            idPerfilVagaLabel.Text = Session("ApresentaChart")
            LabelCabec0.Text = "Tudo começa aqui! &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; "
        End If

        REM ** ************************************************************************************

    End Sub


    Protected Sub DataListEmpresaFilha_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataListEmpresaFilha.ItemDataBound

        If e.Item.ItemType = ListItemType.Item Or e.Item.ItemType = ListItemType.AlternatingItem Then
            Dim mynomeEmpresa As Label = CType(e.Item.FindControl("nmempresaLabel"), Label)
            Session("nomeEmpresaFilha") = "<b>Você está trabalhando com a empresa:</b> " & mynomeEmpresa.Text
        Else
            Session("nomeEmpresaFilha") = "Escolha uma empresa para trabalhar"
        End If

    End Sub

    Protected Sub DropDownListEmpresa_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownListEmpresa.SelectedIndexChanged
        Session("idCadastroEmpresaFilha") = DropDownListEmpresa.SelectedValue
        EmpresaFilhaLabel.Text = Session("idCadastroEmpresaFilha")
        DropDownListEmpresa.DataBind()
    End Sub

    Protected Sub DropDownListEmpresa_DataBound(sender As Object, e As System.EventArgs) Handles DropDownListEmpresa.DataBound
        Try
            Dim idCadastroEmpresaFilha As String = Session("idCadastroEmpresaFilha")
            If idCadastroEmpresaFilha = "" Then
                msnLabel.CssClass = "msn"
                msnLabel.Text = "Informe uma empresa antes de iniciar os trabalhos"
            Else
                msnLabel.CssClass = "msnOK"
                msnLabel.Text = "Empresa informada!"
                DropDownListEmpresa.SelectedValue = idCadastroEmpresaFilha
            End If
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub ImageButtonVSP_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonVSP.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim HtmlBanner As String = ""
        Dim HtmlLateral As String = ""

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("_USP_ATUALIZA_PARA_PRATA", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idUser", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idUser").Value = idUserLabel.Text

        cn.Open()

        Try
            Dim dr As SqlDataReader = cmd.ExecuteReader
            FormsAuthentication.SignOut()
            Session.Abandon()
            Response.Redirect("/")
            dr.Close()
        Catch ex As Exception

        End Try

        cn.Close()


    End Sub

End Class
