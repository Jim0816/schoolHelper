<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'findCode.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <style type="text/css">
        a:visited{color: #2A8ECC;}
        a:link{color:#2A8ECC;}
        a:hover{color: red;}
        a:active{color: red;}
        .b:visited {color: gray;}
        .b:link{color:gray;}
        .b:hover {color: red;}
        .b:active {color: red;}
        
		.top {
			background-color: white;
			border-bottom:1px solid black;
			float: left;
			height: 80px;
			width: 70%;
			margin-left: 15%;
		}
		.middle {
			float: left;
			margin-top:10px;
			height: 650px;
			width: 70%;
			margin-left: 15%;
			border:1px solid #DCDFE5;
		}
		.bottom {
			background-color: white;
			float: left;
			height: 100px;
			width: 70%;
			margin-left: 15%;
		}
    </style>
    <script type="text/javascript">
        function Check(){
            return true;
        }
    </script>
  </head>
  
  <body>
      <div class="top">
          <img src="./images/login/tb1.jpg" width="20%" height="70px"/>
          <a class="b" href="${pageContext.request.contextPath }/market/First" style="float:right;margin-top:45px;text-decoration:none;">商城首页</a>
      </div>
<form action="${pageContext.request.contextPath}/person/user/updateCode?pageSource=${pageSource}" method="post" onsubmit="return Check();">
      <div class="middle">
          <span style="float:left;margin-left:10%;width:80%;height:60px;border-bottom:1px solid black;font-size:120%;color:red;line-height:80px;">
              <font style="float:left;">找回密码</font>
              <a href="${pageContext.request.contextPath}/person/user/login?pageSource=${pageSource}"><span style="float:right;margin-top:10px;text-align:center;width:40px;height:40px;background:red;border-radius:50px;color:white;font-size:80%;line-height:40px;">登录</span></a>
          </span>
          <div style="float:left;margin-left:30%;width:40%;height:500px;">
              <table width="100%" height="490px">
	              <tr height="70px"><td>
	                  <span style="float:left;width:100%;height:30px;border-bottom:2px solid red;">
	                      <span style="float:left;width:40%;height:30px;color:gray;font-size:130%;">找回密码</span>
	                  </span>
	              </td></tr>
	              <tr height="70px"><td>
	                  <span style="float:left;width:100%;height:45px;background:white;border:1px solid gray;"><input name="userId" type="text" maxlength="11" value="请输入账号" style="margin-left:3%;width:95%;border:0px;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onfocus="javascript:if(this.value=='请输入账号')this.value='';this.style.borderColor='black';" onblur="javascript:if(this.value=='')this.value='请输入账号';"></span>
	              </td></tr>
	              <tr height="70px"><td>
	                  <span style="float:left;width:60%;height:45px;background:white;border:1px solid gray;"><input name="userTel" type="text" maxlength="11" value="请输入手机号"  style="margin-left:3%;width:95%;border:0px;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onfocus="javascript:if(this.value=='请输入手机号')this.value='';" onblur="javascript:if(this.value=='')this.value='请输入手机号';"></span>
	                  <a  href="javascript:void(0);" style="text-decoration:none;font-size:90%;"><span style="float:left;margin-left:5%;width:33%;height:45px;line-height:40px;background:#F5F5F5;text-align:center;border:1px solid gray;">获取短信验证码</span></a>
	              </td></tr>
	              <tr height="70px"><td>
	                  <span style="float:left;width:100%;height:45px;background:white;border:1px solid gray;"><input type="text"  value="填写手机验证码" style="margin-left:3%;width:95%;border:0px;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onfocus="javascript:if(this.value=='填写手机验证码')this.value='';" onblur="javascript:if(this.value=='')this.value='填写手机验证码';"></span>
	              </td></tr>
	              <tr height="70px"><td>
	                  <span style="float:left;width:100%;height:45px;background:white;border:1px solid gray;"><input  type="text"  value="设置登录密码" style="margin-left:3%;width:95%;border:0px;height:100%;font-size:102%;color:#A0A0A0;" onfocus="javascript:if(this.value=='设置登录密码')this.value='';this.type='password';" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" onblur="javascript:if(this.value=='')this.value='设置登录密码';if(this.value=='设置登录密码')this.type='text';"></span>
	              </td></tr>
	              <tr height="70px"><td>
	                  <span style="float:left;width:100%;height:45px;background:white;border:1px solid gray;"><input name="userPwd" type="text"  value="再次输入密码" style="margin-left:3%;width:95%;border:0px;height:100%;font-size:102%;color:#A0A0A0;" onfocus="javascript:if(this.value=='再次输入密码')this.value='';this.type='password';" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" onblur="javascript:if(this.value=='')this.value='再次输入密码';if(this.value=='再次输入密码')this.type='text';"></span>
	              </td></tr>
	              <tr height="70px"><td>
	                  <a href="javascript:void(0);" style="text-decoration:none;font-size:90%;">
	                     <input type="submit" value="确认" style="text-align:center;line-height:40px;font-size:120%;float:left;width:100%;height:45px;background:#9A9A9A;border:1px solid gray;cursor:pointer;"/>
	                  </a> 
	              </td></tr>
               </table>
          </div>
      </div>
</form>
      <div class="bottom">
          <span style="float:left;width:100%;margin-top:20px;height:20px;text-align:center;color:gray;font-size:80%;">Copyright 2018 - 2028 jim.com All Rights Reserved 京ICP证100557号 京公网安备112310102004579号 出版物经营许可证新出发京批字第直1141328号</span>
          <span style="float:left;margin-left:25%;width:50%;background:pink;height:70px;"><img src="./images/login/bottom.jpg" width="100%" height="70px"/></span>
      </div>
  </body>
</html>
