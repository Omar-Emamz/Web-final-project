<%@ Page Title="" Language="C#" MasterPageFile="~/adminMater.Master" AutoEventWireup="true" CodeBehind="usersList.aspx.cs" Inherits="Video_streaming.usersList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style21 {
            width: 101%;
        }
        .auto-style24 {
            height: 305px;
            width: 524px;
        }
        .auto-style25 {
        width: 729.5px;
        height: 305px;
    }
        .auto-style27 {
        width: 729.5px;
        height: 54px;
    }
    .auto-style28 {
        height: 54px;
        width: 524px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table class="auto-style21">
        <tr>
            <td class="auto-style27">
            </td>
            <td class="auto-style28">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial Black" Font-Overline="False" Font-Size="XX-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="#333333" Text="USERS LIST"></asp:Label>
            </td>
            <td class="auto-style27">
                </td>
        </tr>
        <tr>
            <td class="auto-style25">
            </td>
            <td class="auto-style24">
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="email" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" Height="216px" Width="623px">
    <Columns>
        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
        <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
        <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
        <asp:BoundField DataField="email" HeaderText="email" ReadOnly="True" SortExpression="email" />
        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
    </Columns>
    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F7F7F7" />
    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
    <SortedDescendingCellStyle BackColor="#E5E5E5" />
    <SortedDescendingHeaderStyle BackColor="#242121" />
</asp:GridView>
                    
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [member] WHERE [email] = @email" InsertCommand="INSERT INTO [member] ([firstName], [lastName], [email], [password]) VALUES (@firstName, @lastName, @email, @password)" SelectCommand="SELECT [firstName], [lastName], [email], [password] FROM [member]" UpdateCommand="UPDATE [member] SET [firstName] = @firstName, [lastName] = @lastName, [password] = @password WHERE [email] = @email">
    <DeleteParameters>
        <asp:Parameter Name="email" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="firstName" Type="String" />
        <asp:Parameter Name="lastName" Type="String" />
        <asp:Parameter Name="email" Type="String" />
        <asp:Parameter Name="password" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="firstName" Type="String" />
        <asp:Parameter Name="lastName" Type="String" />
        <asp:Parameter Name="password" Type="String" />
        <asp:Parameter Name="email" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
            </td>
            <td class="auto-style25">
                </td>
        </tr>
        </table>
</asp:Content>
