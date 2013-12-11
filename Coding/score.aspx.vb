
Partial Class score
    Inherits System.Web.UI.Page
    Public count As Integer
    Public topic As String = ""
    Public total As Integer


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        topic = Request.Cookies("topic").Value
        count = Request.Cookies("rescook").Value
        total = Request.Cookies("total").Value
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click


        If topic = "continents" Then

            If count < 5 Then
                count = count + 1
                Response.Cookies("rescook").Value = count
                Response.Redirect("Default.aspx")
            Else
                Response.Redirect("complete.aspx")
            End If


        ElseIf topic = "countries" Then

            If count < 8 Then
                count = count + 1
                Response.Cookies("rescook").Value = count
                Response.Redirect("Default.aspx")
            Else
                Response.Redirect("complete.aspx")
            End If

        ElseIf topic = "cities" Then

            If count < 8 Then
                count = count + 1
                Response.Cookies("rescook").Value = count
                Response.Redirect("Default.aspx")
            Else
                Response.Redirect("complete.aspx")
            End If
        ElseIf topic = "capitals" Then

            If count < 8 Then
                count = count + 1
                Response.Cookies("rescook").Value = count
                Response.Redirect("Default.aspx")
            Else
                Response.Redirect("complete.aspx")
            End If

        ElseIf topic = "monuments" Then
            If count < 8 Then
                count = count + 1
                Response.Cookies("rescook").Value = count
                Response.Redirect("Default.aspx")
            Else
                Response.Redirect("complete.aspx")
            End If

        End If



    End Sub



End Class


