<%@ Page Title="" Language="C#" MasterPageFile="~/memberMaster.Master" AutoEventWireup="true" CodeBehind="accountSettings.aspx.cs" Inherits="Video_streaming.accountSettings" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script runat="server">
        protected void save_btn_Click(object sender, EventArgs e)
        {

            string email = "";
            if(Request.Cookies["userInfo"] != null)
            {
                email = Request.Cookies["userInfo"].Values["Email"];
            }

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|websiteDatabase.mdf;Integrated Security=True";
            string str_Insert = String.Format("UPDATE member SET " + " firstName = '"+firstname_edit.Text+"', lastName= '" + lastname_edit.Text + "', password= '" + password_edit.Text + "' WHERE email = '" + email + "'");
            SqlCommand cmd_Insert = new SqlCommand(str_Insert, conn);
            
            try
            {
                conn.Open();
                cmd_Insert.ExecuteNonQuery();
                conn.Close();
                lblmsg.Text = "Account settings successfully change!";
                HttpCookie coco = new HttpCookie("userInfo");
                coco.Values.Add("Ln", lastname_edit.Text);
                coco.Values.Add("passw", password_edit.Text);
                coco.Values.Add("Fn", firstname_edit.Text);

            coco.Expires = DateTime.Now.AddDays(3);
            Response.Cookies.Add(coco);
            }
            catch
            {
                lblmsg.Text = "Error occured, Please Try again later.";
            }
        }
        </script>
    <style type="text/css">
        .auto-style24 {
            height: 23px;
        }
        .auto-style27 {
            height: 23px;
            width: 571px;
        }
        .auto-style28 {
            width: 571px;
        }
        .auto-style29 {
            height: 23px;
            width: 264px;
        }
        .auto-style30 {
            width: 264px;
        }
        .auto-style31 {
            width: 571px;
            height: 61px;
        }
        .auto-style32 {
            width: 264px;
            height: 61px;
        }
        .auto-style33 {
            height: 61px;
        }
        .auto-style34 {
            height: 23px;
            width: 169px;
        }
        .auto-style35 {
            width: 169px;
        }
        .auto-style36 {
            height: 61px;
            width: 169px;
        }
        .auto-style37 {
            width: 571px;
            height: 43px;
        }
        .auto-style38 {
            height: 43px;
        }
        .auto-style39 {
            width: 169px;
            direction: ltr;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style27">
                 <div style="margin-left: auto; margin-right: auto; text-align: center;">
            </div>
                     </td>
            <td class="auto-style29">
            <asp:Label ID="Label5" runat="server" Font-Names="Arial Black" Text="MY ACCOUNT" Font-Size="XX-Large" Font-Bold="True" Font-Italic="True" ForeColor="#333333"></asp:Label>
            </td>
            <td class="auto-style34"></td>
            <td class="auto-style24"></td>
        </tr>
        <tr>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style27"></td>
            <td class="auto-style29">
                <asp:Label ID="Label2" runat="server" Font-Names="Arial" Text="First name:"></asp:Label>
            </td>
            <td class="auto-style34">
                            <asp:TextBox ID="firstname_edit" runat="server" Height="35px" Width="390px" placeholder="Change First name" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="firstname_edit" ErrorMessage="Invalid first name format." Font-Bold="False" Font-Size="Small" ForeColor="Red" ValidationExpression="([A-Z][a-z]*\s[A-Z][a-z]*)|([A-Z][a-z]*)"></asp:RegularExpressionValidator>
                          
                            </td>
            <td class="auto-style24"></td>
        </tr>
        <tr>
            <td class="auto-style31"></td>
            <td class="auto-style32">
                <asp:Label ID="Label3" runat="server" Font-Names="Arial" Text="Last name:"></asp:Label>
            </td>
            <td class="auto-style36">
                            <asp:TextBox ID="lastname_edit" runat="server" Height="35px" Width="390px" placeholder="Change Last name" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="lastname_edit" ErrorMessage="Invalid last name format." Font-Bold="False" Font-Size="Small" ForeColor="Red" ValidationExpression="([A-Z][a-z]*\s[A-Z][a-z]*)|([A-Z][a-z]*)"></asp:RegularExpressionValidator>
                            </td>
            <td class="auto-style33"></td>
        </tr>
        <tr>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style30">
                <asp:Label ID="Label4" runat="server" Font-Names="Arial" Text="Password:"></asp:Label>
            </td>
            <td class="auto-style35">
                            <asp:TextBox ID="password_edit" runat="server" Height="35px" Width="390px" placeholder="Change password" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" TextMode="Password"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="password_edit" ErrorMessage="Password should be between 8-16 characters." Font-Bold="False" Font-Size="Small" ForeColor="Red" ValidationExpression="\w{8,12}"></asp:RegularExpressionValidator>
                            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style27"></td>
            <td class="auto-style29"></td>
            <td class="auto-style34"></td>
            <td class="auto-style24"></td>
        </tr>
        <tr>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style27"></td>
            <td class="auto-style29"></td>
            <td class="auto-style34"></td>
            <td class="auto-style24"></td>
        </tr>
        <tr>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style37"></td>
            <td colspan="2" class="auto-style38">
                        <asp:Button ID="save_btn" runat="server" Text="SAVE" Width="302px" Font-Bold="True" Font-Names="Franklin Gothic Medium,Arial Narrow,Arial,sans-serif" Font-Size="Small" Height="39px" BorderStyle="None" BackColor="#CCCCCC" OnClick="save_btn_Click" />
                            </td>
            <td class="auto-style38"></td>
        </tr>
        <tr>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style30">
                        <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="#33CC33" Font-Size="Medium"></asp:Label>
                            </td>
            <td class="auto-style35">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style39">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style28">&nbsp;</td>
            <td class="auto-style30">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
