<%@ Page Language="VB" AutoEventWireup="false" CodeFile="highscore.aspx.vb" Inherits="credit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <title>Treasure Hunts-Question</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="unitpngfix.js"></script>
</head>
<body>

    <form id="form1" runat="server">

<div id="main_container">
	<div class="top_leafs"></div>
	<div id="header">
   	<div class="logo">
       <a href="HOME.aspx">Treasure Hunt</a>
        </div>
        </div>
    
    
    <div id="center_content">
 		<div class="left_content">
        
     <div dir="ltr">
     <h1 style="text-align:center; font-size:28px;"> HIGH SCORE </h1>
      <asp:DropDownList runat="server" ID="ddlDb" AutoPostBack="True" 
                OnSelectedIndexChanged="ddlDb_SelectedIndexChanged" Font-Size="20px" CssClass="changeme">
        <asp:ListItem Text="cities" Value="cities"></asp:ListItem>
        <asp:ListItem Text="capitals" Value="capitals"></asp:ListItem>
        <asp:ListItem Text="continents" Value="continents"></asp:ListItem>
        <asp:ListItem Text="countries" Value="countries"></asp:ListItem>
        <asp:ListItem Text="monuments" Value="monuments"></asp:ListItem>
    </asp:DropDownList>  
    </div>
    <div style="padding:30px 0 0 60px;">
         <asp:GridView ID="GridView1" runat="server" 
             
             style="font-size:28px; text-align:center; white-space:nowrap; overflow:hidden;" BackColor="LightGoldenrodYellow" 
             CaptionAlign="Top" CellPadding="15" CellSpacing="15" ClientIDMode="AutoID" 
             Font-Size="Larger" ForeColor="Black" CssClass="mindme" Width="600px" 
             BorderColor="#CC6600" BorderStyle="Groove" BorderWidth="16px"  >
             
             <AlternatingRowStyle BackColor="PaleGoldenrod" />
             
             <FooterStyle BackColor="Tan" />
             <HeaderStyle BackColor="Tan" Font-Bold="True" Width="300px" />
             <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                 HorizontalAlign="Center" />
                
             <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
             <SortedAscendingCellStyle BackColor="#FAFAE7" />
             <SortedAscendingHeaderStyle BackColor="#DAC09E" />
             <SortedDescendingCellStyle BackColor="#E1DB9C" />
             <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            

         </asp:GridView>
         <br />


        <asp:Button ID="Button1" runat="server" Text="HOME" CssClass="newbingo" />
     </div>
 
   </div>
            
            
    <div class="bottom_content">
            	
                 
            </div>
            
   
    </div> 
    
</div>


    </form>


</body>
</html>