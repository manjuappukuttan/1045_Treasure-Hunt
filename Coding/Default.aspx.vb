Imports System.Data.OleDb

Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.WebRequestMethods
Partial Class _Default
    Inherits System.Web.UI.Page
    Dim provider As String
    Dim dataFile As String
    Dim connString As String
    Dim myConnection As OleDbConnection = New OleDbConnection
    Dim dr As OleDbDataReader
    Dim cmd As OleDbCommand
    Public count As Integer
    Dim str As String
    Dim b As Integer
    Dim idd As String = ""
    Public topic As String
    Public maxvalue As Integer
    Public arr(100) As Integer
    Public pasvar As Integer
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim clue As String = ""
        Label1.Visible = False

        Try

            topic = Request.Cookies("topic").Value
            count = Request.Cookies("rescook").Value

        Catch ex As Exception
            Response.Redirect("HOME.aspx")
        End Try

        Try
            provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="

            dataFile = Server.MapPath("db/th.accdb")
            connString = provider & dataFile
            myConnection.ConnectionString = connString
            myConnection.Open()

            Dim str As String

            str = "SELECT * FROM " & topic & " where ID= " & arr(count)

            Dim cmd As OleDbCommand = New OleDbCommand(str, myConnection)

            dr = cmd.ExecuteReader


            While dr.Read()
                pasvar = dr.GetInt32(0)

                clue = dr.GetString(2)

            End While

            If clue = " " Then
                count = count + 1
                MsgBox("LUCKY USER ADVANCED TO NEXT LEVEL")
                Response.Cookies("rescook").Value = count
                Response.Redirect("Default.aspx")
            End If

            dr.Close()
            myConnection.Close()

        Catch ex As Exception
            MsgBox("exception was handled in default page")
        End Try

        If topic = "monuments" Then
            Dim NewImage As Image = New Image()
            NewImage.ImageUrl = ("~/images/monuments/" & clue)
            NewImage.Visible = True
            NewImage.AlternateText() = "unable to load"
            ques.Controls.Add(NewImage)
            Label1.Visible = True
            mystyle1.Visible = False

        Else
            ques.InnerText = " " + clue
        End If

        Response.Cookies("rescook1").Value = pasvar
    End Sub



    
    Protected Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        arr = Page.Session("myarray")

      
    End Sub
End Class

