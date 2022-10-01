Imports user
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.Web.Security
Imports System.Web.HttpCookie
Imports myValidaCPF
Imports System.DBNull

Partial Class _candidato_curriculo
    Inherits System.Web.UI.Page

    Protected Sub dadosInc(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Inserted

        REM ** GRAVA COOKIE
        REM ** ****************************************************
        Dim newCookie As HttpCookie = New HttpCookie("userInfo")

        Dim myData As String = DateTime.Now.AddDays(730)

        Dim p As New user

        Session("idCadastroUser") = p.idCadastroUser(Session("idUser"))

        newCookie.Values.Add("nome", e.Command.Parameters("@nome").Value)
        newCookie.Values.Add("cadastroTipo", e.Command.Parameters("@cadastroTipo").Value)
        newCookie.Expires = myData
        Response.Cookies.Add(newCookie)
        REM ** ****************************************************

        msn.CssClass = "msnOK"
        msn.Text = "Seus dados pessoais foram incluidos com sucesso!"


    End Sub

    Protected Sub dadosUpd(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Updated

        REM ** GRAVA COOKIE
        REM ** ****************************************************
        Dim newCookie As HttpCookie = New HttpCookie("userInfo")

        Dim myData As String = DateTime.Now.AddDays(730)

        newCookie.Values.Add("nome", e.Command.Parameters("@nome").Value)
        newCookie.Values.Add("cadastroTipo", e.Command.Parameters("@cadastroTipo").Value)
        newCookie.Expires = myData
        Response.Cookies.Add(newCookie)
        REM ** ****************************************************

        msn.CssClass = "msnOK"
        msn.Text = "Seus dados pessoais foram alterados com sucesso!"

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub voltar(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub ShowFormDEF(ByVal sender As Object, ByVal e As System.EventArgs)
        Def.Visible = True
        msn.Text = ""
    End Sub

    Protected Sub HideFormDEF(ByVal sender As Object, ByVal e As System.EventArgs)
        'Def.Visible = False
    End Sub

    Protected Sub UpdDef(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataDEF.Updated

        msn.Text = "[Atenção especial] foi atualizado com sucesso!"
        Def.Visible = False

    End Sub

    Protected Sub IncDef(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataDEF.Inserted

        msn.Text = "[Atenção especial] foi incluido com sucesso!"
        Def.Visible = False

    End Sub

    Protected Sub HideFormDEF(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Def.Visible = False
    End Sub

    Protected Sub PesquisaCEP_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)


        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spCEP", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@CEP", SqlDbType.NVarChar, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@CEP").Value = Replace(CType(FormView1.FindControl("cepTextBox"), TextBox).Text, "-", "")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

            CType(FormView1.FindControl("enderecoTextBox"), TextBox).Text = dr("LOGRADOURO") & " " & dr("RUA") & ", "
            CType(FormView1.FindControl("bairroTextBox"), TextBox).Text = dr("BAIRRO")
            CType(FormView1.FindControl("cidadeTextBox"), TextBox).Text = dr("CIDADE")
            CType(FormView1.FindControl("DDUf"), DropDownList).SelectedValue = dr("UF")
            CType(FormView1.FindControl("enderecoTextBox"), TextBox).Focus()

        Else

            CType(FormView1.FindControl("enderecoTextBox"), TextBox).Text = "Não encontrei o endereço...."

        End If


        dr.Close()
        cn.Close()


    End Sub

    Protected Sub PesquisaCEP_Click1(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)


        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spCEP", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@CEP", SqlDbType.NVarChar, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@CEP").Value = Replace(CType(FormView1.FindControl("cepTextBox"), TextBox).Text, "-", "")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

            CType(FormView1.FindControl("enderecoTextBox"), TextBox).Text = dr("LOGRADOURO") & " " & dr("RUA") & ", "
            CType(FormView1.FindControl("bairroTextBox"), TextBox).Text = dr("BAIRRO")
            CType(FormView1.FindControl("cidadeTextBox"), TextBox).Text = dr("CIDADE")
            CType(FormView1.FindControl("DDUf"), DropDownList).SelectedValue = dr("UF")
            CType(FormView1.FindControl("enderecoTextBox"), TextBox).Focus()

        Else

            CType(FormView1.FindControl("enderecoTextBox"), TextBox).Text = "Não encontrei o endereço...."

        End If


        dr.Close()
        cn.Close()

    End Sub

    Protected Sub SqlDataSource1_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Inserting

        Dim statusCPF As Boolean = False

        e.Command.Parameters("@resumo").Value = Replace(CType(FormView1.FindControl("resumoTextBox"), TextBox).Text, Chr(10), "<br>")

        statusCPF = PesquisaCPFfn(CType(FormView1.FindControl("TextBoxCPF"), TextBox).Text)

        If Not statusCPF Then
            CType(FormView1.FindControl("lblmsn"), Label).Text = "* Erro ao incluir este CPF.</a>]."
            e.Cancel = True
        End If

    End Sub

    Protected Sub SqlDataSource1_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Updating
        e.Command.Parameters("@resumo").Value = Replace(CType(FormView1.FindControl("resumoTextBox"), TextBox).Text, Chr(10), "<br>")
    End Sub

    Protected Sub resumoTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("resumoTextBox"), TextBox).Text = Replace(CType(FormView1.FindControl("resumoTextBox"), TextBox).Text, "<br>", "")
    End Sub


    Protected Sub PesquisaCPF(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim ValidaCPFres As New myValidaCPF

        If ValidaCPFres.ValidaCPF(CType(FormView1.FindControl("TextBoxCPF"), TextBox).Text) Then

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("spBuscaCPF", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@CPF", SqlDbType.VarChar, 20)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@CPF").Value = CType(FormView1.FindControl("TextBoxCPF"), TextBox).Text

            Try

                cn.Open()

                Dim dr As SqlDataReader = cmd.ExecuteReader

                If dr.HasRows() Then

                    dr.Read()

                    CType(FormView1.FindControl("lblmsn"), Label).Text = "[" & dr("CPF") & "] já está cadastrado no sistema."

                Else

                    If CType(FormView1.FindControl("TextBoxCPF"), TextBox).Text = "___.___.___-__" Then
                        CType(FormView1.FindControl("lblmsn"), Label).Text = "..."
                    Else
                        CType(FormView1.FindControl("lblmsn"), Label).Text = "Ok!"
                        CType(FormView1.FindControl("cepTextBox"), TextBox).Focus()
                    End If

                End If

                dr.Close()

            Catch ex As Exception

                CType(FormView1.FindControl("lblmsn"), Label).Text = "Erro ao pesquisar o CPF..."

            End Try

            cn.Close()
        Else

            CType(FormView1.FindControl("lblmsn"), Label).Text = "CPF não é válido, informe um CPF válido."

        End If

    End Sub


    Function PesquisaCPFfn(ByVal CPF)

        Dim Status As Boolean = True

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim ValidaCPFres As New myValidaCPF

        If ValidaCPFres.ValidaCPF(CPF) Then

            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("spBuscaCPF", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@CPF", SqlDbType.VarChar, 20)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)

            cmd.Parameters("@CPF").Value = CPF

            Try

                cn.Open()

                Dim dr As SqlDataReader = cmd.ExecuteReader

                If dr.HasRows() Then

                    dr.Read()

                    Status = False

                End If

                dr.Close()

            Catch ex As Exception

                Status = False

            End Try

            cn.Close()
        Else

            Status = False

        End If

        Return Status

    End Function


    Protected Sub DropDownList3_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("DropDownList3"), DropDownList).SelectedValue = "Brasil"
    End Sub

    Protected Sub CheckBox1_CheckedChanged(sender As Object, e As System.EventArgs)
        Def.Visible = True
        msn.Text = ""
    End Sub

End Class
