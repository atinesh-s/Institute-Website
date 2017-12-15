<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="feedback" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <table>
        <tr>
            <td colspan="3">
                <asp:Panel ID="pnlfeedback" runat="server" CssClass="panel_abc" Height="320px" 
                    Width="440px">
                    <table style="margin:30px" width="380">
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblname" runat="server" Text="*Name :" Font-Names="Arial" 
                                    Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtname" runat="server" ToolTip="Name" ValidationGroup="g1" 
                                    Font-Names="Arial" Font-Size="12px" ForeColor="#003333" 
                                    CssClass="input_style" Width="200px"></asp:TextBox>
                            </td>
                            <td valign="top">
                                <asp:RequiredFieldValidator ID="reqfldvalname" runat="server" 
                                    ControlToValidate="txtname" ErrorMessage="Please Enter Your Name" 
                                    ToolTip="Please Enter Your Name" ValidationGroup="g1"><img alt="warning" height="20px" src="Images/warning.png" 
                                            width="20px" /></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpvalname" runat="server" 
                                    ControlToValidate="txtname" ErrorMessage="Only 50 characters are allowed" 
                                    ToolTip="Only 50 characters are allowed" 
                                    ValidationExpression="^[a-zA-Z'@&amp;amp;#.\s]{1,50}$" ValidationGroup="g1"><img alt="warning" height="20px" src="Images/warning.png" 
                                            width="20px" /></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblemail" runat="server" Text="Email Address :" 
                                    Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox ID="txtemail" runat="server" ToolTip="Email Address" 
                                    ValidationGroup="g1" Font-Names="Arial" Font-Size="12px" 
                                    ForeColor="#003333" CssClass="input_style" Width="200px"></asp:TextBox>
                            </td>
                            <td valign="top">
                                <asp:RegularExpressionValidator ID="regexpvalemail" runat="server" 
                                    ControlToValidate="txtemail" 
                                    ErrorMessage="Please Enter Yout Correct Email Address" 
                                    ToolTip="Please Enter Yout Correct Email Address" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ValidationGroup="g1"><img alt="warning" height="20px" src="Images/warning.png" 
                                            width="20px" /></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblsubject" runat="server" Text="*Subject :" Font-Names="Arial" 
                                    Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtsubject" runat="server" ToolTip="Subject" 
                                    ValidationGroup="g1" Font-Names="Arial" Font-Size="12px" 
                                    ForeColor="#003333" CssClass="input_style" Width="200px"></asp:TextBox>
                            </td>
                            <td valign="top">
                                <asp:RequiredFieldValidator ID="reqfldvalsubject" runat="server" 
                                    ControlToValidate="txtsubject" 
                                    ErrorMessage="Please Enter The Subject Of The Comment" 
                                    ToolTip="Please Enter The Subject Of The Comment" ValidationGroup="g1"><img alt="warning" height="20px" src="Images/warning.png" 
                                            width="20px" /></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpvalsub" runat="server" 
                                    ControlToValidate="txtsubject" ErrorMessage="Only 50 characters are allowed" 
                                    ToolTip="Only 50 characters are allowed" 
                                    ValidationExpression="^[a-zA-Z'@&amp;amp;#.\s]{1,50}$" ValidationGroup="g1"><img alt="warning" height="20px" src="Images/warning.png" 
                                            width="20px" /></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblcomment" runat="server" Text="*Comment :" Font-Names="Arial" 
                                    Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtcomment" runat="server" TextMode="MultiLine" 
                                    ToolTip="Comment" ValidationGroup="g1" Font-Names="Arial" Font-Size="12px" 
                                    ForeColor="#003333" CssClass="textarea_style" Height="80px" Width="220px"></asp:TextBox>
                            </td>
                            <td valign="top">
                                <asp:RequiredFieldValidator ID="reqfldvalcmnt" runat="server" 
                                    ControlToValidate="txtcomment" ErrorMessage="Please Enter The Comment" 
                                    ToolTip="Please Enter The Comment" ValidationGroup="g1"><img alt="warning" height="20px" src="Images/warning.png" 
                                            width="20px" /></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpvalcomnt" runat="server" 
                                    ControlToValidate="txtcomment" ErrorMessage="Only 100 characters are allowed" 
                                    ToolTip="Only 100 characters are allowed" 
                                    ValidationExpression="^[a-zA-Z'@&amp;amp;#.\s]{1,100}$" ValidationGroup="g1"><img alt="warning" height="20px" src="Images/warning.png" 
                                            width="20px" /></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnsubmit" runat="server" Text="Submit" 
                                    onclick="btnsubmit_Click" ToolTip="Submit" ValidationGroup="g1" 
                                    BackColor="#459AA9" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" 
                                    Height="35px" Width="100px" CssClass="Cursor" />
                                <asp:RoundedCornersExtender ID="btnsubmit_RoundedCornersExtender" 
                                    runat="server" BorderColor="0, 51, 51" Enabled="True" Radius="10" 
                                    TargetControlID="btnsubmit">
                                </asp:RoundedCornersExtender>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        
        <tr>
            <td align="center" colspan="3">
                <asp:UpdateProgress ID="updtprg" runat="server">
                    <ProgressTemplate>
                            <img src="Images/loading.gif" height="20px" width="20px" alt="loading" />
                            <font color="#003333" face="Arial" 
                            style="font-family: arial; font-size: 12px; font-weight: bold">Submitting Feedback...</font>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </td>
        </tr>

        <tr>
            <td colspan="3">
                <asp:UpdatePanel runat="server" ID="updtpnlfeedback">
                    <ContentTemplate>
                        <asp:Panel runat="server" ID="pnlmsg" HorizontalAlign="Left">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Image ID="imgalert" runat="server" Height="30" Width="30" 
                                            CssClass="image" /></td>
                                    <td>
                                        <asp:Label ID="lblmsg" runat="server" Font-Names="Arial" Font-Size="12px" 
                            ForeColor="Black" Font-Bold="False"></asp:Label></td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnsubmit" EventName="Click"/>
                    </Triggers>
                </asp:UpdatePanel>          
              </td>
        </tr>
    </table>
</asp:Content>


