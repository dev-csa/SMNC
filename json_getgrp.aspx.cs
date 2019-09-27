using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class json_getgrp : System.Web.UI.Page   //GRP 계수 DB에서 가져오기 
{
    public string v1 = "";
    public string v2 = "";   
    public string v3 = "";   
    public string json = ""; 

    public string getTarget;
    public string getType;
    public string gettvType;
    public string table;

    public double GRP_Const1;
    public double GRP_Slope1;
    public double GRP_Const2;
    public double GRP_Slope2;
    public double GRP_Const3;
    public double GRP_Slope3;    

    protected void Page_PreInIt(object sender, EventArgs e)
    {
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["v1"] != null) {v1 = Request["v1"];}
        if (Request["v2"] != null) {v2 = Request["v2"];}
        if (Request["v3"] != null) {v3 = Request["v3"];}                    

        getTarget = v1;
        getType = v2;
        gettvType = v3;

        if (getTarget == null){
            getTarget = "MF0769";
        }
        if (getType == null){
            getType = "screen";
        }

        if (getType == "screen") { 
            table = "SMNC_variable_type1";      
        }
        else if(getType == "digital"){
            table = "SMNC_variable_type2";      
        }
        else if(getType == "tvdigital"){
            if(gettvType == "pub"){
                table = "SMNC_variable_TOYTSM";  
            }
            else{
                table = "SMNC_variable_PUCAYT";      
            }
            
        }
        string strcon = ConfigurationManager.ConnectionStrings["TAMConnectionString1"].ConnectionString;
        SqlConnection cn = new SqlConnection(strcon);
        
        string sqlComm = "SELECT * FROM " + table + " WHERE sTarget = '" + getTarget + "'";
        //Response.Write(sqlComm);

        SqlCommand cmd = new SqlCommand(sqlComm, cn);
        cn.Open();
        SqlDataReader dReader = cmd.ExecuteReader();
        
        // Simulation 계산에 사용되는 상수. [intercept = Const, beta = Slope]
        // GRP 계수 
        if (getType == "screen") { 
            GRP_Const1 = dReader.GetDouble(6);
            GRP_Slope1 = dReader.GetDouble(7);
            GRP_Const2 = dReader.GetDouble(8);
            GRP_Slope2 = dReader.GetDouble(9);
            GRP_Const3 = 0;
            GRP_Slope3 = 0;
        }
        else{
            if (dReader.Read()) {            
            GRP_Const1 = dReader.GetDouble(8);
            GRP_Slope1 = dReader.GetDouble(9);
            GRP_Const2 = dReader.GetDouble(10);
            GRP_Slope2 = dReader.GetDouble(11);
            GRP_Const3 = dReader.GetDouble(12);
            GRP_Slope3 = dReader.GetDouble(13);
        }
        }
        
        dReader.Close();
        cn.Close();
        
        json += "{ \"const\":   [" + GRP_Const1 + ", " + GRP_Const2 + ", " + GRP_Const3 + "]";
        json += ", \"slope\":   [" + GRP_Slope1 + ", " + GRP_Slope2 + ", " + GRP_Slope3 + "]";
        json += " }";       

    }
}    
