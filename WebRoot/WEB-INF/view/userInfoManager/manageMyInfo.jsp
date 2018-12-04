<%@ page language="java" import="java.util.*,com.school.domain.personbeans.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的资料</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%-- <script type="text/javascript" src="<c:url value='/js/life.js'/>"></script> --%>
	<script type="text/javascript" src="<c:url value='/js/preLookPhoto.js'/>"></script>
	<link rel="stylesheet" type="text/css" href="css/manageMyInfo.css">
    <%
       User user = (User)session.getAttribute("user");
    %>
  </head>
  
  <body>
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
      <div class="top"  onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
          <span class="top_2">
              <span class="logo"><img src="./images/manageMyInfo/logo.jpg" width="100%" height="100%"/></span>
          </span>
      </div>
      <div class="middle"  onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
          <div class="middle_left">
              <span class="middle_left_btn"><a href="javascript:void(0)" style="float:left;text-align:left;text-decoration:none;font-size:85%;">基本信息</a></span>
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/2" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的订单</a></span>
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/3" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的购物车</a></span>
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/4" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的帖子</a></span>
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/5" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的分享</a></span>
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/6" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的店铺</a></span>
          </div>
          <div class="middle_right">
              <form>
	              <span class="middle_right_1">修改基本信息</span>
	              <table border="0"  width="97%" style="margin-left:3%;font-size:90%;table-layout:fixed;word-wrap:break-word;border-collapse:collapse;">
	                  <tr height="30px">
	                      <td>
	                          <span style="float:left;">账号:</span>
	                          <span style="float:left;margin-left:60px;">${sessionScope.user.getUserId()}</span>
	                      </td>
	                  </tr>
	                  <tr height="150px">
	                      <td>
	                          <span style="float:left;">头像:</span>
	                          <span id="preview" style="float:left;margin-top:5px;margin-left:60px;width:80px;height:80px;border:2px solid gray;"><img src="${sessionScope.user.getUserPhoto()}" width="100%" height="100%"/></span>
	                          <div style="position:relative;top:55px;left:200px;width:60px;height:30px;">
	                              <button style="position:absolute;left:0px;top:0px;z-index:1;width:100%;text-align:center;font-size:90%;height:100%;cursor:pointer;color:black;">更换</button>
	                              <label style="position:absolute;left:0px;top:0px;z-index:2;width:100%;height:100%;background:red;opacity:0;cursor:pointer;"><input id="img" name="img" type="file" accept="image/*" style="cursor:pointer;" onchange="preview(this)"/></label>
	                          </div>
	                      </td>
	                  </tr>
	                  <tr height="50px">
	                      <td>
	                          <span style="float:left;">昵称:</span>
	                          <span style="float:left;margin-left:60px;"><input type="text" maxlength="10" style="width:150px;border:1px solid white;" onclick="javascript:document.getElementById('tips1').style.color='white';this.style.borderColor='#CECECE';" onblur="this.style.borderColor='white';" value="${sessionScope.user.getUserName()}"/></span>
	                          <font id="tips1" style="float:left;margin-left:10px;font-size:85%;color:white;">昵称不能为空</font>
	                      </td>
	                  </tr>
	                  <tr height="50px">
	                      <td>
	                          <span style="float:left;">真实姓名:</span>
	                          <span style="float:left;margin-left:31.5px;"><input maxlength="10" type="text" style="width:150px;border:1px solid white;" onclick="javascript:document.getElementById('tips2').style.color='white';this.style.borderColor='#CECECE';" onblur="this.style.borderColor='white';" value="${sessionScope.user.getUserTrueName()}"/></span>
	                          <font id="tips2" style="float:left;margin-left:10px;font-size:85%;color:white;">姓名不能为空</font>
	                      </td>
	                  </tr>
	                  <tr height="50px">
	                      <td>
	                          <span style="float:left;">身份证号码:</span>
	                          <span style="float:left;margin-left:17px;"><input maxlength="18" type="text" style="width:150px;border:1px solid white;" onclick="this.style.borderColor='#CECECE';" onblur="this.style.borderColor='white';" value="${sessionScope.user.getUserIdCard()}"/></span>
	                      </td>
	                  </tr>
	                  <tr height="50px">
	                      <td>
	                          <span style="float:left;">年龄:</span>
	                          <span style="float:left;margin-left:60px;"><input type="text" maxlength="3" style="width:30px;border:1px solid white;" onclick="this.style.borderColor='#CECECE';" onblur="this.style.borderColor='white';" value="${sessionScope.user.getUserAge()}"/></span>
	                      </td>
	                  </tr>
	                  <tr height="50px">
	                      <td>
	                          <span style="float:left;">性别:</span>
	                          <c:choose>
	                              <c:when test="${sessionScope.user.getUserSex()=='男'}">
	                                  <span style="float:left;margin-left:60px;"><input type="radio" name="sex" checked="checked"/>男<input type="radio" name="sex"/>女</span>
	                              </c:when>
	                              <c:otherwise>
	                                  <span style="float:left;margin-left:60px;"><input type="radio" name="sex" />男<input type="radio" name="sex" checked="checked"/>女</span>
	                              </c:otherwise>
	                          </c:choose>
	                          
	                      </td>
	                  </tr>
	                  <tr height="50px">
	                      <td>
	                          <span style="float:left;">联系电话:</span>
	                          <span style="float:left;margin-left:31.5px;"><input maxlength="11" type="text" style="width:100px;border:1px solid white;" onclick="javascript:document.getElementById('tips3').style.color='white';this.style.borderColor='#CECECE';" onblur="this.style.borderColor='white';" value="${sessionScope.user.getUserTel()}"/></span>
	                          <font id="tips3" style="float:left;margin-left:10px;font-size:85%;color:white;">联系电话不能为空</font>
	                      </td>
	                  </tr>
	                   <tr height="50px">
	                      <td>
	                          <span style="float:left;">电子邮件:</span>
	                          <span style="float:left;margin-left:31.5px;"><input maxlength="20" type="text" style="width:150px;border:1px solid white;" onclick="this.style.borderColor='#CECECE';" onblur="this.style.borderColor='white';" value="${sessionScope.user.getUserEmail()}"/></span>
	                      </td>
	                  </tr>
	                   <tr height="50px">
	                      <td>
	                          <span style="float:left;">收货地址:</span>
	                          <span style="float:left;margin-left:31.5px;"><input maxlength="50" type="text" style="width:300px;border:1px solid white;" onclick="javascript:document.getElementById('tips4').style.color='white';this.style.borderColor='#CECECE';" onblur="this.style.borderColor='white';" value="${sessionScope.user.getUserAddress()}"/></span>
	                          <font id="tips4" style="float:left;margin-left:10px;font-size:85%;color:white;">收货地址不能为空</font>
	                      </td>
	                  </tr>
	                 <tr height="50px">
	                      <td>
	                          <input type="submit" value="保存" style="float:left;margin-left:20%;"/>
	                          <input type="reset" value="取消" style="float:left;margin-left:20px;"/>
	                      </td>
	                  </tr>
	              </table>
	           </form>
          </div>
      </div>
      <div class="bottom">
         <center>
             <div style="margin-top:40px;width:60%;height:70px;">
               <span style="font-size:90%;">
                   <a class="aa" href="#">网站首页</a>&nbsp&nbsp|&nbsp&nbsp
                   <a class="aa" href="#">生活中心</a>&nbsp&nbsp|&nbsp&nbsp
                   <a class="aa" href="#">学习交流</a>&nbsp&nbsp|&nbsp&nbsp
                   <a class="aa" href="#">校园动态</a>&nbsp&nbsp|&nbsp&nbsp
                   <a class="aa" href="#">关于我们</a>
               </span><br/><br/>
               <span style="color:gray;font-size:80%;">
                                                 版权所有:李际明&nbspICP备案:信息来自互联网，侵权处理(合作) 联系QQ：12345
               </span>
           </div>
         </center>
           
      </div>
  </body>
</html>
