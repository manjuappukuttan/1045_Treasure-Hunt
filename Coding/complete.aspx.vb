Imports System.Data.OleDb

Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.WebRequestMethods
Partial Class complete
    Inherits System.Web.UI.Page
    Dim provider As String
    Dim dataFile As String
    Dim connString As String
    Dim myConnection As OleDbConnection = New OleDbConnection
    Dim dr As OleDbDataReader
    Dim cmd As OleDbCommand
    Dim da As OleDbDataAdapter
    Dim sqlCmdBuilder As SqlCommandBuilder
    Dim myDataset As DataSet
    Public topic As String = ""
    Public sc As Integer
    Dim tty As Integer
    Dim un As String

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        topic = Request.Cookies("topic").Value
        Try
            provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="
            dataFile = Server.MapPath("db/th.accdb")
            connString = provider & dataFile
            myConnection.ConnectionString = connString
            myConnection.Open()


            Dim cmd As String = "SELECT TOP 5 name, score FROM highscore WHERE (topic = '" & topic & "') ORDER BY score DESC"
            Dim dbCmd As OleDbCommand = New OleDbCommand(cmd, myConnection)
            dr = dbCmd.ExecuteReader()



            While dr.Read()
                sc = dr.GetInt32(1)
            End While

            dbCmd.Dispose()
            myConnection.Close()



        Catch ex As Exception


            MsgBox("this error is due to" & ex.ToString)
        End Try

    End Sub




    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        tty = Convert.ToInt32(Request.Cookies("total").Value.ToString)

        If (tty >= sc) Then
            Response.Redirect("name.aspx")
        Else
            Response.Redirect("HOME.aspx")
        End If


    End Sub
End Class
