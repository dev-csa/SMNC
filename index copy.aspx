<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- #include file ="inc_headMeta.htm" -->  
<title>TOTAL ADS RATING</title>
</head>
<body>
<div id="container">
  <div id="header">
    <h1 class="logo"><a href="#" title="SBS M&C" target="_blank">nielsen</a></h1>
  </div> 
  <div id="leftbar1">
	<ul class="leftMenu">		
		<li class="leftMenuLi"><a href="#" class="menuLink"><img src="images/btn_left01.gif" /><img src="images/btn_left01_over.gif" class="over"></a>
		<!-- "서브메뉴영역"> -->
		<ul class="submenu">
			<li><a class="submenuLinkT" href="overview.aspx">Overview</a></li>
		</ul>
		 
	  	</li>
		<li class="leftMenuLi"><a href="#" class="menuLink"><img src="images/btn_left02.gif" /><img src="images/btn_left02_over.gif" class="over"></a>
		 <!-- "서브메뉴영역">	 -->
			<ul class="submenu">
				 <li><a class="submenuLinkT" href="#">Behavior</a></li>
			  <li><a class="submenuLink" href="usage_by_target.aspx">Usage by Target</a></li>
			  <li><a class="submenuLink" href="usage_by_time.aspx">Usage by Time of day</a></li>
        <li><a class="submenuLink" href="usage_by_day.aspx">Usage by Day of week</a></li>
        <li><a class="submenuLink" href="usage_video.aspx">Video Usage</a></li>
			</ul>
			
	   </li>
			<li class="leftMenuLi"><a href="#" class="menuLink"><img src="images/btn_left03.gif" /><img src="images/btn_left03_over.gif" class="over"></a>
			<!-- "서브메뉴영역"> -->
			<ul class="submenu">
				 <li><a class="submenuLinkT" href="#">Planning</a></li>
			  <li><a class="submenuLink" href="#">Budget Optimization</a></li>
			  <li><a class="submenuLink" href="#">Simulation</a></li>
			  <li><a class="submenuLink" href="#">Reach Curves</a></li>
			  <li><a class="submenuLink" href="#">Optimize Reach Curves</a></li>
			</ul>
			
		</li>
			<li class="leftMenuLi"><a href="#" class="menuLink"><img src="images/btn_left04.gif" /><img src="images/btn_left04_over.gif" class="over"></a>
			<!-- "서브메뉴영역"> -->
			<ul class="submenu">
				 <li><a class="submenuLinkT" href="#">Evaluate</a></li>
			  <li><a class="submenuLink" href="#">3S Post-Buy</a></li>
			  <li><a class="submenuLink" href="#">3S Performance</a></li>
			   </ul>
			
			</li>
		</ul>
	</div>	
<div id="leftbar2"></div>
  <div id="contents">
    <div id="pageTitbg">
        <div id="pageTit"><span class="pageTit">TOTAL ADS RATING</span></div>
      </div>
      <div id="datawrap">
          <div class="rowBox section03 bgGray">
          <table class="graphBox2">
              <!-- 좌측 스크린 이용률 chart -->
              <tr>
                <td style="height: 200px">
                  <span class="date">개인전체 2019년 1분기 기준</span>
                  <label class="tit"><span class="title">스크린 이용률</span></label>
                  <div class="chartArea">
                    <div class="cahrtUnit">
                      <div class="pie" data-value="90.9" data-color="#f56c5f"></div>
                      <div class="legend">TV</div>
                    </div>
                    <div class="cahrtUnit">
                      <div class="pie" data-value="75.4" data-color="#494a4e"></div>
                      <div class="legend">PC</div>
                    </div>
                    <div class="cahrtUnit">
                      <div class="pie" data-value="90.2" data-color="#57a3aa"></div>
                      <div class="legend">Mobile</div>
                    </div>
                  </div>
                </td>
              </tr>
              <script>
              $('.cahrtUnit .pie').each(function(index, element) {
                var num      = $(this).attr('data-value');
                var color    = $(this).attr('data-color');
                var pie      = (25)*2*3.1475;    // 원 둘레 길이
                var percent  = (pie*num)/100;  // 채워질 길이 즉 해당 퍼센트
                var chart = '<svg viewBox="0 0 50 50"><circle class="circleBg" r="25" cx="25" cy="25"/><circle class="circle" r="25" cx="25" cy="25" /></svg>';
                  $(this).html(chart);
                  $(this).find('.circle').css({
                    'stroke-dasharray': percent + ' 1000',
                    'stroke': color,
                  });
                  $(this).append('<div class="percentBox">' + num + '<em class="unit">%</em></div>');
              });
              </script>
              
            </table>        

        <div id="description">TV, PC, Mobile 동영상광고의 통합광고효과를 닐슨의 실측데이터로 분석한 최적의 솔루션</div>
        <table class="tablestyG1">
          <tr>
            <td width="50%" valign="top">
            
            <table class="graphBox2">
              <tr>
                <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td class="blackTitB">광고 도달률</td>
                  </tr>
                  <tr>
                    <td align="center">

                        <div class="g_column w_2_1">
                            <div class="contBox bgWhite">
                              <span class="date">개인전체 2019년 1분기 기준</span>
                              <label class="tit"><span class="title">스크린 이용률</span></label>
                              <div class="chartArea">
                                <div class="cahrtUnit">
                                  <div class="pie" data-value="90.9" data-color="#f56c5f"></div>
                                  <div class="legend">TV</div>
                                </div>
                                <div class="cahrtUnit">
                                  <div class="pie" data-value="75.4" data-color="#494a4e"></div>
                                  <div class="legend">PC</div>
                                </div>
                                <div class="cahrtUnit">
                                  <div class="pie" data-value="90.2" data-color="#57a3aa"></div>
                                  <div class="legend">Mobile</div>
                                </div>
                              </div>
                            </div>
                          </div>

                    </td>
                  </tr>
                </table>
                </td>
              </tr>
            </table>
            <table class="graphBox2">
              <tr>
                <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td class="blackTitB">스크린이용자의 성 구성비</td>
                  </tr>
                  <tr>
                    <td align="center"><img src="images/index_g2.gif" /></td>
                  </tr>
                </table>
                </td>
              </tr>
            </table>
            </td>
            <td width="50%" valign="top">
              <table class="graphBox2">
              <tr>
                <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td class="blackTitB">스크린 총 광고비</td>
                  </tr>
                  <tr>
                    <td align="center"><img src="images/index_g3.gif" /></td>
                  </tr>
                </table>
                </td>
              </tr>
            </table>
            <table class="graphBox2">
              <tr>
                <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td class="blackTitB">스크린이용자의 연령 구성비</td>
                  </tr>
                  <tr>
                    <td align="center"><img src="images/index_g4.gif" /></td>
                  </tr>
                </table>
                </td>
              </tr>
            </table>
            
            
            </td>
          </tr>
        </table>
        <div id="footer">Copyright © Nielsen Company. All rights reserved. </div>
      </div>
  </div>
</div>
</body>
</html>

