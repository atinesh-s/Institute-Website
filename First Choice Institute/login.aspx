<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="studentnStaff" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content runat="server" ID="Head" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">
        $(document).ready(function () 
            {
                $('#<%= drpdwnrole.ClientID %>').selectbox(); 
            });
    </script>
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="MainContent" Runat="Server">
    <table>
        <tr>
            <td valign="top">
                <asp:Panel ID="pnllogin" runat="server" CssClass="panel_abc" Height="350px" 
                    Width="330px">
                    <table style="margin: 20px">
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Label ID="lbllogin" runat="server" Font-Bold="True" Font-Names="Arial" 
                                    Font-Size="16px" ForeColor="#003333" Text="User Log In" 
                                    CssClass="header_page"></asp:Label>
                                <asp:Image ID="imglogin" runat="server" Height="30px" 
                                    ImageUrl="~/Images/user login.gif" Width="30px" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lbluserid" runat="server" Text="*User Id :" Font-Names="Arial" 
                                    Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:TextBox ID="txtuserid" runat="server" ValidationGroup="g1" ToolTip="ID" 
                                    Font-Names="Arial" Font-Size="12px" CssClass="input_style" Width="250px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqfldvaluserid" runat="server" 
                                    ControlToValidate="txtuserid" ErrorMessage="Please Enter Your User Id" 
                                    ValidationGroup="g1" ToolTip="Please Enter Your User Id"><img alt="warning" height="20px" src="Images/warning.png" 
                                    Width="20px" /></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblpassword" runat="server" Text="*Password :" 
                                    Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:TextBox ID="txtpassword" runat="server" ValidationGroup="g1" 
                                    TextMode="Password" ToolTip="Password" Font-Names="Arial" Font-Size="12px" 
                                    CssClass="input_style" Width="250px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqfldvalpassword" runat="server" 
                                    ControlToValidate="txtpassword" ErrorMessage="Please Enter Your Password" 
                                    ValidationGroup="g1" ToolTip="Please Enter Your Password"><img alt="warning" height="20px" src="Images/warning.png" 
                                    Width="20px" /></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblloginas" runat="server" Text="*Login As :" Font-Names="Arial" 
                                    Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:DropDownList ID="drpdwnrole" name="Items" runat="server" ValidationGroup="g1" 
                                    ToolTip="Select Role" Font-Names="Arial" Font-Size="12px" 
                                    ClientIDMode="Static" CssClass="selectbox" Height="20px" Width="50px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top" align="right">
                                <asp:LinkButton ID="lnkbtnfrgtpass" runat="server" 
                                    PostBackUrl="~/forgotPassword.aspx" Font-Names="Arial" Font-Size="12px" 
                                    Font-Bold="True">Forgot Password ?</asp:LinkButton>
                                <asp:Image ID="imgforgot" runat="server" Height="30px" 
                                    ImageUrl="~/Images/forgotpassword.png" Width="30px" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right" class="style3">
                                <asp:Button ID="btnlogin" runat="server" Text="Log In" ValidationGroup="g1" 
                                    onclick="btnlogin_Click" ToolTip="Log In" BackColor="#459AA9" 
                                    Font-Bold="True" ForeColor="#003333" BorderStyle="None" Height="35px" 
                                    Width="90px" Font-Names="Arial" Font-Size="12px" />
                                <asp:RoundedCornersExtender ID="btnlogin_RoundedCornersExtender" runat="server" 
                                    BorderColor="0, 51, 51" Enabled="True" Radius="10" 
                                    TargetControlID="btnlogin">
                                </asp:RoundedCornersExtender>
                                </td>
                            <td class="style3">
                                </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        
        <tr>
            <td>
                <asp:UpdatePanel ID="updtpnllogin" runat="server">
                    <ContentTemplate>
                        <asp:Panel runat="server" ID="pnlmsg">
                            <table>
                                <tr>
                                    <td><asp:Image ID="imgalert" runat="server" Height="30" Width="30" 
                                            CssClass="image" /></td>
                                    <td><asp:Label ID="lblmsg" runat="server" Font-Names="Arial" Font-Size="12px" 
                            ForeColor="Black"></asp:Label></td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnlogin" EventName="Click"/>
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="updtprg" runat="server">
                        <ProgressTemplate>
                            <img src="Images/loading.gif" height="20px" width="20px" alt="loading" />
                            <font face="Arial" color="#003333" style="font-family: arial; font-size: 12px; font-weight: bold">Checking Credentials...</font>
                        </ProgressTemplate>
                </asp:UpdateProgress>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>


