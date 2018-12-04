<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <style type="text/css">
        a:visited {color: red;}
        a:link{	color:red;}
        a:hover {color: red;}
        a:active {color: red;}
        
        .aa:visited {color: gray;}
        .aa:link{	color:gray;}
        .aa:hover {color: red;}
        .aa:active {color: red;}
    </style>
    <script type="text/javascript">
        function changeBtn1(){
            var btn1 = document.getElementById("btn1");
            var btn2 = document.getElementById("btn2");
            btn1.style.color = 'white';
            btn1.style.background='red';
            btn1.style.fontWeight="bold";
            btn2.style.color = 'black';
            btn2.style.background='#F8F8F8';
            btn2.style.fontWeight="normal";
        }
        
        function changeBtn2(){
            var btn1 = document.getElementById("btn1");
            var btn2 = document.getElementById("btn2");
            btn2.style.color = 'white';
            btn2.style.background='red';
            btn2.style.fontWeight="bold";
            btn1.style.color = 'black';
            btn1.style.background='#F8F8F8';
            btn1.style.fontWeight="normal";
        }
        
        function inputCheck(){
            var id = document.getElementById("id").value.replace(/\s/g, "");
            var pwd = document.getElementById("pwd").value.replace(/\s/g, "");
            
            if(id=="请输入账号" || id==""  || pwd=="请输入密码" || pwd=="" )
            {
                if(id=="请输入账号"){document.getElementById("id").style.borderColor='red';}
                if(pwd=="请输入密码"){document.getElementById("pwd").style.borderColor='red';}
                return false;
            }else{
                return true;
            }   
        }
    </script>
  </head>
  
  <body id="bg">
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
     
      <form action="${pageContext.request.contextPath}/person/user/loginCheck?page=${pageSource}" method="post" onsubmit="return inputCheck();">
      <div id="login-view" style="float:left;margin-left:8%;width:27%;margin-top:60px;border:1px solid gray;height:400px;">
          <span style="float:left;width:100%;height:40px;">
              <span style="float:left;width:40%;height:40px;color:gray;font-size:150%;font-weight:bold;">用户登录</span>
              <span style="float:right;width:40%;height:40px;color:gray;">没有账号免费<a id="gotoReg" href="${pageContext.request.contextPath }/person/user/regist?pageSource=${pageSource}" style="text-decoration:none;font-size:90%;">[注册]</a></span>
          </span>
          <div style="float:left;width:99.5%;height:40px;background:white;">
              <table cellspacing="0" style="width:100%;height:40px;" >
                  <tr>
                      <td><button type="button" id="btn1" style="text-align:center;border:1px solid gray;background:red;color:white;font-weight:bold;width:100%;height:40px;cursor:pointer;" onclick="changeBtn1()">普通登录</button></td>
                      <td><button type="button" id="btn2" style="text-align:center;border:1px solid gray;background:#F8F8F8;color:black;width:100%;height:40px;cursor:pointer;" onclick="changeBtn2()">快速登录</button></td>
                  </tr>
              </table>
          </div>
          <div style="float:left;margin-left:5%;margin-top:30px;width:90%;height:120px;background:white;">
              <span style="float:left;width:100%;height:40px;background:blue;">
                  <input id="id" type="text" name="userId" style="width:100%;height:40px;color:gray;border:1px solid gray;" maxlength="11" value="请输入账号" style="margin-left:3%;width:95%;border:0px;height:100%;font-size:102%;color:#A0A0A0;"  onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onfocus="javascript:if(this.value=='请输入账号')this.value='';this.style.borderColor='black';" onblur="javascript:if(this.value=='')this.value='请输入账号';"/>
              </span>
              <span style="float:left;margin-top:20px;width:100%;height:40px;background:blue;">
                  <input id="pwd" type="text" name="userPwd" style="width:100%;height:40px;color:gray;border:1px solid gray;" maxlength="20" value="请输入密码" onfocus="javascript:if(this.value=='请输入密码')this.value='';this.type='password';this.style.borderColor='black';" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" onblur="javascript:if(this.value=='')this.value='请输入密码';if(this.value=='请输入密码')this.type='text';"/>
              </span>
          </div>
          <div style="float:left;margin-left:5%;width:90%;height:80px;">
              <span style="float:right;height:30px;background:white;">
                  <a href="${pageContext.request.contextPath}/person/user/findCode?pageSource=${pageSource}" style="text-decoration:underline;font-size:90%;font-weight:bold;">忘记密码</a>
              </span>
              <span style="float:left;width:100%;height:50px;background:blue;">
                  <input type="submit" value="登   录" style="width:100%;height:50px;color:white;font-size:120%;background:red;cursor:pointer;" onmouseover="this.style.fontWeight='bold';" onmouseout="this.style.fontWeight='normal';"/>
              </span>
          </div>
          <div style="float:left;margin-top:30px;width:100%;height:60px;border-top:1px solid gray;"></div>
      </div>
      </form>
      
      <div style="float:left;margin-left:10%;margin-top:30px;width:80%;height:70px;border-top:1px solid gray;">
          <span style="float:left;width:100%;margin-top:20px;height:20px;text-align:center;color:gray;font-size:80%;">Copyright 2018 - 2028 jim.com All Rights Reserved 京ICP证100557号 京公网安备112310102004579号 出版物经营许可证新出发京批字第直1141328号</span>
          <span style="float:left;margin-left:25%;width:50%;background:pink;height:70px;"><img src="./images/login/bottom.jpg" width="100%" height="70px"/></span>
      </div>
  </body>
</html>
