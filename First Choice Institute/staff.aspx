<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="staff.aspx.cs" Inherits="Staff" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content runat="server" ID="Head" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= drpdwnlstques.ClientID %>').selectbox();
            $('#<%= drpdwnlstdegree.ClientID %>').selectbox();
            $('#<%= drpdwnlstbatch.ClientID %>').selectbox();
        });
    </script>
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="sqldtsrcqual" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Datasrc_ConnectionString %>" 
        SelectCommand="SELECT * FROM [Qualification_Table] WHERE ([sf_id] = @sf_id)">
        <SelectParameters>
            <asp:Parameter Name="sf_id" Type="String"/>
        </SelectParameters>
    </asp:SqlDataSource>
    <table>
        <tr>
            <td colspan="7">
                <asp:Panel ID="pnlperdet" runat="server" CssClass="panel_abc" Height="700px" 
                    Width="450px">
                    <table style="margin:20px">
                        <tr>
                            <td style="font-size: 12px; font-family: arial; color: #003333">
                                <strong>Personal Details</strong></td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblstaffid" runat="server" Text="Staff ID :" Font-Names="Arial" 
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
                                    ValidationExpression="^[a-zA-Z'@&amp;#.\s]{1,20}$" ValidationGroup="g1"><img alt="warning" height="20px" src="Images/warning.png" 
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
                                <asp:RegularExpressionValidator ID="regexppname" runat="server" 
                                    ControlToValidate="txtparentname" ErrorMessage="Only 50 characters are allowed" 
                                    ToolTip="Only 50 characters are allowed" 
                                    ValidationExpression="^[a-zA-Z'@&amp;#.\s]{1,50}$" ValidationGroup="g1"><img alt="warning" height="20px" src="Images/warning.png" 
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
                                    Font-Size="12px" ForeColor="#003333" CssClass="input_style" Width="150px"></asp:TextBox>
                                <asp:CalendarExtender ID="txtdob_CalendarExtender" runat="server" 
                                    Enabled="True" Format="dd-MM-yyyy" PopupButtonID="imgbtncal" 
                                    TargetControlID="txtdob">
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
                                    ToolTip="Email Address" Font-Names="Arial" Font-Size="12px" 
                                    ForeColor="#003333" CssClass="input_style" Width="150px"></asp:TextBox>
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
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ToolTip="Please Enter Correct Email Address"><img 
                                    alt="warning" height="20px" src="Images/warning.png" width="20px" /></asp:RegularExpressionValidator>
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
                                    ControlToValidate="txtadd" ErrorMessage="Only 100 characters are allowed" 
                                    ToolTip="Only 100 characters are allowed" 
                                    ValidationExpression="^[a-zA-Z'@&amp;#.\s]{1,100}$" ValidationGroup="g1"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblsecques" runat="server" Font-Names="Arial" Font-Size="12px" 
                                    ForeColor="#003333" Text="Security Question :"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpdwnlstques" runat="server" AutoPostBack="True" 
                                    ValidationGroup="g1" Width="200px" CssClass="selectbox">
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
                                <asp:Label ID="lblsecans" runat="server" Font-Names="Arial" Font-Size="12px" 
                                    ForeColor="#003333" Text="Answer :"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtsecans" runat="server" CssClass="input_style" 
                                    Font-Names="Arial" Font-Size="12px" ForeColor="#003333" ValidationGroup="g1" 
                                    Width="150px"></asp:TextBox>
                            </td>
                            <td valign="top">
                                <asp:RequiredFieldValidator ID="reqfldvalsecans" runat="server" 
                                    ControlToValidate="txtsecans" ErrorMessage="Please Enter Security Answer" 
                                    ToolTip="Please Enter Security Answer" ValidationGroup="g1"><img 
                                    alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpvalsans" runat="server" 
                                    ControlToValidate="txtsecans" ErrorMessage="Only 50 characters are allowed" 
                                    ToolTip="Only 50 characters are allowed" 
                                    ValidationExpression="^[a-zA-Z'@&amp;#.\s]{1,50}$" ValidationGroup="g1"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnsave" runat="server" BackColor="#459AA9" Font-Names="Arial" 
                                    Font-Size="12px" Height="35px" onclick="btnsave_Click" Text="Save" 
                                    ToolTip="Save Details" ValidationGroup="g1" Width="100px" />
                                <asp:RoundedCornersExtender ID="btnsave_RoundedCornersExtender" runat="server" 
                                    BorderColor="0, 51, 51" Enabled="True" Radius="10" TargetControlID="btnsave">
                                </asp:RoundedCornersExtender>
                            </td>
                            <td valign="top">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        
        <tr>
            <td style="font-size: 12px; font-family: arial; color: #003333" colspan="7">
                <asp:Panel ID="pnlqualdet" runat="server" CssClass="panel_abc" Height="580px" 
                    Width="600px">
                    <table style="margin:20px">
                        <tr>
                            <td style="font-size: 12px; font-family: arial; color: #003333">
                                <strong>Qualification Details</strong></td>
                            <td colspan="0">
                                &nbsp;</td>
                            <td colspan="5">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lbldegree" runat="server" Text="Degree/Diploma :" 
                                    Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpdwnlstdegree" runat="server" ValidationGroup="gn" 
                                    ToolTip="Select Degree" Font-Names="Arial" Font-Size="12px" 
                                    ForeColor="#003333" CssClass="selectbox">
                                </asp:DropDownList>
                            </td>
                            <td colspan="5">
                                </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblbranch" runat="server" Text="Field Of Study :" 
                                    Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtbranch" runat="server" ValidationGroup="gn" 
                                    ToolTip="Branch" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" 
                                    CssClass="input_style" Width="150px"></asp:TextBox>
                            </td>
                            <td colspan="5">
                                <asp:RequiredFieldValidator ID="reqfldvalbranch" runat="server" 
                                    ControlToValidate="txtbranch" ErrorMessage="Please Enter Your Branch" 
                                    ValidationGroup="gn" ToolTip="Please Enter Your Branch"><img alt="warning" height="20px" src="Images/warning.png" 
                                    Width="20px" /></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpvalfldst" runat="server" 
                                    ControlToValidate="txtbranch" ErrorMessage="Only 50 characters are allowed" 
                                    ToolTip="Only 50 characters are allowed" 
                                    ValidationExpression="^[a-zA-Z'@&amp;#.\s]{1,50}$" ValidationGroup="gn"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblclgoruni" runat="server" Text="College/University :" 
                                    Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtclgoruni" runat="server" ValidationGroup="gn" 
                                    ToolTip="University" Font-Names="Arial" Font-Size="12px" 
                                    ForeColor="#003333" CssClass="input_style" Width="150px"></asp:TextBox>
                            </td>
                            <td colspan="5">
                                <asp:RequiredFieldValidator ID="reqfldvalclgoruni" runat="server" 
                                    ControlToValidate="txtclgoruni" 
                                    ErrorMessage="Please Enter Your College/University Name" 
                                    ValidationGroup="gn" ToolTip="Please Enter Your College/University Name"><img 
                                    alt="warning" height="20px" src="Images/warning.png" Width="20px" /></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexpvalcoloruni" runat="server" 
                                    ControlToValidate="txtclgoruni" ErrorMessage="Only 50 characters are allowed" 
                                    ToolTip="Only 50 characters are allowed" 
                                    ValidationExpression="^[a-zA-Z'@&amp;#.\s]{1,50}$" ValidationGroup="gn"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblbatch" runat="server" Text="Batch :" Font-Names="Arial" 
                                    Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpdwnlstbatch" runat="server" ValidationGroup="gn" 
                                    ToolTip="Select Batch" Font-Names="Arial" Font-Size="12px" 
                                    ForeColor="#003333" CssClass="selectbox">
                                </asp:DropDownList>
                            </td>
                            <td colspan="5">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblpermarks" runat="server" Text="Percentage Of Marks :" 
                                    Font-Names="Arial" Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtpermarks" runat="server" ValidationGroup="gn" Width="60px" 
                                    ToolTip="Percentage Of Marks" Font-Names="Arial" Font-Size="12px" 
                                    ForeColor="#003333" CssClass="input_style"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqfldvalpermarks" runat="server" 
                                    ControlToValidate="txtpermarks" 
                                    ErrorMessage="Please Enter Your Percentage Of Marks" ValidationGroup="gn" 
                                    ToolTip="Please Enter Your Percentage Of Marks"><img 
                                    alt="warning" height="20px" src="Images/warning.png" Width="20px" /></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="rngvalpermarks" runat="server" 
                                    ControlToValidate="txtpermarks" ErrorMessage="Max. 5000" MaximumValue="5000" 
                                    ToolTip="Max. 5000" ValidationGroup="gn" MinimumValue="0"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RangeValidator>
                            </td>
                            <td valign="top">
                                <asp:Label ID="lbloutoff" runat="server" Text="Out Off :" Font-Names="Arial" 
                                    Font-Size="12px" ForeColor="#003333"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtoutoff" runat="server" ValidationGroup="gn" Width="60px" 
                                    ToolTip="Max. Marks" Font-Names="Arial" Font-Size="12px" 
                                    ForeColor="#003333" CssClass="input_style"></asp:TextBox>
                            </td>
                            <td colspan="2">
                                <asp:RequiredFieldValidator ID="reqfldvaloutoff" runat="server" 
                                    ControlToValidate="txtoutoff" ErrorMessage="Please Enter Max. Marks" 
                                    ValidationGroup="gn" ToolTip="Please Enter Max. Marks"><img alt="warning" height="20px" src="Images/warning.png" 
                                    Width="20px" /></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="rngvaloutoff" runat="server" 
                                    ControlToValidate="txtoutoff" ErrorMessage="Max. 5000" MaximumValue="5000" 
                                    ToolTip="Max. 5000" ValidationGroup="gn" MinimumValue="0"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RangeValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnaddqual" runat="server" onclick="btnaddqual_Click" 
                                    Text="Add Qualification" ValidationGroup="gn" BackColor="#459AA9" 
                                    Font-Names="Arial" Font-Size="12px" Height="35px" Width="170px" />
                                <asp:RoundedCornersExtender ID="btnaddqual_RoundedCornersExtender" 
                                    runat="server" BorderColor="0, 51, 51" Enabled="True" Radius="10" 
                                    TargetControlID="btnaddqual">
                                </asp:RoundedCornersExtender>
                            </td>
                            <td colspan="5">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" colspan="7">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="6">
                                <asp:UpdatePanel ID="updtpnlqual" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="grdviewqual" runat="server" AllowPaging="True" 
                                            AutoGenerateColumns="False" DataKeyNames="Q_ID" DataSourceID="sqldtsrcqual" 
                                            PageSize="5" Font-Names="Arial" Font-Size="12px" ForeColor="#003333" 
                                            CssClass="GridViewStyle" Width="550px">
                                            <Columns>
                                                <asp:BoundField DataField="Q_ID" HeaderText="Q_ID" ReadOnly="True" 
                                                    SortExpression="Q_ID" />
                                                <asp:BoundField DataField="sf_id" HeaderText="sf_id" SortExpression="sf_id" 
                                                    Visible="False" />
                                                <asp:BoundField DataField="Degree" HeaderText="Degree" 
                                                    SortExpression="Degree" />
                                                <asp:TemplateField HeaderText="Branch">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblbranchgrid" runat="server" Font-Names="Arial" 
                                                            Font-Size="12px" ForeColor="#003333" Text='<%# Bind("Branch") %>' 
                                                            Width="100px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="College/University">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblcoloruni" runat="server" Font-Names="Arial" Font-Size="12px" 
                                                        ForeColor="#003333" Text='<%# Bind("ColOrUni") %>' Width="100px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Batch" HeaderText="Batch" SortExpression="Batch" />
                                                <asp:BoundField DataField="PerOfMarks" HeaderText="PerOfMarks" 
                                                    SortExpression="PerOfMarks" />
                                                <asp:BoundField DataField="OutOff" HeaderText="OutOff" 
                                                    SortExpression="OutOff" />
                                                <asp:TemplateField HeaderText="Select">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkselect" runat="server" />
                                                    </ItemTemplate>
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
                                        <asp:AsyncPostBackTrigger ControlID="btnremove" EventName="Click"/>
                                        <asp:AsyncPostBackTrigger ControlID="btnaddqual" EventName="Click"/>
                                        <asp:AsyncPostBackTrigger ControlID="imgbtnrefresh" EventName="Click"/>
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td align="left" valign="top">
                                <asp:ImageButton ID="imgbtnrefresh" runat="server" Height="20px" 
                                    ImageUrl="~/Images/refresh.png" onclick="imgbtnrefresh_Click" 
                                    Width="20px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="7">
                                <asp:Button ID="btnremove" runat="server" Text="Remove" 
                                    onclick="btnremove_Click" BackColor="#459AA9" Font-Names="Arial" 
                                    Font-Size="12px" Height="35px" Width="100px" />
                                <asp:RoundedCornersExtender ID="btnremove_RoundedCornersExtender" 
                                    runat="server" BorderColor="0, 51, 51" Enabled="True" Radius="10" 
                                    TargetControlID="btnremove">
                                </asp:RoundedCornersExtender>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="7">
                                <asp:Button ID="btnchngpass" runat="server" BackColor="#459AA9" 
                                    Font-Names="Arial" Font-Size="12px" Height="35px" onclick="btnchngpass_Click" 
                                    Text="Change Password &gt;&gt;" ToolTip="Change Password" Width="170px" />
                                <asp:RoundedCornersExtender ID="btnchngpass_RoundedCornersExtender" 
                                    runat="server" BorderColor="0, 51, 51" Enabled="True" Radius="10" 
                                    TargetControlID="btnchngpass">
                                </asp:RoundedCornersExtender>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td colspan="7">
                <asp:UpdateProgress ID="updtprg" runat="server">
                    <ProgressTemplate>
                            <img src="Images/loading.gif" height="20px" width="20px" alt="loading" />
                            <font color="#003333" face="Arial" 
                            style="font-family: arial; font-size: 12px; font-weight: bold">Updating 
                        Database...</font>
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
                                        <asp:Panel runat="server" ID="pnlpass" CssClass="panel_abc" Width="400" Height="200">
                                        <table style="margin:20px">
                                            <tr>
                                                <td align="left" valign="top" style="font-size: 12px; font-family: arial; color: #003333">
                                                    <strong>Change Password</strong></td>
                                                <td>
                                                    &nbsp;</td>
                                                <td style="width: 40px">
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
                                                        ValidationGroup="g3" Width="150px"></asp:TextBox>
                                                    <br />
                                                    <asp:PasswordStrength ID="txtnewpass_PasswordStrength" runat="server" 
                                                        Enabled="True" HelpHandlePosition="RightSide" TargetControlID="txtnewpass" 
                                                        PreferredPasswordLength="10" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" 
                                                        HelpStatusLabelID="lblhelp">
                                                    </asp:PasswordStrength>
                                                    <asp:Label ID="lblhelp" runat="server" Font-Italic="True" Font-Names="Arial" 
                                                        Font-Size="9px" ForeColor="#003333" Width="150px"></asp:Label>
                                                </td>
                                                <td style="width: 40px">
                                                    <asp:RequiredFieldValidator ID="reqfldvalnewpass" runat="server" 
                                                        ControlToValidate="txtnewpass" ErrorMessage="Please Enter Your New Password" 
                                                        ToolTip="Please Enter Your New Password" ValidationGroup="g3"><img alt="warning" height="20px" src="Images/warning.png" 
                                    width="20px" /></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="regexpvalpass" runat="server" 
                                                        ControlToValidate="txtnewpass" ErrorMessage="Only 50 characters are allowed" 
                                                        ToolTip="Only 50 characters are allowed" 
                                                        ValidationExpression="^[a-zA-Z'@&amp;#.\s]{1,50}$" ValidationGroup="g3"><img alt="warning" height="20px" src="Images/warning.png" 
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
                                                <td style="width: 40px">
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
                                                        onclick="btnsubmit_Click" ToolTip="Submit" BackColor="#459AA9" 
                                                        Font-Names="Arial" Font-Size="12px" Height="35px" Width="100px" />
                                                    <asp:RoundedCornersExtender ID="btnsubmit_RoundedCornersExtender" 
                                                        runat="server" BorderColor="0, 51, 51" Enabled="True" Radius="10" 
                                                        TargetControlID="btnsubmit">
                                                    </asp:RoundedCornersExtender>
                                                    <asp:Button ID="btndone" runat="server" Text="Done" onclick="btndone_Click" 
                                                        ToolTip="Done Changing" BackColor="#459AA9" Font-Names="Arial" 
                                                        Font-Size="12px" Height="35px" Width="100px" />
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


