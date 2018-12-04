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
    
    <title>我的店铺</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<c:url value='/js/myShop.js'/>"></script>
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
    z-index:3;
    border-left:2px solid #EEEEEE;
    border-right:2px solid #EEEEEE;
    border-bottom:2px solid #EEEEEE;
}

.bg{
    width:1500px;
    background:white;
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
	background:white;
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
	width: 30%;
	height:40px;
}

.pageSelect_next{
	float:right;
	margin-right:10px;
	margin-top:10px;
	width: 10%;
	height:50%;
    background:white;
    tetx-align:center;
    line-height:17px;
    border:1px solid gray;
    cursor:pointer;
}

.pageSelect_pre{
	float:right;
	margin-top:10px;
	width: 10%;
	height:50%;
    background:white;
    border:1px solid gray;
    tetx-align:center;
    line-height:17px;
    cursor:pointer;
}

.pageSelect_text{
	float:right;
	margin-top:10px;
	margin-right:20px;
	height:50%;
}

.middle_right_order{
	float:left;
	margin-left:2%;
	width:96%;
	margin-top:30px;
	height:125px;
	background:#F0F0F0;
}

.middle_right_orderForlife{
    float:left;
	margin-left:2%;
	width:96%;
	margin-top:20px;
	height:140px;
	background:#F5F5F5;
}

.middle_right_select{
    float:left;
	width:100%;
	margin-top:20px;
	height:40px;
	background:#F0F0F0;
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
  </head>
   <%
      String shopFlag = UUID.randomUUID().toString();
      session.setAttribute("shopFlag", shopFlag);
   %>
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
          <span class="top_2">
              <span class="logo"><img src="./images/manageMyInfo/logo.jpg" width="100%" height="100%"/></span>
          </span>
      </div>
      <center>
      <div class="middle">
          <div class="middle_left">
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/1" style="float:left;text-align:left;text-decoration:none;font-size:85%;">基本信息</a></span>
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/2" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的订单</a></span>
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/3" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的购物车</a></span>
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/4" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的帖子</a></span>
              <span class="middle_left_btn"><a href="${pageContext.request.contextPath }/person/1/5" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的分享</a></span>
              <span class="middle_left_btn"><a href="javascript:void(0)" style="float:left;text-align:left;text-decoration:none;font-size:85%;">我的店铺</a></span>
          </div>
          <div class="middle_right">
              <c:if test="${target=='1'}">
              <!-- 进入店铺商品页面 -->
              <form action="${pageContext.request.contextPath }/market/1/6" method="post" onsubmit="return checkBoxSelect();">
                      <div class="middle_right_1">
		                  <font style="float:left;"> 我的店铺 </font>
		                  <a href="javascript:void(0)"><span class="middle_right_1_btn" style="color:#EB0205">店铺商品</span></a>
		                  <a href="${pageContext.request.contextPath }/market/1/2?target=2"><span class="middle_right_1_btn">商品发布</span></a>
		                  <a href="${pageContext.request.contextPath }/market/1/2?target=3"><span class="middle_right_1_btn">交易订单</span></a>
		                  <a href="${pageContext.request.contextPath }/market/1/2?target=4"><span class="middle_right_1_btn">营业信息</span></a>
		              </div>
		              <input id="NowPageGoodsNum" type="hidden"value="${sessionScope.goods.getResultList().size()}"/>
		              <c:choose>
		                  <c:when test="${sessionScope.goods.getTotalRows()>0}">
		           		       <div class="middle_right_select">
				                  <div class="middle_right_1_bar">
				                          <c:choose>
				                              <c:when test="${sessionScope.goods.getCurrentPage()==sessionScope.goods.getTotalPages()}">
				                                  <a href="javascript:void(0)" title="下一页"><span class="pageSelect_next" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&gt</span></a>
				                              </c:when>
				                              <c:otherwise>
				                                  <a href="${pageContext.request.contextPath }/market/1/2?target=1&currentPage=${sessionScope.goods.getCurrentPage()+1}" title="下一页"><span class="pageSelect_next" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&gt</span></a>
				                              </c:otherwise>
				                          </c:choose>
				                         
				                          <c:choose>
				                              <c:when test="${sessionScope.goods.getCurrentPage()==1}">
				                                  <a href="javascript:void(0)" title="上一页"><span class="pageSelect_pre" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&lt</span></a>
				                              </c:when>
				                              <c:otherwise>
				                                  <a href="${pageContext.request.contextPath }/market/1/2?target=1&currentPage=${sessionScope.goods.getCurrentPage()-1}" title="上一页"><span class="pageSelect_pre" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&lt</span></a>
				                              </c:otherwise>
				                          </c:choose>
				                          
				                          <span class="pageSelect_text">
				                              <span style="float:right;font-size:80%;line-height:25px;"><font style="color:red;">${sessionScope.goods.getCurrentPage()}</font>/${sessionScope.goods.getTotalPages()}</span>
				                              <span style="float:right;margin-right:20px;font-size:80%;line-height:25px;">共有<font style="color:red;">${sessionScope.goods.getTotalRows()}</font>件商品</span>
				                              
				                          </span>
				                  </div>
				               </div>
		           		       <div class="middle_right_bar">
					                 <table border="0" width="100%" height="40px"  style="table-layout:fixed;word-wrap:break-word;border-collapse:collapse;">
								        <tr style="text-align:center;font-weight:bold;">
								           <td width="40%" style="font-size:80%;">商品</td>        
								           <td width="12%" style="font-size:80%">价格</td>
								           <td width="12%" style="font-size:80%;">库存</td>
								           <td width="12%" style="font-size:80%;">销售量</td>
								           <td width="12%" style="font-size:80%;">访问量</td>
								           <td width="12%" style="font-size:80%;">操作</td>
								        </tr>
								    </table>
				              </div>
		           		       <c:forEach items="${sessionScope.goods.getResultList()}" var="item" varStatus="idxStatus">             
			                       <div class="middle_right_order">
				                       <table  width="100%" height="100px"  style="table-layout:fixed;word-wrap:break-word;border-collapse:collapse;">
									        <tr>
									           <td width="40%" style="font-size:80%;">
									               <span style="float:left;margin-left:2%;margin-top:22px;width:3%;height:80px;"><input name="goodsId" id="${idxStatus.index}" style="float:left;" type="checkbox" value="${item.get('goodsId')}"/></span>
									               <span style="float:left;margin-left:5%;margin-top:22px;width:25%;height:80px;">
									                   <c:choose>
									                       <c:when test="${fn:contains(item.get('goodsImg'), ',')}">
									                           <img src="${fn:substringBefore(item.get('goodsImg'), ',')}" width="100%" height="100%"/>
									                       </c:when>
									                       <c:otherwise>
									                           <img src="${item.get('goodsImg')}" width="100%" height="100%"/>
									                       </c:otherwise>
									                   </c:choose> 
									               </span>
									               <span style="float:left;margin-left:5%;margin-top:22px;width:60%;height:40px;">
									                   <span style="float:left;width:100%;height:35px;overflow:hidden;"><a id="aa" href="${pageContext.request.contextPath }/market/1/8?goodsId=${item.get('goodsId')}" style="text-decoration:underline;font-size:100%;font-weight:600;">${item.get("goodsTitle")}</a></span>
									               </span>
									               <span style="float:left;margin-left:5%;font-size:85%;margin-top:1px;width:60%;height:15px;color:gray;overflow:hidden;">类别:    ${item.get("classifyOneName")}  ${item.get("classifyTwoName")}</span>
									               <span style="float:left;margin-left:5%;font-size:85%;margin-top:10px;width:60%;height:15px;color:gray;overflow:hidden;">规格: ${item.get("goodsStruct")}</span>
									           </td>          
									           <td width="12%" style="font-size:80%;text-align:center;"><span style="float:left;width:100%;height:30px;color:red;">￥${item.get("goodsPrice")}</span></td>
									           <td width="12%" style="font-size:80%;text-align:center;"><span style="float:left;width:100%;height:30px;">${item.get("goodsNum")}</span></td>
									           <td width="12%" style="font-size:80%;text-align:center;"><span style="float:left;width:100%;height:30px;color:black;">${item.get("goodsSaleNum")}</span></td>
									           <td width="12%" style="font-size:80%;text-align:center;"><span style="float:left;width:100%;height:30px;">${item.get("visitNum")}</span></td>
									           <td width="12%" style="font-size:80%;text-align:center;"><span style="float:left;width:100%;height:30px;"><a id="updateNum" href="${pageContext.request.contextPath }/market/1/4?goodsId=${item.get('goodsId')}" style="font-weight:bold;">编辑</a></span></td>
									        </tr>
									    </table>
					                 </div>
			                  </c:forEach>
			                  <div class="selectAll">
				                  <span style="float:left;margin-left:1%;margin-top:5px;width:10%;height:80px;">
					                  <input style="float:left;" type="checkbox" onclick="changeAllCheckBox(this)"/>
					                  <span style="float:left;font-size:80%;">当页全选</span>
				                  </span>
				                  <input type="submit" value="删除所选" style="float:right;margin-top:5px;cursor:pointer;font-size:80%;"/>
				              </div>
				              <div class="dividePege"></div>
		                  </c:when>
		                  <c:otherwise>
		                      <div style="float:left;margin-top:150px;width:100%;height:30px;background:white;">
		                          <font style="float:left;margin-left:200px;font-size:130%;color:red;">您的店铺当前没有商品，快去添加吧！</font>
		                          <a href="${pageContext.request.contextPath }/market/1/2?target=2" style="float:left;line-height:35px;margin-left:10px;">去添加商品>></a>
		                      </div>
		                  </c:otherwise>
		              </c:choose>
		         </form>        
              </c:if>
              
              <c:if test="${target=='2'}">
              <!-- 进入商品上传页面 -->
                  <c:if test="${result=='1'}">
                      <script type="text/javascript">
                          alert("上传成功");
                      </script>
                  </c:if>
                  <div class="middle_right_1">
                      <font style="float:left;"> 我的店铺 </font>
	                  <a href="${pageContext.request.contextPath }/market/1/2?target=1"><span class="middle_right_1_btn">店铺商品</span></a>
	                  <a href="javascript:void(0)"><span class="middle_right_1_btn" style="color:#EB0205">商品发布</span></a>
	                  <a href="${pageContext.request.contextPath }/market/1/2?target=3"><span class="middle_right_1_btn">交易订单</span></a>
	                  <a href="${pageContext.request.contextPath }/market/1/2?target=4"><span class="middle_right_1_btn">营业信息</span></a> 
		          </div>
		          <form action="${pageContext.request.contextPath }/market/1/3" method="post" enctype="multipart/form-data"  onsubmit="return checkSubmit();">
		              <div style="float:left;width:100%;height:550px;background:white;">
			              <div style="float:left;width:40%;height:100%;background:white;">
			                  <div style="float:left;width:100%;height:50%;background:white;">
			                      <div style="float:left;width:100%;height:100%;background:white;">
	                                  <div style="position:relative;width:100%;height:15%;background:blue;">
	                                      <button style="position:absolute;left:0px;top:0px;z-index:1;width:100%;text-align:center;font-size:90%;height:100%;cursor:pointer;color:white;background:red">点击上传图片</button>
	                                      <label style="position:absolute;left:0px;top:0px;z-index:2;width:100%;height:100%;background:red;opacity:0;cursor:pointer;"><input id="file" name="img" type="file"  multiple="multiple" accept="image/*"  style="cursor:pointer;" onchange="readAsDataURL()"/></label>
	                                  </div>
	                                  <div style="position:relative;width:100%;height:15%;background:white;text-align:center;font-size:85%;color:gray;">默认第一张为商品封面</div>
	                                  <div id="result" style="position:relative;width:100%;height:70%;background:#EEEEEE;"></div>
	                              </div>
			                  </div>
			                  <div style="float:left;width:100%;height:50%;background:white;"></div>
				           </div>
			               <div style="float:left;margin-left:2%;width:58%;height:100%;background:white;">
			                  <table border="0"  width="100%" height="550px" style="border-collapse:collapse;">
			                      <tr style="height:30px;font-weight:bold;">
			                          <td colspan="2">商品信息</td>
			                      </tr>
			                      <tr style="height:50px;">
			                          <td><br/><span style="float:left;color:red;font-size:140%;">*</span>标题</td>
			                          <td>
			                              <span id="tips1" style="float:left;width:100%;background:white;color:white;font-size:85%;">请输入商品的销售标题</span>
			                              <input name="goodsTitle" id="goodsTitle" type="text" style="float:left;width:100%;height:60%;" maxlength="100" onclick="javascript:document.getElementById('tips1').style.color='white';"/>
			                          </td>
			                      </tr>
			                     <tr style="height:50px;">
			                          <td><br/><span style="float:left;color:red;font-size:140%;">*</span>名称</td>
			                          <td>
			                              <span id="tips2" style="float:left;width:100%;background:white;color:white;font-size:85%;">请输入商品的名称</span>
			                              <input name="goodsName" id="goodsName" type="text" style="float:left;width:150px;height:60%;" maxlength="20" onclick="javascript:document.getElementById('tips2').style.color='white';"/>
			                          </td>
			                      </tr>
			                      <tr style="height:50px;">
			                          <td><br/><span style="float:left;color:red;font-size:140%;">*</span>单价</td>
			                          <td>
			                              <span id="tips3" style="float:left;width:100%;background:white;color:white;font-size:85%;">请输入商品的价格</span>
			                              <input name="goodsPrice" id="goodsPrice" type="text" style="float:left;width:100px;height:60%;" maxlength="6" onkeyup="this.value=this.value.replace(/[^\d.]/g,'')" onclick="javascript:document.getElementById('tips3').style.color='white';"/>
			                              <span style="float:left;line-height:30px;margin-left:10px;color:gray;font-size:85%;">(元)</span>
			                          </td>
			                      </tr>
			                      <tr style="height:50px;">
			                          <td><br/><span style="float:left;color:red;font-size:140%;">*</span>库存</td>
			                          <td>
			                              <span id="tips4" style="float:left;width:100%;background:white;color:white;font-size:85%;">请输入商品的库存</span>
			                              <input name="goodsNum" id="goodsNum" type="text" style="float:left;width:100px;height:60%;" maxlength="6" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onclick="javascript:document.getElementById('tips4').style.color='white';"/>
			                              <span style="float:left;line-height:30px;margin-left:10px;color:gray;font-size:85%;">(件)</span>
			                          </td>
			                      </tr>
			                      <tr style="height:50px;">
			                          <td><br/><span style="float:left;color:red;font-size:140%;">*</span>规格</td>
			                          <td>
			                              <span id="tips6" style="float:left;width:100%;background:white;color:white;font-size:85%;">请输入商品的规格</span> 
			                              <input name="goodsStruct" id="goodsStruct" type="text" style="float:left;width:300px;height:60%;" maxlength="30" onclick="javascript:document.getElementById('tips6').style.color='white';"/>
			                          </td>
			                      </tr>
			                       <tr style="height:50px;">
			                          <td><span style="float:left;color:red;font-size:140%;">*</span>分类</td>
			                          <td>
			                              <select name="classifyOne"  id="classify1" style="float:left;" onchange="changeClassify(this)" onclick="javascript:document.getElementById('tips5').style.color='white';">
			                                  <option value="-1">-请选择类别-</option>
			                                  <option value="1">生活家居</option>
			                                  <option value="2">数码家电</option>
			                                  <option value="3">服饰配件</option>
			                                  <option value="4">食品水果</option>
			                                  <option value="5">学习办公</option>
			                                  <option value="0">其他</option>
			                              </select>
			                              <select name="classifyTwo"  id="classify2" style="float:left;margin-left:10px;" onclick="javascript:document.getElementById('tips5').style.color='white';">
			                                  <option value="-1">-请选择类别-</option>
			                              </select>
			                              <span id="tips5" style="float:left;margin-left:10px;color:white;font-size:85%;">请选择商品类别</span>
			                          </td>
			                      </tr>
			                      <tr style="height:120px;">
			                          <td>
			                              <span style="float:left;color:black;"><span style="float:left;color:gray;font-size:140%;">*</span>描述</span>
			                          </td>
			                          <td>
			                              <span style="float:left;">
			                                  <textarea name="goodsDetail"  rows="4" cols="55" style="float:left;resize:none;border:2px solid #DDDDDD" ></textarea>
	                                      </span>
			                          </td>
			                          
			                      </tr>
			                      <tr style="height:50px;">
			                          <td colspan="2">
			                              <input type="hidden" name="shopFlag" value="<%=shopFlag%>"/>
                                          <input type="hidden" name="shopId" value="${sessionScope.shopInfo.getShopId()}"/>
			                              <input type="submit" value="上传" style="float:left;margin-left:40%;width:100px;height:30px;cursor:pointer;color:white;background:red;border-radius:10px;" >
			                          </td>
			                      </tr>
			                  </table>
			              </div>
			          </div> 
		          </form> 
              </c:if>
              
              <c:if test="${target=='3'}">
              <!-- 进入交易订单页面 -->
		          <form action="${pageContext.request.contextPath }/market/1/6" method="post" onsubmit="return checkBoxSelect();">
                      <div class="middle_right_1">
	                      <font style="float:left;"> 我的店铺 </font>
		                  <a href="${pageContext.request.contextPath }/market/1/2?target=1"><span class="middle_right_1_btn">店铺商品</span></a>
		                  <a href="${pageContext.request.contextPath }/market/1/2?target=2"><span class="middle_right_1_btn">商品发布</span></a>
		                  <a href="javascript:void(0)"><span class="middle_right_1_btn" style="color:#EB0205">交易订单</span></a>
		                  <a href="${pageContext.request.contextPath }/market/1/2?target=4"><span class="middle_right_1_btn" >营业信息</span></a> 
		              </div> 
		              <input id="NowPageGoodsNum" type="hidden"value="${sessionScope.goodsOrder.getResultList().size()}"/>
		              <c:choose>
		                  <c:when test="${sessionScope.goodsOrder.getTotalRows()>0}">
		           		       <div class="middle_right_select">
				                  <div class="middle_right_1_bar">
				                          <c:choose>
				                              <c:when test="${sessionScope.goodsOrder.getCurrentPage()==sessionScope.goodsOrder.getTotalPages()}">
				                                  <a href="javascript:void(0)" title="下一页"><span class="pageSelect_next" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&gt</span></a>
				                              </c:when>
				                              <c:otherwise>
				                                  <a href="${pageContext.request.contextPath }/market/1/2?target=1&currentPage=${sessionScope.goodsOrder.getCurrentPage()+1}" title="下一页"><span class="pageSelect_next" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&gt</span></a>
				                              </c:otherwise>
				                          </c:choose>
				                         
				                          <c:choose>
				                              <c:when test="${sessionScope.goodsOrder.getCurrentPage()==1}">
				                                  <a href="javascript:void(0)" title="上一页"><span class="pageSelect_pre" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&lt</span></a>
				                              </c:when>
				                              <c:otherwise>
				                                  <a href="${pageContext.request.contextPath }/market/1/2?target=1&currentPage=${sessionScope.goodsOrder.getCurrentPage()-1}" title="上一页"><span class="pageSelect_pre" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&lt</span></a>
				                              </c:otherwise>
				                          </c:choose>
				                          
				                          <span class="pageSelect_text">
				                              <span style="float:right;font-size:80%;line-height:25px;"><font style="color:red;">${sessionScope.goodsOrder.getCurrentPage()}</font>/${sessionScope.goods.getTotalPages()}</span>
				                              <span style="float:right;margin-right:20px;font-size:80%;line-height:25px;">共有<font style="color:red;">${sessionScope.goodsOrder.getTotalRows()}</font>件商品</span>
				                              
				                          </span>
				                  </div>
				               </div>
		           		       <div class="middle_right_bar">
					                 <table border="0" width="100%" height="40px"  style="table-layout:fixed;word-wrap:break-word;border-collapse:collapse;">
								        <tr style="text-align:center;font-weight:bold;">
								           <td width="40%" style="font-size:80%;">商品</td>        
								           <td width="10%" style="font-size:80%">价格</td>
								           <td width="10%" style="font-size:80%;">数量</td>
								           <td width="10%" style="font-size:80%;">实付款</td>
								           <td width="20%" style="font-size:80%;">时间</td>
								           <td width="10%" style="font-size:80%;">交易状态</td>
								        </tr>
								    </table>
				              </div>
		           		       <c:forEach items="${sessionScope.goodsOrder.getResultList()}" var="item" varStatus="idxStatus">             
			                       <div class="middle_right_order">
				                       <table border="0" width="100%" height="100px"  style="table-layout:fixed;word-wrap:break-word;border-collapse:collapse;">
									        <tr>
									           <td width="40%" style="font-size:80%;">
									               <span style="float:left;margin-left:2%;margin-top:22px;width:3%;height:80px;"><%-- <input name="goodsId" id="${idxStatus.index}" style="float:left;" type="checkbox" value="${item.get('goodsId')}"/> --%></span>
									               <span style="float:left;margin-left:5%;margin-top:22px;width:25%;height:80px;background:red;">
									                   <c:choose>
									                       <c:when test="${fn:contains(item.get('goodsImg'), ',')}">
									                           <img src="${fn:substringBefore(item.get('goodsImg'), ',')}" width="100%" height="100%"/>
									                       </c:when>
									                       <c:otherwise>
									                           <img src="${item.get('goodsImg')}" width="100%" height="100%"/>
									                       </c:otherwise>
									                   </c:choose>
									               </span>
									               <span style="float:left;margin-left:5%;margin-top:22px;width:60%;height:40px;">
									                   <span style="float:left;width:100%;height:35px;overflow:hidden;"><a id="aa" href="${pageContext.request.contextPath }/market/1/8?goodsId=${item.get('goodsId')}" style="text-decoration:underline;font-size:100%;font-weight:600;">${item.get("goodsTitle")}</a></span>
									               </span>
									               <span style="float:left;margin-left:5%;font-size:85%;margin-top:2px;width:60%;height:15px;color:gray;overflow:hidden;">规格: ${item.get("goodsStruct")}</span>
									               <span style="float:left;margin-left:5%;font-size:85%;margin-top:3px;width:60%;height:15px;color:gray;overflow:hidden;">买家: ${item.get("userName")}</span>
									               
									           </td>          
									           <td width="10%" style="font-size:80%;text-align:center;"><span style="float:left;width:100%;height:30px;color:red;">￥${item.get("price")}</span></td>
									           <td width="10%" style="font-size:80%;text-align:center;"><span style="float:left;width:100%;height:30px;">${item.get("theGoodsNum")}</span></td>
									           <td width="10%" style="font-size:80%;text-align:center;"><span style="float:left;width:100%;height:30px;color:black;">￥${item.get("orderMoney")}</span></td>
									           <td width="20%" style="font-size:80%;text-align:center;"><span style="float:left;width:100%;height:30px;"><fmt:formatDate value="${item.get('operateTime')}" pattern="yyyy-MM-dd HH:mm:ss"/></span></td>
									           <td width="10%" style="font-size:80%;text-align:center;">
									           <span style="float:left;width:100%;height:30px;">
									               <c:if test="${item.get('orderState')=='0'}">交易中</c:if>
									               <c:if test="${item.get('orderState')=='-1'}">交易失败</c:if>
									               <c:if test="${item.get('orderState')=='1'}">交易成功</c:if>
									           </span>
									           </td>
									        </tr>
									    </table>
					                 </div>
			                  </c:forEach>
			                  <!-- <div class="selectAll">
				                  <span style="float:left;margin-left:1%;margin-top:5px;width:10%;height:80px;">
					                  <input style="float:left;" type="checkbox" onclick="changeAllCheckBox(this)"/>
					                  <span style="float:left;font-size:80%;">当页全选</span>
				                  </span>
				                  <input type="submit" value="删除所选" style="float:right;margin-top:5px;cursor:pointer;font-size:80%;"/>
				              </div> -->
				              <div class="dividePege"></div>
		                  </c:when>
		                  <c:otherwise>
		                      <div style="float:left;margin-top:150px;width:100%;height:30px;background:white;">
		                          <font style="float:left;margin-left:200px;font-size:130%;color:red;">您的店铺当前没有订单，继续加油！</font>
		                      </div>
		                  </c:otherwise>
		              </c:choose>
		         </form>   
              </c:if>
              
              <c:if test="${target=='4'}">
              <!--进入营业信息页面 -->
                  <c:if test="${result=='1'}">
                      <script type="text/javascript">
                          alert("修改成功");
                      </script>
                  </c:if>
                  <div class="middle_right_1">
                      <font style="float:left;"> 我的店铺 </font>
	                  <a href="${pageContext.request.contextPath }/market/1/2?target=1"><span class="middle_right_1_btn">店铺商品</span></a>
	                  <a href="${pageContext.request.contextPath }/market/1/2?target=2"><span class="middle_right_1_btn">商品发布</span></a>
	                  <a href="${pageContext.request.contextPath }/market/1/2?target=3"><span class="middle_right_1_btn">交易订单</span></a>
	                  <a href="javascript:void(0)"><span class="middle_right_1_btn" style="color:#EB0205">营业信息</span></a> 
		          </div>
		          <form action="${pageContext.request.contextPath }/market/1/7" method="post" enctype="multipart/form-data" onsubmit="return checkSubmitUpdateShopInfo();">
		          <input id="isUpdateFlag" type="hidden" value="false"/>
		          <div style="float:left;width:100%;height:900px;">
		              <div style="position:relative;left:0px;top:0px;width:100%;height:900px;background:white;">
			              <div style="position:absolute;z-index:2;top:0px;left:0px;width:70%;height:70px;background:white;">
			                  <div style="float:left;margin-left:60px;width:50px;height:70px;background:white;">
			                      <span id="result" style="float:left;width:50px;height:50px;border-radius:30px;">
			                          <a href="${sessionScope.shopInfo.getShopImg()}"><img src="${sessionScope.shopInfo.getShopImg()}" style="width:100%;height:100%;border-radius:30px;"/></a>
			                      </span>
			                      <input name="shopImg" id="shopImg" type="hidden" value="${sessionScope.shopInfo.getShopImg()}"/>
			                      <div style="position:relative;top:50px;left:0px;width:50px;height:20px;background:white;">
			                          <div style="position:relative;width:100%;height:100%;background:white;">
	                                      <button style="position:absolute;left:0px;top:0px;z-index:1;width:100%;text-align:center;font-size:80%;height:100%;cursor:pointer;color:white;background:black">更换</button>
	                                      <label style="position:absolute;left:0px;top:0px;z-index:2;width:100%;height:100%;background:red;opacity:0;cursor:pointer;"><input id="file" name="img" type="file"  accept="image/*"  style="cursor:pointer;" onchange="showShopImg()"/></label>
	                                  </div>
			                      </div>
			                  </div>
			                  <div style="float:left;margin-left:50px;width:450px;height:70px;background:#F0F0F0;border-radius:35px;"><h3>${sessionScope.shopInfo.getShopName()}</h3></div>
			              </div>
			              <div style="position:absolute;z-index:1;top:50px;left:28px;width:100%;height:230px;background:white;">
			                  <img src="./images/market/myShop/hand.jpg" style="float:right;" width="100%" height="100%"/>
			              </div>
			              <div style="position:absolute;z-index:2;top:90px;left:13%;width:60%;height:500px;background:white;">
			                  <table border="0"  width="100%" height="800px" style="border-collapse:collapse;font-size:85%;">
			                      <tr style="height:30px;">
			                          <td>
			                              <font style="float:left;font-weight:bold;">店主信息</font>                                                                                        
			                          </td>
			                      </tr>
			                      <tr style="height:40px;">
			                          <td>
			                              <font style="float:left;">姓名</font>                                               
			                              <font style="float:left;margin-left:50px;color:gray;">${sessionScope.shopInfo.getShopUserName()}</font>                                            
			                          </td>
			                      </tr>
			                      <tr style="height:40px;">
			                          <td>
			                              <font style="float:left;">账号</font>                                               
			                              <font style="float:left;margin-left:50px;color:gray;">${sessionScope.shopInfo.getShopUserId()}</font>                                            
			                          </td>
			                      </tr>
			                       <tr style="height:40px;">
			                          <td>
			                              <font style="float:left;">电话</font>                                               
			                              <input name="shopTel" id="tel" type="text" style="float:left;margin-left:50px;color:gray;border:1px solid white;"readonly="readonly" value="${sessionScope.shopInfo.getShopTel()}"/>  
			                              <button id="true1" type="button" style="float:left;font-size:80%;width:45px;height:20px;display:none;" onclick="changeInputTelStyle(this)">确认</button>
			                              <button id="false1" type="button" style="float:left;font-size:80%;width:45px;height:20px;display:none;" onclick="changeInputTelStyle(this)">取消</button>
			                              <span id="1" style="float:left;margin-left:10px;width:20px;height:20px;cursor:pointer;" onclick="changeInputTelStyle(this)"><img src="./images/comm/xg.jpg" width="100%" height="100%"/></span>                                        
			                              <input id="value1" type="hidden" value="${sessionScope.shopInfo.getShopTel()}"/>
			                          </td>
			                      </tr>
			                      <tr style="height:30px;">
			                          <td>
			                              <font style="float:left;font-weight:bold;">店铺信息</font>                                                                                        
			                          </td>
			                      </tr>
			                      <tr style="height:40px;">
			                          <td>
			                              <font style="float:left;">店铺名称</font>                                               
			                              <input name="shopName" id="shopName" type="text" style="float:left;margin-left:20px;width:200px;color:gray;border:1px solid white;"readonly="readonly" value="${sessionScope.shopInfo.getShopName()}"/>  
			                              <button id="true3" type="button" style="float:left;font-size:80%;width:45px;height:20px;display:none;" onclick="changeInputShopNameStyle(this)">确认</button>
			                              <button id="false3" type="button" style="float:left;font-size:80%;width:45px;height:20px;display:none;" onclick="changeInputShopNameStyle(this)">取消</button>
			                              <span id="3" style="float:left;margin-left:10px;width:20px;height:20px;cursor:pointer;" onclick="changeInputShopNameStyle(this)"><img src="./images/comm/xg.jpg" width="100%" height="100%"/></span>                                        
			                              <input id="value3" type="hidden" value="${sessionScope.shopInfo.getShopName()}"/>
			                          </td>
			                      </tr>
			                      <tr style="height:40px;">
			                          <td>
			                              <font style="float:left;">账号</font>                                               
			                              <font style="float:left;margin-left:50px;color:gray;">${sessionScope.shopInfo.getShopId()}</font>                                            
			                          </td>
			                      </tr>
			                      <tr style="height:40px;">
			                          <td>
			                              <font style="float:left;">注册时间</font>                                               
			                              <font style="float:left;margin-left:20px;color:gray;"><fmt:formatDate value="${sessionScope.shopInfo.getShopCreateTime()}" pattern="yyyy-MM-dd HH:mm:ss"/></font>                                            
			                          </td>
			                      </tr>
			                      <tr style="height:40px;">
			                          <td>
			                              <font style="float:left;">隶属院系</font>                                               
			                              <font style="float:left;margin-left:20px;color:gray;">${sessionScope.shopInfo.getAcademyName()}</font>                                            
			                          </td>
			                      </tr>
			                      <tr style="height:40px;">
			                          <td>
			                              <font style="float:left;">地址</font>                                               
			                              <input name="shopAdress" id="address" type="text" style="float:left;margin-left:50px;width:200px;color:gray;border:1px solid white;"readonly="readonly" value="${sessionScope.shopInfo.getShopAdress()}"/>  
			                              <button id="true2" type="button" style="float:left;font-size:80%;width:45px;height:20px;display:none;" onclick="changeInputAddressStyle(this)">确认</button>
			                              <button id="false2" type="button" style="float:left;font-size:80%;width:45px;height:20px;display:none;" onclick="changeInputAddressStyle(this)">取消</button>
			                              <span id="2" style="float:left;margin-left:10px;width:20px;height:20px;cursor:pointer;" onclick="changeInputAddressStyle(this)"><img src="./images/comm/xg.jpg" width="100%" height="100%"/></span>                                        
			                              <input id="value2" type="hidden" value="${sessionScope.shopInfo.getShopAdress()}"/>
			                          </td>
			                      </tr>
			                      <tr style="height:120px;">
			                          <td>
			                              <font style="float:left;">店铺简介</font>                                               
			                              <span style="float:left;margin-left:20px;">
			                                  <textarea  name="shopDesc" id="introduce" rows="4" cols="45" style="float:left;resize:none;border:2px solid #DDDDDD" readonly="readonly">${sessionScope.shopInfo.getShopDesc()}</textarea>
	                                      </span>   
	                                      <button id="true4" type="button" style="float:left;font-size:80%;width:45px;height:20px;display:none;" onclick="changeInputIntroduceStyle(this)">确认</button>
			                              <button id="false4" type="button" style="float:left;font-size:80%;width:45px;height:20px;display:none;" onclick="changeInputIntroduceStyle(this)">取消</button>
			                              <span id="4" style="float:left;margin-left:10px;width:20px;height:20px;cursor:pointer;" onclick="changeInputIntroduceStyle(this)"><img src="./images/comm/xg.jpg" width="100%" height="100%"/></span>                                                       
			                              <input id="value4" type="hidden" value="${sessionScope.shopInfo.getShopDesc()}"/>
			                          </td>
			                      </tr>
			                      <tr style="height:120px;">
			                          <td>
			                              <font style="float:left;">店铺公告</font>                                               
			                              <span style="float:left;margin-left:20px;">
			                                  <textarea name="shopReform" id="reform" rows="4" cols="45" style="float:left;resize:none;border:2px solid #DDDDDD" readonly="readonly">${sessionScope.shopInfo.getShopReform()}</textarea>
	                                      </span>   
	                                      <button id="true5" type="button" style="float:left;font-size:80%;width:45px;height:20px;display:none;" onclick="changeInputReformStyle(this)">确认</button>
			                              <button id="false5" type="button" style="float:left;font-size:80%;width:45px;height:20px;display:none;" onclick="changeInputReformStyle(this)">取消</button>
			                              <span id="5" style="float:left;margin-left:10px;width:20px;height:20px;cursor:pointer;" onclick="changeInputReformStyle(this)"><img src="./images/comm/xg.jpg" width="100%" height="100%"/></span>                                                      
			                              <input id="value5" type="hidden" value="${sessionScope.shopInfo.getShopReform()}"/>
			                          </td>
			                      </tr>
			                      <tr style="height:30px;">
			                          <td>
			                              <font style="float:left;font-weight:bold;">店铺状态</font>                                                                                        
			                          </td>
			                      </tr>
			                       <tr style="height:70px;">
			                          <td>
			                              <font style="float:left;">营业状态</font>
			                              <input name="shopState" id="shopState" type="hidden" value="${sessionScope.shopInfo.getShopState()}"/>
			                              <c:choose>
			                                  <c:when test="${sessionScope.shopInfo.getShopState()=='1'}">
			                                      <!-- 正在营业 -->
			                                      <span style="float:left;margin-left:20px;width:40px;height:40px;"><img src="./images/comm/yingye.jpg" width="100%" height="100%"/></span>
			                                      <button type="button" style="float:left;margin-left:30px;margin-top:20px;font-size:80%;width:45px;height:20px;" onclick="closeShop()">打烊</button>
			                                      <font id="showTips" style="float:left;margin-left:30px;margin-top:20px;color:white;font-size:90%;">提交后店铺暂停营业</font>
			                                  </c:when>
			                                  <c:otherwise>
			                                      <!-- 未营业 -->
			                                      <span style="float:left;margin-left:20px;width:50px;height:30px;"><img src="./images/comm/close.jpg" width="100%" height="100%"/></span>  
			                                      <button type="button" style="float:left;margin-left:30px;margin-top:10px;font-size:80%;width:45px;height:20px;" onclick="openShop()">营业</button>
			                                      <font id="showTips" style="float:left;margin-left:30px;margin-top:10px;color:white;font-size:90%;">提交后店铺开始营业</font>
			                                  </c:otherwise>
			                              </c:choose>                                               
			                                                                        
			                          </td>
			                      </tr>
			                       <tr style="height:40px;">
			                          <td>
			                              <font style="float:left;">授权状态</font>          
			                              <c:choose>
			                                  <c:when test="${sessionScope.shopInfo.getShopStatus()=='1'}">
			                                      <font style="float:left;margin-left:20px;color:gray;">已审核通过</font>
			                                  </c:when>
			                                  <c:otherwise>
				                                  <font style="float:left;margin-left:20px;color:gray;">调整调查中</font>
				                              </c:otherwise>              
			                              </c:choose>                                
			                          </td>
			                      </tr>
			                      <tr >
			                          <td colspan="2">
			                              <input type="submit" value="提交" style="float:left;margin-left:50%;width:20%;cursor:pointer;"/>
			                          </td>
			                      </tr>
			                  </table>
			              </div>
			          </div>
		          </div>
		        </form>
              </c:if>
          </div>
      </div>
      </center>
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
    </div>
   </center>
  </body>
</html>
