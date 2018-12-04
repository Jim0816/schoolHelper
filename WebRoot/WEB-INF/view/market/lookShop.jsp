<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    
    <title>商家店铺首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	    function enterCar(){
		    document.getElementById("theCar").className="theCar1";
		}
		
		function leaveCar(){
			document.getElementById("theCar").className="theCar";
		}
	</script>
    <style type="text/css">
        a:visited {color: black;}
		a:link{	color:black;}
		a:hover {color: red;}
		a:active {color:red;}
        
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
			right:156px;
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
            width:1500px;
            height:600px;
        }
        
		.head{
			float:left;
			width: 100%;
		    height: 159px;
		    background:white;
		    border-bottom:1px solid gray;
		}
		
		.head_1{
			float:left;
			width:100%;
			height:0px;
			background:#EEEEEE;
		}
		
		.head_2{
			float:left;
			margin-top:10px;
			width:100%;
			height:110px;
			background:white;
		}

		.logo{
		  float:left;
		  margin-top:20px;
		  margin-left:10%;
		  width:10%;;
		  height:60px;
		  background:white;
		}
		
		.head_2_search{
		  float:left;
		  margin-top:20px;
		  margin-left:8%;
		  width:44%;;
		  height:70px;
		  background:white;
		}
		
		@keyframes car
		{
			0%   {left:0px;top:0px;}
			100% {left:80px;top:0px;}
		}
		
		@-moz-keyframes car
		{
			0%   {left:0px;top:0px;}
			100% {left:80px;top:0px;}
		}
		
		@-webkit-keyframes car
		{
			0%   {left:0px;top:0px;}
			100% {left:80px;top:0px;}
		}
		
		@-o-keyframes car
		{
			0%   {left:0px;top:0px;}
			100% {left:80px;top:0px;}
		}
		
		.car{
			float:right;
			margin-top:20px;
			margin-right:150px;
			width:120px;
		    height: 50px;
		    cursor:pointer;
		    border-bottom:1px solid #EEEEEE;
		}
		
		.carRoad{
			position:relative;
			left:0px;
			top:5px;
			width:120px;
			height:40px;
		}
		
		.theCar{
			position:absolute;
			left:0px;
			width:40px;
			height:40px;
			background:white;
			animation-name:car;
		    animation-duration:5s;
		    animation-iteration-count:infinite;
		    animation-direction:alternate; 
		    animation-play-state:running; 
		}
		
		.theCar1{
			position:absolute;
			left:0px;
			width:40px;
			height:40px;
			background:white;
			animation-name:car;
		    animation-duration:5s;
		    animation-iteration-count:infinite;
		    animation-direction:alternate; 
		    animation-play-state:paused; 
		}
		
		.center{
		 float:left;
		 width:100%;
		}
		
		.center_1{
		 position:relative;
		 width:100%;
		 height:150px;
		 background:white;
		 border-bottom:1px solid gray;
		 font-size:85%;
		}
		
		.center_1_1{
		 float:left;
		 margin-top:15px;
		 margin-left:15%;
		 width:10%;
		 height:120px;
		 background:white;
		 border:1px solid #EEEEEE;
		}
		
		.center_1_2{
		 float:left;
		 margin-top:15px;
		 margin-left:1%;
		 width:50%;
		 height:122px;
		 background:white;
		}
		
		.center_2{
		 float:left;
		 margin-top:40px;
		 width:100%;
		 font-size:85%;
		 background:#F7F7F7;
		}
		
		.center_2_1{
		 float:left;
		 margin-left:15%;
		 width:70%;
		 height:150px;
		}
		
		.center_2_2{
		 float:left;
		 margin-left:15%;
		 width:70%;
		}
		
		.bottom{
		 float:left;
		 width:100%;
		 height:150px;
		 background:#F7F7F7;
		}
    </style>
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
                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/person/us" style="text-decoration:none">联系我们</a></span>
                <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/person/us" style="text-decoration:none">加入我们</a></span>
            </span>
        </div>
        <div class="bg_top_top" >
             <span style="float:left;margin-left:10%;width:20px;height:30px;"><img src="./images/First/dingwei.jpg" width="100%" height="100%"/></span>
             <span style="float:left;margin-left:5px;height:30px;line-height:28px;color:gray;font-size:80%;">[<font id="location">${sessionScope.location}</font>]</span>
             <c:choose>
                 <c:when test="${sessionScope.user==null}">
                     <font style="float:left;margin-left:30px;font-size:80%;color:red;line-height:28px;">Hi~</font>
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/login?pageSource=a5" style="float:left;margin-left:10px;font-size:80%;line-height:28px;text-decoration:none;">请登录</a> 
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/regist?pageSource=a5" style="float:left;margin-left:20px;font-size:80%;line-height:28px;text-decoration:none;">[免费注册]</a>
                 </c:when>
                 <c:otherwise>
                     <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=a5">
                     <span style="float:left;margin-top:5px;margin-left:30px;width:20px;height:20px;border-radius:15px;cursor:pointer;"><img src="${sessionScope.user.getUserPhoto()}" title="${sessionScope.user.getUserName()}" style="border-radius:15px;width:100%;height:100%;"/></span>
                     <font style="float:left;margin-left:5px;font-size:80%;line-height:28px;text-decoration:none;">${sessionScope.user.getUserName()}</font>
                     </a>
                     <a class="a1" href="${pageContext.request.contextPath }/person/user/exit?pageSource=a5" style="float:left;margin-left:10px;font-size:80%;line-height:27px;text-decoration:none;">注销</a>
                 </c:otherwise>
             </c:choose>
             <span id="showBar" style="float:right;width:60px;height:30px;text-align:center;margin-right:150px;cursor:default;font-size:80%;line-height:28px;color:gray;" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='visible';this.style.color='red';this.style.background='white'" onmouseout="this.style.color='gray';">网站导航</span>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/6?pageSource=a3" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">卖家中心</a>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=a3" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">个人中心</a>
         </div>
          <div class="bg" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
              <div class="head">
	              <div class="head_1"></div>
	              <div class="head_2" onmouseover="hiddenClassifyDiv()">
	                 <span class="logo"><img src="./images/First/tb1.jpg" width="100%" height="100%"/></span>
	                 <div class="head_2_search">
	                     <form action="${pageContext.request.contextPath }/market/1/9" method="get" onsubmit="return checkSearch();">
		                     <input name="searchText" id="searchText" style="float:left;width:80%;height:48px;border:1px solid red;" type="text" value=""/>
		                     <input style="float:left;width:20%;height:48px;background:red;color:white;border:none;cursor:pointer;" type="submit" value="搜本店"/>
			              </form>
	                 </div>
	                 <div class="car" onmouseover="enterCar()" onmouseout="leaveCar()" onclick="javascript:location.href='${pageContext.request.contextPath }/person/1/3?pageSource=a3' ">
			            <div class="carRoad">
			                <div id="theCar" class="theCar" title="购物车"><img src="./images/First/car.jpg" width="100%" height="100%"/></div>
			            </div>
			         </div>
	             </div>
              </div>
              <div class="center">
                  <div class="center_1">
                      <c:set var="theShopInfo" value="${sessionScope.shopForBuyerLookInfo.get('shopInfoForBuyer')}"></c:set>
                      <span class="center_1_1"><img src="${theShopInfo.get('shopImg')}" width="100%" height="100%"/></span>
                      <span class="center_1_2">
                          <span style=" float:left;width:100%;height:25px;background:white;">
                              <span style="float:left;text-align:left;color:gray;width:70px;height:30px;background:white;">店铺名称:</span>
                              <span style="float:left;max-width:500px;height:30px;color:blue;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;text-align:left;background:white;">${theShopInfo.get('shopName')}</span>
                          </span>
                          <span style=" float:left;width:100%;height:25px;background:white;">
                              <span style="float:left;text-align:left;color:gray;width:70px;height:30px;background:white;">店主信息:</span>
                              <span style="float:left;">
                                  <span style="float:left;width:20px;height:20px;border-radius:15px;background:red;"><img src="${theShopInfo.get('shopImg')}" style="width:20px;height:20px;border-radius:15px;"/></span>
                                  <span style="float:left;margin-left:10px;font-size:95%;">${theShopInfo.get('userName')}</span>
                                  <span style="float:left;margin-left:30px;font-size:95%;color:gray;">Tel:</span>
                                  <span style="float:left;margin-left:10px;font-size:95%;color:black;">${theShopInfo.get('shopTel')}</span>
                              </span>
                          </span>
                          <span style=" float:left;width:100%;height:25px;background:white;">
                              <span style="float:left;text-align:left;color:gray;width:70px;height:30px;background:white;">店铺地址:</span>
                              <span style="float:left;max-width:500px;height:30px;color:gray;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;text-align:left;background:white;">${theShopInfo.get('shopAdress')}</span>
                              <span style="float:left;margin-left:10px;max-width:100px;height:30px;color:gray;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;text-align:left;background:white;">(${theShopInfo.get('academyName')})</span>
                          </span>
                          <span style=" float:left;width:100%;height:25px;background:white;">
                              <span style="float:left;text-align:left;color:gray;width:70px;height:30px;background:white;">注册时间:</span>
                              <span style="float:left;">
                                  <span style="float:left;margin-left:10px;font-size:95%;"><fmt:formatDate value="${theShopInfo.get('shopCreateTime')}" pattern="yyyy-MM-dd"/></span>
                                  <span style="float:left;margin-left:30px;font-size:95%;color:gray;">营业状态:</span>
                                  <c:choose>
                                      <c:when test="${theShopInfo.get('shopState')=='1'}">
                                          <span style="float:left;margin-left:10px;font-size:95%;color:red;">正在营业</span>
                                      </c:when>
                                      <c:otherwise>
                                          <span style="float:left;margin-left:10px;font-size:95%;color:red;">正在休息</span>
                                      </c:otherwise>
                                  </c:choose>
                              </span>
                          </span>
                          <span style=" float:left;width:100%;height:25px;background:white;">
                              <span style="float:left;text-align:left;color:gray;width:70px;height:30px;background:white;">店铺简介:</span>
                              <span style="float:left;max-width:500px;height:30px;color:gray;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;text-align:left;background:white;">${theShopInfo.get('shopDesc')}</span>
                          </span>
                      </span>
                  </div>
                  
                  <div class="center_2">
                      <c:if test="${sessionScope.shopForBuyerLookInfo.get('shopTopSaleGoods').size()>0}">
                          <div class="center_2_1">
	                          <span style="float:left;font-size:150%;font-weight:bold;margin-top:50px;width:100%;height:40px;text-align:center;">店 铺 精 选</span>
	                          <span style="float:left;width:100%;height:30px;font-size:110%;"><a href="${pageContext.request.contextPath }/market/1/12?direct=2&shopId=${theShopInfo.get('shopId')}">更多商品></a></span>
                          </div>
                      </c:if>
                       <div class="center_2_2">
                           <c:choose>
                               <c:when test="${sessionScope.shopForBuyerLookInfo.get('shopTopSaleGoods').size()>0}">
                                   <c:forEach items="${sessionScope.shopForBuyerLookInfo.get('shopTopSaleGoods')}" var="item" begin="0" end ="11">
				                          <div style="float:left;margin-left:6%;margin-top:20px;width:25%;height:350px;">
				                              <div style="position:relative;width:100%;height:300px;">
				                                  <div style="position:absolute;top:0px;left:0px;width:98%;height:280px;border:2px solid #E0E0E0;background:white;">
				                                      <c:choose>
									                       <c:when test="${fn:contains(item.get('goodsImg'), ',')}">
									                           <a href="${fn:substringBefore(item.get('goodsImg'), ',')}" target="_blank"><img src="${fn:substringBefore(item.get('goodsImg'), ',')}" width="100%" height="100%"/></a>
									                       </c:when>
									                       <c:otherwise>
									                           <a href="${item.get('goodsImg')}" target="_blank"><img src="${item.get('goodsImg')}" width="100%" height="100%"/></a>
									                       </c:otherwise>
									                   </c:choose> 
				                                  </div>
				                                  <div style="position:absolute;bottom:0px;left:10%;width:80%;height:35px;">
				                                     <a href="${pageContext.request.contextPath }/market/1/8?goodsId=${item.get('goodsId')}">
				                                         <span style="float:left;width:100%;height:100%;background:black;color:white;font-size:120%;line-height:30px;" onmouseover="this.style.color='red'" onmouseout="this.style.color='white'">立即抢购</span>
				                                     </a>
				                                  </div>
				                              </div>
				                              <div style="position:relative;top:10px;width:100%;height:30px;overflow:hidden;white-space:nowrap;text-align:center;font-weight:600;">${item.get('goodsTitle')}</div>
				                          </div>
			                          </c:forEach>
                               </c:when>
                               <c:otherwise>
                                      <div style="float:left;width:100%;height:400px;">
                                          <div style="float:left;margin-left:30%;margin-top:100px;width:40%;height:150px;">
			                                  <span style="float:left;width:30%;height:100%;background:white;"><img  src="./images/comm/pig.jpg"  width="100%" height="100%"/></span>
			                                  <span style="float:left;margin-top:20px;text-align:left;font-size:120%;width:70%;height:100%;">亲，本店还没有商品呢!</span>
			                              </div>
                                      </div>
                               </c:otherwise>
                           </c:choose> 
                      </div>
                  </div>
              </div>
               <div class="bottom">
                   <div style="float:left;margin-left:15%;width:70%;height:100%;">
                       <span style="float:left;width:100%;margin-top:20px;height:20px;text-align:center;color:gray;font-size:80%;">Copyright 2018 - 2028 jim.com All Rights Reserved 京ICP证100557号 京公网安备112310102004579号 出版物经营许可证新出发京批字第直1141328号</span>
			           <span style="float:left;margin-left:25%;width:50%;background:pink;height:70px;"><img src="./images/life/bottom.jpg" width="100%" height="70px"/></span>
                   </div>
	           </div>
          </div>
      </center>
      
  </body>
</html>
