<%@ page language="java" import="java.util.*,com.school.domain.*,com.school.domain.personbeans.*,com.school.utils.*;" pageEncoding="utf-8"%>
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
    
    <title>帖子交流</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/studyCenter/discuss.css ">
    <script type="text/javascript">

	    function Scroll(){
	        var center_2_right = document.getElementById('center_2_right');
	        var  center_2= document.getElementById('center_2');
	        if(center_2.offsetTop-document.body.scrollTop<0){
	            center_2_right.style.top="0px";
	        }else{
	            center_2_right.style.top=(410-document.body.scrollTop)+"px";
	        }
	    }
	    
	    
	    function checkSubmit(){
	          if(checkUser()==true && checkText()==true){
		             //满足提交表单的要求
		             return true;
		        }else{
			         //不满足提交表单的要求
		             return false;
		        }
	          //不允许重复提交
	    }
	    
	    //检查用户是否登录
	    function checkUser(){
	       var user='<%=session.getAttribute("user")%>';
	       if(user=="null"||user=="")
			{
			  alert("您还未登陆，请先登录！");
			  return false;
			}else{
			   return true;
	        }
	    }
	    
	    //检查评论区是否数据为空
	    function checkText(){
	       var textArea = document.getElementById("textArea").value.replace(/\s/g, "");
	       if(textArea==""){
	           document.getElementById("tip").style.color='red';
	           return false;
	       }else{
	           return true;
	       }
	    }
	    
	    function checkPageNum(){
		    var allPageNum = document.getElementById("allPageNum").value;
		    var currentPage = document.getElementById("currentPage").value.replace(/\s/g, "");
		    if(currentPage==""){
		        return false;
		    }else{
		        if(Number(allPageNum)<Number(currentPage)){
		       return false;
			    }else{
	               return true;		    
			    }
		    }    
		}
	</script>
  </head>
  
  <body onscroll="Scroll();">
    <%
        String disscussCommentFlag = UUID.randomUUID().toString();
        session.setAttribute("disscussCommentFlag", disscussCommentFlag);
        List<Map<String, Object>> oneDisscussInfo  = (List<Map<String, Object>>)session.getAttribute("oneDisscussInfo");
        PageUtil oneDisscussCommentPage = (PageUtil)session.getAttribute("oneDisscussCommentPage");
        User user = (User)session.getAttribute("user");
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
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/login?pageSource=c21" style="float:left;margin-left:10px;font-size:80%;line-height:28px;text-decoration:none;">请登录</a> 
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/regist?pageSource=c21" style="float:left;margin-left:20px;font-size:80%;line-height:28px;text-decoration:none;">[免费注册]</a>
                 </c:when>
                 <c:otherwise>
                     <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=c21">
                     <span style="float:left;margin-top:5px;margin-left:30px;width:20px;height:20px;border-radius:15px;cursor:pointer;"><img src="${sessionScope.user.getUserPhoto()}" title="${sessionScope.user.getUserName()}" style="border-radius:15px;width:100%;height:100%;"/></span>
                     <font style="float:left;margin-left:5px;font-size:80%;line-height:28px;text-decoration:none;">${sessionScope.user.getUserName()}</font>
                     </a>
                     <a class="a1" href="${pageContext.request.contextPath }/person/user/exit?pageSource=c21" style="float:left;margin-left:10px;font-size:80%;line-height:27px;text-decoration:none;">注销</a>
                 </c:otherwise>
             </c:choose>
             <span id="showBar" style="float:right;width:60px;height:30px;text-align:center;margin-right:150px;cursor:default;font-size:80%;line-height:28px;color:gray;" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='visible';this.style.color='red';this.style.background='white'" onmouseout="this.style.color='gray';">网站导航</span>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/6?pageSource=c21" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">卖家中心</a>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=c21" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">个人中心</a>
        </div>
        <div class="bg" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
            <div class="head">
                
            </div>
            <div class="center">
                <div class="center_top_bar">
                    <a href="${pageContext.request.contextPath }/studyCenter/1"><span class="select_bar1" onmouseover="this.style.background='white';this.style.color='black'" onmouseout="this.style.background='#F06F4B';this.style.color='white'">首页</span></a>
                    <a href="${pageContext.request.contextPath }/studyCenter/2"><span class="select_bar" onmouseover="this.style.background='white';this.style.color='black'" onmouseout="this.style.background='#F06F4B';this.style.color='white'">交流讨论</span></a>
                    <a href="${pageContext.request.contextPath }/studyCenter/3"><span class="select_bar" onmouseover="this.style.background='white';this.style.color='black'" onmouseout="this.style.background='#F06F4B';this.style.color='white'">资料共享</span></a>
                    <a href="${pageContext.request.contextPath }/studyCenter/4"><span class="select_bar" onmouseover="this.style.background='white';this.style.color='black'" onmouseout="this.style.background='#F06F4B';this.style.color='white'">成绩查询</span></a>
                </div>
                <div class="center_1">
                    <span style="float:left;margin-top:10px;width:100%;height:40px;background:#E3DFDE;border-top:1px solid #F06F4B">
                        <img src="./images/studyCenter/tubiao.jpg" style="float:left;margin-top:10px;width:20px;height:20px;"/>
                        <font style="float:left;margin-left:10px;margin-top:8px;color:#F06F4B">热帖互动</font>
                        <a href="${pageContext.request.contextPath }/studyCenter/2"><span style="float:right;margin-right:10px;width:40px;height:40px;background:#F06F4B;border-radius:20px;line-height:35px;font-size:80%;color:white" >看帖</span></a>
                    </span>
                    <img src="./images/studyCenter/discuss/top.jpg" style="float:left;width:100%;height:200px;"/>
                </div>
                
                <div id="center_2" class="center_2">
                    <!-- 帖子区 这里的分页控制一页十条记录比较合适 -->
                    <div class="center_2_left">
                        <span style="float:left;width:100%;height:19px;background:white;border-bottom:1px solid gray"></span>
                        <!-- 这里每个评论板块高度没定死，会根据内容自动放大缩小 -->
	                    
	                    <span style="float:left;margin-top:10px;width:100%;background:white;border-bottom:1px solid gray;">
	                        <span style="float:left;width:15%;">
	                            <span style="float:left;margin-left:5%;width:90%;height:20px;font-size:90%;color:red;">楼主</span>
	                            <span style="float:left;margin-left:20%;width:50%;height:70px;padding:5px;border:1px solid gray;"><img src="<%=oneDisscussInfo.get(0).get("userPhoto")%>" style="width:95%;height:95%;"/></span>
	                            <span style="float:left;margin-left:5%;margin-top:10px;width:90%;height:20px;font-size:90%;color:blue;"><%=oneDisscussInfo.get(0).get("userName")%></span>
	                            <span style="float:left;margin-left:5%;margin-top:10px;width:90%;height:20px;font-size:80%;color:gray;"><fmt:formatDate value="${oneDisscussInfo.get(0).get('sendDiscussTime')}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
	                        </span>
	                        <span style="float:left;margin-top:20px;text-align:left;margin-left:2%;width:80%;background:white;">
	                            <span style="float:left;width:100%;height:40px;text-align:center;font-size:110%;font-weight:bold;"><%=oneDisscussInfo.get(0).get("discussTitle")%></span>
	                            <span style="float:left;width:100%;text-align:left;font-size:90%;color:gray;"><%=oneDisscussInfo.get(0).get("discussContent")%></span>
	                        </span>
	                    </span>
	                    <c:forEach items="${oneDisscussCommentPage.getResultList()}" var="item">
		                    <span style="float:left;margin-top:30px;width:100%;background:white;border-bottom:1px solid gray">
		                        <span style="float:left;width:15%;height:200px;">
		                            <span style="float:left;margin-left:20%;width:50%;height:70px;padding:5px;border:1px solid gray;"><img src="${item.get('userPhoto')}" style="width:95%;height:95%;"/></span>
		                            <span style="float:left;margin-left:5%;margin-top:10px;width:90%;height:20px;font-size:90%;color:blue;">${item.get("userName")}</span>
		                            <span style="float:left;margin-left:5%;margin-top:30px;width:90%;height:20px;font-size:80%;color:gray;"><fmt:formatDate value="${item.get('studyCommentTime')}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
		                        </span>
		                        <span style="float:left;margin-top:20px;text-align:left;margin-left:2%;width:80%;">${item.get('studyCommentContent')}</span>
		                    </span>
	                    </c:forEach>
	                    
                    </div>
                    <div id="center_2_right" class="center_2_right">
                         <c:if test="${user==null}">
                            <div style="float:left;width:100%;height:149px;border-bottom: 1px solid gray;">
	                            <span style="float:left;margin-top:19px;margin-left:5%;text-align:left;font-size:90%;font-weight:bold;width:95%;height:29px;" >我的帖子</span>
	                            <a href="javascript:void(0)" title="我的头像"><span style="float:left;margin-left:5%;width:35%;height:60px;border:1px solid gray;padding:5px;" ><img src="./images/user/gray.jpg" style="float:left;width:100%;height:100%;"/></span></a>
	                            <a href="${pageContext.request.contextPath }/person/user/login?pageSource=c21" class="aaa" style="float:left;margin-left:10px;text-decoration:none;font-size:80%;">请登录</a>
                            </div>
                        </c:if>
                        <c:if test="${user!=null}">
                            <div style="float:left;width:100%;height:149px;border-bottom: 1px solid gray;background:white;">
	                            <span style="float:left;margin-top:19px;margin-left:5%;text-align:left;font-size:90%;font-weight:bold;width:95%;height:29px;" >我的帖子</span>
	                            <a href="${pageContext.request.contextPath }/person/1/1?pageSource=c21" title="我的头像"><span style="float:left;margin-left:5%;width:35%;height:60px;border:1px solid gray;padding:5px;" ><img src="${sessionScope.user.getUserPhoto()}" style="float:left;width:100%;height:100%;"/></span></a>
	                            <span style="float:left;width:50%;height:70px;background:white;">
	                                <a href="${pageContext.request.contextPath }/person/1/1?pageSource=c21" class="aaa" style="text-decoration:none;"><span style="float:left;margin-left:5%;text-align:left;width:95%;height:40px;font-size:80%;">${sessionScope.user.getUserName()}</span></a>
	                                <a href="${pageContext.request.contextPath }/person/1/4?pageSource=c21" class="aaa" style="text-decoration:none;font-size:80%;"><span style="float:left;text-align:left;margin-left:5%;width:95%;font-size:80%;">[管理]</span></a>
	                            </span>
                            </div>
                        </c:if>
                        
                        <div style="float:left;width:100%;height:399px;border-bottom: 1px solid gray;">
                            <span style="float:left;margin-left:5%;width:95%;height:49px;text-align:left;line-height:30px;font-size:90%;font-weight:bold;width:95%;height:29px;background:white;">热搜榜</span>
                            <c:if test="${tenTopDiscuss.size()>0}">
	                            <div style="float:left;margin-left:5%;width:95%;height:20px;">
	                                <a  class="b" href="${pageContext.request.contextPath }/studyCenter/2/1?disscussId=${tenTopDiscuss.get(0).get('studyDiscussInfoId')}" >
	                                    <span style="float:left;text-align:center;width:10%;height:15px;font-size:70%;background:#F06F4B;border:0px solid #DFDFDF">1</span>
	                                    <span style="float:left;text-align:left;width:90%;height:15px;font-size:90%;overflow:hidden;"><font style="float:left;margin-left:5px;font-size:70%;" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='none'">${tenTopDiscuss.get(0).get('discussTitle')}</font></span>
	                                </a>
	                            </div>
                            </c:if>
                            <c:if test="${tenTopDiscuss.size()>1}">
	                            <div style="float:left;margin-top:10px;margin-left:5%;width:95%;height:20px;">
	                                <a  class="b" href="${pageContext.request.contextPath }/studyCenter/2/1?disscussId=${tenTopDiscuss.get(1).get('studyDiscussInfoId')}" >
	                                    <span style="float:left;text-align:center;width:10%;height:15px;font-size:70%;background:#F06F4B;border:0px solid #DFDFDF">2</span>
	                                    <span style="float:left;text-align:left;width:90%;height:15px;font-size:90%;overflow:hidden;"><font style="float:left;margin-left:5px;font-size:70%;" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='none'">${tenTopDiscuss.get(1).get('discussTitle')}</font></span>
	                                </a>
	                            </div>
                            </c:if>
                            <c:if test="${tenTopDiscuss.size()>2}">
	                            <div style="float:left;margin-top:10px;margin-left:5%;width:95%;height:20px;">
	                                <a  class="b" href="${pageContext.request.contextPath }/studyCenter/2/1?disscussId=${tenTopDiscuss.get(2).get('studyDiscussInfoId')}" >
	                                    <span style="float:left;text-align:center;width:10%;height:15px;font-size:70%;background:#F06F4B;border:0px solid #DFDFDF">3</span>
	                                    <span style="float:left;text-align:left;width:90%;height:15px;font-size:90%;overflow:hidden;"><font style="float:left;margin-left:5px;font-size:70%;" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='none'">${tenTopDiscuss.get(2).get('discussTitle')}</font></span>
	                                </a>
	                            </div>
                            </c:if>
                            <c:forEach items="${tenTopDiscuss}" var="item" begin="3" end="9" varStatus="idxStatus">
                                <div style="float:left;margin-top:10px;margin-left:5%;width:95%;height:20px;overflow:hidden;">
	                                <a  class="b" href="${pageContext.request.contextPath }/studyCenter/2/1?discussId=${item.get('studyDiscussInfoId')}" >
	                                    <span style="float:left;text-align:center;width:10%;height:15px;font-size:70%;background:white;border:1px solid #DFDFDF">${idxStatus.index+1}</span>
	                                    <span style="float:left;text-align:left;margin-left:2%;width:85%;height:15px;font-size:70%;overflow:hidden;" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='none'">${item.get("discussTitle")}</span>
	                                </a>
                                </div>
                            </c:forEach> 
           
                        </div>
                    </div>
                </div>
                <div class="center_3">
                  <c:if test="${oneDisscussCommentPage.getTotalPages()>1}">
                    <div style="float:left;width:83%;height:100%;">
                        <span style="float:left;width:100%;height:50%;color:gray;">
                            <span style="float:left;color:gray;">当前页:${oneDisscussCommentPage.getCurrentPage()}/${oneDisscussCommentPage.getTotalPages()}</span>
                            <span style="align:center;color:gray;">
                                 <a href="${pageContext.request.contextPath }/studyCenter/2/1?disscussId=${oneDisscussInfo.get(0).get('studyDiscussInfoId')}&currentPage=1">首页</a>
				                 
				                 <c:if test="${oneDisscussCommentPage.getCurrentPage()==1}">
				                     <a href="javascript:void(0);">上一页</a>
				                 </c:if>
				                 <c:if test="${oneDisscussCommentPage.getCurrentPage()>1}">
				                     <a href="${pageContext.request.contextPath }/studyCenter/2/1?disscussId=${oneDisscussInfo.get(0).get('studyDiscussInfoId')}&currentPage=${oneDisscussCommentPage.getCurrentPage()-1}">上一页</a>
				                 </c:if>
				                 
				                 <c:if test="${oneDisscussCommentPage.getCurrentPage()==oneDisscussCommentPage.getTotalPages()}">
				                     <a href="javascript:void(0);">下一页</a>
				                 </c:if>
				                 <c:if test="${oneDisscussCommentPage.getCurrentPage()<oneDisscussCommentPage.getTotalPages()}">
				                     <a href="${pageContext.request.contextPath }/studyCenter/2/1?disscussId=${oneDisscussInfo.get(0).get('studyDiscussInfoId')}&currentPage=${oneDisscussCommentPage.getCurrentPage()+1}">下一页</a>
				                 </c:if> 
				                 <a href="${pageContext.request.contextPath }/studyCenter/2/1?disscussId=${oneDisscussInfo.get(0).get('studyDiscussInfoId')}&currentPage=${oneDisscussCommentPage.getTotalPages()}">尾页</a>
                            </span>
                            <span style="float:right;color:gray;">总数:${oneDisscussCommentPage.getTotalRows()}</span>
                            <input type="hidden" id="allPageNum" value="${oneDisscussCommentPage.getTotalPages()}"/>
                        </span>
                        
                        
                        <form action="${pageContext.request.contextPath }/studyCenter/2/1" method="get" onsubmit="return checkPageNum();">
	                        <span style="float:left;width:100%;height:50%;color:gray;">
	                            <input type="hidden" name="disscussId" value="${oneDisscussInfo.get(0).get('studyDiscussInfoId')}"/>
	                            <span style="align:center;color:gray;">
	                               &nbsp&nbsp第<input type="text" id="currentPage" name="currentPage" style="width:20px;height:20px;" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')};"/>
	                                                                                页&nbsp共${oneDataInfoCommentPage.getTotalPages()}页
	                               <input type="submit" value="跳转" style="cursor:pointer;"/>
	                            </span>
	                        </span>
                        </form> 
                    </div>
                  </c:if>
                </div>
                <div class="center_4">
                <!-- 这里是发表评论区域 -->
	                <form action="${pageContext.request.contextPath }/studyCenter/2/2" method="post" onsubmit="return checkSubmit();">
	                    <div style="float:left;width:1000px;height:99%;background:white;border: 1px solid gray;">
	                        <span style="float:left;margin-top:10px;margin-left:2%;width:95%;height:30px;">
	                            <img src="./images/studyCenter/discuss/bi.jpg" style="float:left;width:20px;height:20px;"/>
	                            <span style="float:left;margin-left:10px;font-size:90%;font-weight:bold;">发表回复</span>
	                            <span id="tip" style="float:left;margin-left:10px;font-size:90%;font-weight:700;color:white;">评论内容不能为空</span>
	                        </span>
	                        <span style="float:left;margin-top:10px;margin-left:2%;width:95%;height:250px;">
	                            <textarea name="studyCommentContent" id="textArea" rows="15" cols="114" style="float:left;resize:none;" onclick="javascript:document.getElementById('tip').style.color='white'"></textarea>
	                        </span>
	                        <input type="hidden" name="studyDiscussInfoId" value="<%=oneDisscussInfo.get(0).get("studyDiscussInfoId")%>"/>
	                        <input type="hidden" name="studyCommenterId" value="${user.getUserId()}"/>
	                        <input type="hidden" name="disscussCommentFlag" value="<%=disscussCommentFlag%>"/>
	                        <input type="submit" value="发表" style="float:left;margin-top:100px;margin-left:2%;width:6%;cursor:pointer;" onmouseover="javascript:if(document.getElementById('textArea').value==''){this.style.cursor='not-allowed';}else{this.style.cursor='pointer';}"/>
	                    </div>
	                </form>
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
                                                                        版权所有:李际明&郭辉 ,&nbspICP备案:信息来自互联网，侵权处理(合作) 联系QQ：12345
                        </span>
                    </div>
            </div>
        </div>
    </center>
      
  </body>
</html>
