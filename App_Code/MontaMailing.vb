Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Nullable

Public Class MontaMailing

    Public Shared Function MontaMailingForm(ByVal idClient As Int32, ByVal idProject As Int32, ByVal idGroup As Int32) As MontaMailingMask

        Dim en As MontaMailingMask = New MontaMailingMask

        Dim cn As SqlConnection
        Dim cmd As SqlCommand
        Dim prm As SqlParameter
        Dim rs As Boolean = False

        cn = New SqlConnection(ConfigurationManager.ConnectionStrings("SMSCenterConnectionString").ConnectionString)

        cmd = New SqlCommand("SMSAssist.spGroup_Select", cn)
        cmd.CommandType = CommandType.StoredProcedure

        prm = New SqlParameter("@idClient", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idProject", SqlDbType.Int, 4)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        prm = New SqlParameter("@idGroup", SqlDbType.VarChar, 255)
        prm.Direction = ParameterDirection.Input
        cmd.Parameters.Add(prm)

        cmd.Parameters("@idClient").Value = idClient
        cmd.Parameters("@idProject").Value = idProject
        cmd.Parameters("@idGroup").Value = idGroup

        cn.Open()

        Dim dr As SqlDataReader = cmd.ExecuteReader
        dr.Read()

        en.IncstrNameGroup = dr("strNameGroup")
        en.IncDynamicFieldTag1 = dr("DynamicFieldTag1")
        en.IncDynamicFieldTag2 = dr("DynamicFieldTag2")
        en.IncDynamicFieldTag3 = dr("DynamicFieldTag3")
        en.IncDynamicFieldTag4 = dr("DynamicFieldTag4")
        en.IncDynamicFieldTag5 = dr("DynamicFieldTag5")
        en.IncDynamicFieldTag6 = dr("DynamicFieldTag6")
        en.IncDynamicFieldTag7 = dr("DynamicFieldTag7")
        en.IncDynamicFieldTag8 = dr("DynamicFieldTag8")
        en.IncDynamicFieldTag9 = dr("DynamicFieldTag9")
        en.IncDynamicFieldTag10 = dr("DynamicFieldTag10")

        dr.Close()
        cn.Close()

        Return en

    End Function

End Class
