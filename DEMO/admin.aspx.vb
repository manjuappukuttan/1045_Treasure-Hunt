Imports System.Data.OleDb

Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.WebRequestMethods
Partial Class admin
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
    Dim maxvalue As Integer

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Try
            tablename = Request.Cookies("edittable").Value

        Catch ex As Exception
            MsgBox("Exception occured" + ex.ToString)
        End Try

        heading.InnerText = tablename.ToUpper

        DropDownList1.Items.Add("ADD")

        Try
            provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="
            dataFile = Server.MapPath("db/th.accdb")
            connString = provider & dataFile
            myConnection.ConnectionString = connString
            myConnection.Open()
            Dim cmd As String = "select MAX(ID) as temp from " & tablename
            Dim dbCmd As OleDbCommand = New OleDbCommand(cmd, myConnection)
            dr = dbCmd.ExecuteReader


            While dr.Read()
                maxvalue = dr.GetInt32(dr.GetOrdinal("temp"))
            End While
            dbCmd.Dispose()
            myConnection.Close()

        Catch ex As Exception
            Response.Redirect("admin.aspx")
        End Try

        
        For i = 1 To maxvalue
            DropDownList1.Items.Add(i)
        Next

        Panel4.Visible = True
        Panel5.Visible = False

    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        TextBox1.Text = ""
        TextBox3.Text = ""
        TextBox5.Text = ""
        TextArea1.InnerText = ""
        TextArea2.InnerText = ""
        TextArea3.InnerText = ""
        TextArea4.InnerText = ""
        DropDownList2.SelectedValue = 2

        Panel4.Visible = True
        Panel5.Visible = False

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged


        If DropDownList1.SelectedValue = "ADD" Then
            Panel4.Visible = True
            Panel5.Visible = False

            TextBox1.Text = ""
            TextBox3.Text = ""
            TextBox5.Text = ""
            TextArea1.InnerText = ""
            TextArea2.InnerText = ""
            TextArea3.InnerText = ""
            TextArea4.InnerText = ""
            DropDownList2.SelectedValue = 2


        Else
            If Not (String.IsNullOrEmpty(DropDownList1.SelectedValue)) Then
                Try


                    provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="
                    dataFile = Server.MapPath("db/th.accdb")
                    connString = provider & dataFile
                    myConnection.ConnectionString = connString
                    myConnection.Open()

                    Dim cmd As String = "SELECT COUNT(ID) AS pp FROM " & tablename & " WHERE ID= " & DropDownList1.SelectedValue
                    Dim dbCmd As OleDbCommand = New OleDbCommand(cmd, myConnection)
                    Dim b As Integer


                    b = Convert.ToInt32(dbCmd.ExecuteScalar.ToString)

                    myConnection.Close()

                    If b = 0 Then
                        Panel4.Visible = True
                        Panel5.Visible = False

                        TextBox1.Text = ""
                        TextBox3.Text = ""
                        TextBox5.Text = ""
                        TextArea1.InnerText = ""
                        TextArea2.InnerText = ""
                        TextArea3.InnerText = ""
                        TextArea4.InnerText = ""
                        DropDownList2.SelectedValue = 2

                    Else
                        provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="

                        dataFile = Server.MapPath("db/th.accdb")

                        connString = provider & dataFile
                        myConnection.ConnectionString = connString
                        myConnection.Open()

                        Dim str As String


                        str = "SELECT * FROM " & tablename & " where ID= " & DropDownList1.SelectedValue



                        Dim cmd1 As OleDbCommand = New OleDbCommand(str, myConnection)

                        dr = cmd1.ExecuteReader


                        While dr.Read()

                            TextBox1.Text = dr.GetString(1)
                            TextArea1.InnerText = dr.GetString(2)
                            TextArea2.InnerText = dr.GetString(3)
                            TextArea3.InnerText = dr.GetString(4)
                            TextArea4.InnerText = dr.GetString(5)
                            TextBox3.Text = dr.GetString(6)
                            TextBox5.Text = dr.GetString(7)
                            DropDownList2.SelectedValue = dr.GetInt32(8)


                        End While

                        dr.Close()
                        myConnection.Close()

                        Panel4.Visible = False
                        Panel5.Visible = True

                    End If
                Catch ex As Exception
                    MsgBox("Exception occured safe mode activited")
                    Response.Redirect("HOME.aspx")
                End Try
            End If
        End If
    End Sub

   
    Protected Sub DropDownList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList2.SelectedIndexChanged
        Dim zl As String = DropDownList2.SelectedValue
        If zl <= 5 Then
            dif.InnerText = "DIFFICULTY: LOW"
            dif.Style("background-color") = "red"
            dif.Style("color") = "white"

        ElseIf zl >= 6 And zl <= 8 Then
            dif.InnerText = "DIFFICULTY: MEDIUM"
            dif.Style("background-color") = "yellow"
            dif.Style("color") = "black"
        Else
            dif.InnerText = "DIFFICULTY: HIGH"
            dif.Style("background-color") = "green"
            dif.Style("color") = "white"
        End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Try

            provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="
            dataFile = Server.MapPath("db/th.accdb")
            connString = provider & dataFile
            myConnection.ConnectionString = connString
            myConnection.Open()
            Dim str1 As String = TextBox1.Text
            Dim str2 As String = TextArea1.InnerText.ToString
            Dim str3 As String = TextArea2.InnerText.ToString
            Dim str4 As String = TextArea3.InnerText.ToString
            Dim str5 As String = TextArea4.InnerText.ToString
            Dim str6 As String = TextBox3.Text.ToString
            Dim str7 As String = TextBox5.Text.ToString
            Dim mx As Integer = maxvalue + 1

            Dim cmd As String = "INSERT INTO " & tablename & " (ID, place, clue, hint1, hint2, hint3, lat1, lat2, zoomlevel) VALUES (" & mx & ",'" & str1 & "','" & str2 & "','" & str3 & "','" & str4 & "','" & str5 & "'," & str6 & "," & str7 & "," & DropDownList2.SelectedValue & " )"
            Dim dbCmd As OleDbCommand = New OleDbCommand(cmd, myConnection)
            dbCmd.ExecuteNonQuery()
            dbCmd.Dispose()
            myConnection.Close()

            MsgBox("The Record is inserted successfully")

            Response.Redirect("edit.aspx")

        Catch ex As Exception


            Response.Redirect("admin.aspx")
        End Try
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        Try
            provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="
            dataFile = Server.MapPath("db/th.accdb")
            connString = provider & dataFile
            myConnection.ConnectionString = connString
            myConnection.Open()
            Dim cmd As String = "UPDATE " & tablename & " SET place='" & TextBox1.Text.ToString & "',clue='" & TextArea1.InnerText.ToString & "',hint1='" & TextArea2.InnerText.ToString & "',hint2='" & TextArea3.InnerText.ToString & "',hint3='" & TextArea4.InnerText.ToString & "',lat1=" & TextBox3.Text.ToString & ",lat2=" & TextBox5.Text.ToString & ",zoomlevel=" & DropDownList2.SelectedValue & " WHERE ID= " & DropDownList1.SelectedValue

            Dim dbCmd As OleDbCommand = New OleDbCommand(cmd, myConnection)
            dbCmd.ExecuteNonQuery()
            dbCmd.Dispose()

            myConnection.Close()
            MsgBox("The Record is updated successfully")

            Response.Redirect("edit.aspx")

        Catch ex As Exception

            Response.Redirect("admin.aspx")
        End Try
    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click
        Try
            provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="
            dataFile = Server.MapPath("db/th.accdb")
            connString = provider & dataFile
            myConnection.ConnectionString = connString
            myConnection.Open()
            Dim cmd As String = "DELETE * from " & tablename & " WHERE ID = " & DropDownList1.SelectedValue
            Dim dbCmd As OleDbCommand = New OleDbCommand(cmd, myConnection)
            dbCmd.ExecuteNonQuery()
            cmd = "UPDATE " & tablename & " SET ID= " & DropDownList1.SelectedValue & " WHERE ID = " & maxvalue & ""
            dbCmd = New OleDbCommand(cmd, myConnection)
            dbCmd.ExecuteNonQuery()
            dbCmd.Dispose()
            myConnection.Close()
            MsgBox("The Record is deleted successfully")
            Response.Redirect("edit.aspx")

        Catch ex As Exception
            Response.Redirect("admin.aspx")
        End Try

    End Sub

   
End Class
