<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signin.aspx.cs" Inherits="Video_streaming.signin" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">
    protected void login_btn_Click(object sender, EventArgs e){
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|member.mdf;Integrated Security=True";

        string strSelect = "SELECT * FROM member "
            + " WHERE email = '" + email_edit.Text + "' AND password = '"
            + password_edit.Text + "'";

        SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

        SqlDataReader reader;

        conn.Open();

        reader = cmdSelect.ExecuteReader();

        if (reader.Read())
        {
            string Fname = (string)reader.GetValue(0);
            string Lname = (string)reader.GetValue(1);
            string Email = (string)reader.GetValue(3);

            HttpCookie coco = new HttpCookie("userInfo");
            coco.Values.Add("email", email_edit.Text);
            coco.Values.Add("passw", password_edit.Text);
            coco.Values.Add("Fn", Fname);
            coco.Values.Add("Ln", Lname);

            coco.Expires = DateTime.Now.AddDays(3);
            Response.Cookies.Add(coco);

            if (email_edit.Text == "admin")
                Response.Redirect("~/adminHome.aspx");
            else
                Response.Redirect("~/memberHome.aspx");
        }
        else
            lblmsg.Text = "Wrong e-mail or password";

        conn.Close();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            height: 26px;
        }
        .auto-style4 {
            height: 58px;
        }
        .auto-style7 {
            height: 40px;
        }
        .auto-style8 {
            height: 54px;
        }
        .auto-style9 {
            height: 8px;
        }
        .auto-style10 {
            height: 98px;
        }
    </style>
</head>
<body style=" margin:0; width: 100%; height: 100%; vertical-align:central; background:#eee; background-size: 100% 100%;">
    <form id="form1" runat="server" >
        <div style="margin-left: auto; margin-right: auto; text-align: center;">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style10">
                            &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10">
                            &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10">
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium,Arial Narrow,Arial,sans-serif" ForeColor="Black" Text="LOGIN" Font-Size="XX-Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Font-Names="Franklin Gothic Medium,Arial Narrow,Arial,sans-serif" Font-Bold="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">
                            <asp:TextBox ID="email_edit" runat="server" Height="39px" Width="352px" placeholder="E-mail" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                            <asp:TextBox ID="password_edit" runat="server" Height="38px" Width="352px" placeholder="Password" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" TextMode="Password"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:CheckBox ID="rememberme_checkbox" runat="server" Font-Names="Franklin Gothic Medium,Arial Narrow,Arial,sans-serif" Text="Remember me" Font-Size="Small" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Button ID="login_btn" runat="server" Text="LOGIN" Width="352px" Font-Bold="True" Font-Names="Franklin Gothic Medium,Arial Narrow,Arial,sans-serif" Font-Size="Small" Height="39px" BorderStyle="None" BackColor="#CCCCCC" OnClick="login_btn_Click" />
                            </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Font-Names="Franklin Gothic Medium,Arial Narrow,Arial,sans-serif" Text="Not a member? " Font-Size="Small" ForeColor="#666666"></asp:Label>
                        <asp:HyperLink ID="signup_hyper" runat="server" Font-Names="Franklin Gothic Medium,Arial Narrow,Arial,sans-serif" Font-Underline="True" Font-Size="Small" ForeColor="#666666">Sign up now</asp:HyperLink>
                    </td>
                </tr>
                </table>
        </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
