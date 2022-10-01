Imports System
Imports System.Text
Imports System.IO
Imports System.Security.Cryptography

Public Class criptografia

    Private Shared chave As Byte() = {}
    Private Shared iv As Byte() = {12, 34, 56, 78, 90, 102, 114, 126}

    Public Sub New()

    End Sub
    Public Shared Function Criptografar(ByVal valor As String, ByVal chaveCriptografia As String) As String

        Dim chaveCriptografiaREs As String = HttpUtility.UrlDecode(chaveCriptografia)
        Dim valorRes As String = HttpUtility.UrlDecode(valor)

        Dim des As DESCryptoServiceProvider
        Dim ms As MemoryStream
        Dim cs As CryptoStream
        Dim input As Byte()

        Try
            des = New DESCryptoServiceProvider()
            ms = New MemoryStream()
            input = Encoding.UTF8.GetBytes(valorRes)
            chave = Encoding.UTF8.GetBytes(chaveCriptografiaREs.Substring(0, 8))

            cs = New CryptoStream(ms, des.CreateEncryptor(chave, iv), CryptoStreamMode.Write)
            cs.Write(input, 0, input.Length)
            cs.FlushFinalBlock()

            Return Convert.ToBase64String(ms.ToArray())
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Shared Function Descriptografar(ByVal valor As String, ByVal chaveCriptografia As String) As String

        Dim chaveCriptografiaREs As String = HttpUtility.UrlDecode(chaveCriptografia)
        Dim valorRes As String = HttpUtility.UrlDecode(valor)

        Dim des As DESCryptoServiceProvider
        Dim ms As MemoryStream
        Dim cs As CryptoStream
        Dim input As Byte()

        Try
            des = New DESCryptoServiceProvider()
            ms = New MemoryStream()

            input = New Byte(valor.Length - 1) {}
            input = Convert.FromBase64String(valorRes.Replace(" ", "+"))

            chave = Encoding.UTF8.GetBytes(chaveCriptografiaREs.Substring(0, 8))

            cs = New CryptoStream(ms, des.CreateDecryptor(chave, iv), CryptoStreamMode.Write)
            cs.Write(input, 0, input.Length)
            cs.FlushFinalBlock()

            Return Encoding.UTF8.GetString(ms.ToArray())
        Catch ex As Exception
            Throw ex
        End Try

    End Function

    Public Shared Function CripSenha(ByVal strSenha As String) As String

        Dim nLetra As String
        Dim cSenha As String = ""
        Dim L As Integer

        strSenha = Trim(strSenha)
        For L = 1 To Len(strSenha)
            nLetra = Asc(Mid(strSenha, L, 1))
            nLetra = Chr(Trim(Str(Val(nLetra) Xor (L * 2))))
            cSenha = cSenha & nLetra
        Next

        Return cSenha

    End Function

End Class
