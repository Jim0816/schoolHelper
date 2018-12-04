<%@ page language="java" import="java.util.*,com.school.domain.personbeans.*;" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>生活中心-快递代领</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="<c:url value='/js/ajaxutils.js'/>"></script>
    <style type="text/css">
        a:visited {color: black;}
		a:link{	color:black;}
		a:hover {color:#1077CC;}
		a:active {color:#1077CC;} 
		
        .aa:visited {color: #1077CC;}
		.aa:link{	color:#1077CC;}
		.aa:hover {color: red;}
		.aa:active {color: red;} 

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
		
        .bg{
            width:1400px;
            background:white;
        }
        
        .top{
            float:left;
            width:100%;
            height:100px;
            background:white;
        }
        
        .center{
            float:left;
            width:100%;
            background:white;
        }
        
        .selectBar{
            float:left;
            width:100%;
            height:40px;
            background:white;
            border-bottom:2px solid #1077CC;
        }
        
        .select4{
            float:left;
            width:100px;
            height:40px;
            color:white;
            line-height:35px;
            text-align:center;
            background:#1077CC;  
        }
        
        .select1,.select2,.select3,.select5,.select6{
            float:left;
            width:100px;
            height:40px;
            color:#1077CC;
            line-height:35px;
            text-align:center;
            background:white;  
        }
        
        .reform{
            float:left;
            width:100%;
            height:30px;
            background:white;
        }
        
        .center_1{
            float:left;
            width:100%;
            background:white;
        }
        
        .center_1_left{
            float:left;
            width:7%;
            height:230px;
            background:white;
        }
        
        .center_1_left_select1,.center_1_left_select2{
            float:left;
            width:100%;
            height:40px;
            font-size:85%;
            text-align:center;
        }
        
        .center_1_right{
            float:left;
            margin-left:2%;
            width:90%;
            height:570px;
            background:white;
        }
        
        .bottom {
			float:left;
			height:70px;
			width: 100%;
		}
    </style>
    <script type="text/javascript">
        //操作结果
        window.onload = function (){
            var result='<%=request.getAttribute("result")%>';
            if(result=="null"||result=="")
				{
				}else{
				   alert(result);
		     }
        };
        //修改代领快递服务费
		function changePrice(obj){
			var weight = obj.value;
			var priceSpan = document.getElementById('DeliveryPrice');
			var serverMoney = document.getElementById('serverMoney').value;
			if(weight=='1'){
				priceSpan.innerHTML='2.00';
				document.getElementById('serverMoney').value = '2.00';
			}else if(weight=='5'){
				priceSpan.innerHTML='3.00';
				document.getElementById('serverMoney').value = '3.00';
			}else if(weight=='10'){
				priceSpan.innerHTML='5.00';
				document.getElementById('serverMoney').value = '5.00';
			}else if(weight=='20'){
				priceSpan.innerHTML='10.00';
				document.getElementById('serverMoney').value = '10.00';
			}
			
		}
		
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
		 
		//检查输入内容
		function checkContent(){
		    var company = document.getElementById('company').value;
		    var area = document.getElementById('area').value;
		    var getDeliveryCode = document.getElementById('getDeliveryCode').value;
		    var clientUserTel = document.getElementById('clientUserTel').value;
		    var clientAddress = document.getElementById('clientAddress').value;
		    
		    if(company=="0" || area=="0" || getDeliveryCode=="" || getDeliveryCode=="请输入取货号" || clientUserTel=="" || clientUserTel=="请输入联系电话" || clientAddress==""  || clientAddress=="请输入收货地址"){
		        if(company=="0" || area=="0"){
		            document.getElementById('selectTip').style.color='red';
		        }
		        if(getDeliveryCode=="" || getDeliveryCode=="请输入取货号"){
		            document.getElementById('getDeliveryCode').style.borderColor='red';
		        }
		        if(clientUserTel=="" || clientUserTel=="请输入联系电话"){
		            document.getElementById('clientUserTel').style.borderColor='red';
		        }
		         if(clientAddress=="" || clientAddress=="请输入收货地址"){
		            document.getElementById('clientAddress').style.borderColor='red';
		        }
		        return false;
		    }else{
                return true;		    
		    }    
		}
		
		function checkSubmit(){
		    if(checkUser()==true && checkContent()==true){
		        //可以提交
		        document.getElementById('deliveryContent').value='';
		        document.getElementById('clientUserName').value='';
		        document.getElementById('clientRemark').value='';
		        return true;
		    }else{
		        return false;
		    }
		}
    </script>
  </head>
  <%
       String deliveryGetFlag = UUID.randomUUID().toString();
       session.setAttribute("deliveryGetFlag", deliveryGetFlag);
       User user = (User)session.getAttribute("user");
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
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/login?pageSource=b4" style="float:left;margin-left:10px;font-size:80%;line-height:28px;text-decoration:none;">请登录</a> 
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/regist?pageSource=b4" style="float:left;margin-left:20px;font-size:80%;line-height:28px;text-decoration:none;">[免费注册]</a>
                 </c:when>
                 <c:otherwise>
                     <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=b4">
                     <span style="float:left;margin-top:5px;margin-left:30px;width:20px;height:20px;border-radius:15px;cursor:pointer;"><img src="${sessionScope.user.getUserPhoto()}" title="${sessionScope.user.getUserName()}" style="border-radius:15px;width:100%;height:100%;"/></span>
                     <font style="float:left;margin-left:5px;font-size:80%;line-height:28px;text-decoration:none;">${sessionScope.user.getUserName()}</font>
                     </a>
                     <a class="a1" href="${pageContext.request.contextPath }/person/user/exit?pageSource=b4" style="float:left;margin-left:10px;font-size:80%;line-height:27px;text-decoration:none;">注销</a>
                 </c:otherwise>
             </c:choose>
             <span id="showBar" style="float:right;width:60px;height:30px;text-align:center;margin-right:180px;cursor:default;font-size:80%;line-height:28px;color:gray;" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='visible';this.style.color='red';this.style.background='white'" onmouseout="this.style.color='gray';">网站导航</span>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/6?pageSource=b4" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">卖家中心</a>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=b4" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">个人中心</a>
        </div>
        <div class="bg" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='hidden';document.getElementById('showBar').style.background='none'">
            <div class="top">
	          <span style="float:left;width:40%;height:80px;">
	              <span style="float:left;margin-top:10px;width:12%;height:50px;"><img src="./images/life/logo.jpg" width="100%" height="60px"/></span>
	              <span style="float:left;margin-top:10px;width:85%;height:60px;">
	                  <span style="float:left;text-align:left;width:100%;height:40px;color:#1077CC;font-size:140%;line-height:50px;">校园便利网   | 生活便利中心</span>
	                  <span style="float:left;text-align:left;width:55%;height:15px;border-top:1px solid #1077CC; color:#1077CC;font-size:70%;">&nbsp&nbsp&nbspCampus network&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspLife convenience center</span>
	              </span>
	          </span>
            </div>
            
            <div class="center">
                <div class="selectBar">
                    <a title="缴费大厅" href="${pageContext.request.contextPath }/life/1"><span class="select1">缴费大厅</span></a>
                    <a title="送水中心" href="${pageContext.request.contextPath }/life/2"><span class="select2">送水中心</span></a>
                    <a title="物业报修" href="${pageContext.request.contextPath }/life/3"><span class="select3">物业报修</span></a>
                    <span class="select4">快递服务</span>
                    <a title="房屋租赁" href="${pageContext.request.contextPath }/life/5"><span class="select5">房屋租赁</span></a>
                    <a title="我要接单" href="${pageContext.request.contextPath }/life/6"><span class="select6">我要接单</span></a>
                </div>
                <div class="reform"></div>
                <div class="center_1">
                    <div class="center_1_left">
                        <span class="center_1_left_select1" style="color:#1077CC">快递代领</span>
                    </div>
                    <div class="center_1_right">
                        <div style="float:left;width:100%;height:520px;background:white;">
				          <form action="${pageContext.request.contextPath }/life/4/1" method="post" onsubmit="return checkSubmit();">
				          <table border="1"  width="100%" height="570px" style="border-collapse:collapse;border:1px solid gray">
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;font-weight:bold;">名称</td>          
						           <td width="40%" style="font-size:80%;font-weight:bold;">操作</td>
						           <td width="45%" style="font-size:80%;font-weight:bold;text-align:center;">备注</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;"><span style="float:left;">快递公司</span><span style="float:left;color:red;font-size:140%;">*</span></td>          
						           <td width="40%" style="font-size:80%;">
						               <select id="company" name="deliveryCompany" onclick="javascript:document.getElementById('selectTip').style.color='white'">
						                   <option value="0">请选择快递公司</option>
						                   <option value="顺丰快递">顺丰快递</option>
						                   <option value="京东快递">京东快递</option>
						                   <option value="韵达快递">韵达快递</option>
						                   <option value="圆通快递">圆通快递</option>
						                   <option value="汇通快递">汇通快递</option>
						                   <option value="中通快递">中通快递</option>
						                   <option value="申通快递">申通快递</option>
						               </select>
						               <select id="area" name="companyArea" onclick="javascript:document.getElementById('selectTip').style.color='white'">
						                   <option value="0">请选择地址</option>
						                   <option value="北区">北区</option>
						                   <option value="南区">南区</option>
						               </select>
						               <span id="selectTip" style="color:white;">---请完成选择</span>
						           </td>
						           <td width="45%" style="font-size:80%;"></td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;"><span style="float:left;">包裹信息</span></td>          
						           <td width="40%" style="font-size:80%;">
						               <input id="deliveryContent" name="deliveryContent" type="text" value="请输入包裹物品信息"  maxlength="50" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onclick="javascript:this.value='';this.style.color='black'">
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">选填</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;"><span style="float:left;">取货号</span><span style="float:left;color:red;font-size:140%;">*</span></td>          
						           <td width="40%" style="font-size:80%;">
						               <input id="getDeliveryCode" name="getDeliveryCode" type="text" value="请输入取货号"  maxlength="6" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onclick="javascript:this.value='';this.style.color='black';this.style.borderColor='gray';">
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">取货号仅接单者有权查看，放心填写</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;"><span style="float:left;">姓名</span></td>          
						           <td width="40%" style="font-size:80%;">
						               <input id="clientUserName" name="clientUserName" type="text" value="请输入姓名"  maxlength="10" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onclick="javascript:this.value='';this.style.color='black'">
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">建议填写，方便接单者领取</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;"><span style="float:left;">联系电话</span><span style="float:left;color:red;font-size:140%;">*</span></td>          
						           <td width="40%" style="font-size:80%;">
						               <input id="clientUserTel" name="clientUserTel" type="text" value="请输入联系电话"  maxlength="11" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onclick="javascript:this.value='';this.style.color='black';this.style.borderColor='gray';">
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">电费不足5元将自动断电</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">快递重量</td>          
						           <td width="40%" style="font-size:80%;">
						               <select name="deliveryWeight" onchange="changePrice(this)">
						                   <option value="1" selected = "selected">1kg</option>
						                   <option value="5">5kg</option>
						                   <option value="10">10kg</option>
						                   <option value="20">20kg</option>
						               </select>
						               <span style="float:right;color:gray;">默认为1kg,实际以快递重量为准</span>
						               <span style="float:right;color:red;font-size:140%;">*</span>
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">1kg内2元，超过所选范围双方线下协商</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;"><span style="float:left;">代收地址</span><span style="float:left;color:red;font-size:140%;">*</span></td>          
						           <td width="40%" style="font-size:80%;">
						               <input id="clientAddress" name="clientAddress" type="text" value="请输入收货地址" maxlength="100" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onclick="javascript:this.value='';this.style.color='black';this.style.borderColor='gray';">
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">详细地址</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">备注</td>          
						           <td width="40%" style="font-size:80%;">
						               <input id="clientRemark" name="clientRemark" type="text" value="备注您的建议"  maxlength="50" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onclick="javascript:this.value='';this.style.color='black'">
						           </td>
						           <td width="45%" style="font-size:80%;"></td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">服务费</td>          
						           <td width="40%" style="font-size:80%;">
						               <span id="DeliveryPrice" style="float:left;height:50px;font-size:130%;text-align:left;line-height:50px;font-weight:600;color:red;">2.00</span>
						               <input id="serverMoney" name="serverMoney" type="hidden" value="2.00"/>
						           </td>
						           <td width="45%" style="font-size:80%;text-align:center;">若价格与重量不符，需要补差价</td>
						        </tr> 
						        <tr height="50px">
						           <td colspan="3" style="font-size:80%;">
						               <input name="deliveryGetFlag" type="hidden" value="${deliveryGetFlag}"/>
						               <input name="clientUserId" type="hidden" value="${user.getUserId()}"/>
						               <input type="submit" value="去&nbsp支&nbsp付" style="float:left;margin-left:20%;width:60%;height:50px;background:#1077CC;border-radius:5px;color:white;text-align:center;line-height:50px;font-size:150%;cursor:pointer;" onmouseover="this.style.background='#0C5799'" onmouseout="this.style.background='#1077CC'"/>
						           </td>          
						        </tr> 
		                   </table>
		                   </form>
				       </div>
                    </div>
                </div>
            </div>
            
            <div class="bottom">
			    <span style="float:left;width:100%;margin-top:20px;height:20px;text-align:center;color:gray;font-size:80%;">Copyright 2018 - 2028 jim.com All Rights Reserved 京ICP证100557号 京公网安备112310102004579号 出版物经营许可证新出发京批字第直1141328号</span>
		        <span style="float:left;margin-left:25%;width:50%;background:pink;height:70px;"><img src="./images/life/bottom.jpg" width="100%" height="70px"/></span>
			</div>
	  
        </div>
    </center>
      
  </body>
</html>
