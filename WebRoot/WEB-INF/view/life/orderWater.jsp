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
    
    <title>生活中心-预订送水</title>
    
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
            height:500px;
            background:white;
        }
        
        .selectBar{
            float:left;
            width:100%;
            height:40px;
            background:white;
            border-bottom:2px solid #1077CC;
        }
        
        .select2{
            float:left;
            width:100px;
            height:40px;
            color:white;
            line-height:35px;
            text-align:center;
            background:#1077CC;  
        }
        
        .select1,.select3,.select4,.select5,.select6{
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
        
        .bottom {
			float:left;
			height:70px;
			width: 100%;
		}
    </style>
    <script type="text/javascript">
	    window.onload=function(){
				getUnit();
		};
        function getUnit()
		{   
			var arr = new  Array();
			//南区共30栋
			arr[0]="1栋,2栋,3栋,4栋,5栋,6栋,7栋,8栋,9栋,10栋,11栋,12栋,13栋,14栋,15栋,16栋,17栋,18栋,19栋,20栋,21栋,22栋,23栋,24栋,25栋,26栋,27栋,28栋,29栋,30栋";
			//北区共14栋
			arr[1]="1栋,2栋,3栋,4栋,5栋,6栋,7栋,8栋,9栋,10栋,11栋,12栋,13栋,14栋";
		    var location = document.getElementById("location");
		    var unit = document.getElementById("unit");
		    var index = location.selectedIndex;
		    var unitArr = arr[index].split(",");   
		    
		    unit.length = 0;
		    //将楼栋数组中的值填充到楼栋下拉框中
		    for(var i=0;i<unitArr.length;i++)
		    {
		    	unit[i]=new Option(unitArr[i],i+1);
		    }
		}
        //通过所在区域确定配送部门
		function changeDistributor(){
			var location = document.getElementById("location").value;
		    var unit = document.getElementById("unit").value;
		    if(location==0){
		    	//南区
		    	if(unit>17){
		    		//南区一部配送
		    		document.getElementById("distributor").innerHTML='南区一部';
		    	}else{
		    		//南区二部配送
		    		document.getElementById("distributor").innerHTML='南区二部';
		    	}
		    }else{
		    	//北区一部
		    	document.getElementById("distributor").innerHTML='北区一部';
		    }
		}
		
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
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/login?pageSource=b2" style="float:left;margin-left:10px;font-size:80%;line-height:28px;text-decoration:none;">请登录</a> 
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/regist?pageSource=b2" style="float:left;margin-left:20px;font-size:80%;line-height:28px;text-decoration:none;">[免费注册]</a>
                 </c:when>
                 <c:otherwise>
                     <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=b2">
                     <span style="float:left;margin-top:5px;margin-left:30px;width:20px;height:20px;border-radius:15px;cursor:pointer;"><img src="${sessionScope.user.getUserPhoto()}" title="${sessionScope.user.getUserName()}" style="border-radius:15px;width:100%;height:100%;"/></span>
                     <font style="float:left;margin-left:5px;font-size:80%;line-height:28px;text-decoration:none;">${sessionScope.user.getUserName()}</font>
                     </a>
                     <a class="a1" href="${pageContext.request.contextPath }/person/user/exit?pageSource=b2" style="float:left;margin-left:10px;font-size:80%;line-height:27px;text-decoration:none;">注销</a>
                 </c:otherwise>
             </c:choose>
             <span id="showBar" style="float:right;width:60px;height:30px;text-align:center;margin-right:180px;cursor:default;font-size:80%;line-height:28px;color:gray;" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='visible';this.style.color='red';this.style.background='white'" onmouseout="this.style.color='gray';">网站导航</span>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/6?pageSource=b2" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">卖家中心</a>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=b2" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">个人中心</a>
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
                    <span class="select2">送水中心</span>
                    <a title="物业报修" href="${pageContext.request.contextPath }/life/3"><span class="select3">物业报修</span></a>
                    <a title="快递服务" href="${pageContext.request.contextPath }/life/4"><span class="select4">快递服务</span></a>
                    <a title="房屋租赁" href="${pageContext.request.contextPath }/life/5"><span class="select5">房屋租赁</span></a>
                    <a title="我要接单" href="${pageContext.request.contextPath }/life/6"><span class="select6">我要接单</span></a>
                </div>
                <div class="reform"></div>
                <div class="center_1">
				    <div style="float:left;margin-left:10%;width:80%;height:370px;">
				          <table border="1"  width="100%" height="360px" style="border-collapse:collapse;border:1px solid gray">
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
            </div>
            
            <div class="bottom">
			    <span style="float:left;width:100%;margin-top:20px;height:20px;text-align:center;color:gray;font-size:80%;">Copyright 2018 - 2028 jim.com All Rights Reserved 京ICP证100557号 京公网安备112310102004579号 出版物经营许可证新出发京批字第直1141328号</span>
		        <span style="float:left;margin-left:25%;width:50%;background:pink;height:70px;"><img src="./images/life/bottom.jpg" width="100%" height="70px"/></span>
			</div>
	  
        </div>
    </center>
      
  </body>
</html>
