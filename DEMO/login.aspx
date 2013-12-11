<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Treasure Hunts </title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="unitpngfix.js"></script>

    <script type="text/javascript">


        function Button1_onclick() {
            var textbox1 = document.getElementById('Text1').value;
            var textbox2 = document.getElementById('Password1').value;
                textbox1=textbox1.toLowerCase();

            if (textbox1 == "admin" && textbox2 == "12345") {
                document.getElementById('Text1').value= "";
               document.getElementById('Password1').value= "";
               alert("LOGIN SUCCESSFULL");
               location.replace("edit.aspx");
               
            }
            else {
                document.getElementById('Text1').value = "";
                document.getElementById('Password1').value = "";
                alert("INVALID USERNAME OR PASSWORD");
            }

        }
        function Button1_onclick1() {
            document.getElementById('Text1').value = "";
            document.getElementById('Password1').value = "";
            location.replace("HOME.aspx");

        }


    </script>
</head>
<body>

    <form id="form1" runat="server">

<div id="main_container">
	<div class="top_leafs"><img src="images/top_leafs.png" alt="" title=" "/></div>
	<div id="header">
   	<div class="logo">
       <a href="HOME.aspx">Treasure Hunt</a>
        </div>
        </div>
    <div id="center_content">
 		<div class="left_content">

       <table style="width:819px; padding:30px auto auto 120px;">
       <tr align="center">
       <td> <h1><asp:Label ID="Label1" runat="server" Text="USERNAME"></asp:Label></h1> </td>
       <td align="left"><input id="Text1" type="text" size="50"  /> </td>
       </tr>
     
       <tr align="center">
       <td> <h1><asp:Label ID="Label2" runat="server" Text="PASSWORD"></asp:Label></h1> </td>
      <td align="left"><input id="Password1" type="password" size="50"  /> </td>
       </tr>
        <tr align="center">
        <td style="width:409px;">
        <input id="Button1" type="button" value="LOGIN" class="bingo" onclick="return Button1_onclick()" />
        </td>
        <td style="width:409px;">
        <input id="Button2" type="button" value="CANCEL" class="bingo" onclick="return Button1_onclick1()" />
        </td>
        </tr>
           </table>
      
      
   
        </div>
    <div class="bottom_content">
            	
                 
            </div>
            
   
    </div> 
    
</div>


    </form>


</body>
</html>