<%@ Page Title="" Language="C#" MasterPageFile="~/memberMaster.Master" AutoEventWireup="true" CodeBehind="memberHome.aspx.cs" Inherits="Video_streaming.memberHome" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.IO" %>


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

        protected void Page_Load(object sender, EventArgs e)
        {
            string html = "";
            for (int i = 0; i < getVideoCount(); i++)
            {
                html = "<a href=\"videoPage" + i + ".aspx\" id=\""+ i +"\"class=\"item\" runat=\"server\" OnClick=\"return linkOnClick(" + i + ")\"> <img style=\"height: 233.25px; width: 311px \" src=\"thumbnailPics/" + i + ".jpg\" alt=\"Architecture\" > </a>";

                grid_.InnerHtml += html;
            }


        }

        protected void linkOnClick(string i)
        {
            HttpCookie coco = new HttpCookie("videoInfo");
            coco.Values.Add("videoID", i);
            coco.Expires = DateTime.Now.AddDays(3);
            Response.Cookies.Add(coco);
            Response.Redirect("~/videoPage.aspx");
        }
    </script>
       
    <style type="text/css">
        .container {

  display: grid;
  grid-gap: 3px;
  grid-template-columns: repeat(6, minmax(100px, 1fr));
}

.item {
  position: relative;
  display: block;
  flex: 1 1 0px;
  transition: transform 500ms;
}

.container:focus-within .item,
.container:hover .item {
  transform: translateX(-25%);
}

.item:focus ~ .item,
.item:hover ~ .item {
  transform: translateX(25%);
}

.container .item:focus,
.container .item:hover {
  transform: scale(1.5);
  z-index: 1;
}

body {
  overflow: hidden;
}

.item img {
  display: block;
  max-width: 100%;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" id="grid_" runat="server">

        

        

        

  </div>
    </asp:Content>
