<%@ page language="java" import="java.util.*,
com.school.domain.personbeans.*,
com.school.utils.*
" pageEncoding="utf-8"%>


<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>校园通知</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/schoolState/schoolReform.css ">
    <script type="text/javascript">
        function changeBtnLength(obj){
            obj.style.width="60%";
            var btn1 = document.getElementById('btn1');
            var btn2 = document.getElementById('btn2');
            var btn3 = document.getElementById('btn3');
            var btn4 = document.getElementById('btn4');
            if(obj==btn1){
                btn2.style.width="30%";
                btn3.style.width="30%";
                btn4.style.width="30%";
            }else if(obj==btn2){
                btn1.style.width="30%";
                btn3.style.width="30%";
                btn4.style.width="30%";
            }if(obj==btn3){
                btn1.style.width="30%";
                btn2.style.width="30%";
                btn4.style.width="30%";
            }if(obj==btn4){
                btn1.style.width="30%";
                btn2.style.width="30%";
                btn3.style.width="30%";
            }
        }
    </script>
    
     <%
       User user = (User)session.getAttribute("user");
       PageUtil schoolReformPage = (PageUtil)session.getAttribute("schoolPartReform");
       //得到该页的记录
       List<Map<String,Object>> schoolReform = schoolReformPage.getResultList();
     %>
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
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/login?pageSource=d3" style="float:left;margin-left:10px;font-size:80%;line-height:28px;text-decoration:none;">请登录</a> 
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/regist?pageSource=d3" style="float:left;margin-left:20px;font-size:80%;line-height:28px;text-decoration:none;">[免费注册]</a>
                 </c:when>
                 <c:otherwise>
                     <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=d3">
                     <span style="float:left;margin-top:5px;margin-left:30px;width:20px;height:20px;border-radius:15px;cursor:pointer;"><img src="${sessionScope.user.getUserPhoto()}" title="${sessionScope.user.getUserName()}" style="border-radius:15px;width:100%;height:100%;"/></span>
                     <font style="float:left;margin-left:5px;font-size:80%;line-height:28px;text-decoration:none;">${sessionScope.user.getUserName()}</font>
                     </a>
                     <a class="a1" href="${pageContext.request.contextPath }/person/user/exit?pageSource=d3" style="float:left;margin-left:10px;font-size:80%;line-height:27px;text-decoration:none;">注销</a>
                 </c:otherwise>
             </c:choose>
             <span id="showBar" style="float:right;width:60px;height:30px;text-align:center;margin-right:150px;cursor:default;font-size:80%;line-height:28px;color:gray;" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='visible';this.style.color='red';this.style.background='white'" onmouseout="this.style.color='gray';">网站导航</span>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/6?pageSource=d3" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">卖家中心</a>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=d3" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">个人中心</a>
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
                    <img src="./images/schoolState/schoolReform/bottomtp.gif" width="100%" height="100%" style="float:left;"/>
                </span>
            </div>
            
            
            <div class="center">
                <div class="center_left">
                    <span style="float:left;text-align:left;font-weight:bold;width:100%;height:28px;border-bottom:2px solid #448BBF">通知类型</span>
                    <c:if test="${reformType==1 || reformType==null}">
	                    <span style="float:left;margin-top:30px;width:100%;height:40px;background:white;">
	                        <a href="${pageContext.request.contextPath }/schoolState/3?type=1"><span id="btn1" style="float:left;width:60%;height:40px;background:#448BBF;color:white;line-height:35px;font-size:110%;border-radius:0px 10px 10px 0px;" onclick="changeBtnLength(this);">考试招聘</span></a>
	                    </span>
	                    <span style="float:left;margin-top:30px;width:100%;height:40px;background:white;">
	                        <a href="${pageContext.request.contextPath }/schoolState/3?type=2"><span id="btn2" style="float:left;width:30%;height:40px;background:#448BBF;color:white;line-height:35px;font-size:110%;border-radius:0px 10px 10px 0px;" onclick="changeBtnLength(this);">活动竞赛</span></a>
	                    </span>
	                    <span style="float:left;margin-top:30px;width:100%;height:40px;background:white;">
	                        <a href="${pageContext.request.contextPath }/schoolState/3?type=3"><span id="btn3" style="float:left;width:30%;height:40px;background:#448BBF;color:white;line-height:35px;font-size:110%;border-radius:0px 10px 10px 0px;" onclick="changeBtnLength(this);">校历讯息</span></a>
	                    </span>
	                    <span style="float:left;margin-top:30px;width:100%;height:40px;background:white;">
	                        <a href="${pageContext.request.contextPath }/schoolState/3?type=4"><span id="btn4" style="float:left;width:30%;height:40px;background:#448BBF;color:white;line-height:35px;font-size:110%;border-radius:0px 10px 10px 0px;" onclick="changeBtnLength(this);">注意事项</span></a>
	                    </span>
                    </c:if>
                    <c:if test="${reformType==2}">
	                    <span style="float:left;margin-top:30px;width:100%;height:40px;background:white;">
	                        <a href="${pageContext.request.contextPath }/schoolState/3?type=1"><span id="btn1" style="float:left;width:30%;height:40px;background:#448BBF;color:white;line-height:35px;font-size:110%;border-radius:0px 10px 10px 0px;" onclick="changeBtnLength(this);">考试招聘</span></a>
	                    </span>
	                     <span style="float:left;margin-top:30px;width:100%;height:40px;background:white;">
	                        <a href="${pageContext.request.contextPath }/schoolState/3?type=2"><span id="btn2" style="float:left;width:60%;height:40px;background:#448BBF;color:white;line-height:35px;font-size:110%;border-radius:0px 10px 10px 0px;" onclick="changeBtnLength(this);">活动竞赛</span></a>
	                    </span>
	                    <span style="float:left;margin-top:30px;width:100%;height:40px;background:white;">
	                        <a href="${pageContext.request.contextPath }/schoolState/3?type=3"><span id="btn3" style="float:left;width:30%;height:40px;background:#448BBF;color:white;line-height:35px;font-size:110%;border-radius:0px 10px 10px 0px;" onclick="changeBtnLength(this);">校历讯息</span></a>
	                    </span>
	                    <span style="float:left;margin-top:30px;width:100%;height:40px;background:white;">
	                        <a href="${pageContext.request.contextPath }/schoolState/3?type=4"><span id="btn4" style="float:left;width:30%;height:40px;background:#448BBF;color:white;line-height:35px;font-size:110%;border-radius:0px 10px 10px 0px;" onclick="changeBtnLength(this);">注意事项</span></a>
	                    </span>
                    </c:if>
                    <c:if test="${reformType==3}">
	                    <span style="float:left;margin-top:30px;width:100%;height:40px;background:white;">
	                        <a href="${pageContext.request.contextPath }/schoolState/3?type=1"><span id="btn1" style="float:left;width:30%;height:40px;background:#448BBF;color:white;line-height:35px;font-size:110%;border-radius:0px 10px 10px 0px;" onclick="changeBtnLength(this);">考试招聘</span></a>
	                    </span>
	                     <span style="float:left;margin-top:30px;width:100%;height:40px;background:white;">
	                        <a href="${pageContext.request.contextPath }/schoolState/3?type=2"><span id="btn2" style="float:left;width:30%;height:40px;background:#448BBF;color:white;line-height:35px;font-size:110%;border-radius:0px 10px 10px 0px;" onclick="changeBtnLength(this);">活动竞赛</span></a>
	                    </span>
	                    <span style="float:left;margin-top:30px;width:100%;height:40px;background:white;">
	                        <a href="${pageContext.request.contextPath }/schoolState/3?type=3"><span id="btn3" style="float:left;width:60%;height:40px;background:#448BBF;color:white;line-height:35px;font-size:110%;border-radius:0px 10px 10px 0px;" onclick="changeBtnLength(this);">校历讯息</span></a>
	                    </span>
	                    <span style="float:left;margin-top:30px;width:100%;height:40px;background:white;">
	                        <a href="${pageContext.request.contextPath }/schoolState/3?type=4"><span id="btn4" style="float:left;width:30%;height:40px;background:#448BBF;color:white;line-height:35px;font-size:110%;border-radius:0px 10px 10px 0px;" onclick="changeBtnLength(this);">注意事项</span></a>
	                    </span>
                    </c:if>
                    <c:if test="${reformType==4}">
	                    <span style="float:left;margin-top:30px;width:100%;height:40px;background:white;">
	                        <a href="${pageContext.request.contextPath }/schoolState/3?type=1"><span id="btn1" style="float:left;width:30%;height:40px;background:#448BBF;color:white;line-height:35px;font-size:110%;border-radius:0px 10px 10px 0px;" onclick="changeBtnLength(this);">考试招聘</span></a>
	                    </span>
	                     <span style="float:left;margin-top:30px;width:100%;height:40px;background:white;">
	                        <a href="${pageContext.request.contextPath }/schoolState/3?type=2"><span id="btn2" style="float:left;width:30%;height:40px;background:#448BBF;color:white;line-height:35px;font-size:110%;border-radius:0px 10px 10px 0px;" onclick="changeBtnLength(this);">活动竞赛</span></a>
	                    </span>
	                    <span style="float:left;margin-top:30px;width:100%;height:40px;background:white;">
	                        <a href="${pageContext.request.contextPath }/schoolState/3?type=3"><span id="btn3" style="float:left;width:30%;height:40px;background:#448BBF;color:white;line-height:35px;font-size:110%;border-radius:0px 10px 10px 0px;" onclick="changeBtnLength(this);">校历讯息</span></a>
	                    </span>
	                    <span style="float:left;margin-top:30px;width:100%;height:40px;background:white;">
	                        <a href="${pageContext.request.contextPath }/schoolState/3?type=4"><span id="btn4" style="float:left;width:60%;height:40px;background:#448BBF;color:white;line-height:35px;font-size:110%;border-radius:0px 10px 10px 0px;" onclick="changeBtnLength(this);">注意事项</span></a>
	                    </span>
                    </c:if>
                </div>
                <div class="center_right">
	                    <span style="float:left;text-align:left;font-weight:bold;width:100%;height:28px;border-bottom:2px solid #448BBF">校园通知</span>
	                    <div style="float:left;width:100%;height:350px;background:white;">
	                          <%
	                              for(int i=0;i<schoolReform.size();i++){
	                                   String reformDate = schoolReform.get(i).get("schoolReformDate").toString();
		                               String[] str = reformDate.split("-");
		                               reformDate = str[1]+"-"+str[2];
	                          %>
			                          <span style="float:left;margin-top:5px;width:100%;height:30px;">
			                               <span style="float:left;margin-top:7px;width:7px;height:7px;background:#448BBF;border-radius:10px;"></span>
			                               <span><a class="c" target="_blank" href="<%=schoolReform.get(i).get("schoolReformSrc")%>" style="float:left;margin-left:10px;text-decoration:none;font-size:100%;" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='none'"><%=schoolReform.get(i).get("schoolReformTitle")%></a></span>
			                               <span style="float:right;margin-top:5px;font-size:100%;color:gray;"><%=reformDate%></span>
			                          </span>
	                          <%
	                           }
	                          %>
	                    </div>
	                    <div style="float:left;margin-top:20px;width:100%;height:20px;line-height:40px">
	                              <span style="float:left;color:gray;">共<%=schoolReformPage.getTotalRows()%>条记录</span>
	                              <!-- 首页 -->
	                              <%
	                                 if(schoolReformPage.getCurrentPage()==1){
	                              %>
	                                    <a href="javascript:void(0);">首页</a>
	                              <%
	                               }else{
	                              %>
	                                    <a href="${pageContext.request.contextPath }/schoolState/3?type=${reformType}&page=1">首页</a>
	                              <%
	                               }
	                              %>
	                              
	                              <!-- 上一页 -->
	                              <%
	                                 if(schoolReformPage.getCurrentPage()==1){
	                              %>
	                                    <a href="javascript:void(0);">上一页</a>
	                              <%
	                               }else{
	                              %>
	                                    <a href="${pageContext.request.contextPath }/schoolState/3?type=${reformType}&page=<%=schoolReformPage.getCurrentPage()-1%>">上一页</a>
	                              <%
	                               }
	                              %>
	                              
	                              <!-- 下一页 -->
	                              <%
	                                 if(schoolReformPage.getCurrentPage()==schoolReformPage.getTotalPages()){
	                              %>
	                                    <a href="javascript:void(0);">下一页</a>
	                              <%
	                               }else{
	                              %>
	                                    <a href="${pageContext.request.contextPath }/schoolState/3?type=${reformType}&page=<%=schoolReformPage.getCurrentPage()+1%>">下一页</a>
	                              <%
	                               }
	                              %>
	                              
	                              <!-- 尾页 -->
	                              <%
	                                 if(schoolReformPage.getCurrentPage()==schoolReformPage.getTotalPages()){
	                              %>
	                                    <a href="javascript:void(0);">尾页</a>
	                              <%
	                               }else{
	                              %>
	                                    <a href="${pageContext.request.contextPath }/schoolState/3?type=${reformType}&page=<%=schoolReformPage.getTotalPages()%>">尾页</a>
	                              <%
	                               }
	                              %>
	                              
	                              
       
       
	                              <span style="float:right;color:gray;">当前页:<%=schoolReformPage.getCurrentPage()%>/<%=schoolReformPage.getTotalPages()%></span>
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
