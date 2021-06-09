<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="Video_streaming.signup" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>
<script runat="server">
    protected void sign(object sender, EventArgs e){
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|member.mdf;Integrated Security=True";
        string str_Insert = String.Format("INSERT INTO member VALUES('{0}', '{1}', '{2}', '{3}')", firstname_edit.Text, lastname_edit.Text, email_edit.Text, password_edit.Text);
        SqlCommand cmd_Insert = new SqlCommand(str_Insert, conn);

        try{
            conn.Open();
            cmd_Insert.ExecuteNonQuery();
            conn.Close();

        }catch (SqlException error){
            if (error.Number == 2627)
                lblmsg.Text = "This email is already in use.";
            else
                lblmsg.Text = "Error occured, Please Try again later.";
        }catch{
            lblmsg.Text = "Error occured, Please Try again later.";
        }
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 100%;
        }
        .container{
            background-color: #BC589F
        }
        .auto-style32 {
            height: 40px;
        }
        .auto-style36 {
            height: 43px;
        }
        .auto-style37 {
            height: 100%;
        }
        .auto-style38 {
            height: 39px;
        }
        body {
  height: 100%;
}

        .auto-style40 {
            height: 21px;
        }

        .auto-style41 {
            height: 35px;
        }

        .auto-style42 {
            direction: ltr;
            height: 45px;
        }
        .auto-style43 {
            height: 45px;
        }

        .auto-style44 {
            height: 47px;
        }

        </style>
</head>
<body style=" margin:0; width: 100%; height: 100%; vertical-align:central; background:#eee; background-size: 100% 100%;">
    <form id="form1" runat="server" style="width: 100%; height: 100%; vertical-align:central;">
        
            <table class="auto-style1">
                <tr> 
                    <td style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; font-weight: bold; font-size: x-large;" class="auto-style37">
                        <div style="margin-left: auto; margin-right: auto; text-align: center;" class="auto-style41">
                        
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Franklin Gothic Medium,Arial Narrow,Arial,sans-serif" ForeColor="Black" Text="CREATE ACCOUNT" Font-Size="X-Large"></asp:Label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style32">
                        <div style="margin-left: auto; margin-right: auto; text-align: center;" class="auto-style43">
                            <asp:TextBox ID="firstname_edit" runat="server" Height="35px" Width="390px" OnTextChanged="TextBox1_TextChanged" placeholder="First name" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    </div>
                            </td>
                        
                </tr>
                <tr>
                    <td class="auto-style32">
                        <div style="margin-left: auto; margin-right: auto; text-align: center;" class="auto-style43">
                            <asp:TextBox ID="lastname_edit" runat="server" Height="35px" Width="390px" OnTextChanged="TextBox1_TextChanged" placeholder="Last name" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                        </div>
                    </td>
                        
                </tr>
                <tr>
                    <td class="auto-style43">
                        <div style="margin-left: auto; margin-right: auto; text-align: center;" class="auto-style43">
                            <asp:TextBox ID="email_edit" runat="server" Height="35px" Width="390px" placeholder="E-mail" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                            </div>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style32">
                        <div style="margin-left: auto; margin-right: auto; text-align: center;" class="auto-style42"  >
                            <asp:TextBox ID="password_edit" runat="server" Height="35px" Width="390px" placeholder="Password" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" TextMode="Password"></asp:TextBox>
                            </div>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style32"  >
                        <div style="margin-left: auto; margin-right: auto; text-align: center;" class="auto-style43"  >
                            <asp:TextBox ID="confPassword_edit" runat="server" Height="35px" Width="390px" placeholder="Confirm Password" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" TextMode="Password"></asp:TextBox>
                            </div>
                        </td>
                </tr>
                <tr>
                    <td id="terms_checkbox0" class="auto-style36"  >
                        <div style="margin-left: auto; margin-right: auto; text-align: center;" class="auto-style44"  >
                        <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="Small"></asp:Label>
                            <br />
                        <asp:CheckBox ID="CheckBox1" runat="server" Font-Names="Franklin Gothic Medium,Arial Narrow,Arial,sans-serif" OnCheckedChanged="CheckBox1_CheckedChanged" Text="I agree all statements in Terms of service" Font-Size="Small" />
                   </div>
                            </td>
                </tr>
                <tr>
                    <td class="auto-style38">
                        <div style="margin-left: auto; margin-right: auto; text-align: center;">
                        <asp:Button ID="signup_btn" runat="server" Text="SIGN UP" Width="389px" Font-Bold="True" Font-Names="Franklin Gothic Medium,Arial Narrow,Arial,sans-serif" Font-Size="Small" Height="39px" BorderStyle="None" BackColor="#CCCCCC" OnClick="sign" />
                            </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style40"  ><div style="margin-left: auto; margin-right: auto; text-align: center;">
                        <div style="margin-left: auto; margin-right: auto; text-align: center;">
                        <asp:Label ID="Label1" runat="server" Font-Names="Franklin Gothic Medium,Arial Narrow,Arial,sans-serif" Text="Have already an account? " Font-Size="Small" ForeColor="#666666"></asp:Label>
                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Franklin Gothic Medium,Arial Narrow,Arial,sans-serif" Font-Underline="True" Font-Size="Small" ForeColor="#666666">Login here</asp:HyperLink>
                    </div>
                            </td>
                </tr>
                </table>
      
       
    </form>
</body>
</html>
