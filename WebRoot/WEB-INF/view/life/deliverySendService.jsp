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
    
    <title>生活中心-快递代寄</title>
    
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
            background:pink;
        }
        
        .bottom {
			float:left;
			height:70px;
			width: 100%;
		}
    </style>
    <script type="text/javascript">
     
    </script>
  </head>
  <%
       String deliverySendFlag = UUID.randomUUID().toString();
       session.setAttribute("deliverySendFlag",deliverySendFlag);
       User user = (User)session.getAttribute("user");
  %>
  <body>
    <center>
        <div class="bg">
            <div class="top">
	          <span style="float:left;width:40%;height:80px;">
	              <span style="float:left;margin-top:10px;width:12%;height:50px;"><img src="./images/life/logo.jpg" width="100%" height="60px"/></span>
	              <span style="float:left;margin-top:10px;width:85%;height:60px;">
	                  <span style="float:left;text-align:left;width:100%;height:40px;color:#1077CC;font-size:140%;line-height:50px;">校园便利网   | 生活便利中心</span>
	                  <span style="float:left;text-align:left;width:55%;height:15px;border-top:1px solid #1077CC; color:#1077CC;font-size:70%;">&nbsp&nbsp&nbspCampus network&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspLife convenience center</span>
	              </span>
	          </span>
          
	          <span style="float:right;">
	             <a class="aa" href="${pageContext.request.contextPath }/market/First" style="float:right;text-decoration:none;font-size:90%;">商城首页</a>
	             <font style="float:right;color:gray;margin-left:10px;margin-right:10px;">|</font>
	             <%
	                 if(user==null){
	             %>
	                  <a class="aa" href="${pageContext.request.contextPath }/person/user/regist?pageSource=b41" style="float:right;text-decoration:none;font-size:90%;">[免费注册]</a>
	                  <font style="float:right;color:gray;margin-left:10px;margin-right:10px;">|</font>
	                  <a class="aa" href="${pageContext.request.contextPath }/person/user/login?pageSource=b41" style="float:right;text-decoration:none;font-size:90%;">登录</a>
	             <%
	             }else{
	             %>
	                   <a class="aa" href="${pageContext.request.contextPath }/person/user/exit?pageSource=b41" style="float:right;text-decoration:none;font-size:90%;">[注销]</a>
	                   <font style="float:right;color:gray;margin-left:10px;margin-right:10px;">|</font>
	                   <a class="aa" href="#" style="float:right;text-decoration:none;font-size:90%;"><%=user.getUserName()%></a>
	             <%
	             }
	             %>
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
                        <span class="center_1_left_select1"><a title="快递代领" href="${pageContext.request.contextPath }/life/4" style="text-decoration:none;">快递代领</a></span>
                        <span class="center_1_left_select2" style="color:#1077CC;">快递代寄</span>
                    </div>
                    <div class="center_1_right">
                       <div style="float:left;width:100%;height:570px;background:white;">
				          <form action="${pageContext.request.contextPath }/life/41/1" method="post" onsubmit="return checkSubmit();">
				          <table border="1"  width="100%" height="550px" style="border-collapse:collapse;border:1px solid gray">
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;font-weight:bold;">名称</td>          
						           <td width="40%" style="font-size:80%;font-weight:bold;">操作</td>
						           <td width="45%" style="font-size:80%;font-weight:bold;text-align:center;">备注</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;"><span style="float:left;">快递公司</span><span style="float:left;color:red;font-size:140%;">*</span></td>          
						           <td width="40%" style="font-size:80%;">
						               <select id="company" name="deliveryCompany">
						                   <option value="0">--快递公司--</option>
						                   <option value="顺丰快递">顺丰快递</option>
						                   <option value="京东快递">京东快递</option>
						                   <option value="韵达快递">韵达快递</option>
						                   <option value="圆通快递">圆通快递</option>
						                   <option value="汇通快递">汇通快递</option>
						                   <option value="中通快递">中通快递</option>
						                   <option value="申通快递">申通快递</option>
						               </select>
						               <span id="selectTip" style="color:white;">---请完成选择</span>
						           </td>
						           <td width="45%" style="font-size:80%;"></td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;"><span style="float:left;">包裹信息</span></td>          
						           <td width="40%" style="font-size:80%;">
						               <input name="deliveryContent" type="text" value="请输入包裹物品信息"  maxlength="50" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onclick="javascript:this.value='';this.style.color='black'">
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
						               <input name="clientUserName" type="text" value="请输入姓名"  maxlength="10" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onclick="javascript:this.value='';this.style.color='black'">
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
						               <input name="clientRemark" type="text" value="备注您的建议"  maxlength="50" style="width:100%;border-bottom:1px solid black;height:100%;font-size:102%;color:#A0A0A0;" onclick="javascript:this.value='';this.style.color='black'">
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
						               <input name="deliveryGetFlag" type="hidden" value="${deliverySendFlag}"/>
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
