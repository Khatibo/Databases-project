<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PostAnnouncement.aspx.cs" Inherits="PostAnnouncement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Please enter the information required<br />
        <br />
        Title&nbsp; :
        <asp:TextBox ID="TextBox1" runat="server" Width="243px"></asp:TextBox>
        <br />
        <br />
        Description :<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <br />
        <br />
        Type :&nbsp; <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="margin-left: 59px" Text="Post" Width="416px" />
    
    </div>
    </form>
</body>
</html>
