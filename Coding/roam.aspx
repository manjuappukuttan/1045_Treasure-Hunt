<%@ Page Language="VB" AutoEventWireup="false" CodeFile="roam.aspx.vb" Inherits="roam" %>

<!DOCTYPE PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Treasure Hunts </title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="unitpngfix.js"></script>
 <script src="http://maps.google.com/maps/api/js?sensor=false&libraries=places" type="text/javascript"></script> 
  <style type="text/css"> 
    body {
      font-family: sans-serif;
      font-size: 14px;
    }
    #map {
      height: 400px;
      width: 770px;
      margin-top: 0.6em;
    }
    input:focus {
      outline: none;
    }
    
      #address
      {
          height: 50px;
          width: 350px;
      }
      #lng
      {
          width: 250px;
      }
      #lat
      {
          width: 250px;
      }
    
  </style> 
  <script type="text/javascript">
      function initialize() {
          try {
              var mapOptions = {
                  center: new google.maps.LatLng(18, 18),
                  zoom: 2,
                  mapTypeId: google.maps.MapTypeId.HYBRID,
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
              geocoder = new google.maps.Geocoder();

              var map = new google.maps.Map(document.getElementById('map'), mapOptions);
              google.maps.event.addListener(map, 'click', function (event) {
                  placeMarker(event.latLng);
              });

              var marker;
              function placeMarker(location) {
                  if (marker) {
                      marker.setPosition(location);
                  } else {
                      marker = new google.maps.Marker({
                          position: location,
                          map: map
                      });
                  }
                  document.getElementById('lat').value = location.lat();
                  document.getElementById('lng').value = location.lng();
                  getAddress(location);


                  function getAddress(latLng) {
                      geocoder.geocode({ 'latLng': latLng },
      function (results, status) {
          infowindow.close();
          if (status == google.maps.GeocoderStatus.OK) {
              if (results[0]) {
                  document.getElementById("address").value = results[0].formatted_address;
              }
              else {
                  document.getElementById("address").value = "No results";
              }
          }
          else {
              if (status == "OVER_QUERY_LIMIT") {
                  status = "SORRY NO INFORMATION AVAILABLE";
              }
              if (status == "ZERO_RESULTS") {
                  status = "THESE LANDSCAPE HAS NO INFORMATION";
              }
              document.getElementById("address").value = status;
          }
      });
                  }
              }

              var input = document.getElementById('searchTextField');


              var autocomplete = new google.maps.places.Autocomplete(input);

              autocomplete.bindTo('bounds', map);

              var infowindow = new google.maps.InfoWindow();
              marker = new google.maps.Marker({
                  map: map
              });
              google.maps.event.addListener(autocomplete, 'place_changed', function res1() {

                  infowindow.close();

                  var place = autocomplete.getPlace();
                  try {
                      if (place.geometry.viewport) {
                          map.fitBounds(place.geometry.viewport);
                      } else {
                          map.setCenter(place.geometry.location);
                          map.setZoom(4);
                      }

                      var image = new google.maps.MarkerImage(
            place.icon, new google.maps.Size(71, 71),
            new google.maps.Point(0, 0), new google.maps.Point(17, 34),
            new google.maps.Size(35, 35));
                      marker.setIcon(image);
                      marker.setPosition(place.geometry.location);

                      var address = '';
                      if (place.address_components) {
                          address = [
            (place.address_components[0] &&
             place.address_components[0].short_name || ''),
            (place.address_components[1] &&
             place.address_components[1].short_name || ''),
            (place.address_components[2] &&
             place.address_components[2].short_name || '')].join(' ');
                      }

                      infowindow.setContent('<div><b>' + place.name + '</b><br>' + address);
                      infowindow.open(map, marker);
                  }
                  catch (eer) {

                  }
              });


              var setupClickListener = function (id, types) {
                  var radioButton = document.getElementById(id);
                  google.maps.event.addDomListener(radioButton, 'click', function () {
                      autocomplete.setTypes(types);
                  });
              }

              setupClickListener('c1', []);
              setupClickListener('c2', ['establishment']);
              setupClickListener('c3', ['geocode']);
          }
          catch (e) {
              alert("PLEASE CHECK YOUR INTERNET CONNECTION EXIST , THE PAGE WILL RESUME AUTOMATICALLY ELSE PRESS REFRESH BUTTON");
              window.setInterval(function () { location.href = "roam.aspx" }, 6000);
          }
      }
      if (navigator.onLine) {
          try {
              google.maps.event.addDomListener(window, 'load', initialize);
          }
          catch (e) {
              alert("PLEASE CHECK YOUR INTERNET CONNECTION EXIST , THE PAGE WILL RESUME AUTOMATICALLY ELSE PRESS REFRESH BUTTON");
              window.setInterval(function () { location.href = "roam.aspx" }, 6000);
          }
      }
      else {
          alert("PLEASE CHECK YOUR INTERNET CONNECTION EXIST , THE PAGE WILL RESUME AUTOMATICALLY ELSE PRESS REFRESH BUTTON");
          window.setInterval(function () { location.href = "roam.aspx" }, 6000);
      }
 

  </script> 
  <script type="text/javascript">
      document.onkeypress = stopRKey;
      function stopRKey(evt) {
          var evt = (evt) ? evt : ((event) ? event : null);
          var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
          if ((evt.keyCode == 13) && (node.type == "text")) { return false; }
      } 


  </script>
</head>
<body>
  <form id="Form1" runat="server">
<div id="main_container">
	<div class="top_leafs">&nbsp;</div>
	<div id="header">
    	<div class="logo">
      Treasure Hunt
        </div></div>
    
    
    <div id="center_content">
    	<div class="left_content">
        <input id="searchTextField"  size="90" type="text" />   
      
        
        <div >
    <asp:RadioButton ID="c1" runat="server"  Checked="true" text="ALL" GroupName="g1"/>
    <asp:RadioButton ID="c2" runat="server" text="ESTABLISHMENT" GroupName="g1"/>
    <asp:RadioButton ID="c3" runat="server" text="GEOCODE" GroupName="g1"/>
        </div>
        
            <div class="right_content">   </div> 

  

  <div id="map"> </div>
  <div class="distemp">
      <table>
      <tr>
      <td>LATITUDE</td>
      <td><input id="lat" type="text" readonly="readonly"  /><br /></td>
      </tr>
     <tr>
     <td>LONGTITUDE</td>
     <td><input id="lng" type="text" readonly="readonly" /> <br /></td>
     </tr>
      <tr>
     <td>PLACE INFORMATION</td>
     <td><textarea id="address" rows="4" cols="40" readonly="readonly"></textarea> <br /></td>
     </tr>
     </table>
  </div>
    <asp:Button ID="Button1" runat="server" Text="home"  CssClass="newbingo" />

    </div>
        
            
    <div class="bottom_content">
            	  </div>
            
   
    </div> 
   
   </div>
    </form>
    
</body>
</html>

 