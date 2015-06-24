<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="Admin" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="aj" %>

<asp:Content runat="server" ID="Head" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= drpdwnlststudorstafforadmin.ClientID %>').selectbox();
            $('#<%= drpdwnlstrole4.ClientID %>').selectbox();
            $('#<%= drpdwnlstsecquesf.ClientID %>').selectbox();
        });
    </script>
</asp:Content>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="sqldtsrcnewsupdt" runat="server" 
    ConnectionString="<%$ ConnectionStrings:Datasrc_ConnectionString %>" 
    SelectCommand="SELECT * FROM [NewsFeed_Table]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sqldtsrcfeedback" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Datasrc_ConnectionString %>" 
        SelectCommand="SELECT * FROM [FeedBack_Table]"></asp:SqlDataSource>

    <aj:TabContainer ID="TabContainer" runat="server" ActiveTabIndex="0">
        
        <aj:TabPanel ID="asgnid" runat="server" HeaderText="Assign ID">
            <HeaderTemplate>Assign ID</HeaderTemplate>
            <ContentTemplate>          
            <table>
                <tr>
                    <td colspan="3">
                    <asp:Panel ID="pnlst" runat="server" CssClass="panel_abc" Height="250px" Width="400px">
                    <table style="margin:30px">
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblid" runat="server" Text="*ID :" Font-Names="Arial" Font-Size="12px" 
                                ForeColor="#003333"></asp:Label>
                            </td>
                            <td>              
                                <asp:TextBox ID="txtid" runat="server" ValidationGroup="g1" ToolTip="ID" Font-Names="Arial" 
                                Font-Size="12px" ForeColor="#003333" CssClass="input_style" Width="150px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqfldvalid" runat="server" ControlToValidate="txtid" 
                                ErrorMessage="Please Enter ID" ToolTip="Please Enter ID" ValidationGroup="g1">
                                    <img alt="warning" height="20px" src="Images/warning.png" width="20px" /></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpvalid" runat="server" 
                                    ControlToValidate="txtid" ErrorMessage="Only 20 characters are allowed" 
                                    ToolTip="Only 20 characters are allowed" 
                                    ValidationExpression="^[a-zA-Z'@&amp;amp;#.\s]{1,20}$" ValidationGroup="g1"><img alt="warning" 
                                    height="20px" src="Images/warning.png" width="20px" /></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                 <asp:Label ID="lblname" runat="server" Text="*Full Name :" Font-Names="Arial" 
                                 Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtname" runat="server" ValidationGroup="g1" ToolTip="Name" 
                                Font-Names="Arial" Font-Size="12px" ForeColor="#003333" CssClass="input_style" 
                                Width="150px"></asp:TextBox>
                            </td>
                            <td>                      
                                <asp:RequiredFieldValidator ID="reqfldvalname" runat="server" 
                                ErrorMessage="Please Enter Full Name" ControlToValidate="txtname" ValidationGroup="g1" 
                                ToolTip="Please Enter Full Name"><img alt="warning" height="20px" src="Images/warning.png" 
                                Width="20px" /></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpvalname" runat="server" 
                                    ControlToValidate="txtname" ErrorMessage="Only 20 characters are allowed" 
                                    ToolTip="Only 20 characters are allowed" 
                                    ValidationExpression="^[a-zA-Z'@&amp;amp;#.\s]{1,20}$" ValidationGroup="g1"><img alt="warning" 
                                    height="20px" src="Images/warning.png" width="20px" /></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lbltmppass" runat="server" Text="*Temporary Password :" 
                                Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txttmppass" runat="server" ValidationGroup="g1" TextMode="Password" 
                                ToolTip="Password" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" CssClass="input_style" 
                                Width="150px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqfldvaltmppass" runat="server" ControlToValidate="txttmppass" 
                            ErrorMessage="Please Enter Temporary Password" ValidationGroup="g1" ToolTip="Please Enter Temporary Password">
                                    <img alt="warning" height="20px" src="Images/warning.png" Width="20px" /></asp:RequiredFieldValidator>
                    
                                <asp:RegularExpressionValidator ID="regexpvaltmppass" runat="server" 
                                    ControlToValidate="txttmppass" ErrorMessage="Only 50 characters are allowed" 
                                    ToolTip="Only 50 characters are allowed" 
                                    ValidationExpression="^[a-zA-Z'@&amp;amp;#.\s]{1,50}$" ValidationGroup="g1"><img alt="warning" 
                                    height="20px" src="Images/warning.png" width="20px" /></asp:RegularExpressionValidator>
                    
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblstudorstafforadmin" runat="server" Text="*Student/Staff/Admin :" 
                                Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpdwnlststudorstafforadmin" runat="server" ValidationGroup="g1" CssClass="selectbox"
                                ToolTip="Select Role" Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqfldvalstudorstaff" runat="server" ControlToValidate="drpdwnlststudorstafforadmin" 
                                ErrorMessage="Please Select Role" ValidationGroup="g1" ToolTip="Please Select Role"><img 
                                alt="warning" height="20px" src="Images/warning.png" Width="20px" /></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="btnsubmit" runat="server" Text="Submit" ValidationGroup="g1" onclick="btnsubmit_Click" 
                                ToolTip="Submit" BackColor="#459AA9" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" Height="35px" Width="100px" />
                                <aj:RoundedCornersExtender ID="btnsubmit_RoundedCornersExtender" runat="server" BorderColor="0, 51, 51" Enabled="True" 
                                Radius="10" TargetControlID="btnsubmit"></aj:RoundedCornersExtender>
                                <asp:Button ID="btnview" runat="server" OnClick="btnview_Click" Text="View Details" ToolTip="View Details" 
                                BackColor="#459AA9" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" Height="35px" />
                                <aj:RoundedCornersExtender ID="btnview_RoundedCornersExtender" runat="server" BorderColor="0, 51, 51" 
                                Enabled="True" Radius="10" TargetControlID="btnview"></aj:RoundedCornersExtender>
                            </td>
                            <td>
                            
                            </td>
                        </tr>
                    </table>
                    </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3">
                        <asp:UpdateProgress ID="updtprg0" runat="server">
                            <progresstemplate>
                                <img alt="loading" height="20px" src="Images/loading.gif" width="20px" /><font color="#003333" face="Arial" style="font-family: arial; font-size: 12px; 
                                    font-weight: bold">Updating Database...</font>

                            </progresstemplate>
                        </asp:UpdateProgress>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:UpdatePanel ID="updtpnlmsg0" runat="server">
                            <ContentTemplate>
                                <asp:Panel ID="pnlmsg0" runat="server">                      
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Image ID="imgalert0" runat="server" CssClass="image" Height="30" Width="30" />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblmsg0" runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="12px" ForeColor="Black"></asp:Label>
                                        </td>
                                    </tr>
                                </table>                       
                                </asp:Panel>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnsubmit" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:UpdatePanel ID="updtpnlviewdetails" runat="server">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td valign="top" colspan="2">
                                        <asp:Panel ID="pnldt" runat="server" CssClass="panel_abc" Height="450px" Width="400px">
                                        <table style="margin:30px">
                                            <tr>
                                                <td valign="top">
                                                    <asp:Label ID="lblid2" runat="server" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" Text="ID :"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtid2" runat="server" CssClass="input_style" Enabled="False" Font-Names="Arial" Font-Size="12px" 
                                                    ForeColor="#003333" ToolTip="ID" Width="150px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:Label ID="lblname2" runat="server" Text="Name :" Font-Names="Arial" Font-Size="12px" 
                                                    ForeColor="#003333"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtname2" runat="server" Enabled="False" ToolTip="Name" Font-Names="Arial" Font-Size="12px" 
                                                    ForeColor="#003333" CssClass="input_style" Width="150px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:Label ID="lblparentname" runat="server" Text="Parent Name :" Font-Names="Arial" Font-Size="12px" 
                                                    ForeColor="#003333"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtparentname" runat="server" Enabled="False" ToolTip="Parent Name" Font-Names="Arial" 
                                                    Font-Size="12px" ForeColor="#003333" CssClass="input_style" Width="150px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:Label ID="lbldob" runat="server" Text="Date Of Birth :" Font-Names="Arial" Font-Size="12px" 
                                                    ForeColor="#003333"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtdob" runat="server" Enabled="False" ToolTip="DOB" Font-Names="Arial" Font-Size="12px" 
                                                    ForeColor="#003333" CssClass="input_style" Width="150px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:Label ID="lblmobno" runat="server" Text="Mobile No. :" Font-Names="Arial" Font-Size="12px" 
                                                    ForeColor="#003333"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtmobno" runat="server" Enabled="False" ToolTip="Mobile No." Font-Names="Arial" Font-Size="12px" 
                                                    ForeColor="#003333" CssClass="input_style" Width="150px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:Label ID="lblemailadd" runat="server" Text="Email Add. :" Font-Names="Arial" Font-Size="12px" 
                                                    ForeColor="#003333"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtemailadd" runat="server" Enabled="False" ToolTip="Email" Font-Names="Arial" Font-Size="12px" 
                                                    ForeColor="#003333" CssClass="input_style" Width="150px"></asp:TextBox>
                                                </td>
                                            </tr> 
                                            <tr>
                                                <td valign="top">
                                                    <asp:Label ID="lbladd" runat="server" Text="Address Of Communication :" Font-Names="Arial" Font-Size="12px" 
                                                    ForeColor="#003333"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtadd" runat="server" Enabled="False" Height="80px" TextMode="MultiLine" Width="200px" 
                                                    ToolTip="Address" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" CssClass="textarea_style"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <asp:Button ID="btnhide" runat="server" onclick="btnhide_Click" Text="Hide Details" ToolTip="Hide Details" 
                                                    BackColor="#459AA9" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" Height="35px" />
                                                    <aj:RoundedCornersExtender ID="btnhide_RoundedCornersExtender" runat="server" BorderColor="0, 51, 51" Enabled="True" 
                                                    Radius="10" TargetControlID="btnhide">
                                                    </aj:RoundedCornersExtender>
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                        </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnview" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnhide" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
            </ContentTemplate>
        </aj:TabPanel>

        <aj:TabPanel runat="server" ID="rmuser" HeaderText="Remove User" >
            <HeaderTemplate>Remove User</HeaderTemplate>
            <ContentTemplate>
                <table>
                    <tr>
                        <td colspan="3">
                            <asp:Panel ID="pnlremove" runat="server" CssClass="panel_abc" Height="200px" Width="480px">
                            <table style="margin:30px">
                                <tr>
                                    <td valign="top">
                                        <asp:Label runat="server" ID="lblid4" Text="*ID :" Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtid4" ValidationGroup="g4" ToolTip="ID" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" 
                                        CssClass="input_style" Width="150px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="reqfldvalid4" runat="server" ControlToValidate="txtid4" ErrorMessage="Please Enter ID" 
                                        ToolTip="Please Enter ID" ValidationGroup="g4"><img alt="warning" height="20px" src="Images/warning.png" width="20px" />
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <asp:Label runat="server" ID="lblname4" Text="Name :" Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtname4" Enabled="False" ToolTip="Name" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" 
                                        CssClass="input_style" Width="150px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Button runat="server" ID="btncheckname4" Text="Check Name" onclick="btncheckname4_Click" ToolTip="Check Name" 
                                        BackColor="#459AA9" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" Height="35px"/>
                                        <aj:RoundedCornersExtender ID="btncheckname4_RoundedCornersExtender" runat="server" BorderColor="0, 51, 51" Enabled="True" 
                                        Radius="10" TargetControlID="btncheckname4">
                                        </aj:RoundedCornersExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <asp:Label runat="server" ID="lblstorstafforad4" Text="*Student/Staff/Admin :" Font-Names="Arial" Font-Size="12px" 
                                        ForeColor="#003333"></asp:Label>
                                    </td>
                                    <td colspan="2">
                                        <asp:DropDownList runat="server" ID="drpdwnlstrole4" CssClass="selectbox" ToolTip="Select Role" Font-Names="Arial" Font-Size="12px" ForeColor="#003333">
                                        </asp:DropDownList>
                                     </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="center">
                                        <asp:Button runat="server" ID="btnremove4" Text="Remove User" onclick="btnremove4_Click" ValidationGroup="g4" ToolTip="Remove User" 
                                        BackColor="#459AA9" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" Height="35px"/>
                                        <aj:RoundedCornersExtender ID="btnremove4_RoundedCornersExtender" runat="server" BorderColor="0, 51, 51" Enabled="True" Radius="10" 
                                        TargetControlID="btnremove4">
                                        </aj:RoundedCornersExtender>
                                    </td>
                                </tr>
                            </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <asp:UpdateProgress ID="updtprg1" runat="server">
                                <ProgressTemplate>
                                    <img alt="loading" height="20px" src="Images/loading.gif" width="20px" /><font color="#003333" face="Arial" style="font-family: arial; font-size: 12px; font-weight: bold">Checking Name...</font>
                                </ProgressTemplate>
                            </asp:UpdateProgress>                         
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:UpdatePanel ID="updtpnlmsg1" runat="server">
                                <ContentTemplate>
                                   <asp:Panel ID="pnlmsg1" runat="server">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Image ID="imgalert1" runat="server" CssClass="image" Height="30" Width="30" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblmsg1" runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="12px" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btncheckname4" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </aj:TabPanel>
        
        <aj:TabPanel ID="newsfeed" runat="server" HeaderText="News Feed">
            <HeaderTemplate>News Feed</HeaderTemplate>
            <ContentTemplate>
            <table>
                <tr>
                    <td valign="top">
                        <asp:Panel ID="pnlnews" runat="server" CssClass="panel_abc" Height="450px" Width="550px">
                        <table style="margin:30px">
                            <tr>
                                <td valign="top">
                                    <asp:Label ID="lblnews" runat="server" Text="*News Update :" Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                                </td>
                                <td colspan="1">
                                    <asp:TextBox ID="txtnewsupdate" runat="server" Height="100px" TextMode="MultiLine" ValidationGroup="g2" Width="200px" 
                                    ToolTip="Latest Update" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" CssClass="textarea_style"></asp:TextBox>
                                </td>
                                <td valign="top" colspan="2">
                                    <asp:RequiredFieldValidator ID="reqfldvalnewsfeed" runat="server" ControlToValidate="txtnewsupdate" 
                                    ErrorMessage="Please Enter The News To Update" ToolTip="Please Enter The News To Update" ValidationGroup="g2"><img alt="warning" 
                                    height="20px" src="Images/warning.png" Width="20px" /></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regexpvalnews" runat="server" 
                                        ControlToValidate="txtnewsupdate" 
                                        ErrorMessage="Only 200 characters are allowed" 
                                        ToolTip="Only 20 characters are allowed" 
                                        ValidationExpression="^[a-zA-Z'@&amp;amp;#.\s]{1,200}$" ValidationGroup="g2"><img alt="warning" 
                                    height="20px" src="Images/warning.png" Width="20px" /></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center">
                                    <asp:Button ID="btnsubmit2" ValidationGroup="g2" runat="server" Text="Submit" onclick="btnsubmit2_Click" ToolTip="Submit" 
                                    BackColor="#459AA9" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" Height="35px" Width="100px" />
                                    <aj:RoundedCornersExtender ID="btnsubmit2_RoundedCornersExtender" runat="server" BorderColor="0, 51, 51" Enabled="True" Radius="10" 
                                    TargetControlID="btnsubmit2"></aj:RoundedCornersExtender>                 
                                </td>
                                <td>
                                
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <asp:UpdatePanel ID="updtpnlnews" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="grdviewnews" runat="server" AllowPaging="True" 
                                            AutoGenerateColumns="False" DataSourceID="sqldtsrcnewsupdt" 
                                        PageSize="2" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" 
                                            CssClass="GridViewStyle" Width="460px">
                                        <Columns>
                                            <asp:BoundField DataField="N_ID" HeaderText="ID" ReadOnly="True" >
                                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="News">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblnews" Text='<%# Bind("NewsFeed") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Select">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkselect" runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="40px" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <RowStyle CssClass="RowStyle" />
                                        <PagerStyle CssClass="PagerStyle" />
                                        <SelectedRowStyle CssClass="SelectedRowStyle" />
                                        <HeaderStyle CssClass="HeaderStyle" />
                                        <EditRowStyle CssClass="EditRowStyle" />
                                        <AlternatingRowStyle CssClass="AltRowStyle" />
                                        </asp:GridView>
                                        <br />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="imgbtnrefresh" EventName="Click"/>
                                    </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                                <td align="left" colspan="2" valign="top">
                                    <asp:ImageButton ID="imgbtnrefresh" runat="server" Height="20px" ImageUrl="~/Images/refresh.png" OnClick="imgbtnrefresh_Click" 
                                    ToolTip="Refresh Gridview" Width="20px" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="4">
                                    <asp:Button ID="btnremove2" runat="server" BackColor="#459AA9" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" Height="35px" 
                                    onclick="btnremove2_Click" Text="Remove" ToolTip="Remove" Width="100px" />
                                    <aj:RoundedCornersExtender ID="btnremove2_RoundedCornersExtender" runat="server" BorderColor="0, 51, 51" Enabled="True" Radius="10" 
                                    TargetControlID="btnremove2"></aj:RoundedCornersExtender>
                                </td>
                            </tr>
                        </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <asp:UpdateProgress ID="updtprg2" runat="server">
                            <ProgressTemplate>
                                <img alt="loading" height="20px" src="Images/loading.gif" width="20px" /><font color="#003333" face="Arial" style="font-family: arial; font-size: 12px; font-weight: bold">Updating Database...</font>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:UpdatePanel ID="updtpnlmsg2" runat="server">
                            <ContentTemplate>
                                <asp:Panel runat="server" ID="pnlmsg2" HorizontalAlign="Left">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Image ID="imgalert2" runat="server" Height="30" Width="30" CssClass="image" />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblmsg2" runat="server" Font-Names="Arial" Font-Size="12px" ForeColor="Black" Font-Bold="False"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                </asp:Panel>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnsubmit2" EventName="Click"/>
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
            </ContentTemplate>
        </aj:TabPanel>
        
        <aj:TabPanel runat="server" ID="feedback" HeaderText="User Feedback">
            <HeaderTemplate>User Feedback</HeaderTemplate>
            <ContentTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Panel ID="pnlresmsg" runat="server" CssClass="panel_abc" Height="350px" Width="600px">
                            <table style="margin:30px">
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="updtpnlfeedback" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="grdviewfeedback" runat="server" AllowPaging="True" 
                                                    AutoGenerateColumns="False" CssClass="GridViewStyle" 
                                                DataSourceID="sqldtsrcfeedback" Font-Names="Arial" Font-Size="12px" 
                                                    ForeColor="#003333" PageSize="5" Width="520px">
                                                    <Columns>
                                                        <asp:BoundField DataField="F_ID" HeaderText="ID" >
                                                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Name" HeaderText="Name" >
                                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Email" HeaderText="Email" >
                                                        <ItemStyle Width="50px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Subject" HeaderText="Subject" />
                                                        <asp:BoundField DataField="Comment" HeaderText="Comment" />
                                                        <asp:TemplateField HeaderText="Select">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkselect" runat="server" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" Width="40px" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <RowStyle CssClass="RowStyle" />
                                                    <PagerStyle CssClass="PagerStyle" />
                                                    <SelectedRowStyle CssClass="SelectedRowStyle" />
                                                    <HeaderStyle CssClass="HeaderStyle" />
                                                    <EditRowStyle CssClass="EditRowStyle" />
                                                    <AlternatingRowStyle CssClass="AltRowStyle" />
                                                </asp:GridView> 
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="imgbtnrefresh5" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td align="left" valign="top">
                                        <asp:ImageButton ID="imgbtnrefresh5" runat="server" Height="20px" ImageUrl="~/Images/refresh.png" OnClick="imgbtnrefresh5_Click" Width="20px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:Button ID="btndelete5" runat="server" BackColor="#459AA9" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" Height="35px" 
                                        OnClick="btndelete5_Click" Text="Delete" ToolTip="Delete Records" Width="100px" />
                                        <aj:RoundedCornersExtender ID="btndelete5_RoundedCornersExtender" runat="server" BorderColor="0, 51, 51" Enabled="True" Radius="10" 
                                        TargetControlID="btndelete5"></aj:RoundedCornersExtender>
                                    </td>
                                </tr>
                            </table>
                            </asp:Panel>
                        </td>
                   </tr>         
                </table>
            </ContentTemplate>
        </aj:TabPanel>
        
        <aj:TabPanel ID="chngpassadmin" runat="server" HeaderText="Change Password">
            <HeaderTemplate>Change Password</HeaderTemplate>
            <ContentTemplate>
                <table>
                    <tr>
                        <td align="left" colspan="4">
                            <asp:Panel ID="pnlpassadmin" runat="server" CssClass="panel_abc" Height="600px" Width="500px">
                            <asp:Panel ID="pnlchngpass" runat="server" GroupingText="Change Password" CssClass="panel_group" ForeColor="#003333">
                            <table style="margin:10px">
                                <tr>
                                    <td align="left" valign="top">
                                        <asp:Label ID="lblnewpass" runat="server" Text="*New Password :" Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtnewpass" runat="server" TextMode="Password" ValidationGroup="g3" ToolTip="Password" Font-Names="Arial" 
                                        Font-Size="12px" ForeColor="#003333" CssClass="input_style" Width="150px"></asp:TextBox>
                                        <br />
                                        <asp:Label ID="lblhelpf" runat="server" Font-Italic="True" Font-Names="Arial" 
                                            Font-Size="9px" ForeColor="#003333" Width="150px"></asp:Label>
                                        <aj:PasswordStrength ID="txtnewpass_PasswordStrength" runat="server" Enabled="True" 
                                        HelpHandlePosition="RightSide" TargetControlID="txtnewpass" PreferredPasswordLength="10" 
                                        MinimumNumericCharacters="1" MinimumSymbolCharacters="1" HelpStatusLabelID="lblhelpf">
                                        </aj:PasswordStrength>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="reqfldvalnewpass" runat="server" ControlToValidate="txtnewpass" ErrorMessage="Please Enter Your New Password" 
                                        ToolTip="Please Enter Your New Password" ValidationGroup="g3"><img alt="warning" height="20px" src="Images/warning.png" width="20px" /></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regexpvalpass" runat="server" 
                                            ControlToValidate="txtnewpass" ErrorMessage="Only 50 characters are allowed" 
                                            ToolTip="Only 50 characters are allowed" 
                                            ValidationExpression="^[a-zA-Z'@&amp;amp;#.\s]{1,50}$" ValidationGroup="g3"><img alt="warning" height="20px" src="Images/warning.png" width="20px" /></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" valign="top">
                                        <asp:Label ID="lblcnfrmpass" Text="*Confirm Password :" runat="server" Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtconfrmpass" TextMode="Password" ValidationGroup="g3" runat="server" ToolTip="Confirm Password" Font-Names="Arial" 
                                        Font-Size="12px" ForeColor="#003333" CssClass="input_style" Width="150px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="reqfldvalcnfrmpass" runat="server" ControlToValidate="txtconfrmpass" ErrorMessage="Please Confirm Your Password" 
                                        ValidationGroup="g3" ToolTip="Please Confirm Your Password"><img alt="warning" height="20px" src="Images/warning.png" width="20px" /></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="cmpvalpass" ControlToValidate="txtconfrmpass" ControlToCompare="txtnewpass" ValidationGroup="g3" runat="server" 
                                        ErrorMessage="Password Didn't Match" ToolTip="Password Didn't Match"><img alt="warning" height="20px" src="Images/warning.png" 
                                        width="20px" /></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="3">
                                        <asp:Button ID="btnsubmit3" runat="server" Text="Submit" ValidationGroup="g3" onclick="btnsubmit3_Click" ToolTip="Submit" BackColor="#459AA9" 
                                        Font-Names="Arial" Font-Size="12px" ForeColor="#003333" Height="35px" Width="100px" />
                                        <aj:RoundedCornersExtender ID="btnsubmit3_RoundedCornersExtender" runat="server" BorderColor="0, 51, 51" Enabled="True" Radius="10" 
                                        TargetControlID="btnsubmit3"></aj:RoundedCornersExtender>
                                    </td>
                                </tr>
                            </table>
                            </asp:Panel>
                            <asp:Panel ID="pnlperdt" runat="server" GroupingText="Personal Details" CssClass="panel_group" ForeColor="#003333">
                            <table style="margin:10px">
                                <tr>
                                    <td valign="top">                       
                                        <asp:Label ID="lblemailf" runat="server" Text="Email Address :" Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>                        
                                    </td>
                                    <td>                        
                                        <asp:TextBox ID="txtemailf" runat="server" CssClass="input_style" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" Width="150px" 
                                        ValidationGroup="gf"></asp:TextBox>                       
                                    </td>
                                    <td>                        
                                        <asp:RequiredFieldValidator ID="reqfldvalemailf" runat="server" ControlToValidate="txtemailf" ErrorMessage="Please Enter Your Email Address" 
                                        ToolTip="Please Enter Your New Password" ValidationGroup="gf"><img alt="warning" height="20px" src="Images/warning.png" width="20px" />
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regexpvalemailf" runat="server" ControlToValidate="txtemailf" ErrorMessage="Please Enter Your Correct Email Add." 
                                        ToolTip="Please Enter Your Correct Email Add." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="gf"><img 
                                        alt="warning" height="20px" src="Images/warning.png" width="20px" /></asp:RegularExpressionValidator>                       
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <asp:Label ID="lblgenderf" runat="server" Text="Gender :" Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                                    </td>   
                                    <td>
                                        <asp:RadioButtonList ID="rdbtnlstgenderf" runat="server" Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:RadioButtonList>
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <asp:Label ID="lblsecquesf" runat="server" Text="Security Question :" Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drpdwnlstsecquesf" runat="server" Font-Names="Arial"
                                            Font-Size="12px" ForeColor="#003333" Width="200px" CssClass="selectbox"></asp:DropDownList>
                                        <asp:Label ID="lblwarf" runat="server" Font-Italic="True" Font-Names="Arial" 
                                            Font-Size="11px" ForeColor="#003333" 
                                            Text="If you forget your password we will ask for the answer to your security question"></asp:Label>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <asp:Label ID="lblsecans" runat="server" Font-Names="Arial" Font-Size="12px" 
                                            ForeColor="#003333" Text="Security Answer :"></asp:Label>
                                    </td>
                                    <td>
                                    
                                        <asp:TextBox ID="txtsecansf" runat="server" CssClass="input_style" 
                                            Font-Names="Arial" Font-Size="12px" ForeColor="#003333" ValidationGroup="gf" 
                                            Width="150px"></asp:TextBox>
                                    
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="reqfldvalnewpass1" runat="server" 
                                            ControlToValidate="txtnewpass" ErrorMessage="Please Enter Your New Password" 
                                            ToolTip="Please Enter Your New Password" ValidationGroup="gf"><img 
                                            alt="warning" height="20px" src="Images/warning.png" width="20px" /></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regexpvalsans" runat="server" 
                                            ControlToValidate="txtsecansf" ErrorMessage="Only 50 characters are allowed" 
                                            ToolTip="Only 50 characters are allowed" 
                                            ValidationExpression="^[a-zA-Z'@&amp;amp;#.\s]{1,50}$" ValidationGroup="gf"><img 
                                            alt="warning" height="20px" src="Images/warning.png" width="20px" /></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnsubmitf" runat="server" BackColor="#459AA9" 
                                            Font-Names="Arial" Font-Size="12px" ForeColor="#003333" Height="35px" 
                                            OnClick="btnsubmitf_Click" Text="Submit" ToolTip="Submit" ValidationGroup="gf" 
                                            Width="100px"></asp:Button>
                                        <aj:RoundedCornersExtender ID="btnsubmitf_RoundedCornersExtender" 
                                            runat="server" BorderColor="0, 51, 51" Enabled="True" Radius="10" 
                                            TargetControlID="btnsubmitf"></aj:RoundedCornersExtender>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                            </asp:Panel>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="4">
                            <asp:UpdateProgress ID="updtprg4" runat="server">
                            <ProgressTemplate>
                                <img alt="loading" height="20px" src="Images/loading.gif" width="20px" /><font color="#003333" face="Arial" style="font-family: arial; font-size: 12px; font-weight: bold">Updating Database...</font>
                            </ProgressTemplate>
                            </asp:UpdateProgress>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="4">
                            <asp:UpdatePanel ID="updtpnlmsg4" runat="server">
                            <ContentTemplate>
                                <asp:Panel ID="pnlmsg4" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Image ID="imgalert4" runat="server" CssClass="image" Height="30" Width="30" />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblmsg4" runat="server" Font-Bold="False" Font-Names="Arial" Font-Size="12px" ForeColor="Black"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                </asp:Panel>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnsubmit3" EventName="Click" />
                            </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>       
        </aj:TabPanel>

    </aj:TabContainer>

</asp:Content>

