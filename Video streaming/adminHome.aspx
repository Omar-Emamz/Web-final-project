<%@ Page Title="" Language="C#" MasterPageFile="~/adminMater.Master" AutoEventWireup="true" CodeBehind="adminHome.aspx.cs" Inherits="Video_streaming.adminHome" %>
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
        public int getMemberCount()
        {
           string stmt = "SELECT COUNT(*) FROM Member";
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
        protected void Page_Load(object sender, EventArgs e){
            nov_lbl.Text = getVideoCount().ToString();
            nom_lbl.Text = getMemberCount().ToString();
        }
</script>

    <style type="text/css">
    .auto-style28 {
        width: 209px;
        }
        .auto-style22 {
            width: 334px;
        }
        .auto-style29 {
        width: 209px;
        height: 23px;
    }
    .auto-style30 {
        width: 334px;
        height: 23px;
    }
    .auto-style32 {
        width: 209px;
        height: 48px;
            direction: ltr;
        }
    .auto-style33 {
        width: 334px;
        height: 48px;
    }
    .auto-style36 {
        width: 209px;
        height: 62px;
    }
    .auto-style37 {
        width: 334px;
        height: 62px;
    }
    .auto-style38 {
        width: 330px;
        direction: ltr;
    }
    .auto-style39 {
        width: 330px;
        height: 23px;
        direction: ltr;
    }
    .auto-style40 {
        width: 330px;
        height: 48px;
        direction: ltr;
    }
    .auto-style41 {
        width: 330px;
        height: 62px;
        direction: ltr;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td class="auto-style38">&nbsp;</td>
        <td class="auto-style28">
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial Black" Font-Overline="False" Font-Size="XX-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="#333333" Text="SUMMARY"></asp:Label>
        </td>
        <td class="auto-style22">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style39"></td>
        <td class="auto-style29">
            </td>
        <td class="auto-style30">
            </td>
    </tr>
    <tr>
        <td class="auto-style40">
            &nbsp;</td>
        <td class="auto-style32">
            <asp:Label ID="Label2" runat="server" BorderStyle="None" Font-Names="Arial Black,Large" Text="Number of Members:"></asp:Label>
        </td>
        <td class="auto-style33">
            <asp:Label ID="nom_lbl" runat="server" BorderStyle="None" Font-Names="Arial Black,Large" Text="0"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style41"></td>
        <td class="auto-style36">
            <asp:Label ID="Label3" runat="server" BorderStyle="None" Font-Names="Arial Black,Large" Text="Number of Videos:"></asp:Label>
        </td>
        <td class="auto-style37">
            <asp:Label ID="nov_lbl" runat="server" BorderStyle="None" Font-Names="Arial Black,Large">0</asp:Label>
        </td>
    </tr>
</table>
</asp:Content>
