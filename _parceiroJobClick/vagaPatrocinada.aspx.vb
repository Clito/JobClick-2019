Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports BoletoNet


Partial Class _parceiroJobClick_vagaPatrocinada
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        lanceTextBox.Focus()
        SOBREVAGAPATROCINADA.Visible = False
        PanelCredito.Visible = False
        BOLETO.Visible = False
        PanelAviso.Visible = False
        VagaPUBLICADA.Visible = True

        If Not IsPostBack Then
            EXTRATO.Visible = False
        End If

    End Sub

    Protected Sub LinkButtonDuvida_Click(sender As Object, e As EventArgs) Handles LinkButtonDuvida.Click
        SOBREVAGAPATROCINADA.Visible = True
    End Sub

    Protected Sub LinkButtonEXTRATO_Click(sender As Object, e As EventArgs) Handles LinkButtonEXTRATO.Click
        EXTRATO.Visible = True
        DropDownListMES.SelectedValue = Now.Month()
        DropDownListANO.SelectedValue = Now.Year()
        mes.Text = Now.Month()
        ano.Text = Now.Year()
    End Sub

    Protected Sub DropDownListMES_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownListMES.SelectedIndexChanged
        mes.Text = DropDownListMES.SelectedValue
    End Sub

    Protected Sub DropDownListANO_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownListANO.SelectedIndexChanged
        ano.Text = DropDownListANO.SelectedValue
    End Sub

    Protected Sub ImageButtonclose_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonclose.Click
        EXTRATO.Visible = False
    End Sub

    Protected Sub ExtratoEmpresa_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles ExtratoEmpresa.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

        End If
    End Sub

    Protected Sub GridViewVAGA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridViewVAGA.SelectedIndexChanged

        If IsPostBack Then

            codigoLabel.Text = GridViewVAGA.SelectedDataKey("codigo")

            Dim CreditoRes As New Credito
            CreditoLabel.Text = CreditoRes.RestaCreditoAD(Session("idSetup"), Session("idCadastroEmpresa"), Session("idUser"))
            qtdCreditoLabel.Text = CreditoLabel.Text

            VagaPUBLICADA.Visible = False
            FORMULARIO.Visible = True

            idVagaPublicaLabel.Text = GridViewVAGA.SelectedDataKey("idVagaPublica")

            REM ** ************************************************************************************
            REM ** PREPARA AS INFORMAÇÕES DA VAGA PUBLICADA
            REM ** ************************************************************************************
            REM ** [_USP_VAGASPUBLICAS_SELECIONA]

            If Session("ip") <> "::1" Then
                lipClient.Text = Session("ip")
            Else
                lipClient.Text = "177.159.71.47"
            End If

            Dim LocUsuario As analyticsMask = New analyticsMask
            LocUsuario = analytics.analyticsRegion(lipClient.Text)

            If LocUsuario.City <> "" Then
                cidadeADTextBox.Text = LocUsuario.City
            Else
                cidadeADTextBox.Text = Session("cidade")
            End If

            If LocUsuario.RegionName <> "" Then
                estadoADTextBox.Text = LocUsuario.RegionName
            Else
                estadoADTextBox.Text = Session("estado")
            End If

            If LocUsuario.CountryCode <> "" Then
                paisADTextBox.Text = LocUsuario.CountryCode
            Else
                paisADTextBox.Text = Session("pais")
            End If

            longitudeTextBox.Text = LocUsuario.Longitude
            latitudeTextBox.Text = LocUsuario.Latitude

            Dim cn As SqlConnection
            Dim cmd As SqlCommand
            Dim prm As SqlParameter


            cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

            cmd = New SqlCommand("_USP_VAGASPUBLICAS_SELECIONA", cn)
            cmd.CommandType = CommandType.StoredProcedure

            prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

            prm = New SqlParameter("@idVagaPublica", SqlDbType.Int)
            prm.Direction = ParameterDirection.Input
            cmd.Parameters.Add(prm)
            cmd.Parameters("@idVagaPublica").Value = GridViewVAGA.SelectedDataKey("idVagaPublica")

            cn.Open()

            Try

                Dim dr As SqlDataReader = cmd.ExecuteReader

                If dr.HasRows() Then
                    dr.Read()

                    nomeADTextBox.Text = dr("titVagaPublica")
                    dsVagaTextBox.Text = Replace(dr("dsVagaPublica"), "<br>", Chr(10))
                    palavrachaveTextBox.Text = dr("titVagaPublica")
                    idVagaPublicaLabel.Text = GridViewVAGA.SelectedDataKey("idVagaPublica")
                    URLempresaTextBox.Text = dr("site")
                    idCBOOcupacaoLabel.Text = dr("idCBOOcupacao")
                    TextBoxCEP.Text = dr("cep")
                    GETRange(4, dr("cep"))
                    GETCBO(dr("idCBOOcupacao"), dr("titVagaPublica"))
                    DropDownListRange.SelectedValue = 5
                    chamadaVagaTextBox.Text = "Empresa de grande porte contrata para início imediato, " & dr("titVagaPublica")

                End If

                dr.Close()

            Catch ex As Exception

            End Try

            cn.Close()

        End If

    End Sub

    Protected Sub LinkButtonDivulgarVagaPublicada_Click(sender As Object, e As EventArgs) Handles LinkButtonDivulgarVagaPublicada.Click
        VagaPUBLICADA.Visible = True
    End Sub

    Protected Sub InsertCancelButton_Click(sender As Object, e As EventArgs) Handles InsertCancelButton.Click
        VagaPUBLICADA.Visible = True
        FORMULARIO.Visible = False
    End Sub

    Protected Sub ImageButtonPSQ_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButtonPSQ.Click

        VagaPUBLICADA.Visible = False

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

        cmd.Parameters("@CEP").Value = Replace(TextBoxCEP.Text, "-", "")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

            cidadeADTextBox.Text = dr("CIDADE")
            estadoADTextBox.Text = dr("dsuf")


        Else

            cidadeADTextBox.Text = "Não foi encontrado o endereço...."

        End If

        dr.Close()
        cn.Close()

        GETRange(DropDownListRange.SelectedValue, Replace(TextBoxCEP.Text, "-", ""))

    End Sub

    Sub GETRange(Range As Int32, CEP As String)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("spu_cep_search_AD", cn)
        cmd.CommandType = CommandType.StoredProcedure


        prm = New SqlParameter("@range", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@range").Value = Range

        prm = New SqlParameter("@CEP", SqlDbType.NVarChar, 9)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@CEP").Value = Left(CEP, Range)

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

            paraRegiaoTextBox.Text = dr("BAIRRORes")


        Else

            paraRegiaoTextBox.Text = "Não foi encontrada a Região..."

        End If

        dr.Close()
        cn.Close()

    End Sub

    Sub GETCBO(idCBOOcupacao As Int32, titVagaPublica As String)

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[spu_CBO_search_AD]", cn)
        cmd.CommandType = CommandType.StoredProcedure


        prm = New SqlParameter("@idCBOOcupacao", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCBOOcupacao").Value = idCBOOcupacao

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

            cargoRelacionadoTextBox.Text = dr("dsCBOOcupacao")


        Else

            cargoRelacionadoTextBox.Text = titVagaPublica

        End If

        dr.Close()
        cn.Close()

    End Sub

    Protected Sub InsertButton_Click(sender As Object, e As EventArgs) Handles InsertButton.Click

        VagaPUBLICADA.Visible = False

        Dim Saldo As Decimal = CreditoLabel.Text
        Dim Orcamento As Decimal = orcamentoTextBox.Text
        Dim totalDeposito As Decimal = 0

        If Saldo < Orcamento Then
            totalDeposito = Orcamento - Saldo
            If totalDeposito < 20 Then
                TextBoxValor.Text = 20
            Else
                TextBoxValor.Text = Orcamento - Saldo
            End If

            PanelCredito.Visible = True

        Else
            DivulgaVaga(1)
        End If

    End Sub

    Protected Sub LinkButtonBOLETO_Click(sender As Object, e As EventArgs) Handles LinkButtonBOLETO.Click
        VagaPUBLICADA.Visible = False
        AvisoBoletoLabel.Text = Replace(AvisoBoletoLabel.Text, "#1#", Session("emailRes"))
        BOLETO.Visible = True
    End Sub

    Protected Sub LinkButtonImprimirBoleto_Click(sender As Object, e As EventArgs) Handles LinkButtonImprimirBoleto.Click

        DivulgaVaga(0) REM REGISTRA PORÉM NÃO DIVULGA (FOI TRANSFERIDO PARA A PÁGINA BOLETO_PRINT.ASPX
        If inpHideFormaP.Value = "0" Then
            Response.Redirect("comprar.aspx?id=" & Session("idCadastroEmpresa") & "&valor=" & inpHideTextArea.Value & "&idVagaPublica=" & idVagaPublicaLabel.Text & "&txtDescricaoMovimento=Compra de créditos" & "&txtDescricaoStatus=Aguardando confirmação de pagamento" & "&TipoProduto=Compra de créditos")
        Else
            Response.Redirect("boleto.aspx?id=" & Session("idCadastroEmpresa") & "&valor=" & inpHideTextArea.Value & "&idVagaPublica=" & idVagaPublicaLabel.Text & "&txtDescricaoMovimento=Compra de créditos" & "&txtDescricaoStatus=Aguardando confirmação de pagamento" & "&TipoProduto=Compra de créditos")
        End If

    End Sub

    Protected Sub GridViewVAGA_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridViewVAGA.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim flgAguardandoPagamento As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "publicarAD"))
            Dim flgAprovado As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "topAn"))
            Dim flgPublicar As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "publicar"))
            Dim flgidVagaPublica As String = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "idVagaPublica"))

            Dim myImageButtonSelect As New ImageButton
            myImageButtonSelect = e.Row.FindControl("ImageButtonSelect")

            Dim myLinkButtonVAGA As New LinkButton
            myLinkButtonVAGA = e.Row.FindControl("LinkButtonVAGA")

            Select Case flgAprovado
                Case "1"
                    e.Row.BackColor = Drawing.Color.YellowGreen ' AD OK.
                    myImageButtonSelect.ImageUrl = "~/_parceiroJobClick/images/viewDescricaoOK.png"
                    myImageButtonSelect.ToolTip = "Analytics - Vaga anunciada no Vagas Patrocinadas"
                    myImageButtonSelect.PostBackUrl = "analytics.aspx"
                    myLinkButtonVAGA.PostBackUrl = "alterarVaga.aspx?idVagaPublica=" & flgidVagaPublica & "&URL=vagaPatrocinada.aspx"
                Case "0"
                    e.Row.BackColor = Drawing.Color.LightGray  '  NO AD.
            End Select

            Select Case flgPublicar
                Case False
                    e.Row.BackColor = System.Drawing.Color.FromName("#ffa9a9")  'Não publicada.
                    myImageButtonSelect.ImageUrl = "~/_parceiroJobClick/images/viewDescricao.png"
                    myImageButtonSelect.ToolTip = "Vaga não está publicada."
                    myImageButtonSelect.PostBackUrl = "alterarVaga.aspx?idVagaPublica=" & flgidVagaPublica & "&URL=vagaPatrocinada.aspx"
                    myLinkButtonVAGA.PostBackUrl = "alterarVaga.aspx?idVagaPublica=" & flgidVagaPublica & "&URL=vagaPatrocinada.aspx"
            End Select

            Select Case flgAguardandoPagamento
                Case "0"
                    e.Row.BackColor = System.Drawing.Color.FromName("#75cae3")  'Não publicada.
                    myImageButtonSelect.ImageUrl = "~/_parceiroJobClick/images/viewDescricaoPG.png"
                    myImageButtonSelect.ToolTip = "Vaga não está publicada, aguardando liberação mediante confirmação de pagamento."
                    myImageButtonSelect.PostBackUrl = "confirmacaoPagamento.aspx?idVagaPublica=" & flgidVagaPublica & "&URL=vagaPatrocinada.aspx"
                    myLinkButtonVAGA.PostBackUrl = "confirmacaoPagamento.aspx?idVagaPublica=" & flgidVagaPublica & "&URL=vagaPatrocinada.aspx"
            End Select

        End If
    End Sub

    Sub DivulgaVaga(publicar As Int32)

        REM ** ********************************************************************************
        REM ** PUBLICA O AD (System.Web.HttpContext.Current.Session("Numero"))
        REM ** ********************************************************************************

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)

        cmd = New SqlCommand("[_USP_AD_ADICIONA]", cn)
        cmd.CommandType = CommandType.StoredProcedure


        prm = New SqlParameter("@idCadastroEmpresa", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idCadastroEmpresa").Value = Session("idCadastroEmpresa")

        prm = New SqlParameter("@idVagaPublica", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idVagaPublica").Value = idVagaPublicaLabel.Text

        prm = New SqlParameter("@idVaga", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idVaga").Value = 0

        prm = New SqlParameter("@tipoVaga", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@tipoVaga").Value = 1

        prm = New SqlParameter("@nomeAD", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@nomeAD").Value = nomeADTextBox.Text

        prm = New SqlParameter("@chamadaVaga", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@chamadaVaga").Value = chamadaVagaTextBox.Text

        prm = New SqlParameter("@dsVaga", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@dsVaga").Value = dsVagaTextBox.Text

        prm = New SqlParameter("@redeAD", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@redeAD").Value = "Painel de Vagas"

        prm = New SqlParameter("@cidadeAD", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@cidadeAD").Value = cidadeADTextBox.Text

        prm = New SqlParameter("@estadoAD", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@estadoAD").Value = estadoADTextBox.Text

        prm = New SqlParameter("@paisAD", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@paisAD").Value = paisADTextBox.Text

        prm = New SqlParameter("@publicarEm", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@publicarEm").Value = DropDownListPublicarEm.SelectedValue

        prm = New SqlParameter("@longitude", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@longitude").Value = longitudeTextBox.Text

        prm = New SqlParameter("@latitude", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@latitude").Value = latitudeTextBox.Text

        prm = New SqlParameter("@lance", SqlDbType.Decimal, 9, 2)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@lance").Value = lanceTextBox.Text

        prm = New SqlParameter("@orcamento", SqlDbType.Decimal, 18, 2)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@orcamento").Value = orcamentoTextBox.Text

        prm = New SqlParameter("@URLdestino", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@URLdestino").Value = "/_anonimo/sponsoredAD.aspx?pesquisa=" & codigoLabel.Text

        prm = New SqlParameter("@URLempresa", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@URLempresa").Value = URLempresaTextBox.Text

        prm = New SqlParameter("@palavrachave", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@palavrachave").Value = palavrachaveTextBox.Text

        prm = New SqlParameter("@cntClick", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@cntClick").Value = 0

        prm = New SqlParameter("@cntImpressao", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@cntImpressao").Value = 0

        prm = New SqlParameter("@cntMergulho", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@cntMergulho").Value = 0

        prm = New SqlParameter("@qtdImpressao", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@qtdImpressao").Value = 0 'qtdImpressaoTextBox

        prm = New SqlParameter("@paraRegiao", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@paraRegiao").Value = paraRegiaoTextBox.Text

        prm = New SqlParameter("@cargoRelacionado", SqlDbType.Text)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@cargoRelacionado").Value = cargoRelacionadoTextBox.Text

        prm = New SqlParameter("@idSetup", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idSetup").Value = Session("idsetup")

        prm = New SqlParameter("@idUsuario", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@idUsuario").Value = Session("idUser")

        prm = New SqlParameter("@SALDO", SqlDbType.Decimal, 18, 2)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@SALDO").Value = CreditoLabel.Text

        prm = New SqlParameter("@publicar", SqlDbType.Int)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)
        cmd.Parameters("@publicar").Value = publicar

        Try
            cn.Open()

            Dim dr As SqlDataReader = cmd.ExecuteReader

            dr.Close()
            cn.Close()

            AVISOLABEL.Text = "A vaga foi publicada com sucesso!"
            ImageAviso.ImageUrl = "~/_parceiroJobClick/images/ok.jpg"
            PanelAviso.Visible = True

        Catch ex As Exception
            AVISOLABEL.Text = "Erro ao publicar a vaga " & Err.Description
            ImageAviso.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
            PanelAviso.Visible = True
        End Try

    End Sub

End Class
