<%@ page language="java" import="java.util.*,com.school.domain.personbeans.*;" pageEncoding="utf-8"%>
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
    
    <title>校园资讯</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/schoolState/schoolNews.css ">
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
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/login?pageSource=d1" style="float:left;margin-left:10px;font-size:80%;line-height:28px;text-decoration:none;">请登录</a> 
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/regist?pageSource=d1" style="float:left;margin-left:20px;font-size:80%;line-height:28px;text-decoration:none;">[免费注册]</a>
                 </c:when>
                 <c:otherwise>
                     <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=d1">
                     <span style="float:left;margin-top:5px;margin-left:30px;width:20px;height:20px;border-radius:15px;cursor:pointer;"><img src="${sessionScope.user.getUserPhoto()}" title="${sessionScope.user.getUserName()}" style="border-radius:15px;width:100%;height:100%;"/></span>
                     <font style="float:left;margin-left:5px;font-size:80%;line-height:28px;text-decoration:none;">${sessionScope.user.getUserName()}</font>
                     </a>
                     <a class="a1" href="${pageContext.request.contextPath }/person/user/exit?pageSource=d1" style="float:left;margin-left:10px;font-size:80%;line-height:27px;text-decoration:none;">注销</a>
                 </c:otherwise>
             </c:choose>
             <span id="showBar" style="float:right;width:60px;height:30px;text-align:center;margin-right:150px;cursor:default;font-size:80%;line-height:28px;color:gray;" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='visible';this.style.color='red';this.style.background='white'" onmouseout="this.style.color='gray';">网站导航</span>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/6?pageSource=d1" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">卖家中心</a>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=d1" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">个人中心</a>
        </div>
        <div class="bg" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
            <div class="head">
                <span class="head_1">
                   <img src="./images/schoolState/schoolNews/school.jpg" width="250px" height="80px;" style="float:left;"/>
                    <span style="float:left;margin-top:15px;width:10%;height:50px;background:white;color:gray;">
                        <font style="float:left;margin-left:5px;">团结</font>
                        <font style="float:left;margin-left:10px;">勤奋</font><br/>
                        <font style="float:left;margin-left:5px;">求实</font>
                        <font style="float:left;margin-left:10px;">创新</font>
                    </span>
                </span>
                <span class="head_2">
                    <a  href="${pageContext.request.contextPath }/schoolState/1"><span style="float:left;width:50%;height:100%;color:white;font-size:120%;line-height:40px;" onmouseover="this.style.background='#0078D7'" onmouseout="this.style.background='#448BBF'">首&nbsp&nbsp页</span></a>
                   
                    <a  href="${pageContext.request.contextPath }/schoolState/3"><span style="float:left;width:50%;height:100%;color:white;font-size:120%;line-height:40px;" onmouseover="this.style.background='#0078D7'" onmouseout="this.style.background='#448BBF'">校园通知</span></a>
                </span>
                <span class="head_3">
                    <img src="./images/schoolState/schoolNews/top1.jpg" width="100%" height="100%" style="float:left;"/>
                </span>
            </div>
            
            
            <div class="center">
                <div class="center_1">
                    <div class="center_1_left">
                        <span style="float:left;width:100%;height:30px;background:white;">
                            <font style="float:left;color:#448BBF;">校园视频</font>
                        </span >
                        <span style="float:left;width:50%;height:200px;">
                            <!-- <embed src="https://imgcache.qq.com/tencentvideo_v1/playerv3/TPout.swf?max_age=86400&v=20161117&vid=z1413bs2hek&auto=0" allowFullScreen="true" quality="high" width="100%" height="100%" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash"></embed> -->
                            <%-- <video title="<%=schoolVideo.get(0).get("schoolVideoTitle")%>" src="<%=schoolVideo.get(0).get("schoolVideoSrc")%>" controls="controls" autoplay="autoplay" style="width:100%;height:100%;cursor:pointer;"></video> --%>
                            <!-- <iframe frameborder="0" width="90%" height="100%" src="./video/4.mp4"  allowtransparency=false></iframe> -->
                            <video  src="./video/4.mp4" controls="controls"  style="width:90%;height:100%;cursor:pointer;"></video>
                        </span>
                        <div style="float:right;width:50%;height:200px;">
                            <video  src="./video/2.mp4" controls="controls" style="width:90%;height:100%;cursor:pointer;"></video>
                            <!-- <iframe frameborder="0" width="90%" height="100%" src="./video/4.mp4"  allowfullscreen></iframe> -->
                            <!-- <video  src="./video/3.mp4" controls="controls" style="width:100%;height:50%;cursor:pointer;"></video>
                            <video  src="./video/2.mp4" controls="controls" style="width:80%;height:50%;cursor:pointer;"></video> -->
                            <!-- <iframe frameborder="0" width="70%" height="90px" src="./video/4.mp4"  allowfullscreen></iframe>
                            <iframe frameborder="0" style="margin-top:15px;"width="70%" height="90px" src="https://v.qq.com/iframe/player.html?vid=s0186yq2i9o&tiny=0&auto=0"  allowfullscreen></iframe> -->
                        </div>
                        
                    </div>
                    <div class="center_1_right">
                           <span style="float:left;width:100%;height:20px;text-align:left;color:#448BBF;">热门视频</span>
                           <!-- 这里最多容纳6条 -->
                           <c:forEach items="${sessionScope.schoolVideo}" var="item" begin="0" end="5">
	                           <span style="float:left;margin-top:10px;width:100%;height:25px;">
	                               <span style="float:left;margin-top:5px;width:7px;height:7px;background:#448BBF;border-radius:10px;"></span>
	                               <span style="float:left;margin-top:5px;width:7px;height:7px;background:white;"></span>
	                               <a class="c" href="${pageContext.request.contextPath }/schoolState/videoPlayer?title=${item.get('schoolVideoTitle')}&src=${ item.get('schoolVideoSrc')}" target="_blank" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='none'"><span style="float:left;text-align:left;width:75%;font-size:80%;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;">${item.get('schoolVideoTitle')}</span></a>
	                               <span style="float:right;font-size:80%;"><fmt:formatDate value="${item.get('schoolVideoDate')}" pattern="MM-dd"/></span>
	                           </span>
                           </c:forEach>
                          
                    </div>
                </div>
                <div class="center_2">
                    <div class="center_2_left">
                        <span style="float:left;width:100%;height:20px;text-align:left;color:#448BBF;">最新动态</span>
                        <span style="float:left;width:45%;margin-top:2%;height:92%;background:white;">
                            <span style="float:left;margin-left:3%;width:94%;height:65%;background:white;"><a href="http://www.jxau.edu.cn/e9/16/c50a59670/page.htm" target="_blank"><img src="http://www.jxau.edu.cn/_upload/article/images/f5/12/666b2109476eb02a3f318b82ce65/c078009f-cf37-4186-a9c9-4d6dd6e886c4.jpg" width="100%" height="100%" style="float:left;"/></a></span>
                            <span style="float:left;margin-left:3%;margin-top:3%;width:45%;height:30%;background:white;"><a href="http://www.jxau.edu.cn/e9/05/c50a59653/page.htm" target="_blank"><img src="http://www.jxau.edu.cn/_upload/article/images/4a/34/febe36584e7a9cec08c21004a2b4/24e092fe-a12e-4cde-aedf-4fcd225c95f3.png" width="100%" height="100%" style="float:left;"/></a></span>
                            <span style="float:right;margin-right:3%;margin-top:3%;width:45%;height:30%;background:white;"><a href="http://www.jxau.edu.cn/e8/c7/c50a59591/page.htm" target="_blank"><img src="http://www.jxau.edu.cn/_upload/article/images/78/8f/04b8d00f457c8b3d5d4d914d06aa/ee00ad48-07b3-4fd1-898d-b16dd700d8be.jpg" width="100%" height="100%" style="float:left;"/></a></span>
                        </span>
                        <c:forEach items="${sessionScope.schoolNews}" var="item" begin="0" end="3">    
                             <span style="float:right;margin-top:1.5%;width:55%;height:20%;font-size:90%;">
	                             <span style="float:left;text-align:left;width:95%;margin-top:5px;height:20px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;"><a class="c" href="${item.get('schoolNewsSrc')}" target="_blank" style="text-align:left;">${item.get('schoolNewsTitle')}</a></span>
	                             <span style="float:left;text-align:left;width:95%;margin-top:2px;height:32px;color:gray;font-size:80%;text-overflow:ellipsis;overflow:hidden;">${item.get('schoolNewsContent')}</span>
                             </span> 
                        </c:forEach> 
                    </div>
                    <div class="center_2_right">
                        <span style="float:left;width:100%;height:20px;text-align:left;color:#448BBF;">通知公告</span>
                        <!-- 最多放8条，每条包含标题，时间，不宜过长 -->
                         <c:forEach items="${sessionScope.schoolReform}" var="item" begin="0" end="7">          
	                        <span style="float:left;width:100%;height:25px;margin-top:10px;">
	                            <span style="float:left;margin-top:5px;width:7px;height:7px;background:#448BBF;border-radius:10px;"></span>
	                            <span style="float:left;margin-top:5px;width:7px;height:7px;background:white;"></span>
	                            <a class="c" target="_blank" href="${item.get('schoolReformSrc')}"  onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='none'"><span style="float:left;width:75%;text-align:left;font-size:80%;height:20px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;">${item.get('schoolReformTitle')}</span></a>
	                            <span style="float:right;font-size:0.8em;"><fmt:formatDate value="${item.get('schoolReformDate')}" pattern="MM-dd"/></span>
	                        </span>
	                     </c:forEach>  
                    </div>
                </div>
                <div class="center_3">
                    <span style="float:left;width:100%;height:30px;background:#448BBF;color:white;">校园风光</span>
                    <div class="imgs">
                        <span id="photos" class="photos">
                            <span style="float:left;margin-left:25px;margin-top:10px;width:150px;height:130px;background:blue;"><img src="http://www.jxau.edu.cn/_upload/article/cc/ad/d47d3f6942d184ff9ca00977a508/9c036026-db7a-485a-bfab-2d541a97a549.jpg" width="100%" height="100%" style="float:left;"/></span>
	                        <span style="float:left;margin-left:10px;margin-top:10px;width:150px;height:130px;background:blue;"><img src="http://www.jxau.edu.cn/_upload/article/cc/ad/d47d3f6942d184ff9ca00977a508/91dd800f-09dc-415e-a362-fd55da3e8827.jpg" width="100%" height="100%" style="float:left;"/></span>
	                        <span style="float:left;margin-left:10px;margin-top:10px;width:150px;height:130px;background:blue;"><img src="http://www.jxau.edu.cn/_upload/article/cc/ad/d47d3f6942d184ff9ca00977a508/c8b444b8-1d15-4630-8d46-4a78d97b2324.jpg" width="100%" height="100%" style="float:left;"/></span>
	                        <span style="float:left;margin-left:10px;margin-top:10px;width:150px;height:130px;background:blue;"><img src="http://www.jxau.edu.cn/_upload/article/cc/ad/d47d3f6942d184ff9ca00977a508/8ec25b16-99fa-4ffd-af38-f862dc3a7cea.jpg" width="100%" height="100%" style="float:left;"/></span>
	                        <span style="float:left;margin-left:10px;margin-top:10px;width:150px;height:130px;background:blue;"><img src="http://www.jxau.edu.cn/_upload/article/cc/ad/d47d3f6942d184ff9ca00977a508/2f303491-b912-4141-bbd8-7131a16a0719.jpg" width="100%" height="100%" style="float:left;"/></span>
	                        <span style="float:left;margin-left:25px;margin-top:10px;width:150px;height:130px;background:blue;"><img src="http://www.jxau.edu.cn/_upload/article/cc/ad/d47d3f6942d184ff9ca00977a508/95849c1e-bebc-4846-8b22-fabacbe5a49c.jpg" width="100%" height="100%" style="float:left;"/></span>  
                            <span style="float:left;margin-left:10px;margin-top:10px;width:150px;height:130px;background:blue;"><img src="http://www.jxau.edu.cn/_upload/article/cc/ad/d47d3f6942d184ff9ca00977a508/cbae742f-409d-48e0-9ebc-41cf241b9415.jpg" width="100%" height="100%" style="float:left;"/></span>
	                        <span style="float:left;margin-left:10px;margin-top:10px;width:150px;height:130px;background:blue;"><img src="http://www.jxau.edu.cn/_upload/article/cc/ad/d47d3f6942d184ff9ca00977a508/973f4b25-9443-499c-89fc-d51bd5157432.jpg" width="100%" height="100%" style="float:left;"/></span>
	                        <span style="float:left;margin-left:10px;margin-top:10px;width:150px;height:130px;background:blue;"><img src="http://www.jxau.edu.cn/_upload/article/cc/ad/d47d3f6942d184ff9ca00977a508/206aac28-9988-4fd1-838d-acc0d5091d8c.jpg" width="100%" height="100%" style="float:left;"/></span>
	                        <span style="float:left;margin-left:10px;margin-top:10px;width:150px;height:130px;background:blue;"><img src="http://www.jxau.edu.cn/_upload/article/cc/ad/d47d3f6942d184ff9ca00977a508/198af409-0a7d-4aa7-93da-5faeece4241c.jpg" width="100%" height="100%" style="float:left;"/></span>
                        </span>
                    </div>
                </div>
            </div>
            
            <div class="bottom">
                  <div class="bottom_1">
                      <a class="b" href="${pageContext.request.contextPath }/market/First" style="float:left;margin-left:35%;text-decoration:none;font-size:90%;">导航首页</a>
                      <font style="float:left;margin-left:10px;margin-right:10px;font-size:90%;color:white;">|</font>
                      <a class="b" href="${pageContext.request.contextPath }/life/1" style="float:left;text-decoration:none;font-size:90%;">生活中心</a>
                      <font style="float:left;margin-left:10px;margin-right:10px;font-size:90%;color:white;">|</font>
                      <a class="b" href="${pageContext.request.contextPath }/studyCenter/1" style="float:left;text-decoration:none;font-size:90%;">学习交流</a>
                      <font style="float:left;margin-left:10px;margin-right:10px;font-size:90%;color:white;">|</font>
                      <a class="b" href="${pageContext.request.contextPath }/schoolState/1" style="float:left;text-decoration:none;font-size:90%;">校园动态</a>
                      <font style="float:left;margin-left:10px;margin-right:10px;font-size:90%;color:white;">|</font>
                      <a class="b" href="${pageContext.request.contextPath }/person/us" style="float:left;text-decoration:none;font-size:90%;">关于我们</a>
                  </div>
                  <div class="bottom_2">
                      <center style="font-size:80%;color:gray;">
                        <br/><br/><br/><br/>
                                                               地址:江西农业大学软件学院1608班      编码:330045<br/>
                                                               版权所有: 李际明
                      </center>
                  </div>
            </div>
        </div>
    </center>
     
  </body>
</html>
