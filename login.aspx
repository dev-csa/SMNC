<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="StyleSheet" HREF="css/style.css" type="text/css"/>
<title>TOTAL ADS RATING</title>
</head>
<body>
<form id="from1" runat="server">
<div id="container">
  <div id="login">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="50%">
        <div class="loginLeft">
        	<div class="logoArea"><img src="images/logo2.gif" width="44" height="45" /></div>
            <div class="subLogo"><span class="mainTB">T</span>OTAL <span class="mainTB">A</span>DS <span class="mainTB">R</span>ATING</span></div>
            <div class="logoText">TV,PC,Mobile 동영상광고의 통합광고효과를<br /> 닐슨의 실측데이터로 분석한 최적의 솔루션</div>
        </div></td>
        <td width="50%">
        <div class="loginRight">
        	<div class="loginTit">LOGIN</div>
            <div class="loginForm">
			        <asp:TextBox  id="txtusername" runat="server" type="text" class="loginInput" placeholder="사용자ID" value="" />
				      <asp:TextBox  id="txtpassword" runat="server" TextMode="Password" class="loginInput" placeholder="비밀번호" value="" />
            </div>
            <div class="loginText">로그인이 안되시면, <a href="mailto:heejin.cho@nielsen.com" style="color: #5a6372">heejin.cho@nielsen.com</a> 으로 문의하시기 바랍니다.</div>
			<!-- <div class="loginBtn"><span class="leftBtn"><a href="#" class="button blue" style="padding: 10px 20px 10px 20px">로그인</a></span></div> -->
			      <div class="loginBtn"><asp:button id="btnsubmit" runat="server" type="button" class="button blue" style="padding: 10px 20px 10px 20px" onclick="btnsubmit_Click" text="로그인" /></div>
        </div>
        </td>
      </tr>
    </table>
  </div>
   

</div>
</form>
</body>
</html>

