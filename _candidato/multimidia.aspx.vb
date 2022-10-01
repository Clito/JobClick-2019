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


Partial Class _candidato_multimidia
    Inherits System.Web.UI.Page

    'Dim caminho As String = "F:\WEBINETPUB\wwwroot_jobclick_foto" ' HOMOLOGAÇÃO
    Dim caminho As String = "C:\inetpub\wwwroot_jobclick_foto" ' PRODUÇÃO
    Dim caminhoToSave As String = "http://foto.jobclick.com.br"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        PanelAviso.Visible = False
        CabecMultimidia.Text = "Apresentação em multimídia (YouTube)<br>"
        ConteudoMultimidia.Text = GetPaginaPrincipal(Session("idCadastroUser"))

    End Sub

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

        Try
            oConnection.Open()
            Dim dr As SqlDataReader = oCommand.ExecuteReader
            dr.Close()
            oConnection.Close()
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• Sua foto foi salva com sucesso.<br>"
            AVISOLABEL.CssClass = "msnOK"
            ImageAVISO.ImageUrl = "~/_candidato/images/buttonOK.png"
        Catch ex As Exception
            PanelAviso.Visible = True
            AVISOLABEL.Text = "• [Erro] Não foi possível salvar sua foto.<br>"
            AVISOLABEL.CssClass = "msn"
            ImageAVISO.ImageUrl = "~/_candidato/images/buttonNOK.png"
        End Try



    End Sub

    Protected Sub VaPara(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("/_candidato/multimidia.aspx")
    End Sub

    Protected Sub YouVideoUpd(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Updated, SqlDataSource3.Updated
        Response.Redirect("/_candidato/multimidia.aspx")
    End Sub

    Protected Sub YouVideoDel(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Deleted
        Response.Redirect("/_candidato/multimidia.aspx")
    End Sub

    Protected Sub YouVideoInc(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Inserted
        Response.Redirect("/_candidato/multimidia.aspx")
    End Sub

    Function GetPaginaPrincipal(ByVal idCadastroUserF As String) As String

        Dim HTML As String = ""
        Dim HTMLFoto As String = ""
        Dim Foto As String = ""
        Dim EditM As String = ""

        If idCadastroUserF <> "" Then

            Dim oReader As SqlDataReader = Nothing
            Dim oSQL As String
            Dim oConnection As SqlConnection

            oConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
            Dim oCommand As SqlCommand

            oSQL = "SELECT idMultimidia, idCadastroUser, url, dsMultimídia FROM tbMultimidia WHERE (idCadastroUser = " + idCadastroUserF + ")"

            oConnection.Open()


            oCommand = New SqlCommand(oSQL, oConnection)
            oReader = oCommand.ExecuteReader()

            If oReader.HasRows() Then

                HTML = HTML & "<table width='350px' border='0' cellpadding='0' cellspacing='0'>" & Chr(10)

                Do While oReader.Read()

                    Dim idMultimidia As Integer = oReader("idMultimidia")
                    Dim idCadastroUser As String = oReader("idCadastroUser")
                    Dim url As String = Replace(oReader("url"), "/watch?v=", "/v/")
                    Dim dsMultimídia As String = oReader("dsMultimídia")

                    EditM = "<a href='multimidia.aspx?idMultimidia=" & idMultimidia & "'>Editar</a>"

                    HTML = HTML & "<tr>" & Chr(10)
                    HTML = HTML & "<td width='175px' valign='top'><object width='175' height='134'><param name='movie' value='" & url & "'></param><param name='wmode' value='transparent'></param><embed src='" & url & "' type='application/x-shockwave-flash' wmode='transparent' width='175' height='134'></embed></object></td>" & Chr(10)
                    HTML = HTML & "<td width='20px' valign='top'></td>" & Chr(10)
                    HTML = HTML & "<td width='175px' valign='top'>" & dsMultimídia & "<br><br>" & EditM & "</td>" & Chr(10)
                    HTML = HTML & "</tr>" & Chr(10)
                    HTML = HTML & "<tr>" & Chr(10)
                    HTML = HTML & "<td><img border='0' src='/images/20px.gif' width='20' height='20'></td>" & Chr(10)
                    HTML = HTML & "<td width='20px' valign='top'></td>" & Chr(10)
                    HTML = HTML & "<td><img border='0' src='/images/20px.gif' width='20' height='20'></td>" & Chr(10)
                    HTML = HTML & "</tr>" & Chr(10)

                Loop

                HTML = HTML & "</table>" & Chr(10)

            End If

            oReader.Close()
            oConnection.Close()


            REM ** *****************************************************************************
            REM ** FOTO DO CANDIDATO
            REM ** *****************************************************************************

            oSQL = "SELECT foto FROM tbCadastroUser WHERE (idCadastroUser = " + Session("idCadastroUser") + ")"

            oConnection.Open()

            oCommand = New SqlCommand(oSQL, oConnection)
            oReader = oCommand.ExecuteReader()

            If oReader.HasRows() Then

                oReader.Read()

                Try

                    If Not oReader("foto") Is DBNull.Value Then
                        ImageCandidato.ImageUrl = oReader("foto")
                    Else
                        ImageCandidato.ImageUrl = "~/images/candidato/padraoC.gif"
                    End If

                Catch ex As Exception

                End Try

            Else

                ImageCandidato.ImageUrl = "~/images/candidato/padraoC.gif"

            End If


            oReader.Close()
            oConnection.Close()

        Else

            Response.Redirect("/_candidato/cadastro.aspx")

        End If

        GetPaginaPrincipal = HTML

    End Function

    Protected Sub SqlDataSource1_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Updating
        e.Command.Parameters("@dsMultimídia").Value = Replace(CType(FormView1.FindControl("dsMultimídiaTextBox"), TextBox).Text, Chr(10), "<br>")
    End Sub

    Protected Sub SqlDataSource1_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource1.Inserting
        e.Command.Parameters("@dsMultimídia").Value = Replace(CType(FormView1.FindControl("dsMultimídiaTextBox"), TextBox).Text, Chr(10), "<br>")
    End Sub

    Protected Sub dsMultimídiaTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(FormView1.FindControl("dsMultimídiaTextBox"), TextBox).Text = Replace(CType(FormView1.FindControl("dsMultimídiaTextBox"), TextBox).Text, "<br>", "")
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


    Protected Sub LinkButtonENVIARFOTO_Click(sender As Object, e As System.EventArgs) Handles LinkButtonENVIARFOTO.Click
        Dim imgNewSave As Byte()
        imgNewSave = imageResize.SaveFromStream(180, FileUpload1.PostedFile.InputStream, Session("idCadastroUser"), "\_candidato\foto\", caminho)

        AtualizaFoto(Session("idCadastroUser"), caminhoToSave & String.Format("{0}/{1}.jpg", "/_candidato/foto", Session("idCadastroUser")))

        GetPaginaPrincipal(Session("idCadastroUser"))
    End Sub
End Class
