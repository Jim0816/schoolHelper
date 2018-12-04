<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    
    <title>店铺申请结果</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <style type="text/css">
        a:visited {color:red;}
		a:link{	color:red;}
		a:hover {color:green;}
		a:active {color:green;} 
        
        .aa:visited {color: black;}
		.aa:link{	color:black;}
		.aa:hover {color: red;}
		.aa:active {color: red;} 
        .top{
           width:100%;
           height:40px;
           background:#F0F0F0;  
        }
        
         .bg{
           margin-top:20px;
           width:1200px;
           height:620px;
           background:white;
        }
        
        .center{
			float:left;
			height:500px;
			width: 100%;
			background:white;
		}
		
		.center_1{
		    float:left;
		    margin-top:50px;
			height:200px;
			width: 100%;
			background:white;
		}
		
         .bottom {
			float:left;
			height:70px;
			width: 100%;
		}
    </style>
  </head>
  
  <body>
      <center>
          <div class="top">
              <span style="float:right;">
		          <a class="aa" id="firstUrl" href="${pageContext.request.contextPath }/market/First" style="float:right;line-height:40px;text-decoration:none;font-size:90%;">商城首页</a>
	          </span>
          </div>
          <div class="bg">
              <div class="center">
                 <div class="center_1">
                     <span style="float:left;margin-left:100px;width:50px;height:50px;background:white;"><img src="./images/comm/tip.jpg" width="100%" height="100%"/></span>
                     <c:if test="${applyStatus=='1'}">
                         <span style="float:left;margin-left:20px;line-height:60px;font-size:120%;color:black;">亲,您申请已经审核通过，不能再次申请哦!</span>
                         <span style="float:left;margin-left:30px;line-height:60px;font-size:120%;color:green;">立即前往</span>
                         <a  href="${pageContext.request.contextPath }/market/1/2?shopUserId=${user.getUserId()}" style="float:left;margin-left:10px;line-height:60px;font-size:100%;">我的店铺</a>
                     </c:if>
                     
                     <c:if test="${applyStatus=='0'}">
                         <span style="float:left;margin-left:20px;line-height:60px;font-size:120%;color:black;">亲,您申请正在审核当中,请耐心等待!</span>
                         <span style="float:left;margin-left:30px;line-height:60px;font-size:100%;">
	                         <font id="s" style="float:left;color:red;">10</font>
	                         <font style="float:left;margin-left:5px">秒后自动跳转</font>
	                         <a href="${pageContext.request.contextPath }/market/First" style="float:left;margin-left:5px;">首页</a>
                         </span>
                         
                          <script type="text/javascript">
                              window.onload= function(){
                                  var flag = 10;
                                  var timer = setInterval(updateTime,1000);
                                  function updateTime(){
                                      flag=flag-1;
                                      document.getElementById('s').innerHTML=flag;
                                  }  
                              };
                          </script>
                         <%
                             response.setHeader("Refresh", "10;URL="+request.getContextPath()+"/market/First");
                          %>
                     </c:if>
                     
                     <c:if test="${applyStatus=='-1'}">
                         <span style="float:left;margin-left:20px;line-height:60px;font-size:120%;color:black;">亲,您申请未能通过,处理结果如下:</span>
                         <div style="float:left;margin-top:10px;margin-left:15%;text-align:left;width:65%;height:100px;font-size:85%;background:white;">
                             ${shopApplyInfo.get(0).get("handleDesc")}
                         </div>
                         <span style="float:left;margin-left:15%;width:65%;height:30px;background:white;">
                             <span style="float:left;font-weight:bold;line-height:40px;">如果想继续申请，请在24小时后重新提交信息。</span>
                             <a href="${pageContext.request.contextPath }/market/First" style="float:right;line-height:40px;font-size:90%;">回到首页</a>
                         </span>
                     </c:if>
                 </div>
			     
		      </div>
              <div class="bottom">
			      <span style="float:left;width:100%;margin-top:20px;height:20px;text-align:center;color:gray;font-size:80%;">Copyright 2018 - 2028 jim.com All Rights Reserved 京ICP证100557号 京公网安备112310102004579号 出版物经营许可证新出发京批字第直1141328号</span>
		          <span style="float:left;margin-left:25%;width:50%;background:pink;height:70px;"><img src="./images/life/bottom.jpg" width="100%" height="70px"/></span>
		      </div>
          </div>
          
      </center>
      
  </body>
</html>
