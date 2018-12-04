<%@ page language="java" import="java.util.*,com.school.domain.personbeans.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>搜索店铺</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/market/showAllShops.css">
    <script type="text/javascript">
        function checkSearch(){
            var searchText = document.getElementById('searchText').value.replace(/\s/g, "");
            if(searchText==''){
                return false;
            }else{
                return true;
            }
        }
        
         function enterCar(){
		document.getElementById("theCar").className="theCar1";
		}
		
		function leaveCar(){
			document.getElementById("theCar").className="theCar";
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
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/login?pageSource=a4" style="float:left;margin-left:10px;font-size:80%;line-height:28px;text-decoration:none;">请登录</a> 
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/regist?pageSource=a4" style="float:left;margin-left:20px;font-size:80%;line-height:28px;text-decoration:none;">[免费注册]</a>
                 </c:when>
                 <c:otherwise>
                     <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=a4">
                     <span style="float:left;margin-top:5px;margin-left:30px;width:20px;height:20px;border-radius:15px;cursor:pointer;"><img src="${sessionScope.user.getUserPhoto()}" title="${sessionScope.user.getUserName()}" style="border-radius:15px;width:100%;height:100%;"/></span>
                     <font style="float:left;margin-left:5px;font-size:80%;line-height:28px;text-decoration:none;">${sessionScope.user.getUserName()}</font>
                     </a>
                     <a class="a1" href="${pageContext.request.contextPath }/person/user/exit?pageSource=a4" style="float:left;margin-left:10px;font-size:80%;line-height:27px;text-decoration:none;">注销</a>
                 </c:otherwise>
             </c:choose>
             <span id="showBar" style="float:right;width:60px;height:30px;text-align:center;margin-right:150px;cursor:default;font-size:80%;line-height:28px;color:gray;" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='visible';this.style.color='red';this.style.background='white'" onmouseout="this.style.color='gray';">网站导航</span>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/6?pageSource=a4" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">卖家中心</a>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=a4" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">个人中心</a>
        </div>
        <div class="bg" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
          <div class="head">
              <div class="head_1"></div>
              <div class="head_2" onmouseover="hiddenClassifyDiv()">
                 <span class="logo"><img src="./images/First/tb1.jpg" width="100%" height="100%"/></span>
                 <div class="head_2_search">
                     <form action="${pageContext.request.contextPath }/market/1/9" method="get" onsubmit="return checkSearch();">
	                     <input name="searchText" id="searchText" style="float:left;width:80%;height:48px;border:1px solid red;" type="text" value=""/>
	                     <input style="float:left;width:20%;height:48px;background:red;color:white;border:none;cursor:pointer;" type="submit" value="搜索"/>
	                      <!-- <span style="float:left;width:90%;height:30px;">
			                 <font style="float:left;color:gray;font-size:90%;">热门搜索:</font>
			                 <a class="aa" href="#" style="float:left;margin-left:2%;text-decoration:none; font-size:90%;">二手书籍</a>
			                 <a class="aa" href="#" style="float:left;margin-left:2%;text-decoration:none; font-size:90%;">宠物转让</a>
			                 <a class="aa" href="#" style="float:left;margin-left:2%;text-decoration:none; font-size:90%;">韩国代购</a>
			                 <a class="aa" href="#" style="float:left;margin-left:2%;text-decoration:none; font-size:90%;">网络转让</a>
			                 <a class="aa" href="#" style="float:left;margin-left:2%;text-decoration:none; font-size:90%;">二手交易</a>
			              </span> -->
		              </form>
                 </div>
                 <div class="car" onmouseover="enterCar()" onmouseout="leaveCar()" onclick="javascript:location.href='${pageContext.request.contextPath }/person/1/3?pageSource=a4' ">
		            <div class="carRoad">
		                <div id="theCar" class="theCar" title="购物车"><img src="./images/First/car.jpg" width="100%" height="100%"/></div>
		            </div>
		         </div>
             </div>
          </div>
          <div class="center">
              <div class="center_2">
                  <div class="center_2_bar">
                      <span class="pageSelect">
                          <c:if test="${sessionScope.shopsResult.getTotalPages()>1}">
                              <a href="#" title="下一页"><span class="pageSelect_next" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&gt</span></a>
                              <a href="#" title="上一页"><span class="pageSelect_pre" onmouseover="this.style.background='gray'" onmouseout="this.style.background='white'">&lt</span></a>
                          </c:if>
                          <span class="pageSelect_text">
                              <c:choose>
                                  <c:when test="${sessionScope.shopsResult.getTotalPages()>1}">
                                      <span style="float:left;font-size:80%;line-height:25px;">共有<font style="color:red;">${sessionScope.shopsResult.getTotalRows()}</font>家店铺</span>
                                  </c:when>
                                  <c:otherwise>
                                      <span style="float:right;font-size:80%;line-height:25px;">共有<font style="color:red;">${sessionScope.shopsResult.getTotalRows()}</font>家店铺</span>
                                  </c:otherwise>
                              </c:choose>
                              
                              <c:if test="${sessionScope.shopsResult.getTotalPages()>1}">
                                  <span style="float:left;margin-left:10%;font-size:80%;line-height:25px;"><font style="color:red;">${sessionScope.shopsResult.getCurrentPage()}</font>/${sessionScope.shopsResult.getTotalPages()}</span>
                              </c:if>
                          </span>
                      </span>
                  </div>
                  <div class="center_2_shops">
                      <div style="float:left;width:100%;height:30px;"></div>
                      <c:choose>
                          <c:when test="${sessionScope.shopsResult.getResultList().size()>0}">
                              <c:forEach items="${sessionScope.shopsResult.getResultList()}" var="item" varStatus="idxStatus">
			                      <div style="float:left;width:100%;height:206px;background:white;border-top:2px solid #EEEEEE;border-bottom:2px solid #EEEEEE;">
			                          <div style="float:left;margin-top:20px;width:40%;height:166px;background:white;">
			                              <div style="float:left;width:100%;height:70%;background:white;">
			                                  <span style="float:left;width:68px;height:68px;background:white;border:1px solid #EEEEEE;"><a href="${pageContext.request.contextPath }/market/1/12?direct=1&shopId=${item.get('shopId')}"><img  src="${item.get('shopImg')}"  width="100%" height="100%"/></a></span>
			                                  <span style="float:left;margin-left:10px;width:380px;height:70px;background:white;">
			                                      <span style="float:left;max-width:200px;height:30px;color:blue;text-align:left;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"><a class="c" href="${pageContext.request.contextPath }/market/1/12?direct=1&shopId=${item.get('shopId')}" style="text-decoration:none;">${item.get('shopName')}</a></span>
			                                      <span style="float:left;margin-left:20px;height:30px;">
			                                          <span style="float:left;width:20px;height:20px;"><img  src="./images/comm/sale.jpg"  width="100%" height="100%"/></span>
			                                          <span style="float:left;margin-left:10px;width:20px;height:20px;"><img  src="./images/comm/new.jpg"  width="100%" height="100%"/></span>
			                                      </span>
			                                      <span style="float:left;width:100%;height:20px;font-size:75%;text-align:left;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
			                                          <span style="float:left;color:gray;height:100%;">卖家:</span>
			                                          <span style="float:left;margin-left:10px;height:100%;color:black;">${item.get('userName')}</span>
			                                          <span style="float:left;margin-left:10px;width:45%;height:100%;color:gray;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${item.get('shopAddress')}</span>
			                                      </span>
			                                       <span style="float:left;width:100%;height:20px;font-size:75%;text-align:left;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
			                                          <span style="float:left;color:gray;width:10%;height:100%;">简介:</span>
			                                          <span style="float:left;width:90%;height:100%;color:gray;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${item.get('shopDesc')}</span>
			                                      </span>
			                                  </span>
			                                  <span style="float:left;width:100%;height:45px;">
			                                      <span style="float:left;margin-top:15px;text-align:center;color:white;width:100px;height:15px;background:red;font-size:60%;">审 核 认 证 店 铺</span>
			                                  </span>
			                              </div>
			                              <div style="float:left;width:100%;height:30%;font-size:80%;">
			                                  <span style="float:left;width:100%;height:50%;text-align:left;">
				                                  <font style="float:left;color:gray;">共</font>
				                                  <font style="float:left;margin-left:5px;color:black;">${item.get('allGoodsNum')}</font>
				                                  <font style="float:left;margin-left:5px;color:gray;">件宝贝</font>
			                                  </span>
			                                  <span style="float:left;width:100%;height:50%;text-align:left;">
			                                      <font style="float:left;color:gray;">销量</font>
				                                  <font style="float:left;margin-left:5px;color:black;">${item.get('allGoodsSaleNum')}</font>
			                                  </span>
			                              </div>
			                          </div>
			                          <div style="float:left;margin-top:20px;margin-left:2%;width:58%;height:166px;background:white;">
			                              <c:choose>
			                                  <c:when test="${item.get('goodsPartInfoList').size()>0}">
			                                      <c:forEach items="${item.get('goodsPartInfoList')}" var="secondItem"  begin="0" end ="3">
						                              <a href="${pageContext.request.contextPath }/market/1/8?goodsId=${secondItem.get('goodsId')}"><span style="float:left;width:20%;margin-left:5%;height:85%;">
						                                  <c:choose>
										                       <c:when test="${fn:contains(secondItem.get('goodsImg'), ',')}">
										                           <span style="float:left;width:100%;height:85%;background:white;"><img  src="${fn:substringBefore(secondItem.get('goodsImg'), ',')}"  width="100%" height="100%"/></span>
										                       </c:when>
										                       <c:otherwise>
										                           <span style="float:left;width:100%;height:85%;background:white;"><img  src="${secondItem.get('goodsImg')}"  width="100%" height="100%"/></span>
										                       </c:otherwise>
										                   </c:choose> 
						                                  <span style="float:left;text-align:center;font-size:75%;color:red;width:100%;height:15%;background:black;opacity:0.5;">￥${secondItem.get('goodsPrice')}</span>
						                              </span></a>
					                              </c:forEach>
			                                  </c:when>
			                                  <c:otherwise>
			                                      <span style="float:left;margin-top:60px;margin-left:5%;width:95%;height:30px;color:red;"><img  src="./images/comm/face.jpg" style="float:left;width:30px;height:30px;"/><font style="float:left;margin-left:10px;line-height:30px;">该店铺暂时没有商品</font></span>
			                                  </c:otherwise>
			                              </c:choose>
			                          </div>
			                      </div>
		                      </c:forEach>
                          </c:when>
                          <c:otherwise>
                               <div style="float:left;width:100%;height:400px;background:white;">
                                 <div style="float:left;margin-left:30%;margin-top:100px;width:40%;height:150px;background:white;">
                                     <span style="float:left;width:30%;height:100%;background:white;"><img  src="./images/showAllGoods/pig.jpg"  width="100%" height="100%"/></span>
                                     <span style="float:left;margin-top:20px;text-align:left;font-size:120%;width:70%;height:100%;background:white;">亲，没有找到符合的店铺哦!</span>
                                 </div>
                               </div>
                          </c:otherwise>
                      </c:choose>
                  </div> 
              </div>
              <c:if test="${sessionScope.shopsResult.getTotalPages()>1}">
	              <div class="center_3">
	                  <div style="float:right;margin-top:10px;margin-right:20px;">
	                     <span style="float:left;line-height:30px;width:78px;height:32px;font-size:90%;font-weight:500;background:#EEEEEE;border:1px solid gray;cursor:pointer;">首页</span>
	                  <span style="float:left;margin-left:10px;line-height:30px;width:78px;height:32px;font-size:90%;font-weight:500;background:#EEEEEE;border:1px solid gray;cursor:pointer;"><font style="color:gray;">&lt</font>上一页</span>
	                  <span style="float:left;margin-left:10px;line-height:30px;width:78px;height:32px;font-size:90%;font-weight:500;background:#EEEEEE;border:1px solid gray;cursor:pointer;">下一页<font style="color:gray;">&gt</font></span>
	                  <span style="float:left;margin-left:10px;line-height:30px;width:78px;height:32px;font-size:90%;font-weight:500;background:#EEEEEE;border:1px solid gray;cursor:pointer;">尾页</span>
	                  
	                  <span style="float:left;margin-left:20px;line-height:30px;height:32px;font-size:90%;font-weight:500;background:white;">共<font style="font-weight:600;">1000</font>页</span>
	                  <span style="float:left;margin-left:20px;line-height:30px;height:32px;font-size:90%;font-weight:500;background:white;">
	                     <font style="float:left;">跳转到第</font> 
	                     <input type="text" maxlength="6" style="float:left;width:35px;height:32px;font-size:90%;border:1px solid gray;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)"/>
	                     <font style="float:left;">页</font> 
	                  </span>
	                  <span style="float:left;margin-left:10px;line-height:30px;width:48px;height:32px;font-size:90%;font-weight:500;background:#EEEEEE;border:1px solid gray;cursor:pointer;">确定</span>
	                 </div>
	              </div>  
              </c:if> 
          </div>
          <div class="bottom">
			    <span style="float:left;width:100%;margin-top:20px;height:20px;text-align:center;color:gray;font-size:80%;">Copyright 2018 - 2028 jim.com All Rights Reserved 京ICP证100557号 京公网安备112310102004579号 出版物经营许可证新出发京批字第直1141328号</span>
		        <span style="float:left;margin-left:25%;width:50%;background:pink;height:70px;"><img src="./images/life/bottom.jpg" width="100%" height="70px"/></span>
	      </div>
      </div>
    </center>
      
  </body>
</html>
