<%@ Page Title="" Language="C#" MasterPageFile="~/memberMaster.Master" AutoEventWireup="true" CodeBehind="uploadVideo.aspx.cs" Inherits="Video_streaming.uploadVideo" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script runat="server">
        public int getVideoCount()
        {
            string stmt = "SELECT COUNT(*) FROM media";
            int count = 0;

            using(SqlConnection thisConnection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|websiteDatabase.mdf;Integrated Security=True"))
            {
                using(SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
                {
                    thisConnection.Open();
                    count = (int)cmdCount.ExecuteScalar();
                }
            }
            return count;
        }

        protected void sign(object sender, EventArgs e)
        {
            string email = "";
            if(Request.Cookies["userInfo"] != null)
            {
                email = Request.Cookies["userInfo"].Values["email"];
            }

            if (thumbnail_upload.HasFile)
                thumbnail_upload.SaveAs(Server.MapPath("thumbnailPics") + "\\" + getVideoCount() + ".jpg");
            if (video_upload.HasFile)
                video_upload.SaveAs(Server.MapPath("videos") + "\\" + getVideoCount() + ".mp4");



            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|websiteDatabase.mdf;Integrated Security=True";
            string str_Insert = String.Format("INSERT INTO media VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}')", getVideoCount(), name_text.Text, 0, email, "thumbnailPics/" + getVideoCount() + ".jpg", "videos/" + getVideoCount() + ".mp4");
            SqlCommand cmd_Insert = new SqlCommand(str_Insert, conn);

            //try
            //{
            conn.Open();
            cmd_Insert.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("~/myVideos.aspx");
            //}
            //catch
            //{
            //    lblmsg.Text = "Error occured, Please Try again later.";
            //}
        }
</script>
    <style type="text/css">
        .auto-style23 {
            width: 305px;
        }
        .auto-style24 {
            width: 305px;
            height: 23px;
        }
        .auto-style25 {
            height: 23px;
        }
        .auto-style26 {
            margin-left: 0px;
        }
        .auto-style30 {
            width: 305px;
            height: 64px;
        }
        .auto-style31 {
            height: 64px;
        }
        .auto-style33 {
            width: 305px;
            height: 66px;
        }
        .auto-style34 {
            height: 66px;
        }
        .auto-style35 {
            width: 303px;
        }
        .auto-style36 {
            width: 303px;
            height: 23px;
        }
        .auto-style37 {
            width: 303px;
            height: 66px;
        }
        .auto-style38 {
            width: 303px;
            height: 64px;
        }
        .auto-style39 {
            width: 602px;
        }
        .auto-style40 {
            width: 602px;
            height: 23px;
        }
        .auto-style41 {
            width: 602px;
            height: 66px;
        }
        .auto-style42 {
            width: 602px;
            height: 64px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style39">&nbsp;</td>
            <td class="auto-style23">
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial Black" Font-Overline="False" Font-Size="XX-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="#333333" Text="UPLOAD VIDEO"></asp:Label>
            </td>
            <td class="auto-style35">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style40">&nbsp;</td>
            <td class="auto-style24"></td>
            <td class="auto-style36">&nbsp;</td>
            <td class="auto-style25"></td>
            <td class="auto-style25"></td>
        </tr>
        <tr>
            <td class="auto-style41"></td>
            <td class="auto-style33">
                <asp:Label ID="Label2" runat="server" Font-Names="Dubai" Font-Size="Large" Text="Name:"></asp:Label>
            </td>
            <td class="auto-style37">
                <asp:TextBox ID="name_text" runat="server" Height="26px" Width="403px"></asp:TextBox>
            </td>
            <td class="auto-style34"></td>
            <td class="auto-style34"></td>
        </tr>
        <tr>
            <td class="auto-style41"></td>
            <td class="auto-style33">
                <asp:Label ID="Label3" runat="server" Font-Names="Dubai" Font-Size="Large" Text="Thumbnail:"></asp:Label>
            </td>
            <td class="auto-style37">
                <asp:FileUpload ID="thumbnail_upload" runat="server" BorderColor="White" BorderStyle="Ridge" CssClass="auto-style26" Width="186px" />
            </td>
            <td class="auto-style34"></td>
            <td class="auto-style34"></td>
        </tr>
        <tr>
            <td class="auto-style42"></td>
            <td class="auto-style30">
                <asp:Label ID="Label4" runat="server" Font-Names="Dubai" Font-Size="Large" Text="Video:"></asp:Label>
            </td>
            <td class="auto-style38">
                <asp:FileUpload ID="video_upload" runat="server" BorderColor="White" BorderStyle="Ridge" CssClass="auto-style26" Width="186px" />
            </td>
            <td class="auto-style31"></td>
            <td class="auto-style31"></td>
        </tr>
        <tr>
            <td class="auto-style40"></td>
            <td class="auto-style24"></td>
            <td class="auto-style36"></td>
            <td class="auto-style25"></td>
            <td class="auto-style25"></td>
        </tr>
        <tr>
            <td class="auto-style39">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style39">&nbsp;</td>
            <td class="auto-style23">
                        <asp:Button ID="signup_btn" runat="server" Text="UPLOAD" Width="221px" Font-Bold="True" Font-Names="Franklin Gothic Medium,Arial Narrow,Arial,sans-serif" Font-Size="Small" Height="39px" BorderStyle="None" BackColor="#CCCCCC" OnClick="sign" />
                            </td>
            <td class="auto-style35">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style40"></td>
            <td class="auto-style24">
                        <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Small"></asp:Label>
                            </td>
            <td class="auto-style36"></td>
            <td class="auto-style25"></td>
            <td class="auto-style25"></td>
        </tr>
        <tr>
            <td class="auto-style39">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style39">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style39">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
