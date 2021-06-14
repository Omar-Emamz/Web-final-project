<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="Video_streaming.signup" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>
<script runat="server">

    protected void sign(object sender, EventArgs e){

        if (!CheckBox1.Checked)
        {
            lblmsg0.Text = "Please check the Accept Terms Check Box";
        }
        else
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|websiteDatabase.mdf;Integrated Security=True";
            string str_Insert = String.Format("INSERT INTO member VALUES('{0}', '{1}', '{2}', '{3}')", firstname_edit.Text, lastname_edit.Text, email_edit.Text, password_edit.Text);
            SqlCommand cmd_Insert = new SqlCommand(str_Insert, conn);

            try
            {
                conn.Open();
                cmd_Insert.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("~/signin.aspx");
            }
            catch (SqlException error)
            {
                if (email_edit.Text != null) { }

                else if (error.Number == 2627)
                    lblmsg.Text = "This email is already in use.";
                else
                    lblmsg.Text = "Error occured, Please Try again later.";
            }
            catch
            {
                lblmsg.Text = "Error occured, Please Try again later.";
            }
        }
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .container{
            background-color: #BC589F
        }
        body {
          height: 100%;
        }

        .auto-style41 {
            height: 84px;
            width: 406px;
        }

        .auto-style42 {
            direction: ltr;
            height: 45px;
            width: 416px;
        }
        .auto-style43 {
            height: 45px;
            width: 410px;
        }

        .auto-style44 {
            height: 47px;
        }

        .auto-style47 {
            height: 16px;
        }

        .auto-style66 {
            height: 45px;
            width: 428px;
            direction: ltr;
        }
        .auto-style67 {
            height: 45px;
            width: 416px;
        }
        .auto-style68 {
            height: 45px;
            width: 415px;
            vertical-align: central
        }
        .auto-style70 {
            height: 105%;
            width: 1748px;
        }
        .auto-style71 {
            height: 100%;
            width: 1748px;
        }
        .auto-style72 {
            height: 40px;
            width: 1748px;
            text-align: left;
        }
        .auto-style74 {
            width: 1748px;
            height: 20px;
        }
        .auto-style76 {
            height: 39px;
            width: 1748px;
        }
        .auto-style77 {
            height: 21px;
            width: 1748px;
        }
        .form-container{
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 7px hsla(249, 10%, 26%, 0.404);
            align-items:center;
            justify-content: center;
        }
        .auto-style78 {
            width: 62%;
            height: 618px;
        }
        .auto-style80 {
            width: 298%;
            height: 101%;
        }
        .auto-style82 {
            height: 105%;
            width: 623px;
        }
        .auto-style83 {
            height: 100%;
            width: 623px;
        }
        .auto-style84 {
            height: 40px;
            width: 623px;
        }
        .auto-style86 {
            width: 623px;
            height: 20px;
        }
        .auto-style87 {
            height: 43px;
            width: 623px;
        }
        .auto-style88 {
            height: 39px;
            width: 623px;
        }
        .auto-style89 {
            height: 21px;
            width: 623px;
        }
        .auto-style90 {
            direction: ltr;
        }
        .auto-style91 {
            height: 45px;
            width: 623px;
        }
        </style>
</head>
<body style=" margin:0; width: 100%; min-height: 100vh; vertical-align:central; background:#eee; background-size: 100% 100%;">
    <div style="margin-left: auto; margin-right: auto; text-align: center;" class="auto-style41">
    <form id="form1" runat="server" class="auto-style78" >
        
            <table class="auto-style80">
                <tr> 
                    <td style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; font-weight: bold; font-size: x-large;" class="auto-style82">
                        &nbsp;</td>
                    <td style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; font-weight: bold; font-size: x-large;" class="auto-style70">
                        &nbsp;</td>
                </tr>
                <tr> 
                    <td style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; font-weight: bold; font-size: x-large;" class="auto-style83">
                        <div style="margin-left: auto; margin-right: auto; text-align: center;" class="auto-style41">
                        
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial Black,Large" ForeColor="Black" Text="CREATE ACCOUNT" Font-Size="XX-Large"></asp:Label>
                   </div>
                            </td>
                    <td style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; font-weight: bold; font-size: x-large;" class="auto-style71">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style84">
                        <div style="margin-left: auto; margin-right: auto; text-align: center;" class="auto-style66">
                            <asp:TextBox ID="firstname_edit" runat="server" Height="35px" Width="390px" OnTextChanged="TextBox1_TextChanged" placeholder="First name" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="firstname_edit" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                    </div>
                            </td>
                        
                    <td class="auto-style72">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="firstname_edit" ErrorMessage="Invalid first name format." Font-Bold="False" Font-Size="Small" ForeColor="Red" ValidationExpression="([A-Z][a-z]*\s[A-Z][a-z]*)|([A-Z][a-z]*)"></asp:RegularExpressionValidator>
                          
                            </td>
                        
                </tr>
                <tr>
                    <td class="auto-style84">
                        <div style="margin-left: auto; margin-right: auto; text-align: center;" class="auto-style67">
                            <asp:TextBox ID="lastname_edit" runat="server" Height="35px" Width="390px" OnTextChanged="TextBox1_TextChanged" placeholder="Last name" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lastname_edit" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                        
                    <td class="auto-style72">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="lastname_edit" ErrorMessage="Invalid last name format." Font-Bold="False" Font-Size="Small" ForeColor="Red" ValidationExpression="([A-Z][a-z]*\s[A-Z][a-z]*)|([A-Z][a-z]*)"></asp:RegularExpressionValidator>
                            </td>
                        
                </tr>
                <tr>
                    <td class="auto-style91">
                        <div style="margin-left: auto; margin-right: auto; text-align: center;" class="auto-style68">
                            <asp:TextBox ID="email_edit" runat="server" Height="35px" Width="390px" placeholder="E-mail" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="email_edit" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </td>
                    <td class="auto-style72">


                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="email_edit" ErrorMessage="Invalid email format." Font-Bold="False" Font-Size="Small" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                            </td>
                </tr>
                <tr>
                    <td class="auto-style84">
                        <div style="margin-left: auto; margin-right: auto; text-align: center;" class="auto-style42"  >
                            <asp:TextBox ID="password_edit" runat="server" Height="35px" Width="390px" placeholder="Password" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="password_edit" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            </div>
                        </td>
                    <td class="auto-style72">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="password_edit" ErrorMessage="Password should be between 8-16 characters." Font-Bold="False" Font-Size="Small" ForeColor="Red" ValidationExpression="\w{8,12}"></asp:RegularExpressionValidator>
                            </td>
                </tr>
                <tr>
                    <td class="auto-style84"  >
                        <div style="margin-left: auto; margin-right: auto; text-align: center;" class="auto-style43"  >
                            <asp:TextBox ID="confPassword_edit" runat="server" Height="35px" Width="390px" placeholder="Confirm Password" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="confPassword_edit" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            </div>
                        </td>
                    <td class="auto-style72"  >
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords does not match." ControlToCompare="confPassword_edit" ControlToValidate="password_edit" Font-Size="Small" ForeColor="Red"></asp:CompareValidator>
                             </td>
                </tr>
                <tr>
                    <td class="auto-style86"  >
                         <div style="margin-left: auto; margin-right: auto; text-align: center;" class="auto-style47"  >
                             </div>
                        </td>
                    <td class="auto-style74"  >
                         &nbsp;</td>
                </tr>
                <tr>
                    <td id="terms_checkbox0" class="auto-style87"  >
                        <div style="margin-left: auto; margin-right: auto; text-align: center;" class="auto-style44"  >
                        <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Small"></asp:Label>
                            <br />
                        <asp:CheckBox ID="CheckBox1" runat="server" Font-Names="Franklin Gothic Medium,Arial Narrow,Arial,sans-serif" OnCheckedChanged="CheckBox1_CheckedChanged" Text="I agree all statements in Terms of service" Font-Size="Small" />
                   </div>
                            </td>
                    <td id="terms_checkbox0" class="auto-style72"  >
                        <asp:Label ID="lblmsg0" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Small"></asp:Label>
                            </td>
                </tr>
                <tr>
                    <td class="auto-style88">
                        <div style="margin-left: auto; margin-right: auto; text-align: center;">
                        <asp:Button ID="signup_btn" runat="server" Text="SIGN UP" Width="389px" Font-Bold="True" Font-Names="Franklin Gothic Medium,Arial Narrow,Arial,sans-serif" Font-Size="Small" Height="39px" BorderStyle="None" BackColor="#CCCCCC" OnClick="sign" />
                            </div>
                    </td>
                    <td class="auto-style76">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style89"  ><div style="margin-left: auto; margin-right: auto; text-align: center;">
                        <div style="margin-left: auto; margin-right: auto; text-align: center;">
                        <asp:Label ID="Label1" runat="server" Font-Names="Franklin Gothic Medium,Arial Narrow,Arial,sans-serif" Text="Have already an account? " Font-Size="Small" ForeColor="#666666"></asp:Label>
                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Franklin Gothic Medium,Arial Narrow,Arial,sans-serif" Font-Underline="True" Font-Size="Small" ForeColor="#666666" NavigateUrl="~/signin.aspx">Login here</asp:HyperLink>
                    </div>
                            </td>
                    <td class="auto-style77"  >&nbsp;</td>
                </tr>
                </table>
      
       
    </form>
        </div>
    <p class="auto-style90">
        &nbsp;</p>
</body>
</html>
