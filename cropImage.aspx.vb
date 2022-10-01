Imports System.IO
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Drawing.Drawing2D
Partial Class cropImage
    Inherits System.Web.UI.Page

    Dim pasta As String = HttpContext.Current.Request.PhysicalApplicationPath + "images\"

    Protected Sub ButtonCrop_Click(sender As Object, e As System.EventArgs) Handles RecortarButton.Click

        Dim nomeArquivo As String = Session("arquivo").ToString()
        LabelArquivo.Text = "F:\WEBINETPUB\wwwroot_jobclick_foto\" & String.Format("{0}\{1}.jpg", "teste", "teste1")

        Dim eixoX As Integer = Convert.ToInt32(XHiddenField.Value)
        Dim eixoY As Integer = Convert.ToInt32(YHiddenField.Value)
        Dim largura As Integer = Convert.ToInt32(WHiddenField.Value)
        Dim altura As Integer = Convert.ToInt32(HHiddenField.Value)


        Dim recorte As Byte() = Recortar(pasta & nomeArquivo, largura, altura, eixoX, eixoY)

        Using ms As New MemoryStream(recorte, 0, recorte.Length)
            ms.Write(recorte, 0, recorte.Length)

            Using imagemRecortada As System.Drawing.Image = System.Drawing.Image.FromStream(ms, True)
                Dim salvarEm As String = pasta & "crop/" & nomeArquivo
                imagemRecortada.Save(salvarEm, imagemRecortada.RawFormat)
                ImagemOriginalPanel.Visible = False
                ImagemRecortadaPanel.Visible = True
                ImagemRecortadaImage.ImageUrl = "images/crop/" & nomeArquivo
            End Using
        End Using
    End Sub

    Protected Sub ButtonEnviar_Click(sender As Object, e As System.EventArgs) Handles UploadButton.Click
        Dim extensaoPermitida As Boolean = False
        Dim arquivoGravado As Boolean = False

        If ArquivoFileUpload.HasFile Then
            Dim extensaoArquivo As String = Path.GetExtension(ArquivoFileUpload.FileName)

            Dim extensoesPermitidas As String() = {".png", ".jpg", ".gif", ".jpeg"}

            For i As Integer = 0 To extensoesPermitidas.Length - 1
                If extensoesPermitidas(i) = extensaoArquivo Then
                    extensaoPermitida = True
                End If
            Next

            If extensaoPermitida Then
                Try
                    ArquivoFileUpload.PostedFile.SaveAs(pasta + ArquivoFileUpload.FileName)
                    arquivoGravado = True
                Catch ex As Exception
                    ErroLabel.Text = "Ocorreu um problema na tentativa de salvar o arquivo." & ex.ToString()
                    ErroLabel.Visible = True
                    arquivoGravado = False
                End Try
            Else
                ErroLabel.Text = String.Format("Tipo de arquivo inválido. Tipo aceitos {0}.", extensoesPermitidas.ToString())
                ErroLabel.Visible = True
            End If

            If arquivoGravado Then
                ImagemOriginalPanel.Visible = True
                OriginalImage.ImageUrl = "images/" + ArquivoFileUpload.FileName
                Session("arquivo") = ArquivoFileUpload.FileName
            End If

        End If
    End Sub

    Private Function Recortar(nomeAbsolutoArquivo As String, largura As Integer, altura As Integer, eixoX As Integer, eixoY As Integer) As Byte()
        Try
            Using imagemOriginal As System.Drawing.Image = System.Drawing.Image.FromFile(nomeAbsolutoArquivo)
                Using bitmap As System.Drawing.Bitmap = New System.Drawing.Bitmap(largura, altura)
                    bitmap.SetResolution(imagemOriginal.HorizontalResolution, imagemOriginal.VerticalResolution)

                    Using grafico As System.Drawing.Graphics = System.Drawing.Graphics.FromImage(bitmap)
                        grafico.SmoothingMode = SmoothingMode.AntiAlias
                        grafico.InterpolationMode = InterpolationMode.HighQualityBicubic
                        grafico.PixelOffsetMode = PixelOffsetMode.HighQuality
                        grafico.DrawImage(imagemOriginal, New System.Drawing.Rectangle(0, 0, largura, altura), eixoX, eixoY, largura, altura, System.Drawing.GraphicsUnit.Pixel)
                        Dim ms As New MemoryStream()
                        bitmap.Save(ms, imagemOriginal.RawFormat)
                        Return ms.GetBuffer()
                    End Using
                End Using
            End Using
        Catch ex As Exception

            Throw ex
        End Try
    End Function

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
        Public Shared Function SaveFromStream(MaxSideSize As Integer, Buffer As Stream, fileName As String, filePath As String) As Byte()
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
                Dim newFileName As String = String.Format(System.Web.HttpContext.Current.Server.MapPath("~/{0}/{1}.jpg"), filePath, fileName)
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

    Protected Sub ButtonResize_Click(sender As Object, e As System.EventArgs) Handles ButtonResize.Click
        Dim imgNewSave As Byte()
        imgNewSave = imageResize.SaveFromStream(180, ArquivoFileUpload.PostedFile.InputStream, "newPicFromResize", "images/resize/")
    End Sub

End Class
