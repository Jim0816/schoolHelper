<%@ page language="java" import="java.util.*,com.school.domain.personbeans.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的帖子</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/user/myDiscuss.css">	
  </head>
   <%
      String myCarFlag = UUID.randomUUID().toString();
      session.setAttribute("myCarFlag", myCarFlag);
   %>
  <body>
  <div class="deleteResult" id="deleteTips">
      <center>
          <font style="color:white;font-size:120%;line-height:40px;">${deleteResult}</font>
      </center>
  </div>
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
    <div class="bg" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
      <div class="top">
          <span class="top_2">
              <span class="logo"><img src="./images/manageMyInfo/logo.jpg" width="100%" height="100%"/></span>
          </span>
      </div>
      <center>
      <div class="middle">
          <div class="middle_left">
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/1" style="float:left;text-align:left;text-decoration:none;font-size:85%;">基本信息</a></span>
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/2" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的订单</a></span>
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/3" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的购物车</a></span>
              <span class="middle_left_btn"><a href="javascript:void(0)" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的帖子</a></span>
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/5" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的分享</a></span>
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/6" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的店铺</a></span>
          </div>
          <div class="middle_right">
                      <div class="middle_right_1">
		                  <font style="float:left;"> 我的帖子 </font>
		              </div>
		              <c:choose>
			              <c:when test="${sessionScope.myDiscuss.getTotalRows()>0}">
				              <div class="middle_right_2">
						           <c:choose>
						               <c:when test="${sessionScope.myDiscuss.getTotalPages()==sessionScope.myDiscuss.getCurrentPage() || sessionScope.myDiscuss.getTotalPages()==0}">
						                   <a href="javascript:void(0)" title="下一页"><span class="pageSelect_next" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&gt</span></a>
						               </c:when>
						               <c:otherwise>
						                   <a href="${pageContext.request.contextPath }/person/1/4?page=${sessionScope.myDiscuss.getCurrentPage()+1}" title="下一页"><span class="pageSelect_next" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&gt</span></a>
						               </c:otherwise>
						           </c:choose>
						           
						           <c:choose>
						               <c:when test="${sessionScope.myDiscuss.getCurrentPage()>1}">
						                   <a href="${pageContext.request.contextPath }/person/1/4?page=${sessionScope.myDiscuss.getCurrentPage()-1}" title="上一页"><span class="pageSelect_pre" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&lt</span></a>
						               </c:when>
						               <c:otherwise>
						                  <a href="javascript:void(0)" title="上一页"><span class="pageSelect_pre" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&lt</span></a>
						               </c:otherwise>
						           </c:choose>
						           <c:if test="${sessionScope.myDiscuss.getTotalPages()>0}">
						               <span style="float:right;margin-right:20px;text-align:right;font-size:85%;line-height:30px;">当前   ${sessionScope.myDiscuss.getCurrentPage()}/${sessionScope.myDiscuss.getTotalPages()}</span>
						           </c:if>
						           <span style="float:right;margin-right:20px;text-align:right;font-size:85%;line-height:30px;">共有${sessionScope.myDiscuss.getTotalRows()}条帖子</span>
						      </div>
					          <div class="middle_right_3">
				                <table border="0" width="100%" height="40px"  style="table-layout:fixed;word-wrap:break-word;border-collapse:collapse;">
							        <tr style="text-align:center;font-weight:bold;">
							           <td width="70%" style="font-size:80%;">内容</td>        
							           <td width="30%" style="font-size:80%">操作</td>
							        </tr>
							    </table>
			                  </div>
				              <c:forEach items="${sessionScope.myDiscuss.getResultList()}" var="item" varStatus="idxStatus">
				                  <div class="middle_right_4" onmouseover="this.style.background='#EEEEEE'" onmouseout="this.style.background='white'">
					                  <span style="float:left;margin-top:10px;margin-left:2%;width:68%;height:140px;">
					                      <a href="${pageContext.request.contextPath }/studyCenter/2/1?disscussId=${item.get('studyDiscussInfoId')}"><span style="float:left;width:100%;height:30px;text-align:left;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;">${item.get('discussTitle')}</span></a>
					                      <span style="float:left;width:100%;height:110px;text-align:left;font-size:85%;color:gray;overflow:hidden;">${item.get('discussContent')}</span>
					                  </span>
					                  <span style="float:left;text-align:center;margin-top:10px;margin-left:2%;width:26%;height:100px;">
					                      <a href="${pageContext.request.contextPath }/person/2/1?d=${item.get('studyDiscussInfoId')}" style="line-height:130px;">  删除</a>
					                  </span>
					                  <span style="float:right;text-align:left;margin-top:10px;margin-left:2%;width:19%;height:30px;">
					                      <fmt:formatDate value="${item.get('sendDiscussTime')}" pattern="yyyy-MM-dd"/>
					                  </span>
					              </div>
				              </c:forEach>
			              </c:when>
			              <c:otherwise>
			                  <span style="float:left;margin-top:100px;width:100%;height:100px;">
			                      <span style="float:left;margin-left:25%;width:10%;height:100px;background:pink;"><img src="./images/showAllGoods/pig.jpg" width="100%" height="100%"/></span>
			                      <span style="float:left;margin-left:2%;text-align:left;line-height:60px;width:63%;height:100px;background:white;">
			                          <font style="float:left;">您当前没有任何帖子，赶紧去</font>
			                          <a class="b" href="${pageContext.request.contextPath }/studyCenter/2" style="float:left;margin-left:10px;">发贴</a>
			                      </span>
			                  </span>
			              </c:otherwise>
		              </c:choose>    
          </div>
      </div>
      </center>
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
    </div>
   </center>
  </body>
</html>
