<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <title>Treasure Hunts-Question</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="unitpngfix.js"></script>
<script type="text/javascript" src="Scripts/Cookies.js"></script>
<script type="text/javascript" src="Scripts/backfix.min.js"></script> 
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
     function into() {
         play('pirates.mp3');
         var cou = '<%=count %>';
         Cookies.set('tt', 120);
         Cookies.set('tt1', 1);
         Cookies.set('tt2', 1);
         Cookies.set('tt3', 1);
         Cookies.set('cou', cou);
         Cookies.set('myset', 1);

     }
     
    </script>
    <script type="text/javascript">
        function myclose() {
            var getme = confirm("ARE YOU SURE YOU WANT TO QUIT");
            if (getme == true) {
                play('out.wav');
                location.href = "fail.aspx";
            }
        }
    </script>
    <script type="text/javascript">
        function transferme() {
            play('sound1.wav');
            location.href = "map.aspx";
        }
    </script>
</head>
<body onload="into()">
<div id="main_container">
	<div class="top_leafs"><img src="images/top_leafs.png" alt="" title=" "/></div>
	<div id="header">
    	<div class="logo">
       Treasure Hunt
        </div></div>
    <div id="center_content">
    		<div class="left_content">
    <form id="form1" runat="server">
    <div>
        <a href="#" class="myclose" onclick="myclose()"> <img src="images/empty.gif" alt=" " height="49px" width="50px" style="border:0px;" /></a>
        </div>
       <div class="right_content">
   
</div>
    <div>
  

    <h1 id="mystyle1" runat="server" style="color:#800000; font-size:25px; text-decoration:'blink'; visibility:visible; " > QUESTION </h1>

        <asp:Label ID="Label1" runat="server" Text="SPOT THIS PLACE OUT" 
            Visible="False" Font-Size="22pt" ForeColor="#CC6600"></asp:Label>
    <div id="ques"  runat="server" class="panel">


    </div>
   
    <br />
    <br />
    <br />
        <input id="Button2" type="button" class="btn1" value="HUNT" onclick="transferme()" />

    <br />
    <br />

    </div>
    </form>
     </div>
            
            
    <div class="bottom_content">
            	
                 
            </div>
            
   
    </div> 
    
</div>
</body>
</html>
