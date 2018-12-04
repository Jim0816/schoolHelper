<%@ page language="java" import="java.util.*,com.school.domain.*,com.school.domain.personbeans.*,com.school.utils.*;" pageEncoding="UTF-8"%>
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
    
    <title>资源详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/studyCenter/shareDataComment.css ">
    <script type="text/javascript">
	    function Scroll(){
	        var center_2_right = document.getElementById('center_2_right');
	        var  center_2= document.getElementById('center_2');
	        if(center_2.offsetTop-document.body.scrollTop<0){
	            center_2_right.style.top="0px";
	        }else{
	            center_2_right.style.top=(380-document.body.scrollTop)+"px";
	        }
	    }
	    //表单是否已经提交标识，默认为false
	    var operate = false; 
	    
	    function checkSubmit(){
	        if(operate == false){
	          //允许提交
	          if(checkUser()==true && checkText()==true){
		             //满足提交表单的要求
		             operate = true;
		             return true;
		        }else{
			         //不满足提交表单的要求
		             return false;
		        }
	        }else{
	          //不允许重复提交
	          return false;
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
	    
	    //检查评论区是否数据为空
	    function checkText(){
	       var textArea = document.getElementById("textArea").value.replace(/\s/g, "");
	       if(textArea==""){
	           alert("内容为空，无法评论！");
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
        String uuid = UUID.randomUUID().toString();
        session.setAttribute("uuid", uuid);
        User user = (User)session.getAttribute("user");
        List<Map<String, Object>> oneDataInfo  = (List<Map<String, Object>>)session.getAttribute("oneDataInfo");
        PageUtil oneDataInfoCommentPage = (PageUtil)session.getAttribute("oneDataInfoCommentPage");
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
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/login?pageSource=c31" style="float:left;margin-left:10px;font-size:80%;line-height:28px;text-decoration:none;">请登录</a> 
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/regist?pageSource=c31" style="float:left;margin-left:20px;font-size:80%;line-height:28px;text-decoration:none;">[免费注册]</a>
                 </c:when>
                 <c:otherwise>
                     <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=c31">
                     <span style="float:left;margin-top:5px;margin-left:30px;width:20px;height:20px;border-radius:15px;cursor:pointer;"><img src="${sessionScope.user.getUserPhoto()}" title="${sessionScope.user.getUserName()}" style="border-radius:15px;width:100%;height:100%;"/></span>
                     <font style="float:left;margin-left:5px;font-size:80%;line-height:28px;text-decoration:none;">${sessionScope.user.getUserName()}</font>
                     </a>
                     <a class="a1" href="${pageContext.request.contextPath }/person/user/exit?pageSource=c31" style="float:left;margin-left:10px;font-size:80%;line-height:27px;text-decoration:none;">注销</a>
                 </c:otherwise>
             </c:choose>
             <span id="showBar" style="float:right;width:60px;height:30px;text-align:center;margin-right:150px;cursor:default;font-size:80%;line-height:28px;color:gray;" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='visible';this.style.color='red';this.style.background='white'" onmouseout="this.style.color='gray';">网站导航</span>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/6?pageSource=c31" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">卖家中心</a>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=c31" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">个人中心</a>
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
                        <font style="float:left;margin-left:10px;margin-top:8px;color:#F06F4B">资源详情</font>
                        <a href="${pageContext.request.contextPath }/studyCenter/3"><span style="float:right;margin-right:10px;width:40px;height:40px;background:#F06F4B;border-radius:20px;line-height:35px;font-size:70%;color:white" >找资源</span></a>
                    </span>
                    <img src="./images/studyCenter/discuss/top.jpg" style="float:left;width:100%;height:200px;"/>
                    <!-- 分享信息基本介绍 -->
                    <div style="float:left;width:84%;height:140px;border-left:1px solid gray;">
                        <div style="float:left;margin-left:2%;width:35%;height:100%;border-right:0px solid gray;">
                            <span style="float:left;width:93%;height:20%;background:black;opacity:0.4;color:white;">分享者</span>
                            <span style="float:left;margin-left:2%;margin-top:5%;width:22%;height:70px;padding:5px;border:1px solid gray;"><img src="${oneDataInfo.get(0).get('userPhoto')}" style="width:95%;height:95%;"/></span>
                            <span style="float:right;text-align:left;font-size:80%;margin-top:5%;width:65%;height:80px;">
                                <font>账号:&nbsp&nbsp&nbsp&nbsp&nbsp${oneDataInfo.get(0).get("userId")}</font><br/>
                                <font>昵称:&nbsp&nbsp&nbsp&nbsp&nbsp${oneDataInfo.get(0).get("userName")}</font><br/>
                                <font>e-mail:&nbsp${oneDataInfo.get(0).get("userEmail")}</font><br/>
                                <font>分享时间:&nbsp${oneDataInfo.get(0).get("shareDate")}</font>
                            </span>
                        </div>
                        
                        <div style="float:right;width:60%;height:100%;">
                            <span style="float:left;text-align:left;width:100%;height:30px;margin-left:2%;margin-top:10px;">
	                            <font style="float:left;font-weight:bold;">资源名称:</font> 
	                            <font style="float:left;margin-left:1%;font-weight:bold;">${oneDataInfo.get(0).get("dataTitle")}</font> 
                            </span>
                            <span style="float:left;text-align:left;margin-top:5px;font-size:80%;width:100%;height:30px;margin-left:2%;margin-top:10px;">
	                            <span id="loadNum" style="float:left;">下载次数:${oneDataInfo.get(0).get("loadNum")}</span>
	                            <span style="float:left;margin-left:3%;">评论数量:${oneDataInfoComment.size()}</span>
                            </span>
	                        <span style="float:left;text-align:left;margin-top:5px;font-size:80%;width:100%;height:30px;margin-left:2%;margin-top:10px;">
	                            <a id="load" target="_blank" href="${pageContext.request.contextPath }/studyCenter/3/3?dataId=${oneDataInfo.get(0).get('dataShareInfoId')}&loadNum=${oneDataInfo.get(0).get('loadNum')}&dataUrl=${oneDataInfo.get(0).get('linkText')}" >点击下载</a>
	                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	                            <font>密码:${oneDataInfo.get(0).get('linkPwd')}</font>
	                        </span>
                        </div>
                        
                        
                    </div>
                </div>
                
                <div id="center_2" class="center_2">
                    <!-- 帖子区 这里的分页控制一页十条记录比较合适 -->
                    <div class="center_2_left">
                        <span style="float:left;width:100%;height:19px;background:white;border-bottom:1px solid gray"></span>
                        <!-- 这里每个评论板块高度没定死，会根据内容自动放大缩小 -->
	                    <c:forEach items="${oneDataInfoCommentPage.getResultList()}" var="item">
		                    <span style="float:left;margin-top:30px;width:100%;background:white;border-bottom:1px solid gray"">
		                        <span style="float:left;width:25%;height:180px;">
		                            <span style="float:left;margin-left:30%;width:40%;height:70px;padding:5px;border:1px solid gray;"><img src="${item.get('userPhoto')}" style="width:95%;height:95%;"/></span>
		                            <span style="float:left;margin-left:5%;margin-top:10px;width:90%;height:20px;font-size:90%;color:blue;">${item.get("userName")}</span>
		                            <span style="float:left;margin-left:5%;margin-top:30px;width:90%;height:20px;font-size:80%;"><fmt:formatDate value="${item.get('dataCommentTime')}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
		                        </span>
		                        <span style="float:left;margin-top:20px;text-align:left;margin-left:2%;width:70%;">${item.get("dataCommentContent")}<br/><br/><br/><br/><br/><br/></span>
		                    </span>
	                    </c:forEach>
                    </div>
                    <div id="center_2_right" class="center_2_right">
                        <c:if test="${user==null}">
                            <div style="float:left;width:100%;height:149px;border-bottom: 1px solid gray;">
                            <span style="float:left;margin-top:19px;margin-left:5%;text-align:left;font-size:90%;font-weight:bold;width:95%;height:29px;" >我的帖子</span>
                            <a href="javascript:void(0)" title="我的头像"><span style="float:left;margin-left:5%;width:35%;height:60px;border:1px solid gray;padding:5px;" ><img src="./images/user/gray.jpg" style="float:left;width:100%;height:100%;"/></span></a>
                            <a href="${pageContext.request.contextPath }/person/user/login?pageSource=c31" class="aaa" style="float:left;margin-left:10px;text-decoration:none;font-size:80%;">请登录</a>
                        </div>
                        </c:if>
                        <c:if test="${user!=null}">
                            <div style="float:left;width:100%;height:149px;border-bottom: 1px solid gray;background:white;">
	                            <span style="float:left;margin-top:19px;margin-left:5%;text-align:left;font-size:90%;font-weight:bold;width:95%;height:29px;" >我的帖子</span>
	                            <a href="${pageContext.request.contextPath }/person/1/1?pageSource=c31" title="我的头像"><span style="float:left;margin-left:5%;width:35%;height:60px;border:1px solid gray;padding:5px;" ><img src="${sessionScope.user.getUserPhoto()}" style="float:left;width:100%;height:100%;"/></span></a>
	                            <span style="float:left;width:50%;height:70px;background:white;">
	                                <a href="${pageContext.request.contextPath }/person/1/1?pageSource=c31" class="aaa" style="text-decoration:none;"><span style="float:left;margin-left:5%;text-align:left;width:95%;height:40px;font-size:80%;">${sessionScope.user.getUserName()}</span></a>
	                                <a href="${pageContext.request.contextPath }/person/1/5?pageSource=c31" class="aaa" style="text-decoration:none;font-size:80%;"><span style="float:left;text-align:left;margin-left:5%;width:95%;font-size:80%;">[管理]</span></a>
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
                  <c:if test="${oneDataInfoCommentPage.getTotalPages()>1}">
                     <div style="float:left;width:83%;height:100%;">
                        <span style="float:left;width:100%;height:50%;color:gray;">
                            <span style="float:left;color:gray;">当前页:${oneDataInfoCommentPage.getCurrentPage()}/${oneDataInfoCommentPage.getTotalPages()}</span>
                            <span style="align:center;color:gray;">
                                 <a href="${pageContext.request.contextPath }/studyCenter/3/1?dataId=${oneDataInfo.get(0).get('dataShareInfoId')}&currentPage=1">首页</a>
				                 
				                 <c:if test="${oneDataInfoCommentPage.getCurrentPage()==1}">
				                     <a href="javascript:void(0);">上一页</a>
				                 </c:if>
				                 <c:if test="${oneDataInfoCommentPage.getCurrentPage()>1}">
				                     <a href="${pageContext.request.contextPath }/studyCenter/3/1?dataId=${oneDataInfo.get(0).get('dataShareInfoId')}&currentPage=${oneDataInfoCommentPage.getCurrentPage()-1}">上一页</a>
				                 </c:if>
				                 
				                 <c:if test="${oneDataInfoCommentPage.getCurrentPage()==oneDataInfoCommentPage.getTotalPages()}">
				                     <a href="javascript:void(0);">下一页</a>
				                 </c:if>
				                 <c:if test="${oneDataInfoCommentPage.getCurrentPage()<oneDataInfoCommentPage.getTotalPages()}">
				                     <a href="${pageContext.request.contextPath }/studyCenter/3/1?dataId=${oneDataInfo.get(0).get('dataShareInfoId')}&currentPage=${oneDataInfoCommentPage.getCurrentPage()+1}">下一页</a>
				                 </c:if> 
				                 <a href="${pageContext.request.contextPath }/studyCenter/3/1?dataId=${oneDataInfo.get(0).get('dataShareInfoId')}&currentPage=${oneDataInfoCommentPage.getTotalPages()}">尾页</a>
                            </span>
                            <span style="float:right;color:gray;">总数:${oneDataInfoCommentPage.getTotalRows()}</span>
                            <input type="hidden" id="allPageNum" value="${oneDataInfoCommentPage.getTotalPages()}"/>
                        </span>
                        
                        
                        <form action="${pageContext.request.contextPath }/studyCenter/3/1" method="get" onsubmit="return checkPageNum();">
	                        <span style="float:left;width:100%;height:50%;color:gray;">
	                            <input type="hidden" name="dataId" value="${oneDataInfo.get(0).get('dataShareInfoId')}"/>
	                            <span style="align:center;color:gray;">
	                               &nbsp&nbsp&nbsp&nbsp第<input type="text" id="currentPage" name="currentPage" style="width:20px;height:20px;" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')};"/>
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
                  <form action="${pageContext.request.contextPath }/studyCenter/3/2" method="post" onsubmit="return checkSubmit();">
                    <div style="float:left;width:1000px;height:99%;background:white;border: 1px solid gray;">
                        <span style="float:left;margin-top:10px;margin-left:2%;width:95%;height:30px;">
                            <img src="./images/studyCenter/discuss/bi.jpg" style="float:left;width:20px;height:20px;"/>
                            <span style="float:left;margin-left:10px;font-size:90%;font-weight:bold;">发表评论</span>
                        </span>
                        <span style="float:left;margin-top:10px;margin-left:2%;width:95%;height:250px;">
                            <textarea name="commentContent" id="textArea" rows="15" cols="114" style="float:left;resize:none;"></textarea>
                        </span>
                        <input type="hidden" id="dataId" name="dataId" value="${oneDataInfo.get(0).get('dataShareInfoId')}"/>
                        <input type="hidden" name="commenterId" value="${user.getUserId()}"/>
                        <input type="hidden" name="uuid" value="<%=uuid%>"/>
                        <input title="请先登录再发表" type="submit" value="发表" style="float:left;margin-top:100px;margin-left:2%;width:6%;cursor:pointer;" onmouseover="javascript:if(document.getElementById('textArea').value==''){this.style.cursor='not-allowed';}else{this.style.cursor='pointer';}"/>
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
