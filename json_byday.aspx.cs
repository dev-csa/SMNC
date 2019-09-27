using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class json_byday : System.Web.UI.Page  // 이용행태 - 주간별 
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
    int a = 0;        
    int row_num = 0; 

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
    
    public double[] dbmonth = new double[50];
    public double[] day_month = new double[50];
    public int age_num;         

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
        int month_len = month.Length;
        one_month = month.Substring(month_len - 8, 8);

                
        if(page == "byday"){
            table = "INNO_byDaytype";
        }
        else if(page == "byday_video"){
            table = "INNO_byDaytype_video";
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
        // 총 이용자수(UV) --------------------------------------------------------------------
        sqlComm1  = "SELECT MONTH, SUM(UV), "; 
        sqlComm1 += "(SELECT SUM(UV) FROM " + table + " b WHERE DEVICE='" + type[1] + sqlWhere + " AND a.MONTH = b.MONTH GROUP BY MONTH), ";
        sqlComm1 += "(SELECT SUM(UV) FROM " + table + " c WHERE DEVICE='" + type[2] + sqlWhere + " AND a.MONTH = c.MONTH GROUP BY MONTH) ";
        sqlComm1 += "FROM " + table + " a WHERE DEVICE='" + type[0] + sqlWhere + " GROUP BY MONTH ";    
        // Response.Write(sqlComm1+"@@");   
        

        SqlCommand cmd1 = new SqlCommand(sqlComm1, cn);
        cn.Open();
        SqlDataReader dReader1 = cmd1.ExecuteReader();
        int a = 0;        
        while(dReader1.Read()) {
            double getdata1 = dReader1.GetDouble(0);    // 분석일자
            double getdata2 = dReader1.GetDouble(1);    // 첫번째 미디어 항목(tv /yt /지상파)
            double getdata3 = dReader1.GetDouble(2);    // 두번째 미디어 항목(pc /sm /케이블&종편)
            double getdata4 = dReader1.GetDouble(3);    // 세번째 미디어 항목(mo /nv /yt)
            dbmonth[a] = getdata1;
            value1_uv[a] = getdata2 / 1000 ;
            value2_uv[a] = getdata3 / 1000;
            value3_uv[a] = getdata4 / 1000;
            a = a+1;
        }
        
        dReader1.Close();
        cn.Close();                                                                                             

    // 총 이용시간 (TTS) -----------------------------------------------------------------
        sqlComm2  = "SELECT MONTH, SUM(TTS), "; 
        sqlComm2 += "(SELECT SUM(TTS) FROM " + table + " b WHERE DEVICE='" + type[1] + sqlWhere + " AND a.MONTH = b.MONTH GROUP BY MONTH), ";
        sqlComm2 += "(SELECT SUM(TTS) FROM " + table + " c WHERE DEVICE='" + type[2] + sqlWhere + " AND a.MONTH = c.MONTH GROUP BY MONTH) ";
        sqlComm2 += "FROM " + table + " a WHERE DEVICE='" + type[0] + sqlWhere + " GROUP BY MONTH ";    
        // Response.Write(sqlComm1+"@@");   
        SqlCommand cmd2 = new SqlCommand(sqlComm2, cn);
        cn.Open();
        SqlDataReader dReader2 = cmd2.ExecuteReader();
        a = 0;        
        while(dReader2.Read()) {
            double getdata1 = dReader2.GetDouble(0);    // 분석일자
            double getdata2 = dReader2.GetDouble(1);    // 첫번째 미디어 항목(tv /yt /지상파)
            double getdata3 = dReader2.GetDouble(2);    // 두번째 미디어 항목(pc /sm /케이블&종편)
            double getdata4 = dReader2.GetDouble(3);    // 세번째 미디어 항목(mo /nv /yt)
            //dbmonth[a] = getdata1;
            value1_tts[a] = getdata2 / 1000000;
            value2_tts[a] = getdata3 / 1000000;
            value3_tts[a] = getdata4 / 1000000;
            a = a+1;
        }
        dReader2.Close();
        cn.Close();         

        // 일평균이용시간(AVG_DAILY_ATV) ----------------------------------------------------  
        if(age_num < 8){    // 타겟 하나일때
            sqlComm3  = "SELECT MONTH, SUM(AVG_DAILY_ATV), "; 
            sqlComm3 += "(SELECT SUM(AVG_DAILY_ATV) FROM " + table + " b WHERE DEVICE='" + type[1] + sqlWhere + " AND a.MONTH = b.MONTH GROUP BY MONTH), ";
            sqlComm3 += "(SELECT SUM(AVG_DAILY_ATV) FROM " + table + " c WHERE DEVICE='" + type[2] + sqlWhere + " AND a.MONTH = c.MONTH GROUP BY MONTH) ";
            sqlComm3 += "FROM " + table + " a WHERE DEVICE='" + type[0] + sqlWhere + " GROUP BY MONTH ";

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
        }
        else{  // 타겟 여러개일때 
            // Univers 합계 
            sqlComm1  = "SELECT MONTH, SUM(UNIVERSE) tv_uv, "; 
            sqlComm1 += "(SELECT SUM(UNIVERSE) pc_uv FROM " + table + " b WHERE DEVICE='" + type[1] + sqlWhere + " AND a.MONTH = b.MONTH GROUP BY MONTH), ";
            sqlComm1 += "(SELECT SUM(UNIVERSE) mo_uv FROM " + table + " c WHERE DEVICE='" + type[2] + sqlWhere + " AND a.MONTH = c.MONTH GROUP BY MONTH) ";
            sqlComm1 += "FROM " + table + " a WHERE DEVICE='" + type[0] + sqlWhere + " GROUP BY MONTH";
            // TTS 합계
            sqlComm2  = "SELECT MONTH, SUM(TTS) tv_tts, "; 
            sqlComm2 += "(SELECT SUM(TTS) pc_tts FROM " + table + " b WHERE DEVICE='" + type[1] + sqlWhere + " AND a.MONTH = b.MONTH GROUP BY MONTH), ";
            sqlComm2 += "(SELECT SUM(TTS) mo_tts FROM " + table + " c WHERE DEVICE='" + type[2] + sqlWhere + " AND a.MONTH = c.MONTH GROUP BY MONTH) ";
            sqlComm2 += "FROM " + table + " a WHERE DEVICE='" + type[0] + sqlWhere + " GROUP BY MONTH";
            //월별 일자 수 
            sqlComm3 = "SELECT MONTH, DAY_MONTH FROM " + table + " WHERE DEVICE='" + type[0] + sqlWhere + " GROUP BY MONTH, DAY_MONTH"; 
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
            }   
        }         
        
        
        // 일평균이용률(AVG_USER) -------------------------------------------------------
        if(age_num < 8){    // 타겟 하나일때
            sqlComm4  = "SELECT MONTH, SUM(AVG_USER), "; 
            sqlComm4 += "(SELECT SUM(AVG_USER) FROM " + table + " b WHERE DEVICE='" + type[1] + sqlWhere + " AND a.MONTH = b.MONTH GROUP BY MONTH), ";
            sqlComm4 += "(SELECT SUM(AVG_USER) FROM " + table + " c WHERE DEVICE='" + type[2] + sqlWhere + " AND a.MONTH = c.MONTH GROUP BY MONTH) ";
            sqlComm4 += "FROM " + table + " a WHERE DEVICE='" + type[0] + sqlWhere + " GROUP BY MONTH ";
            // Response.Write(sqlComm1);
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
            sqlComm1  = "SELECT MONTH, SUM(UNIVERSE) tv_uv, "; 
            sqlComm1 += "(SELECT SUM(UNIVERSE) FROM " + table + " b WHERE DEVICE='" + type[1] + sqlWhere + " AND a.MONTH = b.MONTH GROUP BY MONTH) as pc_uv, ";
            sqlComm1 += "(SELECT SUM(UNIVERSE) FROM " + table + " c WHERE DEVICE='" + type[2] + sqlWhere + " AND a.MONTH = c.MONTH GROUP BY MONTH) as mo_uv ";
            sqlComm1 += "FROM " + table + " a WHERE DEVICE='" + type[0] + sqlWhere + " GROUP BY MONTH";
            // AVG_Daily_UV 합계
            sqlComm2  = "SELECT MONTH, SUM(AVG_DAILY_UV) tv_avg, "; 
            sqlComm2 += "(SELECT SUM(AVG_DAILY_UV) FROM " + table + " b WHERE DEVICE='" + type[1] + sqlWhere + " AND a.MONTH = b.MONTH GROUP BY MONTH) as pc_avg, ";
            sqlComm2 += "(SELECT SUM(AVG_DAILY_UV) FROM " + table + " c WHERE DEVICE='" + type[2] + sqlWhere + " AND a.MONTH = c.MONTH GROUP BY MONTH) as mo_avg ";
            sqlComm2 += "FROM " + table + " a WHERE DEVICE='" + type[0] + sqlWhere + " GROUP BY MONTH";

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

        
        int title_len = title.Length;
        json = "";
        json += "{ \"title\": " + title;   
        json += ", \"info\":  [\"" + page + "\", \"" + index + "\", \"" + info_target + "\", \"" + daytype + "\"]";
        json += ", \"dbmonth\":  [" + dbmonth[0] + ", " + dbmonth[1] + ", " + dbmonth[2] + ", " + dbmonth[3] + ", " + dbmonth[4] + ", " + dbmonth[5] + "]";
        json += ", \"value1_uv\":  [" + Math.Round(value1_uv[0], 0) + ", " + Math.Round(value1_uv[1], 0) + ", " + Math.Round(value1_uv[2], 0) + ", " + Math.Round(value1_uv[3], 0) + ", " + Math.Round(value1_uv[4], 0) + ", " + Math.Round(value1_uv[5], 0) + "]";
        json += ", \"value2_uv\":  [" + Math.Round(value2_uv[0], 0) + ", " + Math.Round(value2_uv[1], 0) + ", " + Math.Round(value2_uv[2], 0) + ", " + Math.Round(value2_uv[3], 0) + ", " + Math.Round(value2_uv[4], 0) + ", " + Math.Round(value2_uv[5], 0) + "]";
        json += ", \"value3_uv\":  [" + Math.Round(value3_uv[0], 0) + ", " + Math.Round(value3_uv[1], 0) + ", " + Math.Round(value3_uv[2], 0) + ", " + Math.Round(value3_uv[3], 0) + ", " + Math.Round(value3_uv[4], 0) + ", " + Math.Round(value3_uv[5], 0) + "]";
        json += ", \"value1_tts\":  [" + Math.Round(value1_tts[0], 0) + ", " + Math.Round(value1_tts[1], 0) + ", " + Math.Round(value1_tts[2], 0) + ", " + Math.Round(value1_tts[3], 0) + ", " + Math.Round(value1_tts[4], 0) + ", " + Math.Round(value1_tts[5], 0) + "]";
        json += ", \"value2_tts\":  [" + Math.Round(value2_tts[0], 0) + ", " + Math.Round(value2_tts[1], 0) + ", " + Math.Round(value2_tts[2], 0) + ", " + Math.Round(value2_tts[3], 0) + ", " + Math.Round(value2_tts[4], 0) + ", " + Math.Round(value2_tts[5], 0) + "]";
        json += ", \"value3_tts\":  [" + Math.Round(value3_tts[0], 0) + ", " + Math.Round(value3_tts[1], 0) + ", " + Math.Round(value3_tts[2], 0) + ", " + Math.Round(value3_tts[3], 0) + ", " + Math.Round(value3_tts[4], 0) + ", " + Math.Round(value3_tts[5], 0) + "]";
		json += ", \"value1_time\":  [" + Math.Round(value1_time[0], 0) + ", " + Math.Round(value1_time[1], 0) + ", " + Math.Round(value1_time[2], 0) + ", " + Math.Round(value1_time[3], 0) + ", " + Math.Round(value1_time[4], 0) + ", " + Math.Round(value1_time[5], 0) + "]";
        json += ", \"value2_time\":  [" + Math.Round(value2_time[0], 0) + ", " + Math.Round(value2_time[1], 0) + ", " + Math.Round(value2_time[2], 0) + ", " + Math.Round(value2_time[3], 0) + ", " + Math.Round(value2_time[4], 0) + ", " + Math.Round(value2_time[5], 0) + "]";
        json += ", \"value3_time\":  [" + Math.Round(value3_time[0], 0) + ", " + Math.Round(value3_time[1], 0) + ", " + Math.Round(value3_time[2], 0) + ", " + Math.Round(value3_time[3], 0) + ", " + Math.Round(value3_time[4], 0) + ", " + Math.Round(value3_time[5], 0) + "]";
		json += ", \"value1_user\":  [" + Math.Round(value1_user[0], 2) + ", " + Math.Round(value1_user[1], 2) + ", " + Math.Round(value1_user[2], 2) + ", " + Math.Round(value1_user[3], 2) + ", " + Math.Round(value1_user[4], 2) + ", " + Math.Round(value1_user[5], 2) + "]";
        json += ", \"value2_user\":  [" + Math.Round(value2_user[0], 2) + ", " + Math.Round(value2_user[1], 2) + ", " + Math.Round(value2_user[2], 2) + ", " + Math.Round(value2_user[3], 2) + ", " + Math.Round(value2_user[4], 2) + ", " + Math.Round(value2_user[5], 2) + "]";
        json += ", \"value3_user\":  [" + Math.Round(value3_user[0], 2) + ", " + Math.Round(value3_user[1], 2) + ", " + Math.Round(value3_user[2], 2) + ", " + Math.Round(value3_user[3], 2) + ", " + Math.Round(value3_user[4], 2) + ", " + Math.Round(value3_user[5], 2) + "]";
        json += " }";      
        
    }    
}