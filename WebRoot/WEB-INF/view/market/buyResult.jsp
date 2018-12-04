<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>确认订单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <style type="text/css">
        a:visited {color:blue;}
		a:link{	color:blue;}
		a:hover {color:red;}
		a:active {color:red;}
        
                .a1:visited {color: gray;}
		.a1:link{	color:gray;}
		.a1:hover {color: red;}
		.a1:active {color: red;}
		
		.a4:visited {color:#A999B5;}
		.a4:link{	color:#A999B5;}
		.a4:hover {color:black;}
		.a4:active {color:black;}
		
		.bg_top_top{
			position:relative;
			width: 100%;
		    height: 30px;
		    background:#F8F8F8;
		    overflow:hidden;
		}
		
		.nevigationBar{
			position:absolute;
			top:40px;
			right:156px;
			width:1000px;
		    height:288px;
		    background:white;
		    visibility:hidden;
		    z-index:2;
		    border-left:2px solid #EEEEEE;
		    border-right:2px solid #EEEEEE;
		    border-bottom:2px solid #EEEEEE;
		}
        
        .bg{
            width:1500px;
            background:red;
        }
        .top{
            float:left;
            width:100%;
            height:180px;
            background:white;
        }
        
         .top_2{
            float:left;
            width:100%;
            height:120px;
            background:white;
        }
         .center{
            float:left;
            margin-left:10%;
            width:80%;
            height:450px;
            background:white;
        }

         .bottom{
            float:left;
            margin-left:10%;
            margin-top:20px;
            width:80%;
            height:150px;
            background:white;
        }
    </style>
  </head>
  
  <body>
	  <center>
	      <div id="nevigationBar" class="nevigationBar">
	            <span style="float:left;margin-top:15px;margin-left:3.5%;width:17%;height:250px;">
	                <span style="float:left;width:100%;height:30px;text-align:center;color:red">首页</span>
	                <span style="float:left;margin-top:20px;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/market/First" style="text-decoration:none">校园商城</a></span>
	                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/market/First" style="text-decoration:none">兼职信息</a></span>
	            </span>
	            <span style="float:left;margin-top:15px;margin-left:2%;width:17%;height:250px;">
	                <span style="float:left;width:100%;height:30px;text-align:center;color:red">生活中心</span>
	                <span style="float:left;margin-top:20px;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/life/1" style="text-decoration:none">缴费大厅</a></span>
	                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/life/2" style="text-decoration:none">送水中心</a></span>
	                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/life/3" style="text-decoration:none">物业报修</a></span>
	                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/life/4" style="text-decoration:none">快递服务</a></span>
	                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/life/5" style="text-decoration:none">房屋租赁</a></span>
	                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/life/6" style="text-decoration:none">我要接单</a></span>
	            </span>
	            <span style="float:left;margin-top:15px;margin-left:2%;width:17%;height:250px;">
	                <span style="float:left;width:100%;height:30px;text-align:center;color:red">学习交流</span>
	                <span style="float:left;margin-top:20px;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/studyCenter/1" style="text-decoration:none">学习大厅</a></span>
	                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/studyCenter/2" style="text-decoration:none">交流论坛</a></span>
	                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/studyCenter/3" style="text-decoration:none">资源共享</a></span>
	                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/studyCenter/4" style="text-decoration:none">成绩查询</a></span>
	            </span>
	            <span style="float:left;margin-top:15px;margin-left:2%;width:17%;height:250px;">
	                <span style="float:left;width:100%;height:30px;text-align:center;color:red">校园动态</span>
	                <span style="float:left;margin-top:20px;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/schoolState/1" style="text-decoration:none">校园资讯</a></span>
	                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/schoolState/3" style="text-decoration:none">校园通知</a></span>
	            </span>
	            <span style="float:left;margin-top:15px;margin-left:2%;width:17%;height:250px;">
	                <span style="float:left;width:100%;height:30px;text-align:center;color:red">关于我们</span>
	                <span style="float:left;margin-top:20px;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="#" style="text-decoration:none">客户中心</a></span>
	                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/person/us" style="text-decoration:none">联系我们</a></span>
	                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/person/us" style="text-decoration:none">加入我们</a></span>
	            </span>
	        </div>
	        <div class="bg_top_top" >
	             <span style="float:left;margin-left:10%;width:20px;height:30px;"><img src="./images/First/dingwei.jpg" width="100%" height="100%"/></span>
	             <span style="float:left;margin-left:5px;height:30px;line-height:28px;color:gray;font-size:80%;">[<font id="location">${sessionScope.location}</font>]</span>
	             <c:choose>
	                 <c:when test="${sessionScope.user==null}">
	                     <font style="float:left;margin-left:30px;font-size:80%;color:red;line-height:28px;">Hi~</font>
			             <a class="a1" href="${pageContext.request.contextPath }/person/user/login?pageSource=a1" style="float:left;margin-left:10px;font-size:80%;line-height:28px;text-decoration:none;">请登录</a> 
			             <a class="a1" href="${pageContext.request.contextPath }/person/user/regist?pageSource=a1" style="float:left;margin-left:20px;font-size:80%;line-height:28px;text-decoration:none;">[免费注册]</a>
	                 </c:when>
	                 <c:otherwise>
	                     <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=a1">
	                     <span style="float:left;margin-top:5px;margin-left:30px;width:20px;height:20px;border-radius:15px;cursor:pointer;"><img src="${sessionScope.user.getUserPhoto()}" title="${sessionScope.user.getUserName()}" style="border-radius:15px;width:100%;height:100%;"/></span>
	                     <font style="float:left;margin-left:5px;font-size:80%;line-height:28px;text-decoration:none;">${sessionScope.user.getUserName()}</font>
	                     </a>
	                     <a class="a1" href="${pageContext.request.contextPath }/person/user/exit?pageSource=a1" style="float:left;margin-left:10px;font-size:80%;line-height:27px;text-decoration:none;">注销</a>
	                 </c:otherwise>
	             </c:choose>
	             <span id="showBar" style="float:right;width:60px;height:30px;text-align:center;margin-right:150px;cursor:default;font-size:80%;line-height:28px;color:gray;" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='visible';this.style.color='red';this.style.background='white'" onmouseout="this.style.color='gray';">网站导航</span>
	             <a class="a1" href="${pageContext.request.contextPath }/person/1/6?pageSource=a1" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">卖家中心</a>
	             <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=a1" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">个人中心</a>
	      </div>
	      <div class="bg" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
	          <div class="top">
	              <div class="top_2">
	                  <span style="float:left;margin-left:10%;margin-top:20px;width:10%;height:80px;"><img src="./images/First/tb1.jpg" width="100%" height="100%"/></span>
	                  <span style="float:left;margin-left:20%;margin-top:10px;width:50%;height:90px;"><img src="./images/comm/shouhuo.jpg" width="100%" height="100%"/></span>
	              </div>
	          </div>
	          <div class="center">
	              <center>
	                  <div style="width:200px;height:200px;"><img src="./images/comm/true.jpg" width="100%" height="100%"/></div>
	                  <div style="width:100%;margin-top:50px;height:150px;background:#EEEEEE;">
	                      <c:choose>
	                          <c:when test="${buyResult=='1'}">
	                              <span style="width:100%;height:50px;">您的订单已经受理，请耐心等待卖家发货</span><br/><br/>
	                              <span style="width:100%;height:30px;">您可以在<a href="${pageContext.request.contextPath }/person/1/2">  我的订单   </a>中查看订单状态</span><br/><br/>
	                          </c:when>
	                          <c:otherwise>
	                              <span style="width:100%;height:50px;">抱歉!交易失败，您的订单已经未受理</span><br/><br/>
	                          </c:otherwise>
	                      </c:choose>
	                      
	                      <span style="width:400px;height:50px;border:1px solid gray;border-radius:5px;background:white;font-size:85%;">该页面会在<font id="s" style="color:red;">15</font>秒后自动跳转商城首页
	                           <script type="text/javascript">
	                               window.onload= function(){
	                                   var flag = 15;
	                                   var timer = setInterval(updateTime,1000);
	                                   function updateTime(){
	                                       flag=flag-1;
	                                       document.getElementById('s').innerHTML=flag;
	                                   }  
	                               };
	                           </script>
	                           <%
                               response.setHeader("Refresh", "15;URL="+request.getContextPath()+"/market/First");
                               %>
	                      </span>
	                  </div>
	              </center>
	              
	          </div>
	         <div class="bottom">
			    <span style="float:left;width:100%;margin-top:20px;height:20px;text-align:center;color:gray;font-size:80%;">Copyright 2018 - 2028 jim.com All Rights Reserved 京ICP证100557号 京公网安备112310102004579号 出版物经营许可证新出发京批字第直1141328号</span>
		        <span style="float:left;margin-left:25%;width:50%;background:pink;height:70px;"><img src="./images/life/bottom.jpg" width="100%" height="70px"/></span>
	         </div>
	      </div>
	  </center>
      
  </body>
</html>
