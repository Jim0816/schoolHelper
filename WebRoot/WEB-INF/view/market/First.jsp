<%@ page language="java" import="java.util.*,com.school.domain.personbeans.*" pageEncoding="UTF-8"%>
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
    
    <title>校园智能生活便利网</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/market/First.css ">
	<script type="text/javascript" src="<c:url value='/js/showPhotos.js'/>"></script>
	<script type="text/javascript">
        function checkSearch(){
            var searchText = document.getElementById('searchText').value.replace(/\s/g, "");
            if(searchText==''){
                return false;
            }else{
                return true;
            }
        }
  
    </script>
	<%
       User user = (User)session.getAttribute("user");
    %>
    
  </head>
  <body style="background:#F8F8F8;">
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
            <span style="float:left;margin-top:20px;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/person/us" style="text-decoration:none">客户中心</a></span>
            <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/person/us" style="text-decoration:none">联系我们</a></span>
            <span style="float:left;width:100%;height:30px;text-align:center;font-size:85%;"><a class="a4" href="${pageContext.request.contextPath }/person/us" style="text-decoration:none">加入我们</a></span>
        </span>
    </div>
    <div class="bg_top_top">
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
         <span id="showBar" style="float:right;width:60px;height:30px;text-align:center;margin-right:10%;cursor:default;font-size:80%;line-height:28px;color:gray;" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='visible';this.style.color='red';this.style.background='white'" onmouseout="this.style.color='gray';">网站导航</span>
         <a class="a1" href="${pageContext.request.contextPath }/person/1/6?pageSource=a1" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">卖家中心</a>
         <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=a1" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">个人中心</a>
    </div>	
    <div class="bg_top_search" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
         <img src="./images/First/tb1.jpg" width="150px" height="50%" style="float:left;margin-top:30px;margin-left:10%;"/>
         <div class="search_enter">
               <form action="${pageContext.request.contextPath }/market/1/9" method="post" onsubmit="return checkSearch();">
                <span style="float:left;width:90%;margin-left:5%;height:50px;border:1px solid red;">
                    <input name="searchText" id="searchText" class="search_text" type="text"/>
 		            <input class="search_btn" type="submit" value="搜索"/>
                </span>
               </form>
               <span style="float:left;width:90%;margin-left:5%;height:30px;">
                   <!-- <font style="float:left;color:gray;font-size:90%;">热门搜索:</font>
                   <a class="aa" href="#" style="float:left;margin-left:2%;text-decoration:none; font-size:90%;">二手书籍</a>
                   <a class="aa" href="#" style="float:left;margin-left:2%;text-decoration:none; font-size:90%;">宠物转让</a>
                   <a class="aa" href="#" style="float:left;margin-left:2%;text-decoration:none; font-size:90%;">韩国代购</a>
                   <a class="aa" href="#" style="float:left;margin-left:2%;text-decoration:none; font-size:90%;">网络转让</a>
                   <a class="aa" href="#" style="float:left;margin-left:2%;text-decoration:none; font-size:90%;">二手交易</a> -->
               </span>
        </div>
        <div class="car" onmouseover="enterCar()" onmouseout="leaveCar()" onclick="javascript:location.href='${pageContext.request.contextPath }/person/1/3?pageSource=a1' ">
            <div class="carRoad">
                <div id="theCar" class="theCar" title="购物车"><img src="./images/First/car.jpg" width="100%" height="100%"/></div>
            </div>
        </div>
    </div>	
    <div class="bg_top" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
       <div style="position:relative;width:100%;height:80px;background:white;z-index:7;">
          <span class="first">
              <a class="aaaa" href="${pageContext.request.contextPath }/market/First" title="校园商城" style="text-decoration:none">首页</a>
              <img src="./images/First/new.jpg" style="position:absolute;top:-10px;margin-top:0px;width:30px;height:20px;"/>
             </span>
             <font style="position:relative;left:36%;top:35%;color:red;">|</font>
             <span class="life">
              <a class="aaaa" href="${pageContext.request.contextPath }/life/1"  style="text-decoration:none">生活便利</a>
              <img src="./images/First/hot.png" style="position:absolute;top:-7px;margin-top:0px;width:30px;height:15px;"/>
              <span class="dropdown-life">
                 <a><img src="./images/First/line.png" width="100%" height="5px"/></a><br/><br/>
                 <a class="aaaa" href="${pageContext.request.contextPath }/life/1" style="text-decoration:none">缴费大厅</a><br/><br/>
			     <a class="aaaa" href="${pageContext.request.contextPath }/life/2" style="text-decoration:none">送水中心</a><br/><br/>
			     <a class="aaaa" href="${pageContext.request.contextPath }/life/3" style="text-decoration:none">物业报修</a><br/><br/>
			     <a class="aaaa" href="${pageContext.request.contextPath }/life/4" style="text-decoration:none">快递服务</a><br/><br/>
			     <a class="aaaa" href="${pageContext.request.contextPath }/life/5" style="text-decoration:none">房屋租赁</a><br/><br/>
			     <a class="aaaa" href="${pageContext.request.contextPath }/life/6" style="text-decoration:none">我要接单</a><br/>
		      </span>
             </span>
             <font style="position:relative;left:39%;top:35%;color:red;">|</font>
             <span class="study">
         		   <a class="aaaa" href="${pageContext.request.contextPath }/studyCenter/1" style="text-decoration:none">学习交流</a>
         		    <span class="dropdown-study">
	                <a><img src="./images/First/line.png" width="100%" height="5px"/></a><br/><br/>
	                <a class="aaaa" href="${pageContext.request.contextPath }/studyCenter/1" style="text-decoration:none">学习大厅</a><br/><br/>
	                <a class="aaaa" href="${pageContext.request.contextPath }/studyCenter/2" style="text-decoration:none">交流论坛</a><br/><br/>
				    <a class="aaaa" href="${pageContext.request.contextPath }/studyCenter/3" style="text-decoration:none">资料共享</a><br/><br/>
				    <a class="aaaa" href="${pageContext.request.contextPath }/studyCenter/4" style="text-decoration:none">成绩查询</a><br/>
	         </span>
            </span>
            <font style="position:relative;left:41%;top:35%;color:red;">|</font>
            <span class="school">
         		<a class="aaaa" href="${pageContext.request.contextPath }/schoolState/1" style="text-decoration:none">校园动态</a>
         		<span class="dropdown-school">
         		   <a><img src="./images/First/line.png" width="100%" height="5px"/></a><br/><br/>
                   <a class="aaaa" href="${pageContext.request.contextPath }/schoolState/1" style="text-decoration:none">校园资讯</a><br/><br/>
                   <%-- <a class="aaa" href="${pageContext.request.contextPath }/schoolState/2" style="text-decoration:none">投票互动</a><br/><br/> --%>
		           <a class="aaaa" href="${pageContext.request.contextPath }/schoolState/3" style="text-decoration:none">校园通知</a><br/>
         		</span>
            </span>
            <font style="position:relative;left:43%;top:35%;color:red;">|</font>
            <span class="we">
         		 <a class="aaaa" href="${pageContext.request.contextPath }/person/us"  style="text-decoration:none">关于我们</a>
                <span class="dropdown-we">
                <a><img src="./images/First/line.png" width="100%" height="5px"/></a><br/><br/>
                <a class="aaaa" href="${pageContext.request.contextPath }/person/us" style="text-decoration:none">客服中心</a><br/><br/>
			    <a class="aaaa" href="${pageContext.request.contextPath }/person/us" style="text-decoration:none">联系我们</a><br/>
	         </span>
            </span>
       </div>
       <div style="float:left;margin-left:10%;width:80%;height:500px;background:white;">
	       <!-- 轮播图片区 -->
	       <div id="imgDirection" class="imgDirection">
	           <font id="pre" class="pre" onmouseover="this.style.color='red'" onmouseout="this.style.color='gray'">&lt</font>
	           <font id="next" class="next" onmouseover="this.style.color='red'" onmouseout="this.style.color='gray'">&gt</font>
	       </div>
	       <div id="imgIndex" class="imgIndex">
	           <span id="dot1" class="dot" style="background:red;"></span>
	           <span id="dot2" class="dot"></span>
	           <span id="dot3" class="dot"></span>
	           <span id="dot4" class="dot"></span>
	           <span id="dot5" class="dot"></span>
	       </div>
	       <div class="bg_top_select" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'"> 
		       <!-- 得到当前顶部商品广告数量 -->
		       <input type="hidden" id="topGoodsImgsNum" value="${sessionScope.goodsAdvInfo.getResultList().size()}"/>
		       <c:forEach items="${sessionScope.goodsAdvInfo.getResultList()}" var="item" begin="0" end="4" varStatus="Index">
		           <div id="img${Index.index+1}" class="topGoodsImg${Index.index+1}" style="z-index:${5-Index.index};">
			           <a href="${pageContext.request.contextPath }/market/1/8?goodsId=${item.get('goodsId')}" title="${item.get('goodsIntroduce')}">
				           <c:choose>
		                       <c:when test="${fn:contains(item.get('goodsAdvImg'), ',')}">
		                           <img src="${fn:substringBefore(item.get('goodsAdvImg'), ',')}" style="float:left;width:100%;height:100%;"/>
		                       </c:when>
		                       <c:otherwise>
		                           <img src="${item.get('goodsAdvImg')}" style="float:left;width:100%;height:100%;"/>
		                       </c:otherwise>
			               </c:choose>
		               </a>
			       </div>
		       </c:forEach>
	       </div>  
      </div>     
    </div>
       
     <!-- 中部布局 -->  
     <div class="bg_middle_1">
         <div class="bg_middle_1_title">
             <span style="float:left;margin-top:1%;"><img src="./images/First/tb2.jpg" alt="" width="40px" height="30px"/></span>
             <span style="float:left;margin-top:1%;margin-left:10px;font-size:130%; color:black;">校园商城</span>
             <span style="float:left;margin-top:1%;margin-left:10px;font-size:130%; color:black;color:gray;">SCHOOL MALL</span>
         </div>
         <div style="float:left;margin-top:5px; background:black;opacity:0.6;width:25%;height:520px;">
           <span><a class="aaa"href="${pageContext.request.contextPath }/market/1/10?one=1" style="text-decoration:none;font-size:120%;margin-left:5%;">生活家具</a></span><br/>
           <div class="bg_middle_1_select1">
               <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=1&two=1" style="text-decoration:none;font-size:90%;">家纺装饰</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=1&two=2" style="text-decoration:none;font-size:90%;margin-left:5px;">清洁工具</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=1&two=3" style="text-decoration:none;font-size:90%;margin-left:5px;">生活用品</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=1&two=4" style="text-decoration:none;font-size:90%;margin-left:5px;">生活保健</a></span><br/>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=1&two=5" style="text-decoration:none;font-size:90%;margin-left:0px;">食物用具</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=1&two=6" style="text-decoration:none;font-size:90%;margin-left:5px;">个人护理</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=1&two=7" style="text-decoration:none;font-size:90%;margin-left:5px;">美妆</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=1&two=0" style="text-decoration:none;font-size:90%;margin-left:5px;">更多</a></span>
           </div>
           
           <span><a class="aaa"href="${pageContext.request.contextPath }/market/1/10?one=2" style="text-decoration:none;font-size:120%;margin-left:5%;">数码家电</a></span><br/>
	       <div class="bg_middle_1_select2">
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=2&two=1" style="text-decoration:none;font-size:90%;">相机</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=2&two=2" style="text-decoration:none;font-size:90%;margin-left:5px;">手机</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=2&two=3" style="text-decoration:none;font-size:90%;margin-left:5px;">平板电脑</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=2&two=4" style="text-decoration:none;font-size:90%;margin-left:5px;">笔记本电脑</a></span>   
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=2&two=5" style="text-decoration:none;font-size:90%;margin-left:5px;">&nbsp配件</a></span><br/>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=2&two=6" style="text-decoration:none;font-size:90%;margin-left:0px;">小家电</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=2&two=0" style="text-decoration:none;font-size:90%;margin-left:0px;">更多</a></span>
	       </div>
           
           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=3" style="text-decoration:none;font-size:120%;margin-left:5%;">服饰配件</a></span><br/>
           <div class="bg_middle_1_select3">
               <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=3&two=1" style="text-decoration:none;font-size:90%;">男装</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=3&two=2" style="text-decoration:none;font-size:90%;margin-left:5px;">女装</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=3&two=3" style="text-decoration:none;font-size:90%;margin-left:5px;">鞋子</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=3&two=4" style="text-decoration:none;font-size:90%;margin-left:5px;">箱包</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=3&two=5" style="text-decoration:none;font-size:90%;margin-left:5px;">&nbsp首饰挂饰</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=3&two=6" style="text-decoration:none;font-size:90%;margin-left:5px;">&nbsp礼服</a></span><br/>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=3&two=7" style="text-decoration:none;font-size:90%;margin-left:0px;">户外用品</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=3&two=0" style="text-decoration:none;font-size:90%;margin-left:0px;">更多</a></span>
           </div>
           
           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4" style="text-decoration:none;font-size:120%;margin-left:5%;">食品水果</a></span><br/>
           <div class="bg_middle_1_select4">
               <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4&two=1" style="text-decoration:none;font-size:90%;">饮料饮品</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4&two=2" style="text-decoration:none;font-size:90%;margin-left:5px;">休闲零食</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4&two=3" style="text-decoration:none;font-size:90%;margin-left:5px;">糖果饼干</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4&two=4" style="text-decoration:none;font-size:90%;margin-left:5px;">糕点面包</a></span><br/>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4&two=5" style="text-decoration:none;font-size:90%;margin-left:0px;">新鲜水果</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4&two=6" style="text-decoration:none;font-size:90%;margin-left:3px;">营养速食</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4&two=7" style="text-decoration:none;font-size:90%;margin-left:3px;">坚果</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4&two=8" style="text-decoration:none;font-size:90%;margin-left:3px;">辣条专区</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=4&two=0" style="text-decoration:none;font-size:90%;margin-left:3px;">更多</a></span>
           </div>
           
           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=5" style="text-decoration:none;font-size:120%;margin-left:5%;">学习办公</a></span><br/>
           <div class="bg_middle_1_select5">
               <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=5&two=1" style="text-decoration:none;font-size:90%;">杂志报刊</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=5&two=2" style="text-decoration:none;font-size:90%;margin-left:5px;">课本教辅</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=5&two=3" style="text-decoration:none;font-size:90%;margin-left:5px;">专业书籍</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=5&two=4" style="text-decoration:none;font-size:90%;margin-left:5px;">试卷材料</a></span><br/>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=5&two=5" style="text-decoration:none;font-size:90%;margin-left:0px;">办公用品</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=5&two=6" style="text-decoration:none;font-size:90%;margin-left:5px;">工具书</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=5&two=0" style="text-decoration:none;font-size:90%;margin-left:5px;">更多</a></span>
           </div>   
           
           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=6" style="text-decoration:none;font-size:120%;margin-left:5%;">其他</a></span><br/>
           <div class="bg_middle_1_select6">
               <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=6&two=1" style="text-decoration:none;font-size:90%;">乐器</a></span>
               <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=6&two=2" style="text-decoration:none;font-size:90%;margin-left:0px;">DIY手工</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=6&two=3" style="text-decoration:none;font-size:90%;margin-left:5px;">校园网络</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=6&two=4" style="text-decoration:none;font-size:90%;margin-left:5px;">上门维修</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=6&two=5" style="text-decoration:none;font-size:90%;margin-left:5px;">鲜花</a></span><br/>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=6&two=6" style="text-decoration:none;font-size:90%;margin-left:0px;">宠物</a></span>
	           <span><a class="aaa" href="${pageContext.request.contextPath }/market/1/10?one=6&two=0" style="text-decoration:none;font-size:90%;margin-left:0px;">更多</a></span>
           </div>    
       </div>
       <a href="${pageContext.request.contextPath }/market/1/8?goodsId=40"><img src="./images/First/food1.jpg" style="float:left;margin-top:5px;" width="30%" height="520px"/>
       <span class="bigPhotoTab">
	       <span style="text-align:center;float:left;margin-top:10px;width:100%;height:30px;color:white;font-size:120%">健康美食</span><br/>   
	       <span style="text-align:center;float:left;width:100%;height:30px;color:white;font-size:80%;">让生活&nbsp更健康&nbsp更舒心&nbsp更美味</span>   
	   </span>
	   </a>
       <div class="bg_middle_1_product-top" >
           <div style="float:left;width:100%;height:100%">
               <span style="float:left;margin-top:5px;width:100%;height:328px;background:white;">
	               <span style="float:left;margin-left:5%;width:90%;height:128px;">
	                   <span style="float:left;width:100%;height:31px;background:white;">
	                       <span style="float:left;"><img src="./images/First/location.jpg" width="27px" height="31px"/></span>
	                       <span style="float:left;margin-left:12px;font-size:100%;color:gray;line-height:32px;">店铺区域</span>
	                   </span><br/>
	                   <span style="float:left;margin-left:2%;margin-top:10px;width:98%;height:97px;">
	                       <a class="aa" href="${pageContext.request.contextPath }/market/1/11?a=1" style="text-decoration:none;font-size:90%;">农学院</a>
	                       <a class="aa" href="${pageContext.request.contextPath }/market/1/11?a=2" style="margin-left:3%; text-decoration:none;font-size:90%;">动科院</a>
	                       <a class="aa" href="${pageContext.request.contextPath }/market/1/11?a=3" style="margin-left:3%; text-decoration:none;font-size:90%;">外语院</a>
	                       <a class="aa" href="${pageContext.request.contextPath }/market/1/11?a=4" style="margin-left:3%; text-decoration:none;font-size:90%;">计信院</a>
	                       <a class="aa" href="${pageContext.request.contextPath }/market/1/11?a=5" style="margin-left:3%; text-decoration:none;font-size:90%;">经管院</a>
	                       <a class="aa" href="${pageContext.request.contextPath }/market/1/11?a=6" style="margin-left:3%; text-decoration:none;font-size:90%;">职师院</a>
	                       <a class="aa" href="${pageContext.request.contextPath }/market/1/11?a=7" style="margin-left:3%; text-decoration:none;font-size:90%;">理学院</a>
	                       <a class="aa" href="${pageContext.request.contextPath }/market/1/11?a=8" style="margin-left:3%; text-decoration:none;font-size:90%;">成教学院</a>
	                       <a class="aa" href="${pageContext.request.contextPath }/market/1/11?a=9" style="margin-left:3%; text-decoration:none;font-size:90%;">林学院</a>
	                       <a class="aa" href="${pageContext.request.contextPath }/market/1/11?a=10" style="margin-left:0%; text-decoration:none;font-size:90%;">园林院</a>
	                       <a class="aa" href="${pageContext.request.contextPath }/market/1/11?a=11" style="margin-left:3%; text-decoration:none;font-size:90%;">工学院</a>
	                       <a class="aa" href="${pageContext.request.contextPath }/market/1/11?a=12" style="margin-left:3%; text-decoration:none;font-size:90%;">国土院</a>
	                       <a class="aa" href="${pageContext.request.contextPath }/market/1/11?a=13" style="margin-left:3%; text-decoration:none;font-size:90%;">软件院</a>
	                       <a class="aa" href="${pageContext.request.contextPath }/market/1/11?a=14" style="margin-left:3%; text-decoration:none;font-size:90%;">人文院</a>
	                       <a class="aa" href="${pageContext.request.contextPath }/market/1/11?a=15" style="margin-left:2%; text-decoration:none;font-size:90%;">食品院</a>
	                       <a class="aa" href="${pageContext.request.contextPath }/market/1/11?a=16" style="margin-left:0%;text-decoration:none;font-size:90%;">生工院</a>
	                       <a class="aa" href="${pageContext.request.contextPath }/market/1/11?a=17" style="margin-left:3%; text-decoration:none;font-size:90%;">研究生院</a>
	                       <a class="aa" href="${pageContext.request.contextPath }/market/1/11?a=0" style="margin-left:3%; text-decoration:none;font-size:90%;">更多</a>
	                   </span>
	               </span>
	               <span style="float:left;width:100%;height:30px;background:white;">
	                   <span style="float:left;margin-left:20px;width:50px;height:30px;background:white;">
	                       <img src="./images/First/shop.jpg" width="100%" height="100%"/>
	                   </span>
	                   <span style="float:left;font-size:100%;color:gray;line-height:28px;">热门店铺</span>
	               </span>
	               <span style="float:left;margin-top:10px;width:100%;height:150px;">
	                   <c:forEach items="${sessionScope.topSixShop.getResultList()}" var="item" varStatus="idxStatus">             
	                       <a class="a1" href="${pageContext.request.contextPath }/market/1/12?direct=1&shopId=${item.get('shopId')}"><span class="bg_middle_1_product-top-btn" onmouseover="this.style.background='red';this.style.color='white'" onmouseout="this.style.background='#EEEEEE';this.style.color='gray'">${item.get('shopName')}</span></a>
	                   </c:forEach>
	               </span>
	           </span>
           </div>
       </div>
       <div class="bg_middle_1_product-bottom" >
          <div style="float:left;width:100%;height:30px;background:white;">
              <span style="float:left;margin-left:30px;width:30px;height:30px;background:white;">
                  <img src="./images/First/hotSale.jpg" width="100%" height="100%"/>
              </span>
              <span style="float:left;margin-left:8px;font-size:100%;color:gray;line-height:28px;">热卖商品</span>
          </div>
          <div style="float:left;width:100%;height:160px;background:white;">
              <div class="showTopGoods">
                  <div id="slideDiv" class="slideDiv" onmouseover="enterTopBg()" onmouseout="leaveTopBg()">
                      <c:forEach items="${sessionScope.topGoods.getResultList()}" var="item" begin="0" end="9" varStatus="idxStatus">          
				           <div class="goods" onmouseover="this.style.borderColor='gray'" onmouseout="this.style.borderColor='white'">
				              <div style="position:relative;width:100%;height:100%;background:white;">
				                  <a href="${pageContext.request.contextPath }/market/1/8?goodsId=${item.get('goodsId')}">
				                      <span style="position:absolute;z-index:1;width:100%;height:100%;background:white;">
				                          <c:choose>
						                       <c:when test="${fn:contains(item.get('goodsImg'), ',')}">
						                           <img src="${fn:substringBefore(item.get('goodsImg'), ',')}" width="100%" height="100%"/>
						                       </c:when>
						                       <c:otherwise>
						                           <img src="${item.get('goodsImg')}" width="100%" height="100%"/>
						                       </c:otherwise>
						                   </c:choose>
				                      </span>
				                      <span style="position:absolute;bottom:0px;z-index:2;width:100%;height:55px;background:black;opacity:0.5;">
				                          <span style="float:left;text-align:center;color:white;font-size:80%;width:100%;height:37px;overflow:hidden;">${item.get('goodsTitle')}</span>
				                          <span style="float:left;text-align:center;color:red;font-size:80%;font-weight:bold;width:100%;height:17px;overflow:hidden;">￥${item.get('goodsPrice')}</span>
				                      </span>
				                  </a>  
				              </div>
				           </div>
			           </c:forEach>
                  </div>
              </div>
	          
          </div>
       </div>
       <div style="float:left;margin-top:20px;width:100%;height:200px;background:white;">
           <div style="float:left;width:100%;height:40px;background:red;">
               <font style="float:left;margin-left:10px;color:white;font-weight:bold;font-size:150%;">|</font>
               <font style="float:left;margin-left:10px;color:white;font-size:110%;line-height:35px;">为您推荐</font>
           </div>
           <div style="float:left;margin-top:10px;width:98.5%;height:140px;background:white;">
               <c:forEach items="${sessionScope.shopAdvInfo.getResultList()}" var="item" begin="0" end="2" varStatus="idxStatus">
	               <div style="float:left;margin-left:1%;width:32%;height:98%;background:white;cursor:pointer;border:1px solid white;" onmouseover="this.style.borderColor='red'" onmouseout="this.style.borderColor='white'" onclick="javascript:location.href='${pageContext.request.contextPath }/market/1/12?direct=1&shopId=${item.get('shopId')}'">
	                   <c:choose>
	                       <c:when test="${fn:contains(item.get('shopAdvImgs'), ',')}">
	                           <img src="${fn:substringBefore(item.get('shopAdvImgs'), ',')}" width="100%" height="100%"/>
	                       </c:when>
	                       <c:otherwise>
	                           <img src="${item.get('shopAdvImgs')}" width="100%" height="100%"/>
	                       </c:otherwise>
	                   </c:choose>
	               </div>
               </c:forEach>
           </div>
       </div>
     </div>
     
     <div class="bg_middle_2">
         <div class="bg_middle_2_title">
             <span style="float:left;margin-top:1%;"><img src="./images/First/tb5.jpg" alt="" width="40px" height="30px"/></span>
             <span style="float:left;margin-top:1%;margin-left:10px;font-size:130%; color:black;">本地活动</span>
             <span style="float:left;margin-top:1%;margin-left:10px;font-size:130%; color:black;color:gray;">LOC ACTIVITY</span>
             <a class="a5" href="#" style="float:right;margin-right:30px;line-height:50px;text-decoration:none;font-size:100%;">更多</a>
         </div>
        <div class="bg_middle_2_center">
            <c:forEach items="${sessionScope.advListTop}" var="item" varStatus="idxStatus">          
	            <div style="float:left;width:33.3%;height:300px;background:white;cursor:pointer;" onmouseover="this.style.background='#EEEEEE'" onmouseout="this.style.background='white'" onclick="javascript:window.open('${item.get('senderUrl')}')">
	                <div style="float:left;margin-top:5%;margin-left:3%;width:94%;height:65%;background:white;">
	                    <c:choose>
	                       <c:when test="${fn:contains(item.get('advPhoto'), ',')}">
	                           <img src="${fn:substringBefore(item.get('advPhoto'), ',')}" style="width:100%;height:100%;border-radius:5px;"/>
	                       </c:when>
	                       <c:otherwise>
	                           <img src="${item.get('advPhoto')}" style="width:100%;height:100%;border-radius:5px;"/>
	                       </c:otherwise>
	                   </c:choose>
	                </div>
	                <div style="float:left;margin-top:2%;margin-left:3%;width:94%;height:25%;">
	                    <div style="float:left;width:100%;text-align:left;height:40%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${item.get('advTitle')}</div>
	                    <div style="float:left;width:100%;text-align:left;height:30%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;color:gray;font-size:75%;">${item.get('advContent')}</div>
	                    <div style="float:left;width:100%;text-align:left;height:30%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;color:gray;font-size:85%;">
	                        <font style="float:left;">${item.get('advSendTime')}</font>
	                        <font style="float:right;color:#45B897;">${item.get('advSender')}</font>
	                    </div>
	                </div>
	            </div>
            </c:forEach>
            
           
        </div>
        
     </div>
           
     <div class="bg_middle_3">
         <div class="bg_middle_3_title">
           <span style="float:left;margin-top:1%;"><img src="./images/First/tb3.jpg" alt="" width="40px" height="30px"/></span>
           <span style="float:left;margin-top:1%;margin-left:10px;font-size:130%; color:black;">兼职发布</span>
           <span style="float:left;margin-top:1%;margin-left:10px;font-size:130%; color:black;color:gray;">Part-Time News</span>
           <a class="a6" href="#" style="float:right;margin-right:30px;line-height:50px;text-decoration:none;font-size:100%;">更多</a>
         </div>
         <div class="bg_middle_3_center">
             <c:forEach items="${sessionScope.jobList}" var="item" begin="0" end="9" varStatus="idxStatus">          
	             <div class="job" onmouseover="this.style.background='#EEEEEE'" onmouseout="this.style.background='white'" onclick="javascript:window.open('${item.get('jobUrl')}')">
	                 <center>
	                     <div style="width:90%;margin-top:20px;height:150px;border-radius:5px;">
	                          <c:choose>
			                       <c:when test="${fn:contains(item.get('jobPhoto'), ',')}">
			                           <img src="${fn:substringBefore(item.get('jobPhoto'), ',')}" style="width:100%;height:100%;border-radius:5px;"/>
			                       </c:when>
			                       <c:otherwise>
			                           <img src="${item.get('jobPhoto')}" style="width:100%;height:100%;border-radius:5px;"/>
			                       </c:otherwise>
			                   </c:choose>
	                     </div>
	                     <div style="width:90%;text-align:left;margin-top:5px;height:23px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap">${item.get('jobTitle')}</div>
	                     <div style="width:90%;text-align:left;margin-top:5px;height:20px;color:gray;font-size:85%;overflow:hidden;">${item.get('jobContent')}</div>
	                     <div style="width:90%;text-align:left;margin-top:5px;height:20px;color:gray;font-size:85%;overflow:hidden;">${item.get('jobsendTime')}</div>
	                 </center>
	             </div>
             </c:forEach>
         </div>
     </div>
     
     <div class="bottom">
     	<div class="bottom_1">
     	    <center>
     	    	<font class="bottom_title">生活便利</font><br/><br/>
     	    	<a class="a3" href="#" style="text-decoration:none;font-size:70%;">缴费大厅</a><br/>
     	    	<a class="a3" href="#" style="text-decoration:none;font-size:70%;">送水中心</a><br/>
     	    	<a class="a3" href="#" style="text-decoration:none;font-size:70%;">物业报修</a><br/>
     	    	<a class="a3" href="#" style="text-decoration:none;font-size:70%;">快递服务</a><br/>
     	    	<a class="a3" href="#" style="text-decoration:none;font-size:70%;">代办服务</a><br/>
     	    	<a class="a3" href="#" style="text-decoration:none;font-size:70%;">我要接单</a><br/>
     	    </center>
     	</div>
     	<div class="bottom_2">
     		<center>
     	    	<font class="bottom_title">学习交流</font><br/><br/>
     	    	<a class="a3" href="#" style="text-decoration:none;font-size:70%;">交流论坛</a><br/>
     	    	<a class="a3" href="#" style="text-decoration:none;font-size:70%;">资源共享</a><br/>
     	    	<a class="a3" href="#" style="text-decoration:none;font-size:70%;">成绩查询</a><br/>
     	    </center>
     	</div>
     	<div class="bottom_3">
     		<center>
     	    	<font class="bottom_title">校园动态</font><br/><br/>
     	    	<a class="a3" href="#" style="text-decoration:none;font-size:70%;">校园新闻</a><br/>
     	    	<a class="a3" href="#" style="text-decoration:none;font-size:70%;">投票互动</a><br/>
     	    	<a class="a3" href="#" style="text-decoration:none;font-size:70%;">事项安排</a><br/>
     	    </center>
     	</div>
     	<div class="bottom_4">
     		<center>
     	    	<font class="bottom_title">关于我们</font><br/><br/>
     	    	<a class="a3" href="#" style="text-decoration:none;font-size:70%;">客户中心</a><br/>
     	    	<a class="a3" href="#" style="text-decoration:none;font-size:70%;">联系我们</a><br/>
     	    </center>
     	</div>
     	<div class="bottom_bottom">
     	    <center>
     	    	<font style="color:gray;">版权所有    @2018 磐石工作室</font><br/>
     	    	<font style="color:gray;font-size:80%;">地址:江西农业大学软件学院磐石工作室</font>
     	    </center>
     	</div>
     </div>   
        
        
        

  </body>
</html>
