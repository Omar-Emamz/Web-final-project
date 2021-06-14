<%@ Page Title="" Language="C#" MasterPageFile="~/memberMaster.Master" AutoEventWireup="true" CodeBehind="videoPage.aspx.cs" Inherits="Video_streaming.videoPage" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script runat="server">
        public int getCommentCount()
        {
            string stmt = "SELECT COUNT(*) FROM comment";
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
        protected void Page_Load(object sender, EventArgs e)
        {
            var vid = 8;
            //string videoID = "";
            //if(Request.Cookies["videoInfo"] != null)
            //{
            //    videoID = Request.Cookies["videoInfo"].Values["videoID"];
            //}
            ViewState["U"] = vid;
            videoTag.InnerHtml = "<source src=\"videos/" + vid + ".mp4\" type=\"video/mp4\" runat=\"server\">your browser doesn't support this video type";

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|websiteDatabase.mdf;Integrated Security=True";

            string strSelect = "SELECT text FROM comment "
                + " WHERE videoId = '"+ vid + "'";

            SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

            SqlDataReader reader;

            conn.Open();

            reader = cmdSelect.ExecuteReader();
            if (reader.Read())
            {
                for (int i = 0; i < reader.FieldCount; i++)
                {
                    sss.Text += (string)reader.GetValue(i);
                }

            }

            conn.Close();
            //conn.Open();
            //strSelect = "SELECT likes FROM media "
            //    + " WHERE videoId = '"+ vid + "'";
            //SqlCommand cmdSelect2 = new SqlCommand(strSelect, conn);
            //SqlDataReader reader2 = cmdSelect.ExecuteReader();
            //if (reader2.Read())
            //{
            //    likes_lbl.Text = (string)reader2.GetValue(0);
            //}
            //conn.Close();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            var vid = 8;
            ViewState["U"] = vid;
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|websiteDatabase.mdf;Integrated Security=True";
            var likee = 0;
            conn.Open();
            string strSelect = "SELECT likes FROM media "
                + " WHERE Id = '"+ vid + "'";
            SqlCommand cmdSelect2 = new SqlCommand(strSelect, conn);
            SqlDataReader reader2 = cmdSelect2.ExecuteReader();
            if (reader2.Read())
            {
                likee = (int)reader2.GetValue(0);
                likee++;
            }
            conn.Close();
            conn.Open();
            likes_lbl.Text = likee.ToString();
            strSelect = "UPDATE media SET likes= " + likee + " WHERE id = " + vid + ";";
            SqlCommand cmdSelect = new SqlCommand(strSelect, conn);
            SqlDataReader reader = cmdSelect.ExecuteReader();
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            sss.Text += " " + box.Text + "<br><br>";

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|websiteDatabase.mdf;Integrated Security=True";
            string str_Insert = String.Format("INSERT INTO comment VALUES('{0}','{1}', '{2}')", getCommentCount(), box.Text, "0");
            SqlCommand cmd_Insert = new SqlCommand(str_Insert, conn);

            conn.Open();
            cmd_Insert.ExecuteNonQuery();
            conn.Close();
            box.Text = " ";
        }
        </script>

    <style type="text/css">
        .auto-style24 {
            direction: ltr;
        }
        .auto-style25 {
            width: 646px;
        }
        .auto-style26 {
            height: 68px;
            width: 646px;
        }
        .auto-style27 {
            width: 532px;
        }
        .auto-style28 {
            height: 68px;
            width: 532px;
        }
        .auto-style29 {
            width: 532px;
            height: 23px;
        }
        .auto-style30 {
            width: 646px;
            height: 23px;
        }
        .auto-style31 {
            height: 23px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="margin-left: auto; margin-right: auto; text-align: center;" class="auto-style41">
    <video controls width="1000" height="500" id="videoTag" runat="server">
        

    </video>
        
        <table class="auto-style1">
            <tr>
                <td class="auto-style29"></td>
                <td class="auto-style30"></td>
                <td class="auto-style31"></td>
                <td class="auto-style31">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style27">
                    </td>
                <td class="auto-style25">
                    <asp:ScriptManager runat="server" ID="ScriptManager1">
 </asp:ScriptManager>

                    <asp:TextBox ID="box" runat="server" Width="353px"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" style="height: 26px" Text="comment" Width="92px" OnClick="Button1_Click" />

                </td>
                <td class="auto-style4">
                    
 <asp:updatepanel runat="server">
 <ContentTemplate>
                    <asp:Label ID="likes_lbl" runat="server" Text="0"></asp:Label>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" Height="36px" ImageUrl="~/Images/like.png" Width="42px" OnClick="ImageButton1_Click" />
      </ContentTemplate>
 </asp:updatepanel>           
     </td>
                <td class="auto-style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style28">
                    <asp:Panel ID="Panel1" runat="server" BorderStyle="Dotted">
                        <div class="auto-style24">
                            <asp:Label ID="Label3" runat="server" Text="comment section (´。＿。｀)　"></asp:Label>
                            <br>
                            <asp:Label ID="sss" runat="server"></asp:Label>
                            </br>
                        </div>
                    </asp:Panel>
                </td>
                <td class="auto-style26">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style28">
                    &nbsp;</td>
                <td class="auto-style26">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
        </table>
        </div>

</asp:Content>
