<%@ Page Language="VB" AutoEventWireup="false" CodeFile="HOME.aspx.vb" Inherits="HOME" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Treasure Hunt </title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="unitpngfix.js"></script>
<script type="text/javascript" src="Scripts/backfix.min.js"></script> 
<script type="text/javascript" src="Scripts/audio1.js"></script>
<script type="text/javascript">
    window.history.forward();
    bajb_backdetect.OnBack = function preventBack() {
        window.history.forward();
        window.setTimeout(preventBack, 1);
    }
       </script>
<script type="text/javascript">
    function changeme() {
        document.getElementById("imgo").src = "images/templatemo_light_on.png";
    }
    function changeme1() {
        document.getElementById("imgo").src = "images/templatemo_light_off.png";
    }
    function redirected() {
        location.href = 'login.aspx';
        
    }
   
</script>

</head>
<body onload="play('pirates.mp3')">

    <form id="form1" runat="server">

<div id="main_container">
	<div class="top_leafs"><img src="images/top_leafs.png" alt="" title=" "/></div>
	<div id="header">
   	<div class="logo">
       <a href="HOME.aspx">Treasure Hunt</a>
        </div>
       <a href="login.aspx"> <img src="images/templatemo_light_off.png" id="imgo" alt="bulb" onmouseover="changeme()" onmouseout="changeme1()" onclick="redirected()" style="position: relative; right: 0px; top: 0px; width: 337px; height: 273px; border: 0px; float: right;"/></a>
        </div>
    
    
    <div id="center_content">
 		<div class="left_content">
       <div class="right_content">
   
<table style="background:url(images/cartoon1.jpg); height:808px; width:219px; ">
<tr>
<th> </th>
</tr>
</table>
      
</div>  

<table style="background:url(images/backhd.jpg); height:115px; width:450px; ">
<tr>
<th> </th>
</tr>
</table>

<table style="background:url(images/back1.jpg); height:568px; width:450px; " >
		   <tr align="center"> <td ><a href="level.aspx" class="btn2" onclick="play('sound2.wav')"> NEW GAME</a></td></tr>
                   <tr  align="center" > <td ><a href="level.aspx" class="btn2" onclick="play('sound2.wav')"> LEVEL   </a></td></tr>
                   <tr  align="center" > <td ><a href="roam.aspx" class="btn2" onclick="play('sound2.wav')"> ROAM</a></td></tr>
                   <tr  align="center" > <td ><a href="instruction.aspx" class="btn2" onclick="play('sound2.wav')"> INSTRUCTION</a></td></tr>
		   <tr align="center" > <td ><a href="highscore.aspx" class="btn2" onclick="play('sound2.wav')"> HIGH SCORE</a></td></tr>
                    	
     </table>   
   
                 
<table style="background:url(images/backbk.jpg); height:123px; width:450px; ">
<tr>
<th> </th>
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
