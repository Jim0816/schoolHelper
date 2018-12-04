<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'videoPlayer.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <center>
         <div style="width:35%;height:500px;">
             <span style="float:left;width:100%;height:70px;text-align:center;"><h3>${title}</h3></span>
             <div style="float:left;width:100%;height:430px;"> 
                 <iframe title="<%=request.getAttribute("title")%>" frameborder="0" width="100%" height="100%" src="${src}"  ></iframe>
                 <%-- <video title="<%=request.getAttribute("title")%>" src="${src}" controls="controls" autoplay="autoplay" style="width:100%;height:100%;cursor:pointer;"></video> --%>
             </div>   
         </div>
     </center>
  </body>
</html>
