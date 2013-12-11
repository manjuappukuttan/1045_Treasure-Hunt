<%@ Page Language="VB" AutoEventWireup="false" CodeFile="name.aspx.vb" Inherits="name" %>

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
</head>
<body onload="play('complete.mp3')">

    <form id="form2" runat="server">

<div id="main_container">
	<div class="top_leafs"></div>
	<div id="header">
   	<div class="logo">
       <a href="#">Treasure Hunt</a>
        </div>
        </div>
    
    
    <div id="center_content">
 		<div class="left_content">
             <asp:Panel ID="Panel1" runat="server">
             
        <h1 style=" font-size:30PX; text-align:center;">CONGRALUTION YOU HAVE HUNTED INTO HIGHSCORE PANEL</h1>
        <table width="700px" style="text-align:center; font-size:25PX;"><tr>
            <td><asp:Label ID="Label1" runat="server" Text="ENTER YOUR NAME" ></asp:Label></td>
            <td><asp:TextBox ID="TextBox1" runat="server" Width="250px"  ></asp:TextBox></td>
            </tr>
            <tr>
            <td colspan="2">
                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="newbingo"/>
            </td>
            </tr>
            </table>
        </asp:Panel>
       <div style="padding:30px 0 0 60px;">
         <asp:GridView ID="GridView1" runat="server" 
             STYLE="font-size:24px; text-align:center;" BackColor="LightGoldenrodYellow" 
             BorderColor="#996633" BorderStyle="Outset" BorderWidth="5px" 
             CaptionAlign="Top" CellPadding="5" ClientIDMode="AutoID" 
             Font-Size="Larger" ForeColor="Black" Width="600px" CssClass="mindme">
             <AlternatingRowStyle BackColor="PaleGoldenrod" />
             <FooterStyle BackColor="Tan" />
             <HeaderStyle BackColor="Tan" Font-Bold="True" />
             <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                 HorizontalAlign="Center" />
             <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
             <SortedAscendingCellStyle BackColor="#FAFAE7" />
             <SortedAscendingHeaderStyle BackColor="#DAC09E" />
             <SortedDescendingCellStyle BackColor="#E1DB9C" />
             <SortedDescendingHeaderStyle BackColor="#C2A47B" />
         </asp:GridView>
         <br />

     </div>
             <asp:Panel ID="Panel2" runat="server">
                 <asp:Button ID="Button2" runat="server" Text="HOME" CssClass="newbingo"/>
             </asp:Panel>
     </div>
            
            
    <div class="bottom_content">
            	
                 
            </div>
            
   
    </div> 
    
</div>


    </form>


</body>
</html>