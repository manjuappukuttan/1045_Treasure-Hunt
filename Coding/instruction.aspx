<%@ Page Language="VB" AutoEventWireup="false" CodeFile="instruction.aspx.vb" Inherits="instruction" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <title>Treasure Hunts-Question</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="unitpngfix.js"></script>
<script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
<script type="text/javascript" src="Scripts/jquery-ui.js"></script>
 <script type="text/javascript" src="Scripts/Cookies.js"></script>
<script type="text/javascript"">
    
</script>
<script type="text/javascript">
    function showme(dd) {
        var options = {};
        if (dd == 'div2') {
            var str = "";
            str = "<p style='font-size:16px;'>The continent mode is most easiest mode. Each puzzle will be based on a particular continents.<br/> </P> <H1>SCORE CARD DETAILS</H1><p style='font-size:16px;'>  LEVEL COMPLETION :100 <BR/> <BR/> SPECIAL BONUS : 2000 <BR/> <BR/> ZOOM LEVEL : 5</P>";
            document.getElementById('infopop').innerHTML = str;
            document.getElementById('infopop').style.display = "block";
            $("#infopop").hide();
            $("#infopop").show("slide", 1500);
        }
        var cont = document.getElementById('' + dd).style.display;
        if (cont == "none") {
            showthree(dd);

            cont = "block";

            $("#" + dd).show("clip", { direction: "vertical" }, 1000);


        }
        else {
           // $("#" + dd).hide("clip", { direction: "vertical" }, 1000);
            $("#" + dd).hide("blind", 1000);
            cont = "none";
        }

       
    }


    function showthree(dd) {
        
        $("#div1").hide("blind", 250);
        $("#div2").hide("blind", 250);
        $("#div3").hide("blind", 250);
        $("#div4").hide("blind", 250);
        $("#div5").hide("blind", 250);

    } 

</script>
<script type="text/javascript">
    function contshow(topic) {
        var str = "";
        if (topic == 'ct') {
            str = "<p style='font-size:16px;'>The continent mode is most easiest mode. Each puzzle will be based on a particular continents.<br/> </P> <H1>SCORE CARD DETAILS</H1><p style='font-size:16px;'>  LEVEL COMPLETION :100 <BR/> <BR/> SPECIAL BONUS : 2000 <BR/> <BR/> ZOOM LEVEL : 5</P>";
           
        }
        else if (topic == 'cn') {
            str = "<p style='font-size:16px;'>The Contries mode the question is based upon different facts about a countries. HINTS will provide details information about the place provided with penalty.<br/> </P> <H1>SCORE CARD DETAILS</H1><p style='font-size:16px;'>  LEVEL COMPLETION :200 <BR/> <BR/> SPECIAL BONUS : 4000  <BR/> <BR/> ZOOM LEVEL : 6</P>";
           
        }
        else if (topic == 'cp') {
            str = "<p style='font-size:16px;'>The capitals mode is puzzled based on the capitals of a country,state or city.HINTS will provide details information about the place provided with penalty.<br/> </P> <H1>SCORE CARD DETAILS</H1><p style='font-size:16px;'>  LEVEL COMPLETION :300 <BR/> <BR/> SPECIAL BONUS : 6000 <BR/> <BR/> ZOOM LEVEL : 7 </P>";
           
        }
        else if (topic == 'cs') {
            str = "<p style='font-size:16px;'>The cities mode provide sufficient information about a cities where the treasure is hidden to be found out(place to be spot). Each puzzle will be based on a particular continents.<br/> </P> <H1>SCORE CARD DETAILS</H1><p style='font-size:16px;'>  LEVEL COMPLETION :400 <BR/> <BR/> SPECIAL BONUS : 8000 <BR/> <BR/> ZOOM LEVEL : 8 </P>";
           
        }
        else {
            str = "<p style='font-size:16px;'>The monument is the most difficult mode, since the zoomlevel will have to be more specific on place. Each puzzle will be based on a manmade artifacts and ancient monuments.<br/> </P> <H1>SCORE CARD DETAILS</H1><p style='font-size:16px;'>  LEVEL COMPLETION :500 <BR/> <BR/> SPECIAL BONUS : 10000 <BR/> <BR/> ZOOM LEVEL : 10 </P>";
        }
        document.getElementById('infopop').innerHTML = str;
        document.getElementById('infopop').style.display = "block";
             
            
            $("#infopop").hide();
            $("#infopop").show("slide", 1000);
            count = 1;
       
    }
</script>
<script type="text/javascript">
    function basic() {
        document.getElementById('div1').style.display = "none";
        document.getElementById('div2').style.display = "none";
        document.getElementById('div3').style.display = "none";
        document.getElementById('div4').style.display = "none";
        document.getElementById('div5').style.display = "none";
    }
</script>
</head>
<body onload="basic()">

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
     <div >

     <h1><a href="#" class="ahead2" onclick="showme('div1')">NEW GAME</a></h1>
     <div id="div1" class="ssshow" > 
     <h1 style="text-align:center;">NEW GAME</h1>
     <p style=" font-size:16px; ">This Mode Is enables you to select from the List Of Level With Various Difficulties. Each Level difficulty is based on the geographical location and zoom level to spot the place.</p>
     <h1>POINT AND REWARDS</h1>
      <p style=" font-size:16px; ">Points will be awarded based the time taken to crack the puzzle. Special Rewards will be given only If the treasure is cracked within 30 seconds.
      </p> 
      <h1>HINTS AND PENALTY</h1>
     <p style=" font-size:16px; ">In case of difficult the user can view HINT, but it has negative effect to your score. Penalty is based on hint usuage and it will be reduced from your score.</p>
     <h1>ZOOM LEVEL</h1>
     <p style=" font-size:16px; ">Zoom level is specified for various mode, which inturns determine the difficulty to locate the place. More the zoomlevel more accuracy is required to spot the place. </p>
     </div>
     <h1><a href="#" class="ahead2" onclick="showme('div2')">LEVELS</a></h1>
     <div id="div2" class="ssshow1" > 
     <h1 style="text-align:center;">LEVELS</h1>
     <div>
     <ul class="makeme">
     <li><a href="#" onclick="contshow('ct')"> CONTINENTS </a> </li>
     <li><a href="#" onclick="contshow('cn')"> COUNTRIES </a> </li>
     <li><a href="#" onclick="contshow('cp')">CAPITALS </a> </li>
     <li><a href="#" onclick="contshow('cs')">CITIES </a> </li>
     <li><a href="#" onclick="contshow('mm')">MONUMENTS </a> </li>
     </ul>
     </div>
     <div id="infopop" class="infopop">

     </div>

     </div>
     <h1><a href="#" class="ahead2"  onclick="showme('div3')">ROAMING MODE</a></h1>
     <div id="div3" class="ssshow" > 
     <h1 style="text-align:center;">ROAMING MODE</h1>
       <p style=" font-size:16px; ">This mode will serve as a tutorial or learning mode, where you can search place, monument, geolocation, landscape, buildings.  <br />
       <br />It helps you spot the following.</p>
     <ul style=" font-size:16px;" > 
     <li style="padding:5px 2px 2px 2px;">THE MAN-MADE ARTIFACTS</li> 
     <li style="padding:5px 2px 2px 2px;">LANDMARKS</li> 
     <li style="padding:5px 2px 2px 2px;">LANDSCAPE</li>
      <li style="padding:5px 2px 2px 2px;">GEO-LOCATION </li> 
      <li style="padding:5px 2px 2px 2px;"> TRADEMARK PLACES</li> 
      </ul>
       
     </div>
     <h1><a href="#" class="ahead2"  onclick="showme('div4')">REQUIREMENTS</a></h1>
     <div id="div4" class="ssshow"> 
      <h1 style="text-align:center;">REQUIREMENTS</h1>
       <p style=" font-size:16px; "> 
    For Effective gaming please make your the following Connection Requirements.
       </p>
       <table cellpadding="10" style="font-size:16px; text-align:center; border:2px;">
        <tr align="center" >
       <td>BROWSER</td>
       <td> ALL PLATFORM</td>
       </tr>
       <tr align="center" >
       <td>MINIMUM CONNECTION</td>
       <td> 1.5 MBS</td>
       </tr>
        <tr align="center">
       <td>GOOD CONNECTION </td>
       <td>2 MBS </td>
       </tr>
       </table>
     </div>

     <h1><a href="#" class="ahead2"  onclick="showme('div5')">CREDITS</a></h1>
     <div id="div5" class="ssshow"> 
      <h1 style="text-align:center;">CREDITS</h1>
       <p style=" font-size:16px; "> 
    OUR SINCERE THANKS TO OUR PARENTS AND COLLEGE MANAGEMENT FOR HELPING US IN SUCCESSFULLY COMPLETING THIS GAMING APP.
       </p>
       <h1>SPECIALS THANKS TO: </h1>
       <table>
        <tr align="center">
        <td><img src="images/sir/princ.jpg" alt=""  height="110px" width="110px"/></td>
       <td><p style=" font-size:18px; color:Orange; ">Dr. R. Venkatasamy, The principle  </p>
       </td>
       </tr>
       <tr align="center">
        <td><img src="images/sir/sara.jpg" alt=""  height="110px" width="110px"/></td>
       <td><p style=" font-size:18px; color:Orange;">Mr.R. Saravanan,M.E., (Ph.D.) Associate Professor & HOD    </p>
       </td>
       </tr>
       <tr>
       <td><img src="images/sir/naga.jpg" alt=""  height="110px" width="110px"/></td>
       <td><p style=" font-size:18px; color:Orange;"">Mr. G.Nagappan,M.E., (Ph.D.) Associate Professor </p>
       </td>
       </tr>
       <tr>
       <td><img src="images/sir/peru.jpg" alt=""  height="110px" width="110px"/></td>
       <td><p style=" font-size:18px; color:Orange;" ">Mr. V. Perumal,M.E.,  (Ph.D.) Associate Professor </p>
       </td>
       </tr>
       </table>
       <h1>TEAM MEMBERS</h1>
       <ul style="font-size:18PX;">
       <li style="padding:1px 0 5PX 30PX;" >S.PONMANIKANDAN,<p style="font-style:italic;"> CSE-A, FINAL YEAR, 2013 PASSED OUT </p></li>
       <li style="padding:5PX 0 5PX 30PX;">K.PRASANA,       <p style="font-style:italic;"> CSE-A, FINAL YEAR, 2013 PASSED OUT </p></li>
       <li style="padding:5PX 0 5PX 30PX;">P.SRINIVASANA,   <p style="font-style:italic;">  CSE-A, FINAL YEAR, 2013 PASSED OUT</p></li>
       </ul>
       </div>
         <asp:Button ID="Button1" runat="server" Text="home"  CssClass="newbingo" />
      </div>
      
 
   </div>
        
    <div class="bottom_content">
            	
                 
            </div>
            
   
    </div> 
    
</div>


    </form>


</body>
</html>