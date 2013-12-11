<%@ Page Language="VB" AutoEventWireup="false" CodeFile="admin.aspx.vb" Inherits="admin" %>

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

     function Button1_onclick() {
         location.replace("edit.aspx");
     }

     function Button6_onclick() {
         location.replace("edit.aspx");
     }

 </script>
    <style type="text/css">
        #TextArea1
        {
            width: 400px;
            height: 50px;
        }
        #TextArea2
        {
            width: 400px;
            height: 50px;
        }
        #TextArea3
        {
            width: 400px;
            height: 50px;
        }
        #TextArea4
        {
            width: 400px;
            height: 50px;
        }
        .style2
        {
            width: 297px;
        }
        .style3
        {
            width: 296px;
        }
        .style4
        {
            width: 271px;
        }
        .style5
        {
            width: 445px;
        }
        .style6
        {
            width: 249px;
        }
        .style7
        {
            width: 264px;
        }
        </style>
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

          <asp:Panel ID="Panel1" runat="server">
          <div id="heading" runat="server" style="font-size:30px; text-align:center;"> </div>
          <br />
              <h1> Select the Question ID to edit</h1> 
              <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
             </asp:DropDownList>
                 
                 <br />
                 
                 <br />
              

                 <table style="width:100%;">
                   <tr align="left">
                      <td class="style2"> <asp:Label ID="Label1" runat="server" Text="PLACE"></asp:Label>
                      </td>
                        
                         <td class="style6"> <asp:TextBox ID="TextBox1" runat="server" Width="400px" ></asp:TextBox>
                             <br />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                 ControlToValidate="TextBox1" ErrorMessage="* value is required" 
                                 BackColor="#FF3300" BorderColor="#FF3300" BorderStyle="None" Font-Bold="True" 
                                 Height="16px"></asp:RequiredFieldValidator>
                             <br />
                         </td>
                     </tr>
                <tr align="left">
                         <td class="style3"> 
                             <asp:Label ID="Label5" runat="server" Text="LATLANG"></asp:Label>
                         </td>
                         <td class="style6"> 
                             <asp:TextBox ID="TextBox3" runat="server" Width="400px"></asp:TextBox>
                             <br />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                 ControlToValidate="TextBox3" ErrorMessage="* value is required" 
                                 BackColor="#FF3300" BorderColor="#FF3300" BorderStyle="None" Font-Bold="True" 
                                 Height="16px"></asp:RequiredFieldValidator>
                             <br />
                             <br />
                             <asp:TextBox ID="TextBox5" runat="server" Width="400px"></asp:TextBox>
                             <br />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                 ControlToValidate="TextBox5" ErrorMessage="* value is required" 
                                 BackColor="#FF3300" BorderColor="#FF3300" BorderStyle="None" Font-Bold="True" 
                                 Height="16px"></asp:RequiredFieldValidator>
                             <br />
                             <br />
                         </td>
                  
                     </tr>
                      <tr align="left">
                     <td class="style3">
                         <asp:Label ID="Label4" runat="server" Text="ZOOMLEVEL"></asp:Label>
                     </td>
                     <td class="style6" align="left">
                         <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"> 
                         <asp:ListItem Text="2" Value="2"></asp:ListItem>
                         <asp:ListItem Text="3" Value="3"></asp:ListItem>
                         <asp:ListItem Text="4" Value="4"></asp:ListItem>
                         <asp:ListItem Text="5" Value="5"></asp:ListItem>
                         <asp:ListItem Text="6" Value="6"></asp:ListItem>
                         <asp:ListItem Text="7" Value="7"></asp:ListItem>
                         <asp:ListItem Text="8" Value="8"></asp:ListItem>
                         <asp:ListItem Text="9" Value="9"></asp:ListItem>
                         <asp:ListItem Text="10" Value="10"></asp:ListItem>
                         <asp:ListItem Text="11" Value="11"></asp:ListItem>
                         <asp:ListItem Text="12" Value="12"></asp:ListItem>
                    
                         </asp:DropDownList>
                         <br />
                         &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
                         <div id="dif" runat="server" style="font-size:30px; text-align:center;"> </div>
                         
               
                         <br />
                     </td>
                     
                     </tr>
                     
                     <tr align="left">
                         <td class="style3">
                            <asp:Label ID="Label2" runat="server" Text="CLUE"></asp:Label>
                         </td>
                         <td class="style6">
                             <textarea ID="TextArea1" runat="server" cols="400" name="S2" rows="5"> </textarea>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                 ControlToValidate="TextArea1" ErrorMessage="* value is required" 
                                 BackColor="#FF3300" BorderColor="#FF3300" BorderStyle="None" Font-Bold="True" 
                                 Height="16px"></asp:RequiredFieldValidator>
                             <br />
                         </td>
                     </tr>
                     <tr align="left">
                     <td class="style3">
                         <asp:Label ID="Label6" runat="server" Text="HINT1"></asp:Label>
                     </td>
                     <td class="style6">
                         <textarea id="TextArea2" name="S2" rows="5" cols="400" runat="server"> </textarea><br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                 ControlToValidate="TextArea2" ErrorMessage="* value is required" 
                             BackColor="#FF3300" BorderColor="#FF3300" BorderStyle="None" Font-Bold="True" 
                             Height="16px"></asp:RequiredFieldValidator>
                     </td>
                     </tr>
                      <tr align="left">
                     <td class="style5">
                         <asp:Label ID="Label7" runat="server" Text="HINT2"></asp:Label>
                     </td>
                     <td class="style6">
                        <textarea id="TextArea3" name="S2" rows="5" cols="400" runat="server"> </textarea><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                 ControlToValidate="TextArea3" ErrorMessage="* value is required" 
                             BackColor="#FF3300" BorderColor="#FF3300" BorderStyle="None" Font-Bold="True" 
                             Height="16px"></asp:RequiredFieldValidator>
                     </td>
                     </tr>
                      <tr align="left">
                     <td class="style3">
                         <asp:Label ID="Label8" runat="server" Text="HINT3"></asp:Label>
                         <br />
                         <br />
                         <br />
                         <br />
                     </td>
                     <td class="style6">
                         <textarea id="TextArea4" name="S2" rows="5" cols="400" runat="server"> </textarea><br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                             ControlToValidate="TextArea4" ErrorMessage="* value is required" 
                             BackColor="#FF3300" BorderColor="#FF3300" BorderStyle="None" Font-Bold="True" 
                             Height="16px"></asp:RequiredFieldValidator>
                          </td>

                     </tr>
                     </table>
                     
                 <asp:Panel ID="Panel4" runat="server">
              
                  <table style="width:100%;">   
                     <tr align="center">
                     <td>
                     <asp:Button ID="Button2" runat="server" Text="STORE" CssClass="bingo" />
                     </td>
                     <td>
                      <asp:Button ID="Button3" runat="server" Text="CLEAR" CausesValidation="false"  CssClass="bingo"/>
                     </td>
                     <td>
                         <input id="Button1" type="button" value="BACK" onclick="return Button1_onclick()" class="bingo" />
                     </td>
                     </tr>
                 </table>
                    </asp:Panel>     

                      <asp:Panel ID="Panel5" runat="server">
              
                  <table style="width:100%;">   
                     <tr align="center">
                     <td class="style7">
                     <asp:Button ID="Button4" runat="server" Text="UPDATE" CssClass="bingo" />
                     </td>
                     <td class="style4">
                     <asp:Button ID="Button5" runat="server" Text="DELETE" CssClass="bingo" />
                     </td>
                     <td>
                         <input id="Button6" type="button" value="BACK" onclick="return Button6_onclick()"  class="bingo" />
                     </td>
                     </tr>
                 </table>
                    </asp:Panel>   
  
            </asp:Panel>

   </div>
            
            
    <div class="bottom_content">
            	
                 
            </div>
            
   
    </div> 
    
</div>


    </form>


</body>
</html>

