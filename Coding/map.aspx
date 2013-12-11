<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.OleDB" %>
<%@ Page Language="VB" AutoEventWireup="false" CodeFile="map.aspx.vb" Inherits="map" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Treasure Hunts-MapHunt</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="unitpngfix.js"></script>
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
    function pepop(cont) {

        var did = document.getElementById('popup');
        did.style.display = "block";
        did.innerHTML = '<a href="#"  onclick="closepop()"> <img src="images/button2.gif" alt="button" align="right" style=" height=50px; width=50px; padding="02px 50px 0 0"; margin="0 5px 0 0"border="0px none none";" />  </a> <br> <br> <br> <br>' + cont;
        document.getElementById("main_container").style.display = "none";


    }

</script>
<script type="text/javascript">
    function closepop() {
        document.getElementById('popup').style.display = "none";
        document.getElementById("main_container").style.display = "block";
    }

</script>
    
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"> </script>

    <script type="text/javascript"  >
        try {
            if (navigator.onLine) {
                var map;
                var markers = [];
                var marker;
                var latlng;

                function initialize() {
                    var myloc = new google.maps.LatLng(18, 18);
                    var mapOptions = {
                        zoom: 2,
                        center: myloc,
                        mapTypeId: google.maps.MapTypeId.HYBRID,
                        mapTypeControl: true,
                        mapTypeControlOptions:
        {
            style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
            poistion: google.maps.ControlPosition.TOP_RIGHT,
            mapTypeIds: [google.maps.MapTypeId.ROADMAP,
              google.maps.MapTypeId.TERRAIN,
              google.maps.MapTypeId.HYBRID,
              google.maps.MapTypeId.SATELLITE]
        },
                        navigationControl: true,
                        navigationControlOptions:
        {
            style: google.maps.NavigationControlStyle.ANDROID
        },
                        scaleControl: true,
                        disableDoubleClickZoom: true,
                        draggable: true,
                        streetViewControl: true,
                        draggableCursor: 'move'


                    };

                    map = new google.maps.Map(document.getElementById('mymap'),
            mapOptions);

                    google.maps.event.addDomListener(map, 'zoom_changed', bringmark);

                    google.maps.event.addListener(map, 'tilesloaded', function () {
                        var count = Cookies.get('tt');
                        var counter = setInterval(timer, 1000);
                        function timer() {
                            if (navigator.onLine) {
                                count = count - 1;
                                if (count < 0) {
                                    clearInterval(counter);
                                    Cookies.clear('tt');
                                    alert("GAME OVER");
                                    play('failed.wav');
                                    location.href = "fail.aspx";
                                    return;
                                }
                                Cookies.set('tt', count);
                                var mins = Math.floor(count / 60);
                                var sec = count % 60;
                                if (mins < 10) {
                                    mins = "0" + mins;
                                }
                                if (sec < 10) {
                                    sec = "0" + sec;
                                }
                                document.getElementById("Label1").innerHTML = mins + ":" + sec;
                            }
                            else {

                                alert("PLEASE CHECK YOUR INTERNET CONNECTION EXIST , THE PAGE WILL RESUME AUTOMATICALLY ELSE PRESS REFRESH BUTTON");
                                window.setInterval(function () { location.href = "connectionfail.aspx" }, 6000);
                            }


                        }

                    });


                    /*  var count = Cookies.get('tt');
                    var counter = setInterval(timer, 1000);
                    function timer() {
                    if (navigator.onLine) {
                    count = count - 1;
                    if (count <= 0) {
                    clearInterval(counter);
                    Cookies.clear('tt');
                    alert("GAME OVER");
                    return;
                    }
                    Cookies.set('tt', count);
                    var mins = Math.floor(count / 60);
                    var sec = count % 60;
                    if (mins < 10) {
                    mins = "0" + mins;
                    }
                    if (sec < 10) {
                    sec = "0" + sec;
                    }
                    document.getElementById("Label1").innerHTML = mins + ":" + sec;
                    }
                    else {

                    alert("PLEASE CHECK YOUR INTERNET CONNECTION EXIST , THE PAGE WILL RESUME AUTOMATICALLY ELSE PRESS REFRESH BUTTON");
                    }


                    } */

                }


                function bringmark() {
                    var zoomLevel = map.getZoom();
                    var det1 = '<%=lat1 %>';
                    var det2 = '<%=lat2 %>';
                    var zmax = '<%=zz %>';
                    latlng = new google.maps.LatLng(det1, det2);
                    if (zoomLevel >= zmax && zoomLevel <= 30) {
                        addMarker(latlng);

                    }
                    else {
                        deleteOverlays();
                    }
                }


                var image = {
                    url: 'images/marker1.png',

                    size: new google.maps.Size(128, 128),

                    origin: new google.maps.Point(0, 0),

                    anchor: new google.maps.Point(0, 128)
                };

                var shape = {
                    coord: [1, 1, 1, 128, 128, 128, 128, 1],
                    type: 'poly'
                };

                function trans() {
                    play('yes1.wav');
                    alert("YOU GOT IT!!");
                    play('levelcomplete.mp3');
                    location.href = "score.aspx";

                }


                function addMarker(location) {
                    marker = new google.maps.Marker({
                        position: location,
                        map: map,
                        icon: image,
                        shape: shape

                    });
                    markers.push(marker);
                    google.maps.event.addDomListener(marker, 'click', trans);

                }


                function setAllMap(map) {
                    for (var i = 0; i < markers.length; i++) {
                        markers[i].setMap(map);
                    }
                }


                function clearOverlays() {
                    setAllMap(null);
                }


                function showOverlays() {
                    setAllMap(map);
                }


                function deleteOverlays() {
                    clearOverlays();
                    markers = [];
                }

                google.maps.event.addDomListener(window, 'load', initialize);

            }

            else {
                location.href = "map.aspx";

            }
        }
        catch (e) {
            alert("PLEASE CHECK YOUR INTERNET CONNECTION EXIST , THE PAGE WILL RESUME AUTOMATICALLY ELSE PRESS REFRESH BUTTON");
            window.setInterval(function () { location.href = "connectionfail.aspx" }, 6000);
        }

    </script> 
    <script type="text/javascript" >
        function intop() {
            play('preview.wav');
            var a = Cookies.get('tt1');
            var b = Cookies.get('tt2');
            if (a == 1) {
                document.getElementById("Button2").disabled = "true";
            }



            if (b == 1) {
                document.getElementById("Button3").disabled = "true";
            }




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
<body id="gug" onload="intop()">

 <div id="popup" class="pp1" style="display:none;"> 
    </div>

<div id="main_container">
	<div class="top_leafs">&nbsp;</div>
	<div id="header">
    	<div class="logo">
      Treasure Hunt
        </div></div>
    
    
    <div id="center_content">
    		<div class="left_content">
             <form id="form1" runat="server">
           <div>
        <a href="#" class="myclose" onclick="myclose()"> </a>
        </div> 
       <h1 style="color:#800000; font-size:25px; text-decoration:'blink'; " > CLUE </h1>
        <div id="ques"  runat="server" class="panel"> </div>

        

       <div class="right_content">
       <asp:Label ID="Label1" runat="server" CssClass="tit1" >00:00</asp:Label>
      </div> 
   
    <asp:ScriptManager ID="ScriptManager1" runat="server" />  
    <div id="mymap" style="padding:10px 5px 10px 20px; width:750px; height:400px; "></div>
    
    <table width="819px" >
    <tr align="center"> 
    <td ><input id="Button1" type="button" value="HINT1" onclick="Button1_onclick()" class="bingo" /></td>
    <td ><input id="Button2" type="button" value="HINT2" onclick="Button2_onclick()" class="bingo" /></td>
    <td><input id="Button3" type="button" value="HINT3" onclick="Button3_onclick()" class="bingo" /></td>   
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
<script type="text/javascript">
    function Button1_onclick() {
        var det1 = '<%=hint1 %>';
        pepop(det1);
        Cookies.set('tt1', 2);
        document.getElementById("Button2").disabled = "";
    }

    function Button2_onclick() {
        var det1 = '<%=hint2 %>';
        pepop(det1);
        Cookies.set('tt2', 2);
        document.getElementById("Button3").disabled = "";
    }

    function Button3_onclick() {
        var det1 = '<%=hint3 %>';
        pepop(det1);
        Cookies.set('tt3', 2);
    }

</script>