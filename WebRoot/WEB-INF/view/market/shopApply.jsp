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
    
    <title>店铺申请</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<c:url value='/js/preLookPhoto.js'/>"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <style type="text/css">
        .aa:visited {color: black;}
		.aa:link{	color:black;}
		.aa:hover {color: red;}
		.aa:active {color: red;} 
       
        .top{
            width:100%;
            height:40px;
            background:#F0F0F0;
        }
        .bg{
            width:1000px;
            height:1200px;
            background:white;
        }
        
        .bg_top{
            float:left;
            text-align:left;
            line-height:60px;
            width:100%;
            height:49px;
            color:red;
            font-size:110%;
            background:white;
            border-bottom:1px solid red;
        }
        
        .bg_center{
            float:left;
            width:100%;
            height:950px;
            font-size:90%;
            background:white;
        }
        
        .bottom {
			float:left;
			margin-top:50px;
			height:70px;
			width: 100%;
		}
    </style>
    <script type="text/javascript">
        window.onload = function (){
            if(checkUser()==false){
                var firstUrl = document.getElementById('firstUrl').href;
                window.location.replace(firstUrl);
            }
        };
        
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
		 
        function checkSubmit(){
            if(checkInputIsNull()==false){
                return false;
            }else{
                return true;
            } 
        }
              
        function checkInputIsNull(){
            var img = document.getElementById("img").files;
            var linkman = document.getElementById('linkman').value.replace(/\s/g, "");
            var phoneNo = document.getElementById('phoneNo').value.replace(/\s/g, "");
            var belongsAcademy = document.getElementById('belongsAcademy').value;
            var previewLength = document.getElementById("preview").children.length;
            if(linkman=="" || phoneNo=="" || belongsAcademy=='-1' || img.length==0 || previewLength==0){
                if(linkman==""){document.getElementById('tips1').style.color='red';}
                if(phoneNo==""){document.getElementById('tips2').style.color='red';}
                if(belongsAcademy=='-1'){document.getElementById('tips3').style.color='red';}
                if(img.length==0 || previewLength==0){alert("请上传手持证件照");}
                return false;
            }else{
                return true;
            }
        }
    </script>
  </head>
  <%
      String applyFlag = UUID.randomUUID().toString();
      session.setAttribute("applyFlag", applyFlag);
   %>
  <body>
      <center>
          <div class="top">
              <span style="float:right;">
		          <a class="aa" id="firstUrl" href="${pageContext.request.contextPath }/market/First" style="float:right;line-height:40px;text-decoration:none;font-size:90%;">商城首页</a>
	          </span>
          </div>
          <div class="bg">
              <div class="bg_top">
                  <font style="float:left;">店铺申请</font>
                  <a href="javascript:history.back(-1)"><span style="float:right;width:40px;height:40px;text-align:center;line-height:40px;background:red;border-radius:50px;color:white;font-size:85%;">返回</span></a>
              </div>
              <form action="${pageContext.request.contextPath }/market/1/1" method="post" enctype="multipart/form-data" onsubmit="return checkSubmit();">
              <div class="bg_center">
                  <table border="0"  width="100%" height="100%" style="border-collapse:collapse;">
                      <tr style="height:70px;">
                          <th style="text-align:left;">
	                          <font style="float:left;">申请人基础信息</font>
	                          <font style="float:left;margin-left:10px;font-size:90%;color:red;">(目前店铺只对学生开放)</font>
                          </th>
                      </tr>
                      <tr style="height:40px;font-weight:500;">
                          <td>
                              <span style="float:left;color:gray;"><span style="float:left;color:red;font-size:140%;">*</span>真实姓名</span>
                              <span style="float:left;margin-left:30px;">
                                  <input id="linkman" name="linkman" type="text" style="float:left;width:200px;height:30px;border:2px solid #DDDDDD" onclick="javascript:document.getElementById('tips1').style.color='white';"/>
                                  <span id="tips1" style="float:left;line-height:25px;font-size:85%;margin-left:20px;color:white;">请输入您的真实姓名</span>
                              </span>
                          </td>
                      </tr>
                       <tr style="height:60px;font-weight:500;">
                          <td>
                              <span style="float:left;color:gray;"><span style="float:left;color:red;font-size:140%;">*</span>联系电话</span>
                              <span style="float:left;margin-left:30px;">
                                  <input id="phoneNo" name="phoneNo" type="text" maxlength="11" style="float:left;width:200px;height:30px;border:2px solid #DDDDDD" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onclick="javascript:document.getElementById('tips2').style.color='white';"/>
                              </span>
                              <span id="tips2" style="float:left;line-height:25px;font-size:85%;margin-left:20px;color:white;">请输入联系电话</span>
                          </td>
                      </tr>
                      <tr style="height:300px;font-weight:500;">
                          <td>
                              <span style="float:left;margin-top:0px;background:white;color:gray;"><span style="float:left;color:red;font-size:140%;">*</span>证件图片</span>
                              <div style="float:left;margin-top:0px;width:200px;height:220px;background:white;margin-left:30px;border:1px solid gray;">
                                  <div style="position:relative;width:200px;height:30px;background:blue;">
                                      <button style="position:absolute;z-index:1;width:100%;text-align:center;font-size:90%;height:30px;cursor:pointer;color:white;background:red">点击上传</button>
                                      <label style="position:absolute;z-index:2;width:100%;height:30px;background:red;opacity:0;cursor:pointer;"><input id="img" name="img" type="file" accept="image/*" style="cursor:pointer;" onchange="preview(this)"/></label>
                                  </div>
                                  <div id="preview" style="position:relative;width:200px;top:10px;height:180px;background:white;"></div>
                              </div>
                              <div style="float:left;margin-left:30px;width:200px;height:220px;background:white;">
                                  <span style="float:left;width:100%;height:30px;text-align:center;font-weight:bold;">示例照片</span>
                                  <span style="float:left;width:100%;height:190px;"><a href="${pageContext.request.contextPath }/images/market/applyShop/example.jpg" target="_blank"><img src="./images/market/applyShop/example.jpg" width="100%" height="100%"/></a></span>
                              </div>
                              <span style="float:left;margin-left:20px;width:400px;font-size:85%;height:100px;background:white;color:gray;"><font style="color:red;">备注:</font>图片为手持学生证的上半身照片，图片中学生证信息清晰。图片的清晰会影响您的申请结果，务必上传清晰照片</span>
                          </td>
                       </tr>
                       <tr style="height:70px;">
                          <th style="text-align:left;">店铺信息</th>
                      </tr>
                      <tr style="height:60px;">
                          <td>
                              <span style="float:left;color:gray;"><span style="float:left;color:red;font-size:140%;">*</span>所属院系</span>
                              <span style="float:left;margin-left:30px;">
                                  <select id="belongsAcademy" name="belongsAcademy" style="float:left;padding: 0 2%;width:auto;height:30px;border:2px solid #DDDDDD" onclick="javascript:document.getElementById('tips3').style.color='white';">
                                      <option value="-1">--请选择--</option>
                                      <option value="1">农学院</option>
                                      <option value="2">动科院</option>
                                      <option value="3">外语院</option>
                                      <option value="4">计信院</option>
                                      <option value="5">经管院</option>
                                      <option value="6">职师院</option>
                                      <option value="7">理学院</option>
                                      <option value="8">成教学院</option>
                                      <option value="9">林学院</option>
                                      <option value="10">园林院</option>
                                      <option value="11">工学院</option>
                                      <option value="12">国土院</option>
                                      <option value="13">软件院</option>
                                      <option value="14">人文院</option>
                                      <option value="15">食品院</option>
                                      <option value="16">生工院</option>
                                      <option value="17">研究生院</option>
                                      <option value="0">其他</option>
                                  </select>
                              </span>
                              <span id="tips3" style="float:left;line-height:30px;font-size:85%;margin-left:20px;color:white;">请选择所属院系</span>
                          </td>
                      </tr>
                      <tr style="height:200px;font-weight:500;">
                          <td>
                              <span style="float:left;color:gray;"><span style="float:left;color:gray;font-size:140%;">*</span>申请说明</span>
                              <span style="float:left;margin-left:30px;">
                                  <textarea name="applyDesc"  rows="7" cols="51" style="float:left;resize:none;border:2px solid #DDDDDD" ></textarea>
                              </span>
                          </td>
                      </tr>
                      <tr style="height:100px;font-weight:500;">
                          <td>
                              <input type="hidden" name="applyFlag" value="<%=applyFlag%>"/>
                              <input type="hidden" name="applyUserId" value="${user.getUserId()}"/>
                              <input type="submit" value="提交申请" style="float:left;font-size:120%;margin-left:102px;width:200px;height:50%;cursor:pointer;color:white;background:red;border-radius:10px;">
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
