<%@ Page Language="VB" AutoEventWireup="false" CodeFile="connectionfail.aspx.vb" Inherits="connectionfail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TREASURE HUNT</title>
   <script type="text/javascript" src="unitpngfix.js"></script>
<script type="text/javascript" src="Scripts/backfix.min.js"></script> 
<script type="text/javascript" src="Scripts/Cookies.js"></script>
<script type="text/javascript" src="Scripts/yahoo-min.js"></script>
<script type="text/javascript" src="Scripts/event-min.js"></script>
<script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
    <script type="text/javascript">

        window.history.forward();
        bajb_backdetect.OnBack = function preventBack() {
            window.history.forward();
            window.setTimeout(preventBack, 1);
        }

</script>
 <script type="text/javascript">
     YAHOO.util.Event.onDOMReady(function () {
         if (window.navigator.onLine) {
             location.href = "map.aspx";
          }
         else {
             window.setInterval(function () { location.href = "connectionfail.aspx" }, 12000);
         }
     });
        </script>
</head>

<body style="background-color:Black;">
    <form id="form1" runat="server">
    <div>
    <h1 style="font-size:50PX; color:Red; text-align:center;">CONNECTION FAILED </h1>
    <div style="padding:40PX 40PX 40PX 40PX; border:12PX GROOVE RED;">
    <p style="color:Blue; font-size:40PX;">
    PLEASE CHECK YOUR INTERNET CONNECTION.</p>
     <p style="color:Blue; font-size:35PX;">THE PAGE WILL BE REDIRECTED ONCE THE CONNECTION RESUMES.
    </p>
    </div>
    </div>
    </form>
</body>
</html>
