<%@ Page Language="VB" AutoEventWireup="false" CodeFile="score.aspx.vb" Inherits="score" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Treasure Hunts</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="unitpngfix.js"></script>
<script type="text/javascript" src="Scripts/backfix.min.js"></script> 
<script type="text/javascript" src="Scripts/Cookies.js"></script>
<script type="text/javascript" src="Scripts/yahoo-min.js"></script>
<script type="text/javascript" src="Scripts/event-min.js"></script>
<script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
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
                document.getElementById("" + ss).innerHTML = i;
                $("#" + ss).slideDown("fast");
                if (value > 2000) {
                    i = i + 79;
                    play('sound4.wav');

                }
                else {
                    i = i + 9;
                    play('sound4.wav');

                }
            }
            else {

                document.getElementById("" + ss).innerHTML = value;

                if (ss == "score5") {
                    $("#score5").fadeOut("slow");
                    $("#score5").fadeIn("fast");
                }
                else {
                    $("#" + ss).finish();
                }
            }
        }, 1);
    }
</script>
    <script type="text/javascript">
        YAHOO.util.Event.onDOMReady(function () {
            scoreupdate1();
        });

        function scoreupdate1() {

            var time = Cookies.get('tt');
            var bonus = time * 9;
            var topic = '<%=topic %>';

            var s1;
            var s2;
            var s3;
            var redc = 0;





            if (topic == "continents") {
                s1 = 200;
                s2 = 1000;
                s3 = 50;
                if (Cookies.get("tt1") == 2) {

                    redc = s1;
                }

                if (Cookies.get("tt2") == 2) {
                    redc = redc + (s1 * 2);
                }

                if (Cookies.get("tt3") == 2) {
                    redc = redc + (s1 * 3);
                }
                scorecal(s1, s2, bonus, time, s3, redc);

            }
            else if (topic == "countries") {
                s1 = 400;
                s2 = 2000;
                s3 = 250;

                if (Cookies.get("tt1") == 2) {

                    redc = s1;
                }

                if (Cookies.get("tt2") == 2) {
                    redc = redc + (s1 * 2);
                }

                if (Cookies.get("tt3") == 2) {
                    redc = redc + (s1 * 3);
                }
                scorecal(s1, s2, bonus, time, s3, redc);

            }
            else if (topic == "capitals") {
                s1 = 600;
                s2 = 3000;
                s3 = 450;

                if (Cookies.get("tt1") == 2) {

                    redc = s1;
                }

                if (Cookies.get("tt2") == 2) {
                    redc = redc + (s1 * 2);
                }

                if (Cookies.get("tt3") == 2) {
                    redc = redc + (s1 * 3);
                }
                scorecal(s1, s2, bonus, time, s3, redc);

            }
            else if (topic == "cities") {
                s1 = 800;
                s2 = 4000;
                s3 = 650;

                if (Cookies.get("tt1") == 2) {

                    redc = s1;
                }

                if (Cookies.get("tt2") == 2) {
                    redc = redc + (s1 * 2);
                }

                if (Cookies.get("tt3") == 2) {
                    redc = redc + (s1 * 3);
                }
                scorecal(s1, s2, bonus, time, s3, redc);

            }
            else if (topic == "monuments") {
                s1 = 1000;
                s2 = 5000;
                s3 = 950;

                if (Cookies.get("tt1") == 2) {

                    redc = s1;
                }

                if (Cookies.get("tt2") == 2) {
                    redc = redc + (s1 * 2);
                }

                if (Cookies.get("tt3") == 2) {
                    redc = redc + (s1 * 3);
                }
                scorecal(s1, s2, bonus, time, s3, redc);

            }
        }

        function scorecal(s1, s2, bonus, time, s3, redc) {

            var a1 = 1;


            var sc1 = document.getElementById('score1');
            var sc2 = document.getElementById('score2');
            var sc3 = document.getElementById('score3');
            var sc4 = document.getElementById('score4');
            var sc5 = document.getElementById('score5');
            var sc6 = document.getElementById('score6');
            var sc7 = document.getElementById('score7');

            sc1.innerHTML = 0;
            sc2.innerHTML = 0;
            sc3.innerHTML = 0;
            sc4.innerHTML = 0;
            sc5.innerHTML = 0;
            sc6.innerHTML = 0;
            sc7.innerHTML = 0;

            var total = 0;

            // sc1.innerHTML = s1;
            runtext("score1", s1);

            runtext("score2", s2);
            //  sc2.innerHTML = s2;
            runtext("score3", bonus);
            //sc3.innerHTML = bonus; 


            if (time >= 90) {

                // sc4.innerHTML = s3;
                runtext("score4", s3);

            }

            var prevtot = 0;
            var count = Cookies.get('cou');

            var check = Cookies.get('myset');
            
            if (count > 1) {


               // document.getElementById('ptotal').style.display = "block";
              
                prevtot = Cookies.get("total");
                // sc7.innerHTML = prevtot;
                runtext("score7", prevtot);
            }
            var sp = s3;
            var ps = prevtot;

          
           
            if (check == 1) {
                if (redc > 0) {
                    document.getElementById('penalty').style.display = "block";
                    // sc6.innerHTML = redc;
                    runtext("score6", redc);
                    total = parseInt(s1) + parseInt(s2) + parseInt(bonus) + parseInt(sp) + parseInt(ps) - parseInt(redc);

                }
                else {
                    total = parseInt(s1) + parseInt(s2) + parseInt(bonus) + parseInt(sp) + parseInt(ps);

                }
                Cookies.set('myset', 2);

            }
            else {
                total = Cookies.get("total");
            }
            //sc5.innerHTML = total;
            runtext("score5", total);
            Cookies.set("total", total);

        }
    </script>
    <script type="text/javascript">
        function myclose() {
            var getme = confirm("ARE YOU SURE YOU WANT TO QUIT");
            if (getme == true) {
                location.href = "fail.aspx";
            }
        }
    </script>
</head>
<body onload="play('treasure.mp3')">
<div id="main_container">
	<div class="top_leafs"><img src="images/top_leafs.png" alt="" title=" "/></div>
	<div id="header">
    	<div class="logo">
      Treasure Hunt
        </div></div>
    
    
    <div id="center_content">
    		<div class="left_content">
            <div class="sshead">
                <table class="score"  style="padding:10px 5px 10px 20px; width:750px; height:600px; ">
                    <tr align="center" >
                        <td class="ipl" style="padding:128px 0px 0px 0px;"><asp:Label ID="Label1" runat="server" Text="LEVEL REWARD"></asp:Label> </td>
                        <td class="ipl1" style="padding:128px 0px 0px 0px;" ><div id="score1"> </div> 
                        </td>
                        <td> </td>
                        
                    </tr>
                    <tr align="center">
                        <td class="ipl" style="height:66px;"> <asp:Label ID="Label2" runat="server" Text="LEVEL COMPELETION"></asp:Label> </td>
                        <td class="ipl1"><div id="score2"></div>
                        </td>
                        <td> </td>
                    </tr>
                    <tr align="center">
                        <td class="ipl"><asp:Label ID="Label3" runat="server" Text="TIME BONUS"></asp:Label> </td>
                        <td class="ipl1"><div id="score3"></div>
                        </td>
                        <td> </td>
                    </tr>
                    <tr align="center">
                        <td class="ipl"><asp:Label ID="Label4" runat="server" Text="SPECIAL BONUS"></asp:Label> </td>
                        <td class="ipl1"><div id="score4" >  </div>
                        </td>
                        <td> </td>
                    </tr>
                    <tr align="center" id="penalty" >
                        <td class="ipl"><asp:Label ID="Label6" runat="server" Text="PENALTY"></asp:Label> </td>
                        <td class="ipl1"><div id="score6" >  </div>
                        </td>
                        <td> </td>
                    </tr>
                    <tr align="center" id="ptotal" >
                        <td class="ipl"> <asp:Label ID="Label7" runat="server" Text="PREVIOUS SCORE"></asp:Label></td>
                        <td class="ipl1"> <div id="score7" >  </div>
                        </td>
                        <td> </td>
                    </tr>

                    <tr>
                        <td align="right" class="ipl" style="font-size:34PX;"><asp:Label ID="Label5" runat="server" Text="TOTAL SCORE"></asp:Label> </td>
                        <td align="center" class="ipl1" style="font-size:34PX;" > 
                            <asp:Label ID="score5" runat="server" Text=""></asp:Label>
                        </td>
                        <td> </td>
                    </tr>
                </table>
            
            </div>
       
    <form id="form1" runat="server">

    
       
       <table width="100%"><tr>
       <td align="center"> <asp:Button ID="Button1" runat="server" Text="success" CssClass="bingo" /></td>
           <td align="center">  <input id="Button3" type="button" value="QUIT" class="bingo" onclick="myclose()" /></td>
        </tr>
        </table>
    </form>
     </div>
            
            
    <div class="bottom_content">
            	
                 
            </div>
            
   
    </div> 
    
</div>


</body>
</html>

