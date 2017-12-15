<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="sitemap.aspx.cs" Inherits="sitemap" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SiteMapDataSource ID="sitemapdtsrc" runat="server" />
    <asp:TreeView ID="treeview" DataSourceID="sitemapdtsrc" runat="server" 
        Font-Size="12px" ForeColor="#003333" Font-Names="Arial" Font-Bold="True">
    </asp:TreeView>
</asp:Content>

