<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="MainForm" runat="server">
    Library<br />
    <asp:GridView ID="gvData" runat="server" AutoGenerateColumns="False" DataSourceID="Books">
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Volume" HeaderText="Volume" SortExpression="Volume" />
            <asp:BoundField DataField="Auther" HeaderText="Auther" SortExpression="Auther" />
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:BoundField DataField="Family" HeaderText="Family" SortExpression="Family" />
            <asp:BoundField DataField="Format" HeaderText="Format" SortExpression="Format" />
            <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
            <asp:BoundField DataField="Other" HeaderText="Other" SortExpression="Other" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="Books" runat="server" ConnectionString="<%$ ConnectionStrings:BooksConnectionString %>" SelectCommand="SELECT [Title]
      ,[Volume]
      ,[AutherID].[Auther]
      ,[CategoryId].[Category]
      ,[FamilyId].[Family]
      ,[FormatId].[Format]
      ,[SizeId].[Size]
      ,[Other]
FROM [Books].[dbo].[Books]
inner join [AutherId] on [Books].[Auther]=[AutherID].[ID]
inner join [CategoryId] on [Books].[Category]=[CategoryId].[ID]
inner join [FamilyId] on [Books].[Family]=[FamilyId].[ID]
inner join [FormatId] on [Books].[Format]=[FormatId].[ID]
inner join [SizeId] on [Books].[Size]=[SizeId].[ID]"></asp:SqlDataSource>
    <p style="height: 1px">
        <asp:Label ID="lblTitle" runat="server" Text="Title"></asp:Label>
        <asp:TextBox ID="tbTitle" runat="server"></asp:TextBox>
&nbsp;<asp:Label ID="lblVolume" runat="server" Text="Volume"></asp:Label>
        <asp:DropDownList ID="ddlVolume" runat="server">
        </asp:DropDownList>
        <asp:SqlDataSource ID="Auther" runat="server" ConnectionString="<%$ ConnectionStrings:BooksConnectionString %>" SelectCommand="SELECT [Auther] FROM [AutherId]"></asp:SqlDataSource>
&nbsp;<asp:Label ID="lblAuther" runat="server" Text="Auther"></asp:Label>
        <asp:DropDownList ID="ddlAuther" runat="server" DataSourceID="Auther" DataTextField="Auther" DataValueField="Auther">
        </asp:DropDownList>
&nbsp;<asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>
        <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="Category" DataTextField="Category" DataValueField="Category">
        </asp:DropDownList>
        <asp:SqlDataSource ID="Category" runat="server" ConnectionString="<%$ ConnectionStrings:BooksConnectionString %>" SelectCommand="SELECT [Category] FROM [CategoryId]"></asp:SqlDataSource>
&nbsp;<asp:Label ID="lblFamily" runat="server" Text="Family"></asp:Label>
        <asp:DropDownList ID="ddlFamily" runat="server" DataSourceID="Family" DataTextField="Family" DataValueField="Family">
        </asp:DropDownList>
        <asp:SqlDataSource ID="Family" runat="server" ConnectionString="<%$ ConnectionStrings:BooksConnectionString %>" SelectCommand="SELECT [Family] FROM [FamilyId]"></asp:SqlDataSource>
&nbsp;<asp:Label ID="lblFormat" runat="server" Text="Format"></asp:Label>
        <asp:DropDownList ID="ddlFormat" runat="server" DataSourceID="Format" DataTextField="Format" DataValueField="Format">
        </asp:DropDownList>
        <asp:SqlDataSource ID="Format" runat="server" ConnectionString="<%$ ConnectionStrings:BooksConnectionString %>" SelectCommand="SELECT [Format] FROM [FormatId]"></asp:SqlDataSource>
&nbsp;<asp:Label ID="lblSize" runat="server" Text="Size"></asp:Label>
        <asp:DropDownList ID="ddlSize" runat="server" DataSourceID="Size" DataTextField="Size" DataValueField="Size">
        </asp:DropDownList>
        <asp:SqlDataSource ID="Size" runat="server" ConnectionString="<%$ ConnectionStrings:BooksConnectionString %>" SelectCommand="SELECT [Size] FROM [SizeId]"></asp:SqlDataSource>
    &nbsp;&nbsp;&nbsp;
    </p>
    <p style="height: 1px">
        &nbsp;</p>
    <p style="height: 6px">
        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
    </p>
</form>
</body>
</html>
