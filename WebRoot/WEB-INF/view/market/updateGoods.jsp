<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改商品信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<c:url value='/js/updateGoods.js'/>"></script>
    <style type="text/css">
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
            width:1200px;
            height:580px;
            background:white;
        }
        .bottom{
			float:left;
			margin-left:10%;
			width:80%;
			height:100px;
			background:#F5F5F5;
		}
    </style>
  </head>
  <%
      String updateGoodsFlag = UUID.randomUUID().toString();
      session.setAttribute("updateGoodsFlag", updateGoodsFlag);
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
		        <div class="center">
		           <form action="${pageContext.request.contextPath }/market/1/5" method="post" enctype="multipart/form-data"  onsubmit="return checkSubmit();">
		              <div style="float:left;width:100%;height:580px;background:white;">
			              <div style="float:left;width:40%;height:100%;background:white;">
			                  <div style="float:left;width:100%;height:50%;background:white;">
			                     <div style="float:left;width:100%;height:100%;background:white;">
	                                  <div style="position:relative;width:100%;height:15%;background:blue;">
	                                      <button style="position:absolute;left:0px;z-index:1;width:100%;text-align:center;font-size:90%;height:100%;cursor:pointer;color:white;background:red">点击上传图片</button>
	                                      <label style="position:absolute;left:0px;z-index:2;width:100%;height:100%;background:red;opacity:0;cursor:pointer;"><input id="file" name="img" type="file"  multiple="multiple" accept="image/*"  style="cursor:pointer;" onchange="readAsDataURL()"/></label>
	                                  </div>
	                                  <div style="position:relative;width:100%;height:15%;background:white;text-align:center;font-size:85%;color:gray;">默认第一张为商品封面</div>
	                                  <div id="result" style="position:relative;width:80%;height:70%;background:#EEEEEE;">
	                                      <c:forEach items="${imgs}" var="item" varStatus="idxStatus">
	                                          <div style="float:left;margin-top:10px;margin-left:35px;width:78px;height:68px;background:gray;border:1px solid gray;">
		                                          <div style="position:relative;width:78px;height:68px;background:white;">
		                                              <span style="position:absolute;right:0px;top:0px;width:15px;height:15px;line-height:10px;text-align:center;background:black;opacity:0.5;cursor:pointer;color:white;">x</span>
		                                              <a href="${item}"><img src="${item}" width="100%" height="100%"/></a>
		                                          </div>
	                                          </div>
	                                      </c:forEach>
	                                      
	                                  </div>
	                              </div>
			                  </div>
			                  <div style="float:left;width:100%;height:50%;background:white;">
			                      <input id="goodsImg" name="goodsImg" type="hidden" value="${sessionScope.theGoods.getGoodsImg()}"/>
			                  </div>
				           </div>
			               <div style="float:left;margin-left:2%;width:58%;height:100%;background:white;">
			                  <table border="0"  width="100%" height="550px" style="border-collapse:collapse;">
			                      <tr style="height:30px;font-weight:bold;">
			                          <td colspan="2">
			                              <font style="float:left;"> 商品信息</font>
			                              <a href="javascript:history.back(-1)"><span style="float:right;width:30px;height:30px;background:red;font-size:85%;line-height:25px;border-radius:30px;font-weight:500;color:white;">返回</span></a>
			                          </td>
			                          
			                      </tr>
			                      <tr style="height:50px;">
			                          <td><br/><span style="float:left;color:red;font-size:140%;">*</span>标题</td>
			                          <td>
			                              <span id="tips1" style="float:left;width:100%;background:white;color:white;font-size:85%;">请输入商品的销售标题</span>
			                              <input name="goodsTitle" id="goodsTitle" type="text" style="float:left;width:100%;height:60%;" maxlength="100" onclick="javascript:document.getElementById('tips1').style.color='white';" value="${sessionScope.theGoods.getGoodsTitle()}"/>
			                          </td>
			                      </tr>
			                     <tr style="height:50px;">
			                          <td><br/><span style="float:left;color:red;font-size:140%;">*</span>名称</td>
			                          <td>
			                              <span id="tips2" style="float:left;width:100%;background:white;color:white;font-size:85%;">请输入商品的名称</span>
			                              <input name="goodsName" id="goodsName" type="text" style="float:left;width:150px;height:60%;" maxlength="20" onclick="javascript:document.getElementById('tips2').style.color='white';" value="${sessionScope.theGoods.getGoodsName()}"/>
			                          </td>
			                      </tr>
			                      <tr style="height:50px;">
			                          <td><br/><span style="float:left;color:red;font-size:140%;">*</span>单价</td>
			                          <td>
			                              <span id="tips3" style="float:left;width:100%;background:white;color:white;font-size:85%;">请输入商品的价格</span>
			                              <input name="goodsPrice" id="goodsPrice" type="text" style="float:left;width:100px;height:60%;" maxlength="6" onkeyup="this.value=this.value.replace(/[^\d.]/g,'')" onclick="javascript:document.getElementById('tips3').style.color='white';" value="${sessionScope.theGoods.getGoodsPrice()}"/>
			                              <span style="float:left;line-height:30px;margin-left:10px;color:gray;font-size:85%;">(元)</span>
			                          </td>
			                      </tr>
			                      <tr style="height:50px;">
			                          <td><br/><span style="float:left;color:red;font-size:140%;">*</span>库存</td>
			                          <td>
			                              <span id="tips4" style="float:left;width:100%;background:white;color:white;font-size:85%;">请输入商品的库存</span> 
			                              <input name="goodsNum" id="goodsNum" type="text" style="float:left;width:100px;height:60%;" maxlength="6" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onclick="javascript:document.getElementById('tips4').style.color='white';" value="${sessionScope.theGoods.getGoodsNum()}"/>
			                              <span style="float:left;line-height:30px;margin-left:10px;color:gray;font-size:85%;">(件)</span>
			                          </td>
			                      </tr>
			                       <tr style="height:50px;">
			                          <td><br/><span style="float:left;color:red;font-size:140%;">*</span>规格</td>
			                          <td>
			                              <span id="tips6" style="float:left;width:100%;background:white;color:white;font-size:85%;">请输入商品的规格</span> 
			                              <input name="goodsStruct" id="goodsStruct" type="text" style="float:left;width:300px;height:60%;" maxlength="30"  onclick="javascript:document.getElementById('tips6').style.color='white';" value="${sessionScope.theGoods.getGoodsStruct()}"/>
			                          </td>
			                      </tr>
			                       <tr style="height:50px;">
			                          <td><span style="float:left;color:red;font-size:140%;">*</span>分类</td>
			                          <td>
			                              <div style="float:left;height:100%;width:250px;">
			                                  <div style="position:relative;left:0px;top:0px;width:100%;height:100%;background:white;">
			                                      <div id="selectDiv" style="position:absolute;z-index:2;opacity:0;left:0px;top:0px;height:100%;">
				                                      <select  id="classify1" style="float:left;margin-top:10px;" disabled="disabled" onchange="changeClassify(this)" onclick="javascript:document.getElementById('tips5').style.color='white';">
						                                  <option value="-1">-请选择类别-</option>
						                                  <option value="1">生活家居</option>
						                                  <option value="2">数码家电</option>
						                                  <option value="3">服饰配件</option>
						                                  <option value="4">食品水果</option>
						                                  <option value="5">学习办公</option>
						                                  <option value="0">其他</option>
						                              </select>
						                              <select   id="classify2" style="float:left;margin-top:10px;margin-left:10px;" disabled="disabled" onclick="javascript:document.getElementById('tips5').style.color='white';">
						                                  <option value="-1">-请选择类别-</option>
						                              </select>
						                              <input id="classifyOne" name="classifyOne" type="hidden" value="${sessionScope.theGoods.getClassifyOne()}"/>
						                              <input id="classifyTwo" name="classifyTwo" type="hidden" value="${sessionScope.theGoods.getClassifyTwo()}"/>
			                                      </div>
			                                      <div id="showDiv" style="position:absolute;z-index:1;font-size:90%;left:0px;top:0px;height:100%;">
			                                          <span style="float:left;margin-top:10px;color:gray;">${sessionScope.theGoods.getClassifyOneName()}</span>
			                                          <span style="float:left;margin-top:10px;margin-left:20px;color:gray;">${sessionScope.theGoods.getClassifyTwoName()}</span>
			                                      </div>
			                                  </div>
			                              </div>
			                              <div style="float:left;height:100%;">
			                                  <button type="button" style="float:left;margin-top:10px;" onclick="openUpdateClassify()">修改</button>
					                          <span id="tips5" style="float:left;margin-top:12px;margin-left:10px;color:white;font-size:85%;">请选择商品类别</span>
			                              </div>
			                          </td>
			                      </tr>
			                      <tr style="height:120px;">
			                          <td>
			                              <span style="float:left;color:black;"><span style="float:left;color:gray;font-size:140%;">*</span>描述</span>
			                          </td>
			                          <td>
			                              <span style="float:left;">
			                                  <textarea name="goodsDetail" rows="4" cols="55" style="float:left;resize:none;border:2px solid #DDDDDD" >${sessionScope.theGoods.getGoodsDetail()}</textarea>
	                                      </span>
			                          </td>
			                      </tr>
			                      <tr style="height:50px;">
			                          <td colspan="2">
			                              <input type="hidden" name="updateGoodsFlag" value="<%=updateGoodsFlag%>"/>
			                              <input type="submit" value="提交" style="float:left;margin-left:40%;width:100px;height:30px;cursor:pointer;color:white;background:red;border-radius:10px;" >
			                          </td>
			                      </tr>
			                  </table>
			              </div>
			          </div> 
		          </form>
		        </div>
          </div>
          <div class="bottom">
		     <span style="float:left;width:100%;margin-top:20px;height:20px;text-align:center;color:gray;font-size:80%;">Copyright 2018 - 2028 jim.com All Rights Reserved 京ICP证100557号 京公网安备112310102004579号 出版物经营许可证新出发京批字第直1141328号</span>
	         <span style="float:left;margin-left:25%;width:50%;background:pink;height:70px;"><img src="./images/life/bottom.jpg" width="100%" height="70px"/></span>
	      </div>
      </center>
  </body>
</html>
