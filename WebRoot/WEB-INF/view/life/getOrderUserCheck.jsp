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
    
    <title>接单授权</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<c:url value='/js/preLookPhoto.js'/>"></script>
    
    <style type="text/css">
        .aa:visited {color: #1077CC;}
		.aa:link{	color:#1077CC;}
		.aa:hover {color: red;}
		.aa:active {color: red;} 
        
         .a1:visited {color: gray;}
		.a1:link{	color:gray;}
		.a1:hover {color: red;}
		.a1:active {color: red;}
		
		.b:visited {color:gray;}
		.b:link{	color:gray;}
		.b:hover {color:#1077CC;}
		.b:active {color:#1077CC;} 
		
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
		
        .top{
            width:100%;
            height:40px;
            background:#F0F0F0;
        }
        .bg{
            width:1000px;
            height:500px;
            background:pink;
        }
        
        .bg_top{
            float:left;
            text-align:left;
            line-height:60px;
            width:100%;
            height:49px;
            color:#1077CC;
            font-size:110%;
            background:white;
            border-bottom:1px solid #1077CC;
        }
        
        .bg_center{
            float:left;
            width:100%;
            height:100%;
            font-size:90%;
            background:white;
        }
        
        .bottom {
			float:left;
			margin-top:100px;
			height:70px;
			width: 100%;
		}
    </style>
    <script type="text/javascript">
        window.onload=function (){
             var result='<%=request.getAttribute("result")%>';
             if(result=='null'){
             }else{
                 if(result=='1'){
                 alert("提交成功，请耐心等待审核结果！");
             }else if(result=='2'){
                 alert("您已提交过审核信息！");
             }else{
                 alert("抱歉，提交失败！");
             }
             }   
        };
        
        function checkSubmit(){
            if(checkInputIsNull()==false){
                return false;
            }else{
                return true;
            } 
        }
           
        function checkInputIsNull(){
            var img = document.getElementById('img').value;
            var trueName = document.getElementById('trueName').value.replace(/\s/g, "");
            var theUsertel = document.getElementById('theUsertel').value.replace(/\s/g, "");
            var guaranteeMoney = document.getElementById('guaranteeMoney').value.replace(/\s/g, "");
            if(trueName=="" || theUsertel=="" || guaranteeMoney=="" || img==""){
                if(img==""){alert("请上传审核人图片");}
                if(trueName==""){document.getElementById('tips1').style.color='red';}
                if(theUsertel==""){document.getElementById('tips2').style.color='red';}
                if(guaranteeMoney==""){document.getElementById('tips3').style.color='red';}
                return false;
            }else{
                return true;
            }
        }
    </script>
  </head>
  <%
      String checkFlag = UUID.randomUUID().toString();
      session.setAttribute("checkFlag", checkFlag);
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
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/login?pageSource=b6" style="float:left;margin-left:10px;font-size:80%;line-height:28px;text-decoration:none;">请登录</a> 
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/regist?pageSource=b6" style="float:left;margin-left:20px;font-size:80%;line-height:28px;text-decoration:none;">[免费注册]</a>
                 </c:when>
                 <c:otherwise>
                     <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=b6">
                     <span style="float:left;margin-top:5px;margin-left:30px;width:20px;height:20px;border-radius:15px;cursor:pointer;"><img src="${sessionScope.user.getUserPhoto()}" title="${sessionScope.user.getUserName()}" style="border-radius:15px;width:100%;height:100%;"/></span>
                     <font style="float:left;margin-left:5px;font-size:80%;line-height:28px;text-decoration:none;">${sessionScope.user.getUserName()}</font>
                     </a>
                     <a class="a1" href="${pageContext.request.contextPath }/person/user/exit?pageSource=b6" style="float:left;margin-left:10px;font-size:80%;line-height:27px;text-decoration:none;">注销</a>
                 </c:otherwise>
             </c:choose>
             <span id="showBar" style="float:right;width:60px;height:30px;text-align:center;margin-right:180px;cursor:default;font-size:80%;line-height:28px;color:gray;" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='visible';this.style.color='red';this.style.background='white'" onmouseout="this.style.color='gray';">网站导航</span>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/6?pageSource=b6" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">卖家中心</a>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=b6" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">个人中心</a>
          </div>
          <div class="bg" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
              <div class="bg_top">
                  <font style="float:left;">接单授权</font>
                  <a href="${pageContext.request.contextPath }/life/6"><span style="float:right;width:40px;height:40px;text-align:center;line-height:40px;background:#1077CC;border-radius:50px;color:white;font-size:85%;" onmouseover="this.style.background='#0c5799'" onmouseout="this.style.background='#1077CC'">返回</span></a>
              </div>
              <form action="${pageContext.request.contextPath}/life/6/4" method="post" enctype="multipart/form-data" onsubmit="return checkSubmit();">
              <div class="bg_center">
                  <table border="0"  width="100%" height="100%" style="border-collapse:collapse;background:white;">
                      
                      <tr style="height:70px;">
                          <th style="text-align:left;">基础信息</th>
                      </tr>
                     
                      <tr style="height:60px;font-weight:500;">
                          <td>
                              <span style="float:left;color:gray;"><span style="float:left;color:red;font-size:140%;">*</span>真实姓名</span>
                              <span style="float:left;margin-left:30px;">
                                  <input id="trueName" name="trueName" type="text" maxlength="5" style="float:left;width:150px;height:30px;border:2px solid #DDDDDD" onclick="javascript:document.getElementById('tips1').style.color='white';"/>
                              </span>
                              <span id="tips1" style="float:left;line-height:25px;font-size:85%;margin-left:20px;color:white;">请输入真实姓名</span>
                          </td>
                      </tr>
                      <tr style="height:60px;font-weight:500;">
                          <td>
                              <span style="float:left;color:gray;"><span style="float:left;color:red;font-size:140%;">*</span>联系电话</span>
                              <span style="float:left;margin-left:30px;">
                                  <input id="theUsertel" name="theUsertel" type="text" maxlength="11" style="float:left;width:150px;height:30px;border:2px solid #DDDDDD" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onclick="javascript:document.getElementById('tips2').style.color='white';"/>
                              </span>
                              <span id="tips2" style="float:left;line-height:25px;font-size:85%;margin-left:20px;color:white;">请输入联系电话</span>
                          </td>
                      </tr>
                      <tr style="height:200px;font-weight:500;">
                          <td>
                              <span style="float:left;height:100%;background:white;color:gray;"><span style="float:left;color:red;font-size:140%;">&nbsp&nbsp*</span>证件照</span>
                              <div style="float:left;width:200px;height:90%;background:white;margin-left:30px;background:white;">
                                  <input id="img" name="img" type="file" style="width:150px;height:30px;opacity:0.5;" onchange="preview(this)"/>
                                  <div id="preview" style="float:left;margin-top:10px;width:150px;height:120px;background:white;border:2px solid #DDDDDD"></div>
                              </div>
                              <span style="float:left;margin-left:20px;color:gray;font-size:85%;line-height:30px;">(照片为学生本人手持学生证，学生证内容清晰，本人脸部清晰)</span>
                          </td>
                      </tr>
                      <tr style="height:60px;font-weight:500;">
                          <td>
                              <span style="float:left;color:gray;"><span style="float:left;color:red;font-size:140%;">*</span>缴纳押金</span>
                              <span style="float:left;margin-left:30px;">
                                  <input id="guaranteeMoney" name="guaranteeMoney" type="text" maxlength="5" style="float:left;width:150px;height:30px;border:2px solid #DDDDDD" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onclick="javascript:document.getElementById('tips3').style.color='white';"/>
                              </span>
                              <span id="tips3" style="float:left;line-height:25px;font-size:85%;margin-left:20px;color:white;">请缴纳保证金</span>
                          </td>
                      </tr>
                      <tr style="height:100px;font-weight:500;">
                          <td>
                              <input type="hidden" name="checkFlag" value="<%=checkFlag%>"/>
                              <input type="hidden" name="checkedUserId" value="${user.getUserId()}"/>
                              <input type="hidden" name="state" value="0"/>
                              <input type="submit" value="提交" style="float:left;margin-left:102px;width:150px;height:50%;cursor:pointer;color:white;background:#1077CC;border-radius:10px;" onmouseover="this.style.background='#0c5799'" onmouseout="this.style.background='#1077CC'">
                          </td>
                      </tr>
                  </table>
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
