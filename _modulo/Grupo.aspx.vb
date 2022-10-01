Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Nullable

''' <summary>
''' 
''' </summary>
''' <remarks></remarks>
Partial Class _modulo_Grupo
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("tituloBanner") = "Grupos"
    End Sub

    Protected Sub NovoLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NovoLinkButton.Click
        FormularioGrupoInc.Visible = True
        MenuGeral.Visible = False
        GridViewListaGrupo.Visible = False
    End Sub

    Protected Sub ImageButtonNovo_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonNovo.Click
        FormularioGrupoInc.Visible = True
        MenuGeral.Visible = False
        GridViewListaGrupo.Visible = False
    End Sub

    Protected Sub ButtonCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonCancelar.Click
        FormularioGrupoInc.Visible = False
        GridViewListaGrupo.Visible = True
        MenuGeral.Visible = True
        PanelcDynamicFieldTag1.Visible = False
        PanelcDynamicFieldTag2.Visible = False
        PanelcDynamicFieldTag3.Visible = False
        PanelcDynamicFieldTag4.Visible = False
        PanelcDynamicFieldTag5.Visible = False
        PanelcDynamicFieldTag6.Visible = False
        PanelcDynamicFieldTag7.Visible = False
        PanelcDynamicFieldTag8.Visible = False
        PanelcDynamicFieldTag9.Visible = False
        PanelcDynamicFieldTag9.Visible = False

        ImageButtonAdd2.Enabled = True
        ImageButtonAdd3.Enabled = True
        ImageButtonAdd4.Enabled = True
        ImageButtonAdd5.Enabled = True
        ImageButtonAdd6.Enabled = True
        ImageButtonAdd7.Enabled = True
        ImageButtonAdd8.Enabled = True
        ImageButtonAdd9.Enabled = True

        ImageButtonAdd1.ImageUrl = "~/images/plus.png"
        ImageButtonAdd2.ImageUrl = "~/images/plus.png"
        ImageButtonAdd3.ImageUrl = "~/images/plus.png"
        ImageButtonAdd4.ImageUrl = "~/images/plus.png"
        ImageButtonAdd5.ImageUrl = "~/images/plus.png"
        ImageButtonAdd6.ImageUrl = "~/images/plus.png"
        ImageButtonAdd7.ImageUrl = "~/images/plus.png"
        ImageButtonAdd8.ImageUrl = "~/images/plus.png"
        ImageButtonAdd9.ImageUrl = "~/images/plus.png"
        FormLabel2.Text = "Informe nome do campo adicional:"
    End Sub

    Protected Sub ImageButtonAdd1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAdd1.Click

        If Not PanelcDynamicFieldTag1.Visible Then
            PanelcDynamicFieldTag1.Visible = True
            ImageButtonAdd1.ImageUrl = "~/images/less.png"
            ImageButtonAdd1.ToolTip = "Limpar todos campos dinâmicos"
        Else
            ImageButtonAdd1.ToolTip = "Adicionar campos dinâmicos"
            ImageButtonAdd1.ImageUrl = "~/images/plus.png"
            ImageButtonAdd2.ImageUrl = "~/images/plus.png"
            ImageButtonAdd3.ImageUrl = "~/images/plus.png"
            ImageButtonAdd4.ImageUrl = "~/images/plus.png"
            ImageButtonAdd5.ImageUrl = "~/images/plus.png"
            ImageButtonAdd6.ImageUrl = "~/images/plus.png"
            ImageButtonAdd7.ImageUrl = "~/images/plus.png"
            ImageButtonAdd8.ImageUrl = "~/images/plus.png"
            ImageButtonAdd9.ImageUrl = "~/images/plus.png"

            ImageButtonAdd2.Enabled = True
            ImageButtonAdd3.Enabled = True
            ImageButtonAdd4.Enabled = True
            ImageButtonAdd5.Enabled = True
            ImageButtonAdd6.Enabled = True
            ImageButtonAdd7.Enabled = True
            ImageButtonAdd8.Enabled = True
            ImageButtonAdd9.Enabled = True

            PanelcDynamicFieldTag1.Visible = False
            PanelcDynamicFieldTag2.Visible = False
            PanelcDynamicFieldTag3.Visible = False
            PanelcDynamicFieldTag4.Visible = False
            PanelcDynamicFieldTag5.Visible = False
            PanelcDynamicFieldTag6.Visible = False
            PanelcDynamicFieldTag7.Visible = False
            PanelcDynamicFieldTag8.Visible = False
            PanelcDynamicFieldTag9.Visible = False
        End If

        FormLabel2.Text = "Informe nome do campo dinâmico(1):"
        FormLabel3.Text = "Informe nome do campo dinâmico(2):"
        FormLabel4.Text = "Informe nome do campo dinâmico(3):"
        FormLabel5.Text = "Informe nome do campo dinâmico(4):"
        FormLabel6.Text = "Informe nome do campo dinâmico(5):"
        FormLabel7.Text = "Informe nome do campo dinâmico(6):"
        FormLabel8.Text = "Informe nome do campo dinâmico(7):"
        FormLabel9.Text = "Informe nome do campo dinâmico(8):"
        FormLabel10.Text = "Informe nome do campo dinâmico(9):"
        FormLabel11.Text = "Informe nome do campo dinâmico(10):"

        IncDynamicFieldTag2.Focus()

    End Sub

    Protected Sub ImageButtonAdd2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAdd2.Click
        ImageButtonAdd2.ImageUrl = "~/images/null.png"
        ImageButtonAdd2.ToolTip = ""
        ImageButtonAdd2.Enabled = False
        PanelcDynamicFieldTag2.Visible = True
        IncDynamicFieldTag3.Focus()
    End Sub

    Protected Sub ImageButtonAdd3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAdd3.Click
        ImageButtonAdd3.ImageUrl = "~/images/null.png"
        ImageButtonAdd3.ToolTip = ""
        ImageButtonAdd3.Enabled = False
        PanelcDynamicFieldTag3.Visible = True
        IncDynamicFieldTag4.Focus()
    End Sub

    Protected Sub ImageButtonAdd4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAdd4.Click
        ImageButtonAdd4.ImageUrl = "~/images/null.png"
        ImageButtonAdd4.ToolTip = ""
        ImageButtonAdd4.Enabled = False
        PanelcDynamicFieldTag4.Visible = True
        IncDynamicFieldTag5.Focus()
    End Sub

    Protected Sub ImageButtonAdd5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAdd5.Click
        ImageButtonAdd5.ImageUrl = "~/images/null.png"
        ImageButtonAdd5.ToolTip = ""
        ImageButtonAdd5.Enabled = False
        PanelcDynamicFieldTag5.Visible = True
        IncDynamicFieldTag6.Focus()
    End Sub

    Protected Sub ImageButtonAdd6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAdd6.Click
        ImageButtonAdd6.ImageUrl = "~/images/null.png"
        ImageButtonAdd6.ToolTip = ""
        ImageButtonAdd6.Enabled = False
        PanelcDynamicFieldTag6.Visible = True
        IncDynamicFieldTag7.Focus()
    End Sub

    Protected Sub ImageButtonAdd7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAdd7.Click
        ImageButtonAdd7.ImageUrl = "~/images/null.png"
        ImageButtonAdd7.ToolTip = ""
        ImageButtonAdd7.Enabled = False
        PanelcDynamicFieldTag7.Visible = True
        IncDynamicFieldTag8.Focus()
    End Sub

    Protected Sub ImageButtonAdd8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAdd8.Click
        ImageButtonAdd8.ImageUrl = "~/images/null.png"
        ImageButtonAdd8.ToolTip = ""
        ImageButtonAdd8.Enabled = False
        PanelcDynamicFieldTag8.Visible = True
        IncDynamicFieldTag9.Focus()
    End Sub

    Protected Sub ImageButtonAdd9_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAdd9.Click
        ImageButtonAdd9.ImageUrl = "~/images/null.png"
        ImageButtonAdd9.ToolTip = ""
        ImageButtonAdd9.Enabled = False
        PanelcDynamicFieldTag9.Visible = True
    End Sub

    Protected Sub SalvaGrupoButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SalvaGrupoButton.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        Dim en As cotaResumoMask = New cotaResumoMask

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("SMSCenterConnectionString").ConnectionString)

        cmd = New SqlCommand("SMSAssist.spGroup_Insert", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@FKidProject", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@FKidClient", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@strNameGroup", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag1", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag2", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag3", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag4", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag5", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag6", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag7", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag8", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag9", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag10", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@ROW_FKidUserCreate", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)


        cmd.Parameters("@FKidProject").Value = Session("idProject")
        cmd.Parameters("@FKidClient").Value = Session("idClient")
        cmd.Parameters("@strNameGroup").Value = IncstrNameGroupTextBox.Text
        cmd.Parameters("@DynamicFieldTag1").Value = IncDynamicFieldTag1.Text
        cmd.Parameters("@DynamicFieldTag2").Value = IncDynamicFieldTag2.Text
        cmd.Parameters("@DynamicFieldTag3").Value = IncDynamicFieldTag3.Text
        cmd.Parameters("@DynamicFieldTag4").Value = IncDynamicFieldTag4.Text
        cmd.Parameters("@DynamicFieldTag5").Value = IncDynamicFieldTag5.Text
        cmd.Parameters("@DynamicFieldTag6").Value = IncDynamicFieldTag6.Text
        cmd.Parameters("@DynamicFieldTag7").Value = IncDynamicFieldTag7.Text
        cmd.Parameters("@DynamicFieldTag8").Value = IncDynamicFieldTag8.Text
        cmd.Parameters("@DynamicFieldTag9").Value = IncDynamicFieldTag9.Text
        cmd.Parameters("@DynamicFieldTag10").Value = IncDynamicFieldTag10.Text
        cmd.Parameters("@ROW_FKidUserCreate").Value = Session("idUser_SMS")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader
        dr.Read()

        dr.Close()
        cn.Close()

        Response.Redirect("Grupo.aspx")

    End Sub

    Protected Sub GridViewListaGrupo_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridViewListaGrupo.SelectedIndexChanged
        MenuGeral.Visible = False
        idGrupoLabel.Text = GridViewListaGrupo.SelectedDataKey("idGroup")
        GridViewListaGrupo.Visible = False
        FormularioEditarGrupoInc.Visible = True
        AtualizaValoresGrupo(idGrupoLabel.Text)
    End Sub

    Sub AtualizaValoresGrupo(ByVal idGroup As Int32)

        IncDynamicFieldTag12.Text = ""
        IncDynamicFieldTag13.Text = ""
        IncDynamicFieldTag14.Text = ""
        IncDynamicFieldTag15.Text = ""
        IncDynamicFieldTag16.Text = ""
        IncDynamicFieldTag17.Text = ""
        IncDynamicFieldTag18.Text = ""
        IncDynamicFieldTag19.Text = ""
        IncDynamicFieldTag20.Text = ""

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        Dim en As cotaResumoMask = New cotaResumoMask

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("SMSCenterConnectionString").ConnectionString)

        cmd = New SqlCommand("SMSAssist.spGroup_Select", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idClient", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idProject", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idGroup", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idClient").Value = Session("idClient")
        cmd.Parameters("@idProject").Value = Session("idProject")
        cmd.Parameters("@idGroup").Value = idGroup

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader
        dr.Read()
        IncstrNameGroupTextBox0.Text = dr("strNameGroup")

        FormLabel12.Text = "Editar Grupo (" & dr("strNameGroup") & ")"

        IncDynamicFieldTag11.Text = dr("DynamicFieldTag1")
        If dr("DynamicFieldTag2") <> "" Then
            IncDynamicFieldTag12.Text = dr("DynamicFieldTag2")
            PanelcDynamicFieldTag10.Visible = True
        End If
        If dr("DynamicFieldTag3") <> "" Then
            IncDynamicFieldTag13.Text = dr("DynamicFieldTag3")
            PanelcDynamicFieldTag11.Visible = True
        End If

        If dr("DynamicFieldTag4") <> "" Then
            IncDynamicFieldTag14.Text = dr("DynamicFieldTag4")
            PanelcDynamicFieldTag12.Visible = True
        End If

        If dr("DynamicFieldTag5") <> "" Then
            IncDynamicFieldTag15.Text = dr("DynamicFieldTag5")
            PanelcDynamicFieldTag13.Visible = True
        End If

        If dr("DynamicFieldTag6") <> "" Then
            IncDynamicFieldTag16.Text = dr("DynamicFieldTag6")
            PanelcDynamicFieldTag14.Visible = True
        End If

        If dr("DynamicFieldTag7") <> "" Then
            IncDynamicFieldTag17.Text = dr("DynamicFieldTag7")
            PanelcDynamicFieldTag15.Visible = True
        End If

        If dr("DynamicFieldTag8") <> "" Then
            IncDynamicFieldTag18.Text = dr("DynamicFieldTag8")
            PanelcDynamicFieldTag16.Visible = True
        End If

        If dr("DynamicFieldTag9") <> "" Then
            IncDynamicFieldTag19.Text = dr("DynamicFieldTag9")
            PanelcDynamicFieldTag17.Visible = True
        End If

        If dr("DynamicFieldTag10") <> "" Then
            IncDynamicFieldTag20.Text = dr("DynamicFieldTag10")
            PanelcDynamicFieldTag18.Visible = True
        End If

        dr.Close()
        cn.Close()
    End Sub

    Protected Sub ButtonCancelarEdit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonCancelarEdit.Click

        FormularioEditarGrupoInc.Visible = False
        GridViewListaGrupo.Visible = True
        MenuGeral.Visible = True
        PanelcDynamicFieldTag10.Visible = False
        PanelcDynamicFieldTag11.Visible = False
        PanelcDynamicFieldTag12.Visible = False
        PanelcDynamicFieldTag13.Visible = False
        PanelcDynamicFieldTag14.Visible = False
        PanelcDynamicFieldTag15.Visible = False
        PanelcDynamicFieldTag16.Visible = False
        PanelcDynamicFieldTag17.Visible = False
        PanelcDynamicFieldTag18.Visible = False

        ImageButtonAdd10.Enabled = True
        ImageButtonAdd11.Enabled = True
        ImageButtonAdd12.Enabled = True
        ImageButtonAdd13.Enabled = True
        ImageButtonAdd14.Enabled = True
        ImageButtonAdd15.Enabled = True
        ImageButtonAdd16.Enabled = True
        ImageButtonAdd17.Enabled = True

        ImageButtonAdd10.ImageUrl = "~/images/plus.png"
        ImageButtonAdd11.ImageUrl = "~/images/plus.png"
        ImageButtonAdd12.ImageUrl = "~/images/plus.png"
        ImageButtonAdd13.ImageUrl = "~/images/plus.png"
        ImageButtonAdd14.ImageUrl = "~/images/plus.png"
        ImageButtonAdd15.ImageUrl = "~/images/plus.png"
        ImageButtonAdd16.ImageUrl = "~/images/plus.png"
        ImageButtonAdd17.ImageUrl = "~/images/plus.png"
        ImageButtonAdd18.ImageUrl = "~/images/plus.png"
        FormLabel2.Text = "Informe nome do campo adicional:"

    End Sub

    Protected Sub ImageButtonAdd10_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAdd10.Click

        If Not PanelcDynamicFieldTag10.Visible Then
            PanelcDynamicFieldTag10.Visible = True
            ImageButtonAdd10.ImageUrl = "~/images/less.png"
            ImageButtonAdd10.ToolTip = "Limpar todos campos dinâmicos"
        Else
            ImageButtonAdd10.ToolTip = "Adicionar campos dinâmicos"
            ImageButtonAdd10.ImageUrl = "~/images/plus.png"
            ImageButtonAdd11.ImageUrl = "~/images/plus.png"
            ImageButtonAdd12.ImageUrl = "~/images/plus.png"
            ImageButtonAdd13.ImageUrl = "~/images/plus.png"
            ImageButtonAdd14.ImageUrl = "~/images/plus.png"
            ImageButtonAdd15.ImageUrl = "~/images/plus.png"
            ImageButtonAdd16.ImageUrl = "~/images/plus.png"
            ImageButtonAdd17.ImageUrl = "~/images/plus.png"
            ImageButtonAdd18.ImageUrl = "~/images/plus.png"

            ImageButtonAdd11.Enabled = True
            ImageButtonAdd12.Enabled = True
            ImageButtonAdd13.Enabled = True
            ImageButtonAdd14.Enabled = True
            ImageButtonAdd15.Enabled = True
            ImageButtonAdd16.Enabled = True
            ImageButtonAdd17.Enabled = True
            ImageButtonAdd18.Enabled = True

            PanelcDynamicFieldTag10.Visible = False
            PanelcDynamicFieldTag11.Visible = False
            PanelcDynamicFieldTag12.Visible = False
            PanelcDynamicFieldTag13.Visible = False
            PanelcDynamicFieldTag14.Visible = False
            PanelcDynamicFieldTag15.Visible = False
            PanelcDynamicFieldTag16.Visible = False
            PanelcDynamicFieldTag17.Visible = False
            PanelcDynamicFieldTag18.Visible = False
        End If

        FormLabel14.Text = "Informe nome do campo dinâmico(1):"
        FormLabel15.Text = "Informe nome do campo dinâmico(2):"
        FormLabel16.Text = "Informe nome do campo dinâmico(3):"
        FormLabel17.Text = "Informe nome do campo dinâmico(4):"
        FormLabel18.Text = "Informe nome do campo dinâmico(5):"
        FormLabel19.Text = "Informe nome do campo dinâmico(6):"
        FormLabel20.Text = "Informe nome do campo dinâmico(7):"
        FormLabel21.Text = "Informe nome do campo dinâmico(8):"
        FormLabel22.Text = "Informe nome do campo dinâmico(9):"
        FormLabel23.Text = "Informe nome do campo dinâmico(10):"



    End Sub

    Protected Sub ImageButtonAdd11_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAdd11.Click
        ImageButtonAdd11.ImageUrl = "~/images/null.png"
        ImageButtonAdd11.ToolTip = ""
        ImageButtonAdd11.Enabled = False
        PanelcDynamicFieldTag11.Visible = True
    End Sub

    Protected Sub ImageButtonAdd12_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAdd12.Click
        ImageButtonAdd12.ImageUrl = "~/images/null.png"
        ImageButtonAdd12.ToolTip = ""
        ImageButtonAdd12.Enabled = False
        PanelcDynamicFieldTag12.Visible = True
    End Sub

    Protected Sub ImageButtonAdd13_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAdd13.Click
        ImageButtonAdd13.ImageUrl = "~/images/null.png"
        ImageButtonAdd13.ToolTip = ""
        ImageButtonAdd13.Enabled = False
        PanelcDynamicFieldTag13.Visible = True
    End Sub

    Protected Sub ImageButtonAdd14_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAdd14.Click
        ImageButtonAdd14.ImageUrl = "~/images/null.png"
        ImageButtonAdd14.ToolTip = ""
        ImageButtonAdd14.Enabled = False
        PanelcDynamicFieldTag14.Visible = True
    End Sub

    Protected Sub ImageButtonAdd15_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAdd15.Click
        ImageButtonAdd15.ImageUrl = "~/images/null.png"
        ImageButtonAdd15.ToolTip = ""
        ImageButtonAdd15.Enabled = False
        PanelcDynamicFieldTag15.Visible = True
    End Sub

    Protected Sub ImageButtonAdd16_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAdd16.Click
        ImageButtonAdd16.ImageUrl = "~/images/null.png"
        ImageButtonAdd16.ToolTip = ""
        ImageButtonAdd16.Enabled = False
        PanelcDynamicFieldTag16.Visible = True
    End Sub

    Protected Sub ImageButtonAdd17_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAdd17.Click
        ImageButtonAdd17.ImageUrl = "~/images/null.png"
        ImageButtonAdd17.ToolTip = ""
        ImageButtonAdd17.Enabled = False
        PanelcDynamicFieldTag17.Visible = True
    End Sub

    Protected Sub ImageButtonAdd18_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButtonAdd18.Click
        ImageButtonAdd18.ImageUrl = "~/images/null.png"
        ImageButtonAdd18.ToolTip = ""
        ImageButtonAdd18.Enabled = False
        PanelcDynamicFieldTag18.Visible = True
    End Sub

    Protected Sub AtualizaGrupoButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AtualizaGrupoButton.Click

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        Dim en As cotaResumoMask = New cotaResumoMask

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("SMSCenterConnectionString").ConnectionString)

        cmd = New SqlCommand("SMSAssist.spGroup_Update", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idGroup", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@FKidProject", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@FKidClient", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@strNameGroup", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag1", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag2", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag3", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag4", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag5", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag6", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag7", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag8", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag9", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@DynamicFieldTag10", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@ROW_FKidUserAlter", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@flgActive", SqlDbType.Bit)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idGroup").Value = idGrupoLabel.Text
        cmd.Parameters("@FKidProject").Value = Session("idProject")
        cmd.Parameters("@FKidClient").Value = Session("idClient")
        cmd.Parameters("@strNameGroup").Value = IncstrNameGroupTextBox0.Text
        cmd.Parameters("@DynamicFieldTag1").Value = IncDynamicFieldTag11.Text
        cmd.Parameters("@DynamicFieldTag2").Value = IncDynamicFieldTag12.Text
        cmd.Parameters("@DynamicFieldTag3").Value = IncDynamicFieldTag13.Text
        cmd.Parameters("@DynamicFieldTag4").Value = IncDynamicFieldTag14.Text
        cmd.Parameters("@DynamicFieldTag5").Value = IncDynamicFieldTag15.Text
        cmd.Parameters("@DynamicFieldTag6").Value = IncDynamicFieldTag16.Text
        cmd.Parameters("@DynamicFieldTag7").Value = IncDynamicFieldTag17.Text
        cmd.Parameters("@DynamicFieldTag8").Value = IncDynamicFieldTag18.Text
        cmd.Parameters("@DynamicFieldTag9").Value = IncDynamicFieldTag19.Text
        cmd.Parameters("@DynamicFieldTag10").Value = IncDynamicFieldTag20.Text
        cmd.Parameters("@flgActive").Value = True
        cmd.Parameters("@ROW_FKidUserAlter").Value = Session("idUser_SMS")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader
        dr.Read()

        dr.Close()
        cn.Close()

        Response.Redirect("Grupo.aspx")

    End Sub

    Protected Sub IBdel1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBdel1.Click
        IncDynamicFieldTag12.Text = ""
        PanelcDynamicFieldTag10.Visible = False
    End Sub

    Protected Sub IBdel2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBdel2.Click
        IncDynamicFieldTag13.Text = ""
        PanelcDynamicFieldTag11.Visible = False
    End Sub

    Protected Sub IBdel3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBdel3.Click
        IncDynamicFieldTag14.Text = ""
        PanelcDynamicFieldTag12.Visible = False
    End Sub

    Protected Sub IBdel4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBdel4.Click
        IncDynamicFieldTag15.Text = ""
        PanelcDynamicFieldTag13.Visible = False
    End Sub

    Protected Sub IBdel5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBdel5.Click
        IncDynamicFieldTag16.Text = ""
        PanelcDynamicFieldTag14.Visible = False
    End Sub

    Protected Sub IBdel6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBdel6.Click
        IncDynamicFieldTag17.Text = ""
        PanelcDynamicFieldTag15.Visible = False
    End Sub

    Protected Sub IBdel7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBdel7.Click
        IncDynamicFieldTag18.Text = ""
        PanelcDynamicFieldTag16.Visible = False
    End Sub

    Protected Sub IBdel8_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBdel8.Click
        IncDynamicFieldTag19.Text = ""
        PanelcDynamicFieldTag17.Visible = False
    End Sub

    Protected Sub IBdel9_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles IBdel9.Click
        IncDynamicFieldTag20.Text = ""
        PanelcDynamicFieldTag18.Visible = False
    End Sub

End Class
