Imports ReplaceForm
Imports System.Web.HttpRuntime
Imports System.Web.HttpException
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Drawing.Drawing2D

Partial Class _candidato_administraCV
    Inherits System.Web.UI.Page

    'Dim caminho As String = "F:\WEBINETPUB\wwwroot_jobclick_foto" ' HOMOLOGAÇÃO
    Dim caminho As String = "D:\inetpub\wwwroot_jobclick_foto" ' PRODUÇÃO
    Dim caminhoToSave As String = "http://foto.jobclick.com.br"

    Protected Sub resumoTextBox_DataBinding(sender As Object, e As System.EventArgs)
        Try
            Dim myReplaceForm As New ReplaceForm
            Dim myresumo As String
            myresumo = myReplaceForm.ReplaceIn(CType(FormViewCV.FindControl("resumoTextBox"), TextBox).Text)
            CType(FormViewCV.FindControl("resumoTextBox"), TextBox).Text = myresumo
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub SqlAdministraCVFORM_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlAdministraCVFORM.Updating
        Try

            Dim myReplaceForm As New ReplaceForm
            Dim myresumo As String


            myresumo = myReplaceForm.ReplaceIn(CType(FormViewCV.FindControl("resumoTextBox"), TextBox).Text)
            e.Command.Parameters("@resumo").Value = Left(myresumo, 1200)
            e.Command.Parameters("@uf").Value = CType(FormViewCV.FindControl("DropDownListUF"), DropDownList).SelectedValue
            e.Command.Parameters("@sexo").Value = CType(FormViewCV.FindControl("RadioButtonListSexo"), RadioButtonList).SelectedValue
            e.Command.Parameters("@estadocivil").Value = CType(FormViewCV.FindControl("RadioButtonListEstadoCivil"), RadioButtonList).SelectedValue
            e.Command.Parameters("@nrdependente").Value = CType(FormViewCV.FindControl("DropDownListDependentes"), DropDownList).SelectedValue
            e.Command.Parameters("@disponibilidade").Value = CType(FormViewCV.FindControl("RadioButtonListDisponibilidade"), RadioButtonList).SelectedValue
            e.Command.Parameters("@localPreferencia").Value = CType(FormViewCV.FindControl("DropDownListPreferencia"), DropDownList).SelectedValue

            Dim valorRemAtual_TESTE As String = CType(FormViewCV.FindControl("valorRemAtualTextBox"), TextBox).Text
            Dim valorRemPretendida_TESTE As String = CType(FormViewCV.FindControl("valorRemPretendidaTextBox"), TextBox).Text


            If Not myIsNumeric(valorRemPretendida_TESTE) Then
                PanelAviso.Visible = True
                AVISOLABEL.Text = AVISOLABEL.Text & "• [Salário desejado] você está informando valor fora do permitido, informe apenas números.<br>"
                AVISOLABEL.CssClass = "msn"
                ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"
                e.Command.Parameters("@valorRemPretendida").Value = 0
                e.Cancel = True
            Else
                e.Command.Parameters("@valorRemPretendida").Value = CType(FormViewCV.FindControl("valorRemPretendidaTextBox"), TextBox).Text
            End If

            If Not myIsNumeric(valorRemAtual_TESTE) Then
                PanelAviso.Visible = True
                AVISOLABEL.Text = AVISOLABEL.Text & "• [Último salário] você está informando valor fora do permitido, informe apenas números.<br>"
                AVISOLABEL.CssClass = "msn"
                ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"
                e.Command.Parameters("@valorRemAtual").Value = 0
                e.Cancel = True
            Else
                e.Command.Parameters("@valorRemAtual").Value = CType(FormViewCV.FindControl("valorRemAtualTextBox"), TextBox).Text
            End If

            If Not myIsDate(CType(FormViewCV.FindControl("nascimentoTextBox"), TextBox).Text) Then
                PanelAviso.Visible = True
                AVISOLABEL.Text = AVISOLABEL.Text & "• [Nascimento] você está informando valor fora do permitido, informe uma data válida.<br>"
                AVISOLABEL.CssClass = "msn"
                ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"
                e.Cancel = True
            Else
                e.Command.Parameters("@nascimento").Value = CType(FormViewCV.FindControl("nascimentoTextBox"), TextBox).Text
            End If

        Catch ex As Exception

        End Try
    End Sub

    Private Function myIsNumeric(ByVal strVal As String) As Boolean
        Dim MyCheck As Boolean = False
        MyCheck = IsNumeric(strVal)
        Return MyCheck
    End Function

    Private Function myIsDate(strVal As String) As Boolean
        Dim MyCheck As Boolean = False
        MyCheck = IsDate(strVal)
        Return MyCheck
    End Function

    Protected Sub LinkButtonFechar_Click(sender As Object, e As System.EventArgs)
        AVISOLABEL.Text = ""
        PanelAviso.Visible = False
    End Sub

    Protected Sub FormViewCV_DataBound(sender As Object, e As System.EventArgs) Handles FormViewCV.DataBound
        Try
            CType(FormViewCV.FindControl("valorRemAtualTextBox"), TextBox).Text = CType(FormViewCV.FindControl("remuneracaoAtual"), Label).Text
            CType(FormViewCV.FindControl("valorRemPretendidaTextBox"), TextBox).Text = CType(FormViewCV.FindControl("remuneracaoPretendida"), Label).Text
            CType(FormViewCV.FindControl("nascimentoTextBox"), TextBox).Text = CType(FormViewCV.FindControl("datanascimentoLabel"), Label).Text
        Catch ex As Exception

        End Try

    End Sub

    Public Class imageResize
        Public Shared Function ResizeFromByteArray(MaxSideSize As Integer, byteArrayIn As [Byte](), fileName As String) As Byte()
            Dim byteArray As Byte() = Nothing
            ' really make this an error gif
            Dim ms As New MemoryStream(byteArrayIn)
            byteArray = imageResize.ResizeFromStream(MaxSideSize, ms, fileName)

            Return byteArray
        End Function

        ''' <summary>
        ''' converts stream to bytearray for resized image
        ''' </summary>
        ''' <param name="MaxSideSize"></param>
        ''' <param name="Buffer"></param>
        ''' <returns></returns>
        Public Shared Function ResizeFromStream(MaxSideSize As Integer, Buffer As Stream, fileName As String) As Byte()
            Dim byteArray As Byte() = Nothing
            ' really make this an error gif
            Try

                Dim bitMap As New Bitmap(Buffer)
                Dim intOldWidth As Integer = bitMap.Width
                Dim intOldHeight As Integer = bitMap.Height

                Dim intNewWidth As Integer
                Dim intNewHeight As Integer

                Dim intMaxSide As Integer

                If intOldWidth >= intOldHeight Then
                    intMaxSide = intOldWidth
                Else
                    intMaxSide = intOldHeight
                End If

                If intMaxSide > MaxSideSize Then
                    'set new width and height
                    Dim dblCoef As Double = MaxSideSize / CDbl(intMaxSide)
                    intNewWidth = Convert.ToInt32(dblCoef * intOldWidth)
                    intNewHeight = Convert.ToInt32(dblCoef * intOldHeight)
                Else
                    intNewWidth = intOldWidth
                    intNewHeight = intOldHeight
                End If

                Dim ThumbNailSize As New Size(intNewWidth, intNewHeight)
                Dim oImg As System.Drawing.Image = System.Drawing.Image.FromStream(Buffer)
                Dim oThumbNail As System.Drawing.Image = New Bitmap(ThumbNailSize.Width, ThumbNailSize.Height)

                Dim oGraphic As Graphics = Graphics.FromImage(oThumbNail)
                oGraphic.CompositingQuality = CompositingQuality.HighQuality
                oGraphic.SmoothingMode = SmoothingMode.HighQuality
                oGraphic.InterpolationMode = InterpolationMode.HighQualityBicubic
                Dim oRectangle As New Rectangle(0, 0, ThumbNailSize.Width, ThumbNailSize.Height)

                oGraphic.DrawImage(oImg, oRectangle)

                Dim ms As New MemoryStream()
                oThumbNail.Save(ms, ImageFormat.Jpeg)
                byteArray = New Byte(ms.Length - 1) {}
                ms.Position = 0
                ms.Read(byteArray, 0, Convert.ToInt32(ms.Length))

                oGraphic.Dispose()
                oImg.Dispose()
                ms.Close()
                ms.Dispose()
            Catch generatedExceptionName As Exception
                Dim newSize As Integer = MaxSideSize - 20
                Dim bitMap As New Bitmap(newSize, newSize)
                Dim g As Graphics = Graphics.FromImage(bitMap)
                g.FillRectangle(New SolidBrush(Color.Gray), New Rectangle(0, 0, newSize, newSize))

                Dim font As New Font("Courier", 8)
                Dim solidBrush As New SolidBrush(Color.Red)
                g.DrawString("Failed File", font, solidBrush, 10, 5)
                g.DrawString(fileName, font, solidBrush, 10, 50)

                Dim ms As New MemoryStream()
                bitMap.Save(ms, ImageFormat.Jpeg)
                byteArray = New Byte(ms.Length - 1) {}
                ms.Position = 0
                ms.Read(byteArray, 0, Convert.ToInt32(ms.Length))

                ms.Close()
                ms.Dispose()
                bitMap.Dispose()
                solidBrush.Dispose()
                g.Dispose()

                font.Dispose()
            End Try
            Return byteArray
        End Function

        ''' <summary>
        ''' Saves the resized image to specified file name and path as JPEG
        ''' and also returns the bytearray for any other use you may need it for
        ''' </summary>
        ''' <param name="MaxSideSize"></param>
        ''' <param name="Buffer"></param>
        ''' <param name="fileName">No Extension</param>
        ''' <param name="filePath">Examples: "images/dir1/dir2" or "images" or "images/dir1"</param>
        ''' <returns></returns>
        Public Shared Function SaveFromStream(MaxSideSize As Integer, Buffer As Stream, fileName As String, filePath As String, caminho As String) As Byte()

            Dim byteArray As Byte() = Nothing
            ' really make this an error gif
            Try

                Dim bitMap As New Bitmap(Buffer)
                Dim intOldWidth As Integer = bitMap.Width
                Dim intOldHeight As Integer = bitMap.Height

                Dim intNewWidth As Integer
                Dim intNewHeight As Integer

                Dim intMaxSide As Integer

                If intOldWidth >= intOldHeight Then
                    intMaxSide = intOldWidth
                Else
                    intMaxSide = intOldHeight
                End If

                If intMaxSide > MaxSideSize Then
                    'set new width and height
                    Dim dblCoef As Double = MaxSideSize / CDbl(intMaxSide)
                    intNewWidth = Convert.ToInt32(dblCoef * intOldWidth)
                    intNewHeight = Convert.ToInt32(dblCoef * intOldHeight)
                Else
                    intNewWidth = intOldWidth
                    intNewHeight = intOldHeight
                End If

                Dim ThumbNailSize As New Size(intNewWidth, intNewHeight)
                Dim oImg As System.Drawing.Image = System.Drawing.Image.FromStream(Buffer)
                Dim oThumbNail As System.Drawing.Image = New Bitmap(ThumbNailSize.Width, ThumbNailSize.Height)

                Dim oGraphic As Graphics = Graphics.FromImage(oThumbNail)
                oGraphic.CompositingQuality = CompositingQuality.HighQuality
                oGraphic.SmoothingMode = SmoothingMode.HighQuality
                oGraphic.InterpolationMode = InterpolationMode.HighQualityBicubic
                Dim oRectangle As New Rectangle(0, 0, ThumbNailSize.Width, ThumbNailSize.Height)

                oGraphic.DrawImage(oImg, oRectangle)

                'Save File
                'Dim newFileName As String = String.Format(System.Web.HttpContext.Current.Server.MapPath("~/{0}/{1}.jpg"), filePath, fileName)
                Dim newFileName As String = caminho & String.Format("{0}\{1}.jpg", filePath, fileName)
                oThumbNail.Save(newFileName, ImageFormat.Jpeg)

                Dim ms As New MemoryStream()
                oThumbNail.Save(ms, ImageFormat.Jpeg)
                byteArray = New Byte(ms.Length - 1) {}
                ms.Position = 0
                ms.Read(byteArray, 0, Convert.ToInt32(ms.Length))

                oGraphic.Dispose()
                oImg.Dispose()
                ms.Close()
                ms.Dispose()
            Catch generatedExceptionName As Exception
                Dim newSize As Integer = MaxSideSize - 20
                Dim bitMap As New Bitmap(newSize, newSize)
                Dim g As Graphics = Graphics.FromImage(bitMap)
                g.FillRectangle(New SolidBrush(Color.Gray), New Rectangle(0, 0, newSize, newSize))

                Dim font As New Font("Courier", 8)
                Dim solidBrush As New SolidBrush(Color.Red)
                g.DrawString("Failed To Save File or Failed File", font, solidBrush, 10, 5)
                g.DrawString(fileName, font, solidBrush, 10, 50)

                Dim ms As New MemoryStream()
                bitMap.Save(ms, ImageFormat.Jpeg)
                byteArray = New Byte(ms.Length - 1) {}
                ms.Position = 0
                ms.Read(byteArray, 0, Convert.ToInt32(ms.Length))

                ms.Close()
                ms.Dispose()
                bitMap.Dispose()
                solidBrush.Dispose()
                g.Dispose()

                font.Dispose()
            End Try
            Return byteArray
        End Function
    End Class


    Sub AtualizaFoto(ByVal IdCadastroUser As Int32, ByVal foto As String)


        Dim oReader As SqlDataReader = Nothing
        Dim oConnection As SqlConnection

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        Dim oCommand As SqlCommand

        Dim prm As SqlParameter

        oCommand = New SqlCommand("spUpdateFoto", oConnection)
        oCommand.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@IdCadastroUser", SqlDbType.Int, 8)
        prm.Direction = ParameterDirection.Input
        oCommand.Parameters.Add(prm)

        oCommand.Parameters("@IdCadastroUser").Value = IdCadastroUser


        prm = New SqlParameter("@foto", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        oCommand.Parameters.Add(prm)

        oCommand.Parameters("@foto").Value = foto


        oConnection.Open()
        Dim dr As SqlDataReader = oCommand.ExecuteReader
        dr.Close()
        oConnection.Close()

        FormViewCV.DataBind()

        Session("foto") = foto

    End Sub

    Protected Sub LinkButtonENVIAR_Click(sender As Object, e As System.EventArgs)
        Dim imgNewSave As Byte()
        imgNewSave = imageResize.SaveFromStream(180, CType(FormViewCV.FindControl("FileUploadFOTO"), FileUpload).PostedFile.InputStream, Session("idCadastroUser"), "\_candidato\foto\", caminho)

        AtualizaFoto(Session("idCadastroUser"), caminhoToSave & String.Format("{0}/{1}.jpg", "/_candidato/foto", Session("idCadastroUser")))
    End Sub


    Protected Sub PesquisaCEP_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
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

        cmd.Parameters("@CEP").Value = Replace(CType(FormViewCV.FindControl("cepTextBox"), TextBox).Text, "-", "")

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader

        If dr.HasRows() Then

            dr.Read()

            CType(FormViewCV.FindControl("enderecoTextBox"), TextBox).Text = dr("LOGRADOURO") & " " & dr("RUA") & ", "
            CType(FormViewCV.FindControl("bairroTextBox"), TextBox).Text = dr("BAIRRO")
            CType(FormViewCV.FindControl("cidadeTextBox"), TextBox).Text = dr("CIDADE")
            CType(FormViewCV.FindControl("DropDownListUF"), DropDownList).SelectedValue = dr("UF")
            CType(FormViewCV.FindControl("enderecoTextBox"), TextBox).Focus()

        Else

            CType(FormViewCV.FindControl("enderecoTextBox"), TextBox).Text = "Não encontrei o endereço...."

        End If


        dr.Close()
        cn.Close()
    End Sub

    Protected Sub SqlAdministraCVFORM_Updated(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlAdministraCVFORM.Updated
        PanelAviso.Visible = True
        AVISOLABEL.Text = "• Seus dados foram atualizados com sucesso!<br>"
        ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        AVISOLABEL.CssClass = "msnOK"

        REM ** *****************************************************************************
        REM ** ATUALIZA O CV
        REM ** *****************************************************************************
        MaintainScrollPositionOnPostBack = False

    End Sub


    REM ** *********************************************************************************************************************
    REM ** APRESENTA CV
    REM ** *********************************************************************************************************************

    Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Response.Cache.SetCacheability(HttpCacheability.NoCache)

        idCurriculoLabel.Text = Session("idcurriculo")
        PanelAviso.Visible = False
        PanelCVCandidato.Visible = False

        If Not Page.IsPostBack Then
            CType(FormViewCV.FindControl("resumoTextBox"), TextBox).Attributes.Add("onkeypress", "limitarTexto(this, contador, 1200);")
            CType(FormViewCV.FindControl("resumoTextBox"), TextBox).Attributes.Add("onkeyup", "limitarTexto(this, contador, 1200);")
        End If

    End Sub


    Protected Sub ImageButtonVejaCV_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub ImageButtonEditar_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
        AVISOLABEL.Text = ""
        PanelAviso.Visible = False
    End Sub

    Protected Sub LinkButtonMP_Click(sender As Object, e As System.EventArgs)
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub LinkButtonCANCELAR_Click(sender As Object, e As System.EventArgs)
        MaintainScrollPositionOnPostBack = False
    End Sub

    Protected Sub LinkButtonFOTO_Click(sender As Object, e As System.EventArgs)
        Try
            CType(FormViewCV.FindControl("PanelFOTO"), Panel).Visible = True
            CType(FormViewCV.FindControl("LinkButtonFECHARENVIOFOTO"), LinkButton).Visible = True
            CType(FormViewCV.FindControl("LinkButtonFOTO"), LinkButton).Visible = False

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LinkButtonFECHARENVIOFOTO_Click(sender As Object, e As System.EventArgs)
        Try
            CType(FormViewCV.FindControl("PanelFOTO"), Panel).Visible = False
            CType(FormViewCV.FindControl("LinkButtonFECHARENVIOFOTO"), LinkButton).Visible = False
            CType(FormViewCV.FindControl("LinkButtonFOTO"), LinkButton).Visible = True
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LinkButtonEditar_Click(sender As Object, e As System.EventArgs)

    End Sub

    Protected Sub LinkButtonVERCV_Click(sender As Object, e As System.EventArgs)
        REM APRESENTA CV
        MaintainScrollPositionOnPostBack = False
        PanelCVCandidato.Visible = True
    End Sub
End Class
