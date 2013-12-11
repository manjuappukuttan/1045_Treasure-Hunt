Imports System.Data.OleDb

Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.WebRequestMethods
Partial Class edit
    Inherits System.Web.UI.Page
    Public tablename As String
    Dim provider As String
    Dim dataFile As String
    Dim connString As String
    Dim myConnection As OleDbConnection = New OleDbConnection
    Dim dr As OleDbDataReader
    Dim cmd As OleDbCommand
    Dim da As OleDbDataAdapter
    Dim sqlCmdBuilder As SqlCommandBuilder
    Dim myDataset As DataSet
    Dim count As Integer
    Dim str As String

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Try
            provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="
            dataFile = Server.MapPath("db/th.accdb")
            connString = provider & dataFile
            myConnection.ConnectionString = connString
            myConnection.Open()

            Dim cmd As String = "Select * from cities ORDER BY ID"
            Dim dbCmd As OleDbCommand = New OleDbCommand(cmd, myConnection)
            da = New OleDbDataAdapter(cmd, myConnection)

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

    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        heading.InnerText = ddlDb.SelectedValue.ToUpper


    End Sub

    
    Protected Sub ddlDb_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlDb.SelectedIndexChanged

        If Not (String.IsNullOrEmpty(ddlDb.SelectedValue)) Then
            Try
                provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="

                dataFile = Server.MapPath("db/th.accdb")
                connString = provider & dataFile
                myConnection.ConnectionString = connString
                myConnection.Open()

                Dim cmd As String = "SELECT * FROM " & ddlDb.SelectedValue & " ORDER BY ID"
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

                rewind()
            Catch ex As Exception
                MsgBox("Exception occured safe mode activited")
                Response.Redirect("HOME.aspx")
            End Try
        End If

    End Sub

    

    Private Sub rewind()
        Try
            provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="
            dataFile = Server.MapPath("db/th.accdb")
            connString = provider & dataFile
            myConnection.ConnectionString = connString
            myConnection.Open()

            Dim cmd As String = "Select * from " & ddlDb.SelectedValue & " ORDER BY ID"
            Dim dbCmd As OleDbCommand = New OleDbCommand(cmd, myConnection)
            da = New OleDbDataAdapter(cmd, myConnection)
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
    End Sub

    
    Protected Sub Button8_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button8.Click
        Response.Redirect("HOME.aspx")
    End Sub

    Protected Sub Button10_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button10.Click
        Response.Cookies("edittable").Value = ddlDb.SelectedValue
        Response.Redirect("admin.aspx")
    End Sub
End Class
