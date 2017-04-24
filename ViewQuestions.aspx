<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewQuestions.aspx.cs" Inherits="ViewQuestions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    <div>
    
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        Please Enter The Question Number :
        <asp:TextBox ID="TextBox1" runat="server" Height="28px" Width="177px"></asp:TextBox>
&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Answer" Width="134px" />
        <br />
&nbsp;<br />
        <span class="auto-style1">Answer :</span><asp:TextBox ID="TextBox2" runat="server" Height="101px" Width="586px"></asp:TextBox>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
