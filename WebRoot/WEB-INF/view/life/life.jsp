<%@ page language="java" import="java.util.*,com.school.domain.personbeans.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>生活中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<c:url value='/js/life.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/ajaxutils.js'/>"></script>
	<link rel="stylesheet" type="text/css" href="css/life.css">
    <%
       User user = (User)session.getAttribute("user");
       String target = (String)request.getAttribute("target");
    %>
  </head>
  
  <body>
  <center>
    <div class="bg">
      <div class="top">
          <span style="float:left;width:40%;height:80px;">
              <span style="float:left;margin-top:10px;width:12%;height:50px;"><img src="./images/life/logo.jpg" width="100%" height="60px"/></span>
              <span style="float:left;margin-top:10px;width:85%;height:60px;">
                  <span style="float:left;text-align:left;width:100%;height:40px;color:#1077CC;font-size:140%;line-height:50px;">校园便利网   | 生活便利中心</span>
                  <span style="float:left;text-align:left;width:100%;height:15px;border-top:1px solid #1077CC; color:#1077CC;font-size:70%;">&nbsp&nbsp&nbspCampus network&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspLife convenience center</span>
              </span>
          </span>
          
          <span style="float:right;">
             <a class="aa" href="${pageContext.request.contextPath }/market/First" style="float:right;text-decoration:none;font-size:90%;">商城首页</a>
             <font style="float:right;color:gray;margin-left:10px;margin-right:10px;">|</font>
             <%
                 if(user==null){
             %>
                  <a class="aa" href="${pageContext.request.contextPath }/person/user/regist?pageSource=b1" style="float:right;text-decoration:none;font-size:90%;">[免费注册]</a>
                  <font style="float:right;color:gray;margin-left:10px;margin-right:10px;">|</font>
                  <a class="aa" href="${pageContext.request.contextPath }/person/user/login?pageSource=b1" style="float:right;text-decoration:none;font-size:90%;">登录</a>
             <%
             }else{
             %>
                   <a class="aa" href="${pageContext.request.contextPath }/person/user/exit?pageSource=b1" style="float:right;text-decoration:none;font-size:90%;">[注销]</a>
                   <font style="float:right;color:gray;margin-left:10px;margin-right:10px;">|</font>
                   <a class="aa" href="#" style="float:right;text-decoration:none;font-size:90%;"><%=user.getUserName()%></a>
             <%
             }
             %>
          </span>
      </div>
	  <div class="select">
	      <span style="float:left;width:100%;height:50px;background:#1077CC;"></span>
	      <a href="${pageContext.request.contextPath }/life/1" style="text-decoration:none;"><span id="select1" style="float:left;margin-top:40px;width:100%;height:46px;font-size:110%;line-height:50px;text-align:center;color:white;background:#1077CC;" onmouseover="changeBg(this)" onmouseout="changeBg(this)">缴费大厅</span></a>
	      <a href="${pageContext.request.contextPath }/life/2" style="text-decoration:none;"><span id="select2" style="float:left;margin-top:40px;width:100%;height:46px;font-size:110%;line-height:50px;text-align:center;color:white;background:#1077CC;" onmouseover="changeBg(this)" onmouseout="changeBg(this)">送水中心</span></a>
	      <a href="${pageContext.request.contextPath }/life/3" style="text-decoration:none;"><span id="select3" style="float:left;margin-top:40px;width:100%;height:46px;font-size:110%;line-height:50px;text-align:center;color:white;background:#1077CC;" onmouseover="changeBg(this)" onmouseout="changeBg(this)">物业报修</span></a>
	      <a href="${pageContext.request.contextPath }/life/4" style="text-decoration:none;"><span id="select4" style="float:left;margin-top:40px;width:100%;height:46px;font-size:110%;line-height:50px;text-align:center;color:white;background:#1077CC;" onmouseover="changeBg(this)" onmouseout="changeBg(this)">快递服务</span></a>
	      <a href="${pageContext.request.contextPath }/life/5" style="text-decoration:none;"><span id="select5" style="float:left;margin-top:40px;width:100%;height:46px;font-size:110%;line-height:50px;text-align:center;color:white;background:#1077CC;" onmouseover="changeBg(this)" onmouseout="changeBg(this)">房屋租赁</span></a>
	      <a href="${pageContext.request.contextPath }/life/6" style="text-decoration:none;"><span id="select6" style="float:left;margin-top:40px;width:100%;height:46px;font-size:110%;line-height:50px;text-align:center;color:white;background:#1077CC;" onmouseover="changeBg(this)" onmouseout="changeBg(this)">我要接单</span></a>
	  </div>
	  <div class="content">
	      <span style="float:left;width:100%;height:50px;background:#1077CC;">
	          <a href="${pageContext.request.contextPath }/life/1" style="text-decoration:none;"><span style="float:right;width:8%;height:50px;text-align:center;line-height:50px;font-size:90%;color:white;background:#1077CC;" onmouseover="this.style.background='#0C5799'" onmouseout="this.style.background='#1077CC'">&gt首页</span></a>
	      </span>
	      <span style="float:left;margin-left:1%;width:98%;margin-top:10px;height:40px;background:#1077CC;border-radius:8px;">
	          <span style="float:left;width:10%;height:40px;background:#1077CC;border-radius:5px 0px 0px 5px;color:white;line-height:37px;font-size:120%;">&nbsp&nbsp通知公告</span>
	          <span style="float:left;width:89.8%;height:38px;background:white;border-radius:0px 5px 5px 0px;color:black;tetx-align:left;border:1px solid #1077CC;">
	              <span style="float:left;margin-top:5px;margin-left:1%;text-align:left;width:90%;height:30px;background:white;">供电中心:周末不上班！</span>
	              <span style="float:right;margin-top:5px;margin-right:1%;width:3%;height:30px;background:blue;">
	                  <a href="javascript:void(0);" style="text-decoration:none;"><img src="./images/life/jiantou.jpg" width="100%" height="30px"/></a>
	              </span>
	          </span>
	      </span>
	      <div id="content_main" style="float:left;margin-left:1%;width:98%;background:white;">  
	      <%
            /* @target页面选择变量
	         * 为1: 代表缴费大厅（首页） 1表示电费
	         * 为2: 代表送水中心         
	         * 为3: 代表物业报修     
	         * 为41: 代表快递代领服务         为42: 代表快递代寄服务         
	         * 为5: 代表房屋租赁
	         * 为6: 代表我要接单
             */
              if("1"==target || target==null ||target.trim().equals("")){
                 //电费厅
                 %>
                  <script type="text/javascript">
	                  var select1 = document.getElementById('select1');
	                  select1.style.background='white';
				      select1.style.color='#1077CC';
				      
				      function changePayMent(obj){
				          if(obj.value==''){
				              document.getElementById('showPayMent').innerHTML='';
				          }else{
				              document.getElementById('showPayMent').innerHTML=obj.value+'.00';
				          }
				          
				      }
				      
				      function queryElectronic(obj){
							var location = document.getElementById('location').value;
							var unit = document.getElementById('unit').value;
							var houseNum = document.getElementById('houseNum').value;
							
							if(unit=="" || houseNum=="" || houseNum=="请输入门牌号"){
								if(unit==""){document.getElementById('unitTip').style.color='red';}
								if(houseNum=="" || houseNum=="请输入门牌号"){document.getElementById('houseNum').style.borderColor='red';}
								
							}else{
								//利用ajax进行查询
								//ajax工具
								ajax(
									{
									    method:"POST",
										url:"http://localhost:8080/schoolHelper/life/1/1",
										type:"text",
										params:"area="+location+"&unit="+unit+"&houseNumber="+houseNum,
										callback:function(data) {
											document.getElementById('showEleRemain').innerHTML = data;
										}
									}
								);
							}   
						}
						
						function payElectronic(){
						    var user='<%=session.getAttribute("user")%>';
						    var payUserId = document.getElementById('payUserId').value;
							var location = document.getElementById('location').value;
							var unit = document.getElementById('unit').value;
							var houseNum = document.getElementById('houseNum').value;
							var showPayMent = document.getElementById('showPayMent').innerHTML;
	                        if(user=="null"){
	                            //用户未登录，不能缴费
	                            alert("请先登录再操作!");
	                        }else{
	                            if(unit=="" || houseNum=="" || houseNum=="请输入门牌号" || showPayMent==""){
									if(unit==""){document.getElementById('unitTip').style.color='red';}
									if(houseNum=="" || houseNum=="请输入门牌号"){document.getElementById('houseNum').style.borderColor='red';}
									if(showPayMent==""){document.getElementById('showPayMent').innerHTML="请输入缴费金额";}
								}else{
									//利用ajax进行查询
									//ajax工具
									ajax(
										{
										    method:"POST",
											url:"http://localhost:8080/schoolHelper/life/1/2",
											type:"text",
											params:"area="+location+"&unit="+unit+"&houseNumber="+houseNum+"&payMoney="+showPayMent+"&payUserId="+payUserId,
											callback:function(data) {
											    
												if(data=="1"){
													alert("充值成功!");
												}else if(data=="-1"){
													alert("充值失败，房间信息有误!");
												}else{
													alert("充值失败，服务器出错!");
												}
											}
										}
									);
								}
	                        }
						}
	              </script>
	              
			          <div style="float:left;text-align:center;width:100%;height:30px;font-size:120%;font-weight:bold;background:white;">电费厅</div>
			          <div style="float:left;margin-left:10%;width:80%;height:370px;">
			              <table border="1"  width="100%" height="360px" style="border-collapse:collapse;border:1px dashed #1077CC">
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;font-weight:bold;">名称</td>          
						           <td width="40%" style="font-size:80%;font-weight:bold;">操作</td>
						           <td width="45%" style="font-size:80%;font-weight:bold;text-align:center;">备注</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">所在楼栋</td>          
						           <td width="40%" style="font-size:80%;">
						               <select id="location" onclick="getUnit()">
						                   <option value="南区">南区</option>
						                   <option value="北区">北区</option>
						               </select>
						               <select id="unit" onchange="javascript:document.getElementById('unitTip').style.color='white';">

						               </select>
						               <span id="unitTip" style="color:white;">请选择所在楼栋</span>
						           </td>
						           <td width="45%" style="font-size:80%;"></td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">门牌号</td>          
						           <td width="40%" style="font-size:80%;">
						               <input id="houseNum" type="text" value="请输入门牌号"  maxlength="3" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onclick="javascript:this.value='';this.style.borderColor='black';">
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">请仔细填写，填写错误无法退款</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">电费余额</td>          
						           <td width="40%" style="font-size:80%;">
						               <span id="showEleRemain" style="float:left;height:50px;text-align:left;line-height:50px;color:red;"></span>
						               <span style="float:right;width:30%;height:50px;background:blue;"><button style="width:100%;height:50px;background:#1077CC;cursor:pointer;border-radius:5px;" onmouseover="this.style.background='#0C5799'" onmouseout="this.style.background='#1077CC'" onclick="queryElectronic(this)">查询</button></span>
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">电费不足5元将自动断电</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">缴纳金额</td>          
						           <td width="40%" style="font-size:80%;">
						               <input type="text"  maxlength="3" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this);changePayMent(this);">
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">金额不得低于10元</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">实付金额</td>          
						           <td width="40%" style="font-size:80%;">
						               <span id="showPayMent" style="float:left;height:50px;font-size:130%;text-align:left;line-height:50px;font-weight:600;color:red;"></span>
						           </td>
						           <td width="45%" style="font-size:80%;"></td>
						        </tr> 
						        <tr height="50px">
						           <td colspan="3" style="font-size:80%;">
						               <input type="hidden" id="payUserId" value="${user.getUserId()}"/>
						               <a href="javascript:void(0);" style="text-decoration:none;"><span style="float:left;margin-left:20%;width:60%;height:50px;background:#1077CC;border-radius:5px;color:white;text-align:center;line-height:50px;font-size:150%;" onmouseover="this.style.background='#0C5799'" onmouseout="this.style.background='#1077CC'" onclick="payElectronic()">去&nbsp支&nbsp付</span></a>
						           </td>          
						        </tr> 
	                      </table>
			          </div>               
                 <%
              }else if("2"==target){
                 //送水中心
                 %>
	               <script type="text/javascript">
	                   var select2 = document.getElementById('select2');
	                   select2.style.background='white';
				       select2.style.color='#1077CC';
				       
				       function changePrice(obj){
						   if(obj.value=="" || (obj.value=="请输入数量")){
						   }else{
						       var price = Number(obj.value)*7+".00";
						       document.getElementById('allPrice').innerHTML=price;
						   }
				       }
				       
				       function goPayWater(){
				           var user='<%=session.getAttribute("user")%>';
				           var location = document.getElementById('location').value;
						   var unit = document.getElementById('unit').value;
						   var houseNum = document.getElementById('houseNum').value;
						   var waterDept = document.getElementById('distributor').innerHTML;
						   var waterNum = document.getElementById('waterNum').value;
						   var tel = document.getElementById('tel').value;
						   var payUserId = document.getElementById('payUserId').value;
						   var allPrice = document.getElementById('allPrice').innerHTML;
						   if(user=="null"){
						       alert("请先登录再操作!")
						   }else{
						      if(houseNum=="" || houseNum=="请输入门牌号" || waterNum=="" || waterNum=="请输入数量" || tel=="" || tel=="请输入联系电话"){
						       if(houseNum=="" || houseNum=="请输入门牌号"){
						           document.getElementById('houseNum').style.borderColor='red';
						       }
						       
						       if(waterNum=="" || waterNum=="请输入数量" || waterNum=="0"){
						           document.getElementById('waterNum').style.borderColor='red';
						       }
						       
						       if(tel=="" || tel=="请输入联系电话"){
						           document.getElementById('tel').style.borderColor='red';
						       }
						   }else{
						       ajax(
										{
										    method:"POST",
											url:"http://localhost:8080/schoolHelper/life/2/1",
											type:"text",
											params:"area="+location+"&unit="+unit+"&houseNumber="+houseNum+"&waterNum="+waterNum+"&tel="+tel+"&allPrice="+allPrice+"&waterDept="+waterDept+"&payUserId="+payUserId,
											callback:function(data) {
												if(data=="1"){
												   alert("预定成功!");
												}else{
												   alert("预定失败!");
												}
												
											}
										}
								   );
						   }   
						 }  
				       }
	               </script>
	               <div id="view_content" class="view_content">
				      <span style="float:left;margin-left:45%;width:10%;height:30px;font-weight:bold;font-size:120%;text-align:center;">送水中心</span>
				      <div style="float:left;margin-left:10%;width:80%;height:370px;">
				          <table border="1"  width="100%" height="360px" style="border-collapse:collapse;border:1px dashed #1077CC">
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;font-weight:bold;">名称</td>          
						           <td width="40%" style="font-size:80%;font-weight:bold;">操作</td>
						           <td width="45%" style="font-size:80%;font-weight:bold;text-align:center;">备注</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">所在楼栋</td>          
						           <td id="waterAdddress" width="40%" style="font-size:80%;" onchange="changeDistributor()">
						               <select id="location" onchange="getUnit()" style="width:20%;height:30px;">
						                   <option value="0">南区</option>
						                   <option value="1">北区</option>   
						               </select>
						               <select id="unit" style="width:20%;height:30px;">
						                   <%
						                       String arr="1栋,2栋,3栋,4栋,5栋,6栋,7栋,8栋,9栋,10栋,11栋,12栋,13栋,14栋,15栋,16栋,17栋,18栋,19栋,20栋,21栋,22栋,23栋,24栋,25栋,26栋,27栋,28栋,29栋,30栋";
						                       String array[] = arr.split(",");   
						                       for(int i=0;i<array.length;i++){
						                          %>
						                             <option value="<%=i+1%>"><%=array[i]%></option>
						                          <%
						                       }
						                    %>
						               </select>
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">南区一部:18-30(栋)&nbsp&nbsp南区二部:1-17(栋)&nbsp&nbsp北区一部:1-14(栋)</td>
						        </tr>
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">配送部门</td>          
						           <td width="40%" style="font-size:80%;">
						               <span id="distributor" style="float:left;width:100%;height:20px;text-align:left;font-weight:600;">南区二部</span>
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">配送时间:8:00-21:00</td>
						        </tr>  
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">门牌号</td>          
						           <td width="40%" style="font-size:80%;">
						               <input type="text" id="houseNum" value="请输入门牌号"  maxlength="3" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this);" onclick="javascript:this.value='';this.style.borderColor='gray'">
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">请仔细填写，填写错误需要承担配送费</td>
						        </tr> 
						         <tr height="50px">
						           <td width="15%" style="font-size:80%;">数量</td>          
						           <td width="40%" style="font-size:80%;">
						               <input type="text" id="waterNum" value="请输入数量" maxlength="1" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this);changePrice(this);" onclick="javascript:this.value='';this.style.borderColor='gray'">
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">默认一桶，每单最多预定9桶</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">联系电话</td>          
						           <td width="40%" style="font-size:80%;">
						               <input type="text" id="tel" value="请输入联系电话"  maxlength="11" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onclick="javascript:this.value='';this.style.borderColor='gray'">
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;"></td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">实付金额</td>          
						           <td width="40%" style="font-size:80%;">
						               <span id="allPrice" style="float:left;height:50px;font-size:130%;text-align:left;line-height:50px;font-weight:600;color:red;"></span>
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">其中含2元配送费</td>
						        </tr> 
						        <tr height="50px">
						           <td colspan="3" style="font-size:80%;">
						               <input type="hidden" id="payUserId" value="${user.getUserId()}"/>
						               <a href="javascript:void(0);" style="text-decoration:none;"><span style="float:left;margin-left:20%;width:60%;height:50px;background:#1077CC;border-radius:5px;color:white;text-align:center;line-height:50px;font-size:150%;" onmouseover="this.style.background='#0C5799'" onmouseout="this.style.background='#1077CC'" onclick="goPayWater()">去&nbsp支&nbsp付</span></a>
						           </td>          
						        </tr> 
		                  </table>
				      </div>
				  </div>
                 <%
              }else if("3"==target){
                 //物业报修
                 %>
	               <script type="text/javascript">
	                   var select3 = document.getElementById('select3');
	                   select3.style.background='white';
				       select3.style.color='#1077CC';
				       
				       function changePrice(obj){
						   if(obj.value=="" || (obj.value=="请输入数量")){
						   }else{
						       var price = Number(obj.value)*7+".00";
						       document.getElementById('allPrice').innerHTML=price;
						   }
				       }
				       
				       function goApply(){
				           var user='<%=session.getAttribute("user")%>';
				           var location = document.getElementById('location').value;
						   var unit = document.getElementById('unit').value;
						   var applyUserId = document.getElementById('applyUserId').value;
						   var houseNum = document.getElementById('houseNum').value;
						   var repairContent = document.getElementById('repairContent').value;
						   var tel = document.getElementById('tel').value;
						   var repairRemark = document.getElementById('repairRemark').value;
						   if(user=="null"){
						       alert("请登录后操作!");
						   }else{
						       			   if(houseNum=="" || houseNum=="请输入门牌号" || repairContent=="" || tel=="" || tel=="请输入联系电话"){
						       if(houseNum=="" || houseNum=="请输入门牌号"){
						           document.getElementById('houseNum').style.borderColor='red';
						       }
						       
						       if(repairContent==""){
						           document.getElementById('repairContent').style.borderColor='red';
						       }
						       
						       if(tel=="" || tel=="请输入联系电话"){
						           document.getElementById('tel').style.borderColor='red';
						       }
						   }else{
						       ajax(
										{
										    method:"POST",
											url:"http://localhost:8080/schoolHelper/life/3/1",
											type:"text",
											params:"area="+location+"&unit="+unit+"&houseNumber="+houseNum+"&repairContent="+repairContent+"&tel="+tel+"&repairRemark="+repairRemark+"&applyUserId="+applyUserId,
											callback:function(data) {
												if(Number(data)>0){
												    alert("报修成功，请等待师傅上门维修!");
												}else{
												   alert("保修失败,出现故障!"); 
												}
											}
										}
								   );
						        }  
						 }
				       }
	               </script>
	               <div id="view_content" class="view_content">
				      <span style="float:left;margin-left:45%;width:10%;height:30px;font-weight:bold;font-size:120%;text-align:center;">物业报修</span>
				      <div style="float:left;margin-left:10%;width:80%;height:370px;">
				          <table border="1"  width="100%" height="360px" style="border-collapse:collapse;border:1px dashed #1077CC">
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;font-weight:bold;">名称</td>          
						           <td width="40%" style="font-size:80%;font-weight:bold;">操作</td>
						           <td width="45%" style="font-size:80%;font-weight:bold;text-align:center;">备注</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">所在楼栋</td>          
						           <td id="adddress" width="40%" style="font-size:80%;" >
						               <select id="location" onchange="getUnit()" style="width:20%;height:30px;">
						                   <option value="0">南区</option>
						                   <option value="1">北区</option>   
						               </select>
						               <select id="unit" style="width:20%;height:30px;">
						                   <%
						                       String arr="1栋,2栋,3栋,4栋,5栋,6栋,7栋,8栋,9栋,10栋,11栋,12栋,13栋,14栋,15栋,16栋,17栋,18栋,19栋,20栋,21栋,22栋,23栋,24栋,25栋,26栋,27栋,28栋,29栋,30栋";
						                       String array[] = arr.split(",");   
						                       for(int i=0;i<array.length;i++){
						                          %>
						                             <option value="<%=i+1%>"><%=array[i]%></option>
						                          <%
						                       }
						                    %>
						               </select>
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;"></td>
						        </tr>
				
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">门牌号</td>          
						           <td width="40%" style="font-size:80%;">
						               <input type="text" id="houseNum" value="请输入门牌号"  maxlength="3" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this);" onclick="javascript:this.value='';this.style.borderColor='gray';this.style.color='black';">
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;"></td>
						        </tr> 
						         <tr height="50px">
						           <td width="15%" style="font-size:80%;">报修内容</td>          
						           <td width="40%" style="font-size:80%;">
						               <input type="text" id="repairContent"  style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;" onclick="javascript:this.style.borderColor='gray'">
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;"></td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">联系电话</td>          
						           <td width="40%" style="font-size:80%;">
						               <input type="text" id="tel" value="请输入联系电话"  maxlength="11" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onclick="javascript:this.value='';this.style.borderColor='gray';this.style.color='black';">
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;"></td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">备注</td>          
						           <td width="40%" style="font-size:80%;">
						               <input type="text" id="repairRemark"  style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;" onclick="javascript:this.style.borderColor='gray'">
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;"></td>
						        </tr> 
						        <tr height="50px">
						           <td colspan="3" style="font-size:80%;">
						               <input type="hidden" id="applyUserId" value="${user.getUserId()}"/>
						               <a href="javascript:void(0);" style="text-decoration:none;"><span style="float:left;margin-left:20%;width:60%;height:50px;background:#1077CC;border-radius:5px;color:white;text-align:center;line-height:50px;font-size:150%;" onmouseover="this.style.background='#0C5799'" onmouseout="this.style.background='#1077CC'" onclick="goApply()">报&nbsp&nbsp修</span></a>
						           </td>          
						        </tr> 
		                  </table>
				      </div>
				  </div>
                 <%
              }else if("41"==target){
                 //领快递
                 %>
                 <script type="text/javascript">
                     var select4 = document.getElementById('select4');
                     select4.style.background='white';
			    	 select4.style.color='#1077CC';
                 </script>
	             <div class="view_btn">
				      <a href="${pageContext.request.contextPath }/life/4?select=1" style="text-decoration:none;"><span style="float:left;width:100%;height:85px;color:black;border-radius:8px 8px 8px 8px;background:gray;opacity:0.3;border-top:1px solid white;text-align:center;" onmouseover="this.style.opacity='0.7'" onmouseout="this.style.opacity='0.3'" onclick="goPayElectronic();">领<br/>快<br/>递</span></a>
				      <a href="${pageContext.request.contextPath }/life/4?select=2" style="text-decoration:none;"><span style="float:left;width:100%;height:85px;color:black;background:gray;border-radius:8px 8px 8px 8px;opacity:0.3;border-top:1px solid white;text-align:center;" onmouseover="this.style.opacity='0.7'" onmouseout="this.style.opacity='0.3'" onclick="goPaySchool();">寄<br/>快<br/>递</span></a>
			      </div>
				      <span style="float:left;margin-left:45%;width:10%;height:30px;font-weight:bold;font-size:120%;text-align:center;">快递代领</span>
				      <div style="float:left;margin-left:8%;width:80%;height:470px;background:white;">
				          <table border="1"  width="100%" height="460px" style="border-collapse:collapse;border:1px dashed #1077CC">
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;font-weight:bold;">名称</td>          
						           <td width="40%" style="font-size:80%;font-weight:bold;">操作</td>
						           <td width="45%" style="font-size:80%;font-weight:bold;text-align:center;">备注</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">快递公司</td>          
						           <td width="40%" style="font-size:80%;">
						               <select>
						                   <option>请选择快递公司</option>
						                   <option>顺丰快递</option>
						                   <option>京东快递</option>
						                   <option>韵达快递</option>
						                   <option>圆通快递</option>
						                   <option>汇通快递</option>
						                   <option>中通快递</option>
						                   <option>申通快递</option>
						               </select>
						               <select>
						                   <option>请选择地址</option>
						                   <option>北区</option>
						                   <option>南区</option>
						                   <option>东区</option>
						               </select>
						           </td>
						           <td width="45%" style="font-size:80%;"></td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">取货号</td>          
						           <td width="40%" style="font-size:80%;">
						               <input type="text" value="请输入取货号"  maxlength="6" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onclick="javascript:this.value='';">
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">取货号不超过6位</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">联系电话</td>          
						           <td width="40%" style="font-size:80%;">
						               <input type="text" value="请输入联系电话"  maxlength="11" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onclick="javascript:this.value='';">
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">电费不足5元将自动断电</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">快递重量</td>          
						           <td width="40%" style="font-size:80%;">
						               <select onchange="changePrice(this)">
						                   <option value="2.00" selected = "selected">1kg</option>
						                   <option value="3.00">5kg</option>
						                   <option value="5.00">10kg</option>
						               </select>
						               <span style="float:right;color:gray;">默认为1kg,实际以快递重量为准</span>
						               <span style="float:right;color:red;font-size:140%;">*</span>
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">1kg内2元，超过所选范围则加收5元</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;"><span style="float:left;">代收地址</span><span style="float:left;color:red;font-size:140%;">*</span></td>          
						           <td width="40%" style="font-size:80%;">
						               <input type="text" value="请输入收货地址" autocomplete="off" maxlength="50" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onclick="javascript:this.value='';">
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">详细地址</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">备注</td>          
						           <td width="40%" style="font-size:80%;">
						               <input type="text" value="备注您的建议"  maxlength="50" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onclick="javascript:this.value='';">
						           </td>
						           <td width="45%" style="font-size:80%;"></td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">服务费</td>          
						           <td width="40%" style="font-size:80%;">
						               <span id="DeliveryPrice" style="float:left;height:50px;font-size:130%;text-align:left;line-height:50px;font-weight:600;color:red;">2.00</span>
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">若价格与重量不符，需要补差价</td>
						        </tr> 
						        <tr height="50px">
						           <td colspan="3" style="font-size:80%;">
						               <a href="javascript:void(0);" style="text-decoration:none;"><span style="float:left;margin-left:20%;width:60%;height:50px;background:#1077CC;border-radius:5px;color:white;text-align:center;line-height:50px;font-size:150%;" onmouseover="this.style.background='#0C5799'" onmouseout="this.style.background='#1077CC'">去&nbsp支&nbsp付</span></a>
						           </td>          
						        </tr> 
		                  </table>
				      </div>
                 <%
              }else if("42"==target){
                 //寄快递
                 %>
                 <script type="text/javascript">
                     var select4 = document.getElementById('select4');
                     select4.style.background='white';
			    	 select4.style.color='#1077CC';
                 </script>
	              <div class="view_btn">
				      <a href="${pageContext.request.contextPath }/life/4?select=1" style="text-decoration:none;"><span style="float:left;width:100%;height:85px;color:black;border-radius:8px 8px 8px 8px;background:gray;opacity:0.3;border-top:1px solid white;text-align:center;" onmouseover="this.style.opacity='0.7'" onmouseout="this.style.opacity='0.3'" onclick="goPayElectronic();">领<br/>快<br/>递</span></a>
				      <a href="${pageContext.request.contextPath }/life/4?select=2" style="text-decoration:none;"><span style="float:left;width:100%;height:85px;color:black;background:gray;border-radius:8px 8px 8px 8px;opacity:0.3;border-top:1px solid white;text-align:center;" onmouseover="this.style.opacity='0.7'" onmouseout="this.style.opacity='0.3'" onclick="goPaySchool();">寄<br/>快<br/>递</span></a>
			      </div>
	 			  <div id="payment_content" class="payment_content">
				      <span style="float:left;margin-left:45%;width:10%;height:30px;font-weight:bold;font-size:120%;text-align:center;">快递代寄</span>
				      <div style="float:left;margin-left:8%;width:80%;height:470px;">
				          <table border="1"  width="100%" height="460px" style="border-collapse:collapse;border:1px dashed #1077CC">
						        <tr height="45px">
						           <td width="15%" style="font-size:80%;font-weight:bold;">名称</td>          
						           <td width="40%" style="font-size:80%;font-weight:bold;">操作</td>
						           <td width="45%" style="font-size:80%;font-weight:bold;">备注</td>
						        </tr> 
						        <tr height="45px">
						           <td width="15%" style="font-size:80%;">快递公司</td>          
						           <td width="40%" style="font-size:80%;">
						               <select id="company" onchange="getAllPriceSend()">
						                   <option value="0">--快递公司--</option>
						                   <option value="2">顺丰快递</option>
						                   <option value="2">京东快递</option>
						                   <option value="1">韵达快递</option>
						                   <option value="1">圆通快递</option>
						                   <option value="1">汇通快递</option>
						                   <option value="1">中通快递</option>
						                   <option value="1">申通快递</option>
						               </select>
						               <select>
						                   <option>--区域--</option>
						                   <option>北区</option>
						                   <option>南区</option>
						                   <option>东区</option>
						               </select>
						           </td>
						           <td width="45%" style="font-size:80%;"></td>
						        </tr> 
						        <tr height="75px">
						           <td width="15%" style="font-size:80%;">寄件信息</td>          
						           <td width="40%" style="font-size:80%;">
						               <span style="float:left;width:100%;height:25px;background:gray;opacity:0.7;">姓名: <input type="text" value="请输入寄件人姓名"  maxlength="10" style="float:right;width:80%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onclick="javascript:this.value='';"></span>
						               <span style="float:left;width:100%;height:25px;background:gray;opacity:0.7;">联系电话:<input type="text" value="请输入寄件人联系电话"  maxlength="11" style="float:right;width:80%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onclick="javascript:this.value='';"/></span>
						               <span style="float:left;width:100%;height:25px;background:gray;opacity:0.7;">地址:<input type="text" value="请输入寄件地址"  maxlength="10" style="float:right;width:80%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onclick="javascript:this.value='';"/></span>
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">姓名 联系电话 寄件地址</td>
						        </tr> 
						        <tr height="105px">
						           <td width="15%" style="font-size:80%;">收件信息</td>          
						           <td width="40%" style="font-size:80%;">
						               <span style="float:left;width:100%;height:25px;">
						                   <span style="float:left;width:20%;height:25px;background:gray;opacity:0.7;">省份:</span>
						                   <span style="float:left;width:80%;height:25px;background:gray;opacity:0.7;">
						                       <select id="province" onchange="getAllPriceSend()">
								                   <option value="0" selected="selected">--请选择--</option>
								                   <option value="15">北京</option>
								                   <option value="15">天津</option>
								                   <option value="15">河北</option>
								                   <option value="15">山西</option>
								                   <option value="20">内蒙古</option>
								                   <option value="15">辽宁</option>
								                   <option value="15">吉林</option>
								                   <option value="15">黑龙江</option>
								                   <option value="10">上海</option>
								                   <option value="10">江苏</option>
								                   <option value="10">浙江</option>
								                   <option value="10">安徽</option>
								                   <option value="10">福建</option>
								                   <option value="5">江西</option>
								                   <option value="1">山东</option>
								                   <option value="10">河南</option>
								                   <option value="10">湖北</option>
								                   <option value="10">湖南</option>
								                   <option value="10">广东</option>
								                   <option value="10">广西</option>
								                   <option value="15">海南</option>
								                   <option value="20">重庆</option>
								                   <option value="20">四川</option>
								                   <option value="15">贵州</option>
								                   <option value="20">云南</option>
								                   <option value="20">西藏</option>
								                   <option value="15">陕西</option>
								                   <option value="15">甘肃</option>
								                   <option value="20">青海</option>
								                   <option value="20">宁夏</option>
								                   <option value="20">新疆</option>    
						                       </select>
						                   </span> 
						               </span>
						               <span>
							               <span style="float:left;width:100%;height:25px;background:gray;opacity:0.7;">姓名: <input type="text" value="请输入收件人姓名" autocomplete="off" maxlength="10" style="float:right;width:80%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onclick="javascript:this.value='';"></span>
							               <span style="float:left;width:100%;height:25px;background:gray;opacity:0.7;">联系电话:<input type="text" value="请输入收件人联系电话" autocomplete="off" maxlength="11" style="float:right;width:80%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onclick="javascript:this.value='';"></span>
							               <span style="float:left;width:100%;height:25px;background:gray;opacity:0.7;">地址:<input type="text" value="请输入收件地址" autocomplete="off" maxlength="10" style="float:right;width:80%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onclick="javascript:this.value='';"></span>
						               </span>
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">姓名 联系电话 收件地址</td>
						        </tr> 
						        <tr height="45px">
						           <td width="15%" style="font-size:80%;">快递重量</td>          
						           <td width="40%" style="font-size:80%;">
						               <select id="servicePrice" onchange="getAllPriceSend()">
						                   <option value="2" selected = "selected">1kg</option>
						                   <option value="3">5kg</option>
						                   <option value="5">10kg</option>
						               </select>
						               <span style="float:right;color:gray;">默认为1kg,实际以快递重量为准</span>
						               <span style="float:right;color:red;font-size:140%;">*</span>
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">1kg内2元，超过所选范围补差价</td>
						        </tr> 
						        <tr height="45px">
						           <td width="15%" style="font-size:80%;">备注</td>          
						           <td width="40%" style="font-size:80%;">
						               <input type="text" value="备注您的建议"  maxlength="50" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onclick="javascript:this.value='';">
						           </td>
						           <td width="45%" style="font-size:80%;"></td>
						        </tr> 
						        <tr height="45px">
						           <td width="15%" style="font-size:80%;">金额</td>          
						           <td width="40%" style="font-size:80%;">
						               <span id="allPrice" style="float:left;height:50px;font-size:130%;text-align:left;line-height:50px;font-weight:600;color:red;">0.00</span>
						               <span style="float:left;margin-left:5%;height:50px;text-align:left;line-height:50px;">(含服务费<font id="servicePriceSpan" style="color:red;">￥0.00</font>)</span>
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">若价格与重量不符，需要补差价</td>
						        </tr> 
						        <tr height="45px">
						           <td colspan="3" style="font-size:80%;">
						               <a href="javascript:void(0);" style="text-decoration:none;"><span style="float:left;margin-left:20%;width:60%;height:50px;background:#1077CC;border-radius:5px;color:white;text-align:center;line-height:50px;font-size:150%;" onmouseover="this.style.background='#0C5799'" onmouseout="this.style.background='#1077CC'">去&nbsp支&nbsp付</span></a>
						           </td>          
						        </tr> 
		                  </table>
				      </div>
				  </div> 
                 <%
              }else if("5"==target){
                 //房屋租赁
                 %>
                     <script type="text/javascript">
	                     var select5 = document.getElementById('select5');
	                     select5.style.background='white';
				    	 select5.style.color='#1077CC';
	                 </script>
					      <span style="float:left;margin-left:45%;width:10%;height:30px;font-weight:bold;font-size:120%;text-align:center;">房屋租赁</span>
					      <div style="float:left;margin-left:2%;width:98%;background:yellow;">
                              <div style="float:left;width:100%;height:38px;background:white;border-bottom:2px solid #1077CC">
                                  <a href="#"><span style="float:left;text-align:center;line-height:40px;font-size:120%;width:100px;height:100%;background:#1077CC;color:white;">整&nbsp&nbsp租</span></a>
                                  <a href="#"><span style="float:left;text-align:center;line-height:40px;font-size:120%;width:100px;height:100%;background:#1077CC;color:white;">单&nbsp&nbsp租</span></a>
                                  <span style="float:left;text-align:center;line-height:40px;width:200px;height:100%;background:pink;">价格:<input type="text" maxlength="5" style="width:40px;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)"/>-<input type="text" maxlength="5" style="width:40px;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)"/></span>
                              </div>
<!-- 					          <table border="1"  width="100%" height="460px" style="border-collapse:collapse;border:1px dashed #1077CC">
							        <tr height="50px">
							           <td width="15%" style="font-size:80%;font-weight:bold;">名称</td>          
							           <td width="40%" style="font-size:80%;font-weight:bold;">操作</td>
							           <td width="45%" style="font-size:80%;font-weight:bold;">备注</td>
							        </tr> 
							        <tr height="70px">
							           <td width="15%" style="font-size:80%;">待办内容</td>          
							           <td width="40%" style="font-size:80%;">
							               <textarea rows="3" cols="35" style="resize:none;" >
							               </textarea>
							           </td>
							           <td width="45%" style="font-size:80%;text-align:center;">根据您需要服务的内容，客服会进行估价，<br/>如果价格合适，稍后主动联系您。<br/><font style="color:red;">请说明办事时间，地点等</font></td>
							        </tr> 
							        <tr height="30px">
							           <td width="15%" style="font-size:80%;">姓名</td>          
							           <td width="40%" style="font-size:80%;">
							               <input type="text" value="请输入姓名"  maxlength="10" style="width:100%;border:0px;height:100%;font-size:102%;color:#A0A0A0;" onclick="javascript:if(this.value=='请输入姓名'){this.value='';}this.style.color='black'" onblur="javascript:if(this.value==''){this.value='请输入姓名';this.style.color='gray';}">
							           </td>
							           <td width="45%" style="font-size:80%;text-align:center;"></td>
							        </tr> 
							        <tr height="30px">
							           <td width="15%" style="font-size:80%;">联系电话</td>          
							           <td width="40%" style="font-size:80%;">
							               <input type="text" value="请输入联系电话"  maxlength="11" style="width:100%;border:0px;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onclick="javascript:if(this.value=='请输入联系电话'){this.value='';}this.style.color='black'" onblur="javascript:if(this.value==''){this.value='请输入联系电话';this.style.color='gray';}">
							           </td>
							           <td width="45%" style="font-size:80%;text-align:center;">便于客服联系您</td>
							        </tr> 
							        <tr height="40px">
							           <td width="15%" style="font-size:80%;">跑腿小费</td>          
							           <td width="40%" style="font-size:80%;">
							               <input id="helpDoTip" type="text" value="请输入小费金额"  maxlength="6" style="width:50%;border:0px;height:100%;font-size:102%;color:gray;" onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" onclick="javascript:if(this.value=='请输入小费金额'){this.value='';}this.style.color='red'" onblur="countAllPay();javascript:if(this.value==''){this.value='请输入小费金额';this.style.color='gray';}">
							           </td>
							           <td width="45%" style="font-size:80%;text-align:center;"></td>
							        </tr> 
							        <tr height="40px">
							           <td width="15%" style="font-size:80%;">代办费用</td>          
							           <td width="40%" style="font-size:80%;">
							               <input id="helpDoCost" type="text" value="请输入代办费用" maxlength="6" style="width:50%;border:0px;height:100%;font-size:102%;color:gray;" onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" onclick="javascript:if(this.value=='请输入代办费用'){this.value='';}this.style.color='red'" onblur="countAllPay();javascript:if(this.value==''){this.value='请输入代办费用';this.style.color='gray';}">
							           </td>
							           <td width="45%" style="font-size:80%;text-align:center;"></td>
							        </tr> 
							        <tr height="50px">
							           <td width="15%" style="font-size:80%;">备注</td>          
							           <td width="40%" style="font-size:80%;">
							               <input type="text" value="备注您的建议"  maxlength="50" style="width:100%;border:0px;height:100%;font-size:102%;color:#A0A0A0;" onclick="javascript:this.value='';">
							           </td>
							           <td width="45%" style="font-size:80%;"></td>
							        </tr> 
							        <tr height="50px">
							           <td width="15%" style="font-size:80%;">总额</td>          
							           <td width="40%" style="font-size:80%;">
							               <span id="helpDoAllCost" style="float:left;height:50px;font-size:130%;text-align:left;line-height:50px;font-weight:600;color:red;">0.00</span>
							           </td>
							           <td width="45%" style="font-size:80%;text-align:center;">含服务费和代办费用</td>
							        </tr> 
							        <tr height="50px">
							           <td colspan="3" style="font-size:80%;">
							               <a href="javascript:void(0);" style="text-decoration:none;"><span style="float:left;margin-left:20%;width:60%;height:50px;background:#1077CC;border-radius:5px;color:white;text-align:center;line-height:50px;font-size:150%;" onmouseover="this.style.background='#0C5799'" onmouseout="this.style.background='#1077CC'">提&nbsp&nbsp交</span></a>
							           </td>          
							        </tr> 
			                  </table> -->
					      </div>
                 <%
              }else if("6"==target){
              %>
                  <script type="text/javascript">
	                     var select6 = document.getElementById('select6');
	                     select6.style.background='white';
				    	 select6.style.color='#1077CC';
	              </script>
                  
                  <div class="contain">
                      <table border="1"  width="100%" height="450px" style="table-layout:fixed;word-wrap:break-word;border-collapse:collapse;border:1px solid #1077CC">
			              <tr height="30px">
			                  <td style="text-align:center;" width="13%">订单编号</td>
			                  <td style="text-align:center;" width="7%">订单类型</td>
			                  <td style="text-align:center;" width="15%">下单时间</td>
			                  <td style="text-align:center;" width="15%">下单用户</td>
			                  <td style="text-align:center;" width="30%">订单内容</td>
			                  <td style="text-align:center;" width="10%">费用</td>
			                  <td style="text-align:center;" width="10%">操作</td>
			              </tr>
			              <tr>
			                  <td style="text-align:center;font-size:80%;">123456789</td>
			                  <td style="text-align:center;font-size:80%;">跑腿代办</td>
			                  <td style="text-align:center;font-size:80%;">2018-02-25 12:00:05</td>
			                  <td style="font-size:80%;">
			                      <span>账号:139425</span><br/>
			                      <span>昵称:失魂落魄</span><br/>
			                      <span>姓名:老李</span><br/>
			                      <span>电话:13648023400</span><br/>
			                  </td>
			                  <td style="font-size:80%;">
			               
			                      <span>
			                      <font style="color:#1077CC">事项(可含寄件信息):</font><br/>
			                                                          帮我到万达广场买一份肯德基，需要一个汉堡，三个甜筒，一杯可乐
			                      </span>
			                      <br/>
			                      
			                      <span>
			                      <font style="color:#1077CC">我的地址:</font><br/>
			                                                           江西省江西农业大学南区
			                      </span>
			                      <br/>
			                      
			                      <span>
			                      <font style="color:#1077CC">办事地址:</font><br/>
			                                                          南昌市青山湖区万达广场
			                      </span>
			                      <br/>
			                      
			                      <span>
			                      <font style="color:#1077CC">备注:</font>
			                                                          尽量在晚上8点前完成，谢谢!
			                      </span>
			                  </td>
			                  <td style="font-size:80%;">
			                      <font style="color:#1077CC">总额:</font><br/>180.00<br/>
			                      <font style="color:#1077CC">办事费用:</font><br/>170.00<br/>
			                      <font style="color:#1077CC">服务费:</font><br/>10.00<br/>
			                  </td>
			                  
			                  <td style="text-align:center;"><a class="aa" href="#">接单</a></td>
			              </tr>
	                  </table>
                  </div>
              <%
              }
	       %>        

	      </div>
	  </div>
	  <div class="bottom">
	      <span style="float:left;width:100%;margin-top:20px;height:20px;text-align:center;color:gray;font-size:80%;">Copyright 2018 - 2028 jim.com All Rights Reserved 京ICP证100557号 京公网安备112310102004579号 出版物经营许可证新出发京批字第直1141328号</span>
          <span style="float:left;margin-left:25%;width:50%;background:pink;height:70px;"><img src="./images/login/bottom.jpg" width="100%" height="70px"/></span>
	  </div>
	  
	  
	  
	</div>
   </center>
  </body>
</html>
