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
			height: 450px;
			width: 70%;
			margin-left: 15%;
			border:1px solid #DCDFE5;
		}
		
		.middle_center{
		   float: left;
		   margin-top:2%;
		   margin-left: 15%;
		   height: 350px;
		   width: 70%;
		}
 		.middle_1{
		    float: left;
			margin-left:20%;
			height: 80px;
			width: 60%;
			background:white;
		}
		
		.result_logo{
		   float: left;
		   height: 100%;
		   width: 20%;
		}
		
		.result_title{
		   float: left;
		   margin-top:40px;
		   height: 40px;
		   width: 80%;
		   font-size:120%;
		}
		
		.middle_2{
		    float: left;
		    margin-top:20px;
			margin-left:20%;
			height: 150px;
			width: 60%;
			background:white;
		}
		
		.middle_2_text1{
		    float: left;
		    margin-top:20px;
		    margin-left:5%;
			height: 40px;
			width: 90%;
		}
		
		.bottom {
			background-color: white;
			float: left;
			height: 100px;
			width: 70%;
			margin-left: 15%;
		}
    </style>
  </head>
  
  <body>
      <div class="top">
          <img src="./images/login/tb1.jpg" width="20%" height="70px"/>
          <a class="b" href="${pageContext.request.contextPath }/market/First" style="float:right;margin-top:45px;text-decoration:none;">商城首页</a>
      </div>
      <div class="middle">
          <span style="float:left;margin-left:10%;width:80%;height:60px;border-bottom:1px solid black;font-size:120%;color:red;line-height:80px;">
          </span>
          <div class="middle_center">
              <span class="middle_1">
                  <span class="result_logo"><img src="./images/comm/true.jpg" width="100%" height="100%"/></span>
                  <span class="result_title"><font style="color:red;">恭喜您！</font>密码修改成功</span>
              </span>
              <span class="middle_2">
                  <span class="middle_2_text1">
                    <font style="color:red;">建议完善账号信息，提高账户安全</font>
                    <a class="b" href="${pageContext.request.contextPath}/person/user/login?pageSource=${pageSource}" style="float:right;font-size:120%;">去登陆</a>
                  </span>
                  
              </span>
          </div>
         
      </div>
      <div class="bottom">
          <span style="float:left;width:100%;margin-top:20px;height:20px;text-align:center;color:gray;font-size:80%;">Copyright 2018 - 2028 jim.com All Rights Reserved 京ICP证100557号 京公网安备112310102004579号 出版物经营许可证新出发京批字第直1141328号</span>
          <span style="float:left;margin-left:25%;width:50%;background:pink;height:70px;"><img src="./images/login/bottom.jpg" width="100%" height="70px"/></span>
      </div>
  </body>
</html>
