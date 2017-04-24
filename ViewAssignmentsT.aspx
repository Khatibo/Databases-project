<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewAssignmentsT.aspx.cs" Inherits="ViewAssignmentsT" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    <div>
    
        <br />
        Student SSN:
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Grade" />
        <br />
        Assignment number :
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        Grade:&nbsp; <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
    
    </div>
    </form>
</body>
</html>
