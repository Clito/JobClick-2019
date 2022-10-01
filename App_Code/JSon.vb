Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Text
Imports System.Runtime.Serialization.Json
Imports System.Runtime.Serialization
Imports System.IO

Namespace Utilitarios
    Public Class JSon
        Private Sub New()
        End Sub

        Public Shared Function ToJson(Of T)(obj As T) As String
            Dim stream As New MemoryStream

            Using stream
                Dim serializer As New DataContractJsonSerializer(GetType(T))
                serializer.WriteObject(stream, obj)
            End Using

            Return Encoding.UTF8.GetString(stream.ToArray())
        End Function


        Public Shared Function FromJson(Of T)(json As String) As T
            Dim obj As T

            Try
                Using stream As New MemoryStream(Encoding.UTF8.GetBytes(json))
                    Dim serializer As New DataContractJsonSerializer(GetType(T))
                    obj = DirectCast(serializer.ReadObject(stream), T)
                End Using
            Catch
                obj = Nothing
            End Try

            Return obj
        End Function
    End Class
End Namespace


