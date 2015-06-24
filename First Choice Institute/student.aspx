<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="student.aspx.cs" Inherits="Student" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content runat="server" ID="Head" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= drpdwnsecques.ClientID %>').selectbox();
        });
    </script>
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="MainContent" Runat="Server">
    <table>
        <tr>
            <td>
                <asp:Panel ID="pnlstud" runat="server" CssClass="panel_abc" Height="750px" 
                    Width="450px">
                    <table style="margin: 20px">
                        <tr>
                            <td style="font-size: 12px; font-family: Arial; color: #003333;">
                                <strong>Personal Details</strong></td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblstdid" runat="server" Text="Student ID :" Font-Names="Arial" 
                                    Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtstdid" runat="server" Enabled="False" ValidationGroup="g1" 
                                    ToolTip="ID" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" 
                                    CssClass="input_style" Width="150px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="blfullname" runat="server" Text="Full Name :" Font-Names="Arial" 
                                    Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtfullname" runat="server" ValidationGroup="g1" 
                                    ToolTip="Full Name" Font-Names="Arial" Font-Size="12px" 
                                    ForeColor="#003333" CssClass="input_style" Width="150px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqfldvalfullname" runat="server" 
                                    ControlToValidate="txtfullname" ErrorMessage="Please Enter Your Full Name" 
                                    ValidationGroup="g1" ToolTip="Please Enter Your Full Name"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpvalfullname" runat="server" 
                                    ControlToValidate="txtfullname" ErrorMessage="Only 20 characters are allowed" 
                                    ToolTip="Only 20 characters are allowed" 
                                    ValidationGroup="g1" ValidationExpression="^[a-zA-Z'@&amp;#.\s]{1,20}$"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblparentname" runat="server" Text="Parent Name :" 
                                    Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtparentname" runat="server" ValidationGroup="g1" 
                                    ToolTip="Parent Name" Font-Names="Arial" Font-Size="12px" 
                                    ForeColor="#003333" CssClass="input_style" Width="150px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqfldvalparentname" runat="server" 
                                    ControlToValidate="txtparentname" ErrorMessage="Please Enter Your Parent Name " 
                                    ValidationGroup="g1" ToolTip="Please Enter Your Parent Name "><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpvalpname" runat="server" 
                                    ErrorMessage="Only 50 characters are allowed" 
                                    ControlToValidate="txtparentname" ToolTip="Only 50 characters are allowed" 
                                    ValidationGroup="g1" ValidationExpression="^[a-zA-Z'@&amp;#.\s]{1,50}$"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblgender" runat="server" Text="Gender :" Font-Names="Arial" 
                                    Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnlstgender" runat="server" ValidationGroup="g1" 
                                    ToolTip="Select Gender" Font-Names="Arial" Font-Size="12px" 
                                    ForeColor="#003333">
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqfldvalgender" runat="server" 
                                    ControlToValidate="rdbtnlstgender" ErrorMessage="Please Select Your Gender" 
                                    ValidationGroup="g1" ToolTip="Please Select Your Gender"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" valign="top">
                                <asp:Label ID="lbldob" runat="server" Text="Date Of Birth :" Font-Names="Arial" 
                                    Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td valign="top">
                                <asp:TextBox ID="txtdob" runat="server" ToolTip="DOB" Font-Names="Arial" 
                                    Font-Size="12px" ForeColor="#003333" CssClass="input_style" Width="150px" 
                                    ValidationGroup="g1"></asp:TextBox>
                                <asp:CalendarExtender ID="txtdob_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="txtdob" Format="dd-MM-yyyy" 
                                    PopupButtonID="imgbtncal">
                                </asp:CalendarExtender>
                                <asp:ImageButton ID="imgbtncal" runat="server" Height="20px" 
                                    ImageUrl="~/Images/calender.png" Width="20px" />
                            </td>
                            <td valign="top">
                                <asp:RequiredFieldValidator ID="reqfldvaldob" runat="server" 
                                    ControlToValidate="txtdob" ErrorMessage="Please Select Your Date Of Birth" 
                                    ToolTip="Please Select Your Date Of Birth" ValidationGroup="g1"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblmobileno" runat="server" Text="Mobile No. :" 
                                    Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtmobileno" runat="server" ValidationGroup="g1" 
                                    ToolTip="Mobile No." Font-Names="Arial" Font-Size="12px" 
                                    ForeColor="#003333" CssClass="input_style" Width="150px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqfldvalmobileno" runat="server" 
                                    ControlToValidate="txtmobileno" ErrorMessage="Please Enter Your Mobile No." 
                                    ValidationGroup="g1" ToolTip="Please Enter Your Mobile No."><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpvalmobileno" runat="server" 
                                    ControlToValidate="txtmobileno" ErrorMessage="Please Enter Correct Mobile No." 
                                    ValidationGroup="g1" ValidationExpression="^[0-9]{10}" 
                                    ToolTip="Please Enter Correct Mobile No."><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblemailadd" runat="server" Text="Email Address :" 
                                    Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtemailadd" runat="server" ValidationGroup="g1" 
                                    ToolTip="Email" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" 
                                    CssClass="input_style" Width="150px"></asp:TextBox>
                                <br />
                                <asp:Label ID="lblwarnemail" runat="server" Font-Italic="True" 
                                    Font-Names="Arial" Font-Size="11px" ForeColor="#003333" 
                                    Text="Examples: 280rahul@gmail.com, jack223@yahoo.in etc"></asp:Label>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqfldvalemailadd" runat="server" 
                                    ControlToValidate="txtemailadd" ErrorMessage="Please Enter Your Email Address" 
                                    ValidationGroup="g1" ToolTip="Please Enter Your Email Address"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpvalemailadd" runat="server" 
                                    ControlToValidate="txtemailadd" 
                                    ErrorMessage="Please Enter Correct Email Address" ValidationGroup="g1" 
                                    ToolTip="Please Enter Correct Email Address" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"><img 
                                    alt="warning" height="20px" src="images/warning.png" width="20px" /></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lbladd" runat="server" Text="Address for Communication :" 
                                    Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtadd" runat="server" Height="80px" TextMode="MultiLine" 
                                    Width="200px" ValidationGroup="g1" ToolTip="Address" Font-Names="Arial" 
                                    Font-Size="12px" ForeColor="#003333" CssClass="textarea_style"></asp:TextBox>
                            </td>
                            <td valign="top">
                                <asp:RequiredFieldValidator ID="reqfldvaladd" runat="server" 
                                    ControlToValidate="txtadd" ErrorMessage="Please Enter Your Address" 
                                    ValidationGroup="g1" ToolTip="Please Enter Your Address"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpvaladd" runat="server" 
                                    ErrorMessage="Only 100 characters are allowed" ControlToValidate="txtadd" 
                                    ToolTip="Only 100 characters are allowed" ValidationGroup="g1" 
                                    ValidationExpression="^[a-zA-Z'@&amp;#.\s]{1,100}$"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblsecques" runat="server" Font-Names="Arial" Font-Size="12px" 
                                    ForeColor="#003333" Text="Security Question :"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpdwnsecques" runat="server" Width="250px" CssClass="selectbox">
                                </asp:DropDownList>
                                <asp:Label ID="lblwar" runat="server" Font-Italic="True" Font-Names="Arial" 
                                    Font-Size="11px" ForeColor="#003333" 
                                    Text="If you forget your password we will ask for the answer to your security question"></asp:Label>
                            </td>
                            <td valign="top">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td valign="top">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblsecans" runat="server" Font-Names="Arial" Font-Size="12px" 
                                    ForeColor="#003333" Text="Answer :"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtsecans" runat="server" CssClass="input_style" 
                                    Font-Names="Arial" Font-Size="12px" ForeColor="#003333" Width="150px" 
                                    ValidationGroup="g1"></asp:TextBox>
                            </td>
                            <td valign="top">
                                <asp:RequiredFieldValidator ID="reqfldvalsecans" runat="server" 
                                    ErrorMessage="Please Enter Security Answer" ControlToValidate="txtsecans" 
                                    ToolTip="Please Enter Security Answer" ValidationGroup="g1"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpvalsans" runat="server" 
                                    ErrorMessage="Only 50 characters are allowed" 
                                    ControlToValidate="txtsecans" ToolTip="Only 50 characters are allowed" 
                                    ValidationExpression="^[a-zA-Z'@&amp;#.\s]{1,50}$" ValidationGroup="g1"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnsave" runat="server" Text="Save" 
                                    onclick="btnsave_Click" UseSubmitBehavior="False" ToolTip="Save" 
                                    Font-Names="Arial" Font-Size="12px" ForeColor="#003333" 
                                    BackColor="#459AA9" Height="35px" Width="100px" ValidationGroup="g1" />
                                <asp:RoundedCornersExtender ID="btnsave_RoundedCornersExtender" runat="server" 
                                    BorderColor="0, 51, 51" Enabled="True" Radius="10" TargetControlID="btnsave">
                                </asp:RoundedCornersExtender>
                                <br />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnchngpass" runat="server" Text="Change Password &gt;&gt;" 
                                    onclick="btnchngpass_Click" ToolTip="Change Password" Font-Names="Arial" 
                                    Font-Size="12px" ForeColor="#003333" BackColor="#459AA9" Height="35px" 
                                    Width="170px" />
                                <asp:RoundedCornersExtender ID="btnchngpass_RoundedCornersExtender" 
                                    runat="server" BorderColor="0, 51, 51" Enabled="True" Radius="10" 
                                    TargetControlID="btnchngpass">
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
            <td align="center">
                <asp:UpdateProgress ID="updtprg" runat="server">
                    <ProgressTemplate>
                            <img src="Images/loading.gif" height="20px" width="20px" alt="loading" />
                            <font color="#003333" face="Arial" style="font-family: arial; font-size: 12px; font-weight: bold">Updating Database...</font>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </td>
        </tr>
        <tr>
            <td>
                
                <asp:UpdatePanel ID="updtpnlmsg" runat="server">
                    <ContentTemplate>
                        <asp:Panel runat="server" ID="pnlmsg" HorizontalAlign="Left">
                            <table>
                                <tr>
                                    <td><asp:Image ID="imgalert" runat="server" Height="30" Width="30" 
                                            CssClass="image" /></td>
                                    <td><asp:Label ID="lblmsg" runat="server" Font-Names="Arial" Font-Size="12px" 
                            ForeColor="Black" Font-Bold="False"></asp:Label></td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnsubmit" EventName="Click"/>
                        <asp:AsyncPostBackTrigger ControlID="btnsave" EventName="Click"/>
                    </Triggers>
                </asp:UpdatePanel>
                
            </td>
        </tr>
        <tr>
            <td>
                                <asp:UpdatePanel ID="updtpnlpass" runat="server">
                                    <ContentTemplate>
                                        <asp:Panel runat="server" ID="pnlpass" CssClass="panel_abc" Height="200px" 
                                            Width="400px">
                                        <table style="margin: 20px">
                                            <tr>
                                                <td align="left" valign="top" style="font-size: 12px; font-family: Arial; color: #003333;">
                                                    <strong>Change Password</strong></td>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="left" valign="top">
                                                    <asp:Label ID="lblnewpass" runat="server" Font-Names="Arial" Font-Size="12px" 
                                                        ForeColor="#003333" Text="New Password :"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtnewpass" runat="server" CssClass="input_style" 
                                                        Font-Names="Arial" Font-Size="12px" ForeColor="#003333" TextMode="Password" 
                                                        ToolTip="New Password" ValidationGroup="g3" Width="150px"></asp:TextBox>
                                                    <asp:PasswordStrength ID="txtnewpass_PasswordStrength" runat="server" 
                                                        Enabled="True" HelpHandlePosition="RightSide" TargetControlID="txtnewpass" 
                                                        PreferredPasswordLength="10" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" 
                                                        HelpStatusLabelID="lblhelp">
                                                    </asp:PasswordStrength>
                                                    <br />
                                                    <asp:Label runat="server" ID="lblhelp" Font-Size="9px" Width="150px" 
                                                        ForeColor="#003333" Font-Names="Arial" Font-Italic="True"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="reqfldvalnewpass" runat="server" 
                                                        ControlToValidate="txtnewpass" ErrorMessage="Please Enter Your New Password" 
                                                        ToolTip="Please Enter Your New Password" ValidationGroup="g3"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="regexpvalpass" runat="server" 
                                                        ErrorMessage="Only 50 characters are allowed" 
                                                        ControlToValidate="txtnewpass" ToolTip="Only 50 characters are allowed" 
                                                        ValidationGroup="g3" ValidationExpression="^[a-zA-Z'@&amp;#.\s]{1,50}$"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" valign="top">
                                                    <asp:Label ID="lblcnfrmpass" Text="Confirm Password :" runat="server" 
                                                        Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtconfrmpass" TextMode="Password" ValidationGroup="g3" 
                                                        runat="server" ToolTip="Confirm Password" Font-Names="Arial" 
                                                        Font-Size="12px" ForeColor="#003333" CssClass="input_style" Width="150px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="reqfldvalcnfrmpass" runat="server" 
                                                        ControlToValidate="txtconfrmpass" ErrorMessage="Please Confirm Your Password" 
                                                        ValidationGroup="g3" ToolTip="Please Confirm Your Password"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="cmpvalpass" ControlToValidate="txtconfrmpass" 
                                                        ControlToCompare="txtnewpass" ValidationGroup="g3" runat="server" 
                                                        ErrorMessage="Password Didn't Match" ToolTip="Password Didn't Match"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="3">
                                                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" ValidationGroup="g3" 
                                                        onclick="btnsubmit_Click" ToolTip="Submit" Font-Names="Arial" 
                                                        Font-Size="12px" ForeColor="#003333" BackColor="#459AA9" Height="35px" 
                                                        Width="100px" />
                                                    <asp:RoundedCornersExtender ID="btnsubmit_RoundedCornersExtender" 
                                                        runat="server" BorderColor="0, 51, 51" Enabled="True" Radius="10" 
                                                        TargetControlID="btnsubmit">
                                                    </asp:RoundedCornersExtender>
                                                    <asp:Button ID="btndone" runat="server" Text="Done" onclick="btndone_Click" 
                                                        ToolTip="Done Changing" Font-Names="Arial" Font-Size="12px" 
                                                        ForeColor="#003333" BackColor="#459AA9" Height="35px" Width="100px" />
                                                    <asp:RoundedCornersExtender ID="btndone_RoundedCornersExtender" runat="server" 
                                                        BorderColor="0, 51, 51" Enabled="True" Radius="10" TargetControlID="btndone">
                                                    </asp:RoundedCornersExtender>
                                                </td>
                                            </tr>
                                        </table>
                                        </asp:Panel>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnchngpass" EventName="Click"/>
                                        <asp:AsyncPostBackTrigger ControlID="btndone" EventName="Click"/>
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
</asp:Content>




