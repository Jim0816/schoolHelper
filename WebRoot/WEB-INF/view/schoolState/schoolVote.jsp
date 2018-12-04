<%@ page language="java" import="java.util.*,com.school.domain.personbeans.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'schoolVote.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/schoolState/schoolVote.css">

    <%
       User user = (User)session.getAttribute("user");
    %>
  </head>
  
  <body>
      <center>
          <div class="bg">
              <div class="head">
                  <div class="head_1">
	                    <span style="float:right;margin-top:10px;width:50%;height:20px;background:white;">
	                        <a href="javascript:history.back();" style="float:right;text-decoration:none;font-size:90%;">返回</a>
		                    <font style="float:right;color:gray;margin-left:10px;margin-right:10px;">|</font>
		                    <a href="${pageContext.request.contextPath }/market/First" style="float:right;text-decoration:none;font-size:90%;">商城首页</a>
	                        <font style="float:right;color:gray;margin-left:10px;margin-right:10px;">|</font>
	                        <%
	                            if(user==null){
	                         %>
	                             <a href="${pageContext.request.contextPath }/person/user/regist?pageSource=d2" style="float:right;text-decoration:none;font-size:90%;">[免费注册]</a>
	                             <font style="float:right;color:gray;margin-left:10px;margin-right:10px;">|</font>
	                             <a href="${pageContext.request.contextPath }/person/user/login?pageSource=d2" style="float:right;text-decoration:none;font-size:90%;">登录</a>
	                         <%
	                          }else{
	                          %>
	                              <a href="${pageContext.request.contextPath }/person/user/exit?pageSource=d2" style="float:right;text-decoration:none;font-size:90%;">[注销]</a>
	                              <font style="float:right;color:gray;margin-left:10px;margin-right:10px;">|</font>
	                              <a href="#" style="float:right;text-decoration:none;font-size:90%;"><%=user.getUserName()%></a>
	                          <%
	                          }
	                          %>
	                    </span>
                  </div>
                  <div class="head_2">
                  <h3>这里是投票活动的主题</h3>
                  </div>
              </div>
              <div class="center">
                  <div class="center_top">
                      <span class="card">
                          <span style="float:left;width:100%;height:50%;background:#448BBF;"></span>
                          <span style="float:left;width:100%;height:50%;background:#D0D0D0;"></span>
                      </span>
	                  <!-- <span style="float:left;margin-left:20px;margin-top:20px;width:200px;height:250px;background:red;"></span>
	                  <span style="float:left;margin-left:20px;margin-top:20px;width:200px;height:250px;background:red;"></span>
	                  <span style="float:left;margin-left:20px;margin-top:20px;width:200px;height:250px;background:red;"></span>
	                  <span style="float:left;margin-left:20px;margin-top:20px;width:200px;height:250px;background:red;"></span>
	                  <span style="float:left;margin-left:20px;margin-top:20px;width:200px;height:250px;background:red;"></span>
	                  <span style="float:left;margin-left:20px;margin-top:20px;width:200px;height:250px;background:red;"></span>
	                  <span style="float:left;margin-left:20px;margin-top:20px;width:200px;height:250px;background:red;"></span>
	                  <span style="float:left;margin-left:20px;margin-top:20px;width:200px;height:250px;background:red;"></span>
	                  <span style="float:left;margin-left:20px;margin-top:20px;width:200px;height:250px;background:red;"></span>
	                  <span style="float:left;margin-left:20px;margin-top:20px;width:200px;height:250px;background:red;"></span>
	                  <span style="float:left;margin-left:20px;margin-top:20px;width:200px;height:250px;background:red;"></span> -->
                  </div>
                  
                  <div class="center_bottom">
                      <div class="devidePage">
                          <center>
                              <a href="#" style="text-decoration:none;">首页</a>
                              <a href="#" style="text-decoration:none;">上一页</a>
                              <a href="#" style="text-decoration:none;">下一页</a>
                              <a href="#" style="text-decoration:none;">尾页</a>
                          </center>
                      </div>
                  </div>
              </div>
          </div>
      </center>
      
      
      
      
  </body>
</html>
