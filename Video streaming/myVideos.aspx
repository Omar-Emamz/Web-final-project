<%@ Page Title="" Language="C#" MasterPageFile="~/memberMaster.Master" AutoEventWireup="true" CodeBehind="myVideos.aspx.cs" Inherits="Video_streaming.myVideos" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script runat="server">

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|member.mdf;Integrated Security=True";
            
            string email = "";
            if(Request.Cookies["userInfo"] != null)
            {
                email = Request.Cookies["userInfo"].Values["email"];
            }

            string strSelectB = "SELECT name, likes, thumbnail "
                        + " FROM Video "
                        + " WHERE owner = '" + email + "'";

            SqlCommand cmdSelectB = new SqlCommand(strSelectB, conn);

            DataTable tbl = new DataTable();

            conn.Open();
            tbl.Load(cmdSelectB.ExecuteReader());

            videos_tbl.DataSource = tbl;
            videos_tbl.DataBind();
            conn.Close();
        }

</script>
    <style type="text/css">
    .auto-style22 {
        width: 207px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style22">
            <asp:GridView ID="videos_tbl" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Height="317px" Width="726px">
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
