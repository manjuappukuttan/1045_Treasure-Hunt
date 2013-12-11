<%@ Page Language="VB" AutoEventWireup="false" CodeFile="fail.aspx.vb" Inherits="fail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <title>Treasure Hunts</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="unitpngfix.js"></script>
<script type="text/javascript" src="Scripts/backfix.min.js"></script> 
<script type="text/javascript" src="Scripts/yahoo-min.js"></script>
<script type="text/javascript" src="Scripts/event-min.js"></script>
<script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
<script type="text/javascript" src="Scripts/Cookies.js"></script>
<script type="text/javascript" src="Scripts/audio1.js"></script>
<script type="text/javascript">

    window.history.forward();
    bajb_backdetect.OnBack = function preventBack() {
        window.history.forward();
        window.setTimeout(preventBack, 1);
    }
       </script>
        
       <script type="text/javascript">
           function runtext(ss, value) {
               var i = 0;
               jQuery.fx.interval = 100;
               window.setInterval(function () {
                   if (i < value) {
                       document.getElementById("score1").innerHTML = i;
                       $("#score1").slideDown("fast");
                       if (value > 2000) {
                           i = i + 129;
                           play('sound4.wav');
                       }
                       else {
                           i = i + 9;
                           play('sound4.wav');
                       }
                   }
                   else {

                       document.getElementById("score1").innerHTML = value;

                       $("#score1").fadeOut("slow");
                       $("#score1").fadeIn("fast");

                   }
               }, 1);
           }
</script>
  <script type="text/javascript">
      YAHOO.util.Event.onDOMReady(function () {
          var total = Cookies.get("total");
          runtext("score1", total);

      });
        </script>
      
</head>
<body onload="play('sad.mp3')">

    <form id="form2" runat="server">

<div id="main_container">
	<div class="top_leafs"><img src="images/top_leafs.png" alt="" title=" "/></div>
	<div id="header">
   	<div class="logo">
       <a href="#">Treasure Hunt</a>
        </div>
        </div>
    
    
    <div id="center_content">
 		<div class="left_content">
      
         <div class="failhead">
         <table style="padding:320px 0 0 140px;  font-size:52px; color:Red;">
         <tr style="height:100px;">
         <td style="width:200px;"> <h1 style="font-size:46px; color:Red;">SCORE </h1> </td>
         <td style="width:50px;"></td>
         <td style="width:200px; font-size:56px; font-family:Times New Roman;"><div id="score1"> </div></td>
             </tr>
             </table>
             
        </div>
        <br />
        
        <asp:Button ID="Button1" runat="server" Text="FINISH"  CssClass="newbingo" />
        
        <div id="username" runat="server" style="display:none;"> </div>
       
   </div>
            
            
    <div class="bottom_content">
            	
                 
            </div>
            
   
    </div> 
    
</div>


    </form>


</body>
</html>