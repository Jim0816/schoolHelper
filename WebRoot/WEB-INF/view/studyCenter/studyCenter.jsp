<%@ page language="java" import="java.util.*,com.school.domain.*,com.school.domain.personbeans.*" pageEncoding="UTF-8"%>
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
    
    <title>学习交流</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/studyCenter/studyCenter.css ">
	<script type="text/javascript">
	    window.onload = function(){
			var flag=0;
			var imgs = document.getElementById('imgs');
			function move(){
		  	  if(flag==0){
		  		imgs.style.left = '0px';
		  	  }else if(flag==1){
		  		imgs.style.left = '-1200px'; 
		  	  }else if(flag==2){
		  		imgs.style.left = '-2400px'; 
		  	  }else if(flag==3){
		  		imgs.style.left = '-3600px'; 
		  		flag=-1;
		  	  }
		  	  flag++;
		    }
			var timer = setInterval(move,2000);//全局变量 ，保存返回的定时器
			imgs.addEventListener('mouseout', function () {
		      timer = setInterval(move,2000);
		    },false);
			imgs.addEventListener('mousemove', function () {
		      clearInterval(timer);//鼠标移入清除定时器
		    },false);
		};
	</script>
  </head>
  
  <body>
    <%
        User user = (User)session.getAttribute("user");
        List<Map<String, Object>> scoreLink  = (List<Map<String, Object>>)session.getAttribute("scoreLink");
        List<Map<String, Object>> twelveShareData  = (List<Map<String, Object>>)session.getAttribute("twelveShareData");
    %>
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
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/login?pageSource=c1" style="float:left;margin-left:10px;font-size:80%;line-height:28px;text-decoration:none;">请登录</a> 
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/regist?pageSource=c1" style="float:left;margin-left:20px;font-size:80%;line-height:28px;text-decoration:none;">[免费注册]</a>
                 </c:when>
                 <c:otherwise>
                     <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=c1">
                     <span style="float:left;margin-top:5px;margin-left:30px;width:20px;height:20px;border-radius:15px;cursor:pointer;"><img src="${sessionScope.user.getUserPhoto()}" title="${sessionScope.user.getUserName()}" style="border-radius:15px;width:100%;height:100%;"/></span>
                     <font style="float:left;margin-left:5px;font-size:80%;line-height:28px;text-decoration:none;">${sessionScope.user.getUserName()}</font>
                     </a>
                     <a class="a1" href="${pageContext.request.contextPath }/person/user/exit?pageSource=c1" style="float:left;margin-left:10px;font-size:80%;line-height:27px;text-decoration:none;">注销</a>
                 </c:otherwise>
             </c:choose>
             <span id="showBar" style="float:right;width:60px;height:30px;text-align:center;margin-right:150px;cursor:default;font-size:80%;line-height:28px;color:gray;" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='visible';this.style.color='red';this.style.background='white'" onmouseout="this.style.color='gray';">网站导航</span>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/6?pageSource=c1" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">卖家中心</a>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=c1" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">个人中心</a>
        </div>
        <div class="bg" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
            <div class="head">
                <div class="head_center">
                    <img class="head_center_logo" src="./images/studyCenter/logo.jpg"/>
                    <span class="center_search">
                        <input type="text" style="float:left;width:80%;height:30px;border:1px solid #DFDFDF"/>
                        <a href="#"><span class="head_center_search_btn"><img src="./images/studyCenter/search.jpg" width="100%" height="100%"/></span></a>
                    </span>

                </div>
            </div>
            <div class="center">
                <div class="center_top_bar">
                    <a href="${pageContext.request.contextPath }/studyCenter/1"><span class="select_bar1" onmouseover="this.style.background='white';this.style.color='black'" onmouseout="this.style.background='#F06F4B';this.style.color='white'">首页</span></a>
                    <a href="${pageContext.request.contextPath }/studyCenter/2"><span class="select_bar" onmouseover="this.style.background='white';this.style.color='black'" onmouseout="this.style.background='#F06F4B';this.style.color='white'">交流讨论</span></a>
                    <a href="${pageContext.request.contextPath }/studyCenter/3"><span class="select_bar" onmouseover="this.style.background='white';this.style.color='black'" onmouseout="this.style.background='#F06F4B';this.style.color='white'">资料共享</span></a>
                    <a href="${pageContext.request.contextPath }/studyCenter/4"><span class="select_bar" onmouseover="this.style.background='white';this.style.color='black'" onmouseout="this.style.background='#F06F4B';this.style.color='white'">成绩查询</span></a>
                </div>
                <div class="center_photo">
                    <div id="imgs" class="imgs">
                        <img src="./images/studyCenter/photo1.jpg" style="float:left;width:1200px;height:100%;"/>
                        <img src="./images/studyCenter/photo2.jpg" style="float:left;width:1200px;height:100%;"/>
                        <img src="./images/studyCenter/photo3.jpg" style="float:left;width:1200px;height:100%;"/>
                        <img src="./images/studyCenter/photo1.jpg" style="float:left;width:1200px;height:100%;"/>
                    </div>
                </div>
                <div class="center_1">
                    <span style="float:left;margin-top:10px;width:100%;height:40px;background:#E3DFDE;border-top:1px solid #F06F4B">
                        <img src="./images/studyCenter/tubiao.jpg" style="float:left;margin-top:10px;width:20px;height:20px;"/>
                        <font style="float:left;margin-left:10px;margin-top:8px;color:#F06F4B">热门下载资料</font>
                    </span>
                    <div class="downloadShow">
                        <div style="float:left;margin-top:10px;width:50%;height:340px;background:white;">
                        <c:forEach items="${twelveShareData}" var="item">
                            
                            <span style="float:left;margin-top:5px;width:100%;">
                                <a href="${pageContext.request.contextPath }/studyCenter/3/1?dataId=${item.get('dataShareInfoId')}" style="float:left;margin-left:2%;text-decoration:none;">
	                            <span style="float:left;margin-top:7px;width:5px;height:5px;background:black;border-radius:15px;"></span>
	                            <span style="float:left;margin-left:10px;">${item.get("dataTitle")}</span>                                                                                      
                                </a>
                                <font style="float:right;margin-right:10px;"><fmt:formatDate value="${item.get(\"shareTime\")}" pattern="yyyy-MM-dd"/></font>
                            </span>
                            

                        </c:forEach>


                            
                        </div>
                        <img src="./images/studyCenter/sharedataPhoto.jpg" style="float:left;margin-top:10px;width:600px;height:340px;"/>
                    </div>
                </div>
                
                <div class="center_2">
                    <span style="float:left;margin-top:10px;width:100%;height:40px;background:#E3DFDE;border-top:1px solid #F06F4B">
                        <img src="./images/studyCenter/tubiao.jpg" style="float:left;margin-top:10px;width:20px;height:20px;"/>
                        <font style="float:left;margin-left:10px;margin-top:8px;color:#F06F4B">成绩查询</font>
                    </span>
                    <div class="center_2_left">
                        <a href="${pageContext.request.contextPath }/studyCenter/4"><img src="./images/studyCenter/cjcx.jpg" style="float:left;width:600px;height:250px;"/></a>
                        <div style="float:left;width:240px;height:250px;background:white;">
                             <!-- 最多放八条数据，这里的便签内部值不要太长，否则影响布局 -->
                             <%
                                 for(int i=0;i<scoreLink.size();i++){
                             %>
                             <a href="<%=scoreLink.get(i).get("lookScoreSrc")%>" style="float:left;margin-left:5px;margin-top:8px;"><%=scoreLink.get(i).get("lookScoreTitle")%></a>
                             <%
                              }
                             %>
                        </div>
                    </div>
                    
                    <div class="center_2_right">
                        <form>
                            <table border="1"  width="100%" height="250px" style="table-layout:fixed;word-wrap:break-word;border-collapse:collapse;">
					              <tr height="50px">
					                  <td style="text-align:center;">全国CET成绩查询</td> 
					              </tr>
					              <tr height="50px">
					                  <td style="text-align:center;"><input type="radio" name="cet" checked="checked" value="4"/>四级<input type="radio" name="cet" value="6"/>六级</td> 
					              </tr>
					              <tr height="50px">
					                  <td style="text-align:center;">
					                      <font style="float:left;margin-left:10%;line-height:45px;">准考证号:</font>
					                      <input type="text"  maxlength="10" style="float:left;margin-top:6px;width:60%;border:0px;height:70%;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" />
					                  </td> 
					              </tr>
					              <tr height="50px">
					                  <td style="text-align:center;">
					                      <font style="float:left;margin-left:10%;line-height:45px;">姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名:</font>
					                      <input type="text"  maxlength="10" style="float:left;margin-top:6px;width:60%;border:0px;height:70%;"/>
					                  </td> 
					              </tr>
					              <tr height="50px">
					                  <td style="text-align:center;"><input type="submit" value="查询" style="float:left;width:100%;height:100%;cursor:pointer;"/></td> 
					              </tr>
			                </table>
                        </form>    
                    </div>
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
        </div>
    </center>
      
  </body>
</html>
