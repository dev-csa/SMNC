<%@ Page Language="C#" AutoEventWireup="true" CodeFile="optimization.aspx.cs" Inherits="optimization" %>

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
		
		<tr><td style="padding-top:20px;">총 광고비</td></tr>
        <tr>
            <td class="amb_layout_common noraml">
                <ul class="cost">
                    <li>1 <input type="text" class="Linput" id="optcost1" onkeyup="comma_and_hangul(this);"/> 천원 
                        <a href="#" class="button grayS" onClick="addUnit(this);">+</a>
                    </li>
                </ul>
            </td>
        </tr>
        <tr class="unit" id="target01" style="display:none;">
            <td class="amb_layout_common noraml">
                <ul class="cost">
                    <li>2 <input type="text" class="Linput" id="optcost2" onkeyup="comma_and_hangul(this);"/> 천원
                        <a href="#" class="button grayS"  id="minus2" onClick="removeUnit(this);">-</a> 
                    </li>
                </ul>
            </td>
        </tr>
        <tr class="unit" id="target02" style="display:none;">
            <td class="amb_layout_common noraml">
                <ul class="cost">
                    <li>2 <input type="text" class="Linput" id="optcost3" onkeyup="comma_and_hangul(this);"/> 천원
                        <a href="#" class="button grayS"  id="minus3" onClick="removeUnit(this);">-</a> 
                    </li>
                </ul>
            </td>
        </tr>
		<tr><td><spna class="blueL" id="optkor"></spna></td></tr>
		
        <tr><td style="padding-top:20px;"> CPM </td></tr>
        <tr><td>
            <ul class="cost">
                <li><input type="text" class="Linput" id="cprpcpm1" onkeyup="comma_and_hangul(this);"/> (<span name="type_name1"></span>)원</li>
                <li><input type="text" class="Linput" id="cprpcpm2" onkeyup="comma_and_hangul(this);"/> (<span name="type_name2"></span>)원</li>
                <li id="cpm3"><input type="text" class="Linput" id="cprpcpm3" onkeyup="comma_and_hangul(this);"/> (<span name="type_name3"></span>)원</li>
                <spna class="blueL" id="cprpcpmkor"></spna>
            </ul>
        </td></tr>
        <!-- <tr id="cpm_popup">
			<td style="padding-top:20px;"><a href="#" class="button blue" onClick="layerPopup('popup_DGT-CPRP_CPM.html' , 'popupId_10_01', '' , '400');">DGT 상세설정</a></td>            
		</tr>		 -->
		<tr>
			<td style="padding-top:20px"><span class="leftBtn"> <a class="button blue" id="go" onclick="opt_go();">분석</a> </span></td>
		</tr>
	</table>
	</div>
	<div id="contents" >
		<div id="pageTitbg">
		    <div id="pageTit"><span class="pageTit">3S Planning Effectiveness – Budget Optimization </span></div>
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
                      <td width="15%" class="tableth2">산출지표</td>
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
        $this.parents('.unit').hide();        
        var s1 = $('#target01').is(":visible");
        var s2 = $('#target02').is(":visible");        
        if (s1 == false){ $('#optcost2').val(''); }
        if (s2 == false){ $('#optcost3').val(''); }
	}

    // 결과 table 초기화 
    function init_table(i){
        // $('[name=cost_a'+i+']').text('n/a');
        // $('[name=cost_b'+i+']').text('n/a');
        // $('[name=cost_c'+i+']').text('n/a');
        // $('[name=cost_total'+i+']').text('n/a');

        // $('[name=cost_share_a'+i+']').text('n/a');
        // $('[name=cost_share_b'+i+']').text('n/a');
        // $('[name=cost_share_c'+i+']').text('n/a');
        // $('[name=cost_share_total'+i+']').text('n/a');

        // $('[name=r1_a'+i+']').text('n/a');
        // $('[name=r1_b'+i+']').text('n/a');
        // $('[name=r1_c'+i+']').text('n/a');
        // $('[name=r1_total'+i+']').text('n/a');

        // $('[name=r3_a'+i+']').text('n/a');
        // $('[name=r3_b'+i+']').text('n/a');
        // $('[name=r3_c'+i+']').text('n/a');
        // $('[name=r3_total'+i+']').text('n/a');        

        // $('[name=grp_a'+i+']').text('n/a');
        // $('[name=grp_b'+i+']').text('n/a');
        // $('[name=grp_c'+i+']').text('n/a');
        // $('[name=grp_total'+i+']').text('n/a');

        // $('[name=af_a'+i+']').text('n/a');
        // $('[name=af_b'+i+']').text('n/a');
        // $('[name=af_c'+i+']').text('n/a');
        // $('[name=af_total'+i+']').text('n/a');
        $('[name=cost_a'+i+']').text(' ');
        $('[name=cost_b'+i+']').text(' ');
        $('[name=cost_c'+i+']').text(' ');
        $('[name=cost_total'+i+']').text(' ');

        $('[name=cost_share_a'+i+']').text(' ');
        $('[name=cost_share_b'+i+']').text(' ');
        $('[name=cost_share_c'+i+']').text(' ');
        $('[name=cost_share_total'+i+']').text(' ');

        $('[name=r1_a'+i+']').text(' ');
        $('[name=r1_b'+i+']').text(' ');
        $('[name=r1_c'+i+']').text(' ');
        $('[name=r1_total'+i+']').text(' ');

        $('[name=r3_a'+i+']').text(' ');
        $('[name=r3_b'+i+']').text(' ');
        $('[name=r3_c'+i+']').text(' ');
        $('[name=r3_total'+i+']').text(' ');        

        $('[name=grp_a'+i+']').text(' ');
        $('[name=grp_b'+i+']').text(' ');
        $('[name=grp_c'+i+']').text(' ');
        $('[name=grp_total'+i+']').text(' ');

        $('[name=af_a'+i+']').text(' ');
        $('[name=af_b'+i+']').text(' ');
        $('[name=af_c'+i+']').text(' ');
        $('[name=af_total'+i+']').text(' ');        

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
            $("#cpm_popup").show();
            $('[name=type_name1]').text('TV');
            $('[name=type_name2]').text('DGT');
            $('[name=type_name3]').text('');
            $('[name=type_name3]').css('width','1%');
            
        }
        else if (analType == "type2") {
            $('#selectedType').html("Digital Channel별 분석");
            $("#cpm3").show();
            $("#cpm_popup").hide();
            $('[name=type_name1]').text('S.JSP');
            $('[name=type_name2]').text('S.CATV');
            $('[name=type_name3]').text('DGT');
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
            $("#cpm_popup").hide();

            $('[name=type_name1]').text('S.CATV');
            $('[name=type_name2]').text('M.CATV');
            $('[name=type_name3]').text('K.CATV');
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
        var inputId = '#' + txt_id.id;
        var inputVal = txt_id.value;
        var len = inputId.length;
        
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
        if(inputId.substring(0, 4) == "#opt"){
            $("#optkor").html(han_value);
        }
        if(inputId.substring(0, 4) == "#cpr"){
            $("#cprpcpmkor").html(han_value);
        }
        
    }

    function comma(num) {
        var txt = num.toString();
        var comma_txt = txt.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
        return comma_txt;
    }
	
	
// 타깃 설정하기 
var gender;
    var target;
	var rdo_target = "MF0769";  // 타겟 초기값 
	var t;
	
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
	}


	function opt_go() {		
        if (rdo_target == "") {
            rdo_target = "MF0769";
        }
        exc_html = "";
        opt_html = "";
        var url = "json_optimization.aspx";
		var analType = $("#selAnalType").val();  //분석유형         
        url += "?v1=" + analType;    
        url += "&v2=" + rdo_target;
        for(i=1; i<=3; i++){
            // $('#opt_result'+i).html("");
            var cost = $('#optcost'+i).val();
            var i_cost = cost.replace(/[^\d]+/g, '') * 1000;   //총광고비 입력값
            if(cost != ""){        
                if(i_cost < 50000000){
                    alert(i+'. 총광고비 입력 오류: \n총광고비는 최소 5천만원 부터 분석 가능합니다!');
                }
                else if(i_cost > 10000000000){
                    alert(i+'. 총광고비 입력 오류: \n총광고비는 최대 100억원 까지 분석 가능합니다!');
                }
                else{
                    var url2 = url + "&v3=" + i_cost + "&v4=" + i + "&fn=optim";
                    console.log(url2);
                    $.ajax({
                        url : url2,
                        type : 'GET',
                        dataType : 'JSON',
                        statusCode : {
                        },
                        success : function(rcv) {
                            data_result(rcv);
                        }
                        ,beforeSend:function(){
                            $('.wrap-loading').removeClass('display-none');
                        }
                        ,complete:function(){
                            $('.wrap-loading').addClass('display-none');
                        }
                    });
                }
            }
            else{
                init_table(i);
            }                         
        }
	}

	var td_title = [NaN];
    var r1_tv_data =[NaN];
    var r1_pc_data =[NaN];
    var r1_mo_data =[NaN];
	var r1_total_data =[NaN];
	
    function data_result(rcv){
        window.console && console.log(rcv);
        var no           = rcv["no"];
        var reach1_const = rcv["r1_const"];
        var reach1_slope = rcv["r1_slope"];
        var reach3_const = rcv["r3_const"];
        var reach3_slope = rcv["r3_slope"];
        var grp_const    = rcv["grp_const"];
        var grp_slope    = rcv["grp_slope"];
        var reach1_min   = rcv["r1_min"];
        var reach3_min   = rcv["r3_min"];
        var ratio        = rcv["ratio"];
        var population   = rcv["population"];
        td_title         = rcv["title"];

        var GRP             = [0.0, 0.0, 0.0, 0.0];
        var IMP             = [0.0, 0.0, 0.0, 0.0];
        var R1              = [0.0, 0.0, 0.0, 0.0];
        var R3              = [0.0, 0.0, 0.0, 0.0];
        var COST            = [0, 0, 0, 0];
        var CPMCPRP         = [0, 0, 0, 0];
        var optim_GRP       = [0.0, 0.0, 0.0, 0.0];
        var optim_R1        = [0.0, 0.0, 0.0, 0.0];
        var optim_R3        = [0.0, 0.0, 0.0, 0.0];
        var optim_COST      = [0, 0, 0, 0];
        var optim_CPMCPRP   = [0, 0, 0, 0];
        var optim_share     = [0, 0, 0, 0];
        var optim_af        = [0, 0, 0, 0];
        var loop = 0;
        var i_cpmcprp = [];
        var analType = $("#selAnalType").val();  //분석유형   
        cost = $('#optcost'+no).val();
        i_cost = cost.replace(/[^\d]+/g, '');   //총광고비 입력값
        
        step = 0
        if ((i_cost >= 1) && (i_cost < 100000))        {step = 1000}  // 1억이하: 백만원 단위로 광고비 최적가 탐색
        else if ((i_cost >= 100000) && (i_cost < 1000000)) {step = 2000}  // 1억~10억: 2백만원 단위
        else if (i_cost >= 1000000)                        {step = 5000}  // 10억이상: 5백만원 단위
        else if (i_cost >= 5000000)                        {step = 10000}  // 50억이상: 1천만원 단위

        i_cpmcprp[0] = $('#cprpcpm1').val();
        i_cpmcprp[0] = i_cpmcprp[0].replace(/[^\d]+/g, ''); 
        i_cpmcprp[1] = $('#cprpcpm2').val();
        i_cpmcprp[1] = i_cpmcprp[1].replace(/[^\d]+/g, '');
        i_cpmcprp[2] = $('#cprpcpm3').val();
        i_cpmcprp[2] = i_cpmcprp[2].replace(/[^\d]+/g, '');
        

        // var time1 = new Date().getTime();
        // ### 스크린별 최적값 검색 
        if (analType == 'type1' && i_cost >= 50000) {
            //i: tv광고비, j: pc광고비, k:mo광고비
            console.log(i_cost);
            for (i=10000; i<=i_cost; i+=step) {
                for (j=10000; j<=i_cost; j+=step) {
                    // tv, pc mobile 배분값
                    if ((i+j) != i_cost) {continue}
                    loop += 1;

                    // 배열설명>> [0]:tv, [1]:pc, [2]:mo, [3]:total
                    COST[0] = i;
                    COST[1] = j;
                    
                    for(a=0; a<= 1; a++){
                        // GRP, Reach1, Reach3 계산
                        // 사용자가 CPM/CPRP 입력 했을 경우 
                        if(i_cpmcprp[a] != ""){
                            CPMCPRP[a] = i_cpmcprp[a];
                            if(td_title[a].substring(0,2) == 'TV'){
                                GRP[a] = (COST[a]*1000) / CPMCPRP[a];  // tv GRP 계산 
                                IMP[a] = GRP[a] / 100;
                                CPMCPRP[a] = (COST[a]*1000) / GRP[a];
                            }
                            else{
                                IMP[a] = (COST[a]*1000) / CPMCPRP[a] * 1000;     // digital GRP 계산 
                                GRP[a] = IMP[a];    // Digital (YT)   
                                CPMCPRP[a] = (COST[a]*1000) / IMP[a] * 1000;
                            }
                        }
                        // 사용자가 CPM/CPRP 입력하지 않았을 경우 
                        else{
                            
                            if(td_title[a].substring(0,2) == 'TV'){
                                GRP[a] = Math.exp(grp_const[a] + grp_slope[a] * Math.log(COST[a]*1000)) * 100;
                                IMP[a] = GRP[a] / 100;
                                CPMCPRP[a] = (COST[a]*1000) / GRP[a];
                            }
                            else{
                                IMP[a] = Math.exp(grp_const[a] + grp_slope[a] * Math.log(COST[a]*1000) );
                                GRP[a] = IMP[a];
                                CPMCPRP[a] = (COST[a]*1000) / IMP[a] * 1000;
                            }
                        }  
                        if(td_title[a].substring(0,2) != 'TV'){
                            GRP[a] = GRP[a] / population[0] * 100;
                        }
                        R1[a] = Math.exp(reach1_const[a] + reach1_slope[a] * Math.log( IMP[a]) );
                        R1[a] = R1[a] / (R1[a] + 1);                            
                        R3[a] = Math.exp(reach3_const[a] + reach3_slope[a] * Math.log( IMP[a]) );
                        R3[a] = R3[a] / (R3[a] + 1);

                        // 상한값 적용 모두 해제 19.06.27                            
                        R3[a] = Math.min(R3[a], R1[a]);
                        
                    }                        
                    COST[3] = COST[0] + COST[1];                    
                    GRP[3] = GRP[0] + GRP[1];
                    
                    R1[3] = (R1[0] + R1[1]) - ratio[0]*(R1[0] * R1[1]);
                    R1[3] = Math.min(R1[3], 0.99);  // 토탈 최대값 99
                    R3[3] = (R3[0] + R3[1]) - ratio[0]*(R3[0] * R3[1]);
                    R3[3] = Math.min(R3[3], R1[3]);  // R3토탈 최대값 <= R1토탈 최대값
                    if (loop == 1) {
                        for(a=0; a<= 3; a++) {
                            optim_R1[a] =   R1[a];
                            optim_R3[a] =   R3[a];
                            optim_GRP[a] =  GRP[a];
                            optim_COST[a] = COST[a];
                            optim_CPMCPRP[a] = CPMCPRP[a];
                        }
                    }

                    if (optim_R1[3] < R1[3]) {
                        for(a=0; a<= 3; a++) {
                            optim_R1[a] =   R1[a];
                            optim_R3[a] =   R3[a];
                            optim_GRP[a] =  GRP[a];
                            optim_COST[a] = COST[a];
                            optim_CPMCPRP[a] = CPMCPRP[a];
                        }
                    }
                
                }
            }
            
            r1_tv_data[0] = (optim_R1[0]*100).toFixed(1);
            r1_pc_data[0] = (optim_R1[1]*100).toFixed(1);
            r1_mo_data[0] = 0;
            r1_total_data[0] = (optim_R1[3]*100).toFixed(1);

            for(a=0;a<3;a++){           
                // optim_CPMCPRP[a] = i_cpmcprp[a];
                optim_share[a] = (optim_COST[a] / i_cost);
                optim_af[a] = optim_GRP[a] / optim_R1[a] / 100;
            }
		}


        if (analType != 'type1' && i_cost >= 50000) {
            //i: tv광고비, j: pc광고비, k:mo광고비
            console.log(i_cost);
            for (i=10000; i<=i_cost; i+=step) {
                for (j=10000; j<=i_cost; j+=step) {
                    for (k=10000; k<=i_cost; k+=step) {
                        // tv, pc mobile 배분값
                        if ((i+j+k) != i_cost) {continue}
                        loop += 1;

                        // 배열설명>> [0]:tv, [1]:pc, [2]:mo, [3]:total
                        COST[0] = i;
                        COST[1] = j;
                        COST[2] = k;
                        
                        for(a=0; a<= 2; a++){
                            // GRP, Reach1, Reach3 계산
                            // 사용자가 CPM/CPRP 입력 했을 경우 
                            if(i_cpmcprp[a] != ""){
                                CPMCPRP[a] = i_cpmcprp[a];
                                if(td_title[a].substring(0,2) == 'TV'){
                                    GRP[a] = (COST[a]*1000) / CPMCPRP[a];  // tv GRP 계산 
                                    IMP[a] = GRP[a] / 100;
                                    CPMCPRP[a] = (COST[a]*1000) / GRP[a];
                                }
                                else{
                                    IMP[a] = (COST[a]*1000) / CPMCPRP[a] * 1000;     // digital GRP 계산 
                                    GRP[a] = IMP[a];    // Digital (YT)   
                                    CPMCPRP[a] = (COST[a]*1000) / IMP[a] * 1000;
                                }
                            }
                            // 사용자가 CPM/CPRP 입력하지 않았을 경우 
                            else{
                               
                                if(td_title[a].substring(0,2) == 'TV'){
                                    GRP[a] = Math.exp(grp_const[a] + grp_slope[a] * Math.log(COST[a]*1000)) * 100;
                                    IMP[a] = GRP[a] / 100;
                                    CPMCPRP[a] = (COST[a]*1000) / GRP[a];
                                }
                                else{
                                    IMP[a] = Math.exp(grp_const[a] + grp_slope[a] * Math.log(COST[a]*1000) );
                                    GRP[a] = IMP[a];
                                    CPMCPRP[a] = (COST[a]*1000) / IMP[a] * 1000;
                                }
                            }  
                            if(td_title[a].substring(0,2) != 'TV'){
                                GRP[a] = GRP[a] / population[0] * 100;
                            }
                            R1[a] = Math.exp(reach1_const[a] + reach1_slope[a] * Math.log( IMP[a]) );
                            R1[a] = R1[a] / (R1[a] + 1);                            
                            R3[a] = Math.exp(reach3_const[a] + reach3_slope[a] * Math.log( IMP[a]) );
                            R3[a] = R3[a] / (R3[a] + 1);

                            // 상한값 적용 모두 해제 19.06.27                            
                            R3[a] = Math.min(R3[a], R1[a]);
                            
                        }                        
                        COST[3] = COST[0] + COST[1] + COST[2];
                        GRP[3] = GRP[0] + GRP[1] + GRP[2];
                        R1[3] = (R1[0] + R1[1] + R1[2]) - ratio[0]*(R1[0] * R1[1]) - ratio[1]*(R1[0] * R1[2]) - ratio[2]*(R1[2] * R1[1]) + ratio[3]*(R1[0] * R1[1] * R1[2]); 
                        R1[3] = Math.min(R1[3], 0.99);  // 토탈 최대값 99
                        R3[3] = (R3[0] + R3[1] + R3[2]) - ratio[0]*(R3[0] * R3[1]) - ratio[1]*(R3[0] * R3[2]) - ratio[2]*(R3[2] * R3[1]) + ratio[3]*(R3[0] * R3[1] * R3[2]);
                        R3[3] = Math.min(R3[3], R1[3]);  // R3토탈 최대값 <= R1토탈 최대값
                        if (loop == 1) {
                            for(a=0; a<= 3; a++) {
                                optim_R1[a] =   R1[a];
                                optim_R3[a] =   R3[a];
                                optim_GRP[a] =  GRP[a];
                                optim_COST[a] = COST[a];
                                optim_CPMCPRP[a] = CPMCPRP[a];
                            }
                        }

                        if (optim_R1[3] < R1[3]) {
                            for(a=0; a<= 3; a++) {
                                optim_R1[a] =   R1[a];
                                optim_R3[a] =   R3[a];
                                optim_GRP[a] =  GRP[a];
                                optim_COST[a] = COST[a];
                                optim_CPMCPRP[a] = CPMCPRP[a];
                            }
                        }
                    }
                }
            }
            r1_tv_data[0] = (optim_R1[0]*100).toFixed(1);
            r1_pc_data[0] = (optim_R1[1]*100).toFixed(1);
            r1_mo_data[0] = (optim_R1[2]*100).toFixed(1);
            r1_total_data[0] = (optim_R1[3]*100).toFixed(1);

            for(a=0;a<3;a++){           
                // optim_CPMCPRP[a] = i_cpmcprp[a];
                optim_share[a] = (optim_COST[a] / i_cost);
                optim_af[a] = optim_GRP[a] / optim_R1[a] / 100;
            }
		}      

        // 데이터테이블 화면에 나타내기  
        $('[name=cost_a'+no+']').text(comma(optim_COST[0].toFixed(0)));
        $('[name=cost_b'+no+']').text(comma(optim_COST[1].toFixed(0)));
        $('[name=cost_c'+no+']').text(comma(optim_COST[2].toFixed(0)));
        $('[name=cost_total'+no+']').text(comma(optim_COST[3].toFixed(0)));

        $('[name=cost_share_a'+no+']').text((optim_share[0]*100).toFixed(1) + ' %');
        $('[name=cost_share_b'+no+']').text((optim_share[1]*100).toFixed(1) + ' %');
        $('[name=cost_share_c'+no+']').text((optim_share[2]*100).toFixed(1) + ' %');
        $('[name=cost_share_total'+no+']').text('100 %');

        $('[name=r1_a'+no+']').text((optim_R1[0]*100).toFixed(1) + ' %');
        $('[name=r1_b'+no+']').text((optim_R1[1]*100).toFixed(1) + ' %');
        $('[name=r1_c'+no+']').text((optim_R1[2]*100).toFixed(1) + ' %');
        $('[name=r1_total'+no+']').text((optim_R1[3]*100).toFixed(1) + ' %');

        $('[name=r3_a'+no+']').text((optim_R3[0]*100).toFixed(1) + ' %');
        $('[name=r3_b'+no+']').text((optim_R3[1]*100).toFixed(1) + ' %');
        $('[name=r3_c'+no+']').text((optim_R3[2]*100).toFixed(1) + ' %');
        $('[name=r3_total'+no+']').text((optim_R3[3]*100).toFixed(1) + ' %');        

        $('[name=grp_a'+no+']').text(optim_GRP[0].toFixed(1));
        $('[name=grp_b'+no+']').text(optim_GRP[1].toFixed(1));
        $('[name=grp_c'+no+']').text(optim_GRP[2].toFixed(1));
        $('[name=grp_total'+no+']').text(optim_GRP[3].toFixed(1));

        $('[name=af_a'+no+']').text(optim_af[0].toFixed(1));
        $('[name=af_b'+no+']').text(optim_af[1].toFixed(1));
        $('[name=af_c'+no+']').text(optim_af[2].toFixed(1));
        $('[name=af_total'+no+']').text(optim_af[3].toFixed(1));

        $('[name=cpm_a'+no+']').text(comma(CPMCPRP[0].toFixed(0)));
        $('[name=cpm_b'+no+']').text(comma(CPMCPRP[1].toFixed(0)));
        $('[name=cpm_c'+no+']').text(comma(CPMCPRP[2].toFixed(0)));

        

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

    // 분석항목 3개짜리 그래프 
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