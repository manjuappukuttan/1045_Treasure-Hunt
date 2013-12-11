Imports System.Data.OleDb

Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.WebRequestMethods
Partial Class level
    Inherits System.Web.UI.Page
    Dim total As Integer = 0
    Dim provider As String
    Dim dataFile As String
    Dim connString As String
    Dim myConnection As OleDbConnection = New OleDbConnection
    Dim dr As OleDbDataReader
    Dim cmd As OleDbCommand
    Public maxvalue As Integer


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Static count As Integer = 1
        Response.Cookies("rescook").Value = count
        Response.Cookies("topic").Value = "continents"
        Response.Cookies("total").Value = 0
        maxvalue = getvalue("continents")
        generate(maxvalue)
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
       
        Static count As Integer = 1
        Response.Cookies("rescook").Value = count
        Response.Cookies("topic").Value = "countries"
        Response.Cookies("total").Value = 0
        maxvalue = getvalue("countries")
        generate(maxvalue)
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
       
        Static count As Integer = 1
        Response.Cookies("rescook").Value = count
        Response.Cookies("topic").Value = "capitals"
        Response.Cookies("total").Value = 0
        maxvalue = getvalue("capitals")
        generate(maxvalue)
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        
        Static count As Integer = 1
        Response.Cookies("rescook").Value = count
        Response.Cookies("topic").Value = "cities"
        Response.Cookies("total").Value = 0
        maxvalue = getvalue("cities")
        generate(maxvalue)
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click
      
        Static count As Integer = 1
        Response.Cookies("rescook").Value = count
        Response.Cookies("topic").Value = "monuments"
        Response.Cookies("total").Value = 0
        maxvalue = getvalue("monuments")
        generate(maxvalue)
        Response.Redirect("Default.aspx")
    End Sub
  
    Public Sub generate(ByVal size As Integer)
        Dim arr(size) As Integer
        For i = 1 To size
            arr(i) = i
        Next i

        Shuffle(arr)

        Page.Session("myarray") = arr
    End Sub

    Public Sub Shuffle(ByRef data() As Integer)
        Dim x, swap As Integer
        Dim r As Random = New Random()
        For i As Integer = 1 To data.GetUpperBound(0)
            x = r.Next(1, i)
            swap = data(x)
            data(x) = data(i)
            data(i) = swap
        Next i
    End Sub
    Public Function getvalue(ByRef topic As String) As Integer

        Dim mx As Integer
        Try
            provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="
            dataFile = Server.MapPath("db/th.accdb")
            connString = provider & dataFile
            myConnection.ConnectionString = connString
            myConnection.Open()
            Dim cmd As String = "select MAX(ID) as temp from " & topic
            Dim dbCmd As OleDbCommand = New OleDbCommand(cmd, myConnection)
            dr = dbCmd.ExecuteReader


            While dr.Read()
                mx = dr.GetInt32(dr.GetOrdinal("temp"))
            End While
            dbCmd.Dispose()
            myConnection.Close()

        Catch ex As Exception
            Response.Redirect("admin.aspx")
        End Try
        Return mx
    End Function
End Class
