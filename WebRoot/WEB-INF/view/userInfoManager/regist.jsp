 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'loginAndRegist.jsp' starting page</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<c:url value='/js/createRandomNum.js'/>"></script>

    <style type="text/css">
        a:visited {color: red;}
        a:link{	color:red;}
        a:hover {color: red;}
        a:active {color: red;}
        #regist:visited{color: white;}
        #regist:link{color:white;}
        #regist:hover{color: red;}
        #regist:active{color: red;}
        
		#code {
		color: white;
		font-size:160%;
		text-align:center;
		line-height:50px;
		font-style:italic;
		}
		.unchanged {
		border: 0;
        }
    </style>
    
    <script type="text/javascript">
        function inputCheck(){
            var inputCode = document.getElementById("inputCode").value.replace(/\s/g, "");
            var inputCodeColor = document.getElementById("inputCodeSpan").style.borderColor;
            var phoneNumber = document.getElementById("phoneNumber").value.replace(/\s/g, "");
            var phoneCheckCode = document.getElementById("phoneCheckCode").value.replace(/\s/g, "");
            var inputCode1 = document.getElementById("inputCode1").value.replace(/\s/g, "");
            var inputCode2 = document.getElementById("inputCode2").value.replace(/\s/g, "");
            var inputCode2SpanColor = document.getElementById("inputCode2Span").style.borderColor;
            
            if(inputCode=="验证码" || inputCodeColor=="red" || phoneNumber=="请输入手机号"  || phoneCheckCode=="填写手机验证码" || inputCode1=="设置登录密码" || inputCode2=="再次输入密码" || inputCode2SpanColor=="red")
            {
                if(inputCode=="验证码"){document.getElementById("inputCodeSpan").style.borderColor='red';}
                if(phoneNumber=="请输入手机号"){document.getElementById("phoneNumberSpan").style.borderColor='red';}
                if(phoneCheckCode=="填写手机验证码"){document.getElementById("phoneCheckCodeSpan").style.borderColor='red';}
                if(inputCode1=="设置登录密码"){document.getElementById("inputCode1Span").style.borderColor='red';}
                if(inputCode2=="再次输入密码"){document.getElementById("inputCode2Span").style.borderColor='red';}
                return false;
            }else{
                return true;
            }   
        }
        
        function changeSpan(obj){
            if(obj.id=="phoneNumber"){document.getElementById("phoneNumberSpan").style.borderColor='gray';}
            else if(obj.id=="phoneCheckCode"){document.getElementById("phoneCheckCodeSpan").style.borderColor='gray';}
            else if(obj.id=="inputCode1"){document.getElementById("inputCode1Span").style.borderColor='gray';}
            else if(obj.id=="inputCode2"){document.getElementById("inputCode2Span").style.borderColor='gray';}
        }
        
        function checkCode(obj){
            if(obj.value.replace(/\s/g, "")=="再次输入密码"){
               document.getElementById("inputCode2Span").style.borderColor='gray';
            }else{
                if(obj.value.replace(/\s/g, "")==document.getElementById("inputCode1").value.replace(/\s/g, "")){
                document.getElementById("inputCode2Span").style.borderColor='gray';
            }else{
               document.getElementById("inputCode2Span").style.borderColor='red';
            }
            }   
        }
  </script>
  </head>
  
  <body id="bg" onload="createCode()">
      <div style="float:left;margin-left:10%;width:80%;height:70px;border-bottom:1px solid gray;">
          <img src="./images/login/tb1.jpg" width="20%" height="70px"/>
          <a class="aa" href="${pageContext.request.contextPath }/market/First" style="float:right;margin-top:45px;text-decoration:none;">商城首页</a>
      </div>
      <div style="float:left;margin-left:22%;margin-top:110px;width:30%;height:330px;">
          <span style="float:left;width:100%;height:270px;"><img src="./images/login/tb2.jpg" width="100%" height="270px"/></span>
          <span style="float:left;width:100%;height:60px;">
              <span style="float:left;margin-left:18%;width:30%;height:30px;"><img src="./images/login/tb3.jpg" width="100%" height="30px"/></span>
              <span style="float:left;width:50%;height:30px;font-size:120%;">|  校园便利平台</span>
          </span>
      </div>
<form action="${pageContext.request.contextPath}/person/user/registCheck?page=${pageSource}" method="post" onsubmit="return inputCheck();"> 
      <div id="regist-view" style="float:left;margin-left:8%;width:27%;margin-top:40px;height:510px;">
          <table width="100%" height="490px">
              <tr height="70px"><td>
                  <span style="float:left;width:100%;height:30px;border-bottom:2px solid red;">
                      <span style="float:left;width:40%;height:30px;color:gray;font-size:130%;">注册新用户</span>
                      <span style="float:right;height:30px;color:gray;">我已经注册，现在就<a id="gotoReg" href="${pageContext.request.contextPath }/person/user/login?pageSource=${pageSource}" style="text-decoration:none;font-size:90%;">登录</a></span>
                  </span>
              </td></tr>
          
              <tr height="70px"><td>
                  <span id="inputCodeSpan" style="float:left;width:55%;height:45px;background:white;border:1px solid gray;"><input id="inputCode" type="text" maxlength="6" value="验证码" style="margin-left:5%;width:95%;border:0px;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="value=value.replace(/[\W]/g,'');" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" onfocus="javascript:if(this.value=='验证码')this.value='';" onblur="javascript:if(this.value=='')this.value='验证码';validate();"></span>
                  <span  id="code" title="看不清，换一张" style="float:right;width:35%;height:45px;background:red;opacity:0.7;border:1px solid gray;cursor:pointer;" onclick="createCode()"></span>
              </td></tr>
              <tr height="70px"><td>
                  <span id="phoneNumberSpan" style="float:left;width:55%;height:45px;background:white;border:1px solid gray;"><input name="userTel" id="phoneNumber" type="text" value="请输入手机号" maxlength="11" style="margin-left:5%;width:95%;border:0px;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onfocus="javascript:if(this.value=='请输入手机号')this.value='';changeSpan(this);" onblur="javascript:if(this.value=='')this.value='请输入手机号';"></span>
                  <a id="gotoReg" href="javascript:void(0);" style="text-decoration:none;font-size:90%;"><span style="float:right;width:35%;height:45px;line-height:40px;background:#F5F5F5;text-align:center;border:1px solid gray;">获取短信验证码</span></a>
              </td></tr>
              <tr height="70px"><td>
                  <span id="phoneCheckCodeSpan" style="float:left;width:100%;height:45px;background:white;border:1px solid gray;"><input id="phoneCheckCode" type="text" maxlength="6" value="填写手机验证码" style="margin-left:3%;width:95%;border:0px;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onfocus="javascript:if(this.value=='填写手机验证码')this.value='';changeSpan(this);" onblur="javascript:if(this.value=='')this.value='填写手机验证码';"></span>
              </td></tr>
              <tr height="70px"><td>
                  <span id="inputCode1Span" style="float:left;width:100%;height:45px;background:white;border:1px solid gray;"><input id="inputCode1" type="text" maxlength="20" value="设置登录密码" style="margin-left:3%;width:95%;border:0px;height:100%;font-size:102%;color:#A0A0A0;" onfocus="javascript:if(this.value=='设置登录密码')this.value='';this.type='password';changeSpan(this);" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" onblur="javascript:if(this.value=='')this.value='设置登录密码';if(this.value=='设置登录密码')this.type='text';"></span>
              </td></tr>
              <tr height="70px"><td>
                  <span id="inputCode2Span" style="float:left;width:100%;height:45px;background:white;border:1px solid gray;"><input name="userPwd" id="inputCode2" type="text" maxlength="20" value="再次输入密码" style="margin-left:3%;width:95%;border:0px;height:100%;font-size:102%;color:#A0A0A0;" onfocus="javascript:if(this.value=='再次输入密码')this.value='';this.type='password';changeSpan(this);" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" onblur="javascript:if(this.value=='')this.value='再次输入密码';if(this.value=='再次输入密码')this.type='text';" onmouseout="checkCode(this);"></span>
              </td></tr>
              <tr height="70px"><td>
                  <a id="regist" href="javascript:void(0);" style="text-decoration:none;font-size:90%;">
                     <input type="submit" value="立即注册" style="text-align:center;line-height:40px;font-size:120%;float:left;width:100%;height:45px;background:#9A9A9A;border:1px solid gray;cursor:pointer;"/>
                  </a> 
              </td></tr>
          </table>
      </div>
</form>
      <div style="float:left;margin-left:10%;margin-top:30px;width:80%;height:70px;">
          <span style="float:left;width:100%;margin-top:20px;height:20px;text-align:center;color:gray;font-size:80%;">Copyright 2018 - 2028 jim.com All Rights Reserved 京ICP证100557号 京公网安备112310102004579号 出版物经营许可证新出发京批字第直1141328号</span>
          <span style="float:left;margin-left:25%;width:50%;background:pink;height:70px;"><img src="./images/login/bottom.jpg" width="100%" height="70px"/></span>
      </div>
  </body>
</html>
