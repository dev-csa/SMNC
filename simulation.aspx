<%@ Page Language="C#" AutoEventWireup="true" CodeFile="simulation.aspx.cs" Inherits="simulation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<!-- #include file ="inc_headMeta.htm" -->  
</head>
<body class="amb_layout_common" oncontextmenu='return false'>
<div id="container">
  <!-- #include file ="header.html" -->  
<div >
	<div id="leftbar2" >
	<table class="Ltablesty">
		<tr><td style="padding-top:20px;">분석유형</td></tr>
		<tr>
		<td><select class="Lselect" id="selAnalType">
			<Option value="type1" selected>스크린별</Option>
			<Option value="type2" >디지털 채널별</Option>
			<Option value="type3">TV & Digital별</Option>
		</select></td>
        </tr>    

		<tr><td style="padding-top:20px">분석일자</td></tr>
		<tr>
		<td><select class="Lselect" id="sMonth">
			<option value="201901">2019년 1월</option>
			<option value="201902">2019년 2월</option>
			<option value="201903">2019년 3월</option>
			<option value="201904">2019년 4월</option>
			<option value="201905">2019년 5월</option>
			<option value="201906" selected>2019년 6월</option>
		</select></td>
		</tr>

	    <tr><td style="padding-top:20px">타깃</td></tr>
        <tr><td><a href="#" class="button blue" onClick="layerPopup('optimization_popup.htm' , 'popupId_10_01', '200' , '650');">타깃 설정</a></td></tr>
		<tr><td><span id="selected_target">(개인 / 전체)</span> </td> </tr>
		
		<tr><td style="padding-top:20px">광고비/CPRP&CPM</td></tr>
        <tr id="cpm_popup">
			<td><a href="#" class="button blue" onClick="layerPopup('popup_simul_setting.html' , 'popupId_10_01', '' , '850');">설정하기</a></td>            
		</tr>		
		<tr>
			<td style="padding-top:50px"><span class="leftBtn"> <a class="button blue" id="go" onclick="sml_go();">분석</a> </span></td>
		</tr>
	</table>
	</div>
	<div id="contents" >
		<div id="pageTitbg">
		    <div id="pageTit"><span class="pageTit">3S Planning Effectiveness – Simulation</span></div>
		</div>
		<div id="datawrap">
            <div class="wrap-loading display-none">
                <div><img src="images/loading.gif" /></div>               
            </div> 
            <div id="pageTitGrouping"><span id="selectedType"> 분석 </span></div>
            
            <!-- 분석 결과 구간  -->        
            <div id="opt_graph_dig" >
                <table class="tablestyG1">
                    <tr>
                        <td width="33%">                
                            <div class="graphBox">
                                <div class="graphBox3T">1안</div>
                                <div class="graphBox3G" id="r1_graph1" style="height:250px;"> </div>
                            </div>
                        </td>
                        <td width="33%">                
                            <div class="graphBox">
                                <div class="graphBox3T">2안</div>
                                <div class="graphBox3G" id="r1_graph2" style="height:250px;"> </div>
                            </div>
                        </td>
                        <td width="33%">                
                            <div class="graphBox">
                                <div class="graphBox3T">3안</div>
                                <div class="graphBox3G" id="r1_graph3" style="height:250px;"> </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div> <br/>
            <div id="opt_result_dig">
                <table class="tablesty">
                    <tr>
                      <th width="">&nbsp;</th>
                      <th colspan="4">1안</th>
                      <th colspan="4">2안</th>
                      <th colspan="4">3안</th>
                    </tr>
                    <tr>
                      <td width="" class="tableth2">산출지표</td>
                      <td width="7%" class="tableth2" name="type_name1">YouTube</td>
                      <td width="7%" class="tableth2" name="type_name2">SMR</td>
                      <td width="7%" class="tableth2" name="type_name3">Naver</td>
                      <td width="7%" class="tableth2" >Total</td>
                      <td width="7%" class="tableth2" name="type_name1">YouTube</td>
                      <td width="7%" class="tableth2" name="type_name2">SMR</td>
                      <td width="7%" class="tableth2" name="type_name3">Naver</td>
                      <td width="7%" class="tableth2" >Total</td>
                      <td width="7%" class="tableth2" name="type_name1">YouTube</td>
                      <td width="7%" class="tableth2" name="type_name2">SMR</td>
                      <td width="7%" class="tableth2" name="type_name3">Naver</td>
                      <td width="7%" class="tableth2" >Total</td>
                    </tr>
                    <tr>
                      <td>예산(천원)</td>
                      <td name="cost_a1"></td>
                      <td name="cost_b1"></td>
                      <td name="cost_c1"></td>
                      <td name="cost_total1"></td>
                      <td name="cost_a2"></td>
                      <td name="cost_b2"></td>
                      <td name="cost_c2"></td>
                      <td name="cost_total2"></td>
                      <td name="cost_a3"></td>
                      <td name="cost_b3"></td>
                      <td name="cost_c3"></td>
                      <td name="cost_total3"></td>
                    </tr>
                    <tr>
                      <td>예산비중</td>
                      <td name="cost_share_a1"></td>
                      <td name="cost_share_b1"></td>
                      <td name="cost_share_c1"></td>
                      <td name="cost_share_total1"></td>
                      <td name="cost_share_a2"></td>
                      <td name="cost_share_b2"></td>
                      <td name="cost_share_c2"></td>
                      <td name="cost_share_total2"></td>
                      <td name="cost_share_a3"></td>
                      <td name="cost_share_b3"></td>
                      <td name="cost_share_c3"></td>
                      <td name="cost_share_total3"></td>
                    </tr>
                    <tr>
                      <td>R1+(%)</td>
                      <td name="r1_a1"></td>
                      <td name="r1_b1"></td>
                      <td name="r1_c1"></td>
                      <td name="r1_total1"></td>
                      <td name="r1_a2"></td>
                      <td name="r1_b2"></td>
                      <td name="r1_c2"></td>
                      <td name="r1_total2"></td>
                      <td name="r1_a3"></td>
                      <td name="r1_b3"></td>
                      <td name="r1_c3"></td>
                      <td name="r1_total3"></td>
                    </tr>
                    <tr>
                      <td>R3+(%)</td>
                      <td name="r3_a1"></td>
                      <td name="r3_b1"></td>
                      <td name="r3_c1"></td>
                      <td name="r3_total1"></td>
                      <td name="r3_a2"></td>
                      <td name="r3_b2"></td>
                      <td name="r3_c2"></td>
                      <td name="r3_total2"></td>
                      <td name="r3_a3"></td>
                      <td name="r3_b3"></td>
                      <td name="r3_c3"></td>
                      <td name="r3_total3"></td>
                    </tr>
                    <tr>
                      <td>GRPs</td>
                      <td name="grp_a1"></td>
                      <td name="grp_b1"></td>
                      <td name="grp_c1"></td>
                      <td name="grp_total1"></td>
                      <td name="grp_a2"></td>
                      <td name="grp_b2"></td>
                      <td name="grp_c2"></td>
                      <td name="grp_total2"></td>
                      <td name="grp_a3"></td>
                      <td name="grp_b3"></td>
                      <td name="grp_c3"></td>
                      <td name="grp_total3"></td>
                    </tr>
                    <tr>
                      <td>AF</td>
                      <td name="af_a1"></td>
                      <td name="af_b1"></td>
                      <td name="af_c1"></td>
                      <td name="af_total1"></td>
                      <td name="af_a2"></td>
                      <td name="af_b2"></td>
                      <td name="af_c2"></td>
                      <td name="af_total2"></td>
                      <td name="af_a3"></td>
                      <td name="af_b3"></td>
                      <td name="af_c3"></td>
                      <td name="af_total3"></td>
                    </tr>
                    <tr>
                      <td>CPRP&amp;CPM(원)</td>
                      <td name="cpm_a1"></td>
                      <td name="cpm_b1"></td>
                      <td name="cpm_c1"></td>
                      <td>-</td>
                      <td name="cpm_a2"></td>
                      <td name="cpm_b2"></td>
                      <td name="cpm_c2"></td>
                      <td>-</td>
                      <td name="cpm_a3"></td>
                      <td name="cpm_b3"></td>
                      <td name="cpm_c3"></td>
                      <td>-</td>
                    </tr>
                    <tr>
                      <td height="40" colspan="13" bgcolor="#f9f9f9">Data Source : Nielsen Korean Click Behavior Data (Mobile 이용행태는 Android 이용자에 한하여 조사되었으며, iOS 이용자는 미포함됨)</td>
                    </tr>
                  </table>                      
            </div>            
        </div>
	</div>
</div>

</body>
</html>

<script>
	var bar_toggle = true;
	$("#bar_control").click(function(){
		if (bar_toggle) { 
			$("#leftbar2").hide(0, function(){
      			bar_toggle = false;
				$("#datawrap").attr('id','datawrap2');
				$("#pageTit").attr('id','pageTit2');

    		});
		}else{
			$("#leftbar2").show(0, function(){
      			bar_toggle = true;
				$("#datawrap2").attr('id','datawrap');
				$("#pageTit2").attr('id','pageTit');
    		});
		}		
	});
		
	// 총광고비 안 추가/삭제 
	function addUnit(obj){
		var $this = $(obj);
		var s1 = $('#target01').is(":visible");
		var s2 = $('#target02').is(":visible");

		if(s1 == false && s2 == false){
			$('#target01').show();
		} else if(!s1 == false  && s2 == false){
			$('#target01').show();
			$('#target02').show();
		} else if(!s1 == false  && !s2 == false){
			alert('더 이상 추가 할수 없습니다');
		}
	}
	
	function removeUnit(obj){
        var $this = $(obj);		
        var s1 = $('#target01').is(":visible");
        var s2 = $('#target02').is(":visible");
        
		if(s1 == true && s2 == true){
			$('#target02').hide();
		} else if(!s1 == false  && s2 == false){
			$('#target01').hide();			
		} 
	}

    // 결과 table 초기화 
    function init_table(i){
        $('[name=cost_a'+i+']').text('n/a');
        $('[name=cost_b'+i+']').text('n/a');
        $('[name=cost_c'+i+']').text('n/a');
        $('[name=cost_total'+i+']').text('n/a');

        $('[name=cost_share_a'+i+']').text('n/a');
        $('[name=cost_share_b'+i+']').text('n/a');
        $('[name=cost_share_c'+i+']').text('n/a');
        $('[name=cost_share_total'+i+']').text('n/a');

        $('[name=r1_a'+i+']').text('n/a');
        $('[name=r1_b'+i+']').text('n/a');
        $('[name=r1_c'+i+']').text('n/a');
        $('[name=r1_total'+i+']').text('n/a');

        $('[name=r3_a'+i+']').text('n/a');
        $('[name=r3_b'+i+']').text('n/a');
        $('[name=r3_c'+i+']').text('n/a');
        $('[name=r3_total'+i+']').text('n/a');        

        $('[name=grp_a'+i+']').text('n/a');
        $('[name=grp_b'+i+']').text('n/a');
        $('[name=grp_c'+i+']').text('n/a');
        $('[name=grp_total'+i+']').text('n/a');

        $('[name=af_a'+i+']').text('n/a');
        $('[name=af_b'+i+']').text('n/a');
        $('[name=af_c'+i+']').text('n/a');
        $('[name=af_total'+i+']').text('n/a');

        //$("#r1_graph"+i).empty();
    }    
    // 분석유형 별 label 변경 
    $("#selAnalType").change(function() {
        RefreshAnalType();
    });

    function RefreshAnalType() {
        $('#divAnalType').html("");
        var analType = $("#selAnalType").val();       
        var s = "";
        if (analType == "type1") {
            $('#selectedType').html("스크린별 분석");
            $("#cpm3").hide();
            $('[name=type_name1]').text('TV');
            $('[name=type_name2]').text('DGT');
            $('[name=type_name3]').text('');
            $('[name=type_name3]').css('width','1%');
            
        }
        else if (analType == "type2") {
            $('#selectedType').html("Digital Channel별 분석");
            $("#cpm3").show();
            $('[name=type_name1]').text('YouTube');
            $('[name=type_name2]').text('SMR');
            $('[name=type_name3]').text('Naver');
            $('[name=type_name3]').css('width','7%');
            init_table(1);
            init_table(2);
            init_table(3);
        }
        else if (analType == "type3") {
            $('#selectedType').html("TV & Digital별 분석");
            init_table(1);
            init_table(2);
            init_table(3);
            $("#cpm3").show();            
            $('[name=type_name1]').text('Total TV');
            $('[name=type_name2]').text('YouTube');
            $('[name=type_name3]').text('SMR'); 
            $('[name=type_name3]').css('width','7%');       
        }
    }
    RefreshAnalType();    

    // 1 ~ 9 한글 표시
    var arrNumberWord = new Array("","일","이","삼","사","오","육","칠","팔","구");
    // 10, 100, 100 자리수 한글 표시
    var arrDigitWord = new  Array("","십","백","천");
    // 만단위 한글 표시
    var arrManWord = new  Array("","만","억", "조"); 
    
    function comma_and_hangul(txt_id) {   
        var getid = txt_id.id;        
        getid = getid.substring(0, 8);        
        var id = '#td' + txt_id.id;
        var len = id.length;

        // 몇안 인지 확인 
        var an;  
        an = id.substring(len, len-2);
        an = an.substring(0, 1);

        // 디바이스 종류 확인
        var device;
        device = id.substring(len, len-2);
        device = device.substring(1, 2);           
        var inputId = '#' + txt_id.id;
        var inputVal = txt_id.value;
        
        re = /[~!@\#$%^&*\()\-=+_/`']/gi;
        re2 = /[,]/gi;
        
        if (re.test(inputVal)) { //특수문자가 포함되면 삭제하여 값으로 다시셋팅
           var temp = inputVal.replace(re, "");           
           $(inputId).val(temp.replace(re, ""));
        }

        if (inputVal != null && inputVal != ''){ //천단위 콤마(,) 찍기
            var tmps = inputVal.replace(/[^0-9]/g, '');
            var tmps2 = tmps.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
            $(inputId).val(tmps2);
        }
        //한글 변환
        var inputVal2 = tmps2;

        //콤마제거
        // var id = '#td' + txt_id.id;
        var val = inputVal2.replace(/[^\d]+/g, '');
        if (isNaN(val) || (val == "")) return;
        if (inputId.substring(0, 3) != "#cp"){ 
            val = val * 1000;         
        }
    
        var num_value = String(parseInt(val));
        var num_length = num_value.length;        
        var han_value = "";
        var man_count = 0;      // 만단위 0이 아닌 금액 카운트.

        for (i=0; i<num_value.length; i++)
        {
            // 1단위의 문자로 표시.. (0은 제외)
            var strTextWord = arrNumberWord[num_value.charAt(i)];
            // 0이 아닌경우만, 십/백/천 표시
            if (strTextWord != "") {
                man_count++;
                strTextWord += arrDigitWord[(num_length - (i+1)) % 4];
            }

            // 만단위마다 표시 (0인경우에도 만단위는 표시한다)
            if (man_count != 0 && (num_length - (i+1)) % 4 == 0) {
                man_count = 0;
                strTextWord = strTextWord + arrManWord[(num_length - (i+1)) / 4];
            }
            han_value += strTextWord;
        }

        if(num_value != 0) han_value = han_value + " 원";
        // $(id).html(han_value);  
        if(inputId.substring(0, 9) == "#smlcost1"){
            $("#smlkor1").html(han_value);
        }
        if(inputId.substring(0, 9) == "#smlcost2"){
            $("#smlkor2").html(han_value);
        }
        if(inputId.substring(0, 9) == "#smlcost3"){
            $("#smlkor3").html(han_value);
        }
        if(inputId.substring(0, 9) == "#cprpcpm1"){
            $("#cprpcpmkor1").html(han_value);
        }
        if(inputId.substring(0, 9) == "#cprpcpm2"){
            $("#cprpcpmkor2").html(han_value);
        }
        if(inputId.substring(0, 9) == "#cprpcpm3"){
            $("#cprpcpmkor3").html(han_value);
        }
        cal_grp(an, device, val);
        
    }

    function comma(num) {
        var txt = num.toString();
        var comma_txt = txt.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
        return comma_txt;
    }


    function comma2(id) {
        var num = id.value;
        var id = '#' + id.id;   
        $(id).val(comma(num)); 
    }	
	
// 타깃 설정하기 
    var gender;
    var target;
	var rdo_target = "MF0769";  // 타겟 초기값 
	var t;
	var const_list = [];
    var slope_list = [];
    const_list = [-17.1947752, -6.548870472, -7.962467408];  // 초기값 개인전체 
    slope_list = [0.906703422, 1.176853487, 1.257387184];

    function Getgrp(sTarget){
        var url = "json_getgrp.aspx";
        url += "?v1=" + sTarget;
        url += "&v2=" + $('#selAnalType').val();

        console.log(url);
        $.ajax({
            url : url,
            type : 'GET',
            dataType : 'JSON',
            statusCode : {
            },
            success : function(rcv) {  
                const_list = rcv["const"];
                slope_list = rcv["slope"];     
                console.log(const_list);         
                console.log(slope_list);         
            },
            error: function (jqXHR, status, error) {
                console.log(jqXHR);
                console.log(status);
                console.log(error);
            }
            ,beforeSend:function(){
                $('.wrap-loading').removeClass('display-none');
            }
            ,complete:function(){
                $('.wrap-loading').addClass('display-none');
            }
        });
    }

    function cal_grp(an, device, cost){
        var getconst = 0;
        var getslope = 0;
        var grp = 0;
        var cost = cost;
        var an = an;
        var device = device;
        var analType = $("#selAnalType").val();
        var onlytv;
        // console.log(an +"//"+device+"//"+cost);
        onlytv = device + analType;
        if(device == 1){ // tv
            getconst = const_list[0]
            getslope = slope_list[0]
        }
        else if(device == 2){   // pc
            getconst = const_list[1]
            getslope = slope_list[1]
        }
        else if(device == 3){   // mo
            getconst = const_list[2]
            getslope = slope_list[2]
        }        

        console.log(onlytv);

        if(onlytv == "2type1" || onlytv == "3type2"){
            grp = Math.exp(getconst + getslope * Math.log(cost));
            cprp_cpm = cost/grp*1000;                
        }
        else{
            grp = Math.exp(getconst + getslope * Math.log(cost))*100;
            cprp_cpm = cost/grp;                    
        }
        

        cprp_cpm = cprp_cpm.toFixed(0);
        cprp_cpm = comma(cprp_cpm);
        $('#cprpcpm'+an+device).val(cprp_cpm); 
    }

    function select_target(){
        gender = tab.substr(10, 2); // modal의 tab 변수 사용 
        rdo_target = $(":input:radio[name='Age_"+gender+"']:checked").val();
		target = rdo_target.substr(rdo_target.length - 4, 4);
        if (target == '0769'){
            target2 = "모든 연령";
        }
        else{
            target2 = target;
        }

        if (gender == 01) {
            t = "(전체 " + target2 + ")";
            gender = "MF";
		}
		else if(gender == 02){
            t = "(여자 " + target2 + ")";
            gender = "F";
        }
        else if(gender == 03){
            t = "(남자 " + target2 + ")";
            gender = "M";
        }
        $('#selected_target').html(t);
        $('#cprpcpm11').val('');
        $('#cprpcpm12').val('');
        $('#cprpcpm13').val('');
        $('#cprpcpm21').val('');
        $('#cprpcpm22').val('');
        $('#cprpcpm23').val('');
        $('#cprpcpm31').val('');
        $('#cprpcpm32').val('');
        $('#cprpcpm33').val('');      
        $('#smlcost11').val('');      
        $('#smlcost12').val('');      
        $('#smlcost13').val('');      
        $('#smlcost21').val('');      
        $('#smlcost22').val('');      
        $('#smlcost23').val('');      
        $('#smlcost31').val('');      
        $('#smlcost32').val('');      
        $('#smlcost33').val(''); 
        Getgrp(gender+target);
	}
    
    var smlcost1 = []  //1안 입력 광고비 
    var cpm1 = []  //1안 입력 CPM
    var smlcost2 = []  //2안 입력 광고비 
    var cpm2 = []  //2안 입력 CPM
    var smlcost3 = []  //3안 입력 광고비 
    var cpm3 = []  //3안 입력 CPM

    function set_cost(){
        // 1안
        smlcost1[1] = $('#smlcost11').val();
        cpm1[1] = $('#cprpcpm11').val();
        smlcost1[2] = $('#smlcost12').val();
        cpm1[2] = $('#cprpcpm12').val();
        smlcost1[3] = $('#smlcost13').val();
        cpm1[3] = $('#cprpcpm13').val();

        // 2안
        smlcost2[1] = $('#smlcost21').val();
        cpm2[1] = $('#cprpcpm21').val();
        smlcost2[2] = $('#smlcost22').val();
        cpm2[2] = $('#cprpcpm22').val();
        smlcost2[3] = $('#smlcost23').val();
        cpm2[3] = $('#cprpcpm23').val();

        // 3안 
        smlcost3[1] = $('#smlcost31').val();
        cpm3[1] = $('#cprpcpm31').val();
        smlcost3[2] = $('#smlcost32').val();
        cpm3[2] = $('#cprpcpm32').val();
        smlcost3[3] = $('#smlcost33').val();
        cpm3[3] = $('#cprpcpm33').val();

    }

	function sml_go() {
        var url = "json_simul.aspx";        
        url += "?v1=" + rdo_target;
        url += "&v2=" + $('#selAnalType').val();

        for (i=1; i<=3; i++) {
            if(i == 1){
                input_cost = smlcost1;
                input_cpm = cpm1;
            }
            else if(i == 2){
                input_cost = smlcost2;
                input_cpm = cpm2;
            }
            else if(i == 3){
                input_cost = smlcost3;
                input_cpm = cpm3;
            }
            $('#sml_result'+i).html("");
            $('#sml_excel'+i).html("");

            cost1 = input_cost[1];
            cost2 = input_cost[2];
            cost3 = input_cost[3];
            cpmcprp1 = input_cpm[1];
            cpmcprp2 = input_cpm[2];
            cpmcprp3 = input_cpm[3];

            cost1 = cost1.replace(/[^0-9]/g, '');
            cost2 = cost2.replace(/[^0-9]/g, '');
            cost3 = cost3.replace(/[^0-9]/g, '');
            cpmcprp1 = cpmcprp1.replace(/[^0-9]/g, '');
            cpmcprp2 = cpmcprp2.replace(/[^0-9]/g, '');
            cpmcprp3 = cpmcprp3.replace(/[^0-9]/g, '');

            var url2 = url;
            url2 += "&v3=" + cost1 + "&v4=" + cost2 + "&v5=" + cost3 + "&v6=" + cpmcprp1 + "&v7=" + cpmcprp2 + "&v8=" + cpmcprp3;
            url2 += "&v9="+ i;
            console.log(url2);
            $.ajax({
                url : url2,
                type : 'GET',
                dataType : 'JSON',
                statusCode : {
                },
                success : function(rcv) {
                    data_result(rcv, 'sim');
                    // data_excel(rcv, 'sim');
                },
            });
        }
    }

    var td_title = [NaN];
    var r1_tv_data =[NaN];
    var r1_pc_data =[NaN];
    var r1_mo_data =[NaN];
	var r1_total_data =[NaN];

    function data_result(rcv){
        window.console && console.log(rcv);
        var no          = rcv["no"];
        var reach1_list = rcv["reach1"];
        var reach3_list = rcv["reach3"];
        var grp_list    = rcv["grp"];
        var cost_list   = rcv["cost"];
        var share_list  = rcv["share"];
        var af_list     = rcv["af"];
        var cpm_list    = rcv["cpm"]
        td_title        = rcv["title"];

        // var time1 = new Date().getTime();
        // ### 스크린별 최적값 검색 
              

        // 데이터테이블 화면에 나타내기  
        $('[name=cost_a'+no+']').text(comma(cost_list[0].toFixed(0)));
        $('[name=cost_b'+no+']').text(comma(cost_list[1].toFixed(0)));
        $('[name=cost_c'+no+']').text(comma(cost_list[2].toFixed(0)));
        $('[name=cost_total'+no+']').text(comma(cost_list[3].toFixed(0)));

        $('[name=cost_share_a'+no+']').text((share_list[0]).toFixed(1) + ' %');
        $('[name=cost_share_b'+no+']').text((share_list[1]).toFixed(1) + ' %');
        $('[name=cost_share_c'+no+']').text((share_list[2]).toFixed(1) + ' %');
        $('[name=cost_share_total'+no+']').text('100 %');

        $('[name=r1_a'+no+']').text((reach1_list[0]*100).toFixed(1) + ' %');
        $('[name=r1_b'+no+']').text((reach1_list[1]*100).toFixed(1) + ' %');
        $('[name=r1_c'+no+']').text((reach1_list[2]*100).toFixed(1) + ' %');
        $('[name=r1_total'+no+']').text((reach1_list[3]*100).toFixed(1) + ' %');

        $('[name=r3_a'+no+']').text((reach3_list[0]*100).toFixed(1) + ' %');
        $('[name=r3_b'+no+']').text((reach3_list[1]*100).toFixed(1) + ' %');
        $('[name=r3_c'+no+']').text((reach3_list[2]*100).toFixed(1) + ' %');
        $('[name=r3_total'+no+']').text((reach3_list[3]*100).toFixed(1) + ' %');        

        $('[name=grp_a'+no+']').text(grp_list[0].toFixed(1));
        $('[name=grp_b'+no+']').text(grp_list[1].toFixed(1));
        $('[name=grp_c'+no+']').text(grp_list[2].toFixed(1));
        $('[name=grp_total'+no+']').text(grp_list[3].toFixed(1));

        $('[name=af_a'+no+']').text(af_list[0].toFixed(1));
        $('[name=af_b'+no+']').text(af_list[1].toFixed(1));
        $('[name=af_c'+no+']').text(af_list[2].toFixed(1));
        $('[name=af_total'+no+']').text(af_list[3].toFixed(1));

        $('[name=cpm_a'+no+']').text(comma(cpm_list[0].toFixed(0)));
        $('[name=cpm_b'+no+']').text(comma(cpm_list[1].toFixed(0)));
        $('[name=cpm_c'+no+']').text(comma(cpm_list[2].toFixed(0)));

        r1_tv_data[0] = (reach1_list[0]*100).toFixed(1);
        r1_pc_data[0] = (reach1_list[1]*100).toFixed(1);
        r1_mo_data[0] = (reach1_list[2]*100).toFixed(1);
        r1_total_data[0] = (reach1_list[3]*100).toFixed(1);

        // 그래프 그리기 
        if (analType == 'type1'){
            drawGraph1(no); 
            $('[name=cost_c'+no+']').text(' ');
            // $('[name=type_name3]').css('width','1%');
            $('[name=cost_share_c'+no+']').text(' ');
            $('[name=r1_c'+no+']').text(' ');
            $('[name=r3_c'+no+']').text(' ');
            $('[name=grp_c'+no+']').text(' ');
            $('[name=af_c'+no+']').text(' ');
            $('[name=cpm_c'+no+']').text(' ');
        }
        else{
            drawGraph2(no); 
        }

        r1_tv_data =[];
        r1_pc_data =[];
        r1_mo_data =[];
        r1_total_data =[];
        td_title = [];
	}

//분석항목 2개짜리 그래프 
function drawGraph1(no){
        var dom = document.getElementById("r1_graph"+no);
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        app.title = 'Line and bar';
        var colors = ['#00aeef', '#8dc63f', '#999b9e'];
        option = {
            textStyle:{
				color: '#000000'
            },
            color: colors,
            tooltip: {
                trigger: 'axis',                
                axisPointer: {
                    type: 'cross',
                    crossStyle: {
                        color: '#999'
                    }
                }
            },
            legend: {
                y : 'bottom',
                data: td_title
            },
            xAxis: [
                {
                    type: 'category',
                    data:[''],
                    axisPointer: {
                        type: 'shadow'
                    },
                    axisLine: {
                        lineStyle: {
                        color: colors[0]
                        }
                    },  
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: 'Reach 1+    ',
                    //interval: 20,
                    axisLabel: {
                        formatter: '{value} %'
                    },
                    axisLine: {
                        lineStyle: {
                        color: colors[1]
                        }
                    },
                },
                {
                    axisLine: {
                        lineStyle: {
                        color: colors[2]
                        }
                    }
                },               
            ],
            series: [
                {
                    name: td_title[0],
                    type:'bar',
                    barWidth: '13%',
                    label: {
                        normal: {
                            show: true,
                            position: 'top',
                        }
                    },
                    data: r1_tv_data
                },
                {
                    name: td_title[1],
                    type:'bar',
                    barWidth: '13%',
                    label: {
                        normal: {
                            show: true,
                            position: 'top'
                        }
                    },
                    data: r1_pc_data
                },                
                {
                    name:td_title[2],
                    type:'bar',
                    barWidth: '13%',
                    label: {
                        normal: {
                            show: true,
                            position: 'top'
                        }
                    },
                    data: r1_total_data
                }
            ]
        };
        ;
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
        setTimeout(function () {
            window.onresize = function () {
                myChart.resize();
            }
        }, 200)
    }

    function drawGraph2(no){
        var dom = document.getElementById("r1_graph"+no);
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        app.title = 'Line and bar';
        var colors = ['#00aeef', '#8dc63f', '#ffb100', '#999b9e'];
        option = {
            textStyle:{
				color: '#000000'
            },
            color: colors,
            tooltip: {
                trigger: 'axis',                
                axisPointer: {
                    type: 'cross',
                    crossStyle: {
                        color: '#999'
                    }
                }
            },
            legend: {
                y : 'bottom',
                data: td_title
            },
            xAxis: [
                {
                    type: 'category',
                    data:[''],
                    axisPointer: {
                        type: 'shadow'
                    },
                    axisLine: {
                        lineStyle: {
                        color: colors[0]
                        }
                    },  
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: 'Reach 1+    ',
                    //interval: 20,
                    axisLabel: {
                        formatter: '{value} %'
                    },
                    axisLine: {
                        lineStyle: {
                        color: colors[1]
                        }
                    },
                },
                {
                    axisLine: {
                        lineStyle: {
                        color: colors[2]
                        }
                    }
                },
                {
                    axisLine: {
                        lineStyle: {
                        color: colors[3]
                        }
                    }
                }
            ],
            series: [
                {
                    name: td_title[0],
                    type:'bar',
                    barWidth: '13%',
                    label: {
                        normal: {
                            show: true,
                            position: 'top',
                        }
                    },
                    data: r1_tv_data
                },
                {
                    name: td_title[1],
                    type:'bar',
                    barWidth: '13%',
                    label: {
                        normal: {
                            show: true,
                            position: 'top'
                        }
                    },
                    data: r1_pc_data
                },
                {
                    name: td_title[2],
                    type:'bar',
                    barWidth: '13%',
                    label: {
                        normal: {
                            show: true,
                            position: 'top'
                        }
                    },
                    data: r1_mo_data
                },
                {
                    name:td_title[3],
                    type:'bar',
                    barWidth: '13%',
                    label: {
                        normal: {
                            show: true,
                            position: 'top'
                        }
                    },
                    data: r1_total_data
                }
            ]
        };
        ;
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
        setTimeout(function () {
            window.onresize = function () {
                myChart.resize();
            }
        }, 200)
    }   
    
    
    

</script>