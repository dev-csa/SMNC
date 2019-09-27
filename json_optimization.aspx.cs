using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class json_optimization : System.Web.UI.Page  // 최적화 Optimization 
{
    public string fn = "";
    public string v1 = "";
    public string v2 = "";
    public string v3 = "";
    public string v4 = "";
    public string v5 = "";

    public string json = "";
    public string test1 = "";
    public string no;

    public double R1_Const1;
    public double R1_Slope1;
    public double R1_Const2;
    public double R1_Slope2;
    public double R1_Const3;
    public double R1_Slope3;
    public double R1_Const4;
    public double R1_Slope5;

    public double R3_Const1;
    public double R3_Slope1;
    public double R3_Const2;
    public double R3_Slope2;
    public double R3_Const3;
    public double R3_Slope3;
    public double R3_Const4;
    public double R3_Slope5;

    public double GRP_Const1;
    public double GRP_Slope1;
    public double GRP_Const2;
    public double GRP_Slope2;
    public double GRP_Const3;
    public double GRP_Slope3;
    public double GRP_Const4;
    public double GRP_Slope5;   

    double cost_check;
    string getTarget;
    string getTarget_kor;
    string optCost;
    double inputCost;  

    string analType;
    string table;
    string table_min;
    string table_pop;
    double population;
    double R1_min_1;
    double R1_min_2;
    double R1_min_3;
    double R1_min_4;
    double R1_min_5;
    double R3_min_1;
    double R3_min_2;
    double R3_min_3;
    double R3_min_4;
    double R3_min_5;
    double ratio_12;
    double ratio_13;
    double ratio_23;
    double ratio_123;
    double ratio_45;
    string title;
    

    protected void Page_PreInIt(object sender, EventArgs e)
    {
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // if (Session["userid"] == null)
        // {
        //     Response.Redirect("/sm/");
        // }
        
        if (Request["fn"] != null) {fn = Request["fn"];}
        if (Request["v1"] != null) {v1 = Request["v1"];}
        if (Request["v2"] != null) {v2 = Request["v2"];}
        if (Request["v3"] != null) {v3 = Request["v3"];}
        if (Request["v4"] != null) {v4 = Request["v4"];}

        string strcon = ConfigurationManager.ConnectionStrings["TAMConnectionString1"].ConnectionString;
        SqlConnection cn = new SqlConnection(strcon);

        analType = v1;
        getTarget = v2;        
        optCost = v3;
        no = v4;

        if (analType == "screen") { // Screen 시뮬  <TV PC MO>
            table = "SMNC_variable_type1";      
            table_min = "SMNC_min_type1";    
            title = "[\"TV\", \"DGT\", \"Total\"]";   
        }
        else if(analType == "digital"){
            table = "SMNC_variable_type2";      
            table_min = "SMNC_min_type2";    
            title = "[\"Youtube\", \"SMR\", \"Naver\", \"Total\"]";   
        }
        else if(analType == "tvdigital"){
            table = "SMNC_variable_type3";      
            table_min = "SMNC_min_type3";    
            title = "[\"TV_지상파\", \"TV_케이블&종편\", \"Youtube\", \"Total\"]";   
                    
        }
        table_pop = "SMNC_population";

        if (optCost == "") {
            optCost = "0";
        }
        

        string sqlComm = "SELECT * FROM " + table + " WHERE sTarget = '" + getTarget + "'";          // 계수 테이블 
        string sqlComm_Min = "SELECT * FROM " + table_min + " WHERE sTarget = '" + getTarget + "'";  // 최소값&결합비 테이블 
        //Response.Write(sqlComm);
        // 결과값
        SqlCommand cmd = new SqlCommand(sqlComm, cn);
        cn.Open();
        SqlDataReader dReader = cmd.ExecuteReader();
        if(analType == "screen"){
            if (dReader.Read()) {
                // Simulation 계산에 사용되는 상수. [intercept = Const, beta = Slope]
                // Reach1 변수 
                R1_Const1 = dReader.GetDouble(2);       
                R1_Slope1 = dReader.GetDouble(3);      
                R1_Const2 = dReader.GetDouble(4);
                R1_Slope2 = dReader.GetDouble(5);

                // Reach3 변수
                R3_Const1 = dReader.GetDouble(10);
                R3_Slope1 = dReader.GetDouble(11);
                R3_Const2 = dReader.GetDouble(12);
                R3_Slope2 = dReader.GetDouble(13);                    

                // GRP변수 
                GRP_Const1 = dReader.GetDouble(6);
                GRP_Slope1 = dReader.GetDouble(7);
                GRP_Const2 = dReader.GetDouble(8);
                GRP_Slope2 = dReader.GetDouble(9);
            }
            dReader.Close();
            cn.Close();

            //최소값 테이블 --------------------------------------------------
            SqlCommand cmd2 = new SqlCommand(sqlComm_Min, cn);  
            cn.Open();
            SqlDataReader dReader2 = cmd2.ExecuteReader();

            if (dReader2.Read()) {
                
                R1_min_1 = dReader2.GetDouble(2) * 0.01;      
                R1_min_2 = dReader2.GetDouble(3) * 0.01;                          
                R3_min_1 = dReader2.GetDouble(4) * 0.01;
                R3_min_2 = dReader2.GetDouble(5) * 0.01;
                ratio_12 = dReader2.GetDouble(6);
            }
            dReader2.Close();
            cn.Close();                           
        }
        else{
            if (dReader.Read()) {
                // 계산에 사용되는 상수. [intercept = Const, beta = Slope]
                // Reach1 변수 
                R1_Const1 = dReader.GetDouble(2);  // intercept = Const
                R1_Slope1 = dReader.GetDouble(3);      // beta = Slope 
                R1_Const2 = dReader.GetDouble(4);
                R1_Slope2 = dReader.GetDouble(5);
                R1_Const3 = dReader.GetDouble(6);
                R1_Slope3 = dReader.GetDouble(7);
                
                // GRP 계수 
                GRP_Const1 = dReader.GetDouble(8);
                GRP_Slope1 = dReader.GetDouble(9);
                GRP_Const2 = dReader.GetDouble(10);
                GRP_Slope2 = dReader.GetDouble(11);
                GRP_Const3 = dReader.GetDouble(12);
                GRP_Slope3 = dReader.GetDouble(13);

                // Reach3 변수 
                R3_Const1 = dReader.GetDouble(14);
                R3_Slope1 = dReader.GetDouble(15);
                R3_Const2 = dReader.GetDouble(16);
                R3_Slope2 = dReader.GetDouble(17);
                R3_Const3 = dReader.GetDouble(18);
                R3_Slope3 = dReader.GetDouble(19);

                // 모집단
                // population = dReader.GetDouble(20);                                   
            }
            
            dReader.Close();
            cn.Close();

            SqlCommand cmd2 = new SqlCommand(sqlComm_Min, cn);  //최소값&결합비 테이블 
            cn.Open();
            SqlDataReader dReader2 = cmd2.ExecuteReader();

            if (dReader2.Read()) {            
                R1_min_1 = dReader2.GetDouble(2);
                R1_min_2 = dReader2.GetDouble(3);
                R1_min_3 = dReader2.GetDouble(4);
                R3_min_1 = dReader2.GetDouble(5);
                R3_min_2 = dReader2.GetDouble(6);
                R3_min_3 = dReader2.GetDouble(7);
                ratio_12 = dReader2.GetDouble(8);
                ratio_13 = dReader2.GetDouble(9);
                ratio_23 = dReader2.GetDouble(10);
                ratio_123 = dReader2.GetDouble(11);
            }

            dReader2.Close();
            cn.Close();

            string sqlComm_pop = "SELECT * FROM  " + table_pop + " WHERE target = '" + getTarget + "'";
            SqlCommand cmd3 = new SqlCommand(sqlComm_pop, cn);  //최소값&결합비 테이블 
            cn.Open();
            SqlDataReader dReader3 = cmd3.ExecuteReader();

            if (dReader3.Read()) {            
                population = dReader3.GetDouble(1);
            }

            dReader3.Close();
            cn.Close();        
        }

        json += "{ \"no\": \"" + v4 + "\"";
        json += ", \"title\": " + title;   
        if(analType == "screen"){
            json += ", \"r1_const\":    [" + R1_Const1 + ", " + R1_Const2 + ", 1 ]";
            json += ", \"r1_slope\":    [" + R1_Slope1 + ", " + R1_Slope2 + ", 1 ]";
            json += ", \"r3_const\":    [" + R3_Const1 + ", " + R3_Const2 + ", 1 ]";
            json += ", \"r3_slope\":    [" + R3_Slope1 + ", " + R3_Slope2 + ", 1 ]";
            json += ", \"grp_const\":   [" + GRP_Const1 + ", " + GRP_Const2 + ", 1 ]";
            json += ", \"grp_slope\":   [" + GRP_Slope1 + ", " + GRP_Slope2 + ", 1 ]";
            json += ", \"r1_min\":    [" + R1_min_1 + ", " + R1_min_2 + ", 1 ]";
            json += ", \"r3_min\":    [" + R3_min_1 + ", " + R3_min_2 + ", 1 ]";
            json += ", \"ratio\":   [" + ratio_12 + "]";
        }
        else{
            json += ", \"r1_const\":    [" + R1_Const1 + ", " + R1_Const2 + ", " + R1_Const3 + ", 1 ]";
            json += ", \"r1_slope\":    [" + R1_Slope1 + ", " + R1_Slope2 + ", " + R1_Slope3 + ", 1]";
            json += ", \"r3_const\":    [" + R3_Const1 + ", " + R3_Const2 + ", " + R3_Const3 + ", 1]";
            json += ", \"r3_slope\":    [" + R3_Slope1 + ", " + R3_Slope2 + ", " + R3_Slope3 + ", 1]";
            json += ", \"grp_const\":   [" + GRP_Const1 + ", " + GRP_Const2 + ", " + GRP_Const3 + ", 1]";
            json += ", \"grp_slope\":   [" + GRP_Slope1 + ", " + GRP_Slope2 + ", " + GRP_Slope3 + ", 1]";
            json += ", \"r1_min\":    [" + R1_min_1 + ", " + R1_min_2 + ", " + R1_min_3 + ", 1]";
            json += ", \"r3_min\":    [" + R3_min_1 + ", " + R3_min_2 + ", " + R3_min_3 + ", 1]";
            json += ", \"ratio\":   [" + ratio_12 + ", " + ratio_13 + ", " + ratio_23 + "," + ratio_123 + "]";
        }
        json += ", \"population\":   [" + population + ", \"타겟: " + getTarget + "\"]";
        json += " }";       
        
    // Response.Write(json);
    
    }    
}