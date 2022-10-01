Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.IO
Imports System.Drawing.Drawing2D

Partial Class resizeImage
    Inherits System.Web.UI.Page


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

End Class
