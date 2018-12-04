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
    
    <title>我的订单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%-- <script type="text/javascript" src="<c:url value='/js/life.js'/>"></script> --%>
	<!-- <link rel="stylesheet" type="text/css" href="css/manageMyInfo.css"> -->
	<style type="text/css">
	    a:visited {color: black;}
		a:link{	color:black;}
		a:hover {color:#EB0205;}
		a:active {color:#EB0205;}
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
		
		.top{
			float:left;
			margin-top:20px;
			width:100%;
			height:60px;
			background:white;
		}
		
		.top_2{
			float:left;
			width:100%;
			height:40px;
			background:#EB0205;
		}
		
		.logo{
			float:left;
			margin-left:10%;
			width:10%;
			height:100%;
		}
		
		.middle{
			float:left;
			width:100%;
		}
		
		.middle_left{
			float:left;
			margin-left:11%;
			width:9%;
			height:500px;
			background:white;
		}
		
		.middle_left_btn{
			float:left;
			width:100%;
			height:30px;
		}
		
		.middle_right{
			float:left;
			width:60%;
			border-left:2px solid #F5F5F5;
			border-right:2px solid #F5F5F5;
		}
		
		.middle_right_1{
			float:left;
			width:100%;
			height:40px;
			font-weight:bold;
		}
		
		.middle_right_1_btn{
		    float:left;
		    margin-left:5%;
		    font-size:85%;
			width:7%;
			height:20px;
			text-align:center;
			border:2px solid #F5F5F5;
		}
		
		.middle_right_1_bar{
			float:right;
			width: 60%;
			height:40px;
		}
		
		.pageSelect{
			float:right;
			width: 60%;
			height:40px;
		}
		
		.pageSelect_next{
			float:right;
			margin-right:10px;
			width: 5%;
			height:50%;
		    background:white;
		    tetx-align:center;
		    line-height:17px;
		    border:1px solid gray;
		    cursor:pointer;
		}
		
		.pageSelect_pre{
			float:right;
			width: 5%;
			height:50%;
		    background:white;
		    border:1px solid gray;
		    line-height:17px;
		    tetx-align:center;
		    cursor:pointer;
		}
		
		.pageSelect_text{
			float:right;
			margin-right:10px;
			width:55%;
			height:50%;
		}
		
		.middle_right_order{
			float:left;
			margin-left:2%;
			width:96%;
			margin-top:20px;
			height:150px;
			background:#F5F5F5;
		}
		
		.middle_right_orderForlife{
		    float:left;
			margin-left:2%;
			width:96%;
			margin-top:20px;
			height:140px;
			background:#F5F5F5;
		}
		
		.middle_right_bar{
		    float:left;
			margin-left:2%;
			width:96%;
			margin-top:20px;
			height:40px;
			background:#F5F5F5;
		}
		
		.selectAll{
		    float:left;
			margin-left:2%;
			width:96%;
			margin-top:5px;
			height:30px;
		}
		
		.dividePege{
		    float:left;
			margin-left:2%;
			width:96%;
			margin-top:10px;
			height:50px;
			background:white;
		}
		
		.bottom{
			float:left;
			width:100%;
			height:100px;
			background:#F5F5F5;
		}
	</style>
    <%
       User user = (User)session.getAttribute("user");
    %>
  </head>
  
  <body>
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
      <div class="top" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
          <span class="top_2">
              <span class="logo"><img src="./images/manageMyInfo/logo.jpg" width="100%" height="100%"/></span>
          </span>
      </div>
      <div class="middle" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
          <div class="middle_left">
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/1" style="float:left;text-align:left;text-decoration:none;font-size:85%;">基本信息</a></span>
              <span class="middle_left_btn"><a href="javascript:void(0)" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的订单</a></span>
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/3" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的购物车</a></span>
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/4" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的帖子</a></span>
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/5" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的分享</a></span>
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/6" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的店铺</a></span>
          </div>
          <div class="middle_right">
              <c:choose>
                  <c:when test="${requestScope.direct=='goodsOrder'}">
                      <!-- 进入商品订单列表 -->
                      <div class="middle_right_1">
		                  <font style="float:left;"> 我的订单 </font>
		                  <a href="javascript:void(0)"><span class="middle_right_1_btn" style="color:#EB0205">商品订单</span></a>
		                  <a href="${pageContext.request.contextPath }/person/1/2?direct=serviceOrder"><span class="middle_right_1_btn">服务订单</span></a>
		                  <div class="middle_right_1_bar">
		                      <span class="pageSelect">
		                          <c:choose>
						               <c:when test="${sessionScope.myGoodsOrder.getTotalPages()==sessionScope.myGoodsOrder.getCurrentPage() || sessionScope.myGoodsOrder.getTotalPages()==0}">
						                   <a href="javascript:void(0)" title="下一页"><span class="pageSelect_next" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&gt</span></a>
						               </c:when>
						               <c:otherwise>
						                   <a href="${pageContext.request.contextPath }/person/1/2?currentPage=${sessionScope.myGoodsOrder.getCurrentPage()+1}" title="下一页"><span class="pageSelect_next" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&gt</span></a>
						               </c:otherwise>
						           </c:choose>
		                          
		                           <c:choose>
						               <c:when test="${sessionScope.myGoodsOrder.getCurrentPage()>1}">
						                   <a href="${pageContext.request.contextPath }/person/1/2?currentPage=${sessionScope.myGoodsOrder.getCurrentPage()-1}" title="上一页"><span class="pageSelect_pre" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&lt</span></a>
						               </c:when>
						               <c:otherwise>
						                  <a href="javascript:void(0)" title="上一页"><span class="pageSelect_pre" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&lt</span></a>
						               </c:otherwise>
						           </c:choose>
						           
		                          
		                          <span class="pageSelect_text">
		                              <span style="float:left;font-size:80%;line-height:25px;">共有<font style="color:red;">${sessionScope.myGoodsOrder.getTotalRows()}</font>件商品</span>
		                              <c:if test="${sessionScope.myGoodsOrder.getTotalPages()>0}">
		                                  <span style="float:left;margin-left:10%;font-size:80%;line-height:25px;"><font style="color:red;"> ${sessionScope.myGoodsOrder.getCurrentPage()}</font>/${sessionScope.myGoodsOrder.getTotalPages()}</span>
		                              </c:if>
		                          </span>
		                      </span>
		                  </div>
		              
		              </div>
		              <c:choose>
		                  <c:when test="${sessionScope.myGoodsOrder.getTotalRows()>0}">
		                      <div class="middle_right_bar">
				                 <table border="0" width="100%" height="40px"  style="table-layout:fixed;word-wrap:break-word;border-collapse:collapse;">
							        <tr style="text-align:center;">
							           <td width="40%" style="font-size:80%;">商品</td>          
							           <td width="12%" style="font-size:80%">价格</td>
							           <td width="12%" style="font-size:80%;">数量</td>
							           <td width="12%" style="font-size:80%;">金额</td>
							           <td width="12%" style="font-size:80%;">交易状态</td>
							           <td width="12%" style="font-size:80%;">操作</td>
							        </tr>
							    </table>
			                  </div>
				              <c:forEach items="${sessionScope.myGoodsOrder.getResultList()}" var="item" varStatus="idxStatus">             
					              <div class="middle_right_order">
						                 <table  width="100%" height="100px"  style="table-layout:fixed;word-wrap:break-word;border-collapse:collapse;">
									        <tr>
									           <td width="40%" style="font-size:80%;">
									               <span style="float:left;margin-top:10px;width:100%;height:20px;">
									                   <span style="float:left;width:20px;height:20px"><img src="./images/comm/house.jpg" width="100%" height="100%"></span>
									                   <span style="float:left;margin-left:10px;color:gray;line-height:20px;">店铺:</span>
								                       <a href="${pageContext.request.contextPath }/market/1/12?direct=1&shopId=${item.get('shopId')}"><span style="float:left;margin-left:10px;line-height:20px;font-weight:bold;">${item.get('shopName')}</span></a>
									               </span>
									               <span style="float:left;margin-left:2%;margin-top:22px;width:3%;height:80px;"><!-- <input style="float:left;" type="checkbox"/> --></span>
									               <span style="float:left;margin-left:5%;margin-top:22px;width:25%;height:80px;">
									                   <c:choose>
									                       <c:when test="${fn:contains(item.get('goodsImg'), ',')}">
									                           <img src="${fn:substringBefore(item.get('goodsImg'), ',')}" width="100%" height="100%"/>
									                       </c:when>
									                       <c:otherwise>
									                           <img src="${item.get('goodsImg')}" width="100%" height="75px"/>
									                       </c:otherwise>
									                   </c:choose>              
									               </span>
									               <span style="float:left;margin-left:5%;margin-top:22px;width:60%;height:35px;">
									                   <a href="${pageContext.request.contextPath }/market/1/8?goodsId=${item.get('goodsId')}"><span style="float:left;width:100%;height:35px;overflow:hidden;">${item.get('goodsTitle')}</span></a>
									               </span>
									               <br/>
									               <span style="float:left;margin-left:5%;font-size:85%;margin-top:5px;width:60%;height:15px;color:gray;overflow:hidden;">规格: ${item.get('goodsStruct')}</span>
									               <span style="float:left;margin-left:5%;font-size:85%;margin-top:5px;width:60%;height:15px;color:gray;overflow:hidden;">时间: <fmt:formatDate value="${item.get('operateTime')}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
									           </td>          
									           <td width="12%" style="font-size:80%;text-align:center;"><span style="float:left;width:100%;height:30px;">￥${item.get('price')}</span></td>
									           <td width="12%" style="font-size:80%;text-align:center;"><span style="float:left;width:100%;height:30px;">${item.get('theGoodsNum')}</span></td>
									           <td width="12%" style="font-size:80%;text-align:center;"><span style="float:left;width:100%;height:30px;color:red;font-weight:bold;">￥<fmt:formatNumber type="number" value="${item.get('price')*item.get('theGoodsNum')}" pattern="0.00" maxFractionDigits="2"/></span></td>
									           <td width="12%" style="font-size:80%;text-align:center;">
									           <span style="float:left;width:100%;height:30px;">
									               <c:if test="${item.get('orderState')=='0'}">交易中</c:if>
									               <c:if test="${item.get('orderState')=='-1'}">交易失败</c:if>
									               <c:if test="${item.get('orderState')=='1'}">交易成功</c:if>
									           </span>
									           </td>
									           <td width="12%" style="font-size:80%;text-align:center;">
										           <span style="float:left;width:100%;height:30px;">
										               <c:if test="${item.get('orderState')=='0'}">
										                   <a class="a1" href="${pageContext.request.contextPath }/market/1/20?orderId=${item.get('orderId')}" style="text-decoration:none;">确认收货</a>
										               </c:if>
										               
										           </span>
									           </td>
									        </tr>
									    </table>
					              </div>
		                      </c:forEach>
		                  </c:when>
		                  <c:otherwise>
		                      <span style="float:left;margin-top:100px;width:100%;height:100px;">
			                      <span style="float:left;margin-left:25%;width:10%;height:100px;background:pink;"><img src="./images/showAllGoods/pig.jpg" width="100%" height="100%"/></span>
			                      <span style="float:left;margin-left:2%;text-align:left;line-height:60px;width:63%;height:100px;background:white;">
			                          <font style="float:left;">您的购物车空空如也，赶紧去</font>
			                          <a class="a4" href="${pageContext.request.contextPath }/market/First" style="float:left;margin-left:10px;">购物</a>
			                      </span>
			                  </span>
		                  </c:otherwise>
		              </c:choose>
		              
		              
		             <!--  <div class="selectAll">
		                  <span style="float:left;margin-left:1%;margin-top:5px;width:10%;height:80px;">
			                  <input style="float:left;" type="checkbox"/>
			                  <span style="float:left;font-size:80%;">全选</span>
		                  </span>
		                  <a href="#" style="float:right;margin-top:5px;margin-right:3%;font-size:80%;text-decoration:none;">删除所选</a>
		              </div> -->
		              <div class="dividePege"></div>
                  </c:when>
                  <c:otherwise>
                      <!-- 进入服务订单列表 --> 
                      <div class="middle_right_1">
		                  <font style="float:left;"> 我的订单 </font>
		                  <a href="${pageContext.request.contextPath }/person/1/2?direct=goodsOrder"><span class="middle_right_1_btn">商品订单</span></a>
		                  <a href="javascript:void(0)"><span class="middle_right_1_btn" style="color:#EB0205">服务订单</span></a>
		                  <div class="middle_right_1_bar">
		                      <span class="pageSelect">
		                          <a href="#" title="下一页"><span class="pageSelect_next" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&gt</span></a>
		                          <a href="#" title="上一页"><span class="pageSelect_pre" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&lt</span></a>
		                          <span class="pageSelect_text">
		                              <span style="float:left;font-size:80%;line-height:25px;">共有<font style="color:red;">1000</font>件商品</span>
		                              <span style="float:left;margin-left:10%;font-size:80%;line-height:25px;"><font style="color:red;">1</font>/60</span>
		                          </span>
		                      </span>
		                  </div>
		              
		              </div>
		              
		              <div class="middle_right_bar">
			                 <table border="1" width="100%" height="40px"  style="table-layout:fixed;word-wrap:break-word;border-collapse:collapse;">
						        <tr style="text-align:center;">
						           <td width="40%" style="font-size:80%;">基本信息</td>          
						          
						           <td width="18%" style="font-size:80%">订单对象</td>
						           <td width="6%" style="font-size:80%;">数量</td>
						           <td width="12%" style="font-size:80%;">金额</td>
						           <td width="12%" style="font-size:80%;">交易状态</td>
						           <td width="12%" style="font-size:80%;">操作</td>
						        </tr>
						    </table>
		              </div>
		              <div class="middle_right_orderForlife">
			                 <table  border="1" width="100%" height="140px"  style="table-layout:fixed;word-wrap:break-word;border-collapse:collapse;">
						        <tr>
						           <td width="40%" style="font-size:80%;">
						              <span style="float:left;width:10%;height:100%;">
						                  <span style="float:left;width:100%;height:20%;">编号:</span>
							              <span style="float:left;width:100%;height:20%;">内容:</span>
							              <span style="float:left;width:100%;height:20%;">时间:</span>
							              <span style="float:left;width:100%;height:20%;">备注:</span>
						              </span>
						              
						              <span style="float:right;width:88%;height:100%;">
						                  <span style="float:left;width:100%;height:20%;">a112414</span>
							              <span style="float:left;width:100%;height:20%;">订水服务</span>
							              <span style="float:left;width:100%;height:20%;">2018-03-25 12:00:00</span>
							              <span style="float:left;width:100%;height:40%;">南区3栋撒都让给虽然人人人人人人人人人人人人二哥软广告4跟4跟4跟跟跟跟4跟4跟4个人</span>
		
						              </span>
						              
						           </td>          
						           <td width="18%" style="font-size:80%;text-align:left;">
						               <span style="float:left;width:100%;height:10%;">客户方:</span>
						               <span style="float:left;margin-left:5%;margin-top:5%;width:95%;height:35%;font-size:85%;">
						                                           老豆(1249759235)<br/>
						                                           电话:18720999247                    
						               </span>
						               <span style="float:left;width:100%;height:10%;">服务方:</span>
						               <span style="float:left;margin-top:5%;margin-left:5%;width:95%;height:35%;font-size:85%;">
						                                           小马(124525653)<br/>
						                                           电话:18720999247                            
						               </span>
						           </td>
						           <td width="6%" style="font-size:80%;text-align:center;"><span style="float:left;width:100%;height:30px;">30</span></td>
						           <td width="12%" style="font-size:80%;text-align:center;">
						               <span style="float:left;width:100%;height:30px;color:red;font-weight:bold;">￥0.00</span>
						               <br/><span style="font-size:85%;">含服务费:0.00</span>
						           </td>
						           <td width="12%" style="font-size:80%;text-align:center;"><span style="float:left;width:100%;height:30px;">正在交易</span></td>
						           <td width="12%" style="font-size:80%;text-align:center;"><span style="float:left;width:100%;height:30px;"><a id="updateNum" href="#" style="text-decoration:none;">删除</a></span></td>
						        </tr>
						    </table>
		              </div>
		              
		              <div class="selectAll">
		                  <span style="float:left;margin-left:1%;margin-top:5px;width:10%;height:80px;">
			                  <input style="float:left;" type="checkbox"/>
			                  <span style="float:left;font-size:80%;">全选</span>
		                  </span>
		                  <a href="#" style="float:right;margin-top:5px;margin-right:3%;font-size:80%;text-decoration:none;">删除所选</a>
		              </div>
		              <div class="dividePege">可以分页</div>
                  </c:otherwise>
              </c:choose>
          </div>
      </div>
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
  </body>
</html>
