Imports System.Data.SqlClient
Imports System.Web.Script.Serialization

Partial Class services_PesquisaCurriculo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim idUser As String = Request.QueryString("idUser")

        Response.ContentType = "application/json"
        Response.Write(PesquisaCurriculo(
                                      idUser
                                    ))


    End Sub

    Public Class ResultPesquisaCurriculo

#Region "Campos"
        Public idCurriculo As String
        Public dsCurriculo As String

#End Region

        Public Sub New(
                            idCurriculo As String, _
                            dsCurriculo As String
                        )

            Me.idCurriculo = idCurriculo
            Me.dsCurriculo = dsCurriculo

        End Sub

    End Class

    Public Function PesquisaCurriculo(ByVal idUser As String) As String
        Dim result As String = ""

        Dim jss As New JavaScriptSerializer()
        Dim sbRes As New StringBuilder()
        Dim ResultSet As New Hashtable


        Dim lstCurriculo As New List(Of ResultPesquisaCurriculo)()

        Dim i As Int32
        Dim myConnection As SqlConnection
        Dim myCommand As SqlCommand
        Dim dr As SqlDataReader
        Try
            myConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("jobclickDB").ConnectionString)
            myConnection.Open()
            myCommand = New SqlCommand("select idcurriculo, dscurriculo + Case when publicar = 0 then ' (Não Disponível para Recrutadores)' else '' end as dscurriculo from tbCurriculo C inner join tbCadastroUser CU ON C.idCadastroUser = CU.idCadastroUser Where idUser = '" & idUser & "'", myConnection)
            dr = myCommand.ExecuteReader

            Do
                While dr.Read()
                    lstCurriculo.Add(New ResultPesquisaCurriculo(
                                                                If(IsDBNull(dr("idcurriculo")), "", dr("idcurriculo")),
                                                                If(IsDBNull(dr("dsCurriculo")), "", dr("dsCurriculo"))
                                                            ))
                    i += 1

                End While
            Loop While dr.NextResult()

            If i > 0 Then
                ResultSet.Add("ResultStatus", True)
                ResultSet.Add("ResultSet", lstCurriculo)
            Else
                ResultSet.Add("ResultStatus", False)
                ResultSet.Add("ResultStatus_ErrorMessage", "Sem Curriculos para Carregar")
            End If

            dr.Close()
            myConnection.Close()
        Catch e As Exception
            ResultSet.Add("ResultStatus", False)
            ResultSet.Add("ResultStatus_ErrorMessage", "Erro - " & e.Message.ToString)
        End Try

        jss.Serialize(ResultSet, sbRes)

        Return sbRes.ToString()
    End Function
End Class
