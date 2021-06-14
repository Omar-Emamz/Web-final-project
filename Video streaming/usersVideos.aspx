<%@ Page Title="" Language="C#" MasterPageFile="~/adminMater.Master" AutoEventWireup="true" CodeBehind="usersVideos.aspx.cs" Inherits="Video_streaming.usersVideos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style21 {
        width: 625px;
    }
    .auto-style22 {
        direction: ltr;
    }
    .auto-style24 {
        width: 625px;
        height: 60px;
    }
    .auto-style26 {
        height: 359px;
    }
    .auto-style27 {
        width: 625px;
        height: 359px;
    }
    .auto-style28 {
        height: 60px;
    }
    .table_{
        text-align: center
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td class="auto-style28"></td>
        <td class="auto-style24">
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial Black" Font-Overline="False" Font-Size="XX-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="#333333" Text="MEMBERS VIDEOS"></asp:Label>
        </td>
        <td class="auto-style28"></td>
    </tr>
    <tr>
        <td class="auto-style26"></td>
        <td class="auto-style27">
            <div class="auto-style22">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" Height="274px" Width="660px" AllowSorting="True" CssClass="table_">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="owner" HeaderText="owner" SortExpression="owner" />
                        <asp:BoundField DataField="likes" HeaderText="likes" SortExpression="likes" />
                        <asp:BoundField DataField="thumbnail" HeaderText="thumbnail" SortExpression="thumbnail" />
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
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [media] WHERE [id] = @id" InsertCommand="INSERT INTO [media] ([id], [name], [owner], [likes], [thumbnail]) VALUES (@id, @name, @owner, @likes, @thumbnail)" SelectCommand="SELECT [id], [name], [owner], [likes], [thumbnail] FROM [media]" UpdateCommand="UPDATE [media] SET [name] = @name, [owner] = @owner, [likes] = @likes, [thumbnail] = @thumbnail WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="owner" Type="String" />
                    <asp:Parameter Name="likes" Type="Int32" />
                    <asp:Parameter Name="thumbnail" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="owner" Type="String" />
                    <asp:Parameter Name="likes" Type="Int32" />
                    <asp:Parameter Name="thumbnail" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </td>
        <td class="auto-style26"></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style21">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
