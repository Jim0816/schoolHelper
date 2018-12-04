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
    
    <title>确认订单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<c:url value='/js/confirmOrder.js'/>"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <style type="text/css">
        a:visited {color: black;}
		a:link{	color:black;}
		a:hover {color:red;}
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
            background:red;
        }
        .top{
            float:left;
            width:100%;
            height:180px;
            background:white;
        }
        
        .top_1{
            float:left;
            width:100%;
            height:0px;
            background:#EEEEEE;
        }
        
         .top_2{
            float:left;
            width:100%;
            height:120px;
            background:white;
        }
         .center{
            float:left;
            width:100%;
            background:white;
        }
        .center_1{
            float:left;
            margin-left:10%;
            width:80%;
            height:450px;
            background:white;
            border:1px solid #DDDDDD;
        }
        
         .center_2{
            float:left;
            margin-left:10%;
            width:80%;
            background:white;
            border-bottom:1px solid #EEEEEE;
        }
        
        .center_3{
            margin-top:20px;
            float:right;
            margin-right:10%;
            width:50%;
            height:180px;
            background:white;
        }
         .bottom{
            float:left;
            margin-left:10%;
            margin-top:20px;
            width:80%;
            height:150px;
            background:white;
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
	      <div class="bg" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
	          <div class="top">
	              <div class="top_1"></div>
	              <div class="top_2">
	                  <span style="float:left;margin-left:10%;margin-top:20px;width:10%;height:80px;"><img src="./images/First/tb1.jpg" width="100%" height="100%"/></span>
	                  <span style="float:left;margin-left:20%;margin-top:10px;width:50%;height:90px;"><img src="./images/comm/xiadan.jpg" width="100%" height="100%"/></span>
	              </div>
	          </div>
	          <form action="${pageContext.request.contextPath }/market/1/19" method="post"  onsubmit="return checkSubmit();">
		          <div class="center">
		              <div class="center_1">
		                  <span style="float:left;width:100%;margin-top:20px;height:30px;background:white;text-align:left;font-size:100%;font-weight:600;">填写收货信息</span>
		                  <span style="float:left;margin-top:30px;width:100%;height:50px;background:white;">
		                      <span style="float:left;color:red;font-size:140%;">*</span>
		                      <span style="float:left;">收货人:</span>
		                      <input id="name" name="receiveName" style="float:left;margin-left:37px;border:none;border:1px solid #EEEEEE;color:#DDDDDD;" maxlength="10" type="text" value="请输入收货人姓名" onclick="inputCheck(this)" onblur="leaveInput(this)" onmouseout="changeShow(this)"/>
		                      <span id="tips1" style="float:left;margin-left:20px;color:white;font-size:90%;">请输入收货人姓名</span>
		                  </span>
		                  <span style="float:left;width:100%;height:50px;background:white;">
		                      <span style="float:left;color:red;font-size:140%;">*</span>
		                      <span style="float:left;">电话:</span>
		                      <input id="receiveTel" name="receiveTel" style="float:left;margin-left:52px;border:none;border:1px solid #EEEEEE;color:#DDDDDD;" maxlength="11" type="text" value="请输入收货人电话" onclick="inputCheck(this)" onblur="leaveInput(this)" onmouseout="changeShow(this)"/>
		                      <span id="tips2" style="float:left;margin-left:20px;color:white;font-size:90%;">请输入收货人联系电话</span>
		                  </span>
		                  <span style="float:left;width:100%;height:120px;background:white;">
		                      <span style="float:left;color:red;font-size:140%;">*</span>
		                      <span style="float:left;">收货地址:</span>
		                      <textarea  id="receiveAddress" name="receiveAddress" rows="4" cols="55" style="float:left;margin-left:20px;resize:none;border:1px solid #EEEEEE;color:#DDDDDD;" onclick="inputCheck(this)" onblur="leaveInput(this)" onmouseout="changeShow(this)">请输入收货地址</textarea>
		                      <span id="tips3" style="float:left;margin-left:20px;color:white;font-size:90%;">请输入收货地址</span>
		                  </span>
		                  <span style="float:left;width:100%;height:120px;background:white;">
		                      <span style="float:left;margin-left:10px;">备注:</span>
		                      <textarea id="receiveRemark" name="receiveRemark" rows="4" cols="55" style="float:left;margin-left:52px;resize:none;border:1px solid #EEEEEE;color:#DDDDDD;" onclick="inputCheck(this)" onblur="leaveInput(this)">备注您的建议</textarea>
		                  </span>
		              </div>
		              <c:choose>
		                  <c:when test="${requestScope.direct=='one'}">
		                      <!-- 直接购买 -->
		                      <input type="hidden" name="type" value="one"/>
		                      <input type="hidden" name="goodsId" value="${sessionScope.waitOrder.getGoodsId()}"/>
		                      <input type="hidden" name="price" value="${sessionScope.waitOrder.getGoodsPrice()}"/>
		                      <input type="hidden" name="theGoodsNum" value="${sessionScope.theGoodsNum}"/>
		                      <input type="hidden" name="orderMoney" value="${sessionScope.allPrice}"/>
		                      
		                      <div class="center_2">
			                      <span style="float:left;width:100%;margin-top:20px;height:30px;background:white;text-align:left;font-size:100%;font-weight:600;">确认订单信息</span>        
				                  <div style="float:left;margin-top:20px;width:100%;height:28px;border-bottom:2px solid #B2D1FF;">
				                      <table border="0" width="100%" height="30px"  style="table-layout:fixed;word-wrap:break-word;border-collapse:collapse;">
									        <tr style="text-align:center;font-weight:bold;">
									           <td width="35%" style="font-size:80%;">店铺商品</td>        
									           <td width="25%" style="font-size:80%">商品属性</td>
									           <td width="14%" style="font-size:80%;">单价</td>
									           <td width="13%" style="font-size:80%;">数量</td>
									           <td width="13%" style="font-size:80%;">金额</td>
									        </tr>
									   </table>
				                  </div>
					                  <div style="float:left;margin-top:20px;width:100%;height:130px;background:#FBFCFF;">
					                       <div style="float:left;width:100%;height:29px;background:white;border-bottom:1px solid #B2D1FF;">
							                   <span style="float:left;width:25px;height:25px"><img src="./images/comm/house.jpg" width="100%" height="100%"></span>
							                   <span style="float:left;margin-left:10px;color:gray;line-height:25px;">店铺:</span>
							                   <a href="${pageContext.request.contextPath }/market/1/12?direct=1&shopId=${sessionScope.waitOrder.getShopId()}"><span style="float:left;margin-left:10px;line-height:25px;">${sessionScope.waitOrder.getShopName()}</span></a>
							               </div>
							               <div style="float:left;width:100%;height:90px;background:#FBFCFF;">
							                   <table border="0" width="100%" height="90px"  style="table-layout:fixed;word-wrap:break-word;border-collapse:collapse;">
											        <tr style="text-align:center;">
											           <td width="35%">
											               <div style="float:left;margin-top:5px;width:100%;height:70px;">
											                   <span style="float:left;width:20%;height:100%;">
											                       <c:choose>
												                        <c:when test="${fn:contains(sessionScope.waitOrder.getGoodsImg(), ',')}">
												                            <img src="${fn:substringBefore(sessionScope.waitOrder.getGoodsImg(), ',')}" width="100%" height="100%"/>
												                        </c:when>
												                        <c:otherwise>
												                            <img src="${sessionScope.waitOrder.getGoodsImg()}" width="100%" height="100%"/>
												                        </c:otherwise>
											                       </c:choose> 
											                   </span>
											                   <span style="float:left;margin-left:3%;width:74%;height:50%;text-align:left;color:black;font-size:85%;overflow:hidden;"><a href="${pageContext.request.contextPath }/market/1/8?goodsId=${sessionScope.waitOrder.getGoodsId()}">${sessionScope.waitOrder.getGoodsTitle()}</a></span>
											               </div>
											           </td>        
											           <td width="25%">
											               <div style="float:left;margin-top:5px;width:100%;height:70px;">
						                                       <span style="float:right;width:90%;height:100%;font-size:85%;color:gray;">
						                                           <font style="float:left;"></font>
						                                           <font style="float:left;margin-left:10px;">${sessionScope.waitOrder.getGoodsStruct()}</font>
						                                       </span>
											               </div>
											           </td>
											           <td width="14%">
											               <div style="float:left;margin-top:5px;width:100%;height:70px;">
						                                       <span style="float:left;margin-left:5%;width:90%;height:100%;font-size:85%;">${sessionScope.waitOrder.getGoodsPrice()}</span>
											               </div>
											           </td>
											           <td width="13%">
											               <div style="float:left;margin-top:5px;width:100%;height:70px;">
						                                       <span style="float:left;margin-left:20%;width:60%;height:40%;background:white;">
						                                           <span style="width:70%;height:26px;background:white;line-height:25px;border-top:1px solid #B2D1FF;border-bottom:1px solid #B2D1FF;font-size:85%;">${sessionScope.theGoodsNum}</span>
						                                       </span>
											               </div>
											           </td>
											           <td width="13%">
											               <div style="float:left;margin-top:5px;width:100%;height:70px;">
						                                       <span style="float:left;margin-left:5%;width:90%;height:100%;font-size:85%;color:red;font-weight:bold;"><fmt:formatNumber type="number" value="${sessionScope.theGoodsNum*sessionScope.waitOrder.getGoodsPrice()}" pattern="0.00" maxFractionDigits="2"/></span>
											               </div>
											           </td>
											        </tr>
											   </table>
							               </div>  
					                  </div>
				                  <div style="float:left;width:100%;height:30px;background:white;"></div>
				              </div>
		                  </c:when>
		                  <c:otherwise>
		                      <!-- 购物车选择购买 -->
		                      <input type="hidden" name="type" value="two"/>
		                      <div class="center_2">
			                      <span style="float:left;width:100%;margin-top:20px;height:30px;background:white;text-align:left;font-size:100%;font-weight:600;">确认订单信息</span>        
				                  <div style="float:left;margin-top:20px;width:100%;height:28px;border-bottom:2px solid #B2D1FF;">
				                      <table border="0" width="100%" height="30px"  style="table-layout:fixed;word-wrap:break-word;border-collapse:collapse;">
									        <tr style="text-align:center;font-weight:bold;">
									           <td width="35%" style="font-size:80%;">店铺商品</td>        
									           <td width="25%" style="font-size:80%">商品属性</td>
									           <td width="14%" style="font-size:80%;">单价</td>
									           <td width="13%" style="font-size:80%;">数量</td>
									           <td width="13%" style="font-size:80%;">金额</td>
									        </tr>
									   </table>
				                  </div>
				                  <c:forEach items="${sessionScope.waitOrder}" var="item" varStatus="idxStatus">
					                  <div style="float:left;margin-top:20px;width:100%;height:130px;background:#FBFCFF;">
					                       <div style="float:left;width:100%;height:29px;background:white;border-bottom:1px solid #B2D1FF;">
							                   <span style="float:left;width:25px;height:25px"><img src="./images/comm/house.jpg" width="100%" height="100%"></span>
							                   <span style="float:left;margin-left:10px;color:gray;line-height:25px;">店铺:</span>
							                   <a href="${pageContext.request.contextPath }/market/1/12?direct=1&shopId=${item.get('shopId')}"><span style="float:left;margin-left:10px;line-height:25px;">${item.get('shopName')}</span></a>
							               </div>
							               <div style="float:left;width:100%;height:90px;background:#FBFCFF;">
							                   <table border="0" width="100%" height="90px"  style="table-layout:fixed;word-wrap:break-word;border-collapse:collapse;">
											        <tr style="text-align:center;">
											           <td width="35%">
											               <div style="float:left;margin-top:5px;width:100%;height:70px;">
											                   <span style="float:left;width:20%;height:100%;">
											                       <c:choose>
												                        <c:when test="${fn:contains(item.get('goodsImg'), ',')}">
												                            <img src="${fn:substringBefore(item.get('goodsImg'), ',')}" width="100%" height="100%"/>
												                        </c:when>
												                        <c:otherwise>
												                            <img src="${item.get('goodsImg')}" width="100%" height="100%"/>
												                        </c:otherwise>
											                       </c:choose> 
											                   </span>
											                   <span style="float:left;margin-left:3%;width:74%;height:50%;text-align:left;color:black;font-size:85%;overflow:hidden;"><a href="${pageContext.request.contextPath }/market/1/8?goodsId=${item.get('goodsId')}">${item.get("goodsTitle")}</a></span>
											               </div>
											           </td>        
											           <td width="25%">
											               <div style="float:left;margin-top:5px;width:100%;height:70px;">
						                                       <span style="float:right;width:90%;height:100%;font-size:85%;color:gray;">
						                                           <font style="float:left;"></font>
						                                           <font style="float:left;margin-left:10px;">${item.get("goodsStruct")}</font>
						                                       </span>
											               </div>
											           </td>
											           <td width="14%">
											               <div style="float:left;margin-top:5px;width:100%;height:70px;">
						                                       <span style="float:left;margin-left:5%;width:90%;height:100%;font-size:85%;">${item.get("goodsPrice")}</span>
											               </div>
											           </td>
											           <td width="13%">
											               <div style="float:left;margin-top:5px;width:100%;height:70px;">
						                                       <span style="float:left;margin-left:20%;width:60%;height:40%;background:white;">
						                                           <span style="width:70%;height:26px;background:white;line-height:25px;border-top:1px solid #B2D1FF;border-bottom:1px solid #B2D1FF;font-size:85%;">${item.get('theGoodsNum')}</span>
						                                       </span>
											               </div>
											           </td>
											           <td width="13%">
											               <div style="float:left;margin-top:5px;width:100%;height:70px;">
						                                       <span style="float:left;margin-left:5%;width:90%;height:100%;font-size:85%;color:red;font-weight:bold;"><fmt:formatNumber type="number" value="${item.get('theGoodsNum')*item.get('goodsPrice')}" pattern="0.00" maxFractionDigits="2"/></span>
											               </div>
											           </td>
											        </tr>
											   </table>
							               </div>  
					                  </div>
				                  </c:forEach>
				                  <div style="float:left;width:100%;height:30px;background:white;"></div>
				              </div>
		                  </c:otherwise>
		              </c:choose>
		              
		              <div class="center_3">
		                  <div style="float:right;width:96%;height:136px;border:2px solid red;">
		                      <span style="float:right;margin-right:15px;width:90%;height:50px;background:white;">
		                          <span style="float:right;color:red;font-size:150%;font-weight:bold;line-height:60px;">￥${sessionScope.allPrice}</span>
		                          <span style="float:right;margin-right:10px;font-size:85%;font-weight:bold;line-height:65px;">实付款:</span>
		                      </span>
		                      <span style="float:right;margin-right:15px;margin-top:10px;width:100%;height:20px;">
		                          <span id="showAddress" style="float:right;color:gray;font-size:95%;"></span>
		                          <span style="float:right;margin-right:20px;font-size:95%;font-weight:600;">配送至</span>
		                      </span>
		                      <span style="float:right;margin-right:15px;margin-top:10px;width:100%;height:20px;">
		                          <span id="showTel" style="float:right;color:gray;font-size:95%;"></span>
		                          <span id="showName" style="float:right;margin-right:10px;color:gray;font-size:95%;"></span>
		                          <span style="float:right;margin-right:20px;font-size:95%;font-weight:bold;">收货人:</span>
		                      </span>
		                  </div>
		                  <input type="hidden" name="userId" value="${user.getUserId()}"/>
		                  <input type="submit" style="float:right;width:20%;height:40px;background:red;color:white;text-align:center;line-height:35px;border:1px solid red;cursor:pointer;" value="提交订单"/>
		              </div>
		          </div>
	          </form>
	         <div class="bottom">
			    <span style="float:left;width:100%;margin-top:20px;height:20px;text-align:center;color:gray;font-size:80%;">Copyright 2018 - 2028 jim.com All Rights Reserved 京ICP证100557号 京公网安备112310102004579号 出版物经营许可证新出发京批字第直1141328号</span>
		        <span style="float:left;margin-left:25%;width:50%;background:pink;height:70px;"><img src="./images/life/bottom.jpg" width="100%" height="70px"/></span>
	         </div>
	      </div>
	  </center>
      
  </body>
</html>
