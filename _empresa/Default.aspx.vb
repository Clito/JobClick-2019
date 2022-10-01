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

    Protected Sub ImageButtonConsultor_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonConsultor.Click
        Response.Redirect("/_empresa/_cadastroConsultor.aspx?autoTit=Cadastro dos Consultores de sua empresa")
    End Sub

    Protected Sub ImageButtonCliente_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonCliente.Click
        Response.Redirect("/_empresa/_infoCliente.aspx?autoTit=Informa%C3%A7%C3%B5es%20sobre%20os%20seus%20Clientes%20cadastrados%20e%20de%20sua%20Empresa")
    End Sub

    Protected Sub ImageButtonRel_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonRel.Click
        Response.Redirect("/_empresa/relatorio.aspx?autoTit=Relatórios dos trabalhos em execução")
    End Sub

    Protected Sub ImageButtonVG_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonVG.Click
        'Response.Redirect("/_empresa/_atualizaVaga.aspx?autoTit=Atualiza+informa%u00e7%u00f5es+dos+an%u00facios+publicados")
        Response.Redirect("/_open/_vagapublica.aspx?autoTit=Publicação%20de%20Vagas%20Gratuitas")
    End Sub
End Class
