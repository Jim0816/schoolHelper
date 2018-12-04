<%@ page language="java" import="java.util.*,com.school.domain.personbeans.*,com.school.utils.*;" pageEncoding="utf-8"%>
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
    
    <title>资源共享</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/studyCenter/shareData.css ">
    <script type="text/javascript" src="<c:url value='/js/shareData.js'/>"></script>
    <script type="text/javascript">
        window.onload = function (){
            var uploadResult='<%=request.getAttribute("uploadResult")%>';
            if(uploadResult=="null"||uploadResult=="")
				{
				}else{
				   alert(uploadResult);
		     }
        };
        
        function checkSubmit(){
			if(checkDataType()==false || checkDataContent()==false || checkUser()==false){
				return false;
			}else{
				return true;
			}
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
		//检查学科类型区域
		function checkDataType(){	
			var subjectType = document.getElementById("subjectType").value;
			var subjectArr = document.getElementById("subjectArr").value;
			if(subjectType==0 || subjectArr==0){
				document.getElementById("tip1").style.color='red';
				return false;
			}else{
				return true;
			}
		}
		
		function checkDataContent(){
			var dataTitle = document.getElementById("dataTitle").value.replace(/\s/g, "");
			var linkText = document.getElementById("linkText").value.replace(/\s/g, "");
			var linkPwd = document.getElementById("linkPwd").value.replace(/\s/g, "");
			if(dataTitle=="" || linkText==""){
				if(dataTitle==""){document.getElementById("tip2").style.color='red';}
				if(linkText==""){document.getElementById("tip3").style.color='red';}
				return false;
			}else{
				if(linkPwd==""){document.getElementById("linkPwd").value="无";}
				return true;
			}
		}	
		
		function getDataType(obj){
		    obj.style.fontWeight='bold'
		    var subjectType = document.getElementById("subjectType").value;
			var subjectArr = document.getElementById("subjectArr").value;
			var text = document.getElementById("subjectArr").options[document.getElementById("subjectArr").selectedIndex].text;
			var type="j1";
			if(subjectType==1){
			    type="a"+subjectArr;
			}else if(subjectType==2){
			    type="b"+subjectArr;
			}else if(subjectType==3){
			    type="c"+subjectArr;
			}else if(subjectType==4){
			    type="d"+subjectArr;
			}else if(subjectType==5){
			    type="e"+subjectArr;
			}else if(subjectType==6){
			    type="f"+subjectArr;
			}else if(subjectType==7){
			    type="g"+subjectArr;
			}else if(subjectType==8){
			    type="h"+subjectArr;
			}else if(subjectType==9){
			    type="i"+subjectArr;
			}else if(subjectType==10){
			    type="j"+subjectArr;
			}
			document.getElementById("dataType").value=type;
			document.getElementById("dataTypeName").value=text;
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
       String upload = UUID.randomUUID().toString();
       session.setAttribute("upload", upload);
       PageUtil dataPage = (PageUtil)session.getAttribute("dataPage");
       User user = (User)session.getAttribute("user");
       String dataType = (String)session.getAttribute("dataType");
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
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/login?pageSource=c3" style="float:left;margin-left:10px;font-size:80%;line-height:28px;text-decoration:none;">请登录</a> 
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/regist?pageSource=c3" style="float:left;margin-left:20px;font-size:80%;line-height:28px;text-decoration:none;">[免费注册]</a>
                 </c:when>
                 <c:otherwise>
                     <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=c3">
                     <span style="float:left;margin-top:5px;margin-left:30px;width:20px;height:20px;border-radius:15px;cursor:pointer;"><img src="${sessionScope.user.getUserPhoto()}" title="${sessionScope.user.getUserName()}" style="border-radius:15px;width:100%;height:100%;"/></span>
                     <font style="float:left;margin-left:5px;font-size:80%;line-height:28px;text-decoration:none;">${sessionScope.user.getUserName()}</font>
                     </a>
                     <a class="a1" href="${pageContext.request.contextPath }/person/user/exit?pageSource=c3" style="float:left;margin-left:10px;font-size:80%;line-height:27px;text-decoration:none;">注销</a>
                 </c:otherwise>
             </c:choose>
             <span id="showBar" style="float:right;width:60px;height:30px;text-align:center;margin-right:150px;cursor:default;font-size:80%;line-height:28px;color:gray;" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='visible';this.style.color='red';this.style.background='white'" onmouseout="this.style.color='gray';">网站导航</span>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/6?pageSource=c3" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">卖家中心</a>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=c3" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">个人中心</a>
        </div>
        <div class="bg" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
            <div class="head">
                <span class="center_search" onmouseover="javascript:document.getElementById('subject').style.visibility='hidden';">
                     <input type="text" style="float:left;width:80%;height:40px;border:1px solid #DFDFDF"/>
                     <a href="#"><span style="float:left;text-align:center;line-height:35px;width:20%;height:40px;background:#F06F4B;font-size:120%;color:white;" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'">资源搜索</span></a>
                </span>
            </div>
            <div class="center">
                <div class="center_top_bar" onmouseover="javascript:document.getElementById('subject').style.visibility='hidden';">
                    <a href="${pageContext.request.contextPath }/studyCenter/1"><span class="select_bar1" onmouseover="this.style.background='white';this.style.color='black'" onmouseout="this.style.background='#F06F4B';this.style.color='white'">首页</span></a>
                    <a href="${pageContext.request.contextPath }/studyCenter/2"><span class="select_bar" onmouseover="this.style.background='white';this.style.color='black'" onmouseout="this.style.background='#F06F4B';this.style.color='white'">交流讨论</span></a>
                    <a href="${pageContext.request.contextPath }/studyCenter/3"><span class="select_bar" onmouseover="this.style.background='white';this.style.color='black'" onmouseout="this.style.background='#F06F4B';this.style.color='white'">资料共享</span></a>
                    <a href="${pageContext.request.contextPath }/studyCenter/4"><span class="select_bar" onmouseover="this.style.background='white';this.style.color='black'" onmouseout="this.style.background='#F06F4B';this.style.color='white'">成绩查询</span></a>
                </div>
                <div class="center_1" >
                    <span style="float:left;margin-top:10px;width:100%;height:40px;background:#E3DFDE;border-top:1px solid #F06F4B">
                        <img src="./images/studyCenter/tubiao.jpg" style="float:left;margin-top:10px;width:20px;height:20px;"/>
                        <font style="float:left;margin-left:10px;margin-top:8px;color:#F06F4B">学习资源共享</font>
                        <a href="${pageContext.request.contextPath }/studyCenter/3?dataType=a"><span style="float:left;margin-top:8px;margin-left:10%;cursor:pointer;" data-subject="a" onmouseover="showSubject(this)" onmouseout="hiddenSubject(this)">农学</span></a>
                        <a href="${pageContext.request.contextPath }/studyCenter/3?dataType=b"><span style="float:left;margin-top:8px;margin-left:3%;cursor:pointer;" data-subject="b" onmouseover="showSubject(this)" onmouseout="hiddenSubject(this)">理学</span></a>
                        <a href="${pageContext.request.contextPath }/studyCenter/3?dataType=c"><span style="float:left;margin-top:8px;margin-left:3%;cursor:pointer;"  data-subject="c" onmouseover="showSubject(this)" onmouseout="hiddenSubject(this)">工学</span></a>
                        <a href="${pageContext.request.contextPath }/studyCenter/3?dataType=d"><span style="float:left;margin-top:8px;margin-left:3%;cursor:pointer;" data-subject="d" onmouseover="showSubject(this)" onmouseout="hiddenSubject(this)">经济学</span></a>
                        <a href="${pageContext.request.contextPath }/studyCenter/3?dataType=e"><span style="float:left;margin-top:8px;margin-left:3%;cursor:pointer;" data-subject="e" onmouseover="showSubject(this)" onmouseout="hiddenSubject(this)">管理学</span></a>
                        <a href="${pageContext.request.contextPath }/studyCenter/3?dataType=f"><span style="float:left;margin-top:8px;margin-left:3%;cursor:pointer;" data-subject="f" onmouseover="showSubject(this)" onmouseout="hiddenSubject(this)">文学</span></a>
                        <a href="${pageContext.request.contextPath }/studyCenter/3?dataType=g"><span style="float:left;margin-top:8px;margin-left:3%;cursor:pointer;" data-subject="g" onmouseover="showSubject(this)" onmouseout="hiddenSubject(this)">法学</span></a>
                        <a href="${pageContext.request.contextPath }/studyCenter/3?dataType=h"><span style="float:left;margin-top:8px;margin-left:3%;cursor:pointer;" data-subject="h" onmouseover="showSubject(this)" onmouseout="hiddenSubject(this)">教育学</span></a>
                        <a href="${pageContext.request.contextPath }/studyCenter/3?dataType=i"><span style="float:left;margin-top:8px;margin-left:3%;cursor:pointer;" data-subject="i" onmouseover="showSubject(this)" onmouseout="hiddenSubject(this)">艺术学</span></a>
                        <a href="${pageContext.request.contextPath }/studyCenter/3?dataType=j"><span style="float:left;margin-top:8px;margin-left:3%;cursor:pointer;" data-subject="j" onmouseover="showSubject(this)" onmouseout="hiddenSubject(this)">其他</span></a>
                    </span>
                    <img src="./images/studyCenter/discuss/top.jpg" style="float:left;width:100%;height:200px;"/>
                    <div id="subject" class="subject" style="visibility:hidden;"></div>
                </div>
                
                <div id="center_2" class="center_2" onmouseover="javascript:document.getElementById('subject').style.visibility='hidden';">
                    <!-- 帖子区 这里的分页控制一页十条记录比较合适 -->
                    <div class="center_2_left">
	                    <c:forEach items="${dataPage.getResultList()}" var="item" varStatus="order">
		                    <span style="float:left;width:100%;height:100px;">
		                        <span style="float:left;margin-left:1%;margin-top:20px;width:4%;height:24px;font-size:90%;background:white;border:1px solid #DFDFDF">${order.index+1}</span>
		                        <span style="float:left;margin-left:3%;margin-top:20px;width:75%;height:76px;">
		                            <span style="float:left;text-align:left;width:100%;height:24px;">
		                               <a href="${pageContext.request.contextPath }/studyCenter/3/1?dataId=${item.get('dataShareInfoId')}">${item.get("dataTitle")}</a>
		                            </span>
		                            <span style="float:left;margin-top:5px;text-align:left;width:100%;height:24px;">
		                                <font style="float:left;font-size:90%;">资源链接:</font>
		                                <input type="text" style="float:left;width:50%;" value="${item.get('linkText')}" readonly="readonly"/>
		                                <font style="float:left;margin-left:5%;font-size:90%;">链接密码:</font>
		                                <input type="text" style="float:left;width:20%;" value="${item.get('linkPwd')}" readonly="readonly"/>
		                            </span>
		                            <span style="float:left;margin-top:5px;text-align:left;width:100%;height:10px;font-size:80%;">
		                                <a class="c" target="_blank" href="${pageContext.request.contextPath }/studyCenter/3/3?dataId=${item.get('dataShareInfoId')}&loadNum=${item.get('loadNum')}&dataUrl=${item.get('linkText')}" style="float:left;margin-left:75%;">直接下载</a>
		                                <a class="c" href="${pageContext.request.contextPath }/studyCenter/3/1?dataId=${item.get('dataShareInfoId')}" style="float:left;margin-left:3%;">资源详情</a>
		                            </span>
		                        </span>
		                        <span style="float:right;margin-right:1%;text-align:right;margin-top:20px;width:15%;height:76px;">
		                            <span>${item.get('userName')}</span><br/><br/>
		                            <span>${item.get('shareDate')}</span>
		                        </span>
		                    </span>
	                    </c:forEach> 
                    </div>
                    <div id="center_2_right" class="center_2_right">
                        <c:if test="${user==null}">
                            <div style="float:left;width:100%;height:149px;border-bottom: 1px solid gray;">
	                            <span style="float:left;margin-top:19px;margin-left:5%;text-align:left;font-size:90%;font-weight:bold;width:95%;height:29px;" >我的帖子</span>
	                            <a href="javascript:void(0)" title="我的头像"><span style="float:left;margin-left:5%;width:35%;height:60px;border:1px solid gray;padding:5px;" ><img src="./images/user/gray.jpg" style="float:left;width:100%;height:100%;"/></span></a>
	                            <a href="${pageContext.request.contextPath }/person/user/login?pageSource=c3" class="aaa" style="float:left;margin-left:10px;text-decoration:none;font-size:80%;">请登录</a>
                            </div>
                        </c:if>
                        <c:if test="${user!=null}">
                            <div style="float:left;width:100%;height:149px;border-bottom: 1px solid gray;background:white;">
	                            <span style="float:left;margin-top:19px;margin-left:5%;text-align:left;font-size:90%;font-weight:bold;width:95%;height:29px;" >我的帖子</span>
	                            <a href="${pageContext.request.contextPath }/person/1/1?pageSource=c3" title="我的头像"><span style="float:left;margin-left:5%;width:35%;height:60px;border:1px solid gray;padding:5px;" ><img src="${sessionScope.user.getUserPhoto()}" style="float:left;width:100%;height:100%;"/></span></a>
	                            <span style="float:left;width:50%;height:70px;background:white;">
	                                <a href="${pageContext.request.contextPath }/person/1/1?pageSource=c3" class="aaa" style="text-decoration:none;"><span style="float:left;margin-left:5%;text-align:left;width:95%;height:40px;font-size:80%;">${sessionScope.user.getUserName()}</span></a>
	                                <a href="${pageContext.request.contextPath }/person/1/5?pageSource=c3" class="aaa" style="text-decoration:none;font-size:80%;"><span style="float:left;text-align:left;margin-left:5%;width:95%;font-size:80%;">[管理]</span></a>
	                            </span>
                            </div>
                        </c:if>
                        
                        <div style="float:left;width:100%;height:399px;border-bottom: 1px solid gray;">
                            <span style="float:left;margin-left:5%;width:95%;height:49px;text-align:left;line-height:30px;font-size:90%;font-weight:bold;width:95%;height:29px;background:white;">热门资源下载排行</span>
                            
                            <div style="float:left;margin-left:5%;width:95%;height:20px;">
                                <a  class="b" href="${pageContext.request.contextPath }/studyCenter/3/1?dataId=${twelveShareData.get(0).get('dataShareInfoId')}" >
                                    <span style="float:left;text-align:center;width:10%;height:15px;font-size:70%;background:#F06F4B;border:0px solid #DFDFDF">1</span>
                                    <span style="float:left;text-align:left;width:90%;height:15px;font-size:90%;overflow:hidden;"><font style="float:left;margin-left:5px;font-size:70%;" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='none'">${twelveShareData.get(0).get('dataTitle')}</font></span>
                                </a>
                            </div>
                            
                            <div style="float:left;margin-top:10px;margin-left:5%;width:95%;height:20px;">
                                <a  class="b" href="${pageContext.request.contextPath }/studyCenter/3/1?dataId=${twelveShareData.get(1).get('dataShareInfoId')}" >
                                    <span style="float:left;text-align:center;width:10%;height:15px;font-size:70%;background:#F06F4B;border:0px solid #DFDFDF">2</span>
                                    <span style="float:left;text-align:left;width:90%;height:15px;font-size:90%;overflow:hidden;"><font style="float:left;margin-left:5px;font-size:70%;" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='none'">${twelveShareData.get(1).get('dataTitle')}</font></span>
                                </a>
                            </div>
                            
                            <div style="float:left;margin-top:10px;margin-left:5%;width:95%;height:20px;">
                                <a  class="b" href="${pageContext.request.contextPath }/studyCenter/3/1?dataId=${twelveShareData.get(2).get('dataShareInfoId')}" >
                                    <span style="float:left;text-align:center;width:10%;height:15px;font-size:70%;background:#F06F4B;border:0px solid #DFDFDF">3</span>
                                    <span style="float:left;text-align:left;width:90%;height:15px;font-size:90%;overflow:hidden;"><font style="float:left;margin-left:5px;font-size:70%;" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='none'">${twelveShareData.get(2).get('dataTitle')}</font></span>
                                </a>
                            </div>
                            <c:forEach items="${twelveShareData}" var="item" begin="3" end="9" varStatus="idxStatus">
                                <div style="float:left;margin-top:10px;margin-left:5%;width:95%;height:20px;overflow:hidden;">
	                                <a  class="b" href="${pageContext.request.contextPath }/studyCenter/3/1?dataId=${item.get('dataShareInfoId')}" >
	                                    <span style="float:left;text-align:center;width:10%;height:15px;font-size:70%;background:white;border:1px solid #DFDFDF">${idxStatus.index+1}</span>
	                                    <span style="float:left;text-align:left;margin-left:2%;width:85%;height:15px;font-size:70%;overflow:hidden;" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='none'">${item.get("dataTitle")}</span>
	                                </a>
                                </div>
                            </c:forEach> 
                        </div>
                    </div>
                </div>
                <div class="center_3">
                 <c:if test="${dataPage.getTotalPages()>1}">
                    <div style="float:left;width:83%;height:100%;">
                        <span style="float:left;width:100%;height:50%;color:gray;">
                            <span style="float:left;color:gray;">当前页:${dataPage.getCurrentPage()}/${dataPage.getTotalPages()}</span>
                            <span style="align:center;color:gray;">
                                 <a href="${pageContext.request.contextPath }/studyCenter/3?dataType=${dataType}&currentPage=1">首页</a>
				                 
				                 <c:if test="${dataPage.getCurrentPage()==1}">
				                     <a href="javascript:void(0);">上一页</a>
				                 </c:if>
				                 <c:if test="${dataPage.getCurrentPage()>1}">
				                     <a href="${pageContext.request.contextPath }/studyCenter/3?dataType=${dataType}&currentPage=${dataPage.getCurrentPage()-1}">上一页</a>
				                 </c:if>
				                 
				                 <c:if test="${dataPage.getCurrentPage()==dataPage.getTotalPages()}">
				                     <a href="javascript:void(0);">下一页</a>
				                 </c:if>
				                 <c:if test="${dataPage.getCurrentPage()<dataPage.getTotalPages()}">
				                     <a href="${pageContext.request.contextPath }/studyCenter/3?dataType=${dataType}&currentPage=${dataPage.getCurrentPage()+1}">下一页</a>
				                 </c:if> 
				                 <a href="${pageContext.request.contextPath }/studyCenter/3?dataType=${dataType}&currentPage=${dataPage.getTotalPages()}">尾页</a>
                            </span>
                            <span style="float:right;color:gray;">总数:${dataPage.getTotalRows()}</span>
                            <input type="hidden" id="allPageNum" value="${dataPage.getTotalPages()}"/>
                        </span>
                        
                        
                        <form action="${pageContext.request.contextPath }/studyCenter/3" method="get" onsubmit="return checkPageNum();">
	                        <span style="float:left;width:100%;height:50%;color:gray;">
	                            <span style="align:center;color:gray;">
	                               &nbsp&nbsp第<input type="text" id="currentPage" name="currentPage" style="width:20px;height:20px;" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')};"/>
	                                                                                页&nbsp共${dataPage.getTotalPages()}页
	                               <input type="submit" value="跳转" style="cursor:pointer;"/>
	                               <input type="hidden" name="dataType" value="${dataType}"/>
	                            </span>
	                        </span>
                        </form>  
                    </div>
                  </c:if>
                </div>
                <div class="center_4">
                  <form action="${pageContext.request.contextPath }/studyCenter/3/4" method="post" onsubmit="return checkSubmit();">
                    <c:if test="${user!=null}">
                    <<input type="hidden" id="shareUserId" name="shareUserId" value="<%=user.getUserId()%>"/>
                    </c:if>
                    <div style="float:left;width:1000px;height:99%;background:white;border: 1px solid gray;">
                        <span style="float:left;margin-top:10px;margin-left:2%;width:95%;height:30px;">
                            <img src="./images/studyCenter/discuss/bi.jpg" style="float:left;width:20px;height:20px;"/>
                            <span style="float:left;margin-left:10px;font-size:90%;font-weight:bold;">上传资源</span>
                        </span>
                        <span style="float:left;width:100%;height:50px;">
                            <!-- 默认为其他类型 -->
                            <font style="float:left;margin-left:2%;color:black;">学科类型:</font>
                            <!-- 两个select先装value值，到后台进行处理 -->
                            <select id="subjectType" style="float:left;margin-left:2%;color:black;" onclick="getChildSubject()">
                                <option value="0">--请选择专业类型--</option>
                                <option value="1">农学</option>
                                <option value="2">理学</option>
                                <option value="3">工学</option>
                                <option value="4">经济学</option>
                                <option value="5">管理学</option>
                                <option value="6">文学</option>
                                <option value="7">法学</option>
                                <option value="8">教育学</option>
                                <option value="9">艺术学</option>
                                <option value="10">其他</option>
                            </select>
                            <select id="subjectArr" style="float:left;margin-left:2%;color:black;" onclick="javascript:if(this.value!=0)document.getElementById('tip1').style.color='white';">
                                <option value="0">--请选择学科--</option>
                            </select>
                            <input type="hidden" id="dataType" name="dataType"/>
                            <input type="hidden" id="dataTypeName" name="dataTypeName"/>
                            <font id="tip1" style="float:left;margin-left:10px;color:white;">请选择类型</font>
                        </span>
                        
                        <span style="float:left;width:100%;height:40px;">
                            <font style="float:left;margin-left:2%;color:black;line-height:40px;">资源标题:</font>
                            <input id="dataTitle" name="dataTitle" type="text" style="float:left;margin-left:2%;width:65.7%;height:40px;" onmouseout="javascript:if(!this.value=='')document.getElementById('tip2').style.color='white';"/>
                            <font id="tip2" style="float:left;margin-left:10px;color:white;line-height:40px;">标题不能为空</font>
                        </span>
                        
                        <span style="float:left;width:100%;margin-top:10px;height:40px;">
                            <font style="float:left;margin-left:2%;color:black;line-height:40px;">资源链接:</font>
                            <input id="linkText" name="linkText" type="text" style="float:left;margin-left:2%;width:40%;height:40px;" onmouseout="javascript:if(!this.value=='')document.getElementById('tip3').style.color='white';"/>
                            <font style="float:left;margin-left:2%;color:black;line-height:40px;">链接密码:</font>
                            <input id="linkPwd" name="linkPwd" type="text" style="float:left;margin-left:2%;width:15%;height:40px;"/>
                        </span>
                        <font id="tip3" style="float:left;margin-left:11%;color:white;">资源链接不能为空</font>
                        <input type="hidden"  name="loadNum" value="0"/>
                        <input type="hidden" name="upload" value="<%=upload%>"/>
                        <input type="submit" value="上传" style="float:left;line-height:40px;margin-left:2%;margin-top:50px;width:80px;height:40px;text-align:center;cursor:pointer;background:#F06F4B;color:white;" onmouseover="getDataType(this)" onmouseout="this.style.fontWeight='normal'"/>
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
                                                                        版权所有:李际明 ,&nbspICP备案:信息来自互联网，侵权处理(合作) 联系QQ：12345
                        </span>
                    </div>
            </div>
        </div>
    </center>
      
  </body>
</html>
