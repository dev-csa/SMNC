using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class json_bytime : System.Web.UI.Page  // 이용행태 - 시간대별 
{
    public string fn = "";
    public string v0 = "";
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

    public string[] type;
    public string page;
    public string index;
    public string month;
    public string daytype;
    public string one_month;
    public string gender;
    public string info_target;
    public string age;
    public string json;
    public string title;
    string table;
    
    string sqlComm1;
    string sqlComm2;
    string sqlComm3;
    string sqlComm4;
    
    public double[] value1_uv = new double[50];
    public double[] value2_uv = new double[50];
    public double[] value3_uv = new double[50];
    public double[] value1_tts = new double[50];
    public double[] value2_tts = new double[50];
    public double[] value3_tts = new double[50];
    public double[] value1_time = new double[50];
    public double[] value2_time = new double[50];
    public double[] value3_time = new double[50];
    public double[] value1_user = new double[50];
    public double[] value2_user = new double[50];
    public double[] value3_user = new double[50];
    public double[] uni1 = new double[50];
    public double[] uni2 = new double[50];
    public double[] uni3 = new double[50];
    public double[] tts = new double[50];
    public double[] uv = new double[50];
    public double[] uv1 = new double[50];
    public double[] uv2 = new double[50];
    public double[] uv3 = new double[50];
    public double[] tts1 = new double[50];
    public double[] tts2 = new double[50];
    public double[] tts3 = new double[50];
    public double[] share_uv1 = new double[50];
    public double[] share_uv2 = new double[50];
    public double[] share_uv3 = new double[50];
    public double[] share_tts1 = new double[50];
    public double[] share_tts2 = new double[50];
    public double[] share_tts3 = new double[50];
    public double[] dbmonth = new double[50];
    public double[] day_month = new double[50];
    public int age_num;     
    // public string[] pcValue2 = new string[30];
    // public string[] moValue2 = new string[30];

    protected void Page_PreInIt(object sender, EventArgs e)
    {
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // if (Session["userid"] == null)
        // {
        //     Response.Redirect("/INNO/");
        // }
        
        if (Request["fn"] != null) {fn = Request["fn"];}
        if (Request["v0"] != null) {v0 = Request["v0"];}
        if (Request["v1"] != null) {v1 = Request["v1"];}
        // if (Request["v2"] != null) {v2 = Request["v2"];}
        if (Request["v3"] != null) {v3 = Request["v3"];}
        if (Request["v4"] != null) {v4 = Request["v4"];}
        if (Request["v5"] != null) {v5 = Request["v5"];}
        

        string strcon = ConfigurationManager.ConnectionStrings["TAMConnectionString1"].ConnectionString;
        SqlConnection cn = new SqlConnection(strcon);

        page = v0;
        daytype = v1;
        // index = v2;
        gender = v3;
        age = v4;
        month = v5;
        
        if(page == "bytime"){
            table = "INNO_byTime";
        }
        else if(page == "bytime_video"){
            table = "INNO_byTime_video";
        }
        
        type = new string[] {"TV", "PC", "MO"};
        title =  "[\"TV\", \"PC\", \"Mobile\"]";

        if(gender == "MF"){
            info_target = "남여 ";
        }
        if(gender == "F"){
            info_target = "여자 ";
        }
        else if(gender == "M"){
            info_target = "남자 ";
        }
        age_num = age.Length;        
        if(age == "'ALL'"){            
            info_target += "전체";
        }
        else if(age.Substring(1, 3) == "ALL"){
            info_target += "전체";
        }
        else{
            info_target += age.Substring(1, 2) + "~" + age.Substring(age_num-3, 2) + "세";
        }

        string sqlWhere = "' AND SEX='" + gender +"' AND WEEKDAY='" + daytype +"' AND AGECD IN(" + age + ") AND MONTH IN(" + month + ")";
        int a = 0;
        int row_num = 0;   

        // 총 이용자수(UV)  ----------------------------------------
        sqlComm1  = "SELECT TIMECD, SUM(UV), "; 
        sqlComm1 += "(SELECT SUM(UV) FROM " + table + " b WHERE DEVICE='" + type[1] + sqlWhere + " AND a.TIMECD = b.TIMECD GROUP BY TIMECD), ";
        sqlComm1 += "(SELECT SUM(UV) FROM " + table + " c WHERE DEVICE='" + type[2] + sqlWhere + " AND a.TIMECD = c.TIMECD GROUP BY TIMECD) ";
        sqlComm1 += "FROM " + table + " a WHERE DEVICE='" + type[0] + sqlWhere + " GROUP BY TIMECD ";    
        //  Response.Write(sqlComm1+"@@");   

        SqlCommand cmd1 = new SqlCommand(sqlComm1, cn);
        cn.Open();
        SqlDataReader dReader1 = cmd1.ExecuteReader();
        a = 0;        
        while(dReader1.Read()) {
            double getdata1 = dReader1.GetDouble(0);    // 분석일자
            double getdata2 = dReader1.GetDouble(1);    // 첫번째 미디어 항목(tv /yt /지상파)
            double getdata3 = dReader1.GetDouble(2);    // 두번째 미디어 항목(pc /sm /케이블&종편)
            double getdata4 = dReader1.GetDouble(3);    // 세번째 미디어 항목(mo /nv /yt)
            // dbmonth[a] = getdata1;
            value1_uv[a] = getdata2 / 1000 ;
            value2_uv[a] = getdata3 / 1000;
            value3_uv[a] = getdata4 / 1000;
            a = a+1;
        }
        
        dReader1.Close();
        cn.Close();                                                                              

        // 총 이용시간(TTS) ----------------------------------------
        sqlComm2  = "SELECT TIMECD, SUM(TTS), "; 
        sqlComm2 += "(SELECT SUM(TTS) FROM " + table + " b WHERE DEVICE='" + type[1] + sqlWhere + " AND a.TIMECD = b.TIMECD GROUP BY TIMECD), ";
        sqlComm2 += "(SELECT SUM(TTS) FROM " + table + " c WHERE DEVICE='" + type[2] + sqlWhere + " AND a.TIMECD = c.TIMECD GROUP BY TIMECD) ";
        sqlComm2 += "FROM " + table + " a WHERE DEVICE='" + type[0] + sqlWhere + " GROUP BY TIMECD ";    

        SqlCommand cmd2 = new SqlCommand(sqlComm2, cn);
        cn.Open();
        SqlDataReader dReader2 = cmd2.ExecuteReader();
        a = 0;        
        while(dReader2.Read()) {
            double getdata1 = dReader2.GetDouble(0);    // 분석일자
            double getdata2 = dReader2.GetDouble(1);    // 첫번째 미디어 항목(tv /yt /지상파)
            double getdata3 = dReader2.GetDouble(2);    // 두번째 미디어 항목(pc /sm /케이블&종편)
            double getdata4 = dReader2.GetDouble(3);    // 세번째 미디어 항목(mo /nv /yt)
            value1_tts[a] = getdata2 / 1000000;
            value2_tts[a] = getdata3 / 1000000;
            value3_tts[a] = getdata4 / 1000000;
            a = a+1;
        }
        
        dReader2.Close();
        cn.Close();  

        // 일평균이용시간(AVG_DAILY_ATV) -------------------------------------------------------
        if(age_num < 8){    // 타겟 하나일때
            sqlComm3  = "SELECT TIMECD, SUM(AVG_DAILY_ATV), "; 
            sqlComm3 += "(SELECT SUM(AVG_DAILY_ATV) FROM " + table + " b WHERE DEVICE='" + type[1] + sqlWhere + " AND a.TIMECD = b.TIMECD GROUP BY TIMECD), ";
            sqlComm3 += "(SELECT SUM(AVG_DAILY_ATV) FROM " + table + " c WHERE DEVICE='" + type[2] + sqlWhere + " AND a.TIMECD = c.TIMECD GROUP BY TIMECD) ";
            sqlComm3 += "FROM " + table + " a WHERE DEVICE='" + type[0] + sqlWhere + " GROUP BY TIMECD ";

            SqlCommand cmd3 = new SqlCommand(sqlComm3, cn);
            cn.Open();
            SqlDataReader dReader3 = cmd3.ExecuteReader();
            a = 0;        
            while(dReader3.Read()) {
                double getdata1 = dReader3.GetDouble(0);    // 분석일자
                double getdata2 = dReader3.GetDouble(1);    // 첫번째 미디어 항목(tv /yt /지상파)
                double getdata3 = dReader3.GetDouble(2);    // 두번째 미디어 항목(pc /sm /케이블&종편)
                double getdata4 = dReader3.GetDouble(3);    // 세번째 미디어 항목(mo /nv /yt)
                // dbmonth[a] = getdata1;
                value1_time[a] = getdata2;
                value2_time[a] = getdata3;
                value3_time[a] = getdata4;
                a = a+1;
            }
            
            dReader3.Close();
            cn.Close();       
        }else{  // 타겟 여러개일때 
            // Univers 합계 
            sqlComm1  = "SELECT TIMECD, SUM(Universe) tv_uv, "; 
            sqlComm1 += "(SELECT SUM(Universe) pc_uv FROM " + table + " b WHERE DEVICE='" + type[1] + sqlWhere + " AND a.TIMECD = b.TIMECD GROUP BY TIMECD), ";
            sqlComm1 += "(SELECT SUM(Universe) mo_uv FROM " + table + " c WHERE DEVICE='" + type[2] + sqlWhere + " AND a.TIMECD = c.TIMECD GROUP BY TIMECD) ";
            sqlComm1 += "FROM " + table + " a WHERE DEVICE='" + type[0] + sqlWhere + " GROUP BY TIMECD";
            // TTS 합계
            sqlComm2  = "SELECT TIMECD, SUM(TTS) tv_tts, "; 
            sqlComm2 += "(SELECT SUM(TTS) pc_tts FROM " + table + " b WHERE DEVICE='" + type[1] + sqlWhere + " AND a.TIMECD = b.TIMECD GROUP BY TIMECD), ";
            sqlComm2 += "(SELECT SUM(TTS) mo_tts FROM " + table + " c WHERE DEVICE='" + type[2] + sqlWhere + " AND a.TIMECD = c.TIMECD GROUP BY TIMECD) ";
            sqlComm2 += "FROM " + table + " a WHERE DEVICE='" + type[0] + sqlWhere + " GROUP BY TIMECD";
            //월별 일자 수 
            sqlComm3 = "SELECT TIMECD, DAY_MONTH FROM " + table + " WHERE DEVICE='" + type[0] + sqlWhere + " GROUP BY TIMECD, DAY_MONTH"; 
            cmd1 = new SqlCommand(sqlComm1, cn);
            cn.Open();
            dReader1 = cmd1.ExecuteReader();
            a = 0;  
            row_num = 0;      
            while(dReader1.Read()) {
                double getdata1 = dReader1.GetDouble(0);    // 분석일자
                double getdata2 = dReader1.GetDouble(1);    // 첫번째 미디어 항목(tv /yt /지상파)
                double getdata3 = dReader1.GetDouble(2);    // 두번째 미디어 항목(pc /sm /케이블&종편)
                double getdata4 = dReader1.GetDouble(3);    // 세번째 미디어 항목(mo /nv /yt)
                dbmonth[a] = getdata1;
                uni1[a] = getdata2;
                uni2[a] = getdata3;
                uni3[a] = getdata4;
                a = a+1;
            }
            row_num = a;

            dReader1.Close();
            cn.Close();    

            cmd2 = new SqlCommand(sqlComm2, cn);
            cn.Open();
            dReader2 = cmd2.ExecuteReader();
            a = 0;        
            while(dReader2.Read()) {
                double getdata1 = dReader2.GetDouble(0);    // 분석일자
                double getdata2 = dReader2.GetDouble(1);    // 첫번째 미디어 항목(tv /yt /지상파)
                double getdata3 = dReader2.GetDouble(2);    // 두번째 미디어 항목(pc /sm /케이블&종편)
                double getdata4 = dReader2.GetDouble(3);    // 세번째 미디어 항목(mo /nv /yt)
                tts1[a] = getdata2;
                tts2[a] = getdata3;
                tts3[a] = getdata4;
                a = a+1;
            }
            
            dReader2.Close();
            cn.Close();    

            SqlCommand cmd3 = new SqlCommand(sqlComm3, cn);
            cn.Open();
            SqlDataReader dReader3 = cmd3.ExecuteReader();
            a = 0;        
            while(dReader3.Read()) {
                double getdata1 = dReader3.GetDouble(1);    // 월별 일자 수 
                day_month[a] = getdata1;
                a = a+1;
            }
            
            dReader3.Close();
            cn.Close();    

            for(int i=0; i<row_num; i++){
                value1_time[i] = (tts1[i] / day_month[i]) / uni1[i];
                value2_time[i] = (tts2[i] / day_month[i]) / uni2[i];
                value3_time[i] = (tts3[i] / day_month[i]) / uni3[i];
                // Response.Write(i + ">>" + tts3[i] +"/"+ day_month[i] +"/"+ uni3[i] + "\n");
            }   
        }         
        
        // 일평균이용률(AVG_USER) -------------------------------------------------------
        if(age_num < 8){    // 타겟 하나일때
            sqlComm4  = "SELECT TIMECD, SUM(AVG_USER), "; 
            sqlComm4 += "(SELECT SUM(AVG_USER) FROM " + table + " b WHERE DEVICE='" + type[1] + sqlWhere + " AND a.TIMECD = b.TIMECD GROUP BY TIMECD), ";
            sqlComm4 += "(SELECT SUM(AVG_USER) FROM " + table + " c WHERE DEVICE='" + type[2] + sqlWhere + " AND a.TIMECD = c.TIMECD GROUP BY TIMECD) ";
            sqlComm4 += "FROM " + table + " a WHERE DEVICE='" + type[0] + sqlWhere + " GROUP BY TIMECD ";
            
            SqlCommand cmd4 = new SqlCommand(sqlComm4, cn);
            cn.Open();
            SqlDataReader dReader4 = cmd4.ExecuteReader();
            a = 0;        
            while(dReader4.Read()) {
                double getdata1 = dReader4.GetDouble(0);    // 분석일자
                double getdata2 = dReader4.GetDouble(1);    // 첫번째 미디어 항목(tv /yt /지상파)
                double getdata3 = dReader4.GetDouble(2);    // 두번째 미디어 항목(pc /sm /케이블&종편)
                double getdata4 = dReader4.GetDouble(3);    // 세번째 미디어 항목(mo /nv /yt)
                // dbmonth[a] = getdata1;
                value1_user[a] = getdata2 * 100;
                value2_user[a] = getdata3 * 100;
                value3_user[a] = getdata4 * 100;
                a = a+1;
            }
            
            dReader4.Close();
            cn.Close();               
        }
        else{  // 타겟 여러개일때 
            // Univers 합계 
            sqlComm1  = "SELECT TIMECD, SUM(Universe) tv_uv, "; 
            sqlComm1 += "(SELECT SUM(Universe) FROM " + table + " b WHERE DEVICE='" + type[1] + sqlWhere + " AND a.TIMECD = b.TIMECD GROUP BY TIMECD) as pc_uv, ";
            sqlComm1 += "(SELECT SUM(Universe) FROM " + table + " c WHERE DEVICE='" + type[2] + sqlWhere + " AND a.TIMECD = c.TIMECD GROUP BY TIMECD) as mo_uv ";
            sqlComm1 += "FROM " + table + " a WHERE DEVICE='" + type[0] + sqlWhere + " GROUP BY TIMECD";
            // AVG_Daily_UV 합계
            sqlComm2  = "SELECT TIMECD, SUM(AVG_DAILY_UV) tv_avg, "; 
            sqlComm2 += "(SELECT SUM(AVG_DAILY_UV) FROM " + table + " b WHERE DEVICE='" + type[1] + sqlWhere + " AND a.TIMECD = b.TIMECD GROUP BY TIMECD) as pc_avg, ";
            sqlComm2 += "(SELECT SUM(AVG_DAILY_UV) FROM " + table + " c WHERE DEVICE='" + type[2] + sqlWhere + " AND a.TIMECD = c.TIMECD GROUP BY TIMECD) as mo_avg ";
            sqlComm2 += "FROM " + table + " a WHERE DEVICE='" + type[0] + sqlWhere + " GROUP BY TIMECD";

            // Response.Write(sqlComm2);    
            cmd1 = new SqlCommand(sqlComm1, cn);
            cn.Open();
            dReader1 = cmd1.ExecuteReader();
            a = 0;        
            row_num = 0;    
            while(dReader1.Read()) {
                double getdata1 = dReader1.GetDouble(0);    // 분석일자
                double getdata2 = dReader1.GetDouble(1);    // 첫번째 미디어 항목(tv /yt /지상파)
                double getdata3 = dReader1.GetDouble(2);    // 두번째 미디어 항목(pc /sm /케이블&종편)
                double getdata4 = dReader1.GetDouble(3);    // 세번째 미디어 항목(mo /nv /yt)
                dbmonth[a] = getdata1;
                uv1[a] = getdata2;
                uv2[a] = getdata3;
                uv3[a] = getdata4;
                a = a+1;
            }       
            row_num = a;

            dReader1.Close();
            cn.Close();    

            cmd2 = new SqlCommand(sqlComm2, cn);
            cn.Open();
            dReader2 = cmd2.ExecuteReader();
            a = 0;        
            while(dReader2.Read()) {
                double getdata1 = dReader2.GetDouble(0);    // 분석일자
                double getdata2 = dReader2.GetDouble(1);    // 첫번째 미디어 항목(tv /yt /지상파)
                double getdata3 = dReader2.GetDouble(2);    // 두번째 미디어 항목(pc /sm /케이블&종편)
                double getdata4 = dReader2.GetDouble(3);    // 세번째 미디어 항목(mo /nv /yt)
                uni1[a] = getdata2;
                uni2[a] = getdata3;
                uni3[a] = getdata4;
                a = a+1;
            }            
            dReader2.Close();
            cn.Close();   
            for(int i=0; i<row_num; i++){
                value1_user[i] = uni1[i] / uv1[i] * 100;
                value2_user[i] = uni2[i] / uv2[i] * 100;
                value3_user[i] = uni3[i] / uv3[i] * 100;
            }
        }
    

        
        string json_value1_uv = "";
        string json_value2_uv = "";
        string json_value3_uv = "";
        string json_value1_tts = "";
        string json_value2_tts = "";
        string json_value3_tts = "";
        string json_value1_time = "";
        string json_value2_time = "";
        string json_value3_time = "";
        string json_value1_user = "";
        string json_value2_user = "";
        string json_value3_user = "";
        for(int i=0; i<24; i++){
            json_value1_uv += Math.Round(value1_uv[i], 0) + ", ";
            json_value2_uv += Math.Round(value2_uv[i], 0) + ", ";
            json_value3_uv += Math.Round(value3_uv[i], 0) + ", ";
            json_value1_tts += Math.Round(value1_tts[i], 0) + ", ";
            json_value2_tts += Math.Round(value2_tts[i], 0) + ", ";
            json_value3_tts += Math.Round(value3_tts[i], 0) + ", ";
            json_value1_time += Math.Round(value1_time[i], 1) + ", ";
            json_value2_time += Math.Round(value2_time[i], 1) + ", ";
            json_value3_time += Math.Round(value3_time[i], 1) + ", ";
            json_value1_user += Math.Round(value1_user[i], 2) + ", ";
            json_value2_user += Math.Round(value2_user[i], 2) + ", ";
            json_value3_user += Math.Round(value3_user[i], 2) + ", ";
        }

        int len_value1_uv = json_value1_uv.Length;
        int len_value2_uv = json_value2_uv.Length;
        int len_value3_uv = json_value3_uv.Length;
        int len_value1_tts = json_value1_tts.Length;
        int len_value2_tts = json_value2_tts.Length;
        int len_value3_tts = json_value3_tts.Length;
        int len_value1_time = json_value1_time.Length;
        int len_value2_time = json_value2_time.Length;
        int len_value3_time = json_value3_time.Length;
        int len_value1_user = json_value1_user.Length;
        int len_value2_user = json_value2_user.Length;
        int len_value3_user = json_value3_user.Length;

        json_value1_user = json_value1_user.Substring(0, len_value1_user - 2);
        json_value2_user = json_value2_user.Substring(0, len_value2_user - 2);
        json_value3_user = json_value3_user.Substring(0, len_value3_user - 2);
        json_value1_time = json_value1_time.Substring(0, len_value1_time - 2);
        json_value2_time = json_value2_time.Substring(0, len_value2_time - 2);
        json_value3_time = json_value3_time.Substring(0, len_value3_time - 2);
        json_value1_tts = json_value1_tts.Substring(0, len_value1_tts - 2);
        json_value2_tts = json_value2_tts.Substring(0, len_value2_tts - 2);
        json_value3_tts = json_value3_tts.Substring(0, len_value3_tts - 2);
        json_value1_uv = json_value1_uv.Substring(0, len_value1_uv - 2);
        json_value2_uv = json_value2_uv.Substring(0, len_value2_uv - 2);
        json_value3_uv = json_value3_uv.Substring(0, len_value3_uv - 2);

        json = "";
        json += "{ \"title\": " + title;   
        json += ", \"info\":  [\"" + page + "\", \"" + index + "\", \"" + info_target + "\", \"" + daytype + "\"]";
        json += ", \"dbmonth\":  [" + month + "]";
        json += ", \"value1_uv\":  [" + json_value1_uv + "]";
        json += ", \"value2_uv\":  [" + json_value2_uv + "]";
        json += ", \"value3_uv\":  [" + json_value3_uv + "]";
        json += ", \"value1_tts\":  [" + json_value1_tts + "]";
        json += ", \"value2_tts\":  [" + json_value2_tts + "]";
        json += ", \"value3_tts\":  [" + json_value3_tts + "]";
        json += ", \"value1_time\":  [" + json_value1_time + "]";
        json += ", \"value2_time\":  [" + json_value2_time + "]";
        json += ", \"value3_time\":  [" + json_value3_time + "]";
        json += ", \"value1_user\":  [" + json_value1_user + "]";
        json += ", \"value2_user\":  [" + json_value2_user + "]";
        json += ", \"value3_user\":  [" + json_value3_user + "]";
        json += " }";        
        
    }
}