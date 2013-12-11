Imports System.Data.OleDb

Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.WebRequestMethods
Partial Class name
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
    Dim topic As String
    Dim name As String
    Dim tty As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Panel1.Visible = True
        Panel2.Visible = False
        topic = Request.Cookies("topic").Value
        provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="
        dataFile = Server.MapPath("db/th.accdb")
        connString = provider & dataFile
        myConnection.ConnectionString = connString
        myConnection.Open()



        Dim cmd As String = "SELECT TOP 5 name, score FROM highscore WHERE (topic = '" & topic & "') ORDER BY score DESC"



        Try
            da = New OleDbDataAdapter(cmd, myConnection)
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try


        Dim table As New DataTable
        myDataset = New DataSet()


        da.Fill(table)
        GridView1.DataSource = table
        GridView1.DataBind()
        myConnection.Close()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        name = TextBox1.Text.ToString
        If name = "" Then
            name = "user1"
        End If
        tty = Convert.ToInt32(Request.Cookies("total").Value.ToString)

        provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="
        dataFile = Server.MapPath("db/th.accdb")
        connString = provider & dataFile
        myConnection.ConnectionString = connString
        myConnection.Open()

        Dim cmd As String = "INSERT INTO highscore(name, score, topic) values('" & name & "'," & tty & ",'" & topic & "')"
        Dim dbCmd As OleDbCommand = New OleDbCommand(cmd, myConnection)
        dbCmd.ExecuteNonQuery()
        dbCmd.Dispose()
        myConnection.Close()

        provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="
        dataFile = Server.MapPath("db/th.accdb")
        connString = provider & dataFile
        myConnection.ConnectionString = connString
        myConnection.Open()

        Dim cmd1 As String = "SELECT TOP 5 name, score FROM highscore WHERE (topic = '" & topic & "') ORDER BY score DESC"

        da = New OleDbDataAdapter(cmd1, myConnection)

        Dim table As New DataTable
        myDataset = New DataSet()

        da.Fill(table)
        GridView1.DataSource = table
        GridView1.DataBind()
        myConnection.Close()

        Panel1.Visible = False
        Panel2.Visible = True



    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Response.Redirect("HOME.aspx")

    End Sub
End Class
