<%@ page language="java" import="java.util.*,com.school.domain.personbeans.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>成绩查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	    a:visited {color: gray;}
		a:link{	color:gray;}
		a:hover {color: green;}
		a:active {color: green;}
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
			right:187px;
			width:1000px;
		    height:288px;
		    background:white;
		    visibility:hidden;
		    z-index:2;
		    border-left:2px solid #EEEEEE;
		    border-right:2px solid #EEEEEE;
		    border-bottom:2px solid #EEEEEE;
		}
		
		.top{
		    float:left;
		    width:100%;
		    height:500px;
		    background:white;
		   /*  background:url(./images/studyCenter/lookScore/bg1.jpg) no-repeat 0px 0px; */
		}
		
		.head{
			flaot:left;
			width:100%;
			height:60px;
		} 

		.center_top_bar{
			float:left;
			width:100%;
			height:40px;
			background:#F06F4B;
		}
		
		.select_bar1{
			float:left;
			margin-left:20%;
			width:13%;
			height:40px;
			background:#F06F4B;
			line-height:40px;
			color:white;
		}
		
		.select_bar{
			float:left;
			margin-left:2%;
			width:13%;
			height:40px;
			line-height:40px;
			background:#F06F4B;
			color:white;
		}
		
		.left{
		   float:left;
		   width:70%;
		   height:100%;
		   background:white;
		}
		
		.right{
		   float:left;
		   width:30%;
		   height:100%;
		   background:white;
		}
		
	    .bottom{
			float:left;
			width:100%;
			height:150px;
			background:#EAEAEA;
			
		}
	</style>
	
	<%
        User user = (User)session.getAttribute("user");
    %>
  </head>
  
  <body>
     <center>
          <div class="top" >
              <div class="head">
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
		                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="#" style="text-decoration:none">联系我们</a></span>
		                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="#" style="text-decoration:none">加入我们</a></span>
		            </span>
		        </div>
		        <div class="bg_top_top" >
		             <span style="float:left;margin-left:10%;width:20px;height:30px;"><img src="./images/First/dingwei.jpg" width="100%" height="100%"/></span>
		             <span style="float:left;margin-left:5px;height:30px;line-height:28px;color:gray;font-size:80%;">[<font id="location">${sessionScope.location}</font>]</span>
		             <c:choose>
		                 <c:when test="${sessionScope.user==null}">
		                     <font style="float:left;margin-left:30px;font-size:80%;color:red;line-height:28px;">Hi~</font>
				             <a class="a1" href="${pageContext.request.contextPath }/person/user/login?pageSource=c4" style="float:left;margin-left:10px;font-size:80%;line-height:28px;text-decoration:none;">请登录</a> 
				             <a class="a1" href="${pageContext.request.contextPath }/person/user/regist?pageSource=c4" style="float:left;margin-left:20px;font-size:80%;line-height:28px;text-decoration:none;">[免费注册]</a>
		                 </c:when>
		                 <c:otherwise>
		                     <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=c4">
		                     <span style="float:left;margin-top:5px;margin-left:30px;width:20px;height:20px;border-radius:15px;cursor:pointer;"><img src="${sessionScope.user.getUserPhoto()}" title="${sessionScope.user.getUserName()}" style="border-radius:15px;width:100%;height:100%;"/></span>
		                     <font style="float:left;margin-left:5px;font-size:80%;line-height:28px;text-decoration:none;">${sessionScope.user.getUserName()}</font>
		                     </a>
		                     <a class="a1" href="${pageContext.request.contextPath }/person/user/exit?pageSource=c4" style="float:left;margin-left:10px;font-size:80%;line-height:27px;text-decoration:none;">注销</a>
		                 </c:otherwise>
		             </c:choose>
		             <span id="showBar" style="float:right;width:60px;height:30px;text-align:center;margin-right:180px;cursor:default;font-size:80%;line-height:28px;color:gray;" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='visible';this.style.color='red';this.style.background='white'" onmouseout="this.style.color='gray';">网站导航</span>
		             <a class="a1" href="${pageContext.request.contextPath }/person/1/6?pageSource=c4" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">卖家中心</a>
		             <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=c4" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">个人中心</a>
		        </div>
              </div>
              <div class="center_top_bar" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
                    <a href="${pageContext.request.contextPath }/studyCenter/1"><span class="select_bar1" onmouseover="this.style.background='white';this.style.color='black'" onmouseout="this.style.background='#F06F4B';this.style.color='white'">首页</span></a>
                    <a href="${pageContext.request.contextPath }/studyCenter/2"><span class="select_bar" onmouseover="this.style.background='white';this.style.color='black'" onmouseout="this.style.background='#F06F4B';this.style.color='white'">交流讨论</span></a>
                    <a href="${pageContext.request.contextPath }/studyCenter/3"><span class="select_bar" onmouseover="this.style.background='white';this.style.color='black'" onmouseout="this.style.background='#F06F4B';this.style.color='white'">资料共享</span></a>
                    <a href="${pageContext.request.contextPath }/studyCenter/4"><span class="select_bar" onmouseover="this.style.background='white';this.style.color='black'" onmouseout="this.style.background='#F06F4B';this.style.color='white'">成绩查询</span></a>
              </div>
              <div class="left" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'"><img src="./images/studyCenter/lookScore/cjcx.jpg" width="100%" height="100%"/></div>
              <div class="right" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
                  <span class="title" style="float:left;text-align:center;font-size:120%;color:green;width:100%;height:10%;background:white;">快速查询入口</span>
                  <span style="float:left;margin-left:2%;text-align:center;width:96%;height:10%;"><a href="#">四六级成绩查询入口</a></span>
                  <span style="float:left;margin-left:2%;text-align:center;width:96%;height:10%;"><a href="#">计算机二级成绩查询入口</a></span>
                  <span style="float:left;margin-left:2%;text-align:center;width:96%;height:10%;"><a href="#">教师资格考试成绩查询入口</a></span>
                  <span style="float:left;margin-left:2%;text-align:center;width:96%;height:10%;"><a href="#">教师资格考试成绩查询入口</a></span>
                  <span style="float:left;margin-left:2%;text-align:center;width:96%;height:10%;"><a href="#">教师资格考试成绩查询入口</a></span>
                  <span style="float:left;margin-left:2%;text-align:center;width:96%;height:10%;"><a href="#">教师资格考试成绩查询入口</a></span>
                  <span style="float:left;margin-left:2%;text-align:center;width:96%;height:10%;"><a href="#">教师资格考试成绩查询入口</a></span>
                  <span style="float:left;margin-left:2%;text-align:center;width:96%;height:10%;"><a href="#">教师资格考试成绩查询入口</a></span>
              </div>
         </div>
         <div class="bottom">
                    <div style="float:left;margin-top:40px;margin-left:20%;width:60%;height:70px;">
                        <span>
                            <a class="aa" href="#">网站首页</a>&nbsp&nbsp|&nbsp&nbsp
                            <a class="aa" href="#">生活中心</a>&nbsp&nbsp|&nbsp&nbsp
                            <a class="aa" href="#">学习交流</a>&nbsp&nbsp|&nbsp&nbsp
                            <a class="aa" href="#">校园动态</a>&nbsp&nbsp|&nbsp&nbsp
                            <a class="aa" href="#">关于我们</a>
                        </span><br/><br/>
                        <span style="color:gray;font-size:80%;">
                                                                        版权所有:李际明 ,&nbspICP备案:信息来自互联网，侵权处理(合作) 联系QQ：12345
                        </span>
                    </div>
         </div>
     </center>
  </body>
</html>
