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
    
    <title>生活中心-我要接单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="<c:url value='/js/ajaxutils.js'/>"></script>
    <style type="text/css">
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
            height:700px;
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
        
        .select6{
            float:left;
            width:100px;
            height:40px;
            color:white;
            line-height:35px;
            text-align:center;
            background:#1077CC;  
        }
        
        .select1,.select2,.select3,.select4,.select5{
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
			width: 100%;
        }
        
        .order{
            float:left;
            margin-top:20px;
			margin-left:20%;
            width:60%;
            height:190px;
			background:#F9F9FA;
        }
        
        .bottom {
			float:left;
			height:70px;
			width: 100%;
		}
    </style>
    <script type="text/javascript">
        function changeBtn(obj){
            if(checkUser()==true){
                //登录后才能点击查看联系电话
                if(obj.innerHTML=='查看联系方式'){
                    //利用ajax到后台检查该接单者是否被授权
                    var getOrderUserId = document.getElementById('userId').value;
                    showTel(getOrderUserId,obj.id); 
                }else{
                    //点击接单按钮
                    var r=confirm("接单后您的基本信息会告知客户，以便保障客户权益，是否接单?");
                    if(r==true){
                        //接单,把接单信息生成
                    var getOrderUserId = document.getElementById('userId').value;
                    var getDeliveryId = obj.id;    
		            ajax(
							{
							    method:"POST",
								url:"http://localhost:8080/schoolHelper/life/6/2",
								type:"text",
								params:"getOrderUserId="+getOrderUserId+"&getDeliveryId="+getDeliveryId,
								callback:function(data) {
									if(data=="0"){
									     //接单失败
									     alert("接单失败！");
									}else{
									     //接单成功,显示取货码
									     alert("接单成功！");
									     var codeId = "code"+getDeliveryId;
									     document.getElementById(codeId).style.color='black';
									     location.reload();
									}
								}
							}
						);
                    }else{
                        //不接单
                    }
                }
            }
           
        }
        
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
	    
	    //传入参数为接单者id，显示button标签id
	    function showTel(getOrderUserId,btnId){
	        ajax(
					{
					    method:"POST",
						url:"http://localhost:8080/schoolHelper/life/6/1",
						type:"text",
						params:"getOrderUserId="+getOrderUserId+"&getDeliveryId="+btnId,
						callback:function(data) {
							if(data=="0"){
							     //不合法不显示,并且提示用户还为进行授权操作
							     alert("您还为进行授权，暂时不能接单！");
							}else if(data=="-1"){
							    //不合法不显示,并且提示用户当前授权状态为失败
							    alert("抱歉！您的授权状态未通过或在审核当中，暂时不能接单。");
							    
							}else{
							    //合法显示联系电话,并且修改按钮
							    //显示电话号码的span的id值
							    spanId = "tel"+btnId;
							    document.getElementById(spanId).innerHTML=data;
							    document.getElementById(btnId).innerHTML='接单';
							    alert("为了确保订单有效,建议先联系该用户,否则白跑一趟没有报酬的。");
							}
						}
					}
				);
	    }
    </script>
  </head>
  <%
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
                    <a title="快递服务" href="${pageContext.request.contextPath }/life/4"><span class="select4">快递服务</span></a>
                    <a title="房屋租赁" href="${pageContext.request.contextPath }/life/5"><span class="select5">房屋租赁</span></a>
                    <span class="select6">我要接单</span>
                </div>
                <div class="reform">
                    <form action="${pageContext.request.contextPath }/life/6/3" method="get" onsubmit="return checkUser();">
                        <input type="submit" value="接单授权" style="float:right;width:100px;height:100%;cursor:pointer;color:white;background:#1077CC;" onmouseover="this.style.background='#0c5799'" onmouseout="this.style.background='#1077CC'">
                    </form>
                </div>
                <div class="center_1">
                    <input type="hidden" id="userId" value="${user.getUserId()}"/>
                    <c:choose>
                        <c:when test="${sessionScope.deliveryOrderPage.getResultList().size()>0}">
                            <c:forEach items="${sessionScope.deliveryOrderPage.getResultList()}" var="item" varStatus="order">
			                    <div class="order">
			                        <div style="float:left;width:80%;height:40px;background:#F9F9FA;text-align:left;font-size:120%;font-weight:bold;color:black;">
			                            ${item.get('deliveryCompany')}    |   ${item.get('companyArea')}
			                        </div>
			                        <div style="float:left;width:20%;height:40px;background:#F9F9FA;">
			                            <span style="float:left;line-height:30px;font-size:120%;font-weight:600;color:black;">服务费</span>
			                            <span style="float:left;height:100%;font-size:150%;font-weight:bold;color:red;">${item.get('serverMoney')}</span>
				                        <span style="float:left;line-height:35px;height:100%;font-size:90%;font-weight:bold;">元</span>
			                        </div>
			                        <div style="float:left;width:70%;background:#F9F9FA;">
			                            <div style="float:left;color:gray;font-size:85%;width:100%;height:30px;">
				                            <span style="float:left;">物品类型:</span>
				                            <span style="float:left;margin-left:10px;">${item.get('deliveryContent')}</span>
				                            <span style="float:left;margin-left:20px;">快递重量:</span>
				                            <span style="float:left;margin-left:10px;">${item.get('deliveryWeight')}kg以内</span>
			                            </div>
				                        <div style="float:left;color:gray;font-size:85%;width:100%;height:30px;">
				                            <span style="float:left;">收件地址:</span>
				                            <span style="float:left;margin-left:10px;">${item.get('clientAddress')}</span>
				                        </div>
			                            <div style="float:left;color:gray;font-size:85%;width:100%;height:30px;">
				                            <span style="float:left;">订单备注:</span>
				                            <span style="float:left;margin-left:10px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${item.get('clientRemark')}</span>
				                        </div>
				                        <div style="float:left;color:gray;font-size:85%;width:100%;height:30px;">
				                            <span style="float:left;">联系方式:</span>
				                            <span style="float:left;margin-left:10px;">${item.get('clientUserName')}</span>
				                            <span id="tel${item.get('getDeliveryId')}" style="float:left;margin-left:10px;">***</span>
				                        </div>
				                        <div style="float:left;color:gray;font-size:85%;width:100%;height:30px;">
				                            <span style="float:left;">取货码:</span>
				                            <span id="code${item.get('getDeliveryId')}" style="float:left;margin-left:20px;color:#F9F9FA;">${item.get('getDeliveryCode')}</span>
				                        </div>
			                        </div>
			                        <div style="float:left;width:30%;background:#F9F9FA;">
			                             <button id="${item.get('getDeliveryId')}" style="float:left;margin-left:40%;margin-top:10px;cursor:pointer;width:100px;height:30px;background:#1077CC;color:white;" onmouseover="this.style.background='#0c5799'" onmouseout="this.style.background='#1077CC'" onclick="changeBtn(this)">查看联系方式</button>
			                        </div>
			                    </div>
		                    </c:forEach>
		                    <div style="float:left;margin-top:20px;margin-left:20%;width:60%;height:40px;">
		                        <font style="float:left;">当前${sessionScope.deliveryOrderPage.getCurrentPage()}/${sessionScope.deliveryOrderPage.getTotalPages()}</font>
	                           <c:choose>
					               <c:when test="${sessionScope.deliveryOrderPage.getCurrentPage()>1}">
					                   <a class="aa" href="${pageContext.request.contextPath }/life/6?currentPage=${sessionScope.deliveryOrderPage.getCurrentPage()-1}" title="上一页">上一页</a>
					               </c:when>
					               <c:otherwise>
					                  <a class="aa" href="javascript:void(0)" title="上一页">上一页</a>
					               </c:otherwise>
					           </c:choose>
					           
					           <c:choose>
					               <c:when test="${sessionScope.deliveryOrderPage.getTotalPages()==sessionScope.deliveryOrderPage.getCurrentPage() || sessionScope.deliveryOrderPage.getTotalPages()==0}">
					                   <a class="aa" href="javascript:void(0)" title="下一页">下一页</a>
					               </c:when>
					               <c:otherwise>
					                   <a class="aa" href="${pageContext.request.contextPath }/life/6?currentPage=${sessionScope.deliveryOrderPage.getCurrentPage()+1}" title="下一页">下一页</a>
					               </c:otherwise>
					           </c:choose>
					           <font style="float:right;">共计  ${sessionScope.deliveryOrderPage.getTotalRows()} 条记录</font>
		                    </div>
		                    
                        </c:when>
                        <c:otherwise>
                            <div style="float:left;margin-top:150px;width:100%;height:250px;background:white;">亲，当前没有订单可接</div>
                        </c:otherwise>
                    </c:choose>
                    
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
