Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports System.Data.SqlClient.SqlDataAdapter
Imports System.DBNull
Imports analyticsMask
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.Services
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization



Partial Class Vagas
    Inherits System.Web.UI.Page

    Dim A As Int32 = 0

    Sub Page_PreInit(ByVal sender As Object, ByVal e As EventArgs) _
        Handles Me.PreInit

        Dim p As New userJobClick

        If (UserLogado() = True) And (p.GetURL(Session("idUser")) = "/_candidato") Then
            Me.MasterPageFile = "~/_candidato/CandidatoPageJobClick.master"
        Else
            Me.MasterPageFile = "~/MasterPageJobClick.master"
        End If

    End Sub

    Public Function PesquisaTerm() As String
        If Request.Form("pesquisa") = "" Then
            Return Request.QueryString("pesquisa")
        Else
            Return Request.Form("pesquisa")
        End If
    End Function

    Public Function UserLogado() As String
        If Session("idUser") = 0 Then
            Return False
        Else
            Return True
        End If
    End Function

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Session("ip") <> "::1" Then
            lipClient.Text = Session("ip")
        Else
            lipClient.Text = "186.214.102.139"
        End If

        Dim LocUsuario As analyticsMask = New analyticsMask
        LocUsuario = analytics.analyticsRegion(lipClient.Text)

        ipLabel.Text = LocUsuario.IPRes
        CidadeLabel.Text = LocUsuario.City
        EstadoLabel.Text = LocUsuario.RegionName
        UFLabel.Text = LocUsuario.RegionCode
        PaisLabel.Text = LocUsuario.CountryCode

        If Not IsPostBack Then

            REM FAZ A LEITURA DOS ANÚNCIOS
            JsonLabel.Text = JsonLabel.Text & "{""employees"":["

            Dim ds As DataSet
            ds = adServiceDS.GetAD(lLiberaContagem.Value, CidadeLabel.Text, EstadoLabel.Text, PaisLabel.Text, lpesquisaOnServer.Value)

            DataListAD.DataSource = ds
            DataListAD.DataBind()

            lpesquisaOnServer.Value = " "

        End If

        lpesquisaOnServer.Value = " "
        lLiberaContagem.Value = "1"

    End Sub

    Protected Sub DataListAD_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles DataListAD.ItemDataBound

        Dim myHyperlink As New HyperLink
        Dim myidAD As New Label
        Dim mynomeAD As New Label
        Dim mydsVaga As New Label
        Dim mychamadaVaga As New Label
        Dim myURLempresa As New Label
        Dim myparaRegiao As New Label
        Dim mycargoRelacionado As New Label
        Dim mylongitude As New Label
        Dim mylatitude As New Label

        myHyperlink = CType(e.Item.FindControl("HyperLinkAD"), HyperLink)
        myidAD = CType(e.Item.FindControl("idADLabel"), Label)
        myHyperlink.Attributes.Add("onClick", "onClickLink(" & A & ", " & myidAD.Text & ");")

        mynomeAD = CType(e.Item.FindControl("nomeADLabel"), Label)
        mydsVaga = CType(e.Item.FindControl("dsVagaLabel"), Label)
        mychamadaVaga = CType(e.Item.FindControl("chamadaVagaLabel"), Label)
        myURLempresa = CType(e.Item.FindControl("URLempresaLabel"), Label)
        myparaRegiao = CType(e.Item.FindControl("paraRegiaoLabel"), Label)
        mycargoRelacionado = CType(e.Item.FindControl("cargoRelacionadoLabel"), Label)
        mylatitude = CType(e.Item.FindControl("latitudeLabel"), Label)
        mylongitude = CType(e.Item.FindControl("longitudeLabel"), Label)

        myHyperlink.Text = mynomeAD.Text


        A = A + 1

        REM MONTA O PREVIEW DOS ANÚNCIOS

        JsonLabel.Text = JsonLabel.Text & "{""nomeAD"":""" & mynomeAD.Text & ""","
        JsonLabel.Text = JsonLabel.Text & """idAD"":""" & myidAD.Text & ""","
        JsonLabel.Text = JsonLabel.Text & """URLempresa"":""" & myURLempresa.Text & ""","
        JsonLabel.Text = JsonLabel.Text & """chamadaVaga"":""" & mychamadaVaga.Text & ""","
        JsonLabel.Text = JsonLabel.Text & """paraRegiao"":""" & myparaRegiao.Text & ""","
        JsonLabel.Text = JsonLabel.Text & """latitude"":""" & mylatitude.Text & ""","
        JsonLabel.Text = JsonLabel.Text & """longitude"":""" & mylongitude.Text & ""","
        JsonLabel.Text = JsonLabel.Text & """cargoRelacionado"":""" & mycargoRelacionado.Text & ""","
        JsonLabel.Text = JsonLabel.Text & """Info"":""" & mydsVaga.Text & """},"

    End Sub

    Protected Sub DataListAD_Load(sender As Object, e As EventArgs) Handles DataListAD.Load
        If Not IsPostBack Then
            Dim comprimetoString As Int32 = Len(JsonLabel.Text)
            JsonLabel.Text = Left(JsonLabel.Text, comprimetoString - 1)
            JsonLabel.Text = JsonLabel.Text & "]}"
        End If
    End Sub

    Protected Sub LinkButton_PesquisaTodas_Click(sender As Object, e As EventArgs) Handles LinkButton_PesquisaTodas.Click
        Response.Redirect("~/_anonimo/sponsoredAD.aspx")
        DropDownList_Estado.SelectedItem.Text = "-- Todos --"
    End Sub
End Class
