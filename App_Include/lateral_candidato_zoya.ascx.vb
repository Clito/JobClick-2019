
Partial Class App_Include_lateral_candidato_zoya
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("idCadastroUser") <> "" Then

            Dim montador As String = ""

            montador = montador & "<table width='130px' border='0' id='Links' cellspacing='0' cellpadding='0'>" & Chr(10)

            montador = montador & "<tr>" & Chr(10)
            montador = montador & "<td valign='top'>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navega_sup/ind_nativo.gif'></td>" & Chr(10)
            montador = montador & "<td width='130px' align='left'><a href='zoyaview.aspx'>Editar Profile</a></td>" & Chr(10)
            montador = montador & "</tr>" & Chr(10)

            montador = montador & "<tr>" & Chr(10)
            montador = montador & "<td valign='top'>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navega_sup/ind_nativo.gif'></td>" & Chr(10)
            montador = montador & "<td width='130px' align='left'><a href='recadoZoya.aspx'>Recados</a></td>" & Chr(10)
            montador = montador & "</tr>" & Chr(10)

            montador = montador & "<tr>" & Chr(10)
            montador = montador & "<td valign='top'>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navega_sup/ind_nativo.gif'></td>" & Chr(10)
            montador = montador & "<td width='130px' align='left'><a href='depoimentoZoya.aspx'>Comentários</a></td>" & Chr(10)
            montador = montador & "</tr>" & Chr(10)

            montador = montador & "<tr>" & Chr(10)
            montador = montador & "<td valign='top'>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navega_sup/ind_nativo.gif'></td>" & Chr(10)
            montador = montador & "<td width='130px' align='left'><a href='pesquisaZoya.aspx'>Pesquisa</a></td>" & Chr(10)
            montador = montador & "</tr>" & Chr(10)

            montador = montador & "<tr>" & Chr(10)
            montador = montador & "<td valign='top'>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navega_sup/ind_nativo.gif'></td>" & Chr(10)
            montador = montador & "<td width='130px' align='left'><a href='convidadosZoya.aspx'>Convidados</a></td>" & Chr(10)
            montador = montador & "</tr>" & Chr(10)

            montador = montador & "<tr>" & Chr(10)
            montador = montador & "<td valign='top'>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navega_sup/ind_nativo.gif'></td>" & Chr(10)
            montador = montador & "<td width='130px' align='left'><a href='solicitacaoZoya.aspx'>Solicitações</a></td>" & Chr(10)
            montador = montador & "</tr>" & Chr(10)

            montador = montador & "<tr>" & Chr(10)
            montador = montador & "<td valign='top'>&nbsp;</td>" & Chr(10)
            montador = montador & "<td>&nbsp;</td>" & Chr(10)
            montador = montador & "</tr>" & Chr(10)

            montador = montador & "<tr>" & Chr(10)
            montador = montador & "<td valign='top'>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navega_sup/ind_nativo.gif'></td>" & Chr(10)
            montador = montador & "<td width='130px' align='left'><a href='statusZoya.aspx'>Status do Profile</a></td>" & Chr(10)
            montador = montador & "</tr>" & Chr(10)

            montador = montador & "<tr>" & Chr(10)
            montador = montador & "<td valign='top'>&nbsp;</td>" & Chr(10)
            montador = montador & "<td>&nbsp;</td>" & Chr(10)
            montador = montador & "</tr>" & Chr(10)

            montador = montador & "<tr>" & Chr(10)
            montador = montador & "<td bgcolor='#FF0000'>" & Chr(10)
            montador = montador & "</td>" & Chr(10)
            montador = montador & "<td bgcolor='#808080'><img border='0' src='/images/layout/navega_sup/1px.gif'></td>" & Chr(10)
            montador = montador & "</tr>" & Chr(10)

            montador = montador & "<tr>" & Chr(10)
            montador = montador & "<td valign='top'>&nbsp;</td>" & Chr(10)
            montador = montador & "<td>&nbsp;</td>" & Chr(10)
            montador = montador & "</tr>" & Chr(10)

            montador = montador & "<tr>" & Chr(10)
            montador = montador & "<td valign='top'>" & Chr(10)
            montador = montador & "<img border='0' src='/images/layout/navega_sup/ind_nativo.gif'></td>" & Chr(10)
            montador = montador & "<td width='130px' align='left'><a href='Default.aspx'>Voltar (Home)</a></td>" & Chr(10)
            montador = montador & "</tr>" & Chr(10)

            montador = montador & "</table>" & Chr(10)

            htmlZoya.Text = montador

        Else

            htmlZoya.Text = ""

        End If
    End Sub
End Class
