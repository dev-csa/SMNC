using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class json_simul : System.Web.UI.Page   // Simulation
{
    public string fn = "";
    public string v1 = "";
    public string v2 = "";
    public string v3 = "";
    public string v4 = "";
    public string v5 = "";
    public string v6 = "";
    public string v7 = "";
    public string v8 = "";
    public string v9 = "";
    public string v10 = "";
    public string json = "";
    public string test1 = "";


    double cost_check;
    string getTarget;
    string getcost1;
    string getcost2;
    string getcost3;
    string getcprp1;
    string getcprp2;
    string getcprp3;

    double iuserTotal;
    double iuserInput1;
    double iuserInput2;
    double iuserInput3;

    double R1_Const1;
    double R1_Slope1;
    double R1_Const2;
    double R1_Slope2;
    double R1_Const3;
    double R1_Slope3;
    double R3_Const1;
    double R3_Slope1;
    double R3_Const2;
    double R3_Slope2;
    double R3_Const3;
    double R3_Slope3;
    double GRP_Const1;
    double GRP_Slope1;
    double GRP_Const2;
    double GRP_Slope2;
    double GRP_Const3;
    double GRP_Slope3;  
    double population;
    double R1_min_1;
    double R1_min_2;
    double R1_min_3;
    double R3_min_1;
    double R3_min_2;
    double R3_min_3;
    double ratio_12;
    double ratio_13;
    double ratio_23;
    double ratio_123;

    double R1_sim1; 
    double R1_sim2; 
    double R1_sim3; 
    double R3_sim1; 
    double R3_sim2; 
    double R3_sim3; 
    double AF_sim1; 
    double AF_sim2; 
    double AF_sim3; 

    double R1_total;
    double R3_total;
    double GRP_total;
    double AF_total;

    double grp1;   
    double grp2;
    double grp3;
    double imp1;
    double imp2;
    double imp3;
    double cprpcpm1;
    double cprpcpm2;
    double cprpcpm3;

    double R1_ratio;
    double R3_ratio;

    string title;
    string analType;
    string table;
    string table_min;
    string table_ratio;
    string table_param;
    string table_pop;

    double tParam;
    double grpParam;


    protected void Page_PreInIt(object sender, EventArgs e)
    {
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // if (Session["userid"] == null)
        // {
        //     Response.Redirect("/ns/");
        // }
        
        if (Request["fn"] != null) {fn = Request["fn"];}
        if (Request["v1"] != null) {v1 = Request["v1"];}
        if (Request["v2"] != null) {v2 = Request["v2"];}
        if (Request["v3"] != null) {v3 = Request["v3"];}
        if (Request["v4"] != null) {v4 = Request["v4"];}
        if (Request["v5"] != null) {v5 = Request["v5"];}
        if (Request["v6"] != null) {v6 = Request["v6"];}
        if (Request["v7"] != null) {v7 = Request["v7"];}
        if (Request["v8"] != null) {v8 = Request["v8"];}
        if (Request["v9"] != null) {v9 = Request["v9"];}
        if (Request["v10"] != null) {v10 = Request["v10"];}

        string strcon = ConfigurationManager.ConnectionStrings["TAMConnectionString1"].ConnectionString;
        SqlConnection cn = new SqlConnection(strcon);

        getTarget = v1.ToUpper();
        analType = v2;
        getcost1 = v3;
        getcost2 = v4;           
        getcost3 = v5;
        getcprp1 = v6;
        getcprp2 = v7;
        getcprp3 = v8;

        if (analType == "type1") { // Screen 시뮬  <TV DGT>
            table = "SMNC_variable_type1";      
            table_min = "SMNC_min_type1";    
            title = "[\"TV\", \"PC\", \"Mobile\", \"Total\"]";   
        }
        else if(analType == "type2"){
            table = "SMNC_variable_type2";      
            table_min = "SMNC_min_type2";    
            title = "[\"Youtube\", \"SMR\", \"Naver\", \"Total\"]";   
        }
        else if(analType == "type3"){
            table = "SMNC_variable_type3";      
            table_min = "SMNC_min_type3";    
            title = "[\"TV_지상파\", \"TV_케이블&종편\", \"Youtube\", \"Total\"]";   
                    
        }
        table_pop = "SMNC_population";

        if (getcost1 + getcost2 + getcost2 != "0") {        
            if (getcost1 == "") {
                getcost1 = "0";
            }
            if (getcost2 == "") {
                getcost2 = "0";
            }
            if (getcost3 == "") {
                getcost3 = "0";
            }
            if (getcprp1 == "") {
                getcprp1 = "0";
            }
            if (getcprp2 == "") {
                getcprp2 = "0";
            }
            if (getcprp3 == "") {
                getcprp3 = "0";
            }
            // 유저 입력 광고비 
            iuserInput1 = Convert.ToDouble(getcost1) * 1000;
            iuserInput2 = Convert.ToDouble(getcost2) * 1000;
            iuserInput3 = Convert.ToDouble(getcost3) * 1000;
            iuserTotal = iuserInput1 + iuserInput2 + iuserInput3;

            
            // 유저 입력 CPRP/CPM 
            cprpcpm1 = Convert.ToDouble(getcprp1);
            cprpcpm2 = Convert.ToDouble(getcprp2);
            cprpcpm3 = Convert.ToDouble(getcprp3);

            string sqlComm = "SELECT * FROM " + table + " WHERE sTarget = '" + getTarget + "'";          // 계수 테이블 
            string sqlComm_Min = "SELECT * FROM " + table_min + " WHERE sTarget = '" + getTarget + "'";  // 최소값&결합비 테이블 
            
            // 결과값
            SqlCommand cmd = new SqlCommand(sqlComm, cn);
            cn.Open();
            SqlDataReader dReader = cmd.ExecuteReader();
            //Response.Write(sqlComm);
            
            if (analType == "type1") { 
                if (dReader.Read()) {
                    // Simulation 계산에 사용되는 상수. [intercept = Const, beta = Slope]
                    // Reach1 변수 
                    R1_Const1 = dReader.GetDouble(2);  // intercept = Const
                    R1_Slope1 = dReader.GetDouble(3);      // beta = Slope 
                    R1_Const2 = dReader.GetDouble(4);
                    R1_Slope2 = dReader.GetDouble(5);
                    
                    // GRP 계수 
                    GRP_Const1 = dReader.GetDouble(6);
                    GRP_Slope1 = dReader.GetDouble(7);
                    GRP_Const2 = dReader.GetDouble(8);
                    GRP_Slope2 = dReader.GetDouble(9);

                    // Reach3 변수 
                    R3_Const1 = dReader.GetDouble(10);
                    R3_Slope1 = dReader.GetDouble(11);
                    R3_Const2 = dReader.GetDouble(12);
                    R3_Slope2 = dReader.GetDouble(13);

                }
                dReader.Close();
                cn.Close();

                SqlCommand cmd2 = new SqlCommand(sqlComm_Min, cn);  //최소값&결합비 테이블 
                cn.Open();
                SqlDataReader dReader2 = cmd2.ExecuteReader();

                if (dReader2.Read()) {                   
                    R1_min_1 = dReader2.GetDouble(2);
                    R1_min_2 = dReader2.GetDouble(3);
                    R3_min_1 = dReader2.GetDouble(4);
                    R3_min_2 = dReader2.GetDouble(5);
                    ratio_12 = dReader2.GetDouble(6);                    
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

                // GRP 계산
                if((Double.IsNaN(grp1) || Double.IsInfinity(grp1))){ grp1 = 0;}
                if((Double.IsNaN(grp2) || Double.IsInfinity(grp2))){ grp2 = 0;}
                if((Double.IsNaN(imp1) || Double.IsInfinity(imp1))){ imp1 = 0;}
                if((Double.IsNaN(imp2) || Double.IsInfinity(imp2))){ imp2 = 0;}
                imp1 = iuserInput1 / cprpcpm1 * 1000;
                grp1 = imp1;
                grp1 = grp1 / population * 100;
        
                if (analType == "type2"){
                    grp2 = iuserInput2 / cprpcpm2;   
                    imp2 = grp2 / 100;
                }
                else{
                    grp2 = iuserInput2 / cprpcpm2;   
                    imp2 = grp2 / 100;
                }
                
                
                if((Double.IsNaN(grp1) || Double.IsInfinity(grp1))){ grp1 = 0;}
                if((Double.IsNaN(grp2) || Double.IsInfinity(grp2))){ grp2 = 0;}
                if((Double.IsNaN(imp1) || Double.IsInfinity(imp1))){ imp1 = 0;}
                if((Double.IsNaN(imp2) || Double.IsInfinity(imp2))){ imp2 = 0;}                
                imp3 = 0;
                grp3 = 0;                

                // TV   
                R1_sim1 = Math.Exp(R1_Const1 + R1_Slope1 * Math.Log(imp1));
                R1_sim1 = R1_sim1 / (R1_sim1 + 1);
                R3_sim1 = Math.Exp(R3_Const1 + R3_Slope1 * Math.Log(imp1));
                R3_sim1 = R3_sim1 / (R3_sim1 + 1);
                R3_sim1 = Math.Min(R3_sim1, R1_sim1);

                AF_sim1 = grp1 / R1_sim1 / 100;                
                if((Double.IsNaN(AF_sim1) || Double.IsInfinity(AF_sim1))){ AF_sim1 = 0;}                

                // DGT
                R1_sim2 = Math.Exp(R1_Const2 + R1_Slope2 * Math.Log(imp2));
                R1_sim2 = R1_sim2 / (R1_sim2 + 1);            
                R3_sim2 = Math.Exp(R3_Const2 + R3_Slope2 * Math.Log(imp2));
                R3_sim2 = R3_sim2 / (R3_sim2 + 1);                       
                R3_sim2 = Math.Min(R3_sim2, R1_sim2);

                AF_sim2 = grp2 / R1_sim2 / 100 ;  
                if((Double.IsNaN(AF_sim2) || Double.IsInfinity(AF_sim2))){ AF_sim2 = 0; }
                
                R1_sim3 = 0;
                R3_sim3 = 0;
                AF_sim3 = 0;

                // TOTAL                
                R1_total = R1_sim1 + R1_sim2 - ratio_12*(R1_sim1 * R1_sim2);
                R1_total = Math.Min(R1_total, 0.99);
                R3_total = R3_sim1 + R3_sim2 - (R3_sim1 * R3_sim2);
                R3_total = Math.Min(R3_total, R1_total);
                GRP_total = grp1 + grp2;
                AF_total = GRP_total / R1_total / 100;

            }
            else{
                if (dReader.Read()) {
                    // Simulation 계산에 사용되는 상수. [intercept = Const, beta = Slope]
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
                    //population = dReader.GetDouble(20);
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

                // GRP 계산
                if((Double.IsNaN(grp1) || Double.IsInfinity(grp1))){ grp1 = 0;}
                if((Double.IsNaN(grp2) || Double.IsInfinity(grp2))){ grp2 = 0;}
                if((Double.IsNaN(grp3) || Double.IsInfinity(grp3))){ grp3 = 0;}            
                if((Double.IsNaN(imp1) || Double.IsInfinity(imp1))){ imp1 = 0;}
                if((Double.IsNaN(imp2) || Double.IsInfinity(imp2))){ imp2 = 0;}
                if((Double.IsNaN(imp3) || Double.IsInfinity(imp3))){ imp3 = 0;} 

                imp1 = iuserInput1 / cprpcpm1 * 1000;
                grp1 = imp1;
                grp1 = grp1 / population * 100;

                imp2 = iuserInput2 / cprpcpm2 * 1000;
                grp2 = imp2;
                grp2 = grp2 / population * 100;
                
                imp3 = iuserInput3 / cprpcpm3 * 1000;            
                grp3 = imp3;            
                grp3 = grp3 / population * 100;
                
                if((Double.IsNaN(grp1) || Double.IsInfinity(grp1))){ grp1 = 0;}
                if((Double.IsNaN(grp2) || Double.IsInfinity(grp2))){ grp2 = 0;}
                if((Double.IsNaN(grp3) || Double.IsInfinity(grp3))){ grp3 = 0;}            
                if((Double.IsNaN(imp1) || Double.IsInfinity(imp1))){ imp1 = 0;}
                if((Double.IsNaN(imp2) || Double.IsInfinity(imp2))){ imp2 = 0;}
                if((Double.IsNaN(imp3) || Double.IsInfinity(imp3))){ imp3 = 0;}                        
                
                // TV(Youtube)   
                R1_sim1 = Math.Exp(R1_Const1 + R1_Slope1 * Math.Log(imp1));
                R1_sim1 = R1_sim1 / (R1_sim1 + 1);
                R3_sim1 = Math.Exp(R3_Const1 + R3_Slope1 * Math.Log(imp1));
                R3_sim1 = R3_sim1 / (R3_sim1 + 1);
                R3_sim1 = Math.Min(R3_sim1, R1_sim1);

                AF_sim1 = grp1 / R1_sim1 / 100;                
                if((Double.IsNaN(AF_sim1) || Double.IsInfinity(AF_sim1))){ AF_sim1 = 0;}

                // PC(SMR)
                R1_sim2 = Math.Exp(R1_Const2 + R1_Slope2 * Math.Log(imp2));
                R1_sim2 = R1_sim2 / (R1_sim2 + 1);            
                R3_sim2 = Math.Exp(R3_Const2 + R3_Slope2 * Math.Log(imp2));
                R3_sim2 = R3_sim2 / (R3_sim2 + 1);                       
                R3_sim2 = Math.Min(R3_sim2, R1_sim2);

                AF_sim2 = grp2 / R1_sim2 / 100 ;  
                if((Double.IsNaN(AF_sim2) || Double.IsInfinity(AF_sim2))){ AF_sim2 = 0; }

                // MO(Naver)
                R1_sim3 = Math.Exp(R1_Const3 + R1_Slope3 * Math.Log(imp3));
                R1_sim3 = R1_sim3 / (R1_sim3 + 1);            
                R3_sim3 = Math.Exp(R3_Const3 + R3_Slope3 * Math.Log(imp3));
                R3_sim3 = R3_sim3 / (R3_sim3 + 1);            
                R3_sim3 = Math.Min(R3_sim3, R1_sim3);

                AF_sim3 = grp3 / R1_sim3 / 100; 
                if((Double.IsNaN(AF_sim3) || Double.IsInfinity(AF_sim3))){ AF_sim3 = 0;}
                // TOTAL                
                R1_total = R1_sim1 + R1_sim2 + R1_sim3 - ratio_12*(R1_sim1 * R1_sim2) - ratio_13*(R1_sim1 * R1_sim3) - ratio_23*(R1_sim2 * R1_sim3) + ratio_123*(R1_sim1 * R1_sim2 * R1_sim3);
                R1_total = Math.Min(R1_total, 0.99);
                R3_total = R3_sim1 + R3_sim2 + R3_sim3 - (R3_sim1 * R3_sim2) - (R3_sim1 * R3_sim3) - (R3_sim2 * R3_sim3) + (R3_sim1 * R3_sim2 * R3_sim3);
                R3_total = Math.Min(R3_total, R1_total);
                GRP_total = grp1 + grp2 + grp3;
                AF_total = GRP_total / R1_total / 100;
            }

            

            json += "{ \"no\": \"" + v9 + "\"";
            json += ", \"title\": " + title;   
            json += ", \"cost\":     [" + iuserInput1/1000 + ", " + iuserInput2/1000 + ", " + iuserInput3/1000 + ", " + iuserTotal/1000 + "]";                             
            json += ", \"share\":  [" + (iuserInput1/iuserTotal)*100 + ", " + (iuserInput2/iuserTotal)*100 + ", " + (iuserInput3/iuserTotal)*100 + ", 100 ]";       
            json += ", \"grp\":     [" + grp1 + ", " + grp2 + ", " + grp3 + ", " + GRP_total + "]";                
            json += ", \"reach1\":  [" + R1_sim1 + ", " + R1_sim2+ ", " + R1_sim3 + ", " + R1_total + "]";
            json += ", \"reach3\":  [" + R3_sim1 + ", " + R3_sim2 + ", " + R3_sim3 + ", " + R3_total + "]";      
            json += ", \"af\":  [" + AF_sim1 + ", " + AF_sim2 + ", " + AF_sim3 + ", " + AF_total + "]";                           
            json += ", \"cpm\":  [" + cprpcpm1 + ", " + cprpcpm2 + ", " + cprpcpm3 + ", 1]";  
            json += " }";
                            
        }
          
    }    
}