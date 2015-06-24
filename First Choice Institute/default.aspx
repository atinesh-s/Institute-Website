<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site_Home.master" AutoEventWireup="true"
    CodeFile="default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <p class="header_page">
        Short Term courses provided by First Choice Institute
    </p>
    <p class="para">
        <asp:Image ID="img1" Height="20px" Width="20px" runat="server" 
            ImageUrl="~/Images/tick2.png" />&nbsp;&nbsp;Certificate Course in MS- Office [CC MSO]<br/>
        <asp:Image ID="img2" Height="20px" Width="20px" runat="server" 
            ImageUrl="~/Images/tick2.png" />&nbsp;&nbsp;Certificate Course in MS- Word [CC MSW]<br/>
        <asp:Image ID="img3" Height="20px" Width="20px" runat="server" 
            ImageUrl="~/Images/tick2.png" />&nbsp;&nbsp;Certificate Course in MS- Power-Point [CC MSPP]<br/>
        <asp:Image ID="img4" Height="20px" Width="20px" runat="server" 
            ImageUrl="~/Images/tick2.png" />&nbsp;&nbsp;Certificate Course in MS- Excel [CC MS Excel]<br/>
        <asp:Image ID="img5" Height="20px" Width="20px" runat="server" 
            ImageUrl="~/Images/tick2.png" />&nbsp;&nbsp;Certificate Course in MS- Access [CC MS Access]<br/>
    </p>
    <p class="para">
        See complete list of courses provided by first choice institute
    </p>
    <p style="padding-left: 400px">
        <asp:ImageButton ID="imgbtncourse" runat="server" Height="100px" 
            ImageUrl="~/Images/Courses.png" PostBackUrl="~/courses.aspx" Width="100px" />
    </p>
    <p class="para">
        Need help fill the feedback form we will contact you soon</p>
    <p class="para" style="padding-left: 150px">
        <asp:ImageButton ID="imgbtnconf" runat="server" Height="120px" 
            ImageUrl="~/Images/confused.png" PostBackUrl="~/feedback.aspx" Width="200px" />
    </p>
    <p class="para">
        Confused with our website structure see the complete sitemap here</p>
    <p class="para" style="padding-left: 300px">
        <asp:ImageButton ID="imgbtnsitemap" runat="server" 
            ImageUrl="~/Images/sitemap.png" PostBackUrl="~/sitemap.aspx" Width="90px" />
    </p>
</asp:Content>
