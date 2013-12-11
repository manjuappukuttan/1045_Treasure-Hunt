Imports System.Data.OleDb

Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.WebRequestMethods
Partial Class credit
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

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        Provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="
        dataFile = Server.MapPath("db/th.accdb")
        connString = Provider & dataFile
        myConnection.ConnectionString = connString
        myConnection.Open()



        Dim cmd As String = "SELECT TOP 5 name, score FROM highscore WHERE (topic = '" & ddlDb.SelectedValue & "') ORDER BY score DESC"



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

    
    Protected Sub ddlDb_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlDb.SelectedIndexChanged

        If Not (String.IsNullOrEmpty(ddlDb.SelectedValue)) Then
            Try
                provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="

                dataFile = Server.MapPath("db/th.accdb")
                connString = provider & dataFile
                myConnection.ConnectionString = connString
                myConnection.Open()

                Dim cmd As String = "SELECT TOP 5 name, score FROM highscore WHERE (topic = '" & ddlDb.SelectedValue & "') ORDER BY score DESC"
                Dim dbCmd As OleDbCommand = New OleDbCommand(cmd, myConnection)


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


            Catch ex As Exception
                MsgBox("Exception occured safe mode activited")
                Response.Redirect("HOME.aspx")
            End Try
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("HOME.aspx")

    End Sub
End Class
