Imports System.Data.OleDb
Imports System.Data
Imports System.Data.SqlClient

Partial Class _parceiroJobClick_publicarVagaMass
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        PanelAviso.Visible = False

        If Me.IsPostBack = False Then
            CarregaExcel()
        End If
    End Sub

    Sub CarregaExcel()
        If lbl_ArquivoXLS.Text <> "" Then
            PanelVagas.Visible = True

            Dim DBConnection = New OleDbConnection( _
          "Provider=Microsoft.Jet.OLEDB.4.0;" & _
          "Data Source=" & lbl_ArquivoXLS.Text & ";" & _
          "Extended Properties=""Excel 8.0;HDR=Yes""")
            DBConnection.Open()

            Dim SQLString As String = "SELECT * FROM [vaga$] WHERE NOT ([titulo] = '')"
            Dim DBCommand = New OleDbCommand(SQLString, DBConnection)
            Dim DBReader As Data.IDataReader = DBCommand.ExecuteReader()



            If HasColumn(DBReader, "Titulo") _
                And HasColumn(DBReader, "Descricao") _
                And HasColumn(DBReader, "Quantidade") _
                And HasColumn(DBReader, "Cidade") _
                And HasColumn(DBReader, "Estado") _
                And HasColumn(DBReader, "Email") _
                And HasColumn(DBReader, "Validade") _
                And HasColumn(DBReader, "Codigo") _
                And HasColumn(DBReader, "PNE") Then

                GridView_Vagas.DataSource = DBReader
                GridView_Vagas.DataBind()


            Else
                AVISOLABEL.Text = "Formato dos Campos no arquivo estão fora do padrão"
                AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
                ImageAVISO.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
                PanelAviso.Visible = True
            End If

            DBReader.Close()
            DBConnection.Close()
        End If
    End Sub

    Function HasColumn(dr As IDataRecord, columnName As String) As Boolean
        For i As Integer = 0 To dr.FieldCount - 1
            If dr.GetName(i).Equals(columnName, StringComparison.InvariantCultureIgnoreCase) Then
                Return True
            End If
        Next
        Return False
    End Function



    Protected Sub LinkButton_btEnviarArquivo_Click(sender As Object, e As System.EventArgs) Handles LinkButton_btEnviarArquivo.Click
        If XLS_BulkVaga.HasFile Then
            If InStr(XLS_BulkVaga.FileName, ".xls") Then
                lbl_ArquivoXLS.Text = Server.MapPath("\_parceiro\bulk_vaga\") & XLS_BulkVaga.FileName & "_" & Replace(Replace(Replace(Now.ToString, "/", ""), ":", ""), " ", "")
                lbl_FileName.Text = XLS_BulkVaga.FileName
                Try
                    XLS_BulkVaga.SaveAs(lbl_ArquivoXLS.Text)
                    AVISOLABEL.Text = "Upload Efetuado com Sucesso <br />" & _
                       "Tamanho do Arquivo: " & _
                       XLS_BulkVaga.PostedFile.ContentLength & " kb<br>" & _
                       "Tipo do Arquivo: " & _
                       XLS_BulkVaga.PostedFile.ContentType
                    AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
                    ImageAVISO.ImageUrl = "~/_parceiroJobClick/images/ok.jpg"
                    PanelAviso.Visible = True
                    PanelVagas.Visible = True
                    CarregaExcel()
                Catch ex As Exception
                    AVISOLABEL.Text = "ERRO: " & ex.Message.ToString() & " - " & Server.MapPath("\_parceiro\bulk_vaga\") & XLS_BulkVaga.FileName & "_" & Trim(Replace(Replace(Now.ToString, "/", ""), ":", ""))
                    AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
                    ImageAVISO.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
                    PanelAviso.Visible = True
                End Try
            Else
                AVISOLABEL.Text = "O arquivo não está em formato Excel (.xls/.xlsx)!"
                AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
                ImageAVISO.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
                PanelAviso.Visible = True
            End If
        Else
            AVISOLABEL.Text = "Selecione um arquivo para ser enviado!"
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
            PanelAviso.Visible = True
        End If
    End Sub

    Protected Sub chkSelectAll_CheckedChanged(sender As Object, e As EventArgs)
        Dim chk As CheckBox
        For Each rowItem As GridViewRow In GridView_Vagas.Rows
            chk = DirectCast(rowItem.Cells(0).FindControl("CheckBox_Selecionar"), CheckBox)
            chk.Checked = DirectCast(sender, CheckBox).Checked
        Next
    End Sub

    Dim myProtocolo As New geraProtocolo

    Protected Sub LinkButton_InsertVaga_Click(sender As Object, e As System.EventArgs) Handles LinkButton_InsertVaga.Click
        Dim chk As CheckBox

        Dim strTitulo As String
        Dim strDescricao As String
        Dim strQuantidade As Integer
        Dim strCidade As String
        Dim strEstado As String
        Dim strEmail As String
        Dim strValidade As DateTime
        Dim strCodigo As String
        Dim strPNE As Boolean

        Dim cn As SqlConnection

        Dim Fail As String = ""

        For Each rowItem As GridViewRow In GridView_Vagas.Rows
            Try
                chk = DirectCast(rowItem.Cells(0).FindControl("CheckBox_Selecionar"), CheckBox)
                If chk.Checked = True Then

                    strTitulo = rowItem.Cells(1).Text 'Titulo
                    strDescricao = rowItem.Cells(2).Text 'Descricao
                    If IsNumeric(rowItem.Cells(3).Text) Then
                        strQuantidade = rowItem.Cells(3).Text 'Quantidade
                    Else
                        strQuantidade = 1
                    End If
                    strCidade = rowItem.Cells(4).Text 'Cidade
                    strEstado = rowItem.Cells(5).Text 'Estado
                    strEmail = rowItem.Cells(6).Text 'Email
                    If IsDate(rowItem.Cells(7).Text) And rowItem.Cells(7).Text > Now Then
                        strValidade = rowItem.Cells(7).Text 'Validade
                    Else
                        strValidade = DateAdd(DateInterval.Month, 1, Now)
                    End If
                    strCodigo = rowItem.Cells(8).Text 'Codigo
                    If UCase(rowItem.Cells(9).Text) = "SIM" _
                        Or UCase(rowItem.Cells(9).Text) = "S" _
                        Or UCase(rowItem.Cells(9).Text) = "1" Then 'PNE 

                        strPNE = True
                    Else
                        strPNE = False
                    End If

                    cn = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
                    cn.Open()

                    Dim SQLQuery As New SqlCommand("INSERT INTO tbVagaPublica" & _
                                "(" & _
                                     "  idCadastroEmpresa" & _
                                     ", idFuncao " & _
                                     ", titVagaPublica" & _
                                     ", dsVagaPublica " & _
                                     ", nroVaga " & _
                                     ", localTrabalho" & _
                                     ", UF" & _
                                     ", email " & _
                                     ", data " & _
                                     ", validade " & _
                                     ", codigo " & _
                                     ", referencia " & _
                                     ", publicar " & _
                                     ", aviso" & _
                                     ", topAn" & _
                                     ", cnt" & _
                                     ", pne" & _
                                ")" & _
                                "Values " & _
                                "(" & _
                                     "  @idCadastroEmpresa" & _
                                     ", @idFuncao " & _
                                     ", @titVagaPublica" & _
                                     ", @dsVagaPublica " & _
                                     ", @nroVaga " & _
                                     ", @localTrabalho" & _
                                     ", @UF" & _
                                     ", @email " & _
                                     ", @data " & _
                                     ", @validade " & _
                                     ", @codigo " & _
                                     ", @referencia " & _
                                     ", @publicar " & _
                                     ", @aviso" & _
                                     ", @topAn" & _
                                     ", @cnt" & _
                                     ", @pne" & _
                                ")", cn)
                    With SQLQuery
                        .Parameters.Add("@idCadastroEmpresa", SqlDbType.Int).Value = Session("idCadastroEmpresa")
                        .Parameters.Add("@idFuncao", SqlDbType.Int).Value = 0
                        .Parameters.Add("@titVagaPublica", SqlDbType.VarChar).Value = Server.HtmlDecode(strTitulo)
                        .Parameters.Add("@dsVagaPublica", SqlDbType.VarChar).Value = Replace(Server.HtmlDecode(strDescricao), Chr(10), "<br>")
                        .Parameters.Add("@nroVaga", SqlDbType.Int).Value = strQuantidade
                        .Parameters.Add("@localTrabalho", SqlDbType.VarChar).Value = Server.HtmlDecode(strCidade)
                        .Parameters.Add("@UF", SqlDbType.VarChar).Value = Server.HtmlDecode(strEstado)
                        .Parameters.Add("@email", SqlDbType.VarChar).Value = Server.HtmlDecode(strEmail)
                        .Parameters.Add("@data", SqlDbType.DateTime).Value = Now
                        .Parameters.Add("@validade", SqlDbType.DateTime).Value = strValidade
                        .Parameters.Add("@codigo", SqlDbType.VarChar).Value = myProtocolo.getNrProtocolo(Session("idSetup"))
                        .Parameters.Add("@referencia", SqlDbType.VarChar).Value = Server.HtmlDecode(strCodigo)
                        .Parameters.Add("@publicar", SqlDbType.Int).Value = 1
                        .Parameters.Add("@aviso", SqlDbType.Int).Value = 0
                        .Parameters.Add("@topAn", SqlDbType.Int).Value = 0
                        .Parameters.Add("@cnt", SqlDbType.Int).Value = 0
                        .Parameters.Add("@pne", SqlDbType.Bit).Value = strPNE
                        .ExecuteNonQuery()
                    End With

                    cn.Close()

                End If
            Catch ex As Exception
                Fail += rowItem.Cells(1).Text + " - " + ex.Message + "; <br />"
            End Try
        Next

        If Fail = "" Then
            PanelVagas.Visible = False
            AVISOLABEL.Text = "Suas vagas foram publicadas com sucesso!"
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_parceiroJobClick/images/ok.jpg"
            PanelAviso.Visible = True
        Else
            PanelVagas.Visible = False
            AVISOLABEL.Text = "Falha ao Salvar e Publicar as vagas: <br />" + Fail
            AVISOLABEL.CssClass = "textoProcessoSeletivoABERTO"
            ImageAVISO.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
            PanelAviso.Visible = True
        End If

    End Sub
End Class
