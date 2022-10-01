Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports checkdigit
Imports System.DBNull

Partial Class _empresa__vaga_Default
    Inherits System.Web.UI.Page

    Protected Sub TxtBoxC(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSourcePsq.Selecting

        If TextBox1.Text <> "" Then
            Dim SearchTxt As String = Replace(TextBox1.Text, " ", "%")
            e.Command.Parameters("@buscador").Value = "%" & SearchTxt & "%"
        Else
            e.Command.Parameters("@buscador").Value = ""
        End If

    End Sub

    Protected Sub GetInfo(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView3.SelectedIndexChanged

        resTxt.Text = GridView3.SelectedValue.ToString
        FormView1.DefaultMode = FormViewMode.Insert
        IdFuncaoDropDown.Visible = True
        DropDownList6.Visible = True
        DropDownList5.Visible = True
        DDownNivelHierarquico.Visible = True
        DDownTipoOportunidade.Visible = True
        DDownTipoFormacao.Visible = True
        DDownListConsultor.Visible = True


        Label1.Visible = True
        Label2.Visible = True
        Label3.Visible = True
        CabecInc.Visible = True

    End Sub


    Protected Sub GoBack(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("vaga.aspx")
    End Sub

    Protected Sub UpdApresentacao(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource4.Updated, SqlDataSource2.Updated
        Response.Redirect("vaga.aspx")
    End Sub

    Protected Sub DelApresentacao(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource4.Deleted
        Response.Redirect("vaga.aspx")
    End Sub

    Protected Sub IncApresentacao(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource4.Inserted
        Response.Redirect("vaga.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("idRH_Gestor") <> "" Then
            GridView1.DataSourceID = "SqlDataVaga_Consultor"
            DDownListConsultor.DataSourceID = "SqlDataConsultor_Consultor"
        Else
            GridView1.DataSourceID = "SqlDataSource1"
            DDownListConsultor.DataSourceID = "SqlDataConsultor"
        End If

        If Request.QueryString("idVaga") <> "" Then
            IdFuncaoDropDown.Visible = False
            psqFuncao.Visible = False
        End If

    End Sub

    Protected Sub CancInc(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("vaga.aspx")
    End Sub

    Protected Sub CarregaIdFuncao(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource2.Inserting

        Dim myCheckDigit As New checkdigit

        Dim oReader As SqlDataReader = Nothing
        Dim oSQL As String
        Dim oConnection As SqlConnection
        Dim IdVaga As String = ""
        Dim nrVaga As String = ""
        Dim nrVagaFinal As String = ""

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT MAX(idVaga) as CNT FROM tbVaga"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        REM ** ***************************************************************
        REM ** CONFIGURAÇÃO DO SISTEMA DE ENVIO DE E-MAIL - DB
        REM ** ***************************************************************

        Try

            If oReader.HasRows() Then
                oReader.Read()
                IdVaga = oReader("CNT") + 1
            Else
                IdVaga = "1"
            End If

        Catch ex As Exception

            IdVaga = "1"

        End Try

        nrVaga = IdVaga.ToString.PadLeft(8, "0")
        nrVagaFinal = nrVaga & "-" & myCheckDigit.CALCDIG10(nrVaga).ToString

        oConnection.Close()


        Dim CodVagaRES As String = ""
        Dim CodVagaRESUp As String = ""


        CodVagaRES = Left(IdFuncaoDropDown.Text, 3)
        CodVagaRESUp = UCase(CodVagaRES)

        e.Command.Parameters("@idfuncao").Value = Convert.ToInt32(resTxt.Text)
        e.Command.Parameters("@dsFuncao").Value = IdFuncaoDropDown.Text
        e.Command.Parameters("@iddsempresa").Value = DropDownList6.Text
        e.Command.Parameters("@idstatusvaga").Value = DropDownList5.Text
        e.Command.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")
        e.Command.Parameters("@codvaga").Value = CodVagaRESUp & nrVagaFinal.ToString
        e.Command.Parameters("@idNivelHierarquico").Value = DDownNivelHierarquico.Text
        e.Command.Parameters("@TipoOportunidade").Value = DDownTipoOportunidade.Text
        e.Command.Parameters("@idTipoFormacao").Value = DDownTipoFormacao.Text
        e.Command.Parameters("@idRH_Gestor").Value = DDownListConsultor.Text

        e.Command.Parameters("@dsvaga").Value = Replace(CType(FormView1.FindControl("dsvagaTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@habilidades").Value = Replace(CType(FormView1.FindControl("TBhabilidades"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@Qualificacoes").Value = Replace(CType(FormView1.FindControl("TBQualificacoes"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@ObsComplementares").Value = Replace(CType(FormView1.FindControl("TBObsComplementares"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@Beneficios").Value = Replace(CType(FormView1.FindControl("TBBeneficios"), TextBox).Text, Chr(10), "<br>")

    End Sub

    Protected Sub RepairDadosU(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource2.Updating

        SetProcessoSeletivo(CType(FormView1.FindControl("idvagaTextBox"), TextBox).Text, CType(FormView1.FindControl("DDownListConsultor"), DropDownList).SelectedValue)

        e.Command.Parameters("@dsvaga").Value = Replace(CType(FormView1.FindControl("dsvagaTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@habilidades").Value = Replace(CType(FormView1.FindControl("TBhabilidades"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@Qualificacoes").Value = Replace(CType(FormView1.FindControl("TBQualificacoes"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@ObsComplementares").Value = Replace(CType(FormView1.FindControl("TBObsComplementares"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@Beneficios").Value = Replace(CType(FormView1.FindControl("TBBeneficios"), TextBox).Text, Chr(10), "<br>")

    End Sub

    Sub SetProcessoSeletivo(ByVal idvaga As Integer, ByVal idRH_Gestor As Integer)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spUpdateProcessoSeletivo", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idvaga", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idRH_Gestor", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idvaga").Value = Convert.ToInt32(idvaga)
        cmd.Parameters("@idRH_Gestor").Value = Convert.ToInt32(idRH_Gestor)

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader
        dr.Close()
        cn.Close()

    End Sub

    Protected Sub dsvagaTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("dsvagaTextBox"), TextBox).Text = Replace(CType(FormView1.FindControl("dsvagaTextBox"), TextBox).Text, "<br>", "")
    End Sub

    Protected Sub TBhabilidades_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("TBhabilidades"), TextBox).Text = Replace(CType(FormView1.FindControl("TBhabilidades"), TextBox).Text, "<br>", "")
    End Sub

    Protected Sub TBQualificacoes_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("TBQualificacoes"), TextBox).Text = Replace(CType(FormView1.FindControl("TBQualificacoes"), TextBox).Text, "<br>", "")
    End Sub

    Protected Sub TBObsComplementares_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("TBObsComplementares"), TextBox).Text = Replace(CType(FormView1.FindControl("TBObsComplementares"), TextBox).Text, "<br>", "")
    End Sub

    Protected Sub TBBeneficios_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("TBBeneficios"), TextBox).Text = Replace(CType(FormView1.FindControl("TBBeneficios"), TextBox).Text, "<br>", "")
    End Sub



    Protected Sub DelVaga(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource2.Deleted
        Response.Redirect("vaga.aspx")
    End Sub

    Protected Sub IncVaga(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource2.Inserted
        Response.Redirect("vaga.aspx")
    End Sub

    Protected Sub RepairApresentacaoI(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource4.Inserting
        e.Command.Parameters("@dsempresaVaga").Value = Replace(CType(FormView2.FindControl("dsempresaVagaTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@msnCandidato").Value = Replace(CType(FormView2.FindControl("TBmsnCandidato"), TextBox).Text, Chr(10), "<br>")
    End Sub

    Protected Sub RepairApresentacaoU(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource4.Updating
        e.Command.Parameters("@dsempresaVaga").Value = Replace(CType(FormView2.FindControl("dsempresaVagaTextBox"), TextBox).Text, Chr(10), "<br>")
        e.Command.Parameters("@msnCandidato").Value = Replace(CType(FormView2.FindControl("TBmsnCandidato"), TextBox).Text, Chr(10), "<br>")
    End Sub

    Protected Sub dsempresaVagaTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView2.FindControl("dsempresaVagaTextBox"), TextBox).Text = Replace(CType(FormView2.FindControl("dsempresaVagaTextBox"), TextBox).Text, "<br>", "")
    End Sub

    Protected Sub TBmsnCandidato_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView2.FindControl("TBmsnCandidato"), TextBox).Text = Replace(CType(FormView2.FindControl("TBmsnCandidato"), TextBox).Text, "<br>", "")
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        Dim img As ImageButton
        Dim status As Boolean = False

        If e.Row.RowType = DataControlRowType.DataRow Then

            If e.Row.RowState = DataControlRowState.Normal Or e.Row.RowState = DataControlRowState.Alternate Then

                Dim publicaRes As String = e.Row.Cells(16).Text

                If publicaRes Then
                    e.Row.Cells(16).Visible = False
                    img = e.Row.FindControl("ImageButton1")
                    img.ImageUrl = "~/images/ckPublica_on.gif"
                Else
                    e.Row.Cells(16).Visible = False
                    img = e.Row.FindControl("ImageButton1")
                    img.ImageUrl = "~/images/ckPublica_off.gif"
                End If

            End If

            e.Row.Cells(17).Visible = False

            status = vwEmailCadidato(e.Row.Cells(17).Text)

            If status Then
                Dim tc As New TableCell
                tc.Text = "<a href='outlook.aspx?id=" + e.Row.Cells(17).Text + "'><img border='0' src='../../images/empresa/email.gif'></a>"
                e.Row.Cells.Add(tc)
            Else
                Dim tc As New TableCell
                tc.Text = "<img border='0' src='../../images/empresa/emailnull.gif'>"
                e.Row.Cells.Add(tc)
            End If


        End If

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spUpdPublicaVaga", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idvaga", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idvaga").Value = GridView1.SelectedValue

        cn.Open()
        Dim dr As SqlDataReader = cmd.ExecuteReader

        dr.Close()
        cn.Close()

        Response.Redirect("vaga.aspx")

    End Sub

    REM ** Verifica se existe e-mail para a vaga ...

    Function vwEmailCadidato(ByVal id As String) As Boolean

        Dim oReader As SqlDataReader = Nothing
        Dim oConnection As SqlConnection
        Dim oSQL As String
        Dim status As Boolean = False

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        Dim oCommand As SqlCommand

        oSQL = "SELECT idRELduvida_vaga, idvaga, liberarRH FROM tbRELduvida_vaga WHERE(idvaga = " & id & ") AND (liberarRH = 0)"

        oConnection.Open()

        oCommand = New SqlCommand(oSQL, oConnection)
        oReader = oCommand.ExecuteReader()

        Try

            If oReader.HasRows() Then
                status = True
            Else
                status = False
            End If

        Catch ex As Exception
            status = False
        End Try

        oConnection.Close()

        Return status

    End Function


    Protected Sub SetConsultor(ByVal sender As Object, ByVal e As System.EventArgs)
        If Session("idRH_Gestor") <> "" Then
            CType(FormView1.FindControl("DDownListConsultor"), DropDownList).DataSourceID = "SqlDataConsultor_Consultor"
        End If
    End Sub

End Class
