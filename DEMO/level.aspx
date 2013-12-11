<%@ Page Language="VB" AutoEventWireup="false" CodeFile="level.aspx.vb" Inherits="level" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head  runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Treasure Hunts-Level </title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="Scripts/backfix.min.js"></script>
<script type="text/javascript" src="unitpngfix.js"></script>
<script type="text/javascript" src="Scripts/audio.js"></script>
<script type="text/javascript" src="Scripts/Cookies.js"></script>
    <style type="text/css">
        .style1
        {
            height: 113px;
        }
    </style>
    
    <script type="text/javascript">

        window.history.forward();
        bajb_backdetect.OnBack = function preventBack() {
            window.history.forward();
            window.setTimeout(preventBack, 1);
        }
       </script>
    <script type="text/javascript">
        function generate() {
            Cookies.set("total", 0);
            play('pirates.mp3');
        }
    </script>
</head>
<body onload="generate()">

    <form id="form1" runat="server">

<div id="main_container">
	<div class="top_leafs"><img src="images/top_leafs.png" alt="" title=" "/></div>
	<div id="header">
    	<div class="logo">
       <a href="HOME.aspx">Treasure Hunt</a>
        </div></div>
    
    
    <div id="center_content">
    		<div class="left_content">
       <div class="right_content">
        

<table style="background:url(images/cartoon4.jpg); height:808px; width:219px; " runat="server" >
<tr>
<td> </td>
</tr>
</table>
     
</div>  

<table style="background:url(images/backhd.jpg); height:115px; width:450px; " runat="server">
<tr>
<td></td>
</tr>
</table>
<table style="background:url(images/back1.jpg); height:568px; width:450px; "  runat="server">
		           <tr align="center" > <td> <asp:Button ID="Button1" runat="server" Text="CONTINENTS" CssClass="btn" /> </td></tr>
                   <tr  align="center" > <td> <asp:Button ID="Button2" runat="server" Text="COUNTRIES" CssClass="btn" /></td></tr>
                   <tr  align="center" > <td ><asp:Button ID="Button3" runat="server" Text="CAPITALS" CssClass="btn" /></td></tr>
                   <tr  align="center" > <td ><asp:Button ID="Button4" runat="server" Text="CITIES" CssClass="btn" /></td></tr>
		           <tr align="center" > <td ><asp:Button ID="Button5" runat="server" Text="MONUMENTS" CssClass="btn" /></td></tr>
                    	
     </table>               
<table style="background:url(images/backbk.jpg); height:123px; width:450px; " runat="server" >
<tr>
<td> </td>
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
