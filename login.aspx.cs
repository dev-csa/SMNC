using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _login : System.Web.UI.Page
{
    public string logincheck;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            Response.Redirect("Index.aspx");
        }
    }
    
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        
        SqlConnection con = new SqlConnection("Data Source=10.224.77.21;Initial Catalog=TAM;User ID=tam_mis;password=tam0610;");
        con.Close();
        con.Open();

        SqlCommand cmd = new SqlCommand("Select count(*) from TB_USER where compnm='sbsmnc' and userid='" + txtusername.Text + "' and password ='" + txtpassword.Text + "'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        // Response.Write("Select count(*) from TB_USER where userid='" + txtusername + "' and password ='" + txtpassword + "'");
        if (dt.Rows[0][0].ToString() =="1" )
        {
            Session["userid"] = txtusername.Text;
            Response.Redirect("Index.aspx");
        }
        else
        {
            Response.Write("<script>alert('아이디와 비밀번호를 다시 확인하세요')</script>");
        }


        //foreach (DataRow dr in dt.Rows)
        //{
        //    Session["userid"] = dr["userid"].ToString();
        //    Response.Redirect("Main.aspx");
        //}
        //else
        //{
        //    Response.Write("<script>alert('Please enter valid Username and Password')</script>");
        //}
    }
}