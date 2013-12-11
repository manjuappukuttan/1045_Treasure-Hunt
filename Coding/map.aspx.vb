Imports System.Data.OleDb

Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.WebRequestMethods
Partial Class map
    Inherits System.Web.UI.Page
    Dim provider As String
    Dim dataFile As String
    Dim connString As String
    Dim myConnection As OleDbConnection = New OleDbConnection
    Dim dr As OleDbDataReader
    Dim cmd As OleDbCommand

    Public str As String
    Public place As String = ""
    Public clue As String = ""
    Public hint1 As String = ""
    Public hint2 As String = ""
    Public hint3 As String = ""
    Public lat1 As String = ""
    Public lat2 As String = ""
    Public zz As String = ""
    Dim count As Integer
    Public tt As Integer
    Dim topic As String = ""


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            topic = Request.Cookies("topic").Value
            count = Request.Cookies("rescook1").Value

        Catch ex As Exception
            MsgBox("this is summa error")
        End Try

        Try


            provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="

            dataFile = Server.MapPath("db/th.accdb")

            connString = provider & dataFile
            myConnection.ConnectionString = connString
            myConnection.Open()

            Dim str As String


            str = "SELECT * FROM " & topic & " where ID= " & count



            Dim cmd As OleDbCommand = New OleDbCommand(str, myConnection)

            dr = cmd.ExecuteReader


            While dr.Read()

                place = dr.GetString(1)
                clue = dr.GetString(2)
                hint1 = dr.GetString(3)
                hint2 = dr.GetString(4)
                hint3 = dr.GetString(5)
                lat1 = dr.GetString(6)
                lat2 = dr.GetString(7)
                zz = dr.GetInt32(8)

            End While

                dr.Close()
            myConnection.Close()

            If topic = "monuments" Then
                ques.InnerHtml = "SPOT THE MONUMENTS"
            Else
                ques.InnerText = clue
            End If

            Catch ex As Exception
                MsgBox("exception was handled in map page" + ex.ToString)
            End Try

    End Sub
End Class
