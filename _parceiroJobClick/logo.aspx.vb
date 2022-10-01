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

Partial Class _parceiroJobClick_logo
    Inherits System.Web.UI.Page

    'Dim caminho As String = "C:\inetpub\_APLICACAO_JOBCLICK\wwwroot_jobclick_portal\images\buscador" ' HOMOLOGAÇÃO
    'Dim caminho As String = "C:\inetpub\wwwroot_jobclick_portal_alpha\images\buscador" ' ALPHA
    Dim caminho As String = "D:\inetpub\wwwroot_jobclick_portal\images\buscador" ' PRODUÇÃO
    Dim caminhoToSave As String = "http://www.jobclick.com.br"


    Protected Sub LinkButtonENVIAR_Click(sender As Object, e As EventArgs) Handles LinkButtonENVIAR.Click
        If FileUploadLOGO.HasFile Then
            Dim bValido As Boolean = False

            Dim sFileName As String = FileUploadLOGO.FileName

            Dim fileExtension As String = System.IO.Path.GetExtension(sFileName).ToLower()

            If fileExtension = ".png" Then
                bValido = True
            End If


            If bValido Then
                FileUploadLOGO.SaveAs(caminho & "\" & Session("idCadastroEmpresa") & ".png")
                AVISOLABEL.Text = "O arquivo selecionado foi enviado com sucesso!"
                ImageAVISO.ImageUrl = "~/_parceiroJobClick/images/ok.jpg"
                PanelAvisoSucesso.Visible = True
                Dim myEmailProspect As New email
                Dim HTML_Comercial As String = ""
                HTML_Comercial = HTML_Comercial & "Foi utilizado o sistema JobClick para subir uma nova logomarca.<br />" & Chr(10)
                myEmailProspect.EnviamensagemSQL(HTML_Comercial, "Logomarca nova no painel de vagas", "helpdesk@jobclick.com.br", "Nova logomarca foi publicada via sistema JobClick.")
            Else
                AVISOLABEL.Text = "O arquivo selecionado não é válido"
                ImageAVISO.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
                PanelAvisoSucesso.Visible = True
            End If
        Else
            AVISOLABEL.Text = "Nenhum arquivo selecionado"
            ImageAVISO.ImageUrl = "~/_parceiroJobClick/images/erro.jpg"
            PanelAvisoSucesso.Visible = True
        End If
        ATUALIZALOGO(Session("idCadastroEmpresa"), "" & String.Format("{0}{1}.png", "", Session("idCadastroEmpresa")))
    End Sub

    Sub ATUALIZALOGO(idCadastroEmpresa As Int32, CAMINHO As String)

        Dim oReader As SqlDataReader = Nothing
        Dim oConnection As SqlConnection

        oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
        Dim oCommand As SqlCommand

        Dim prm As SqlParameter

        oCommand = New SqlCommand("_USP_AD_LOGO_EMPRESA", oConnection)
        oCommand.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idcadastroEmpresa", SqlDbType.Int, 8)
        prm.Direction = ParameterDirection.Input
        oCommand.Parameters.Add(prm)

        oCommand.Parameters("@idcadastroEmpresa").Value = idCadastroEmpresa


        prm = New SqlParameter("@URLlogo", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        oCommand.Parameters.Add(prm)

        oCommand.Parameters("@URLlogo").Value = CAMINHO

        oConnection.Open()
        Dim dr As SqlDataReader = oCommand.ExecuteReader
        dr.Close()
        oConnection.Close()

        GridViewLOGO.DataBind()

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


End Class
