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
    
    <title>生活中心-电费厅</title>
    
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
        
        .select1{
            float:left;
            width:100px;
            height:40px;
            color:white;
            line-height:35px;
            text-align:center;
            background:#1077CC;  
        }
        
        .select2,.select3,.select4,.select5,.select6{
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
      function changePayMent(obj){
          if(obj.value==''){
              document.getElementById('showPayMent').innerHTML='';
          }else{
              document.getElementById('showPayMent').innerHTML=obj.value+'.00';
          }
          
      }
      
      function queryElectronic(obj){
			var location = document.getElementById('Location').value;
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
			var location = document.getElementById('Location').value;
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
		
		function getUnit()
		{  
			var arr = new  Array();
			//南区共30栋
			arr[0]="1栋,2栋,3栋,4栋,5栋,6栋,7栋,8栋,9栋,10栋,11栋,12栋,13栋,14栋,15栋,16栋,17栋,18栋,19栋,20栋,21栋,22栋,23栋,24栋,25栋,26栋,27栋,28栋,29栋,30栋";
			//北区共14栋
			arr[1]="1栋,2栋,3栋,4栋,5栋,6栋,7栋,8栋,9栋,10栋,11栋,12栋,13栋,14栋";
		    var location = document.getElementById("Location");
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
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/login?pageSource=b1" style="float:left;margin-left:10px;font-size:80%;line-height:28px;text-decoration:none;">请登录</a> 
		             <a class="a1" href="${pageContext.request.contextPath }/person/user/regist?pageSource=b1" style="float:left;margin-left:20px;font-size:80%;line-height:28px;text-decoration:none;">[免费注册]</a>
                 </c:when>
                 <c:otherwise>
                     <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=b1">
                     <span style="float:left;margin-top:5px;margin-left:30px;width:20px;height:20px;border-radius:15px;cursor:pointer;"><img src="${sessionScope.user.getUserPhoto()}" title="${sessionScope.user.getUserName()}" style="border-radius:15px;width:100%;height:100%;"/></span>
                     <font style="float:left;margin-left:5px;font-size:80%;line-height:28px;text-decoration:none;">${sessionScope.user.getUserName()}</font>
                     </a>
                     <a class="a1" href="${pageContext.request.contextPath }/person/user/exit?pageSource=b1" style="float:left;margin-left:10px;font-size:80%;line-height:27px;text-decoration:none;">注销</a>
                 </c:otherwise>
             </c:choose>
             <span id="showBar" style="float:right;width:60px;height:30px;text-align:center;margin-right:180px;cursor:default;font-size:80%;line-height:28px;color:gray;" onmouseover="javascript:document.getElementById('nevigationBar').style.visibility='visible';this.style.color='red';this.style.background='white'" onmouseout="this.style.color='gray';">网站导航</span>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/6?pageSource=b1" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">卖家中心</a>
             <a class="a1" href="${pageContext.request.contextPath }/person/1/1?pageSource=b1" style="float:right;margin-right:10px;font-size:80%;line-height:28px;text-decoration:none;">个人中心</a>
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
                    <span class="select1">缴费大厅</span>
                    <a title="送水中心" href="${pageContext.request.contextPath }/life/2"><span class="select2">送水中心</span></a>
                    <a title="物业报修" href="${pageContext.request.contextPath }/life/3"><span class="select3">物业报修</span></a>
                    <a title="快递服务" href="${pageContext.request.contextPath }/life/4"><span class="select4">快递服务</span></a>
                    <a title="房屋租赁" href="${pageContext.request.contextPath }/life/5"><span class="select5">房屋租赁</span></a>
                    <a title="我要接单" href="${pageContext.request.contextPath }/life/6"><span class="select6">我要接单</span></a>
                </div>
                <div class="reform"></div>
                <div class="center_1">
			          <div style="float:left;margin-left:10%;width:80%;height:400px;background:white;">
			              <table border="1"  width="100%" height="360px" style="border-collapse:collapse;border:1px solid gray">
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;font-weight:bold;">名称</td>          
						           <td width="40%" style="font-size:80%;font-weight:bold;">操作</td>
						           <td width="45%" style="font-size:80%;font-weight:bold;text-align:center;">备注</td>
						        </tr> 
						        <tr height="50px">
						           <td width="15%" style="font-size:80%;">所在楼栋</td>          
						           <td width="40%" style="font-size:80%;">
						               <select id="Location" onclick="getUnit()">
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
