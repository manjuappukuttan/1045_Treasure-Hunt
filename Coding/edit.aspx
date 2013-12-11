<%@ Page Language="VB" AutoEventWireup="false" CodeFile="edit.aspx.vb" Inherits="edit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Treasure Hunts </title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="unitpngfix.js"></script>
 <script type="text/javascript" src="Scripts/backfix.min.js"></script> 
 <script type="text/javascript" src="Scripts/Cookies.js"></script>
 <script type="text/javascript">

     window.history.forward();
     bajb_backdetect.OnBack = function preventBack() {
         window.history.forward();
         window.setTimeout(preventBack, 1);
     }

 </script>
    
</head>
<body>

    <form id="form1" runat="server">

<div id="main_container">
	<div class="top_leafs"></div>
	<div id="header">
   	<div class="logo">
       <a href="#">Treasure Hunt</a>
        </div>
        </div>
   
    <div id="center_content">
 		<div class="left_content">
        <asp:DropDownList runat="server" ID="ddlDb" AutoPostBack="True" OnSelectedIndexChanged="ddlDb_SelectedIndexChanged">
        <asp:ListItem Text="cities" Value="cities"></asp:ListItem>
        <asp:ListItem Text="capitals" Value="capitals"></asp:ListItem>
        <asp:ListItem Text="continents" Value="continents"></asp:ListItem>
        <asp:ListItem Text="countries" Value="countries"></asp:ListItem>
        <asp:ListItem Text="monuments" Value="monuments"></asp:ListItem>
    </asp:DropDownList>  
       <asp:Panel ID="Panel2" runat="server">
           
    
    <div id="heading" runat="server" style="font-size:30px; text-align:center;"> </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" 
                BorderColor="#DEBA84" BorderWidth="6px" CellPadding="3" BorderStyle="None" 
                CellSpacing="2" Font-Names="Arial" Width="790px">
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" 
            HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" ForeColor="White" Font-Bold="True" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>

            <br />
           <table style="width:100%;">
           <tr align="center">
            <td>
                &nbsp;<asp:Button ID="Button10" runat="server" Text="EDIT MODE" CssClass="bingo" />
               </td>
            <td><asp:Button ID="Button8" runat="server" Text="LOG OUT" CssClass="bingo" /></td>
            </tr>
            </table> 
             </asp:Panel>
            
                        </div>

            
            
    <div class="bottom_content">
            	
                 
            
            	
                 
            </div>
            
   
    </div> 
    
</div>


    </form>


</body>
</html>

