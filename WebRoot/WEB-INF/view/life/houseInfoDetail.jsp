<%@ page language="java" import="java.util.*,com.school.domain.personbeans.*,com.school.domain.lifebeans.*;" pageEncoding="UTF-8"%>
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
    
    <title>房屋详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <style type="text/css">
        .aa:visited {color: #1077CC;}
		.aa:link{	color:#1077CC;}
		.aa:hover {color: red;}
		.aa:active {color: red;} 
        
        .a1:visited {color: gray;}
		.a1:link{	color:gray;}
		.a1:hover {color: red;}
		.a1:active {color: red;}
		
		.a4:visited {color:#A999B5;}
		.a4:link{	color:#A999B5;}
		.a4:hover {color:black;}
		.a4:active {color:black;}
		
		.bg_top_top{
			position:relative;
			width: 100%;
		    height: 30px;
		    background:#F8F8F8;
		    overflow:hidden;
		}
		
		.nevigationBar{
			position:absolute;
			top:40px;
			right:187px;
			width:1000px;
		    height:288px;
		    background:white;
		    visibility:hidden;
		    z-index:2;
		    border-left:2px solid #EEEEEE;
		    border-right:2px solid #EEEEEE;
		    border-bottom:2px solid #EEEEEE;
		}
        
        
        .bg{
            width:1400px;
            background:white;
        }

        .center{
            float:left;
            margin-top:50px;
            width:100%;
            height:540px;
            background:white;
        }
        
        .center_1{
            float:left;
            width:100%;
            height:80px;
            background:white;
        }
        
        .center_2{
            float:left;
            width:100%;
            height:450px;
            background:white;
        }
        
        .center_2_left{
            float:left;
            margin-left:10%;
            width:35%;
            height:450px;
            background:yellow;
        }
        
        .imgs{
           position:relative;
           left:0px;
           top:15px;
           width:100%;
           height:75px;
           background:white;
           overflow:hidden;
        }
        
        .imgs_pre{
           position:absolute;
           left:0px;
           top:0px;
           width:25px;
           height:75px;
           line-height:65px;
           color:white;
           font-size:150%;
           cursor:pointer;
           background:black;
           opacity:0.5; 
           z-index:2;
        }
        
         .imgs_next{
           position:absolute;
           right:0px;
           top:0px;
           width:25px;
           height:75px;
           line-height:65px;
           color:white;
           cursor:pointer;
           font-size:150%;
           background:black;
           opacity:0.5;
            z-index:2; 
        }
        
        .imgs_show{
           position:absolute;
           left:0px;
           top:0px;
           width:680px;
           height:75px;
           background:white;
            z-index:1;
        }
        
        .img{
            float:left;
            width:75px;
            height:75px;
            margin-left:10px;
            background:white;
            cursor:pointer;
            opacity:0.5;
        }
        .center_2_right{
            float:left;
            margin-left:2%;
            width:43%;
            height:450px;
            background:white;
        }
        
        .bottom {
			float:left;
			height:70px;
			width: 100%;
		}
    </style>
    <script type="text/javascript">
        var showPhotoFlag;
        var imgNum;
        window.onload=function (){
            showPhotoFlag = 1;
            imgNum = document.getElementById('imgNum').value;
            document.getElementById(showPhotoFlag).parentNode.style.opacity='1';
        };
       function changeShowPhoto(obj){
            showPhotoFlag = obj.id;
            document.getElementById('bigPhoto').src=obj.src;
            document.getElementById('bigPhotoLink').href=obj.src;
            for(var i=1;i<imgNum+1;i++)
		    {
		        var img = document.getElementById(i);
		    	if(img==obj){
		    	     var father = img.parentNode;
                     father.style.opacity='1';
		    	}else{
		    	     var father = img.parentNode;
                     father.style.opacity='0.5';
		    	}
		    }
		    
        }
        function goPre(){
            if(showPhotoFlag>1 && Number(showPhotoFlag)<Number(imgNum+1)){
                 showPhotoFlag = Number(showPhotoFlag)-1;
                 var obj = document.getElementById(showPhotoFlag);
                 changeShowPhoto(obj);
            }
        }
        function goNext(){
            if(showPhotoFlag>0 && Number(showPhotoFlag)<Number(imgNum)){
                 showPhotoFlag = Number(showPhotoFlag)+1;
                 var obj = document.getElementById(showPhotoFlag);
                 changeShowPhoto(obj);
            }
        }
    </script>
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
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/login?pageSource=b5" style="float:left;margin-left:10px;font-size:80%;line-height:28px;text-decoration:none;">请登录</a> 
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/regist?pageSource=b5" style="float:left;margin-left:20px;font-size:80%;line-height:28px;text-decoration:none;">[免费注册]</a>
                 </c:when>
                 <c:otherwise>
                     <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=b5">
                     <span style="float:left;margin-top:5px;margin-left:30px;width:20px;height:20px;border-radius:15px;cursor:pointer;"><img src="${sessionScope.user.getUserPhoto()}" title="${sessionScope.user.getUserName()}" style="border-radius:15px;width:100%;height:100%;"/></span>
                     <font style="float:left;margin-left:5px;font-size:80%;line-height:28px;text-decoration:none;">${sessionScope.user.getUserName()}</font>
                     </a>
                     <a class="a1" href="${pageContext.request.contextPath }/person/user/exit?pageSource=b5" style="float:left;margin-left:10px;font-size:80%;line-height:27px;text-decoration:none;">注销</a>
                 </c:otherwise>
             </c:choose>
             <span id="showBar" style="float:right;width:60px;height:30px;text-align:center;margin-right:180px;cursor:default;font-size:80%;line-height:28px;color:gray;" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='visible';this.style.color='red';this.style.background='white'" onmouseout="this.style.color='gray';">网站导航</span>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/6?pageSource=b5" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">卖家中心</a>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=b5" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">个人中心</a>
          </div>
	      <div class="bg" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
	          <div class="center">
	              <div class="center_1">
	                  <span style="float:left;text-align:left;margin-left:10%;width:80%;height:45%;background:white;">
	                      <span style="float:left;font-size:120%;font-weight:bold;">${houseRentInfo.getRentTitle()}</span>
	                      <a href="${pageContext.request.contextPath }/life/5"><span style="float:right;cursor:pointer;font-weight:bold;line-height:30px;height:100%;background:red;color:white;font-size:90%;">继续找找>></span></a>
	                  </span>
	                  <span style="float:left;text-align:left;margin-left:10%;width:80%;height:35%;background:white;color:gray;font-size:80%;"><fmt:formatDate value="${houseRentInfo.getSendDate()}" pattern="yyyy-MM-dd" />&nbsp&nbsp&nbsp浏览次数:${houseRentInfo.getLookNum()}</span>
	              </div>
	              <div class="center_2">
	                  <div class="center_2_left">
	                      <div style="float:left;width:100%;height:80%;background:white;"><a id="bigPhotoLink" href="${imgs.get(0)}" target="_blank"><img id="bigPhoto" src="${imgs.get(0)}" width="100%" height="100%"/></a></div>
	                      <div style="float:left;width:100%;height:20%;background:white;">
	                          <div class="imgs">
	                              <span class="imgs_pre" onmouseover="this.style.opacity='0.7'" onmouseout="this.style.opacity='0.5'" onclick="goPre()">&lt</span>
	                              <span class="imgs_next" onmouseover="this.style.opacity='0.7'" onmouseout="this.style.opacity='0.5'" onclick="goNext()">&gt</span>
	                              <div class="imgs_show">
	                              <!-- 最多放6张图片 -->
	                                  <input type="hidden" id="imgNum" value="${imgs.size()}"/>
	                                  <c:forEach items="${imgs}" var="item" varStatus="order">
	                                      <span title="${order.index+1}" class="img"><img id="${order.index+1}" onclick="javascript:changeShowPhoto(this);"src="${item}" width="100%" height="100%"/></span>
	                                  </c:forEach>
	                              </div>
	                          </div>
	                      </div>
	                  </div>
	                  <div class="center_2_right">
	                      <span style="float:left;margin-top:50px;width:100%;height:60px;background:white;color:red;">
	                          <span style="float:left;height:100%;font-size:200%;font-weight:bold;">${houseRentInfo.getRentPrice()}</span>
                              <span style="float:left;line-height:55px;height:100%;font-size:90%;font-weight:bold;">元/月</span>
	                      </span>
	                      <span style="float:left;width:100%;height:40px;background:white;text-align:left;">
	                          <span style="float:left;color:gray;">租赁方式:</span>
	                          <span style="float:left;margin-left:20px;">${houseRentInfo.getRentWay()}</span>
	                      </span>
	                      <span style="float:left;width:100%;height:40px;background:white;">
	                          <span style="float:left;color:gray;">房屋类型:</span>
	                          <span style="float:left;margin-left:20px;">${houseRentInfo.getHouseStruct()}</span>
	                          <span style="float:left;margin-left:20px;">${houseRentInfo.getHouseArea()}㎡</span>
	                      </span>
	                      <span style="float:left;width:100%;height:40px;background:white;">
	                          <span style="float:left;color:gray;">详细地址:</span>
	                          <span style="float:left;margin-left:20px;">${houseRentInfo.getAddress()}</span>
	                      </span>
	                      <span style="float:left;width:100%;height:130px;background:white;">
	                          <span style="float:left;height:100%;background:white;color:gray;">简要介绍:</span>
	                          <span style="float:left;margin-left:16px;width:83%;height:90%;background:white;text-align:left;border:5px solid #F9F9FA;">${houseRentInfo.getRentDetail()}</span>
	                      </span>
	                      
	                      <span style="float:left;width:98%;margin-top:15px;height:73px;background:white;background:white;">
	                          <span style="float:left;width:65%;height:73px;background:white;border:1px solid red;">
	                              <span style="float:left;margin-left:20%;margin-top:15px;width:60%;height:43px;background:blue;">
	                                  <span style="float:left;width:20%;height:100%;background:white;"><img src="./images/life/tel.jfif" width="80%" height="100%"/></span>
	                                  <span style="float:left;line-height:40px;width:80%;height:100%;background:white;color:red;font-size:170%;">${houseRentInfo.getOwnerTel()}</span>
	                              </span>
	                          </span>
	                          <span style="float:right;width:30%;line-height:70px;height:73px;background:white;color:red;font-size:170%;border:1px solid red;">${houseRentInfo.getOwnerName()}</span>
	                      </span>
	                  </div>
	              </div>
	          </div>
	          <div class="bottom">
			     <span style="float:left;width:100%;margin-top:20px;height:20px;text-align:center;color:gray;font-size:80%;">Copyright 2018 - 2028 jim.com All Rights Reserved 京ICP证100557号 京公网安备112310102004579号 出版物经营许可证新出发京批字第直1141328号</span>
		         <span style="float:left;margin-left:25%;width:50%;background:pink;height:70px;"><img src="./images/life/bottom.jpg" width="100%" height="70px"/></span>
			  </div>
	      </div>
	  </center>
  </body>
</html>
