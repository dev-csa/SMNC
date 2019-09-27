<%@ Page Language="C#" AutoEventWireup="true" CodeFile="usage_video.aspx.cs" Inherits="usage_video" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<!-- #include file ="inc_headMeta.htm" -->  
</head>
<body>
<div id="container">
	<div id="header">
		<h1 class="logo"><a href="#" title="SBS M&C" target="_blank">nielsen</a></h1>
	</div> 
	<!-- #include file ="header.html" -->  
	<div >
		<div id="leftbar2" >
		<table class="Ltablesty">
			<tr>
			<td style="padding-top:20px;">분석유형</td>
			</tr>
			<tr><td>
				<select class="inp" id="analtype" >
					<option value="byday">디바이스별</option>
					<option value="bytime">시간대별</option>
				</select>
			</td></tr>			
			<tr>
			<td style="padding-top:20px">분석일자</td>
			</tr>
			<tr>
				<td><select class="inp" id="sMonth">
				<option value="201901">2019년 1월</option>
				<option value="201902">2019년 2월</option>
				<option value="201903">2019년 3월</option>
				<option value="201904">2019년 4월</option>
				<option value="201905">2019년 5월</option>
				<option value="201906" selected>2019년 6월</option>
				</select></td>
			</tr>
			<tr>
				<td style="padding-top:20px">구분</td>
			</tr>
			<tr>
				<td><select class="inp" id="sDaytype">
					<option value="ALL">전체</option>
					<option value="주중">주중</option>
					<option value="주말">주말</option>
				</select></td>
			</tr>
			<tr>
			<td style="padding-top:20px">성별</td>
			</tr>
			<tr>
			<td><select class="inp" id="sGender">
				<option value="MF">전체</option>
				<option value="F">여자</option>
				<option value="M">남자</option>
			</select></td>
			</tr>
			<tr>
			<td style="padding-top:20px">연령대</td>
			</tr>
			<tr>
				<td>
					<ul class="ageGroup">
						<li><label><input name="age_group" type="checkbox" value="group12" id="allCheck" checked="checked" />전체</label></li>
						<li><label><input name="age_group" type="checkbox" value="group1" checked="checked" />07~12</label></li>
						<li><label><input name="age_group" type="checkbox" value="group2" checked="checked" />13~18</label></li>
						<li><label><input name="age_group" type="checkbox" value="group3" checked="checked" />19~24</label></li>
						<li><label><input name="age_group" type="checkbox" value="group4" checked="checked" />25~29</label></li>
						<li><label><input name="age_group" type="checkbox" value="group5" checked="checked" />30~34</label></li>
						<li><label><input name="age_group" type="checkbox" value="group6" checked="checked" />35~39</label></li>
						<li><label><input name="age_group" type="checkbox" value="group7" checked="checked" />40~44</label></li>
						<li><label><input name="age_group" type="checkbox" value="group8" checked="checked" />45~49</label></li>
						<li><label><input name="age_group" type="checkbox" value="group9" checked="checked" />50~54</label></li>
						<li><label><input name="age_group" type="checkbox" value="group10" checked="checked" />55~59</label></li>
						<li><label><input name="age_group" type="checkbox" value="group11" checked="checked" />60~69</label></li>
					</ul>
				</td>
			</tr>			
			<!-- <tr>
			<td>
			<table class="ageGroup">
				<span class="inline checkbox_all">
					<span class="checkboxInp">
						<input type="checkbox" name="age_group" class="all" value="group12"  id="all" checked="true"/><label>전체 <br></label>
					</span>
					<span class="checkboxInp">
						<input type="checkbox" name="age_group" value="group1" checked="true" /><label>07-12</label>
					</span>
					<span class="checkboxInp">
						<input type="checkbox" name="age_group" value="group2" checked="true"/><label>13-18</label>
					</span>
					<span class="checkboxInp">
						<input type="checkbox" name="age_group" value="group3" checked="true"/><label>19-24</label>
					</span>
					<span class="checkboxInp">
						<input type="checkbox" name="age_group" value="group4" checked="true"/><label>25-29</label>
					</span>
					<span class="checkboxInp">
						<input type="checkbox" name="age_group" value="group5" checked="true"/><label>30-34</label>
					</span>
					<span class="checkboxInp">
						<input type="checkbox" name="age_group" value="group6" checked="true"/><label>35-39</label>
					</span>
					<span class="checkboxInp">
						<input type="checkbox" name="age_group" value="group7" checked="true"/><label>40-44</label>
					</span>
					<span class="checkboxInp">
						<input type="checkbox" name="age_group" value="group8" checked="true"/><label>45-49</label>
					</span>
					<span class="checkboxInp">
						<input type="checkbox" name="age_group" value="group9" checked="true"/><label>50-54</label>
					</span>
					<span class="checkboxInp">
						<input type="checkbox" name="age_group" value="group10" checked="true" /><label>55-59</label>
					</span>
					<span class="checkboxInp">
						<input type="checkbox" name="age_group" value="group11" checked="true"/><label>60-69</label>
					</span>
				</span>						  
			</table>
			</td>
			</tr> -->
			<tr>
				<td style="padding-top:20px">
					<button type="button" class="amb_btnstyle blue middle bold" id="go" onclick="go();"  style="float:right">분석</button>  
				</td>
			</tr>
		</table>
		</div>
		<div id="contents" >
			<div id="pageTitbg">
			<div id="pageTit"><span class="pageTit">Behavior – Video Usage </span></div>
			</div>
			<div id="datawrap" >
				<div id="area_day_graph" >
					<table class="tablestyG1">
						<tbody>
							<tr>
								<td width='25%'><table class="graphBox"><tr><td id="day_graph1"> </td></tr></table></td>
								<td width='25%'><table class="graphBox"><tr><td id="day_graph2"> </td></tr></table></td>
								<td width='25%'><table class="graphBox"><tr><td id="day_graph3"> </td></tr></table></td>
								<td width='25%'><table class="graphBox"><tr><td id="day_graph4"> </td></tr></table></td>
							</tr>
						</tbody>
					</table>	
				</div>
				<div id="area_time_graph" >
					<table class="tablestyG1">
						<tbody>
							<tr>
								<td width='50%'><table class="graphBox"><tr><td id="time_graph1"> </td></tr></table></td>
								<td width='50%'><table class="graphBox"><tr><td id="time_graph2"> </td></tr></table></td>
							</tr><tr>
								<td width='50%'><table class="graphBox"><tr><td id="time_graph3"> </td></tr></table></td>
								<td width='50%'><table class="graphBox"><tr><td id="time_graph4"> </td></tr></table></td>
							</tr>
						</tbody>
					</table>				
				</div>									
				<div id="result_table" > </div>
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
	
	$(function(){
		$("#allCheck").click(function(){
			if($("#allCheck").prop("checked")) {
				$("input[type=checkbox]").prop("checked",true);
			} else {
				$("input[type=checkbox]").prop("checked",false);
			}
		})
	})

	$.ajax({
		url : "json_video.aspx?v0=byday_video&v1=ALL&v3=MF&v4='ALL'&v5='201901','201902','201903','201904','201905','201906'",
		type : 'GET',
		dataType : 'JSON',
		statusCode : {
		},
		success : function(rcv) {
			data_result(rcv);
		},
		error: function () {
			console.log('error');
		},
		beforeSend:function(){
			$('.wrap-loading').removeClass('display-none');
		}
		,complete:function(){
			$('.wrap-loading').addClass('display-none');
		}	
	});

	function comma(num) {
		var txt = num.toString();
        var comma_txt = txt.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
        return comma_txt;
    }

	function go() {
		var go_flag = true;
        var sIndex = $('#sIndex').val();
        var sMonth = $('#sMonth').val();
        var sGender = $('#sGender').val();
		var sDaytype = $('#sDaytype').val();
        var sAge = $('input[name="age_group"]:checked');
		var age_val
		var age_list = "";	
		var age_list2 = [];
		var target = "";
		var month = ['201808', '201809', '201810', '201811', '201812', '201901', '201902', '201903', '201904', '201905', '201906'];
        var month2 = [NaN];
        month3 = "'";   

		
		for(k=0; k<sAge.length; k++){
			age_val = sAge[k].value;
			age_val = age_val.replace(/[^0-9]/g ,"");
			switch(sAge[k].value){
				case "group1": target = "'07~12'"; break;
				case "group2": target = "'13~18'"; break;
				case "group3": target = "'19~24'"; break;
				case "group4": target = "'25~29'"; break;
				case "group5": target = "'30~34'"; break;
				case "group6": target = "'35~39'"; break;
				case "group7": target = "'40~44'"; break;
				case "group8": target = "'45~49'"; break;
				case "group9": target = "'50~54'"; break;
				case "group10": target = "'55~59'"; break;
				case "group11": target = "'60~69'"; break;
				case "group12": target = "'ALL'"; break;
			}
			age_list = age_list + target + ",";			
			age_list2.push(age_val);
		}
		age_list = age_list.substring(0, age_list.length-1);
		if($('input:checkbox[id="all"]').is(":checked") == true){
			age_list = "'ALL'";
		}
		
		for(var i=0; i<age_list2.length+1; i++){
			if((age_list2[i+1]-age_list2[i]) > 1){
				alert("타겟 오류: 연속적인 연령대 선택만 가능합니다!");
				go_flag = false;
			}
		}
		if(age_list == ''){
			alert("타겟 오류: 선택된 타겟이 없습니다!");
			go_flag = false;
		}
		
		// 검색일자 기준 최근 6개월 계산 
        for(i=0; i<=month.length; i++){
            if(sMonth == month[i]){
                num = i;
            }
        }
        for(j=num-5; j<=num; j++){
            month2.push(month[j]);
            month3 += month[j] + "','";
        }
        month3 = month3.substring(0,month3.length-2); 
		if($('#analtype').val() == 'bytime'){   //분석유형: 시간대별
        	var url = "json_video.aspx";
        	url += "?v0=bytime_video&v1="+ sDaytype + "&v3=" + sGender + "&v4=" + age_list + "&v5=" + sMonth; 
		}
		else if($('#analtype').val() == 'byday'){   //분석유형: 주간별 
			var url = "json_video.aspx";
        	url += "?v0=byday_video&v1="+ sDaytype + "&v3=" + sGender + "&v4=" + age_list + "&v5=" + month3; 
		}
		
        console.log(url);

		if(go_flag){
			$.ajax({
				url : url,
				type : 'GET',
				dataType : 'JSON',
				statusCode : {
				},
				success : function(rcv) {
					data_result(rcv);
				},
				error: function () {
					console.log('error');
				},
				beforeSend:function(){
					$('.wrap-loading').removeClass('display-none');
					}
				,complete:function(){
					$('.wrap-loading').addClass('display-none');
				}
        	});
		}
                    
    }

	var td_title = [NaN];
	var info = [NaN];
	var dbmonth = [NaN];
	var dbmonth2 = [NaN];
	var value1_uv = [NaN];
	var value2_uv = [NaN];
	var value1_tts = [NaN];
	var value2_tts = [NaN];
	var value1_time = [NaN];
	var value2_time = [NaN];
	var value1_user = [NaN];
	var value2_user = [NaN];
	var title_text = '';
	var type_title = '';
	var type_title2 = '';

    function data_result(rcv){
        window.console && console.log(rcv);        
        info        	= rcv["info"];
        td_title    	= rcv["title"];
        dbmonth     	= rcv["dbmonth"];
        value1_uv      	= rcv["value1_uv"];
        value2_uv      	= rcv["value2_uv"];
		value1_tts     	= rcv["value1_tts"];
        value2_tts      = rcv["value2_tts"];
		value1_time     = rcv["value1_time"];
        value2_time     = rcv["value2_time"];
		value1_user     = rcv["value1_user"];
        value2_user     = rcv["value2_user"];
		
		if(info[0] == 'byday_video'){
			usage_html = "";
			usage_html += "<table class='tablesty'><tr><th width='5%' rowspan='2'>분석월</th><th colspan='2'>총이용자수(*1,000명) </th><th colspan='2'>총이용시간(*1,000,000분) </th><th colspan='2'>일평균 이용시간(분) </th><th colspan='2'>일평균 이용률(%)</th></tr>";
			usage_html += "<tr><td width='7%' class='dgray'>" +td_title[0]+ "</td><td width='7%' class='dgray'>" +td_title[1]+ "</td>";
			usage_html += "<td width='7%' class='dgray'>" +td_title[0]+ "</td><td width='7%' class='dgray'>" +td_title[1]+ "</td>";
			usage_html += "<td width='7%' class='dgray'>" +td_title[0]+ "</td><td width='7%' class='dgray'>" +td_title[1]+ "</td>";
			usage_html += "<td width='7%' class='dgray'>" +td_title[0]+ "</td><td width='7%' class='dgray'>" +td_title[1]+ "</td>";
			for(i=0;i<6;i++){
				usage_html += "<tr><td width='7%'>" +dbmonth[i]+ "</td><td width='7%'>" +comma(value1_uv[i])+ "</td><td width='7%'>" +comma(value2_uv[i])+ "</td>";
				usage_html += "<td width='7%'>" +value1_tts[i]+ "</td><td width='7%'>" +value2_tts[i]+ "</td>";
				usage_html += "<td width='7%'>" +value1_time[i]+ "</td><td width='7%'>" +value2_time[i]+ "</td>";
				usage_html += "<td width='7%'>" +value1_user[i]+ "</td><td width='7%'>" +value2_user[i]+ "</td>";
			}

			$('#result_table').html(usage_html);
			$('#area_day_graph').show();
			$('#area_time_graph').hide();
			
			dbmonth2 = dbmonth.map( (item) => { 
				return String(item).substring(2); 
			});					

			drawGraph_day1();                 	
			drawGraph_day2();   
			drawGraph_day3();   
			drawGraph_day4();   

		}
		else if(info[0] == 'bytime_video'){
			usage_html = "";
			usage_html += "<table class='tablesty'>";
			usage_html += "<table class='tablesty'><tr><th width='5%' rowspan='2'>분석월</th><th width='5%' rowspan='2'>시간대</th><th colspan='2'>총이용자수(*1,000명) </th><th colspan='2'>총이용시간(*1,000,000분) </th><th colspan='2'>일평균 이용시간(분) </th><th colspan='2'>일평균 이용률(%)</th></tr>";
		
			usage_html += "<tr><td width='7%' class='dgray'>" +td_title[0]+ "</td><td width='7%' class='dgray'>" +td_title[1]+ "</td>";
			usage_html += "<td width='7%' class='dgray'>" +td_title[0]+ "</td><td width='7%' class='dgray'>" +td_title[1]+ "</td>";
			usage_html += "<td width='7%' class='dgray'>" +td_title[0]+ "</td><td width='7%' class='dgray'>" +td_title[1]+ "</td>";
			usage_html += "<td width='7%' class='dgray'>" +td_title[0]+ "</td><td width='7%' class='dgray'>" +td_title[1]+ "</td>";

			usage_html += "<tr><td rowspan='24'>"+dbmonth[0]+"</td><td>0 시대</td><td>"+comma(value1_uv[0])+"</td><td>"+comma(value2_uv[0])+"</td>";
			usage_html += "<td>"+comma(value1_tts[0])+"</td><td>"+comma(value2_tts[0])+"</td>";
			usage_html += "<td>"+comma(value1_time[0])+"</td><td>"+comma(value2_time[0])+"</td>";
			usage_html += "<td>"+comma(value1_user[0])+"</td><td>"+comma(value2_user[0])+"</td></tr>";
			for(k=1; k<24; k++){
				usage_html += "<tr><td>" + k + " 시대</td><td>" + comma(value1_uv[k])+ "</td><td>" + comma(value2_uv[k])+"</td>";
				usage_html += "<td>" + comma(value1_tts[k])+ "</td><td>" + comma(value2_tts[k])+"</td>";
				usage_html += "<td>" + comma(value1_time[k])+ "</td><td>" + comma(value2_time[k])+"</td>";
				usage_html += "<td>" + comma(value1_user[k])+ "</td><td>" + comma(value2_user[k])+"</td></tr>";				
			}				
			usage_html += "</table> ";				

			$('#result_table').html(usage_html);			
			$('#area_time_graph').show();
			$('#area_day_graph').hide();

			drawGraph_time1(); 
			drawGraph_time2(); 
			drawGraph_time3(); 
			drawGraph_time4(); 
		}				
	}

	//var myChart;
	var colors = ['#00aeef', '#8dc63f'];
	function drawGraph_day1(){
		var dom = document.getElementById("day_graph1");
		var myChart = echarts.init(dom);
		var app = {};
		option = null;		
		option = {
			//color: colors,
			textStyle:{
				color: '#000000'
			},
			title: {
				text: "영상서비스 총이용자수(*1,000명) - " + info[2],
				left: 'center',
				textStyle:{
					fontSize: 12
				},
				padding: 8
			},
			tooltip: {
				backgroundColor: '#666',
				trigger: 'axis',
				textStyle:{fontSize: 10}
			},			
			legend: {				
				orient: 'horizontal',
				top: 23,
				data: td_title,
				textStyle:{
					fontSize: 10
				},
			},				
			grid: {
				left: '3%',
				right: '10%',
				bottom: '3%',
				containLabel: true,
				borderColor: '#ccc',
				show: true,							
			},			
			xAxis: {
				axisLabel : {textStyle:{fontSize: 10}},
				type: 'category',
				data: dbmonth2,
				axisLine: {
					lineStyle: {
					color: '#c6c6c6'
					}
				},
			},
			yAxis: [{
					axisLabel : {textStyle:{fontSize: 10}},
					type: 'value',
					// min: 'dataMin',
					axisLine: {
						lineStyle: {
						color: '#c6c6c6'
						}
					}},  
			],
			series: [
				{
					name: td_title[0],
					data: value1_uv,
					type: 'bar',
					color: colors[0],										
				},
				{
					name: td_title[1],
					data: value2_uv,
					type: 'bar',
					color: colors[1]
				},

			]
		};
		;
		if (option && typeof option === "object") {
			myChart.setOption(option, true);		
		}
		$(function () {
			// Resize chart on menu width change and window resize
			$(window).on('resize', resize);
			$(".menu-toggle").on('click', resize);
			// Resize function
			function resize() {
				setTimeout(function() {
					// Resize chart
					myChart.resize();
				}, 200);
			}
		});
	}
    
	function drawGraph_day2(){
		var dom = document.getElementById("day_graph2");
		var myChart = echarts.init(dom);
		var app = {};
		option = null;
		option = {
			textStyle:{
				color: '#000000'
			},
			title: {
				text: "영상서비스 총이용시간(1,000,000분) - " + info[2],
				left: 'center',
				textStyle:{
					fontSize: 12
				},
				padding: 8
			},
			tooltip: {
				backgroundColor: '#666',
				trigger: 'axis',
				textStyle:{fontSize: 10}
			},			
			legend: {				
				orient: 'horizontal',
				top: 23,
				data: td_title,
				textStyle:{
					fontSize: 10
				},
			},				
			grid: {
				left: '3%',
				right: '10%',
				bottom: '3%',
				containLabel: true,
				borderColor: '#ccc',
				show: true,							
			},			
			xAxis: {
				axisLabel : {textStyle:{fontSize: 10}},
				type: 'category',
				data: dbmonth2,
				axisLine: {
					lineStyle: {
					color: '#c6c6c6'
					}
				},
			},
			yAxis: [{
					axisLabel : {textStyle:{fontSize: 10}},
					type: 'value',
					// min: 'dataMin',
					axisLine: {
						lineStyle: {
						color: '#c6c6c6'
						}
					}},  
			],
			series: [
				{
					name: td_title[0],
					data: value1_tts,
					type: 'bar',
					color: colors[0],										
				},
				{
					name: td_title[1],
					data: value2_tts,
					type: 'bar',
					color: colors[1]
				},

			]
		};
		;
		if (option && typeof option === "object") {
			myChart.setOption(option, true);		
		}
		$(function () {
			// Resize chart on menu width change and window resize
			$(window).on('resize', resize);
			$(".menu-toggle").on('click', resize);
			// Resize function
			function resize() {
				setTimeout(function() {
					// Resize chart
					myChart.resize();
				}, 200);
			}
		});
	}    

	function drawGraph_day3(){
		var dom = document.getElementById("day_graph3");
		var myChart = echarts.init(dom);
		var app = {};
		option = null;
		option = {
			textStyle:{
				color: '#000000'
			},
			title: {
				text: "영상서비스 일평균 이용시간(분) - " + info[2],
				left: 'center',
				textStyle:{
					fontSize: 12
				},
				padding: 8
			},
			tooltip: {
				backgroundColor: '#666',
				trigger: 'axis',
				textStyle:{fontSize: 10}
			},			
			legend: {				
				orient: 'horizontal',
				top: 23,
				data: td_title,
				textStyle:{
					fontSize: 10
				},
			},				
			grid: {
				left: '3%',
				right: '10%',
				bottom: '3%',
				containLabel: true,
				borderColor: '#ccc',
				show: true,							
			},			
			xAxis: {
				axisLabel : {textStyle:{fontSize: 10}},
				type: 'category',
				data: dbmonth2,
				axisLine: {
					lineStyle: {
					color: '#c6c6c6'
					}
				},
			},
			yAxis: [{
					axisLabel : {textStyle:{fontSize: 10}},
					type: 'value',
					// min: 'dataMin',
					axisLine: {
						lineStyle: {
						color: '#c6c6c6'
						}
					}},  
			],
			series: [
				{
					name: td_title[0],
					data: value1_time,
					type: 'bar',
					color: colors[0],										
				},
				{
					name: td_title[1],
					data: value2_time,
					type: 'bar',
					color: colors[1]
				},

			]
		};
		;
		if (option && typeof option === "object") {
			myChart.setOption(option, true);		
		}
		$(function () {
			// Resize chart on menu width change and window resize
			$(window).on('resize', resize);
			$(".menu-toggle").on('click', resize);
			// Resize function
			function resize() {
				setTimeout(function() {
					// Resize chart
					myChart.resize();
				}, 200);
			}
		});
	}

	function drawGraph_day4(){
		var dom = document.getElementById("day_graph4");
		var myChart = echarts.init(dom);
		var app = {};
		option = null;
		option = {
			textStyle:{
				color: '#000000'
			},
			title: {
				text: "영상서비스 일평균 이용률(%) - " + info[2],
				left: 'center',
				textStyle:{
					fontSize: 12
				},
				padding: 8
			},
			tooltip: {
				backgroundColor: '#666',
				trigger: 'axis',
				textStyle:{fontSize: 10}
			},			
			legend: {				
				orient: 'horizontal',
				top: 23,
				data: td_title,
				textStyle:{
					fontSize: 10
				},
			},				
			grid: {
				left: '3%',
				right: '10%',
				bottom: '3%',
				containLabel: true,
				borderColor: '#ccc',
				show: true,							
			},			
			xAxis: {
				axisLabel : {textStyle:{fontSize: 10}},
				type: 'category',
				data: dbmonth2,
				axisLine: {
					lineStyle: {
					color: '#c6c6c6'
					}
				},
			},
			yAxis: [{
					axisLabel : {textStyle:{fontSize: 10}},
					type: 'value',
					// min: 'dataMin',
					axisLine: {
						lineStyle: {
						color: '#c6c6c6'
						}
					}},  
			],
			series: [
				{
					name: td_title[0],
					data: value1_user,
					type: 'bar',
					color: colors[0],										
				},
				{
					name: td_title[1],
					data: value2_user,
					type: 'bar',
					color: colors[1]
				},

			]
		};
		;
		if (option && typeof option === "object") {
			myChart.setOption(option, true);		
		}
		$(function () {
			// Resize chart on menu width change and window resize
			$(window).on('resize', resize);
			$(".menu-toggle").on('click', resize);
			// Resize function
			function resize() {
				setTimeout(function() {
					// Resize chart
					myChart.resize();
				}, 200);
			}
		});
	}
	
	var timezone = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23'];
	function drawGraph_time1(){
        var dom = document.getElementById("time_graph1");
		var myChart = echarts.init(dom);
		var app = {};
		option = null;
		
		option = {
			textStyle:{
				color: '#000000'
			},
			title: {
				text: "영상서비스 총 이용자수(*1,000명) - " + info[2],
				left: 'center',
				textStyle:{
					fontSize: 12
				},
				padding: 8
			},
			tooltip: {
				backgroundColor: '#666',
				trigger: 'axis',
				textStyle:{fontSize: 10}
			},			
			legend: {				
				orient: 'horizontal',
				top: 23,
				data: td_title,
				textStyle:{
					fontSize: 10
				},
			},				
			grid: {
				left: '3%',
				right: '10%',
				bottom: '3%',
				containLabel: true,
				borderColor: '#ccc',
				show: true,							
			},			
			xAxis: {
				axisLabel : {textStyle:{fontSize: 10}},
				name: '시간대',
				type: 'category',
				data: timezone,
				axisLine: {
					lineStyle: {
					color: '#c6c6c6'
					}
				},
			},
			yAxis: [{
					axisLabel : {textStyle:{fontSize: 10}},
					type: 'value',
					axisLine: {
						lineStyle: {
						color: '#c6c6c6'
						}
					}},  
			],
			series: [
				{
					name: td_title[0],
					data: value1_uv,
					type: 'line',
					color: colors[0],										
				},
				{
					name: td_title[1],
					data: value2_uv,
					type: 'line',
					color: colors[1]
				}
			]
		};
		;
		if (option && typeof option === "object") {
			myChart.setOption(option, true);		
		}	
	}
	
	function drawGraph_time2(){
        var dom = document.getElementById("time_graph2");
		var myChart = echarts.init(dom);
		var app = {};
		option = null;
		
		option = {
			textStyle:{
				color: '#000000'
			},
			title: {
				text: "영상서비스 총 이용시간(*1,000,000분) - " + info[2],
				left: 'center',
				textStyle:{
					fontSize: 12
				},
				padding: 8
			},
			tooltip: {
				backgroundColor: '#666',
				trigger: 'axis',
				textStyle:{fontSize: 10}
			},			
			legend: {				
				orient: 'horizontal',
				top: 23,
				data: td_title,
				textStyle:{
					fontSize: 10
				},
			},				
			grid: {
				left: '3%',
				right: '10%',
				bottom: '3%',
				containLabel: true,
				borderColor: '#ccc',
				show: true,							
			},			
			xAxis: {
				axisLabel : {textStyle:{fontSize: 10}},
				name: '시간대',
				type: 'category',
				data: timezone,
				axisLine: {
					lineStyle: {
					color: '#c6c6c6'
					}
				},
			},
			yAxis: [{
					axisLabel : {textStyle:{fontSize: 10}},
					type: 'value',
					axisLine: {
						lineStyle: {
						color: '#c6c6c6'
						}
					}},  
			],
			series: [
				{
					name: td_title[0],
					data: value1_tts,
					type: 'line',
					color: colors[0],										
				},
				{
					name: td_title[1],
					data: value2_tts,
					type: 'line',
					color: colors[1]
				}
			]
		};
		;
		if (option && typeof option === "object") {
			myChart.setOption(option, true);		
		}		
	}

	function drawGraph_time3(){
        var dom = document.getElementById("time_graph3");
		var myChart = echarts.init(dom);
		var app = {};
		option = null;
		
		option = {
			textStyle:{
				color: '#000000'
			},
			title: {
				text: "영상서비스 일평균 이용시간(분) - " + info[2],
				left: 'center',
				textStyle:{
					fontSize: 12
				},
				padding: 8
			},
			tooltip: {
				backgroundColor: '#666',
				trigger: 'axis',
				textStyle:{fontSize: 10}
			},			
			legend: {				
				orient: 'horizontal',
				top: 23,
				data: td_title,
				textStyle:{
					fontSize: 10
				},
			},				
			grid: {
				left: '3%',
				right: '10%',
				bottom: '3%',
				containLabel: true,
				borderColor: '#ccc',
				show: true,							
			},			
			xAxis: {
				axisLabel : {textStyle:{fontSize: 10}},
				name: '시간대',
				type: 'category',
				data: timezone,
				axisLine: {
					lineStyle: {
					color: '#c6c6c6'
					}
				},
			},
			yAxis: [{
					axisLabel : {textStyle:{fontSize: 10}},
					type: 'value',
					axisLine: {
						lineStyle: {
						color: '#c6c6c6'
						}
					}},  
			],
			series: [
				{
					name: td_title[0],
					data: value1_time,
					type: 'line',
					color: colors[0],										
				},
				{
					name: td_title[1],
					data: value2_time,
					type: 'line',
					color: colors[1]
				}
			]
		};
		;
		if (option && typeof option === "object") {
			myChart.setOption(option, true);		
		}
	}

function drawGraph_time4(){
        var dom = document.getElementById("time_graph4");
		var myChart = echarts.init(dom);
		var app = {};
		option = null;
		
		option = {
			textStyle:{
				color: '#000000'
			},
			title: {
				text: "영상서비스 일평균 이용률(%) - " + info[2],
				left: 'center',
				textStyle:{
					fontSize: 12
				},
				padding: 8
			},
			tooltip: {
				backgroundColor: '#666',
				trigger: 'axis',
				textStyle:{fontSize: 10}
			},			
			legend: {				
				orient: 'horizontal',
				top: 23,
				data: td_title,
				textStyle:{
					fontSize: 10
				},
			},				
			grid: {
				left: '3%',
				right: '10%',
				bottom: '3%',
				containLabel: true,
				borderColor: '#ccc',
				show: true,							
			},			
			xAxis: {
				axisLabel : {textStyle:{fontSize: 10}},
				name: '시간대',
				type: 'category',
				data: timezone,
				axisLine: {
					lineStyle: {
					color: '#c6c6c6'
					}
				},
			},
			yAxis: [{
					axisLabel : {textStyle:{fontSize: 10}},
					type: 'value',
					axisLine: {
						lineStyle: {
						color: '#c6c6c6'
						}
					}},  
			],
			series: [
				{
					name: td_title[0],
					data: value1_user,
					type: 'line',
					color: colors[0],										
				},
				{
					name: td_title[1],
					data: value2_user,
					type: 'line',
					color: colors[1]
				}
			]
		};
		;
		if (option && typeof option === "object") {
			myChart.setOption(option, true);		
		}
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