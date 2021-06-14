<%@ Page Title="" Language="C#" MasterPageFile="~/memberMaster.Master" AutoEventWireup="true" CodeBehind="myVideos.aspx.cs" Inherits="Video_streaming.myVideos" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script runat="server">
        protected void Page_Load(object sender, EventArgs e)
        {
            string email = "";
            if(Request.Cookies["userInfo"] != null)
            {
                email = Request.Cookies["userInfo"].Values["Email"];
            }
            string strSelectB = "SELECT id, name, likes, thumbnail, video "
                    + " FROM media"
                    + " WHERE owner = '" + email + "'";

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|websiteDatabase.mdf;Integrated Security=True";

            SqlCommand cmdSelectB = new SqlCommand(strSelectB, conn);

            DataTable tbl = new DataTable();

            conn.Open();
            tbl.Load(cmdSelectB.ExecuteReader());

            GridView1.DataSource = tbl;
            GridView1.DataBind();

            conn.Close();
        }
    </script>
    <style type="text/css">
    .auto-style22 {
        width: 207px;
    }
        .auto-style24 {
            height: 82px;
            font-family: "Arial Black";
            font-style: italic;
            font-weight: bold;
            font-size: xx-large;
            color: #333333;
        width: 822px;
    }
        .auto-style27 {
        height: 82px;
    }
    .auto-style28 {
        width: 822px;
        height: 56px;
    }
    .auto-style29 {
        height: 56px;
    }
    .table_{
        text-align: center
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td class="auto-style27"></td>
        <td class="auto-style24">
            <asp:Label ID="Label2" runat="server" Font-Names="Arial Black" Text="MY VIDEOS" Font-Size="XX-Large"></asp:Label>
        </td>
        <td class="auto-style27"></td>
    </tr>
    <tr>
        <td class="auto-style29"></td>
        <td class="auto-style28">
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Height="319px" Width="931px" CssClass="table_">
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            
        </td>
        <td class="auto-style29"></td>
    </tr>
</table>
</asp:Content>
