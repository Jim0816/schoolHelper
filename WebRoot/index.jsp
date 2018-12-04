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
    
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.4.6&key=ecfaffd442a7a712de9f91dd263f1737"></script>
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  </head>
  
  <body>
      <div id="allmap"></div>
      <input id="url" type="hidden" value="${pageContext.request.contextPath }/market/location"/>
      <form name="myform" action="" method="get">
          <input id="schoolName" name="schoolName" type="hidden" value=""/>
      </form>
      <script type="text/javascript" src="<c:url value='/js/getLocation.js'/>"></script>
      <%-- <jsp:forward page="/market/First"></jsp:forward> --%>
      <%-- <jsp:forward page="/WEB-INF/view/userInfoManager/updateBasicInfo.jsp"></jsp:forward> --%>
       
  </body>
</html>
