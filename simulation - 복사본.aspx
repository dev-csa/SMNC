<%@ Page Language="C#" AutoEventWireup="true" CodeFile="simulation.aspx.cs" Inherits="simulation" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<!-- head 공통 부분으로 meta 및 css, js 등 사이트 공통 요소를 불러옵니다  -->
<!-- #include file ="inc_headMeta.htm" -->  

<script>	
$(document).ready(function(){
	menuActive('03','03_02'); // 좌메뉴 active //필수
});
</script>

</head>

<body class="amb_layout_common" oncontextmenu='return false'><!-- class명 amb_layout_common :필수 -->

	
<!--  ////////////// header 영역 불러옵니다 ////////////// -->
<!-- #include file ="inc_header.htm" -->  
<!--  ////////////// header 영역 불러옵니다 ////////////// -->

<!--  ////////////// content 영역 ////////////// -->
<div class="contentWrap">

	<!-- 실제 컨텐츠가 들어 가는 부분  -->
	<div class="content wrap">			
		
		<!-- location 및 페이지 타이틀 -->
		<h2 class="pageTit">
			<span class="title">3S 사전예측 - Simulation </span>
		</h2>
		<!-- //location 및 페이지 타이틀 -->
		

		<!-- rowBox 반복단위 -->
		<div class="rowBox">
			<div class="searchArea">
				<div class="searchForm col5"><!-- class colX를 이용하여 clumn 수 결정 -->
					<!-- 반복단위 -->
					<div class="unit">
						<label class="tit"><span class="text">분석유형</span></label>
						<div class="cont">
							<select class="inp" id="selAnalType" style="">
								<option value="screen">Screen별</option>
								<option value="digital">Digital channel별</option>
								<option value="tvdigital">TV&Digital별</option>
							</select>                            
                            <span class="inline" id="rdoAnalType">
                                <span class="radioInp">
									<input type="radio" name="tvType" value="pub" checked /><label>Total TV U YT U SMR</label>
								</span>
								<span class="radioInp">
									<input type="radio" name="tvType" value="cable" /><label>지상파 U 케이블&종편 U YT</label>
								</span> 
                            </span> 
                            <span class="pColor_03 pdLR10" name="divAnalType" id="divAnalType"> </span>
                            Total R1+ 최적화 분석
							
						</div>
					</div>
					<!--/ 반복단위 -->

					<!-- 반복단위 -->
					<div class="unit">
						<label class="tit"><span class="text">타깃</span></label>
						<div class="cont">
                            <button type="button" class="amb_btnstyle black middle" onClick="layerPopup('optimization_popup.htm' , 'popupId_10_01', '' , '600');">타깃 설정하기</button>
                            <span class="inline pdLR10" id="selected_target"> (개인 / 전체) </span>
                            
						</div>
					</div>
					<!--/ 반복단위 -->

					<div class="clear"></div>

					<!-- 반복단위 -->
					<div class="unit leftTitle">
						<label class="tit"><span class="text">1. 광고비</span></label>
						<div class="cont">							
							<label for="SmlCost11"> </label> <input type="text" class="inp" style="width:150px;" id="SmlCost11" onkeyup="comma_and_hangul2(this);" /><span class="inline" style="width:50px;">천원</span>  
							<label for="SmlCost12"> </label> <input type="text" class="inp" style="width:150px;" id="SmlCost12" onkeyup="comma_and_hangul2(this);" /><span class="inline" style="width:50px;">천원</span>  
							<label for="SmlCost13"> </label> <input type="text" class="inp" style="width:150px;" id="SmlCost13" onkeyup="comma_and_hangul2(this);" /><span class="inline" style="width:50px;">천원</span> 
							<span class="pColor_01 pdLR10" id="tdSmlCost1"></span>
							<button type="button" class="amb_btnstyle black small onlyIcon" onClick="addUnit(this);"><i class="ambicon-013_mark_plus"></i></button>							
						</div>
						<div class="clear"></div>

						<div class="sUnit">
							<label class="tit"><span class="text">CPRP & CPM</span></label>
							<div class="cont">							
								<label for="SmlCprp11"></label> <input type="text" class="inp" style="width:150px;" id="SmlCprp11" onkeyup="comma2(this);" /><span class="inline" style="width:50px;">원</span> 
								<label for="SmlCprp12"></label> <input type="text" class="inp" style="width:150px;" id="SmlCprp12" onkeyup="comma2(this);" /><span class="inline" style="width:50px;">원</span> 
								<label for="SmlCprp13"></label> <input type="text" class="inp" style="width:150px;" id="SmlCprp13" onkeyup="comma2(this);" /><span class="inline" style="width:50px;">원</span> 			
                                <span id="cprpko1" style="font-weight:bold"></span>
                            </div>
						</div>
					</div>
					<!--/ 반복단위 -->

					<!-- 반복단위 -->
					<div class="clear"></div>
					<div class="unit leftTitle" id="target01" style="display:none;">
						<label class="tit"><span class="text">2. 광고비</span></label>
						<div class="cont">							
							<label for="SmlCost11"></label> <input type="text" class="inp" style="width:150px;" id="SmlCost21" onkeyup="comma_and_hangul2(this);" /><span class="inline" style="width:50px;">천원</span>  
							<label for="SmlCost12"></label> <input type="text" class="inp" style="width:150px;" id="SmlCost22" onkeyup="comma_and_hangul2(this);" /><span class="inline" style="width:50px;">천원</span>  
							<label for="SmlCost13"></label> <input type="text" class="inp" style="width:150px;" id="SmlCost23" onkeyup="comma_and_hangul2(this);" /><span class="inline" style="width:50px;">천원</span> 
							<span class="pColor_01 pdLR10" id="tdSmlCost2"></span>
							<button type="button" class="amb_btnstyle black small onlyIcon" onClick="removeUnit(this);"><i class="ambicon-014_mark_minus"></i></button>
						</div>
						<div class="clear"></div>

						<div class="sUnit">
							<label class="tit"><span class="text">CPRP & CPM</span></label>
							<div class="cont">							
								<label for="SmlCprp11"></label> <input type="text" class="inp" style="width:150px;" id="SmlCprp21" onkeyup="comma2(this);" /><span class="inline" style="width:50px;">원</span> 
								<label for="SmlCprp12"></label> <input type="text" class="inp" style="width:150px;" id="SmlCprp22" onkeyup="comma2(this);" /><span class="inline" style="width:50px;">원</span> 
								<label for="SmlCprp13"></label> <input type="text" class="inp" style="width:150px;" id="SmlCprp23" onkeyup="comma2(this);" /><span class="inline" style="width:50px;">원</span> 			
                                <span id="cprpko2" style="font-weight:bold"></span>
							</div>
						</div>
					</div>
					<!--/ 반복단위 -->

					<!-- 반복단위 -->
					<div class="clear"></div>
					<div class="unit leftTitle" id="target02" style="display:none;">
						<label class="tit"><span class="text">3. 광고비</span></label>
						<div class="cont">							
							<label for="SmlCost31"></label> <input type="text" class="inp" style="width:150px;" id="SmlCost31" onkeyup="comma_and_hangul2(this);" /><span class="inline" style="width:50px;">천원</span>  
							<label for="SmlCost32"></label> <input type="text" class="inp" style="width:150px;" id="SmlCost32" onkeyup="comma_and_hangul2(this);" /><span class="inline" style="width:50px;">천원</span>  
							<label for="SmlCost33"></label> <input type="text" class="inp" style="width:150px;" id="SmlCost33" onkeyup="comma_and_hangul2(this);" /><span class="inline" style="width:50px;">천원</span> 
							<span class="pColor_01 pdLR10" id="tdSmlCost3"></span>
							<button type="button" class="amb_btnstyle black small onlyIcon" onClick="removeUnit(this);"><i class="ambicon-014_mark_minus"></i></button>
						</div>
						<div class="clear"></div>

						<div class="sUnit">
							<label class="tit"><span class="text">CPRP & CPM</span></label>
							<div class="cont">							
								<label for="SmlCprp31"></label> <input type="text" class="inp" style="width:150px;" id="SmlCprp31" onkeyup="comma2(this);" /><span class="inline" style="width:50px;">원</span> 
								<label for="SmlCprp32"></label> <input type="text" class="inp" style="width:150px;" id="SmlCprp32" onkeyup="comma2(this);" /><span class="inline" style="width:50px;">원</span> 
								<label for="SmlCprp33"></label> <input type="text" class="inp" style="width:150px;" id="SmlCprp33" onkeyup="comma2(this);" /><span class="inline" style="width:50px;">원</span> 			
                                <span id="cprpko3" style="font-weight:bold"></span>
							</div>
						</div>
					</div>
					<!--/ 반복단위 -->
				</div>
				<div class="btnArea">
					<button type="button" class="amb_btnstyle red middle" onclick="sml_go();" ><i class="ambicon-026_search"></i><span class="text">검색</span></button>
					<button type="button" class="amb_btnstyle white middle" onclick="javascript:fnExcelReport('excel_down', 'Simulation');"><span class="text">Save as Excel</span></button>
				</div>
			</div>
		</div>
		<!-- //rowBox 반복단위 -->

		<!-- rowBox 반복단위 -->
		<div class="rowBox mgT30">
            <div class="wrap-loading display-none">
                <div><img src="img/loading.gif" /></div>               
            </div> 
			<div class="g_column w_1_1">
				<div class="unitBox checkbox_all" style="">
					<div id="sml_result1"> </div><br/>
					<div id="sml_result2"> </div><br/>
					<div id="sml_result3"> </div><br/>
                </div>
                <div class="chartBox" style="display:none;" id="excel_down">
					<div id="sml_excel1" style="display:none;"> </div>
					<div id="sml_excel2" style="display:none;"> </div>
					<div id="sml_excel3" style="display:none;"> </div>					
				</div>

			</div>
		</div>
		<!-- rowBox 반복단위 -->

	</div>
	<!-- //실제 컨텐츠가 들어 가는 부분  -->

</div>
<!--  ////////////// content 영역 ////////////// -->

<!--  ////////////// footer 영역 불러옵니다 ////////////// -->
<!-- #include file ="inc_footer.htm" -->  
<!--  ////////////// footer 영역 불러옵니다 ////////////// -->

</body>
</html>

<script>
    var rdo_target = "MF0769";  // 타겟 초기값 
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

		var no = obj.id;
		no = no.substr(5,1);
		$('#optcost'+no).val("");
	}
	
	// 분석유형 별 label 변경 
    $("#selAnalType").change(function() {
        RefreshAnalType();
    });    
    function RefreshAnalType() {
        $('#divAnalType').html("");
        var analType = $("#selAnalType").val();       
        var s = "";
        var tvType = $(":input:radio[name=tvType]:checked").val();
        Getgrp(rdo_target);
        if (analType == "screen") {
            s += " TV U PC U MO";
            $("label[for='SmlCost11']").text("TV");
            $("label[for='SmlCost21']").text("TV");
            $("label[for='SmlCost31']").text("TV");
            $("label[for='SmlCprp11']").text("TV");
            $("label[for='SmlCprp21']").text("TV");
            $("label[for='SmlCprp31']").text("TV");

            $("label[for='SmlCost12']").text("PC");
            $("label[for='SmlCost22']").text("PC");
            $("label[for='SmlCost32']").text("PC");
            $("label[for='SmlCprp12']").text("PC");
            $("label[for='SmlCprp22']").text("PC");
            $("label[for='SmlCprp32']").text("PC");

            $("label[for='SmlCost13']").text("MO");
            $("label[for='SmlCost23']").text("MO");
            $("label[for='SmlCost33']").text("MO");
            $("label[for='SmlCprp13']").text("MO");
            $("label[for='SmlCprp23']").text("MO");
            $("label[for='SmlCprp33']").text("MO");
            $("#rdoAnalType").hide();
        }
        else if (analType == "digital") {
            s += " YT U SMR U NAVER";
            $("label[for='SmlCost11']").text("YT");
            $("label[for='SmlCost21']").text("YT");
            $("label[for='SmlCost31']").text("YT");
            $("label[for='SmlCprp11']").text("YT");
            $("label[for='SmlCprp21']").text("YT");
            $("label[for='SmlCprp31']").text("YT");

            $("label[for='SmlCost12']").text("SMR");
            $("label[for='SmlCost22']").text("SMR");
            $("label[for='SmlCost32']").text("SMR");
            $("label[for='SmlCprp12']").text("SMR");
            $("label[for='SmlCprp22']").text("SMR");
            $("label[for='SmlCprp32']").text("SMR");

            $("label[for='SmlCost13']").text("NAVER");
            $("label[for='SmlCost23']").text("NAVER");
            $("label[for='SmlCost33']").text("NAVER");
            $("label[for='SmlCprp13']").text("NAVER");
            $("label[for='SmlCprp23']").text("NAVER");
            $("label[for='SmlCprp33']").text("NAVER");
            $("#rdoAnalType").hide();
        }
        else if (analType == "tvdigital") {
            // s += " TV U YT U SMR";
            $("label[for='SmlCost11']").text("TV");
            $("label[for='SmlCost21']").text("TV");
            $("label[for='SmlCost31']").text("TV");
            $("label[for='SmlCprp11']").text("TV");
            $("label[for='SmlCprp21']").text("TV");
            $("label[for='SmlCprp31']").text("TV");

            $("label[for='SmlCost12']").text("YT");
            $("label[for='SmlCost22']").text("YT");
            $("label[for='SmlCost32']").text("YT");
            $("label[for='SmlCprp12']").text("YT");
            $("label[for='SmlCprp22']").text("YT");
            $("label[for='SmlCprp32']").text("YT");

            $("label[for='SmlCost13']").text("SMR");
            $("label[for='SmlCost23']").text("SMR");
            $("label[for='SmlCost33']").text("SMR");
            $("label[for='SmlCprp13']").text("SMR");
            $("label[for='SmlCprp23']").text("SMR");
            $("label[for='SmlCprp33']").text("SMR");
            $("#rdoAnalType").show();            
        }
        $('#divAnalType').html(s);
        $('#SmlCprp11').val('');
        $('#SmlCprp12').val('');
        $('#SmlCprp13').val('');
        $('#SmlCprp21').val('');
        $('#SmlCprp22').val('');
        $('#SmlCprp23').val('');
        $('#SmlCprp31').val('');
        $('#SmlCprp32').val('');
        $('#SmlCprp33').val('');
        $('#SmlCost11').val('');
        $('#SmlCost12').val('');
        $('#SmlCost13').val('');
        $('#SmlCost21').val('');
        $('#SmlCost22').val('');
        $('#SmlCost23').val('');
        $('#SmlCost31').val('');
        $('#SmlCost32').val('');
        $('#SmlCost33').val('');

        
    }
    RefreshAnalType();
    
    $('input[type=radio]').change( function() {
        if($('#selAnalType').val() == 'tvdigital'){
            $('#SmlCprp11').val('');
            $('#SmlCprp12').val('');
            $('#SmlCprp13').val('');
            $('#SmlCprp21').val('');
            $('#SmlCprp22').val('');
            $('#SmlCprp23').val('');
            $('#SmlCprp31').val('');
            $('#SmlCprp32').val('');
            $('#SmlCprp33').val('');
            $('#SmlCost11').val('');
            $('#SmlCost12').val('');
            $('#SmlCost13').val('');
            $('#SmlCost21').val('');
            $('#SmlCost22').val('');
            $('#SmlCost23').val('');
            $('#SmlCost31').val('');
            $('#SmlCost32').val('');
            $('#SmlCost33').val('');
            Getgrp(rdo_target);
        }

        if($(":input:radio[name=tvType]:checked").val() == "pub"){
            $("label[for='SmlCost11']").text("TV");
            $("label[for='SmlCost21']").text("TV");
            $("label[for='SmlCost31']").text("TV");
            $("label[for='SmlCprp11']").text("TV");
            $("label[for='SmlCprp21']").text("TV");
            $("label[for='SmlCprp31']").text("TV");

            $("label[for='SmlCost12']").text("YT");
            $("label[for='SmlCost22']").text("YT");
            $("label[for='SmlCost32']").text("YT");
            $("label[for='SmlCprp12']").text("YT");
            $("label[for='SmlCprp22']").text("YT");
            $("label[for='SmlCprp32']").text("YT");

            $("label[for='SmlCost13']").text("SMR");
            $("label[for='SmlCost23']").text("SMR");
            $("label[for='SmlCost33']").text("SMR");
            $("label[for='SmlCprp13']").text("SMR");
            $("label[for='SmlCprp23']").text("SMR");
            $("label[for='SmlCprp33']").text("SMR");

        }
        else if($(":input:radio[name=tvType]:checked").val() == "cable"){
            $("label[for='SmlCost11']").text("지상파");
            $("label[for='SmlCost21']").text("지상파");
            $("label[for='SmlCost31']").text("지상파");
            $("label[for='SmlCprp11']").text("지상파");
            $("label[for='SmlCprp21']").text("지상파");
            $("label[for='SmlCprp31']").text("지상파");

            $("label[for='SmlCost12']").text("케이블&종편");
            $("label[for='SmlCost22']").text("케이블&종편");
            $("label[for='SmlCost32']").text("케이블&종편");
            $("label[for='SmlCprp12']").text("케이블&종편");
            $("label[for='SmlCprp22']").text("케이블&종편");
            $("label[for='SmlCprp32']").text("케이블&종편");

            $("label[for='SmlCost13']").text("YT");
            $("label[for='SmlCost23']").text("YT");
            $("label[for='SmlCost33']").text("YT");
            $("label[for='SmlCprp13']").text("YT");
            $("label[for='SmlCprp23']").text("YT");
            $("label[for='SmlCprp33']").text("YT");
        }                
    });
// 1 ~ 9 한글 표시
    var arrNumberWord = new Array("","일","이","삼","사","오","육","칠","팔","구");
    // 10, 100, 100 자리수 한글 표시
    var arrDigitWord = new  Array("","십","백","천");
    // 만단위 한글 표시
    var arrManWord = new  Array("","만","억", "조"); 

    function comma_and_hangul2(txt_id) {        
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

        var inputVal2 = tmps2;

        //콤마제거     
        // console.log("???"+inputVal);   
        var val = inputVal2.replace(/[^\d]+/g, '');
        if (isNaN(val) || (val == "")) return;
        if (getid != "SmlCprp1" || getid != "SmlCprp2" || getid != "SmlCprp3"){ val = val * 1000; }        
    
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
        if(getid=="SmlCost1"){
            $('#tdSmlCost1').html(han_value);      
        }
        else if(getid=="SmlCost2"){
            $('#tdSmlCost2').html(han_value); 
        }
        else if(getid=="SmlCost3"){
            $('#tdSmlCost3').html(han_value); 
        }      
        else if(getid=="SmlCprp1"){
            $('#cprpko1').html(han_value); 
        }
        else if(getid=="SmlCprp2"){
            $('#cprpko2').html(han_value); 
        }
        else if(getid=="SmlCprp3"){
            $('#cprpko3').html(han_value); 
        }
        
        cal_grp(an, device, val);
    }    
    function comma(num) {
        var txt = num.toString();
        var comma_txt = txt.replace(/[^0-9]/g, '');
        comma_txt = comma_txt.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
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
	var t;
    // grp const, slope 초기값 남녀 0769 값 (screen)
    var const_list = []
    var slope_list = []
    // const_list = [-17.9947752, -6.548870472, -7.962467408];
    // slope_list = [0.906703422, 1.176853487, 1.257387184];

    function Getgrp(sTarget){
        var tvType = $(":input:radio[name=tvType]:checked").val();
        var url = "json_getgrp.aspx";
        url += "?v1=" + sTarget;
        url += "&v2=" + $('#selAnalType').val();
        url += "&v3=" + tvType;

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
        var tvType = $(":input:radio[name=tvType]:checked").val();
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

        if(onlytv == "1screen" || onlytv == "1tvdigital"){
            grp = Math.exp(getconst + getslope * Math.log(cost)) * 100;
            cprp_cpm = cost/grp;
        }
        else if(tvType == "cable" && onlytv == "2tvdigital"){
            grp = Math.exp(getconst + getslope * Math.log(cost)) * 100;
            cprp_cpm = cost/grp;
        }  
        else{
            grp = Math.exp(getconst + getslope * Math.log(cost));
            cprp_cpm = cost/grp*1000;
        }
          
        cprp_cpm = cprp_cpm.toFixed(0);
        cprp_cpm = comma(cprp_cpm);
        $('#SmlCprp'+an+device).val(cprp_cpm); 
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

        if(gender == 01){
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
        $('#SmlCprp11').val('');
        $('#SmlCprp12').val('');
        $('#SmlCprp13').val('');
        $('#SmlCprp21').val('');
        $('#SmlCprp22').val('');
        $('#SmlCprp23').val('');
        $('#SmlCprp31').val('');
        $('#SmlCprp32').val('');
        $('#SmlCprp33').val('');      
        $('#SmlCost11').val('');      
        $('#SmlCost12').val('');      
        $('#SmlCost13').val('');      
        $('#SmlCost21').val('');      
        $('#SmlCost22').val('');      
        $('#SmlCost23').val('');      
        $('#SmlCost31').val('');      
        $('#SmlCost32').val('');      
        $('#SmlCost33').val('');      
        Getgrp(gender+target);
    }


    // grp const, slope 초기값 남녀 0769 값 (screen)
    

    function sml_go() {
        var tvType = $(":input:radio[name=tvType]:checked").val();
        var url = "json_simul.aspx";
        url += "?v1=" + rdo_target;
        url += "&v2=" + $('#selAnalType').val();

        for (i=1; i<=3; i++) {
            $('#sml_result'+i).html("");
            $('#sml_excel'+i).html("");

            var cost1 = $('#SmlCost'+i+'1').val();            
            var cost2 = $('#SmlCost'+i+'2').val();
            var cost3 = $('#SmlCost'+i+'3').val();
            var cpmcprp1 = $('#SmlCprp'+i+'1').val();
            var cpmcprp2 = $('#SmlCprp'+i+'2').val();
            var cpmcprp3 = $('#SmlCprp'+i+'3').val();

            cost1 = cost1.replace(/[^0-9]/g, '');
            cost2 = cost2.replace(/[^0-9]/g, '');
            cost3 = cost3.replace(/[^0-9]/g, '');
            cpmcprp1 = cpmcprp1.replace(/[^0-9]/g, '');
            cpmcprp2 = cpmcprp2.replace(/[^0-9]/g, '');
            cpmcprp3 = cpmcprp3.replace(/[^0-9]/g, '');

            var url2 = url;
            url2 += "&v3=" + cost1 + "&v4=" + cost2 + "&v5=" + cost3 + "&v6=" + cpmcprp1 + "&v7=" + cpmcprp2 + "&v8=" + cpmcprp3;
            url2 += "&v9="+ i + "&v10=" + tvType;
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

    var r1_data1 = [NaN];
    var r1_data2 = [NaN];
    var r1_data3 = [NaN];
    var r3_data1 = [NaN];
    var r3_data2 = [NaN];
    var r3_data3 = [NaN];
    var r1_total = [NaN];
    var r3_total = [NaN];
    var td_title = [NaN];

    /// TV & Digital 결과 화면
    function data_result(rcv){
        window.console && console.log(rcv);
        var no          = rcv["no"];
        var reach1_list = rcv["reach1"];
        var reach3_list = rcv["reach3"];
        var grp_list    = rcv["grp"];
        var cost_list   = rcv["cost"];
        var share_list  = rcv["share"];
        var af_list     = rcv["af"];
        td_title        = rcv["title"];

        r1_data1[0] = (reach1_list[0]*100).toFixed(1);
        r1_data2[0] = (reach1_list[1]*100).toFixed(1);
        r1_data3[0] = (reach1_list[2]*100).toFixed(1);
        r1_total[0] = (reach1_list[3]*100).toFixed(1);
        r3_data1[0] = (reach3_list[0]*100).toFixed(1);
        r3_data2[0] = (reach3_list[1]*100).toFixed(1);
        r3_data3[0] = (reach3_list[2]*100).toFixed(1);
        r3_total[0] = (reach3_list[3]*100).toFixed(1);

        if($("#selAnalType").val() != "screen"){
            if(td_title[0].substring(0,2) == 'TV'){
                td_title[0] = td_title[0].substring(3,td_title[0].length);
            }
            if(td_title[1].substring(0,2) == 'TV'){
                td_title[1] = td_title[1].substring(3,td_title[1].length);
            }
        }        

        opt_html = "";        
        opt_html += '<table class="amb_table" height="280"> <span style="font-weight:bold"> <'+no+'안> </span>';
        opt_html +=	'<colgroup><col style="width:12%;" /><col style="width:10%;" /><col style="width:10%;" /><col style="width:10%;" /><col style="width:12%;" /><col style="width:46%;" /></colgroup>'
        opt_html += '<thead><tr><th width="114">산출지표</th><th width="114">'+td_title[0]+'</th><th width="94">'+td_title[1]+'</th><th width="94">'+td_title[2]+'</th><th width="94">Total</th><th width="452">Graph</th></tr></thead>';        
        opt_html += '<tbody><tr><td>예산(천원)</td><td>'+comma(cost_list[0])+'</td><td>'+comma(cost_list[1])+'</td><td>'+comma(cost_list[2])+'</td><td>'+comma(cost_list[3])+'</td>';
        opt_html += '<td rowspan="6" align="center" style="width:440px; height:100%;">';
        opt_html += '<div id="r1_graph'+no+'"align="center" style="height:250px; margin: 0px 10px 0px 10px; " ></div></td></tr>';
        opt_html += '<tr><td>예산비중</td><td>'+share_list[0].toFixed(1) + ' % </td><td>'+share_list[1].toFixed(1) + ' % </td><td>'+share_list[2].toFixed(1) + ' % </td><td>'+share_list[3].toFixed(1) + ' % </td></tr>'; 
        opt_html += '<tr><td>R1+(%)</td><td>'+(reach1_list[0]*100).toFixed(1) + ' % </td><td>'+(reach1_list[1]*100).toFixed(1) + ' % </td><td>'+(reach1_list[2]*100).toFixed(1) + ' % </td><td>'+(reach1_list[3]*100).toFixed(1) + ' % </td></tr>';
        opt_html += '<tr><td>R3+(%)</td><td>'+(reach3_list[0]*100).toFixed(1) + ' % </td><td>'+(reach3_list[1]*100).toFixed(1) + ' % </td><td>'+(reach3_list[2]*100).toFixed(1) + ' % </td><td>'+(reach3_list[3]*100).toFixed(1) + ' % </td></tr>';
        opt_html += '<tr><td>GRPs</td><td>'+grp_list[0].toFixed(1) + ' </td><td>'+grp_list[1].toFixed(1) + ' </td><td>'+grp_list[2].toFixed(1) + ' </td><td>'+grp_list[3].toFixed(1) + ' </td>';        
        opt_html += '<tr><td>AF</td><td>'+af_list[0].toFixed(1) + ' </td><td>'+af_list[1].toFixed(1) + ' </td><td>'+af_list[2].toFixed(1) + ' </td><td>'+af_list[3].toFixed(1) + ' </td>';        
        opt_html += '</tbody></table>';
        
        // 데이터 화면에 나타내기  
        $('#sml_result'+no).html(opt_html);

        // 그래프 그리기 
        drawGraph(no); 

        // // 엑셀 출력용 데이터 찍기 (hide)
        var title_target = $('#selected_target').html();
        exc_html = "";
        exc_html += '<table class="amb_table" height="230"> <span style="font-weight:bold"> <'+no+'안> '+ title_target +' </span>';
        exc_html += '<tr><th width="114">산출지표</th><th width="114">'+td_title[0]+'</th><th width="94">'+td_title[1]+'</th><th width="94">'+td_title[2]+'</th><th width="94">Total</th>';
        exc_html += '<tr><td style="font-size:12px">예산(천원)</td><td>'+comma(cost_list[0])+'</td><td>'+comma(cost_list[1])+'</td><td>'+comma(cost_list[2])+'</td><td>'+comma(cost_list[3])+'</td>';        
        exc_html += '<tr><td style="font-size:12px">예산비중</td><td>'+share_list[0].toFixed(1) + ' % </td><td>'+share_list[1].toFixed(1) + ' % </td><td>'+share_list[2].toFixed(1) + ' % </td><td>'+share_list[3].toFixed(1) + ' % </td></tr>'; 
        exc_html += '<tr><td>R1+(%)</td><td>'+(reach1_list[0]*100).toFixed(1) + ' % </td><td>'+(reach1_list[1]*100).toFixed(1) + ' % </td><td>'+(reach1_list[2]*100).toFixed(1) + ' % </td><td>'+(reach1_list[3]*100).toFixed(1) + ' % </td></tr>';
        exc_html += '<tr><td>R3+(%)</td><td>'+(reach3_list[0]*100).toFixed(1) + ' % </td><td>'+(reach3_list[1]*100).toFixed(1) + ' % </td><td>'+(reach3_list[2]*100).toFixed(1) + ' % </td><td>'+(reach3_list[3]*100).toFixed(1) + ' % </td></tr>';
        exc_html += '<tr><td>GRPs</td><td>'+grp_list[0].toFixed(1) + ' </td><td>'+grp_list[1].toFixed(1) + ' </td><td>'+grp_list[2].toFixed(1) + ' </td><td>'+grp_list[3].toFixed(1) + ' </td>';        
        exc_html += '<tr><td>AF</td><td>'+af_list[0].toFixed(1) + ' </td><td>'+af_list[1].toFixed(1) + ' </td><td>'+af_list[2].toFixed(1) + ' </td><td>'+af_list[3].toFixed(1) + ' </td>';        
        exc_html += '</table>';

        $('#sml_excel'+no).html(exc_html);
    }

    /// Reach1 Graph
    function drawGraph(no){
        var dom = document.getElementById("r1_graph"+no);
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        app.title = 'Line and bar';
        var colors = ['#f56c5c', '#a49a4e', '#56a3a9', '#999b9e'];
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
                data:td_title
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
                    name: 'Reach 1+       ',
                    // interval: 20,
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
                    label: {
                        normal: {
                            show: true,
                            position: 'top'
                        }
                    },
                    data: r1_data1
                },
                {
                    name: td_title[1],
                    type:'bar',
                    label: {
                        normal: {
                            show: true,
                            position: 'top'
                        }
                    },
                    data: r1_data2
                },
                {
                    name: td_title[2],
                    type:'bar',
                    label: {
                        normal: {
                            show: true,
                            position: 'top'
                        }
                    },
                    data: r1_data3
                },
                {
                    name:td_title[3],
                    type:'bar',
                    label: {
                        normal: {
                            show: true,
                            position: 'top'
                        }
                    },
                    data: r1_total
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
  	
    function fnExcelReport(id, name) {
    var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
    tab_text = tab_text + '<head><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>';
    tab_text = tab_text + '<x:Name>Sheet1</x:Name>';
    tab_text = tab_text + '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
    tab_text = tab_text + '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';
    tab_text = tab_text + "<table border='1px'>";
    var exportTable = $('#' + id).clone();
    exportTable.find('input').each(function (index, elem) { $(elem).remove(); });
    tab_text = tab_text + exportTable.html();
    tab_text = tab_text + '</table></body></html>';
    var fileName = name + '.xls';

    //Save the file
    // ie 10+
    try{
        var blob = new Blob([tab_text], { type: "application/vnd.ms-excel;charset=euc-kr" }) 
        window.saveAs(blob, fileName);
    }
    // ie 9이하 
    catch(e){
        var data = document.getElementById(id);
        var csvData = [];
        var tmpArr = [];
        var tmpStr = '';
        for (var i = 0; i < data.rows[0].cells.length; i++) {
            tmpArr.push((data.rows[0].cells[i].innerText || data.rows[0].cells[i].textContent));
        }
        csvData.push(tmpArr.join('\t'));
        
        for (var i = 1; i < data.rows.length; i++) {
            tmpArr = [];
            for (var j = 0; j < data.rows[0].cells.length; j++) {
                tmpArr.push(data.rows[i].cells[j].innerHTML);
            }
            csvData.push(tmpArr.join('\t'));
        }
        var output = csvData.join('\n');
        SaveContents(output, fileName);
    }        
}

//For saving the file
function SaveContents(element, fileName) {
    if (document.execCommand) {
        var fileName = fileName;
        var oWin = window.open("about:blank","_blank");
        oWin.document.write(element);
        oWin.document.close();
        var success = oWin.document.execCommand('SaveAs', false, fileName);
        oWin.close();            
    }
}
</script>
