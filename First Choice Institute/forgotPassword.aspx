<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="forgotPassword.aspx.cs" Inherits="forgotPassword" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" Runat="Server">
    <table>
        <tr>
            <td colspan="3">
                <asp:Panel ID="pnlforgot" runat="server" CssClass="panel_abc" Height="280px" 
                    Width="400px">
                    <table style="margin:30px">
                        <tr>
                            <td valign="top" class="style1">
                                <asp:Label ID="lblemailadd" runat="server" Text="*Email Address :" 
                                    Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td class="style1">
                                <asp:TextBox ID="txtemailadd" runat="server" ValidationGroup="g1" 
                                    ToolTip="Email Address" Font-Names="Arial" Font-Size="12px" 
                                    ForeColor="#003333" CssClass="input_style" Width="150px"></asp:TextBox>
                            </td>
                            <td class="style1">
                                <asp:RequiredFieldValidator ID="reqfldvalemailadd" runat="server" 
                                    ErrorMessage="Please Enter Your Email Address" 
                                    ControlToValidate="txtemailadd" ValidationGroup="g1" 
                                    ToolTip="Please Enter Your Email Address"><img alt="warning" height="20px" src="Images/warning.png" width="20px" /></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpvalemailadd" runat="server" 
                                    ControlToValidate="txtemailadd" 
                                    ErrorMessage="Please Enter Correct Email Address" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ValidationGroup="g1" ToolTip="Please Enter Correct Email Address"><img alt="warning" height="20px" src="Images/warning.png" width="20px" /></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Image ID="imgforgot" runat="server" Height="50px" 
                                    ImageUrl="~/Images/forgot.png" Width="50px" />
                            </td>
                            <td>
                                <asp:Button ID="btnchkemail" runat="server" Text="Check Email Add." 
                                    ValidationGroup="g1" onclick="btnchkemail_Click" 
                                    ToolTip="Check Email Add." Font-Names="Arial" Font-Size="12px" 
                                    ForeColor="#003333" BackColor="#459AA9" Height="35px" />
                                <asp:RoundedCornersExtender ID="btnchkemail_RoundedCornersExtender" 
                                    runat="server" BorderColor="0, 51, 51" Enabled="True" Radius="10" 
                                    TargetControlID="btnchkemail">
                                </asp:RoundedCornersExtender>
                
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:UpdatePanel ID="updtpnlforpass" runat="server">
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td valign="top">
                                                    <asp:Label ID="lblsecques" runat="server" Font-Names="Arial" Font-Size="12px" 
                                                        ForeColor="#003333" Text="Security Question :"></asp:Label>
                                                </td>
                                                <td>
                                                    
                                                    <asp:TextBox ID="txtsecques" runat="server" CssClass="input_style" 
                                                        Font-Names="Arial" Font-Size="12px" ForeColor="#003333" Width="200px" 
                                                        ValidationGroup="g2"></asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td valign="top"> 
                                                    <asp:Label ID="lblsecans" runat="server" Font-Names="Arial" Font-Size="12px" 
                                                        ForeColor="#003333" Text="Security Answer :"></asp:Label>
                                                </td>
                                                <td>
                                                    
                                                    <asp:TextBox ID="txtsecans" runat="server" CssClass="input_style" 
                                                        Font-Names="Arial" Font-Size="12px" Width="150px" ValidationGroup="g2"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="reqfldvalsecans" runat="server" 
                                                        ControlToValidate="txtsecans" ErrorMessage="Please Enter Your Security Answer" 
                                                        ToolTip="Please Enter Your Security Answer" ValidationGroup="g2"><img alt="warning" 
                                                        height="20px" src="Images/warning.png" width="20px" /></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    
                                                </td>
                                                <td colspan="1">
                                                    
                                                    <asp:Button ID="btnchkans" runat="server" BackColor="#459AA9" 
                                                        Font-Names="Arial" Font-Size="12px" ForeColor="#003333" Height="35px" 
                                                        Text="Check Answer" onclick="btnchkans_Click" ValidationGroup="g2" />
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnchkemail" EventName="Click"/>
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        
        <tr>
            <td>
                <br/>
                <asp:UpdatePanel ID="updtpnlsndpass" runat="server">
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
                        <asp:AsyncPostBackTrigger ControlID="btnchkans" EventName="Click"/>
                    </Triggers>
                </asp:UpdatePanel>
                <br/>
                <asp:UpdateProgress ID="updtprg" runat="server">
                        <ProgressTemplate>
                            <img src="Images/loading.gif" height="20px" width="20px" alt="loading" />
                            <font face="Arial" color="#003333" style="font-family: arial; font-size: 12px; font-weight: bold">Sending Password...</font>
                        </ProgressTemplate>
                </asp:UpdateProgress>
            </td>
        </tr>
    </table>
</asp:Content>



